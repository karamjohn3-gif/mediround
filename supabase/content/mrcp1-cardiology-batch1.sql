-- MRCP Part 1 — Cardiology batch 1 (14 questions, matching the blueprint's
-- Cardiology allocation).
--
-- STATUS: every question here is inserted as status='draft', deliberately —
-- they will NOT appear to students until an admin reviews and republishes
-- them via /admin (or flips status directly in Supabase). This content has
-- NOT been reviewed by a clinician or MRCP-specific medical educator; it is
-- written to a solid textbook level but has not been checked against the
-- current MRCP1 syllabus, past-paper style, or clinical accuracy by anyone
-- with relevant expertise. Review before publishing.
--
-- Run after the topics migrations (0001-0004) and seed.sql, via the SQL
-- Editor.

insert into questions (id, exam, topic_id, status, difficulty, stem, lead_in, tags) values

-- 1. NSTEMI vs unstable angina
(
  'b0000000-0000-0000-0000-000000000001', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'draft', 'advanced',
  $stem$A 62-year-old woman with type 2 diabetes and hyperlipidaemia reports two episodes of central chest pain over the past 24 hours, each lasting around 20 minutes and resolving with rest. She has ongoing mild chest discomfort on arrival.

Observations: HR 88 bpm, BP 138/84 mmHg, RR 16/min, SpO2 97% on air, afebrile.

ECG: T-wave inversion in V4-V6, no ST elevation.

Troponin at 6 hours: elevated above the 99th percentile.$stem$,
  'What is the most likely diagnosis?',
  array['ACS','NSTEMI','troponin']
),

-- 2. Unstable AF -> emergency DC cardioversion
(
  'b0000000-0000-0000-0000-000000000002', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'draft', 'advanced',
  $stem$A 71-year-old man with a history of hypertension presents with palpitations and breathlessness for 3 hours. On arrival he is confused and diaphoretic.

Observations: HR 152 bpm, irregularly irregular; BP 78/50 mmHg; RR 24/min; SpO2 91% on air.

ECG: absent P waves, irregularly irregular narrow QRS complexes at approximately 150/min.$stem$,
  'What is the most appropriate immediate management?',
  array['AF','arrhythmia','cardioversion']
),

-- 3. Decompensated heart failure vs cardiogenic shock
(
  'b0000000-0000-0000-0000-000000000003', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'draft', 'advanced',
  $stem$A 68-year-old man with known ischaemic cardiomyopathy presents with 2 days of worsening breathlessness, orthopnoea and bilateral leg swelling.

Observations: HR 104 bpm, BP 146/88 mmHg, RR 26/min, SpO2 89% on air. Bilateral fine crackles to the mid-zones, raised JVP, pitting oedema to the knees. Peripheries are warm.$stem$,
  'What is the most appropriate initial management?',
  array['heart failure','pulmonary oedema']
),

-- 4. Aortic stenosis
(
  'b0000000-0000-0000-0000-000000000004', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'draft', 'advanced',
  $stem$A 74-year-old woman presents after an episode of syncope while climbing stairs. She describes several months of exertional breathlessness and chest tightness.

Examination: slow-rising, low-volume carotid pulse; an ejection systolic murmur loudest at the right upper sternal border, radiating to the carotids; soft second heart sound.$stem$,
  'What is the most likely diagnosis?',
  array['aortic stenosis','murmur','syncope']
),

-- 5. HOCM / sudden cardiac death in young athlete
(
  'b0000000-0000-0000-0000-000000000005', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'draft', 'advanced',
  $stem$A 19-year-old competitive footballer collapses suddenly during a match and dies despite resuscitation attempts. His father died suddenly aged 42. Echocardiography performed on a sibling as part of family screening shows asymmetric septal hypertrophy with systolic anterior motion of the mitral valve.$stem$,
  'What is the most likely underlying diagnosis?',
  array['HOCM','sudden cardiac death']
),

-- 6. Infective endocarditis
(
  'b0000000-0000-0000-0000-000000000006', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'draft', 'advanced',
  $stem$A 34-year-old man with a history of intravenous drug use presents with 10 days of fever, night sweats and malaise. Examination reveals a new pansystolic murmur loudest at the left sternal edge, splinter haemorrhages, and tender nodules on his finger pulps.

Observations: temperature 38.6°C, HR 110 bpm, BP 118/72 mmHg.$stem$,
  'What is the most likely diagnosis?',
  array['infective endocarditis','IV drug use']
),

-- 7. Cardiac tamponade
(
  'b0000000-0000-0000-0000-000000000007', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'draft', 'advanced',
  $stem$A 58-year-old woman with metastatic breast cancer presents with progressive breathlessness and dizziness. Examination shows a markedly raised JVP, muffled heart sounds, and a systolic blood pressure that falls by 18 mmHg during inspiration.

Observations: HR 118 bpm, BP 92/70 mmHg, RR 26/min, SpO2 94% on air.$stem$,
  'What is the most likely diagnosis?',
  array['cardiac tamponade','pericardial effusion']
),

-- 8. Drug-induced long QT / Torsades de pointes
(
  'b0000000-0000-0000-0000-000000000008', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'draft', 'advanced',
  $stem$A 45-year-old woman is started on erythromycin for a chest infection while already taking citalopram for depression. Three days later she has a witnessed collapse with jerking movements, spontaneously recovering after around 30 seconds.

ECG after the episode: QTc 540 ms. Telemetry during the event recorded a polymorphic wide-complex tachycardia with a twisting axis around the isoelectric line, which self-terminated.$stem$,
  'What is the most likely diagnosis?',
  array['long QT','torsades','arrhythmia']
),

-- 9. Complete heart block post-inferior MI
(
  'b0000000-0000-0000-0000-000000000009', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'draft', 'advanced',
  $stem$Three days after an inferior STEMI treated with primary PCI, a 70-year-old man develops dizziness and is noted to have a very slow pulse.

Observations: HR 34 bpm, regular; BP 88/54 mmHg.

ECG: P waves and QRS complexes occurring independently at different regular rates, with no relationship between them.$stem$,
  'What is the most likely diagnosis?',
  array['heart block','pacing','post-MI']
),

-- 10. WPW syndrome / AVRT
(
  'b0000000-0000-0000-0000-000000000010', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'draft', 'advanced',
  $stem$A 24-year-old man presents with sudden-onset palpitations and is found to have a regular narrow-complex tachycardia at 180/min, which terminates abruptly with carotid sinus massage. A previous ECG done for a pre-employment check, while in sinus rhythm, showed a short PR interval and a slurred upstroke of the QRS complex.$stem$,
  'What is the underlying diagnosis?',
  array['WPW','AVRT','pre-excitation']
),

-- 11. Acute aortic dissection
(
  'b0000000-0000-0000-0000-000000000011', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'draft', 'advanced',
  $stem$A 60-year-old man with poorly controlled hypertension develops sudden-onset, severe tearing chest pain radiating to his back between the shoulder blades. His right arm blood pressure is 168/98 mmHg and his left arm blood pressure is 128/76 mmHg, with a right radial pulse that feels weaker than the left.$stem$,
  'What is the most likely diagnosis?',
  array['aortic dissection']
),

-- 12. Digoxin toxicity
(
  'b0000000-0000-0000-0000-000000000012', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'draft', 'advanced',
  $stem$A 79-year-old woman on digoxin and furosemide for chronic atrial fibrillation and heart failure presents with nausea, vomiting and altered colour vision, describing objects as tinged yellow-green.

Blood tests: potassium 3.1 mmol/L.

ECG: "scooped" ST segment depression and a new atrial tachycardia with variable AV block.$stem$,
  'What is the most likely diagnosis?',
  array['digoxin toxicity','arrhythmia']
),

-- 13. Acute MR from papillary muscle rupture
(
  'b0000000-0000-0000-0000-000000000013', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'draft', 'advanced',
  $stem$Two days after an inferior STEMI, a 66-year-old man acutely deteriorates with sudden severe breathlessness and hypotension. Examination reveals a new loud pansystolic murmur at the apex radiating to the axilla, and bilateral crackles to the mid-zones.

Observations: HR 122 bpm, BP 84/56 mmHg, RR 32/min, SpO2 88% on air.$stem$,
  'What is the most likely diagnosis?',
  array['papillary muscle rupture','acute MR','post-MI']
),

-- 14. Constrictive pericarditis vs restrictive cardiomyopathy
(
  'b0000000-0000-0000-0000-000000000014', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'draft', 'advanced',
  $stem$A 55-year-old man with a history of tuberculosis presents with progressive abdominal swelling, peripheral oedema and exertional breathlessness. Examination reveals a raised JVP that rises further on inspiration, a pericardial knock, and hepatomegaly with ascites.

Echocardiography shows normal ventricular wall thickness and preserved systolic function, with a septal "bounce."$stem$,
  'What is the most likely diagnosis?',
  array['constrictive pericarditis','Kussmaul sign']
)

on conflict (id) do nothing;

-- ---------------------------------------------------------------------------
-- Options
-- ---------------------------------------------------------------------------

insert into question_options (question_id, label, option_text, is_correct, rationale, sort_order) values

-- Q1 NSTEMI
('b0000000-0000-0000-0000-000000000001', 'A', 'NSTEMI', true,
 $r$Correct. Elevated troponin with ischaemic ECG changes (T-wave inversion) but no ST elevation defines NSTEMI — myocardial necrosis without a transmural (ST-elevation) infarction.$r$, 1),
('b0000000-0000-0000-0000-000000000001', 'B', 'Unstable angina', false,
 $r$Ruled out because troponin is elevated, indicating myocardial necrosis; unstable angina by definition has a normal troponin.$r$, 2),
('b0000000-0000-0000-0000-000000000001', 'C', 'STEMI', false,
 $r$Ruled out because there is no ST elevation on the ECG; T-wave inversion alone is not diagnostic of a transmural infarction.$r$, 3),
('b0000000-0000-0000-0000-000000000001', 'D', 'Myocarditis', false,
 $r$Ruled out because myocarditis typically follows a viral prodrome with diffuse (not territorial) ECG changes, whereas this patient's risk factors and pattern fit coronary artery disease.$r$, 4),
('b0000000-0000-0000-0000-000000000001', 'E', 'Costochondritis', false,
 $r$Ruled out because costochondritis does not cause troponin elevation or ischaemic ECG changes; it is a musculoskeletal diagnosis with reproducible chest wall tenderness.$r$, 5),

-- Q2 Unstable AF
('b0000000-0000-0000-0000-000000000002', 'A', 'Emergency synchronised DC cardioversion', true,
 $r$Correct. New-onset AF with life-threatening haemodynamic instability (hypotension, altered consciousness) mandates emergency electrical cardioversion regardless of anticoagulation or symptom duration.$r$, 1),
('b0000000-0000-0000-0000-000000000002', 'B', 'IV bisoprolol', false,
 $r$Ruled out because rate control is inappropriate first-line in a haemodynamically unstable patient; beta-blockade could worsen the hypotension.$r$, 2),
('b0000000-0000-0000-0000-000000000002', 'C', 'IV amiodarone loading', false,
 $r$Ruled out because pharmacological cardioversion is slower-onset than DC cardioversion and is not first-line in an unstable patient needing immediate correction.$r$, 3),
('b0000000-0000-0000-0000-000000000002', 'D', 'IV digoxin', false,
 $r$Ruled out because digoxin has a slow onset of action (hours) and is unsuitable for emergency rate or rhythm control in an unstable patient.$r$, 4),
('b0000000-0000-0000-0000-000000000002', 'E', 'Anticoagulate and delay cardioversion for 3 weeks', false,
 $r$Ruled out because the 3-week anticoagulation rule applies to elective cardioversion in stable patients with AF of uncertain duration; an unstable patient requires immediate cardioversion regardless of anticoagulation status.$r$, 5),

-- Q3 Decompensated HF
('b0000000-0000-0000-0000-000000000003', 'A', 'IV furosemide, oxygen and sitting the patient upright', true,
 $r$Correct. A warm, well-perfused, hypertensive patient with signs of fluid overload has decompensated (not cardiogenic-shock) heart failure, managed with a loop diuretic, oxygen and positioning to reduce preload.$r$, 1),
('b0000000-0000-0000-0000-000000000003', 'B', 'IV noradrenaline', false,
 $r$Ruled out because vasopressors are reserved for cardiogenic shock (hypotensive, poorly perfused); this patient is normotensive/hypertensive with warm peripheries, not shocked.$r$, 2),
('b0000000-0000-0000-0000-000000000003', 'C', 'IV fluid bolus', false,
 $r$Ruled out because the patient is fluid-overloaded (raised JVP, crackles, oedema); further fluid would worsen pulmonary oedema.$r$, 3),
('b0000000-0000-0000-0000-000000000003', 'D', 'Emergency dialysis', false,
 $r$Ruled out because there is no stated indication (e.g. severe hyperkalaemia or diuretic-refractory overload) for emergency renal replacement therapy.$r$, 4),
('b0000000-0000-0000-0000-000000000003', 'E', 'Urgent coronary angiography', false,
 $r$Ruled out because there are no features of an acute coronary trigger (no chest pain or ischaemic ECG changes described); this is decompensated chronic heart failure.$r$, 5),

-- Q4 Aortic stenosis
('b0000000-0000-0000-0000-000000000004', 'A', 'Aortic stenosis', true,
 $r$Correct. Exertional syncope, angina and dyspnoea with a slow-rising pulse and an ejection systolic murmur radiating to the carotids with a soft second heart sound are classic for severe aortic stenosis.$r$, 1),
('b0000000-0000-0000-0000-000000000004', 'B', 'Hypertrophic obstructive cardiomyopathy', false,
 $r$Ruled out because HOCM classically produces a jerky (not slow-rising) pulse, and its murmur increases with Valsalva/standing rather than the fixed-obstruction pattern of aortic stenosis.$r$, 2),
('b0000000-0000-0000-0000-000000000004', 'C', 'Mitral regurgitation', false,
 $r$Ruled out because MR produces a pansystolic (not ejection systolic) murmur loudest at the apex radiating to the axilla, not the carotids.$r$, 3),
('b0000000-0000-0000-0000-000000000004', 'D', 'Aortic regurgitation', false,
 $r$Ruled out because AR causes an early diastolic murmur with a collapsing pulse, not a slow-rising pulse and ejection systolic murmur.$r$, 4),
('b0000000-0000-0000-0000-000000000004', 'E', 'Pulmonary embolism', false,
 $r$Ruled out because PE causes sudden pleuritic pain and hypoxia, not a murmur radiating to the carotids or a slow-rising pulse.$r$, 5),

-- Q5 HOCM
('b0000000-0000-0000-0000-000000000005', 'A', 'Hypertrophic obstructive cardiomyopathy', true,
 $r$Correct. Asymmetric septal hypertrophy with systolic anterior motion of the mitral valve, a family history of sudden death, and collapse during exertion in a young athlete are classic for HOCM, the leading cause of sudden cardiac death in young athletes.$r$, 1),
('b0000000-0000-0000-0000-000000000005', 'B', 'Dilated cardiomyopathy', false,
 $r$Ruled out because DCM shows a dilated, thin-walled, poorly contractile ventricle, not asymmetric septal hypertrophy.$r$, 2),
('b0000000-0000-0000-0000-000000000005', 'C', 'Arrhythmogenic right ventricular cardiomyopathy', false,
 $r$Ruled out because ARVC primarily affects the right ventricle with fibrofatty replacement, not asymmetric septal hypertrophy with systolic anterior motion.$r$, 3),
('b0000000-0000-0000-0000-000000000005', 'D', 'Myocarditis', false,
 $r$Ruled out because myocarditis typically follows a viral illness with diffuse inflammation, not the structural asymmetric hypertrophy described.$r$, 4),
('b0000000-0000-0000-0000-000000000005', 'E', 'Anomalous coronary artery origin', false,
 $r$Ruled out because this causes sudden death via ischaemia from vessel compression during exertion, not the structural hypertrophy and systolic anterior motion found on echocardiography.$r$, 5),

-- Q6 Infective endocarditis
('b0000000-0000-0000-0000-000000000006', 'A', 'Infective endocarditis', true,
 $r$Correct. Fever, a new regurgitant murmur, splinter haemorrhages and tender pulp nodules (Osler's nodes) in an intravenous drug user fulfil the clinical picture of infective endocarditis.$r$, 1),
('b0000000-0000-0000-0000-000000000006', 'B', 'Rheumatic fever', false,
 $r$Ruled out because rheumatic fever typically follows streptococcal pharyngitis in a younger patient and does not explain the peripheral stigmata described.$r$, 2),
('b0000000-0000-0000-0000-000000000006', 'C', 'Systemic lupus erythematosus', false,
 $r$Ruled out because SLE does not typically present acutely with fever and these embolic/immune peripheral stigmata, and IV drug use is not a risk factor for SLE.$r$, 3),
('b0000000-0000-0000-0000-000000000006', 'D', 'Pulmonary embolism with septic emboli only', false,
 $r$Ruled out because this would not explain the new murmur or Osler's nodes, which reflect immune complex deposition from endocarditis rather than simple embolism.$r$, 4),
('b0000000-0000-0000-0000-000000000006', 'E', 'Disseminated gonococcal infection', false,
 $r$Ruled out because this classically causes tenosynovitis, dermatitis and migratory polyarthritis, not a new murmur with splinter haemorrhages and Osler's nodes.$r$, 5),

-- Q7 Tamponade
('b0000000-0000-0000-0000-000000000007', 'A', 'Cardiac tamponade', true,
 $r$Correct. Beck's triad (hypotension, raised JVP, muffled heart sounds) plus pulsus paradoxus in a patient with malignancy — a recognised cause of pericardial effusion — is diagnostic of cardiac tamponade.$r$, 1),
('b0000000-0000-0000-0000-000000000007', 'B', 'Constrictive pericarditis', false,
 $r$Ruled out because constrictive pericarditis causes Kussmaul's sign but not the acute hypotension and pronounced pulsus paradoxus described; the acute presentation favours tamponade.$r$, 2),
('b0000000-0000-0000-0000-000000000007', 'C', 'Massive pulmonary embolism', false,
 $r$Ruled out because while PE causes hypotension and a raised JVP, it does not produce muffled heart sounds or pulsus paradoxus.$r$, 3),
('b0000000-0000-0000-0000-000000000007', 'D', 'Right ventricular infarction', false,
 $r$Ruled out because RV infarction is associated with ECG changes of inferior MI and clear (not muffled) heart sounds, not pulsus paradoxus.$r$, 4),
('b0000000-0000-0000-0000-000000000007', 'E', 'Tension pneumothorax', false,
 $r$Ruled out because this causes tracheal deviation and a hyper-resonant, silent hemithorax, not muffled heart sounds or this pattern of pulsus paradoxus.$r$, 5),

-- Q8 Torsades
('b0000000-0000-0000-0000-000000000008', 'A', 'Torsades de pointes secondary to drug-induced long QT syndrome', true,
 $r$Correct. Concurrent QT-prolonging drugs (a macrolide and an SSRI) causing a markedly prolonged QTc with a self-terminating polymorphic VT with a twisting axis is diagnostic of Torsades de pointes from acquired long QT syndrome.$r$, 1),
('b0000000-0000-0000-0000-000000000008', 'B', 'Ventricular fibrillation', false,
 $r$Ruled out because VF is a chaotic, disorganised rhythm without an organised twisting morphology and is not typically self-terminating.$r$, 2),
('b0000000-0000-0000-0000-000000000008', 'C', 'Monomorphic ventricular tachycardia', false,
 $r$Ruled out because monomorphic VT has a consistent QRS morphology beat-to-beat, unlike the twisting axis described, and is usually related to a fixed scar rather than QT prolongation.$r$, 3),
('b0000000-0000-0000-0000-000000000008', 'D', 'Vasovagal syncope', false,
 $r$Ruled out because this would not produce a documented polymorphic wide-complex tachycardia on telemetry or a markedly prolonged QTc.$r$, 4),
('b0000000-0000-0000-0000-000000000008', 'E', 'Focal (partial) seizure', false,
 $r$Ruled out because the documented rhythm (polymorphic VT with prolonged QTc) confirms a cardiac cause — the jerking movements reflect hypoperfusion-induced convulsive syncope, not primary epilepsy.$r$, 5),

-- Q9 Complete heart block
('b0000000-0000-0000-0000-000000000009', 'A', 'Complete (third-degree) heart block', true,
 $r$Correct. Independent, dissociated atrial and ventricular rates with a slow ventricular escape rhythm after an inferior MI (which perfuses the AV node in most people) is diagnostic of complete heart block.$r$, 1),
('b0000000-0000-0000-0000-000000000009', 'B', 'Mobitz type I (Wenckebach) second-degree block', false,
 $r$Ruled out because Mobitz I shows progressive PR prolongation until a dropped beat, with a clear relationship between P waves and QRS complexes, unlike the complete dissociation described.$r$, 2),
('b0000000-0000-0000-0000-000000000009', 'C', 'Mobitz type II second-degree block', false,
 $r$Ruled out because Mobitz II shows a constant PR interval with intermittently non-conducted P waves, not complete independence of atrial and ventricular rates.$r$, 3),
('b0000000-0000-0000-0000-000000000009', 'D', 'Atrial fibrillation with a slow ventricular response', false,
 $r$Ruled out because AF shows absent, disorganised P waves, not organised P waves occurring at their own regular independent rate.$r$, 4),
('b0000000-0000-0000-0000-000000000009', 'E', 'Sinus bradycardia', false,
 $r$Ruled out because sinus bradycardia shows a normal 1:1 relationship between P waves and QRS complexes, just at a slow rate, not AV dissociation.$r$, 5),

-- Q10 WPW
('b0000000-0000-0000-0000-000000000010', 'A', 'Wolff-Parkinson-White syndrome', true,
 $r$Correct. A short PR interval with a slurred QRS upstroke (delta wave) indicates an accessory pathway, predisposing to atrioventricular re-entrant tachycardia (AVRT), which explains the paroxysmal tachycardia terminated by vagal manoeuvres.$r$, 1),
('b0000000-0000-0000-0000-000000000010', 'B', 'AV nodal re-entrant tachycardia (AVNRT) alone', false,
 $r$Ruled out because AVNRT is not associated with a delta wave or short PR interval on the baseline ECG; the pre-excitation pattern specifically indicates an accessory pathway.$r$, 2),
('b0000000-0000-0000-0000-000000000010', 'C', 'Atrial flutter', false,
 $r$Ruled out because atrial flutter typically shows a sawtooth pattern at around 300/min with variable block, and does not explain the baseline delta wave.$r$, 3),
('b0000000-0000-0000-0000-000000000010', 'D', 'Sinus tachycardia', false,
 $r$Ruled out because sinus tachycardia would not terminate abruptly with carotid sinus massage and does not explain the pre-excitation pattern on the resting ECG.$r$, 4),
('b0000000-0000-0000-0000-000000000010', 'E', 'Multifocal atrial tachycardia', false,
 $r$Ruled out because this shows varying P-wave morphologies and an irregular rhythm, typically in severe lung disease, not a regular tachycardia with a delta wave.$r$, 5),

-- Q11 Aortic dissection
('b0000000-0000-0000-0000-000000000011', 'A', 'Acute aortic dissection', true,
 $r$Correct. Sudden tearing chest pain radiating to the back with a significant inter-arm blood pressure differential and asymmetric pulses in a hypertensive patient is classic for acute aortic dissection.$r$, 1),
('b0000000-0000-0000-0000-000000000011', 'B', 'Acute myocardial infarction', false,
 $r$Ruled out because MI typically causes crushing (not tearing) pain without radiation to the back or an inter-arm BP/pulse discrepancy.$r$, 2),
('b0000000-0000-0000-0000-000000000011', 'C', 'Pulmonary embolism', false,
 $r$Ruled out because PE causes pleuritic pain and hypoxia, not tearing back pain with asymmetric limb blood pressures.$r$, 3),
('b0000000-0000-0000-0000-000000000011', 'D', 'Musculoskeletal back pain', false,
 $r$Ruled out because this would not cause a significant inter-arm blood pressure differential or pulse asymmetry.$r$, 4),
('b0000000-0000-0000-0000-000000000011', 'E', 'Oesophageal rupture (Boerhaave syndrome)', false,
 $r$Ruled out because this typically follows forceful vomiting and causes chest pain with subcutaneous emphysema, not an inter-arm BP/pulse differential.$r$, 5),

-- Q12 Digoxin toxicity
('b0000000-0000-0000-0000-000000000012', 'A', 'Digoxin toxicity', true,
 $r$Correct. Visual disturbance (xanthopsia), GI upset, hypokalaemia (which potentiates digoxin's effect), and atrial tachycardia with block — a rhythm strongly associated with digoxin toxicity — together are diagnostic.$r$, 1),
('b0000000-0000-0000-0000-000000000012', 'B', 'Hypokalaemia alone', false,
 $r$Ruled out because hypokalaemia alone does not explain the xanthopsia or the specific arrhythmia described, though it is a contributing factor here.$r$, 2),
('b0000000-0000-0000-0000-000000000012', 'C', 'Acute gastroenteritis', false,
 $r$Ruled out because this would not explain the visual disturbance or the characteristic ECG findings.$r$, 3),
('b0000000-0000-0000-0000-000000000012', 'D', 'Digoxin-related sinus bradycardia only', false,
 $r$Ruled out because the ECG shows atrial tachycardia with variable block, a more specific finding for toxicity than simple bradycardia.$r$, 4),
('b0000000-0000-0000-0000-000000000012', 'E', 'Hyperkalaemia-induced arrhythmia', false,
 $r$Ruled out because the potassium is low, not high; hyperkalaemia produces tented T waves and a widened QRS, not the findings described here.$r$, 5),

-- Q13 Papillary muscle rupture
('b0000000-0000-0000-0000-000000000013', 'A', 'Acute mitral regurgitation from papillary muscle rupture', true,
 $r$Correct. A new pansystolic murmur radiating to the axilla with acute pulmonary oedema and cardiogenic shock, days after an inferior MI, is classic for papillary muscle rupture causing acute severe MR.$r$, 1),
('b0000000-0000-0000-0000-000000000013', 'B', 'Ventricular septal rupture', false,
 $r$Ruled out because this causes a new murmur at the left sternal edge with a palpable thrill and a step-up in oxygen saturation between the right ventricle and pulmonary artery, not an apical murmur radiating to the axilla.$r$, 2),
('b0000000-0000-0000-0000-000000000013', 'C', 'Free wall rupture', false,
 $r$Ruled out because free wall rupture typically presents with sudden tamponade and cardiac arrest, not a new murmur with pulmonary oedema.$r$, 3),
('b0000000-0000-0000-0000-000000000013', 'D', 'Re-infarction', false,
 $r$Ruled out because re-infarction would present with recurrent chest pain and ST changes, not a new pansystolic murmur radiating to the axilla.$r$, 4),
('b0000000-0000-0000-0000-000000000013', 'E', $o$Dressler's syndrome$o$, false,
 $r$Ruled out because Dressler's syndrome typically occurs weeks post-MI with pleuritic pain and a pericardial rub, not an acute new murmur with cardiogenic shock at day 2.$r$, 5),

-- Q14 Constrictive pericarditis
('b0000000-0000-0000-0000-000000000014', 'A', 'Constrictive pericarditis', true,
 $r$Correct. A history of TB, Kussmaul's sign, a pericardial knock, and normal wall thickness with preserved systolic function but impaired filling (septal bounce) are classic for constrictive pericarditis.$r$, 1),
('b0000000-0000-0000-0000-000000000014', 'B', 'Restrictive cardiomyopathy', false,
 $r$Ruled out because restrictive cardiomyopathy typically shows increased ventricular wall thickness from infiltration, unlike the normal wall thickness here, and lacks a pericardial knock.$r$, 2),
('b0000000-0000-0000-0000-000000000014', 'C', 'Cardiac tamponade', false,
 $r$Ruled out because tamponade is an acute presentation with pulsus paradoxus and hypotension, not this chronic, progressive course with a pericardial knock.$r$, 3),
('b0000000-0000-0000-0000-000000000014', 'D', 'Right heart failure from cor pulmonale', false,
 $r$Ruled out because this would be associated with chronic lung disease and pulmonary hypertension on echo, not a pericardial knock or septal bounce.$r$, 4),
('b0000000-0000-0000-0000-000000000014', 'E', 'Nephrotic syndrome', false,
 $r$Ruled out because although this causes oedema and ascites, it would not explain the raised JVP, Kussmaul's sign, pericardial knock or septal bounce.$r$, 5)

on conflict (question_id, label) do nothing;

-- ---------------------------------------------------------------------------
-- Discriminators
-- ---------------------------------------------------------------------------

insert into question_discriminators (question_id, discriminator_text, sort_order) values

('b0000000-0000-0000-0000-000000000001', 'Elevated troponin is the key feature distinguishing NSTEMI from unstable angina, where troponin is normal.', 1),
('b0000000-0000-0000-0000-000000000001', 'Absence of ST elevation excludes STEMI despite ischaemic-sounding pain.', 2),
('b0000000-0000-0000-0000-000000000001', 'Ischaemic risk factors and a typical anginal pattern favour ACS over myocarditis or musculoskeletal causes.', 3),

('b0000000-0000-0000-0000-000000000002', 'Adverse features (hypotension, confusion) in AF define "unstable" and mandate emergency electrical cardioversion.', 1),
('b0000000-0000-0000-0000-000000000002', 'Onset/duration-based anticoagulation rules only apply to elective, haemodynamically stable cardioversion.', 2),
('b0000000-0000-0000-0000-000000000002', 'Pharmacological agents are too slow-onset for immediate haemodynamic compromise.', 3),

('b0000000-0000-0000-0000-000000000003', 'Warm peripheries and hypertension (not hypotension) distinguish decompensated heart failure from cardiogenic shock.', 1),
('b0000000-0000-0000-0000-000000000003', 'Signs of fluid overload support diuresis, not fluid resuscitation.', 2),
('b0000000-0000-0000-0000-000000000003', 'Absence of chest pain or ischaemic ECG changes argues against an ACS trigger needing urgent angiography.', 3),

('b0000000-0000-0000-0000-000000000004', $d$A slow-rising, low-volume ("pulsus parvus et tardus") pulse is a hallmark of severe aortic stenosis, distinguishing it from HOCM's jerky pulse.$d$, 1),
('b0000000-0000-0000-0000-000000000004', 'Radiation of the murmur to the carotids with a soft or absent S2 localises pathology to the aortic valve rather than the mitral valve.', 2),
('b0000000-0000-0000-0000-000000000004', 'The symptom triad of syncope, angina and dyspnoea reflects a fixed outflow obstruction unable to augment cardiac output on exertion.', 3),

('b0000000-0000-0000-0000-000000000005', 'Asymmetric septal hypertrophy with systolic anterior motion (SAM) of the mitral valve is the defining echocardiographic feature of HOCM.', 1),
('b0000000-0000-0000-0000-000000000005', 'A family history of unexplained sudden death supports an inherited sarcomeric cardiomyopathy.', 2),
('b0000000-0000-0000-0000-000000000005', 'Collapse during exertion in a young, previously fit individual is the classic presentation of HOCM-related sudden cardiac death.', 3),

('b0000000-0000-0000-0000-000000000006', 'A new regurgitant murmur in a febrile patient is a major diagnostic criterion strongly suggestive of infective endocarditis.', 1),
('b0000000-0000-0000-0000-000000000006', $d$Peripheral stigmata (splinter haemorrhages, tender Osler's nodes) reflect immune-complex and embolic phenomena specific to endocarditis.$d$, 2),
('b0000000-0000-0000-0000-000000000006', 'IV drug use is the single strongest risk factor pointing to endocarditis over other differentials.', 3),

('b0000000-0000-0000-0000-000000000007', $d$Beck's triad (hypotension, raised JVP, muffled heart sounds) is classic for cardiac tamponade.$d$, 1),
('b0000000-0000-0000-0000-000000000007', 'Pulsus paradoxus reflects the exaggerated ventricular interdependence seen in tamponade.', 2),
('b0000000-0000-0000-0000-000000000007', 'A background of malignancy is a common and important cause of pericardial effusion progressing to tamponade.', 3),

('b0000000-0000-0000-0000-000000000008', 'A markedly prolonged QTc in the context of two QT-prolonging drugs points to acquired, drug-induced long QT syndrome.', 1),
('b0000000-0000-0000-0000-000000000008', 'The characteristic twisting polymorphic morphology around the isoelectric line is specific to Torsades de pointes.', 2),
('b0000000-0000-0000-0000-000000000008', 'Jerking movements during the episode reflect hypoperfusion-induced convulsive syncope, not primary epilepsy.', 3),

('b0000000-0000-0000-0000-000000000009', 'Complete dissociation between independently regular atrial and ventricular rates is the defining ECG feature of third-degree heart block.', 1),
('b0000000-0000-0000-0000-000000000009', 'Inferior MI is a recognised cause of AV block post-infarction, since the right coronary artery usually supplies the AV node.', 2),
('b0000000-0000-0000-0000-000000000009', 'Haemodynamic compromise from a slow escape rhythm indicates the need for urgent pacing.', 3),

('b0000000-0000-0000-0000-000000000010', 'A short PR interval with a delta wave on the resting ECG is the hallmark of ventricular pre-excitation in WPW syndrome.', 1),
('b0000000-0000-0000-0000-000000000010', 'Abrupt termination of the tachycardia with vagal manoeuvres is characteristic of an AVRT circuit involving the AV node.', 2),
('b0000000-0000-0000-0000-000000000010', 'The combination of a baseline pre-excitation pattern and paroxysmal regular tachycardia distinguishes WPW-related AVRT from AVNRT.', 3),

('b0000000-0000-0000-0000-000000000011', 'Tearing pain radiating to the back, rather than typical anginal radiation, points to aortic rather than coronary pathology.', 1),
('b0000000-0000-0000-0000-000000000011', 'A significant inter-arm blood pressure differential and asymmetric pulses reflect compromised flow to a subclavian artery from the dissection flap.', 2),
('b0000000-0000-0000-0000-000000000011', 'Poorly controlled hypertension is the leading risk factor for aortic dissection.', 3),

('b0000000-0000-0000-0000-000000000012', 'Xanthopsia (yellow-green visual disturbance) is a classic and specific symptom of digoxin toxicity.', 1),
('b0000000-0000-0000-0000-000000000012', 'Atrial tachycardia with variable AV block is a highly characteristic arrhythmia of digoxin toxicity.', 2),
('b0000000-0000-0000-0000-000000000012', 'Hypokalaemia potentiates digoxin binding to the Na+/K+-ATPase pump, precipitating toxicity even at therapeutic levels.', 3),

('b0000000-0000-0000-0000-000000000013', 'A new pansystolic murmur radiating to the axilla localises the pathology to the mitral valve, unlike VSD (murmur at the left sternal edge).', 1),
('b0000000-0000-0000-0000-000000000013', 'Timing (days post-MI) and inferior MI territory fit papillary muscle rupture, since the posteromedial papillary muscle has a single blood supply.', 2),
('b0000000-0000-0000-0000-000000000013', 'Acute cardiogenic shock with pulmonary oedema reflects the sudden severe volume overload of acute, unlike chronic compensated, MR.', 3),

('b0000000-0000-0000-0000-000000000014', $d$Kussmaul's sign (paradoxical rise in JVP with inspiration) reflects a fixed, non-compliant pericardium impairing right heart filling.$d$, 1),
('b0000000-0000-0000-0000-000000000014', 'A pericardial knock is a specific auscultatory finding in constrictive pericarditis.', 2),
('b0000000-0000-0000-0000-000000000014', 'Normal wall thickness with preserved systolic function but impaired diastolic filling distinguishes constriction from restrictive cardiomyopathy.', 3);
