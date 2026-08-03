-- Build out the full MRCP Part 1 topic structure to match the official
-- exam blueprint (specialty breakdown + question counts), supplied by the
-- user. This only creates/relabels topics — no questions yet.

begin;

-- ---------------------------------------------------------------------------
-- 1. Fix the 5 existing MRCP1 topics' specialty labels to match the
--    blueprint's exact wording, so dashboard grouping and future topic
--    additions line up consistently. Topic names/slugs are unchanged —
--    only `specialty` moves.
-- ---------------------------------------------------------------------------

update topics set specialty = 'Respiratory medicine'
  where id = '30000000-0000-0000-0000-000000000002'; -- was 'Respiratory'
update topics set specialty = 'Endocrinology, diabetes and metabolic medicine'
  where id = '30000000-0000-0000-0000-000000000003'; -- was 'Endocrinology'
update topics set specialty = 'Gastroenterology and Hepatology'
  where id = '30000000-0000-0000-0000-000000000005'; -- was 'Gastroenterology & Hepatology'
-- 001 (Cardiology) and 004 (Neurology) already match the blueprint.

-- ---------------------------------------------------------------------------
-- 2. Add the remaining single-topic specialties (one topic per specialty
--    for now — admin can split any of these into more specific topics
--    later via /admin/topics, same as Cardiology/Respiratory/etc. above).
-- ---------------------------------------------------------------------------

insert into topics (id, exam, specialty, name, slug) values
  ('30000000-0000-0000-0000-000000000006', 'mrcp1', 'Clinical Pharmacology and Therapeutics', 'Clinical Pharmacology and Therapeutics', 'clinical-pharmacology-therapeutics'),
  ('30000000-0000-0000-0000-000000000007', 'mrcp1', 'Dermatology', 'Dermatology', 'dermatology'),
  ('30000000-0000-0000-0000-000000000008', 'mrcp1', 'Geriatric medicine', 'Geriatric medicine', 'geriatric-medicine'),
  ('30000000-0000-0000-0000-000000000009', 'mrcp1', 'Haematology', 'Haematology', 'haematology'),
  ('30000000-0000-0000-0000-000000000010', 'mrcp1', 'Infectious diseases', 'Infectious diseases', 'infectious-diseases'),
  ('30000000-0000-0000-0000-000000000011', 'mrcp1', 'Oncology', 'Oncology', 'oncology'),
  ('30000000-0000-0000-0000-000000000012', 'mrcp1', 'Medical ophthalmology', 'Medical ophthalmology', 'medical-ophthalmology'),
  ('30000000-0000-0000-0000-000000000013', 'mrcp1', 'Palliative medicine and end of life care', 'Palliative medicine and end of life care', 'palliative-medicine-eolc'),
  ('30000000-0000-0000-0000-000000000014', 'mrcp1', 'Psychiatry', 'Psychiatry', 'psychiatry'),
  ('30000000-0000-0000-0000-000000000015', 'mrcp1', 'Renal medicine', 'Renal medicine', 'renal-medicine'),
  ('30000000-0000-0000-0000-000000000016', 'mrcp1', 'Rheumatology', 'Rheumatology', 'rheumatology')
on conflict (exam, slug) do nothing;

-- ---------------------------------------------------------------------------
-- 3. "Clinical sciences" (25 questions in the blueprint) is the one
--    specialty the source table itself breaks into named sub-areas —
--    model those as 7 separate topics under the same specialty.
-- ---------------------------------------------------------------------------

insert into topics (id, exam, specialty, name, slug) values
  ('30000000-0000-0000-0000-000000000017', 'mrcp1', 'Clinical sciences', 'Cell, molecular and membrane biology', 'cell-molecular-membrane-biology'),
  ('30000000-0000-0000-0000-000000000018', 'mrcp1', 'Clinical sciences', 'Clinical anatomy', 'clinical-anatomy'),
  ('30000000-0000-0000-0000-000000000019', 'mrcp1', 'Clinical sciences', 'Clinical biochemistry and metabolism', 'clinical-biochemistry-metabolism'),
  ('30000000-0000-0000-0000-000000000020', 'mrcp1', 'Clinical sciences', 'Clinical physiology', 'clinical-physiology'),
  ('30000000-0000-0000-0000-000000000021', 'mrcp1', 'Clinical sciences', 'Genetics', 'genetics'),
  ('30000000-0000-0000-0000-000000000022', 'mrcp1', 'Clinical sciences', 'Immunology', 'immunology'),
  ('30000000-0000-0000-0000-000000000023', 'mrcp1', 'Clinical sciences', 'Statistics, epidemiology and evidence-based medicine', 'statistics-epidemiology-ebm')
on conflict (exam, slug) do nothing;

commit;
