-- "Learn" reference chapters — one per curriculum condition/presentation,
-- linked to the same topics used by the question bank. Mirrors the
-- questions table's draft/published workflow and admin-only write access.
--
-- sections/pearls/refs are stored as jsonb rather than child tables (unlike
-- question_options/question_discriminators) because chapter content is a
-- single author's document, not discrete gradeable rows — there's no
-- reveal-after-answering access pattern to protect here, so one row per
-- chapter keeps reads simple.

create table chapters (
  id uuid primary key default gen_random_uuid(),
  exam exam_type not null,    -- denormalised from topics, mirrors questions.exam
  topic_id uuid not null references topics (id) on delete restrict,
  status question_status not null default 'draft',
  title text not null,
  slug text not null,
  dek text not null,          -- one-line standfirst shown under the title
  tag text not null default 'Core exam topic', -- small badge, e.g. "Uncommon", "GUCH"
  -- sections: [{ "heading": "Overview", "body_html": "<p>...</p>" }, ...]
  sections jsonb not null default '[]',
  pearls text[] not null default '{}',
  -- refs: [{ "label": "...", "source": "...", "url": "https://..." }, ...]
  refs jsonb not null default '[]',
  related_presentations text[] not null default '{}',
  sort_order smallint not null default 0,
  created_by uuid references profiles (id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (topic_id, slug)
);

create index chapters_topic_id_idx on chapters (topic_id);
create index chapters_exam_idx on chapters (exam);
create index chapters_status_idx on chapters (status);

alter table chapters enable row level security;

create policy "chapters_select_published" on chapters
  for select using (
    (status = 'published' and auth.role() = 'authenticated') or is_admin()
  );
create policy "chapters_write_admin" on chapters
  for all using (is_admin()) with check (is_admin());
