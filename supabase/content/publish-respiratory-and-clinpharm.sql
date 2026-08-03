-- Flips the already-loaded Respiratory medicine (14) and Clinical
-- Pharmacology and Therapeutics (15) draft questions to published, per
-- explicit instruction — no further review requested for these batches.

update questions set status = 'published'
where topic_id = '30000000-0000-0000-0000-000000000002' and status = 'draft'; -- Respiratory medicine

update questions set status = 'published'
where topic_id = '30000000-0000-0000-0000-000000000006' and status = 'draft'; -- Clinical Pharmacology and Therapeutics
