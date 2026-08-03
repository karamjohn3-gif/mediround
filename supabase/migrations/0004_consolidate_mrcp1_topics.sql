-- Collapse MRCP1 topics down to exactly one per blueprint specialty.
--
-- Two problems this fixes:
-- 1. "Clinical sciences" was split into 7 separate topics (one per named
--    sub-area). The blueprint counts it as a single specialty with one
--    question total (25) — model it as one topic, same as everything else.
-- 2. The 5 topics carried over from the original UKMLA-mirrored seed data
--    (Cardiology, Respiratory medicine, Endocrinology..., Neurology,
--    Gastroenterology and Hepatology) had specific sub-topic names ("Acute
--    coronary syndromes", "Diabetic emergencies", etc.) instead of the
--    specialty name, unlike every other MRCP1 topic. Rename them in place
--    (not delete + recreate) so the questions already attached to them
--    keep their topic_id and aren't orphaned.

begin;

-- 1. Consolidate Clinical sciences: keep the first sub-topic's row (no
--    questions reference any of them yet — confirmed before writing this),
--    rename it to the specialty itself, and drop the other six.
update topics
set name = 'Clinical sciences', slug = 'clinical-sciences'
where id = '30000000-0000-0000-0000-000000000017';

delete from topics
where id in (
  '30000000-0000-0000-0000-000000000018',
  '30000000-0000-0000-0000-000000000019',
  '30000000-0000-0000-0000-000000000020',
  '30000000-0000-0000-0000-000000000021',
  '30000000-0000-0000-0000-000000000022',
  '30000000-0000-0000-0000-000000000023'
);

-- 2. Rename the 5 legacy topics to match their specialty name. `id` is
--    unchanged, so this preserves the FK from any attached questions.
update topics set name = 'Cardiology', slug = 'cardiology'
  where id = '30000000-0000-0000-0000-000000000001';
update topics set name = 'Respiratory medicine', slug = 'respiratory-medicine'
  where id = '30000000-0000-0000-0000-000000000002';
update topics set name = 'Endocrinology, diabetes and metabolic medicine', slug = 'endocrinology-diabetes-metabolic-medicine'
  where id = '30000000-0000-0000-0000-000000000003';
update topics set name = 'Neurology', slug = 'neurology'
  where id = '30000000-0000-0000-0000-000000000004';
update topics set name = 'Gastroenterology and Hepatology', slug = 'gastroenterology-and-hepatology'
  where id = '30000000-0000-0000-0000-000000000005';

commit;
