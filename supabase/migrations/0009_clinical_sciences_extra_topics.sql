-- Clinical sciences was split into 5 sub-topics in 0008_mrcp1_subtopics.sql,
-- before mrcp1-clinical-sciences-batch1.sql (written earlier, never loaded)
-- was discovered and loaded. That file's own structure needs 7 sub-areas,
-- not 5, so two more are added here to match: cell/molecular/membrane
-- biology and clinical anatomy.

insert into topics (id, exam, specialty, name, slug) values
  ('118c5a76-48cd-4261-870e-593e831e4065', 'mrcp1', 'Clinical sciences', 'Cell/molecular & membrane biology', 'cell-molecular-membrane-biology'),
  ('9960f01c-fffd-4517-9d94-f51e306862bc', 'mrcp1', 'Clinical sciences', 'Clinical anatomy', 'clinical-anatomy');
