-- Make stating a confidence level optional rather than required before
-- submitting an answer. Existing rows are untouched — this only relaxes
-- the constraint and the RPC signature so future attempts can have
-- confidence = null. Dashboard calibration stats already group by
-- confidence value, so null-confidence attempts simply don't appear in any
-- confidence bucket there (they still count toward overall accuracy).

alter table attempts alter column confidence drop not null;

create or replace function submit_attempt(
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
