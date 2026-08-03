-- MediRound schema
-- Run this in the Supabase SQL editor, or via `supabase db push`, on a fresh project.

create extension if not exists pgcrypto;

-- ---------------------------------------------------------------------------
-- Enums
-- ---------------------------------------------------------------------------

create type exam_type as enum ('ukmla', 'plab', 'mrcp1');
create type user_role as enum ('student', 'admin');
create type question_status as enum ('draft', 'published');
create type question_difficulty as enum ('foundation', 'core', 'advanced');
create type confidence_level as enum ('guessing', 'fairly_sure', 'certain');
create type error_type as enum (
  'knowledge_gap',      -- "Didn't know the fact"
  'reasoning_error',    -- "Knew it but reasoned wrong"
  'misread_stem',       -- "Misread the stem"
  'careless_slip'       -- "Careless slip"
);
create type subscription_status as enum (
  'none', 'trialing', 'active', 'past_due', 'canceled'
);

-- ---------------------------------------------------------------------------
-- profiles — one row per auth.users row, created automatically on signup
-- ---------------------------------------------------------------------------

create table profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  email text not null,
  display_name text,
  role user_role not null default 'student',
  stripe_customer_id text unique,
  stripe_subscription_id text unique,
  subscription_status subscription_status not null default 'none',
  subscription_current_period_end timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index profiles_stripe_customer_id_idx on profiles (stripe_customer_id);

-- Auto-create a profile row whenever a new auth user is created.
create function handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.profiles (id, email, display_name)
  values (
    new.id,
    new.email,
    coalesce(new.raw_user_meta_data ->> 'full_name', new.raw_user_meta_data ->> 'name')
  );
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function handle_new_user();

-- ---------------------------------------------------------------------------
-- topics — grouped by specialty, scoped to one exam
-- ---------------------------------------------------------------------------

create table topics (
  id uuid primary key default gen_random_uuid(),
  exam exam_type not null,
  specialty text not null,      -- e.g. "Cardiology" — used for dashboard grouping
  name text not null,           -- e.g. "Acute coronary syndromes"
  slug text not null,
  created_at timestamptz not null default now(),
  unique (exam, slug)
);

create index topics_exam_idx on topics (exam);

-- ---------------------------------------------------------------------------
-- questions
-- ---------------------------------------------------------------------------

create table questions (
  id uuid primary key default gen_random_uuid(),
  exam exam_type not null,
  topic_id uuid not null references topics (id) on delete restrict,
  status question_status not null default 'draft',
  difficulty question_difficulty not null default 'core',
  stem text not null,           -- patient vignette + observations
  lead_in text not null,        -- the actual question asked, e.g. "What is the most likely diagnosis?"
  tags text[] not null default '{}',
  created_by uuid references profiles (id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index questions_exam_topic_idx on questions (exam, topic_id);
create index questions_status_idx on questions (status);

-- 5 options (A–E) per question, exactly one marked correct.
create table question_options (
  id uuid primary key default gen_random_uuid(),
  question_id uuid not null references questions (id) on delete cascade,
  label char(1) not null check (label in ('A', 'B', 'C', 'D', 'E')),
  option_text text not null,
  is_correct boolean not null default false,
  rationale text not null,      -- why correct, or "ruled out because..." for wrong options
  sort_order smallint not null,
  unique (question_id, label)
);

create index question_options_question_id_idx on question_options (question_id);

-- Exactly one correct option per question.
create unique index question_options_one_correct_idx
  on question_options (question_id)
  where is_correct;

-- 2-3 discriminators per question: the key features that separate the
-- correct diagnosis from its mimics (the wrong options collectively).
create table question_discriminators (
  id uuid primary key default gen_random_uuid(),
  question_id uuid not null references questions (id) on delete cascade,
  discriminator_text text not null,
  sort_order smallint not null
);

create index question_discriminators_question_id_idx on question_discriminators (question_id);

-- ---------------------------------------------------------------------------
-- attempts — one row per answered question
-- ---------------------------------------------------------------------------

create table attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references profiles (id) on delete cascade,
  question_id uuid not null references questions (id) on delete cascade,
  chosen_option_id uuid not null references question_options (id),
  confidence confidence_level, -- nullable: stating a confidence level is optional
  is_correct boolean not null,
  error_type error_type,        -- only set when is_correct = false
  time_taken_seconds integer,
  created_at timestamptz not null default now(),
  constraint error_type_only_when_wrong check (
    (is_correct = false) or (error_type is null)
  )
);

create index attempts_user_id_idx on attempts (user_id, created_at desc);
create index attempts_question_id_idx on attempts (question_id);
create index attempts_user_question_idx on attempts (user_id, question_id);

-- ---------------------------------------------------------------------------
-- fsrs_state — one row per (user, question), mirrors ts-fsrs `Card`
-- ---------------------------------------------------------------------------

create table fsrs_state (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references profiles (id) on delete cascade,
  question_id uuid not null references questions (id) on delete cascade,
  due timestamptz not null default now(),
  stability double precision not null default 0,
  difficulty double precision not null default 0,
  elapsed_days integer not null default 0,
  scheduled_days integer not null default 0,
  learning_steps integer not null default 0, -- ts-fsrs Card.learning_steps (FSRS v6)
  reps integer not null default 0,
  lapses integer not null default 0,
  state smallint not null default 0, -- ts-fsrs State enum: New=0 Learning=1 Review=2 Relearning=3
  last_review timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id, question_id)
);

create index fsrs_state_due_idx on fsrs_state (user_id, due);

-- ---------------------------------------------------------------------------
-- updated_at maintenance
-- ---------------------------------------------------------------------------

create function set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create trigger profiles_set_updated_at before update on profiles
  for each row execute function set_updated_at();
create trigger questions_set_updated_at before update on questions
  for each row execute function set_updated_at();
create trigger fsrs_state_set_updated_at before update on fsrs_state
  for each row execute function set_updated_at();

-- ---------------------------------------------------------------------------
-- Row Level Security
-- ---------------------------------------------------------------------------

alter table profiles enable row level security;
alter table topics enable row level security;
alter table questions enable row level security;
alter table question_options enable row level security;
alter table question_discriminators enable row level security;
alter table attempts enable row level security;
alter table fsrs_state enable row level security;

-- Helper: is the current user an admin? (security definer to dodge RLS
-- recursion when checking profiles.role from within a profiles policy)
create function is_admin()
returns boolean
language sql
security definer
set search_path = public
stable
as $$
  select exists (
    select 1 from profiles where id = auth.uid() and role = 'admin'
  );
$$;

-- profiles: users manage their own row; admins can read all (author tool
-- doesn't need this today, but it's cheap and useful for support later).
create policy "profiles_select_own_or_admin" on profiles
  for select using (auth.uid() = id or is_admin());
create policy "profiles_update_own" on profiles
  for update using (auth.uid() = id);

-- topics: readable by anyone signed in (used to build the exam/topic
-- picker); only admins can author them.
create policy "topics_select_authenticated" on topics
  for select using (auth.role() = 'authenticated');
create policy "topics_write_admin" on topics
  for all using (is_admin()) with check (is_admin());

-- questions: published questions readable by any signed-in user; admins
-- can see and write everything including drafts. Subscription gating
-- (free-attempt limit) is enforced in the app layer, not RLS, so the
-- seeded demo questions stay usable without Stripe configured.
create policy "questions_select_published" on questions
  for select using (
    (status = 'published' and auth.role() = 'authenticated') or is_admin()
  );
create policy "questions_write_admin" on questions
  for all using (is_admin()) with check (is_admin());

-- question_options / question_discriminators hold the correct answer and
-- the "ruled out because..." rationale — the whole point of the practice
-- flow is that these are hidden until the user commits an answer. RLS is
-- row-level, not "hidden until you've answered", so the base tables are
-- readable by admins only; everyone else goes through:
--   1. question_options_public (a column-limited view, no is_correct/
--      rationale) to render the question before answering, and
--   2. the submit_attempt() RPC below, which grades the answer and reveals
--      rationale + discriminators server-side, in the same transaction
--      that records the attempt.
-- This closes the gap where a signed-in user could otherwise call the
-- Supabase REST API directly and read every answer key up front.
create policy "question_options_admin_only" on question_options
  for select using (is_admin());
create policy "question_options_write_admin" on question_options
  for all using (is_admin()) with check (is_admin());

create policy "question_discriminators_admin_only" on question_discriminators
  for select using (is_admin());
create policy "question_discriminators_write_admin" on question_discriminators
  for all using (is_admin()) with check (is_admin());

-- Column-limited view used to render questions before they're answered.
-- Owned by the migration-running role (postgres), so — per standard Postgres
-- view semantics — it queries the base table with the *owner's* privileges,
-- not the caller's, meaning it can read past the admin-only policy above
-- while only ever exposing these five safe columns.
create view question_options_public
with (security_invoker = false) as
select qo.id, qo.question_id, qo.label, qo.option_text, qo.sort_order
from question_options qo
join questions q on q.id = qo.question_id
where q.status = 'published';

grant select on question_options_public to authenticated;

-- attempts: users see only their own attempts; admins can read all for
-- future analytics. Rows are inserted exclusively via submit_attempt();
-- the only direct write allowed here is recording the post-hoc error type
-- for an attempt the user already owns.
create policy "attempts_select_own_or_admin" on attempts
  for select using (auth.uid() = user_id or is_admin());
create policy "attempts_update_own_error_type" on attempts
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- ---------------------------------------------------------------------------
-- submit_attempt — grade an answer, record it, and reveal the answer key.
-- This is the ONLY way (besides being an admin) to read is_correct/
-- rationale/discriminators for a question, and it always writes an attempts
-- row in the same transaction, so grading and recording can't drift apart.
-- Also enforces the free-attempt limit for non-subscribers server-side, so
-- it can't be bypassed by calling the API directly.
-- ---------------------------------------------------------------------------

create function submit_attempt(
  p_question_id uuid,
  p_chosen_option_id uuid,
  p_confidence confidence_level default null,
  p_time_taken_seconds integer default null
)
returns table (
  attempt_id uuid,
  is_correct boolean,
  correct_option_id uuid,
  options jsonb,
  discriminators jsonb
)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user_id uuid := auth.uid();
  v_correct_option_id uuid;
  v_is_correct boolean;
  v_attempt_id uuid;
  v_question_status question_status;
  v_sub_status subscription_status;
  v_attempt_count integer;
  v_free_limit constant integer := 5; -- keep in sync with FREE_ATTEMPT_LIMIT in src/lib/constants.ts
begin
  if v_user_id is null then
    raise exception 'Not authenticated';
  end if;

  select status into v_question_status from questions where id = p_question_id;
  if v_question_status is distinct from 'published' then
    raise exception 'Question not available';
  end if;

  select subscription_status into v_sub_status from profiles where id = v_user_id;
  if v_sub_status is distinct from 'active' then
    select count(*) into v_attempt_count from attempts where user_id = v_user_id;
    if v_attempt_count >= v_free_limit then
      raise exception 'FREE_LIMIT_REACHED';
    end if;
  end if;

  if not exists (
    select 1 from question_options where id = p_chosen_option_id and question_id = p_question_id
  ) then
    raise exception 'Invalid option for this question';
  end if;

  -- `o.` qualifiers are load-bearing here: RETURNS TABLE(..., is_correct
  -- boolean, ...) implicitly declares `is_correct` as a plpgsql variable in
  -- this function's scope, which silently shadows the column of the same
  -- name in unqualified SQL — `is_correct = true` would compare against
  -- that (always-NULL-here) variable instead of question_options.is_correct,
  -- so the WHERE clause would never match and this lookup would always
  -- return NULL.
  select o.id into v_correct_option_id
  from question_options o
  where o.question_id = p_question_id and o.is_correct = true;

  if v_correct_option_id is null then
    raise exception 'Question has no correct option configured';
  end if;

  v_is_correct := (p_chosen_option_id = v_correct_option_id);

  insert into attempts (user_id, question_id, chosen_option_id, confidence, is_correct, time_taken_seconds)
  values (v_user_id, p_question_id, p_chosen_option_id, p_confidence, v_is_correct, p_time_taken_seconds)
  returning id into v_attempt_id;

  return query
  select
    v_attempt_id,
    v_is_correct,
    v_correct_option_id,
    (
      select jsonb_agg(jsonb_build_object(
        'id', o.id, 'label', o.label, 'option_text', o.option_text,
        'is_correct', o.is_correct, 'rationale', o.rationale, 'sort_order', o.sort_order
      ) order by o.sort_order)
      from question_options o where o.question_id = p_question_id
    ),
    (
      select jsonb_agg(jsonb_build_object(
        'id', d.id, 'discriminator_text', d.discriminator_text, 'sort_order', d.sort_order
      ) order by d.sort_order)
      from question_discriminators d where d.question_id = p_question_id
    );
end;
$$;

grant execute on function submit_attempt(uuid, uuid, confidence_level, integer) to authenticated;

-- fsrs_state: users manage only their own scheduling rows.
create policy "fsrs_state_select_own" on fsrs_state
  for select using (auth.uid() = user_id);
create policy "fsrs_state_insert_own" on fsrs_state
  for insert with check (auth.uid() = user_id);
create policy "fsrs_state_update_own" on fsrs_state
  for update using (auth.uid() = user_id);
