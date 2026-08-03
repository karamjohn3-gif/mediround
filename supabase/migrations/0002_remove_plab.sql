-- Remove PLAB support entirely.
--
-- Postgres has no `ALTER TYPE ... DROP VALUE`, so removing an enum value
-- means: delete every row using it, retype the columns to a new enum that
-- doesn't have it, then drop the old type and rename the new one into its
-- place. Run this after 0001_init.sql (and before seed.sql, on a fresh
-- project — seed.sql no longer inserts PLAB rows).

begin;

-- 1. The two PLAB-labelled seed questions (DKA, subarachnoid haemorrhage)
--    are solid general-medicine content, not PLAB-specific — reassign them
--    to UKMLA instead of deleting, which also doubles UKMLA's question
--    count for free.
update questions
set exam = 'ukmla', topic_id = '10000000-0000-0000-0000-000000000003' -- UKMLA Endocrinology
where id = 'a0000000-0000-0000-0000-000000000003'; -- DKA

update questions
set exam = 'ukmla', topic_id = '10000000-0000-0000-0000-000000000004' -- UKMLA Neurology
where id = 'a0000000-0000-0000-0000-000000000004'; -- Subarachnoid haemorrhage

-- Now safe to remove the PLAB topics — nothing references them anymore.
delete from topics where exam = 'plab';

-- 2. Rebuild exam_type without 'plab'.
create type exam_type_new as enum ('ukmla', 'mrcp1');

alter table topics
  alter column exam type exam_type_new using exam::text::exam_type_new;
alter table questions
  alter column exam type exam_type_new using exam::text::exam_type_new;

drop type exam_type;
alter type exam_type_new rename to exam_type;

commit;
