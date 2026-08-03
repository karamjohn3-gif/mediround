-- Seed data for MediRound.
-- Run after 0001_init.sql. Safe to re-run (guarded by ON CONFLICT DO NOTHING
-- on natural keys where practical).
--
-- NOTE ON CLINICAL CONTENT: these 5 questions are illustrative textbook-style
-- teaching cases written to exercise the app end-to-end. They are NOT mapped
-- to the current UKMLA/MRCP curricula or blueprint weighting, and have not
-- been reviewed by a clinician or medical educator. Have a doctor/med-ed
-- specialist review and expand this bank before using it to actually prepare
-- students for a real exam.

-- ---------------------------------------------------------------------------
-- Topics — UKMLA (5 starter topics) and MRCP Part 1 (full blueprint: exactly
-- one topic per specialty in the official MRCP1 exam breakdown, including
-- "Clinical sciences" as a single topic rather than split by sub-area).
-- ---------------------------------------------------------------------------

insert into topics (id, exam, specialty, name, slug) values
  ('10000000-0000-0000-0000-000000000001', 'ukmla', 'Cardiology', 'Acute coronary syndromes', 'acs'),
  ('10000000-0000-0000-0000-000000000002', 'ukmla', 'Respiratory', 'Venous thromboembolism & acute breathlessness', 'vte-breathlessness'),
  ('10000000-0000-0000-0000-000000000003', 'ukmla', 'Endocrinology', 'Diabetic emergencies', 'diabetic-emergencies'),
  ('10000000-0000-0000-0000-000000000004', 'ukmla', 'Neurology', 'Headache & neurological emergencies', 'headache-neuro-emergencies'),
  ('10000000-0000-0000-0000-000000000005', 'ukmla', 'Gastroenterology & Hepatology', 'Jaundice & biliary disease', 'jaundice-biliary'),

  ('30000000-0000-0000-0000-000000000001', 'mrcp1', 'Cardiology', 'Cardiology', 'cardiology'),
  ('30000000-0000-0000-0000-000000000002', 'mrcp1', 'Respiratory medicine', 'Respiratory medicine', 'respiratory-medicine'),
  ('30000000-0000-0000-0000-000000000003', 'mrcp1', 'Endocrinology, diabetes and metabolic medicine', 'Endocrinology, diabetes and metabolic medicine', 'endocrinology-diabetes-metabolic-medicine'),
  ('30000000-0000-0000-0000-000000000004', 'mrcp1', 'Neurology', 'Neurology', 'neurology'),
  ('30000000-0000-0000-0000-000000000005', 'mrcp1', 'Gastroenterology and Hepatology', 'Gastroenterology and Hepatology', 'gastroenterology-and-hepatology'),

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
  ('30000000-0000-0000-0000-000000000016', 'mrcp1', 'Rheumatology', 'Rheumatology', 'rheumatology'),
  ('30000000-0000-0000-0000-000000000017', 'mrcp1', 'Clinical sciences', 'Clinical sciences', 'clinical-sciences')
on conflict (exam, slug) do nothing;

-- ---------------------------------------------------------------------------
-- Question 1 — UKMLA / Cardiology — Acute inferior STEMI
-- ---------------------------------------------------------------------------

insert into questions (id, exam, topic_id, status, difficulty, stem, lead_in, tags) values (
  'a0000000-0000-0000-0000-000000000001',
  'ukmla',
  '10000000-0000-0000-0000-000000000001',
  'published',
  'foundation',
  $stem$A 58-year-old man presents to the emergency department with 45 minutes of central crushing chest pain radiating to his left arm and jaw, associated with sweating and nausea. He has type 2 diabetes, hypertension, and a 30 pack-year smoking history.

Observations: HR 96 bpm, BP 148/92 mmHg, RR 18/min, SpO2 96% on air, temperature 36.8°C.

ECG: ST elevation in leads II, III and aVF, with reciprocal ST depression in I and aVL.$stem$,
  'What is the most likely diagnosis?',
  array['ECG','ACS','chest pain']
) on conflict (id) do nothing;

insert into question_options (question_id, label, option_text, is_correct, rationale, sort_order) values
  ('a0000000-0000-0000-0000-000000000001', 'A', 'Inferior ST-elevation myocardial infarction', true,
   $r$Correct. Central crushing chest pain with classic cardiac risk factors (diabetes, hypertension, smoking) plus ST elevation in the inferior leads (II, III, aVF) with reciprocal depression in I and aVL is diagnostic of an acute inferior STEMI.$r$, 1),
  ('a0000000-0000-0000-0000-000000000001', 'B', 'Unstable angina', false,
   $r$Ruled out because unstable angina does not produce ST elevation — by definition it causes ischaemic changes (e.g. ST depression, T-wave inversion) without the myocardial necrosis that produces territorial ST elevation.$r$, 2),
  ('a0000000-0000-0000-0000-000000000001', 'C', 'Acute pericarditis', false,
   $r$Ruled out because pericarditis typically causes widespread, saddle-shaped ST elevation with PR depression, and pain that is pleuritic and eases on sitting forward — not present here.$r$, 3),
  ('a0000000-0000-0000-0000-000000000001', 'D', 'Pulmonary embolism', false,
   $r$Ruled out because PE causes pleuritic pain with hypoxia and sinus tachycardia or right heart strain (e.g. S1Q3T3) on ECG, not territorial ST elevation with reciprocal changes.$r$, 4),
  ('a0000000-0000-0000-0000-000000000001', 'E', 'Aortic dissection', false,
   $r$Ruled out because dissection classically causes tearing pain radiating to the back with a pulse deficit or unequal limb blood pressures; the ECG is usually normal or non-specific, not a clean territorial STEMI pattern.$r$, 5)
on conflict (question_id, label) do nothing;

insert into question_discriminators (question_id, discriminator_text, sort_order) values
  ('a0000000-0000-0000-0000-000000000001', 'Territorial ST elevation (II, III, aVF) with reciprocal ST depression (I, aVL) is diagnostic of acute MI, not ischaemia or pericarditis.', 1),
  ('a0000000-0000-0000-0000-000000000001', 'Absence of pleuritic, positional pain and a normal PR segment argue against pericarditis.', 2),
  ('a0000000-0000-0000-0000-000000000001', 'Multiple atherosclerotic risk factors (diabetes, smoking, hypertension) favour plaque rupture over an aortic or embolic cause.', 3);

-- ---------------------------------------------------------------------------
-- Question 2 — UKMLA / Respiratory — Post-operative pulmonary embolism
-- ---------------------------------------------------------------------------

insert into questions (id, exam, topic_id, status, difficulty, stem, lead_in, tags) values (
  'a0000000-0000-0000-0000-000000000002',
  'ukmla',
  '10000000-0000-0000-0000-000000000002',
  'published',
  'core',
  $stem$A 67-year-old woman is on day 3 after an elective total hip replacement. While mobilising with physiotherapy she develops sudden-onset breathlessness and right-sided pleuritic chest pain. She has no cough or fever.

Observations: HR 112 bpm, BP 118/76 mmHg, RR 24/min, SpO2 91% on air, temperature 37.1°C. The operated leg's calf is mildly swollen and tender compared with the other side.$stem$,
  'What is the most likely diagnosis?',
  array['VTE','breathlessness','post-operative']
) on conflict (id) do nothing;

insert into question_options (question_id, label, option_text, is_correct, rationale, sort_order) values
  ('a0000000-0000-0000-0000-000000000002', 'A', 'Pulmonary embolism', true,
   $r$Correct. Sudden pleuritic chest pain with hypoxia and tachycardia, in a patient with a major VTE risk factor (major orthopaedic surgery within 2 weeks) plus a swollen calf suggesting a DVT source, is classic for PE.$r$, 1),
  ('a0000000-0000-0000-0000-000000000002', 'B', 'Pneumothorax', false,
   $r$Ruled out because pneumothorax causes sudden dyspnoea and pleuritic pain but with reduced breath sounds and hyper-resonance on the affected side, and has no link to recent immobilisation or calf swelling.$r$, 2),
  ('a0000000-0000-0000-0000-000000000002', 'C', 'Hospital-acquired pneumonia', false,
   $r$Ruled out because pneumonia typically develops over hours to days with fever, productive cough and focal crackles or consolidation, not this sudden pleuritic onset with no fever or cough.$r$, 3),
  ('a0000000-0000-0000-0000-000000000002', 'D', 'Anaphylaxis', false,
   $r$Ruled out because anaphylaxis presents with rapid-onset urticaria or angioedema, wheeze and hypotension, usually after an allergen exposure such as a new drug — not isolated pleuritic pain and calf swelling.$r$, 4),
  ('a0000000-0000-0000-0000-000000000002', 'E', 'Acute asthma exacerbation', false,
   $r$Ruled out because there is no history of asthma or wheeze, and the calf swelling points away from a primary airway problem entirely.$r$, 5)
on conflict (question_id, label) do nothing;

insert into question_discriminators (question_id, discriminator_text, sort_order) values
  ('a0000000-0000-0000-0000-000000000002', 'Recent major surgery with reduced mobility is the strongest VTE risk factor in this vignette.', 1),
  ('a0000000-0000-0000-0000-000000000002', 'Unilateral calf swelling suggesting a DVT source is the key clue pointing to PE over a primary respiratory cause.', 2),
  ('a0000000-0000-0000-0000-000000000002', 'Sudden — not gradual — onset without fever or cough argues against an infective cause such as pneumonia.', 3);

-- ---------------------------------------------------------------------------
-- Question 3 — UKMLA / Endocrinology — Diabetic ketoacidosis
-- ---------------------------------------------------------------------------

insert into questions (id, exam, topic_id, status, difficulty, stem, lead_in, tags) values (
  'a0000000-0000-0000-0000-000000000003',
  'ukmla',
  '10000000-0000-0000-0000-000000000003',
  'published',
  'core',
  $stem$A 22-year-old woman with type 1 diabetes is brought to the emergency department drowsy, with a 2-day history of vomiting and abdominal pain. Her family say she has not been able to keep her insulin down.

Observations: HR 118 bpm, BP 100/62 mmHg, RR 32/min with deep, sighing breaths, SpO2 98% on air, temperature 37.0°C.

Investigations: capillary blood glucose 28 mmol/L, capillary ketones 5.8 mmol/L, venous pH 7.08, bicarbonate 8 mmol/L.$stem$,
  'What is the most likely diagnosis?',
  array['diabetes','acid-base','endocrine emergency']
) on conflict (id) do nothing;

insert into question_options (question_id, label, option_text, is_correct, rationale, sort_order) values
  ('a0000000-0000-0000-0000-000000000003', 'A', 'Diabetic ketoacidosis', true,
   $r$Correct. Known type 1 diabetes with hyperglycaemia, significant ketonaemia, and a metabolic acidosis (pH < 7.3, bicarbonate < 15) with compensatory Kussmaul breathing is diagnostic of DKA.$r$, 1),
  ('a0000000-0000-0000-0000-000000000003', 'B', 'Hyperosmolar hyperglycaemic state', false,
   $r$Ruled out because HHS occurs in type 2 diabetes with very high glucose but minimal ketosis and a near-normal pH — this patient has type 1 diabetes with marked ketoacidosis, which is inconsistent with HHS.$r$, 2),
  ('a0000000-0000-0000-0000-000000000003', 'C', 'Alcoholic ketoacidosis', false,
   $r$Ruled out because alcoholic ketoacidosis follows heavy alcohol intake with poor oral intake and typically presents with normal or low glucose, not the markedly elevated glucose (28 mmol/L) seen here.$r$, 3),
  ('a0000000-0000-0000-0000-000000000003', 'D', 'Sepsis with lactic acidosis', false,
   $r$Ruled out because sepsis can cause an acidosis but would not explain the markedly raised ketones and glucose together, and there is no fever or clear infective source in the history.$r$, 4),
  ('a0000000-0000-0000-0000-000000000003', 'E', 'Addisonian (adrenal) crisis', false,
   $r$Ruled out because an Addisonian crisis classically causes hypoglycaemia and hyperkalaemia with hypotension, not the hyperglycaemia and heavy ketonaemia seen here.$r$, 5)
on conflict (question_id, label) do nothing;

insert into question_discriminators (question_id, discriminator_text, sort_order) values
  ('a0000000-0000-0000-0000-000000000003', 'The triad of hyperglycaemia + ketonaemia + acidosis defines DKA and separates it from HHS, where ketones are low.', 1),
  ('a0000000-0000-0000-0000-000000000003', 'Kussmaul breathing (deep, sighing respirations) is a clinical clue to significant respiratory compensation for a metabolic acidosis.', 2),
  ('a0000000-0000-0000-0000-000000000003', 'A background of type 1 (not type 2) diabetes strongly favours DKA, since HHS occurs almost exclusively in type 2 diabetes.', 3);

-- ---------------------------------------------------------------------------
-- Question 4 — UKMLA / Neurology — Subarachnoid haemorrhage
-- ---------------------------------------------------------------------------

insert into questions (id, exam, topic_id, status, difficulty, stem, lead_in, tags) values (
  'a0000000-0000-0000-0000-000000000004',
  'ukmla',
  '10000000-0000-0000-0000-000000000004',
  'published',
  'core',
  $stem$A 46-year-old woman develops a sudden, severe headache — the "worst of her life" — reaching maximum intensity within seconds while weightlifting at the gym. It is associated with vomiting and neck stiffness. She has no fever.

Observations: HR 88 bpm, BP 162/94 mmHg, RR 16/min, SpO2 98% on air, temperature 36.9°C, GCS 14 (mildly drowsy).$stem$,
  'What is the most likely diagnosis?',
  array['headache','neurology emergency']
) on conflict (id) do nothing;

insert into question_options (question_id, label, option_text, is_correct, rationale, sort_order) values
  ('a0000000-0000-0000-0000-000000000004', 'A', 'Subarachnoid haemorrhage', true,
   $r$Correct. A "thunderclap" headache reaching maximal intensity within seconds — especially triggered by exertion — plus meningism and vomiting is the classic presentation of SAH until proven otherwise.$r$, 1),
  ('a0000000-0000-0000-0000-000000000004', 'B', 'Migraine with aura', false,
   $r$Ruled out because migraine headaches typically build gradually over minutes to hours rather than peaking within seconds, and do not cause true meningism.$r$, 2),
  ('a0000000-0000-0000-0000-000000000004', 'C', 'Bacterial meningitis', false,
   $r$Ruled out because meningitis usually develops over hours with fever and progressively worsening symptoms, rather than an instantaneous thunderclap onset — and this patient is afebrile.$r$, 3),
  ('a0000000-0000-0000-0000-000000000004', 'D', 'Tension-type headache', false,
   $r$Ruled out because tension headache is a gradual, bilateral, band-like ache of mild-to-moderate intensity, not an abrupt, severe "worst-ever" headache with vomiting and meningism.$r$, 4),
  ('a0000000-0000-0000-0000-000000000004', 'E', 'Cerebral venous sinus thrombosis', false,
   $r$Ruled out because CVST headache usually evolves over days and is associated with risk factors such as pregnancy or the combined pill, rather than a sudden thunderclap onset during exertion.$r$, 5)
on conflict (question_id, label) do nothing;

insert into question_discriminators (question_id, discriminator_text, sort_order) values
  ('a0000000-0000-0000-0000-000000000004', 'Speed of onset — reaching maximum severity within seconds ("thunderclap") — is the single most discriminating feature of SAH versus other causes of headache.', 1),
  ('a0000000-0000-0000-0000-000000000004', 'An exertional trigger (here, weightlifting, i.e. a Valsalva manoeuvre) is a recognised precipitant of aneurysmal rupture.', 2),
  ('a0000000-0000-0000-0000-000000000004', 'Meningism with vomiting but no fever favours a haemorrhagic rather than an infective cause.', 3);

-- ---------------------------------------------------------------------------
-- Question 5 — MRCP Part 1 / Gastroenterology & Hepatology — Ascending cholangitis
-- ---------------------------------------------------------------------------

insert into questions (id, exam, topic_id, status, difficulty, stem, lead_in, tags) values (
  'a0000000-0000-0000-0000-000000000005',
  'mrcp1',
  '30000000-0000-0000-0000-000000000005',
  'published',
  'advanced',
  $stem$A 71-year-old man with known gallstones is brought in by his wife with a 2-day history of right upper quadrant pain and fevers with rigors. She reports he has become confused over the last few hours and looks yellow.

Observations: HR 122 bpm, BP 88/54 mmHg, RR 24/min, SpO2 94% on air, temperature 39.4°C. Sclerae icteric, tender right upper quadrant, GCS 13.$stem$,
  'What is the most likely diagnosis?',
  array['hepatobiliary','sepsis','jaundice']
) on conflict (id) do nothing;

insert into question_options (question_id, label, option_text, is_correct, rationale, sort_order) values
  ('a0000000-0000-0000-0000-000000000005', 'A', 'Ascending cholangitis', true,
   $r$Correct. Charcot's triad (fever, jaundice, RUQ pain) plus altered mental status and hypotension — Reynolds' pentad — in a patient with known gallstones indicates biliary obstruction complicated by infection: ascending cholangitis, a biliary sepsis emergency.$r$, 1),
  ('a0000000-0000-0000-0000-000000000005', 'B', 'Acute cholecystitis', false,
   $r$Ruled out because cholecystitis causes RUQ pain and fever but not jaundice — cystic duct obstruction does not block bile flow from the liver — nor the systemic sepsis and confusion seen here.$r$, 2),
  ('a0000000-0000-0000-0000-000000000005', 'C', 'Choledocholithiasis (uncomplicated)', false,
   $r$Ruled out because an isolated common bile duct stone causes painless or painful jaundice without fever or sepsis; the rigors, hypotension and confusion indicate infection has supervened, i.e. cholangitis rather than obstruction alone.$r$, 3),
  ('a0000000-0000-0000-0000-000000000005', 'D', 'Acute pancreatitis', false,
   $r$Ruled out because pancreatitis causes epigastric pain radiating to the back with raised amylase or lipase, not the fever–jaundice–RUQ pain triad with septic features described here.$r$, 4),
  ('a0000000-0000-0000-0000-000000000005', 'E', 'Viral hepatitis', false,
   $r$Ruled out because viral hepatitis causes jaundice with malaise and deranged liver enzymes over days, but does not explain the acute fever, rigors, hypotension and confusion of sepsis.$r$, 5)
on conflict (question_id, label) do nothing;

insert into question_discriminators (question_id, discriminator_text, sort_order) values
  ('a0000000-0000-0000-0000-000000000005', $d$Charcot's triad (fever + jaundice + RUQ pain) is relatively specific for cholangitis, distinguishing it from cholecystitis (no jaundice) and choledocholithiasis alone (no fever).$d$, 1),
  ('a0000000-0000-0000-0000-000000000005', $d$Reynolds' pentad (the triad plus hypotension and confusion) signals septic shock from biliary sepsis, marking this as an emergency needing urgent biliary decompression.$d$, 2),
  ('a0000000-0000-0000-0000-000000000005', 'Known gallstone disease provides the anatomical substrate — a stone obstructing the common bile duct — that explains the obstruction underlying the infection.', 3);
