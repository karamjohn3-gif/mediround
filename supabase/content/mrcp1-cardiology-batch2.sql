-- MRCP Part 1 — Cardiology batch 2 (50 questions), extending batch 1's
-- 14-question Cardiology set with broader topic coverage: STEMI reperfusion
-- strategy, staged hypertension management, stable angina, chronic heart
-- failure drug therapy, ECG territory/artery correlation, peri-arrest
-- rhythm management, valvular disease, rheumatic fever, pericarditis,
-- myocarditis/cardiomyopathies, post-MI secondary prevention, electrolyte/
-- ECG interactions, inherited arrhythmia syndromes, syncope, PAD, VTE,
-- congenital heart disease, Marfan syndrome, cardiac tumours, takotsubo
-- cardiomyopathy, device therapy, heart block subtypes, functional cardiac
-- testing and infective endocarditis prophylaxis/Duke criteria nuances.
--
-- STATUS: status='published' — per explicit instruction from the person
-- who commissioned this batch, these questions are inserted directly as
-- published (no draft-then-review step for this batch). This content has
-- NOT been individually reviewed by a clinician or MRCP-specific medical
-- educator; it has been checked by the writing model against standard UK
-- reference sources (NICE guidance including NG136 hypertension, NG106
-- chronic heart failure, CG95/NG185 chest pain of recent onset, CG64
-- infective endocarditis prophylaxis; Resuscitation Council UK ALS
-- peri-arrest algorithms; British Hypertension Society staged antihypertensive
-- algorithm; standard MRCP1-level textbook physiology) to a solid standard,
-- but has not been checked by a human with relevant clinical expertise.
--
-- None of the 50 scenarios below duplicate the 14 scenarios already live in
-- mrcp1-cardiology-batch1.sql (NSTEMI vs unstable angina; unstable AF/
-- emergency cardioversion; decompensated heart failure vs cardiogenic
-- shock; aortic stenosis; HOCM/sudden cardiac death; infective endocarditis
-- diagnosis; cardiac tamponade; drug-induced long QT/Torsades from
-- erythromycin+citalopram; complete heart block post-inferior MI; WPW/
-- AVRT; aortic dissection; digoxin toxicity; acute MR from papillary
-- muscle rupture; constrictive pericarditis vs restrictive cardiomyopathy).
-- Where a batch-2 question touches a similar disease area (e.g. IE,
-- restrictive physiology, heart block, long QT/Torsades), the clinical
-- angle, mechanism or complication tested is deliberately different.
--
-- Run after the topics migrations (0001-0004), seed.sql and batch 1, via
-- the SQL Editor.

insert into questions (id, exam, topic_id, status, difficulty, stem, lead_in, tags) values

-- 1. Inferior STEMI territory -> RCA
(
  '20000000-0000-0000-0000-000000000001', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'foundation',
  $stem$A 58-year-old man has an acute STEMI. The ECG shows ST elevation in leads II, III and aVF, with reciprocal ST depression in I and aVL.$stem$,
  'Which coronary artery is most likely occluded?',
  array['STEMI','ECG territory','inferior MI']
),

-- 2. Anterior STEMI territory -> LAD
(
  '20000000-0000-0000-0000-000000000002', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'foundation',
  $stem$A 61-year-old woman has an acute STEMI. The ECG shows ST elevation across V1-V4 with reciprocal changes inferiorly.$stem$,
  'Which coronary artery is most likely occluded?',
  array['STEMI','ECG territory','anterior MI']
),

-- 3. STEMI reperfusion - primary PCI within window
(
  '20000000-0000-0000-0000-000000000003', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$A 55-year-old man develops central crushing chest pain 90 minutes ago. ECG confirms an anterior STEMI. The nearest primary PCI centre can have him on the table within 60 minutes of this presentation.$stem$,
  'What is the most appropriate reperfusion strategy?',
  array['STEMI','reperfusion','primary PCI']
),

-- 4. STEMI reperfusion - fibrinolysis when PCI not deliverable in time
(
  '20000000-0000-0000-0000-000000000004', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$A 62-year-old man in a rural area develops central chest pain with ECG evidence of an inferior STEMI 40 minutes ago. The nearest primary PCI-capable centre is 3 hours away by road, and no helicopter transfer is available. He has no contraindications to thrombolysis.$stem$,
  'What is the most appropriate immediate management?',
  array['STEMI','reperfusion','fibrinolysis']
),

-- 5. Hypertension - ethnicity-specific first-line
(
  '20000000-0000-0000-0000-000000000005', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'foundation',
  $stem$A 62-year-old man of Afro-Caribbean ethnicity is found to have a clinic blood pressure of 158/96 mmHg, confirmed on ambulatory monitoring. He has no diabetes and no other relevant comorbidities.$stem$,
  'What is the most appropriate first-line antihypertensive drug?',
  array['hypertension','NICE step 1','ethnicity']
),

-- 6. Hypertension - staged step 2
(
  '20000000-0000-0000-0000-000000000006', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$A 67-year-old woman has been on amlodipine 10 mg once daily (maximum dose) for hypertension for 3 months. Home blood pressure readings remain persistently above 150/95 mmHg. She takes no other regular medication.$stem$,
  'What is the most appropriate next step in her antihypertensive management?',
  array['hypertension','NICE step 2']
),

-- 7. Resistant hypertension -> primary hyperaldosteronism
(
  '20000000-0000-0000-0000-000000000007', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'advanced',
  $stem$A 49-year-old man has blood pressure persistently above 160/100 mmHg despite treatment with maximum-dose amlodipine, ramipril and indapamide, taken correctly and confirmed by pharmacy records.

Bloods: sodium 144 mmol/L, potassium 3.0 mmol/L (unprovoked by diuretic dosing changes). He is not on any potassium-wasting medication beyond the indapamide already accounted for, and his renal function is normal.$stem$,
  'What is the most appropriate next investigation?',
  array['resistant hypertension','hyperaldosteronism','hypokalaemia']
),

-- 8. Stable angina - first-line therapy
(
  '20000000-0000-0000-0000-000000000008', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'foundation',
  $stem$A 64-year-old man is diagnosed with stable angina after investigation confirms obstructive coronary artery disease. He has no contraindications to any anti-anginal drug class.$stem$,
  'What is the most appropriate first-line regular anti-anginal therapy, alongside a GTN spray for acute symptoms?',
  array['stable angina','anti-anginal therapy']
),

-- 9. HFrEF - add MRA second-line
(
  '20000000-0000-0000-0000-000000000009', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$A 70-year-old man with HFrEF (LVEF 30%) remains breathless on minimal exertion despite being on target doses of ramipril and bisoprolol for 3 months. His potassium is 4.3 mmol/L and eGFR is 62 mL/min/1.73m2.$stem$,
  'What is the most appropriate next step in his heart failure drug therapy?',
  array['heart failure','HFrEF','MRA']
),

-- 10. HFrEF - first-line ACEi + beta-blocker
(
  '20000000-0000-0000-0000-000000000010', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'foundation',
  $stem$A 66-year-old man is newly diagnosed with heart failure with reduced ejection fraction (LVEF 32%) after an echocardiogram for exertional breathlessness. He is currently on no cardiac medication.$stem$,
  'What is the most appropriate first-line combination of disease-modifying drug therapy to start?',
  array['heart failure','HFrEF','first-line therapy']
),

-- 11. HFrEF - hydralazine + nitrate
(
  '20000000-0000-0000-0000-000000000011', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$A 58-year-old man of Black African origin with HFrEF (LVEF 28%) develops a persistent dry cough and worsening renal function shortly after starting ramipril, which is stopped. An ARB is trialled but he develops angioedema and this too is discontinued. He remains symptomatic (NYHA III) despite bisoprolol and spironolactone at optimised doses.$stem$,
  'What is the most appropriate additional therapy to consider?',
  array['heart failure','HFrEF','hydralazine-nitrate']
),

-- 12. HFrEF - sacubitril-valsartan switch criteria
(
  '20000000-0000-0000-0000-000000000012', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'advanced',
  $stem$A 63-year-old woman with HFrEF (LVEF 30%, NYHA class III) remains symptomatic despite optimised doses of ramipril, bisoprolol and spironolactone, with a stable potassium of 4.6 mmol/L and eGFR of 55 mL/min/1.73m2.$stem$,
  'What is the most appropriate next step in her heart failure management?',
  array['heart failure','HFrEF','sacubitril-valsartan','ARNI']
),

-- 13. HFrEF - ivabradine and non-dihydropyridine CCB interaction
(
  '20000000-0000-0000-0000-000000000013', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'advanced',
  $stem$A 68-year-old man with HFrEF (LVEF 30%) is in sinus rhythm with a resting heart rate of 82 bpm despite bisoprolol titrated to the maximum tolerated dose. His cardiologist is considering adding ivabradine. On reviewing his drug chart, he is also taking diltiazem, started by his GP several months ago for hypertension that predated his heart failure diagnosis.$stem$,
  'What is the most appropriate action regarding starting ivabradine?',
  array['heart failure','ivabradine','drug interaction','bradycardia']
),

-- 14. HFrEF - CRT criteria
(
  '20000000-0000-0000-0000-000000000014', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$A 71-year-old man with HFrEF (LVEF 28%, NYHA class III) remains symptomatic despite optimised medical therapy. His ECG shows a left bundle branch block pattern with a QRS duration of 165 ms, and he remains in sinus rhythm.$stem$,
  'What is the most appropriate device therapy to consider?',
  array['heart failure','cardiac resynchronisation therapy','CRT']
),

-- 15. Chronic hypertension -> LVH -> diastolic dysfunction -> HFpEF
(
  '20000000-0000-0000-0000-000000000015', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'advanced',
  $stem$A 74-year-old woman with a 20-year history of poorly controlled hypertension presents with several months of exertional breathlessness and ankle swelling. Echocardiography shows a left ventricular ejection fraction of 58%, concentric left ventricular hypertrophy, and impaired ventricular relaxation with a raised E/e' ratio. Coronary angiography is unremarkable.$stem$,
  'What is the most likely explanation for her breathlessness?',
  array['HFpEF','LVH','diastolic dysfunction','hypertension']
),

-- 16. VT with adverse signs -> synchronised cardioversion
(
  '20000000-0000-0000-0000-000000000016', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$A 64-year-old man with a history of a previous myocardial infarction presents with palpitations and pre-syncope. He is found to have a regular broad-complex tachycardia at 190/min.

Observations: BP 78/50 mmHg, GCS 14/15 (drowsy), cool peripheries.$stem$,
  'What is the most appropriate immediate management?',
  array['ventricular tachycardia','adverse signs','cardioversion']
),

-- 17. VT without adverse signs -> amiodarone
(
  '20000000-0000-0000-0000-000000000017', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'foundation',
  $stem$A 60-year-old man with a history of ischaemic heart disease is found to have a regular broad-complex tachycardia at 165/min on telemetry. He is alert, talking comfortably, with BP 118/76 mmHg and no chest pain.$stem$,
  'What is the most appropriate immediate management?',
  array['ventricular tachycardia','no adverse signs','amiodarone']
),

-- 18. SVT acute management - vagal manoeuvres + adenosine
(
  '20000000-0000-0000-0000-000000000018', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'foundation',
  $stem$A 28-year-old woman with no significant past medical history presents with sudden-onset palpitations. She is haemodynamically stable. ECG shows a regular narrow-complex tachycardia at 180/min with no visible P waves.$stem$,
  'What is the most appropriate first step in management?',
  array['SVT','vagal manoeuvres','adenosine']
),

-- 19. SVT in asthma -> verapamil instead of adenosine
(
  '20000000-0000-0000-0000-000000000019', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$A 34-year-old woman with a history of moderate persistent asthma presents with a regular narrow-complex tachycardia at 170/min. She remains haemodynamically stable. Vagal manoeuvres have failed to terminate the rhythm.$stem$,
  'What is the most appropriate next pharmacological step?',
  array['SVT','asthma','adenosine contraindication','verapamil']
),

-- 20. VF/pulseless VT - shockable rhythm
(
  '20000000-0000-0000-0000-000000000020', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$A 66-year-old man collapses on the ward. He is unresponsive, not breathing normally, and has no palpable pulse. The cardiac monitor shows a chaotic, disorganised rhythm with no discernible QRS complexes.$stem$,
  'What is the most appropriate immediate management?',
  array['cardiac arrest','VF','shockable rhythm','defibrillation']
),

-- 21. PEA - non-shockable rhythm
(
  '20000000-0000-0000-0000-000000000021', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'foundation',
  $stem$A 72-year-old man collapses and is found unresponsive and not breathing, with no palpable pulse. The cardiac monitor shows an organised narrow-complex rhythm at 80/min, but no pulse can be felt with this rhythm on repeated checks.$stem$,
  'What is the most appropriate immediate management?',
  array['cardiac arrest','PEA','non-shockable rhythm']
),

-- 22. Bradycardia with adverse signs -> atropine then pacing
(
  '20000000-0000-0000-0000-000000000022', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$A 77-year-old man presents with dizziness and near-syncope. He is found to have sinus bradycardia at 32/min.

Observations: BP 84/52 mmHg, GCS 14/15, cool peripheries.$stem$,
  'What is the most appropriate first-line drug treatment?',
  array['bradycardia','adverse signs','atropine']
),

-- 23. Atrial flutter
(
  '20000000-0000-0000-0000-000000000023', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$A 70-year-old man presents with palpitations and mild breathlessness. He is haemodynamically stable.

ECG: regular narrow-complex tachycardia at 150/min, with a sawtooth pattern of atrial activity at approximately 300/min best seen in the inferior leads, and a fixed 2:1 relationship to the ventricular rate.$stem$,
  'What is the most likely diagnosis?',
  array['atrial flutter','sawtooth pattern']
),

-- 24. Mitral stenosis
(
  '20000000-0000-0000-0000-000000000024', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$A 46-year-old woman who emigrated from a region with a high burden of untreated streptococcal disease presents with progressive exertional breathlessness and occasional haemoptysis. She has a malar flush.

Examination: tapping apex beat, loud first heart sound, an opening snap, and a low-pitched rumbling mid-diastolic murmur at the apex, louder in expiration with the patient in the left lateral position. She is in atrial fibrillation.$stem$,
  'What is the most likely diagnosis?',
  array['mitral stenosis','rheumatic heart disease']
),

-- 25. Aortic regurgitation
(
  '20000000-0000-0000-0000-000000000025', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$A 55-year-old man presents with exertional breathlessness. Examination reveals a collapsing pulse, a wide pulse pressure (168/54 mmHg), visible carotid pulsation, and an early diastolic murmur heard best at the left sternal edge with the patient leaning forward in expiration.$stem$,
  'What is the most likely diagnosis?',
  array['aortic regurgitation','collapsing pulse']
),

-- 26. Tricuspid regurgitation
(
  '20000000-0000-0000-0000-000000000026', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'foundation',
  $stem$A 41-year-old man with a history of intravenous drug use presents with fatigue and ankle swelling. Examination reveals a pansystolic murmur at the left sternal edge that increases in intensity on inspiration, giant V waves in the jugular venous pulse, and a pulsatile, tender hepatomegaly.$stem$,
  'What is the most likely diagnosis?',
  array['tricuspid regurgitation','Carvallo sign']
),

-- 27. Acute pericarditis
(
  '20000000-0000-0000-0000-000000000027', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'foundation',
  $stem$A 29-year-old man presents with 2 days of sharp, central chest pain that is worse lying flat and relieved by sitting forward. He had a flu-like illness the week before.

ECG: widespread saddle-shaped (concave) ST elevation and PR segment depression across multiple territories, without reciprocal ST depression.$stem$,
  'What is the most likely diagnosis?',
  array['acute pericarditis','ECG changes']
),

-- 28. Pericarditis vs MI - ECG differentiation
(
  '20000000-0000-0000-0000-000000000028', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'advanced',
  $stem$A 45-year-old man presents with central chest pain. His ECG shows ST elevation. A colleague is deciding whether this represents an evolving STEMI or acute pericarditis before activating the primary PCI pathway.

On close review: the ST elevation is concave ("saddle-shaped"), present diffusely across the inferior, lateral and anterior leads simultaneously, accompanied by PR segment depression, and there is no reciprocal ST depression anywhere on the trace.$stem$,
  'Which feature most reliably distinguishes this ECG from an acute STEMI?',
  array['pericarditis','STEMI mimic','ECG differentiation']
),

-- 29. Viral myocarditis progressing to dilated cardiomyopathy
(
  '20000000-0000-0000-0000-000000000029', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'advanced',
  $stem$A 26-year-old man had a flu-like illness with fever and myalgia 10 days ago, followed by pleuritic chest pain and palpitations; troponin was mildly elevated and coronary angiography was normal, leading to a diagnosis of viral myocarditis. He was treated supportively.

He now returns 8 weeks later with progressive breathlessness and ankle swelling. Repeat echocardiography shows a globally dilated, thin-walled left ventricle with an ejection fraction of 25%, in the absence of any coronary artery disease.$stem$,
  'What is the most likely explanation for his current presentation?',
  array['myocarditis','dilated cardiomyopathy','chain reasoning']
),

-- 30. Cardiac amyloidosis
(
  '20000000-0000-0000-0000-000000000030', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'advanced',
  $stem$A 76-year-old man presents with progressive breathlessness and bilateral leg swelling. He has a history of bilateral carpal tunnel syndrome treated surgically in the last few years.

Echocardiogram: symmetrically thickened ventricular walls with a granular, "sparkling" appearance, preserved ejection fraction, and impaired diastolic filling.

ECG: surprisingly low-voltage QRS complexes across the limb leads, despite the marked wall thickening seen on echo.$stem$,
  'What is the most likely diagnosis?',
  array['cardiac amyloidosis','restrictive cardiomyopathy','voltage-thickness discordance']
),

-- 31. Post-MI secondary prevention
(
  '20000000-0000-0000-0000-000000000031', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'foundation',
  $stem$A 60-year-old man is discharged after an uncomplicated NSTEMI treated with PCI and stenting. His left ventricular function is preserved.$stem$,
  'Which combination of drugs forms the standard secondary prevention regimen he should be discharged on?',
  array['post-MI','secondary prevention']
),

-- 32. Statin monitoring
(
  '20000000-0000-0000-0000-000000000032', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'foundation',
  $stem$A 55-year-old man is started on atorvastatin 80 mg for secondary prevention after a myocardial infarction.$stem$,
  'At what point(s) should his liver function tests be routinely checked after starting the statin?',
  array['statin therapy','LFT monitoring']
),

-- 33. Hypothyroidism -> statin myopathy -> rhabdomyolysis
(
  '20000000-0000-0000-0000-000000000033', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'advanced',
  $stem$A 68-year-old woman started on simvastatin 40 mg for hypercholesterolaemia 6 weeks ago presents with severe generalised muscle pain and weakness, and dark-coloured urine.

Bloods: creatine kinase markedly elevated at 12,400 U/L. TSH is found to be markedly raised at 38 mU/L (not previously checked), with a low free T4.$stem$,
  'What is the most likely explanation for her presentation?',
  array['statin myopathy','rhabdomyolysis','hypothyroidism','chain reasoning']
),

-- 34. Hyperkalaemia ECG progression
(
  '20000000-0000-0000-0000-000000000034', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$A 58-year-old man with advanced chronic kidney disease is found on routine bloods to have a potassium of 7.4 mmol/L.

ECG: tall, tented T waves, loss of visible P waves, and a widened QRS complex.$stem$,
  'What is the most appropriate immediate treatment to stabilise the myocardium?',
  array['hyperkalaemia','ECG changes','calcium gluconate']
),

-- 35. ACEi + spironolactone + AKI -> hyperkalaemia -> arrhythmia
(
  '20000000-0000-0000-0000-000000000035', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'advanced',
  $stem$A 74-year-old man with HFrEF, established on ramipril and spironolactone for 2 years with previously normal renal function and electrolytes, develops a norovirus-type illness with 3 days of vomiting and watery diarrhoea. He continues to take both medications as usual throughout.

He is brought in confused with palpitations.

Bloods: potassium 7.2 mmol/L, urea and creatinine markedly elevated above his baseline.

ECG: tented T waves and a widened QRS with an irregular, bizarre broad-complex rhythm.$stem$,
  'What is the mechanism most directly responsible for his current arrhythmia?',
  array['hyperkalaemia','AKI','ACE inhibitor','spironolactone','chain reasoning']
),

-- 36. Brugada syndrome
(
  '20000000-0000-0000-0000-000000000036', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$A 32-year-old man of South-East Asian descent is admitted with a febrile illness. While febrile, he has a witnessed collapse. His brother died suddenly and unexpectedly aged 35 with no cause found at post-mortem.

ECG during the febrile episode: coved ST elevation with T-wave inversion in leads V1-V3.$stem$,
  'What is the most likely underlying diagnosis?',
  array['Brugada syndrome','sudden cardiac death','coved ST elevation']
),

-- 37. Congenital long QT syndrome
(
  '20000000-0000-0000-0000-000000000037', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$A 15-year-old boy has a witnessed collapse while swimming during a school gala, with spontaneous recovery after a brief period of unresponsiveness. He has had two similar episodes during previous exercise. There is no relevant drug history. His mother had unexplained fainting episodes as a teenager.

Resting ECG: QTc 490 ms, normal QRS morphology.$stem$,
  'What is the most likely underlying diagnosis?',
  array['congenital long QT syndrome','Romano-Ward syndrome']
),

-- 38. Cardiac syncope vs vasovagal syncope vs orthostatic hypotension
(
  '20000000-0000-0000-0000-000000000038', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'advanced',
  $stem$Three patients are seen in the syncope clinic.

Patient 1: a 70-year-old man with known aortic stenosis who collapses suddenly without warning while climbing stairs, sustaining a facial laceration, with immediate full recovery.

Patient 2: an 82-year-old woman on amlodipine and tamsulosin who feels light-headed and greys out within seconds of standing up from her chair, with blood pressure falling from 138/82 mmHg lying to 108/64 mmHg after standing for 2 minutes.

Patient 3: a 19-year-old woman who feels hot, nauseated and sweaty while standing in a crowded queue for several minutes, with narrowing vision before she gently slumps to the floor and recovers within a minute once supine.$stem$,
  'Which patient''s presentation is most characteristic of cardiac syncope?',
  array['syncope','vasovagal','orthostatic hypotension','cardiac syncope']
),

-- 39. Peripheral arterial disease - ABPI interpretation
(
  '20000000-0000-0000-0000-000000000039', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'foundation',
  $stem$A 68-year-old man with a 40 pack-year smoking history reports calf pain on walking that resolves with rest. An ankle-brachial pressure index is measured at 0.55.$stem$,
  'What does this ABPI result indicate?',
  array['peripheral arterial disease','ABPI','claudication']
),

-- 40. Atrial septal defect
(
  '20000000-0000-0000-0000-000000000040', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'foundation',
  $stem$A 24-year-old woman, asymptomatic, is found incidentally to have a soft ejection systolic murmur at the upper left sternal edge on a routine examination. Auscultation reveals a second heart sound that is split, and this splitting does not vary with respiration.$stem$,
  'What is the most likely underlying diagnosis?',
  array['atrial septal defect','fixed split S2']
),

-- 41. AF -> atrial thrombus -> embolic stroke risk stratification
(
  '20000000-0000-0000-0000-000000000041', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'advanced',
  $stem$A 71-year-old woman with hypertension and type 2 diabetes is found to have persistent atrial fibrillation on a routine ECG. She feels well and has never had a stroke. Echocardiography shows normal left ventricular function with no valvular disease.$stem$,
  'What is the mechanism by which her atrial fibrillation places her at risk of stroke, and what determines whether she should be anticoagulated?',
  array['atrial fibrillation','left atrial appendage thrombus','embolic stroke','CHA2DS2-VASc']
),

-- 42. IE -> embolic stroke -> anticoagulation dilemma
(
  '20000000-0000-0000-0000-000000000042', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'advanced',
  $stem$A 45-year-old man with native mitral valve infective endocarditis, confirmed on echocardiogram with a large mobile vegetation, develops sudden left-sided weakness and expressive dysphasia. CT head confirms an acute right middle cerebral artery territory infarct with no haemorrhagic transformation. He is not on any anticoagulant.$stem$,
  'What is the most appropriate approach to anticoagulation in this situation?',
  array['infective endocarditis','embolic stroke','anticoagulation dilemma']
),

-- 43. Coarctation of the aorta
(
  '20000000-0000-0000-0000-000000000043', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'foundation',
  $stem$A 17-year-old girl is found to have hypertension on a routine check. Examination reveals radiofemoral delay and weak, delayed femoral pulses. Chest X-ray shows notching of the inferior rib margins.$stem$,
  'What is the most likely diagnosis?',
  array['coarctation of the aorta','radiofemoral delay','rib notching']
),

-- 44. Marfan syndrome -> aortic root dilatation -> dissection
(
  '20000000-0000-0000-0000-000000000044', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'advanced',
  $stem$A 30-year-old tall man with arachnodactyly and a history of lens dislocation is known to have Marfan syndrome, with an aortic root diameter of 4.8 cm on annual surveillance echocardiography (previously 4.3 cm a year earlier). He has been intermittently non-adherent with his beta-blocker.

He presents with sudden severe tearing chest pain radiating to the back.$stem$,
  'What is the most likely explanation for his current presentation?',
  array['Marfan syndrome','aortic root dilatation','aortic dissection','chain reasoning']
),

-- 45. Cardiac myxoma mimicking IE and mitral stenosis
(
  '20000000-0000-0000-0000-000000000045', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'advanced',
  $stem$A 52-year-old woman presents with fever, weight loss and malaise over several weeks, with breathlessness that seems to vary with her posture, and one episode of a painful, cold, pale toe. She has no risk factors for infective endocarditis. Blood cultures taken on three separate occasions are negative. Inflammatory markers are elevated.

Echocardiogram: a mobile, pedunculated mass attached to the interatrial septum in the left atrium, causing intermittent obstruction of the mitral valve orifice.$stem$,
  'What is the most likely diagnosis?',
  array['cardiac myxoma','embolic phenomena','IE mimic']
),

-- 46. Takotsubo cardiomyopathy
(
  '20000000-0000-0000-0000-000000000046', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$A 67-year-old woman presents with acute central chest pain and breathlessness a few hours after being told of her husband's sudden death.

ECG: ST elevation in the anterior leads. Troponin is significantly elevated.

Coronary angiography: unobstructed coronary arteries. Left ventriculography shows akinesis of the apical segments with hyperkinesis of the base, giving a characteristic ballooned appearance.$stem$,
  'What is the most likely diagnosis?',
  array['takotsubo cardiomyopathy','apical ballooning','stress cardiomyopathy']
),

-- 47. Pacemaker for sick sinus syndrome
(
  '20000000-0000-0000-0000-000000000047', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$An 80-year-old woman has recurrent dizzy spells and two episodes of syncope. Ambulatory ECG monitoring captures alternating periods of sinus bradycardia at 35/min and paroxysmal atrial fibrillation with rapid ventricular rates, corresponding in time to her symptoms.$stem$,
  'What is the most appropriate definitive management?',
  array['sick sinus syndrome','tachy-brady syndrome','pacemaker']
),

-- 48. Mobitz type II second-degree heart block
(
  '20000000-0000-0000-0000-000000000048', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$A 75-year-old man is found on a routine ECG to have intermittently non-conducted P waves, with a constant PR interval in the beats that are conducted. He reports occasional pre-syncope but no syncope.$stem$,
  'What is the most appropriate management?',
  array['Mobitz type II','second-degree heart block','pacemaker']
),

-- 49. Exercise/functional cardiac testing choice
(
  '20000000-0000-0000-0000-000000000049', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$A 56-year-old man with no previous cardiac history presents to a rapid access chest pain clinic with typical exertional chest tightness relieved by rest, in keeping with suspected stable angina.$stem$,
  'What is the most appropriate first-line investigation, according to current NICE guidance on recent-onset chest pain of suspected cardiac origin?',
  array['stable angina','CT coronary angiography','functional cardiac testing']
),

-- 50. IE prophylaxis and modified Duke criteria nuance
(
  '20000000-0000-0000-0000-000000000050', 'mrcp1', '30000000-0000-0000-0000-000000000001',
  'published', 'core',
  $stem$A 60-year-old man with a bioprosthetic aortic valve, replaced 2 years ago, is due to have a routine tooth extraction. He asks his dentist whether he needs antibiotics beforehand to prevent infective endocarditis, having read that this used to be standard practice.$stem$,
  'What is the most appropriate advice, according to current UK (NICE) guidance?',
  array['infective endocarditis','antibiotic prophylaxis','NICE guidance']
)

on conflict (id) do nothing;

-- ---------------------------------------------------------------------------
-- Options
-- ---------------------------------------------------------------------------

insert into question_options (question_id, label, option_text, is_correct, rationale, sort_order) values

-- Q1 Inferior STEMI -> RCA
('20000000-0000-0000-0000-000000000001', 'A', 'Right coronary artery', true,
 $r$Correct. ST elevation in the inferior leads (II, III, aVF) reflects occlusion of the artery supplying the inferior wall, which is the right coronary artery in the great majority (right-dominant) of people.$r$, 1),
('20000000-0000-0000-0000-000000000001', 'B', 'Left anterior descending artery', false,
 $r$Ruled out because the LAD supplies the anterior and septal walls, producing ST elevation in V1-V4, not the inferior leads described here.$r$, 2),
('20000000-0000-0000-0000-000000000001', 'C', 'Left circumflex artery', false,
 $r$Ruled out because the circumflex artery supplies the lateral wall, producing ST elevation in I, aVL and V5-V6, not the inferior leads.$r$, 3),
('20000000-0000-0000-0000-000000000001', 'D', 'First diagonal branch', false,
 $r$Ruled out because diagonal branches of the LAD supply the anterolateral wall, not the inferior territory shown here.$r$, 4),
('20000000-0000-0000-0000-000000000001', 'E', 'Left main stem', false,
 $r$Ruled out because left main stem occlusion typically causes extensive anterior and lateral ST elevation (and often cardiogenic shock), not an isolated inferior pattern.$r$, 5),

-- Q2 Anterior STEMI -> LAD
('20000000-0000-0000-0000-000000000002', 'A', 'Left anterior descending artery', true,
 $r$Correct. ST elevation across V1-V4 reflects loss of blood supply to the anteroseptal wall, which is the territory of the left anterior descending artery.$r$, 1),
('20000000-0000-0000-0000-000000000002', 'B', 'Right coronary artery', false,
 $r$Ruled out because the right coronary artery supplies the inferior wall (and often the AV node), producing ST elevation in II, III and aVF, not V1-V4.$r$, 2),
('20000000-0000-0000-0000-000000000002', 'C', 'Left circumflex artery', false,
 $r$Ruled out because the circumflex supplies the lateral wall, producing ST elevation in I, aVL and V5-V6, not the anteroseptal leads.$r$, 3),
('20000000-0000-0000-0000-000000000002', 'D', 'Posterior descending artery', false,
 $r$Ruled out because the posterior descending artery (usually a branch of the RCA) supplies the inferoposterior wall, associated with posterior changes (tall R waves, ST depression in V1-V3), not anterior ST elevation.$r$, 4),
('20000000-0000-0000-0000-000000000002', 'E', 'Sinoatrial nodal artery', false,
 $r$Ruled out because this small branch supplies the sinoatrial node and its occlusion causes sinus node dysfunction, not a territorial anterior STEMI pattern.$r$, 5),

-- Q3 STEMI primary PCI
('20000000-0000-0000-0000-000000000003', 'A', 'Primary percutaneous coronary intervention', true,
 $r$Correct. When primary PCI can be delivered within 120 minutes of the time fibrinolysis could have been given (and within 12 hours of symptom onset), it is the preferred reperfusion strategy over fibrinolysis, and this patient can reach the cath lab well within that window.$r$, 1),
('20000000-0000-0000-0000-000000000003', 'B', 'Intravenous fibrinolysis', false,
 $r$Ruled out because fibrinolysis is reserved for when primary PCI cannot be delivered within the 120-minute window; here PCI is readily achievable within 60 minutes, making it the preferred strategy.$r$, 2),
('20000000-0000-0000-0000-000000000003', 'C', 'Conservative management with antiplatelet therapy alone', false,
 $r$Ruled out because a STEMI within the reperfusion window requires urgent mechanical or pharmacological reperfusion, not antiplatelet therapy alone.$r$, 3),
('20000000-0000-0000-0000-000000000003', 'D', 'Elective outpatient angiography in 2 weeks', false,
 $r$Ruled out because delaying reperfusion in an acute STEMI significantly increases myocardial loss and mortality; this is a medical emergency requiring immediate intervention.$r$, 4),
('20000000-0000-0000-0000-000000000003', 'E', 'CABG within 24 hours', false,
 $r$Ruled out because emergency CABG is not the first-line reperfusion strategy for an acute STEMI when primary PCI is rapidly available; it is reserved for specific situations such as failed PCI or unsuitable coronary anatomy.$r$, 5),

-- Q4 STEMI fibrinolysis
('20000000-0000-0000-0000-000000000004', 'A', 'Immediate fibrinolysis, with transfer for angiography afterwards', true,
 $r$Correct. When primary PCI cannot be delivered within 120 minutes of the time fibrinolysis could be given, and there is no contraindication, fibrinolysis should be given immediately, followed by transfer for angiography (and rescue PCI if ST elevation fails to resolve).$r$, 1),
('20000000-0000-0000-0000-000000000004', 'B', 'Wait for transfer to the PCI centre before any reperfusion therapy', false,
 $r$Ruled out because a 3-hour transfer delay for primary PCI far exceeds the 120-minute window, during which time-dependent myocardial loss would continue; immediate fibrinolysis is indicated instead.$r$, 2),
('20000000-0000-0000-0000-000000000004', 'C', 'Oral antiplatelet therapy only, with no reperfusion therapy', false,
 $r$Ruled out because this omits definitive reperfusion therapy entirely, which is required to restore flow in an acute STEMI and limit infarct size.$r$, 3),
('20000000-0000-0000-0000-000000000004', 'D', 'Emergency CABG', false,
 $r$Ruled out because emergency CABG is not a practical or standard first-line reperfusion option in the acute STEMI setting; fibrinolysis is the appropriate strategy when timely PCI is unavailable.$r$, 4),
('20000000-0000-0000-0000-000000000004', 'E', 'Beta-blockade alone to reduce myocardial oxygen demand', false,
 $r$Ruled out because beta-blockade does not restore coronary blood flow and is not a substitute for reperfusion therapy in an evolving STEMI.$r$, 5),

-- Q5 HTN ethnicity first-line
('20000000-0000-0000-0000-000000000005', 'A', 'A calcium channel blocker', true,
 $r$Correct. NICE recommends a calcium channel blocker as first-line antihypertensive therapy for patients of Black African or African-Caribbean family origin of any age, as ACE inhibitors are less effective at lowering blood pressure in this group and carry a higher risk of angioedema.$r$, 1),
('20000000-0000-0000-0000-000000000005', 'B', 'An ACE inhibitor', false,
 $r$Ruled out because ACE inhibitors are specifically less effective as first-line monotherapy in patients of Black African or African-Caribbean family origin and are associated with a higher risk of angioedema in this group.$r$, 2),
('20000000-0000-0000-0000-000000000005', 'C', 'A thiazide-like diuretic', false,
 $r$Ruled out because a calcium channel blocker, not a thiazide-like diuretic, is the NICE first-line recommendation for this ethnicity group; a diuretic is used later in the treatment pathway if needed.$r$, 3),
('20000000-0000-0000-0000-000000000005', 'D', 'A beta-blocker', false,
 $r$Ruled out because beta-blockers are not first-line for uncomplicated primary hypertension under current NICE guidance, being reserved for specific indications such as coexisting angina, heart failure or younger patients intolerant of other agents.$r$, 4),
('20000000-0000-0000-0000-000000000005', 'E', 'An angiotensin receptor blocker', false,
 $r$Ruled out because although an ARB may later be preferred over an ACE inhibitor in Black African/Caribbean patients if an "A" drug is needed, a calcium channel blocker remains the first-line choice ahead of either.$r$, 5),

-- Q6 HTN step 2
('20000000-0000-0000-0000-000000000006', 'A', 'Add an ACE inhibitor (or ARB) or a thiazide-like diuretic to the calcium channel blocker', true,
 $r$Correct. When blood pressure is not controlled on maximum-tolerated monotherapy with a calcium channel blocker, NICE step 2 is to add an ACE inhibitor/ARB or a thiazide-like diuretic (dual therapy: A+C or C+D).$r$, 1),
('20000000-0000-0000-0000-000000000006', 'B', 'Switch to an alternative calcium channel blocker', false,
 $r$Ruled out because she is already on a maximum-tolerated dose of a calcium channel blocker; switching within the same class is unlikely to achieve better control and is not the recommended next step.$r$, 2),
('20000000-0000-0000-0000-000000000006', 'C', 'Add a beta-blocker as the second agent', false,
 $r$Ruled out because a beta-blocker is not part of the standard NICE first-choice step 2 combination for uncomplicated hypertension; an ACE inhibitor/ARB or thiazide-like diuretic is added first.$r$, 3),
('20000000-0000-0000-0000-000000000006', 'D', 'Add spironolactone as the second agent', false,
 $r$Ruled out because spironolactone is reserved for step 4 (resistant hypertension) once triple therapy with A+C+D has failed, not as a second agent.$r$, 4),
('20000000-0000-0000-0000-000000000006', 'E', 'Stop pharmacological treatment and rely on lifestyle measures alone', false,
 $r$Ruled out because her blood pressure remains significantly above target despite maximal monotherapy; stopping treatment would leave her at ongoing cardiovascular risk.$r$, 5),

-- Q7 Resistant HTN -> hyperaldosteronism
('20000000-0000-0000-0000-000000000007', 'A', 'Plasma aldosterone-to-renin ratio', true,
 $r$Correct. Resistant hypertension (uncontrolled despite optimised A+C+D therapy) with unprovoked hypokalaemia is a recognised clue to primary hyperaldosteronism (Conn syndrome), which should be screened for with a plasma aldosterone-to-renin ratio.$r$, 1),
('20000000-0000-0000-0000-000000000007', 'B', '24-hour urinary catecholamines', false,
 $r$Ruled out because this screens for phaeochromocytoma, which classically causes paroxysmal hypertension with palpitations, sweating and headache, not the sustained hypertension with hypokalaemia described here.$r$, 2),
('20000000-0000-0000-0000-000000000007', 'C', 'Overnight dexamethasone suppression test', false,
 $r$Ruled out because this screens for Cushing syndrome, which would be expected to also show clinical features such as central obesity, striae and a Cushingoid appearance, not an isolated resistant hypertension and hypokalaemia picture.$r$, 3),
('20000000-0000-0000-0000-000000000007', 'D', 'Renal artery Doppler ultrasound as the first investigation', false,
 $r$Ruled out because although renal artery stenosis is another cause of resistant hypertension, the unprovoked hypokalaemia here is a more specific pointer to primary hyperaldosteronism, which should be screened for first with an aldosterone-to-renin ratio.$r$, 4),
('20000000-0000-0000-0000-000000000007', 'E', 'Short synacthen test', false,
 $r$Ruled out because this test diagnoses adrenal insufficiency, which causes hypotension and hyperkalaemia, the opposite picture to this patient's resistant hypertension and hypokalaemia.$r$, 5),

-- Q8 Stable angina first-line
('20000000-0000-0000-0000-000000000008', 'A', 'A beta-blocker or a calcium channel blocker as monotherapy', true,
 $r$Correct. NICE recommends a beta-blocker or a calcium channel blocker as first-line regular anti-anginal monotherapy, alongside a GTN spray for symptomatic relief of acute episodes.$r$, 1),
('20000000-0000-0000-0000-000000000008', 'B', 'Combined beta-blocker and verapamil', false,
 $r$Ruled out because combining a beta-blocker with a rate-limiting (non-dihydropyridine) calcium channel blocker such as verapamil risks severe bradycardia and heart block, and is not first-line monotherapy in any case.$r$, 2),
('20000000-0000-0000-0000-000000000008', 'C', 'A long-acting nitrate as first-line monotherapy', false,
 $r$Ruled out because long-acting nitrates are used as an add-on or alternative when beta-blockers and calcium channel blockers are insufficient or not tolerated, not as first-line therapy.$r$, 3),
('20000000-0000-0000-0000-000000000008', 'D', 'Ivabradine as first-line monotherapy', false,
 $r$Ruled out because ivabradine is a second-line option for angina when beta-blockers and calcium channel blockers are contraindicated, not tolerated, or insufficient, not a first-line choice.$r$, 4),
('20000000-0000-0000-0000-000000000008', 'E', 'Nicorandil as first-line monotherapy', false,
 $r$Ruled out because nicorandil is also a second-line add-on option in stable angina, not first-line monotherapy.$r$, 5),

-- Q9 HFrEF add MRA
('20000000-0000-0000-0000-000000000009', 'A', 'Add a mineralocorticoid receptor antagonist (e.g. spironolactone)', true,
 $r$Correct. In HFrEF that remains symptomatic despite optimised ACE inhibitor and beta-blocker therapy, an MRA is the recommended second-line add-on, with monitoring of potassium and renal function.$r$, 1),
('20000000-0000-0000-0000-000000000009', 'B', 'Switch ramipril to sacubitril-valsartan', false,
 $r$Ruled out because sacubitril-valsartan is considered when a patient remains symptomatic despite ACE inhibitor, beta-blocker and MRA together; an MRA has not yet been trialled in this patient.$r$, 2),
('20000000-0000-0000-0000-000000000009', 'C', 'Add ivabradine regardless of heart rate or rhythm', false,
 $r$Ruled out because ivabradine requires the patient to be in sinus rhythm with a heart rate of 75/min or above despite maximal beta-blocker dosing; it is not simply added irrespective of these criteria, and MRA is the standard next step first.$r$, 3),
('20000000-0000-0000-0000-000000000009', 'D', 'Stop the beta-blocker and increase the ACE inhibitor dose only', false,
 $r$Ruled out because both ACE inhibitor and beta-blocker are already at target doses and form the foundation of therapy; stopping the beta-blocker would remove proven mortality benefit rather than escalating treatment appropriately.$r$, 4),
('20000000-0000-0000-0000-000000000009', 'E', 'Refer for cardiac resynchronisation therapy at this stage', false,
 $r$Ruled out because CRT requires specific criteria including a broad QRS/bundle branch block pattern, which is not described here, and pharmacological optimisation (including an MRA) is tried before device therapy.$r$, 5),

-- Q10 HFrEF first-line
('20000000-0000-0000-0000-000000000010', 'A', 'An ACE inhibitor and a beta-blocker, both titrated up together', true,
 $r$Correct. NICE recommends starting an ACE inhibitor (or ARB if intolerant) and a beta-blocker licensed for heart failure together as first-line disease-modifying therapy in HFrEF, titrating each up as tolerated.$r$, 1),
('20000000-0000-0000-0000-000000000010', 'B', 'A loop diuretic alone', false,
 $r$Ruled out because a loop diuretic controls congestive symptoms but does not modify disease progression or improve prognosis; it is used alongside, not instead of, first-line disease-modifying therapy.$r$, 2),
('20000000-0000-0000-0000-000000000010', 'C', 'Spironolactone as monotherapy', false,
 $r$Ruled out because an MRA is a second-line add-on used once a patient remains symptomatic on ACE inhibitor and beta-blocker, not first-line monotherapy.$r$, 3),
('20000000-0000-0000-0000-000000000010', 'D', 'Digoxin as first-line therapy', false,
 $r$Ruled out because digoxin has no mortality benefit in HFrEF and is reserved for symptom control, particularly in patients with coexisting atrial fibrillation, not as first-line disease-modifying therapy.$r$, 4),
('20000000-0000-0000-0000-000000000010', 'E', 'Sacubitril-valsartan as first-line therapy', false,
 $r$Ruled out because sacubitril-valsartan is reserved for patients who remain symptomatic despite optimised ACE inhibitor/ARB, beta-blocker and MRA therapy, not as an initial first-line choice.$r$, 5),

-- Q11 HFrEF hydralazine-nitrate
('20000000-0000-0000-0000-000000000011', 'A', 'Hydralazine in combination with a nitrate', true,
 $r$Correct. Hydralazine combined with a nitrate is a recognised additional therapy for HFrEF, particularly for patients of Black African or African-Caribbean origin, and is a reasonable alternative when ACE inhibitors and ARBs are both not tolerated.$r$, 1),
('20000000-0000-0000-0000-000000000011', 'B', 'Restart the same ACE inhibitor at a lower dose', false,
 $r$Ruled out because he has already developed both a cough and worsening renal function on this ACE inhibitor, making rechallenge inappropriate; an alternative strategy is needed.$r$, 2),
('20000000-0000-0000-0000-000000000011', 'C', 'A second attempt with a different ARB', false,
 $r$Ruled out because he has already had angioedema with an ARB, a class effect that carries a high risk of recurrence with another ARB; this class should be avoided going forward.$r$, 3),
('20000000-0000-0000-0000-000000000011', 'D', 'Stop all heart failure therapy given intolerance to two drug classes', false,
 $r$Ruled out because effective alternative disease-modifying options, such as hydralazine-nitrate, exist and should be used rather than abandoning treatment for symptomatic HFrEF.$r$, 4),
('20000000-0000-0000-0000-000000000011', 'E', 'Increase the spironolactone dose beyond the standard target', false,
 $r$Ruled out because this does not address the gap left by his intolerance to renin-angiotensin system blockade, and exceeding standard MRA dosing risks hyperkalaemia without addressing the underlying therapeutic need.$r$, 5),

-- Q12 HFrEF sacubitril-valsartan
('20000000-0000-0000-0000-000000000012', 'A', 'Switch her ACE inhibitor to sacubitril-valsartan', true,
 $r$Correct. Sacubitril-valsartan is recommended by NICE as a replacement for an ACE inhibitor or ARB in patients with HFrEF (EF <=35%) who remain symptomatic despite optimised ACE inhibitor/ARB, beta-blocker and MRA therapy, which describes this patient.$r$, 1),
('20000000-0000-0000-0000-000000000012', 'B', 'Add sacubitril-valsartan on top of her existing ramipril', false,
 $r$Ruled out because sacubitril-valsartan replaces (rather than is added to) the ACE inhibitor, and the two must not be co-prescribed due to the risk of severe angioedema; a washout period is also required when switching from an ACE inhibitor.$r$, 2),
('20000000-0000-0000-0000-000000000012', 'C', 'Continue current therapy unchanged, as she is already on three drug classes', false,
 $r$Ruled out because she remains symptomatic despite optimised triple therapy, which is precisely the scenario in which switching to sacubitril-valsartan is indicated to further improve outcomes.$r$, 3),
('20000000-0000-0000-0000-000000000012', 'D', 'Stop spironolactone and start sacubitril-valsartan instead', false,
 $r$Ruled out because sacubitril-valsartan replaces the ACE inhibitor/ARB component of therapy, not the MRA; spironolactone should be continued alongside it.$r$, 4),
('20000000-0000-0000-0000-000000000012', 'E', 'Refer directly for heart transplantation assessment', false,
 $r$Ruled out because transplantation assessment is reserved for advanced, refractory heart failure once other optimised medical and device therapies have been exhausted, not as the next step here.$r$, 5),

-- Q13 HFrEF ivabradine + CCB interaction
('20000000-0000-0000-0000-000000000013', 'A', 'Ivabradine should not be started until the diltiazem is stopped, due to the risk of excessive bradycardia', true,
 $r$Correct. Diltiazem (and verapamil) are moderate CYP3A4 inhibitors that significantly increase ivabradine plasma levels, and their concurrent use is contraindicated due to the additive risk of severe bradycardia; the diltiazem should be stopped (and an alternative antihypertensive used) before ivabradine is considered.$r$, 1),
('20000000-0000-0000-0000-000000000013', 'B', 'Ivabradine can be started safely alongside diltiazem at a reduced dose', false,
 $r$Ruled out because there is no safe reduced-dose combination; concurrent use of diltiazem with ivabradine is contraindicated altogether due to the risk of profound bradycardia, not simply a dose-adjustment issue.$r$, 2),
('20000000-0000-0000-0000-000000000013', 'C', 'Ivabradine cannot be used in this patient under any circumstances because he is not tachycardic', false,
 $r$Ruled out because his heart rate of 82 bpm does meet the sinus-rhythm, HR >=75 bpm criterion for ivabradine; the barrier here is specifically the interacting drug, not his heart rate.$r$, 3),
('20000000-0000-0000-0000-000000000013', 'D', 'Bisoprolol should be stopped to make way for ivabradine', false,
 $r$Ruled out because ivabradine is added on top of (not instead of) maximally tolerated beta-blocker therapy; stopping the beta-blocker would remove its proven mortality benefit.$r$, 4),
('20000000-0000-0000-0000-000000000013', 'E', 'This interaction is not clinically significant and can be disregarded', false,
 $r$Ruled out because the interaction between non-dihydropyridine calcium channel blockers and ivabradine is well recognised and clinically significant, with a real risk of severe symptomatic bradycardia.$r$, 5),

-- Q14 HFrEF CRT
('20000000-0000-0000-0000-000000000014', 'A', 'Cardiac resynchronisation therapy', true,
 $r$Correct. A reduced ejection fraction (<=35%), persistent symptoms despite optimised medical therapy, sinus rhythm and a broad LBBB QRS (>=150 ms) together meet the criteria for cardiac resynchronisation therapy.$r$, 1),
('20000000-0000-0000-0000-000000000014', 'B', 'Single-chamber ICD without resynchronisation pacing', false,
 $r$Ruled out because a standard single-chamber ICD does not address his ventricular dyssynchrony from the broad LBBB; his QRS morphology and duration specifically indicate benefit from resynchronisation pacing.$r$, 2),
('20000000-0000-0000-0000-000000000014', 'C', 'Permanent single-chamber pacemaker for bradycardia', false,
 $r$Ruled out because there is no bradycardia or heart block described here; the device indication is resynchronisation for dyssynchronous HFrEF, not standard bradycardia pacing.$r$, 3),
('20000000-0000-0000-0000-000000000014', 'D', 'Further up-titration of medical therapy alone, with device therapy deferred indefinitely', false,
 $r$Ruled out because he is already described as being on optimised medical therapy and remains symptomatic; CRT is specifically indicated at this point rather than delaying further.$r$, 4),
('20000000-0000-0000-0000-000000000014', 'E', 'Left ventricular assist device implantation', false,
 $r$Ruled out because an LVAD is reserved for advanced, refractory heart failure (e.g. as a bridge to transplant or destination therapy), not the next step for a patient who has not yet tried CRT.$r$, 5),

-- Q15 Chronic HTN -> LVH -> HFpEF
('20000000-0000-0000-0000-000000000015', 'A', 'Heart failure with preserved ejection fraction secondary to hypertensive heart disease', true,
 $r$Correct. Long-standing hypertension drives concentric left ventricular hypertrophy, which stiffens the ventricle and impairs relaxation (diastolic dysfunction); when this becomes symptomatic despite a preserved ejection fraction, it is termed HFpEF.$r$, 1),
('20000000-0000-0000-0000-000000000015', 'B', 'Heart failure with reduced ejection fraction', false,
 $r$Ruled out because her ejection fraction is preserved at 58%; HFrEF is defined by a significantly reduced ejection fraction, which is not present here.$r$, 2),
('20000000-0000-0000-0000-000000000015', 'C', 'Constrictive pericarditis', false,
 $r$Ruled out because there is no pericardial thickening, calcification or Kussmaul sign described, and the echo findings (concentric LVH, impaired relaxation) point to a myocardial rather than pericardial process.$r$, 3),
('20000000-0000-0000-0000-000000000015', 'D', 'Ischaemic cardiomyopathy', false,
 $r$Ruled out because coronary angiography is unremarkable, excluding significant coronary artery disease as the driver of her presentation.$r$, 4),
('20000000-0000-0000-0000-000000000015', 'E', 'High-output cardiac failure', false,
 $r$Ruled out because there is no cause of a high-output state described (such as severe anaemia, thyrotoxicosis or an arteriovenous fistula); her presentation is explained by longstanding pressure-overload hypertrophy instead.$r$, 5),

-- Q16 VT with adverse signs
('20000000-0000-0000-0000-000000000016', 'A', 'Synchronised DC cardioversion', true,
 $r$Correct. Broad-complex tachycardia with adverse signs (here, hypotension and reduced consciousness) mandates immediate synchronised DC cardioversion, regardless of the presumed rhythm mechanism.$r$, 1),
('20000000-0000-0000-0000-000000000016', 'B', 'IV amiodarone loading with reassessment before considering shock', false,
 $r$Ruled out because pharmacological therapy is the approach for VT without adverse signs; the presence of hypotension and drowsiness here defines an unstable patient who needs immediate electrical cardioversion.$r$, 2),
('20000000-0000-0000-0000-000000000016', 'C', 'IV adenosine', false,
 $r$Ruled out because adenosine is used for regular narrow-complex tachycardias, not broad-complex VT, and does not address this patient's haemodynamic instability.$r$, 3),
('20000000-0000-0000-0000-000000000016', 'D', 'Vagal manoeuvres', false,
 $r$Ruled out because vagal manoeuvres are used for narrow-complex SVT, not broad-complex VT, and are inappropriate first-line management for a haemodynamically unstable patient.$r$, 4),
('20000000-0000-0000-0000-000000000016', 'E', 'Oral beta-blocker', false,
 $r$Ruled out because an oral agent has too slow an onset for this haemodynamically unstable patient, who requires immediate electrical cardioversion.$r$, 5),

-- Q17 VT without adverse signs
('20000000-0000-0000-0000-000000000017', 'A', 'IV amiodarone', true,
 $r$Correct. In a stable patient with sustained VT and no adverse signs, IV amiodarone is the first-line pharmacological treatment.$r$, 1),
('20000000-0000-0000-0000-000000000017', 'B', 'Immediate synchronised DC cardioversion', false,
 $r$Ruled out because cardioversion is reserved for VT with adverse signs; this patient is alert, talking and haemodynamically stable, so pharmacological treatment is tried first.$r$, 2),
('20000000-0000-0000-0000-000000000017', 'C', 'IV adenosine', false,
 $r$Ruled out because adenosine is used to treat and help diagnose regular narrow-complex tachycardias, not broad-complex VT.$r$, 3),
('20000000-0000-0000-0000-000000000017', 'D', 'IV verapamil', false,
 $r$Ruled out because verapamil should be avoided in broad-complex tachycardia of uncertain or ventricular origin, as it can cause haemodynamic collapse if the rhythm is in fact VT.$r$, 4),
('20000000-0000-0000-0000-000000000017', 'E', 'Observation alone with no treatment', false,
 $r$Ruled out because sustained VT carries a risk of haemodynamic deterioration or degeneration into VF and requires active treatment, even in a currently stable patient.$r$, 5),

-- Q18 SVT vagal/adenosine
('20000000-0000-0000-0000-000000000018', 'A', 'Vagal manoeuvres, followed by IV adenosine if unsuccessful', true,
 $r$Correct. In a stable patient with regular narrow-complex tachycardia, vagal manoeuvres (such as the modified Valsalva manoeuvre or carotid sinus massage) are tried first, followed by incremental doses of IV adenosine (6 mg, then 12 mg, then 12 mg) via a large-bore cannula with rapid flush if they fail.$r$, 1),
('20000000-0000-0000-0000-000000000018', 'B', 'Immediate synchronised DC cardioversion', false,
 $r$Ruled out because she is haemodynamically stable; electrical cardioversion is reserved for unstable patients or after pharmacological measures have failed.$r$, 2),
('20000000-0000-0000-0000-000000000018', 'C', 'IV amiodarone as first-line therapy', false,
 $r$Ruled out because amiodarone is not the first-line agent for a regular narrow-complex SVT; vagal manoeuvres and adenosine are tried first.$r$, 3),
('20000000-0000-0000-0000-000000000018', 'D', 'IV digoxin as first-line therapy', false,
 $r$Ruled out because digoxin has a slow onset of action and is not first-line for acute termination of SVT; vagal manoeuvres and adenosine act far more rapidly.$r$, 4),
('20000000-0000-0000-0000-000000000018', 'E', 'IV magnesium sulfate', false,
 $r$Ruled out because IV magnesium is used for Torsades de pointes and certain refractory ventricular arrhythmias, not standard regular narrow-complex SVT.$r$, 5),

-- Q19 SVT asthma -> verapamil
('20000000-0000-0000-0000-000000000019', 'A', 'IV verapamil', true,
 $r$Correct. Adenosine can provoke bronchospasm and is relatively contraindicated in patients with asthma or severe reversible airways disease; IV verapamil is an appropriate alternative for terminating stable regular narrow-complex SVT in this context.$r$, 1),
('20000000-0000-0000-0000-000000000019', 'B', 'IV adenosine at a reduced dose', false,
 $r$Ruled out because there is no safe reduced dose of adenosine that avoids the risk of bronchospasm in a patient with significant asthma; the drug should be avoided altogether in this context, not simply dose-reduced.$r$, 2),
('20000000-0000-0000-0000-000000000019', 'C', 'Immediate synchronised DC cardioversion', false,
 $r$Ruled out because she remains haemodynamically stable; pharmacological options should be tried before considering electrical cardioversion.$r$, 3),
('20000000-0000-0000-0000-000000000019', 'D', 'IV salbutamol', false,
 $r$Ruled out because salbutamol treats bronchospasm, not supraventricular tachycardia, and does not address the arrhythmia itself.$r$, 4),
('20000000-0000-0000-0000-000000000019', 'E', 'Nebulised ipratropium bromide', false,
 $r$Ruled out because this is a bronchodilator with no role in terminating an SVT.$r$, 5),

-- Q20 VF shockable
('20000000-0000-0000-0000-000000000020', 'A', 'Immediate CPR and unsynchronised defibrillation', true,
 $r$Correct. Ventricular fibrillation is a shockable rhythm in cardiac arrest; management is immediate high-quality CPR with defibrillation as soon as a shock is available, continuing the cycle with adrenaline and amiodarone as per the shockable arm of the algorithm if the rhythm persists.$r$, 1),
('20000000-0000-0000-0000-000000000020', 'B', 'CPR and adrenaline only, without defibrillation', false,
 $r$Ruled out because VF is a shockable rhythm and defibrillation is the definitive treatment; adrenaline alone, without attempting defibrillation, would omit the single most effective intervention for this rhythm.$r$, 2),
('20000000-0000-0000-0000-000000000020', 'C', 'Synchronised cardioversion', false,
 $r$Ruled out because synchronised cardioversion requires a discernible R wave to synchronise to, which is not possible in the chaotic, disorganised rhythm of VF; an unsynchronised shock is required instead.$r$, 3),
('20000000-0000-0000-0000-000000000020', 'D', 'IV atropine', false,
 $r$Ruled out because atropine is used for symptomatic bradycardia, not for a shockable rhythm such as VF.$r$, 4),
('20000000-0000-0000-0000-000000000020', 'E', 'Immediate transcutaneous pacing', false,
 $r$Ruled out because pacing is used for bradyarrhythmias, not for VF, which requires defibrillation.$r$, 5),

-- Q21 PEA non-shockable
('20000000-0000-0000-0000-000000000021', 'A', 'Continue CPR with early IV adrenaline and identify/treat reversible causes', true,
 $r$Correct. An organised rhythm with no palpable pulse is pulseless electrical activity, a non-shockable rhythm; management is high-quality CPR with adrenaline given as soon as possible and every 3-5 minutes, alongside a systematic search for reversible causes (the 4 Hs and 4 Ts).$r$, 1),
('20000000-0000-0000-0000-000000000021', 'B', 'Immediate defibrillation', false,
 $r$Ruled out because PEA is a non-shockable rhythm; defibrillation has no role here and would delay the appropriate CPR and adrenaline-based management.$r$, 2),
('20000000-0000-0000-0000-000000000021', 'C', 'Synchronised cardioversion', false,
 $r$Ruled out because cardioversion is used to treat unstable tachyarrhythmias with a pulse; this patient is in cardiac arrest with no pulse, requiring CPR rather than cardioversion.$r$, 3),
('20000000-0000-0000-0000-000000000021', 'D', 'Withhold adrenaline until a shockable rhythm develops', false,
 $r$Ruled out because adrenaline is given as soon as possible in the non-shockable arm of the algorithm, not withheld pending a rhythm change.$r$, 4),
('20000000-0000-0000-0000-000000000021', 'E', 'IV atropine as the priority intervention', false,
 $r$Ruled out because atropine has no established role in the current adult cardiac arrest algorithm for PEA; the priorities are CPR, adrenaline and treating reversible causes.$r$, 5),

-- Q22 Bradycardia adverse signs
('20000000-0000-0000-0000-000000000022', 'A', 'IV atropine 500 micrograms, repeated if needed', true,
 $r$Correct. Bradycardia with adverse signs (here, hypotension and reduced consciousness) is treated first-line with IV atropine 500 micrograms, which can be repeated to a maximum dose, with transcutaneous pacing considered if this fails.$r$, 1),
('20000000-0000-0000-0000-000000000022', 'B', 'Immediate transvenous pacing before any drug treatment', false,
 $r$Ruled out because atropine is tried first as the immediate first-line treatment; transvenous pacing (or transcutaneous pacing as an interim measure) is reserved for when atropine fails or is ineffective.$r$, 2),
('20000000-0000-0000-0000-000000000022', 'C', 'IV adenosine', false,
 $r$Ruled out because adenosine is used to treat tachyarrhythmias, not bradycardia; it would not address this patient's slow heart rate.$r$, 3),
('20000000-0000-0000-0000-000000000022', 'D', 'IV beta-blocker', false,
 $r$Ruled out because a beta-blocker would further slow the heart rate and worsen his haemodynamic compromise.$r$, 4),
('20000000-0000-0000-0000-000000000022', 'E', 'Synchronised DC cardioversion', false,
 $r$Ruled out because cardioversion treats tachyarrhythmias, not bradycardia; it has no role in this presentation.$r$, 5),

-- Q23 Atrial flutter
('20000000-0000-0000-0000-000000000023', 'A', 'Atrial flutter', true,
 $r$Correct. A regular tachycardia with a sawtooth pattern of atrial activity at around 300/min and a fixed conduction ratio to the ventricles (here 2:1, giving a ventricular rate of 150/min) is characteristic of atrial flutter.$r$, 1),
('20000000-0000-0000-0000-000000000023', 'B', 'Atrial fibrillation', false,
 $r$Ruled out because AF produces an irregularly irregular rhythm with absent, chaotic atrial activity, not the regular sawtooth flutter waves and fixed ventricular response described here.$r$, 2),
('20000000-0000-0000-0000-000000000023', 'C', 'Sinus tachycardia', false,
 $r$Ruled out because sinus tachycardia shows normal P waves before each QRS at a physiological rate range, not a sawtooth pattern at 300/min with 2:1 block.$r$, 3),
('20000000-0000-0000-0000-000000000023', 'D', 'AV nodal re-entrant tachycardia', false,
 $r$Ruled out because AVNRT typically shows a regular narrow-complex tachycardia without visible P waves (or retrograde P waves), not the classic sawtooth flutter pattern.$r$, 4),
('20000000-0000-0000-0000-000000000023', 'E', 'Multifocal atrial tachycardia', false,
 $r$Ruled out because this shows an irregular rhythm with at least three distinct P-wave morphologies, not the regular sawtooth pattern with fixed block described here.$r$, 5),

-- Q24 Mitral stenosis
('20000000-0000-0000-0000-000000000024', 'A', 'Mitral stenosis', true,
 $r$Correct. A background suggestive of untreated rheumatic disease, malar flush, a tapping apex beat, loud S1, opening snap and a low-pitched mid-diastolic murmur accentuated in the left lateral position, with associated atrial fibrillation, is classic for rheumatic mitral stenosis.$r$, 1),
('20000000-0000-0000-0000-000000000024', 'B', 'Mitral regurgitation', false,
 $r$Ruled out because MR produces a pansystolic murmur radiating to the axilla, not a mid-diastolic murmur with an opening snap.$r$, 2),
('20000000-0000-0000-0000-000000000024', 'C', 'Aortic stenosis', false,
 $r$Ruled out because AS produces an ejection systolic murmur radiating to the carotids with a slow-rising pulse, not a mid-diastolic apical murmur with malar flush.$r$, 3),
('20000000-0000-0000-0000-000000000024', 'D', 'Tricuspid stenosis', false,
 $r$Ruled out because tricuspid stenosis is rare and would produce a diastolic murmur at the left sternal edge that varies with respiration, not the apical findings with malar flush described here, which fit mitral valve pathology.$r$, 4),
('20000000-0000-0000-0000-000000000024', 'E', 'Left atrial myxoma', false,
 $r$Ruled out because although a myxoma can mimic mitral stenosis with a "tumour plop," this history of a region with high rheumatic disease burden and the classic examination triad make rheumatic mitral stenosis far more likely.$r$, 5),

-- Q25 Aortic regurgitation
('20000000-0000-0000-0000-000000000025', 'A', 'Aortic regurgitation', true,
 $r$Correct. A collapsing pulse, wide pulse pressure and an early diastolic murmur at the left sternal edge, accentuated by leaning forward in expiration, are the classic findings of aortic regurgitation.$r$, 1),
('20000000-0000-0000-0000-000000000025', 'B', 'Aortic stenosis', false,
 $r$Ruled out because AS produces a slow-rising, low-volume pulse with a narrow pulse pressure and an ejection systolic (not early diastolic) murmur, the opposite pulse character to that described here.$r$, 2),
('20000000-0000-0000-0000-000000000025', 'C', 'Mitral regurgitation', false,
 $r$Ruled out because MR produces a pansystolic murmur at the apex radiating to the axilla, not an early diastolic murmur at the left sternal edge with a collapsing pulse.$r$, 3),
('20000000-0000-0000-0000-000000000025', 'D', 'Patent ductus arteriosus', false,
 $r$Ruled out because a PDA produces a continuous "machinery" murmur through systole and diastole, not an isolated early diastolic murmur.$r$, 4),
('20000000-0000-0000-0000-000000000025', 'E', 'Pulmonary regurgitation', false,
 $r$Ruled out because pulmonary regurgitation causes an early diastolic murmur at the left upper sternal edge without the collapsing pulse and wide pulse pressure seen with aortic run-off, and is far less common than aortic regurgitation.$r$, 5),

-- Q26 Tricuspid regurgitation
('20000000-0000-0000-0000-000000000026', 'A', 'Tricuspid regurgitation', true,
 $r$Correct. A pansystolic murmur at the left sternal edge that increases on inspiration (Carvallo sign), giant V waves and pulsatile hepatomegaly are the classic findings of tricuspid regurgitation, here in a patient with a recognised risk factor for right-sided endocarditis (IV drug use).$r$, 1),
('20000000-0000-0000-0000-000000000026', 'B', 'Mitral regurgitation', false,
 $r$Ruled out because MR produces a pansystolic murmur at the apex radiating to the axilla, and does not classically increase with inspiration or cause pulsatile hepatomegaly.$r$, 2),
('20000000-0000-0000-0000-000000000026', 'C', 'Constrictive pericarditis', false,
 $r$Ruled out because this causes a raised JVP and hepatomegaly but not a pansystolic murmur or giant V waves; the murmur here specifically localises to the tricuspid valve.$r$, 3),
('20000000-0000-0000-0000-000000000026', 'D', 'Budd-Chiari syndrome', false,
 $r$Ruled out because this causes hepatomegaly and ascites from hepatic vein obstruction, but does not produce a cardiac murmur or giant V waves in the JVP.$r$, 4),
('20000000-0000-0000-0000-000000000026', 'E', 'Right ventricular infarction', false,
 $r$Ruled out because this typically presents acutely with hypotension and a raised JVP following an inferior MI, not a chronic pansystolic murmur with giant V waves.$r$, 5),

-- Q27 Acute pericarditis
('20000000-0000-0000-0000-000000000027', 'A', 'Acute pericarditis', true,
 $r$Correct. Sharp pleuritic chest pain relieved by sitting forward, following a viral illness, with widespread saddle-shaped ST elevation and PR depression without reciprocal changes, is classic for acute pericarditis.$r$, 1),
('20000000-0000-0000-0000-000000000027', 'B', 'Acute STEMI', false,
 $r$Ruled out because STEMI produces territorial, convex ST elevation with reciprocal ST depression, not the diffuse concave elevation and PR depression seen here.$r$, 2),
('20000000-0000-0000-0000-000000000027', 'C', 'Pulmonary embolism', false,
 $r$Ruled out because PE typically causes sinus tachycardia or right heart strain patterns on ECG, not widespread saddle-shaped ST elevation with PR depression.$r$, 3),
('20000000-0000-0000-0000-000000000027', 'D', 'Costochondritis', false,
 $r$Ruled out because costochondritis causes reproducible chest wall tenderness without any ECG abnormality, and would not explain the widespread ST/PR changes described.$r$, 4),
('20000000-0000-0000-0000-000000000027', 'E', 'Aortic dissection', false,
 $r$Ruled out because dissection classically causes sudden tearing pain radiating to the back with pulse or blood pressure asymmetry, not pleuritic pain relieved by posture with diffuse ST elevation.$r$, 5),

-- Q28 Pericarditis vs MI ECG
('20000000-0000-0000-0000-000000000028', 'A', 'Diffuse, concave ST elevation across multiple territories with PR depression and no reciprocal changes', true,
 $r$Correct. Pericarditis characteristically produces widespread, concave ("saddle-shaped") ST elevation that crosses multiple coronary territories simultaneously, accompanied by PR depression, and critically lacks the reciprocal ST depression seen in a territorial STEMI.$r$, 1),
('20000000-0000-0000-0000-000000000028', 'B', 'The presence of any ST elevation at all', false,
 $r$Ruled out because ST elevation itself is present in both conditions; it is the morphology, distribution and accompanying reciprocal changes that distinguish pericarditis from STEMI, not the mere presence of elevation.$r$, 2),
('20000000-0000-0000-0000-000000000028', 'C', 'A elevated troponin level', false,
 $r$Ruled out because troponin can be mildly elevated in pericarditis (especially with associated myocarditis) as well as in STEMI, so it does not reliably discriminate between the two on its own.$r$, 3),
('20000000-0000-0000-0000-000000000028', 'D', 'The presence of chest pain', false,
 $r$Ruled out because chest pain occurs in both conditions and does not by itself distinguish the underlying cause; the ECG pattern is the more specific discriminator here.$r$, 4),
('20000000-0000-0000-0000-000000000028', 'E', 'A rapid heart rate', false,
 $r$Ruled out because tachycardia is a non-specific finding that can occur in either condition (from pain, inflammation or haemodynamic compromise) and does not distinguish pericarditis from STEMI.$r$, 5),

-- Q29 Myocarditis -> DCM
('20000000-0000-0000-0000-000000000029', 'A', 'Progression from acute viral myocarditis to dilated cardiomyopathy', true,
 $r$Correct. Viral myocarditis can, in a subset of patients, progress over weeks to months to an inflammatory dilated cardiomyopathy, as ongoing myocardial inflammation and injury lead to progressive ventricular dilatation and impaired systolic function, explaining his new heart failure presentation.$r$, 1),
('20000000-0000-0000-0000-000000000029', 'B', 'A new, unrelated ischaemic cardiomyopathy', false,
 $r$Ruled out because his coronary angiogram was normal at the time of his myocarditis diagnosis, making a new coronary event an unlikely explanation for his rapid deterioration; the clinical course fits progression of his known myocarditis instead.$r$, 2),
('20000000-0000-0000-0000-000000000029', 'C', 'Constrictive pericarditis', false,
 $r$Ruled out because constrictive pericarditis produces normal or near-normal wall thickness with impaired filling and a septal bounce, not a globally dilated, thin-walled, poorly contractile ventricle.$r$, 3),
('20000000-0000-0000-0000-000000000029', 'D', 'Cardiac amyloidosis', false,
 $r$Ruled out because amyloidosis produces a restrictive pattern with thickened (not dilated, thin-walled) ventricular walls, which does not match this echocardiographic picture.$r$, 4),
('20000000-0000-0000-0000-000000000029', 'E', 'Recurrence of the same acute viral illness', false,
 $r$Ruled out because his current presentation is one of progressive heart failure from ventricular dilatation and impaired systolic function over 8 weeks, not a recurrent acute infective illness with fever and myalgia.$r$, 5),

-- Q30 Cardiac amyloidosis
('20000000-0000-0000-0000-000000000030', 'A', 'Cardiac amyloidosis', true,
 $r$Correct. Thickened ventricular walls with a granular "sparkling" appearance and preserved ejection fraction but impaired filling, combined with surprisingly low-voltage QRS complexes (a voltage-thickness discordance) and a history of bilateral carpal tunnel syndrome, is a classic combination for cardiac amyloidosis.$r$, 1),
('20000000-0000-0000-0000-000000000030', 'B', 'Hypertensive heart disease with left ventricular hypertrophy', false,
 $r$Ruled out because hypertensive LVH typically produces high-voltage QRS complexes proportional to the wall thickness, not the low-voltage discordance seen here, which is a specific pointer towards an infiltrative process.$r$, 2),
('20000000-0000-0000-0000-000000000030', 'C', 'Hypertrophic obstructive cardiomyopathy', false,
 $r$Ruled out because HOCM classically shows asymmetric septal hypertrophy with systolic anterior motion of the mitral valve and high-voltage ECG changes, not the symmetric thickening, granular texture and low-voltage discordance described here.$r$, 3),
('20000000-0000-0000-0000-000000000030', 'D', 'Constrictive pericarditis', false,
 $r$Ruled out because constrictive pericarditis shows normal ventricular wall thickness with pericardial thickening/calcification, not the thickened myocardium and low-voltage ECG discordance seen here.$r$, 4),
('20000000-0000-0000-0000-000000000030', 'E', 'Dilated cardiomyopathy', false,
 $r$Ruled out because DCM shows a dilated, thin-walled, poorly contractile ventricle with reduced ejection fraction, the opposite of the thickened-wall, preserved-ejection-fraction restrictive picture described here.$r$, 5),

-- Q31 Post-MI secondary prevention
('20000000-0000-0000-0000-000000000031', 'A', 'Dual antiplatelet therapy, a high-intensity statin, an ACE inhibitor and a beta-blocker', true,
 $r$Correct. Standard post-MI secondary prevention comprises dual antiplatelet therapy (aspirin plus a P2Y12 inhibitor, typically for up to 12 months), a high-intensity statin, an ACE inhibitor and a beta-blocker, alongside lifestyle modification and cardiac rehabilitation.$r$, 1),
('20000000-0000-0000-0000-000000000031', 'B', 'Aspirin monotherapy and a low-intensity statin only', false,
 $r$Ruled out because this omits the second antiplatelet agent, the ACE inhibitor and the beta-blocker, and uses a lower-intensity statin than the high-intensity dosing recommended post-MI.$r$, 2),
('20000000-0000-0000-0000-000000000031', 'C', 'Warfarin, a statin and a beta-blocker', false,
 $r$Ruled out because warfarin has no routine role in standard post-MI secondary prevention (unless there is a separate indication such as AF or LV thrombus); dual antiplatelet therapy is used instead.$r$, 3),
('20000000-0000-0000-0000-000000000031', 'D', 'A calcium channel blocker, a statin and aspirin only', false,
 $r$Ruled out because this omits the second antiplatelet agent, the ACE inhibitor and the beta-blocker, which are core components of standard secondary prevention; a calcium channel blocker is not part of this standard regimen.$r$, 4),
('20000000-0000-0000-0000-000000000031', 'E', 'Lifestyle advice alone, with no pharmacological therapy', false,
 $r$Ruled out because pharmacological secondary prevention has a well-established mortality benefit after MI and should be combined with, not replaced by, lifestyle advice.$r$, 5),

-- Q32 Statin monitoring
('20000000-0000-0000-0000-000000000032', 'A', 'Before starting treatment, then at 3 months, then at 12 months', true,
 $r$Correct. NICE recommends checking liver function before starting a statin, then at 3 months and again at 12 months, stopping or reducing the dose if transaminases rise persistently above three times the upper limit of normal.$r$, 1),
('20000000-0000-0000-0000-000000000032', 'B', 'Only once, before starting treatment, with no further monitoring', false,
 $r$Ruled out because this omits the recommended follow-up checks at 3 and 12 months, which are needed to detect statin-induced hepatotoxicity that can develop after initiation.$r$, 2),
('20000000-0000-0000-0000-000000000032', 'C', 'Weekly for the first month only', false,
 $r$Ruled out because this is far more frequent than recommended and does not match the standard NICE schedule of baseline, 3-month and 12-month checks.$r$, 3),
('20000000-0000-0000-0000-000000000032', 'D', 'Only if the patient develops symptoms of liver disease', false,
 $r$Ruled out because statin-induced transaminase elevation is often asymptomatic, which is why scheduled monitoring at defined intervals is recommended rather than waiting for symptoms.$r$, 4),
('20000000-0000-0000-0000-000000000032', 'E', 'Annually only, starting one year after treatment begins', false,
 $r$Ruled out because this misses the early baseline and 3-month checks, which are important for detecting hepatotoxicity that can occur soon after starting a statin.$r$, 5),

-- Q33 Hypothyroidism -> statin myopathy -> rhabdomyolysis
('20000000-0000-0000-0000-000000000033', 'A', 'Undiagnosed hypothyroidism has increased her susceptibility to statin-induced myopathy, precipitating rhabdomyolysis', true,
 $r$Correct. Hypothyroidism independently causes myopathy and is a recognised risk factor that increases susceptibility to statin-induced myopathy; in an undiagnosed hypothyroid patient started on a statin, this combination can precipitate severe myopathy progressing to rhabdomyolysis, reflected by the markedly raised CK.$r$, 1),
('20000000-0000-0000-0000-000000000033', 'B', 'Simple statin-induced myalgia, unrelated to her thyroid status', false,
 $r$Ruled out because simple statin myalgia does not typically cause a CK of this magnitude with dark urine (suggesting myoglobinuria); the coexisting untreated hypothyroidism is a specific, relevant contributing factor that should not be dismissed as unrelated.$r$, 2),
('20000000-0000-0000-0000-000000000033', 'C', 'An unrelated inflammatory myositis', false,
 $r$Ruled out because there is a clear temporal link to starting a statin in the context of previously undiagnosed hypothyroidism, a well-recognised combination for precipitating myopathy, making this a more likely explanation than a coincidental new inflammatory process.$r$, 3),
('20000000-0000-0000-0000-000000000033', 'D', 'Hypothyroid myopathy alone, with no contribution from the statin', false,
 $r$Ruled out because although hypothyroidism alone can cause myopathy, the severity here (markedly elevated CK with myoglobinuria) shortly after starting a statin points to an additive effect between the two, not hypothyroidism in isolation.$r$, 4),
('20000000-0000-0000-0000-000000000033', 'E', 'Statin-induced hepatotoxicity', false,
 $r$Ruled out because the clinical and biochemical picture (severe myalgia, weakness, markedly raised CK, dark urine) points to muscle injury (rhabdomyolysis), not liver injury.$r$, 5),

-- Q34 Hyperkalaemia ECG
('20000000-0000-0000-0000-000000000034', 'A', 'IV calcium gluconate', true,
 $r$Correct. In severe hyperkalaemia with ECG changes, IV calcium gluconate is given first to stabilise the cardiac membrane and reduce the risk of a fatal arrhythmia, before measures to shift and remove potassium.$r$, 1),
('20000000-0000-0000-0000-000000000034', 'B', 'Insulin and dextrose infusion as the first step', false,
 $r$Ruled out because although insulin-dextrose is an important treatment to shift potassium intracellularly, calcium gluconate takes priority first specifically to protect the myocardium from the immediate arrhythmic risk shown by these ECG changes.$r$, 2),
('20000000-0000-0000-0000-000000000034', 'C', 'Oral calcium resonium as the first step', false,
 $r$Ruled out because calcium resonium works slowly over hours to days and has no role in the immediate stabilisation of a patient with ECG changes of hyperkalaemia.$r$, 3),
('20000000-0000-0000-0000-000000000034', 'D', 'IV potassium chloride', false,
 $r$Ruled out because giving additional potassium would dangerously worsen his already severe hyperkalaemia.$r$, 4),
('20000000-0000-0000-0000-000000000034', 'E', 'Emergency haemodialysis as the very first step, before any other treatment', false,
 $r$Ruled out because although dialysis may ultimately be needed to definitively remove potassium, immediate cardiac membrane stabilisation with calcium gluconate is required first while dialysis is arranged.$r$, 5),

-- Q35 ACEi+spiro+AKI -> hyperK -> arrhythmia
('20000000-0000-0000-0000-000000000035', 'A', 'Volume depletion from vomiting and diarrhoea caused acute kidney injury, which impaired excretion of potassium retained by his ACE inhibitor and spironolactone, precipitating severe hyperkalaemia and a hyperkalaemic ventricular arrhythmia', true,
 $r$Correct. Both his ACE inhibitor and spironolactone reduce renal potassium excretion; his gastroenteritis caused volume depletion and acute kidney injury, sharply reducing his ability to excrete potassium at a time when both drugs were still being taken, leading to severe hyperkalaemia, which in turn destabilises the myocardium and produces the broad, bizarre arrhythmia seen on his ECG.$r$, 1),
('20000000-0000-0000-0000-000000000035', 'B', 'A primary cardiac arrhythmia unrelated to his electrolytes or renal function', false,
 $r$Ruled out because his markedly deranged potassium and renal function, in the specific context of continued ACE inhibitor and spironolactone use during a volume-depleting illness, provide a clear and well-recognised mechanistic explanation for his arrhythmia rather than it being unrelated.$r$, 2),
('20000000-0000-0000-0000-000000000035', 'C', 'Digoxin toxicity', false,
 $r$Ruled out because there is no mention of digoxin in his drug history; his presentation is fully explained by the potassium-retaining effect of his ACE inhibitor and spironolactone combined with AKI.$r$, 3),
('20000000-0000-0000-0000-000000000035', 'D', 'Hypokalaemia from diarrhoea and vomiting outweighing the potassium-retaining drugs', false,
 $r$Ruled out because his measured potassium is markedly elevated (7.2 mmol/L), not low; although gastroenteritis can itself cause potassium loss, here it is the resulting AKI (reducing renal excretion while his potassium-retaining drugs continued) that has driven severe hyperkalaemia.$r$, 4),
('20000000-0000-0000-0000-000000000035', 'E', 'A new myocardial infarction as the primary event', false,
 $r$Ruled out because there is no chest pain history or ischaemic ECG pattern described, and the ECG findings (tented T waves, wide QRS, bizarre broad rhythm) are typical of severe hyperkalaemia rather than an acute coronary event.$r$, 5),

-- Q36 Brugada syndrome
('20000000-0000-0000-0000-000000000036', 'A', 'Brugada syndrome', true,
 $r$Correct. Coved ST elevation with T-wave inversion in V1-V3, unmasked or worsened by fever, in a patient with a family history of unexplained sudden death, is classic for Brugada syndrome, an inherited sodium channelopathy predisposing to ventricular fibrillation.$r$, 1),
('20000000-0000-0000-0000-000000000036', 'B', 'Acute anteroseptal STEMI', false,
 $r$Ruled out because the coved ST elevation pattern here is unmasked by fever in a young patient with a strong family history of sudden death rather than being an evolving ischaemic infarct, and typically resolves once the fever settles, unlike a true STEMI.$r$, 2),
('20000000-0000-0000-0000-000000000036', 'C', 'Acute pericarditis', false,
 $r$Ruled out because pericarditis causes diffuse, saddle-shaped ST elevation with PR depression across multiple territories, not the localised coved morphology confined to V1-V3 seen here.$r$, 3),
('20000000-0000-0000-0000-000000000036', 'D', 'Arrhythmogenic right ventricular cardiomyopathy', false,
 $r$Ruled out because ARVC classically shows epsilon waves and T-wave inversion in the right precordial leads with structural right ventricular abnormalities on imaging, not the specific coved ST elevation pattern of Brugada syndrome.$r$, 4),
('20000000-0000-0000-0000-000000000036', 'E', 'Hyperkalaemia', false,
 $r$Ruled out because hyperkalaemia produces tall tented T waves and QRS widening, not the coved ST elevation and T-wave inversion confined to V1-V3 seen here, and there is no biochemical evidence of hyperkalaemia given.$r$, 5),

-- Q37 Congenital long QT
('20000000-0000-0000-0000-000000000037', 'A', 'Congenital long QT syndrome (Romano-Ward syndrome)', true,
 $r$Correct. Recurrent exertional syncope (classically triggered by swimming), a prolonged QTc, and a family history of unexplained fainting episodes are characteristic of congenital long QT syndrome, most commonly the autosomal dominant Romano-Ward form.$r$, 1),
('20000000-0000-0000-0000-000000000037', 'B', 'Drug-induced long QT syndrome', false,
 $r$Ruled out because there is no relevant drug history described; the recurrent exertional pattern, swimming trigger and family history point to an inherited (congenital), not acquired, cause.$r$, 2),
('20000000-0000-0000-0000-000000000037', 'C', 'Vasovagal syncope', false,
 $r$Ruled out because vasovagal syncope is not specifically triggered by exercise/swimming and would not be associated with a prolonged QTc on ECG or a family history of similar fainting; the QT prolongation here points to a cardiac arrhythmic cause.$r$, 3),
('20000000-0000-0000-0000-000000000037', 'D', 'Exercise-induced asthma', false,
 $r$Ruled out because this would present with wheeze and breathlessness during exertion, not collapse with a prolonged QTc on ECG.$r$, 4),
('20000000-0000-0000-0000-000000000037', 'E', 'Jervell-Lange-Nielsen syndrome', false,
 $r$Ruled out because this is the autosomal recessive form of congenital long QT syndrome specifically associated with congenital sensorineural deafness, which is not mentioned in this vignette; the more likely diagnosis given the family history pattern is the autosomal dominant Romano-Ward form.$r$, 5),

-- Q38 Syncope differentiation
('20000000-0000-0000-0000-000000000038', 'A', 'Patient 1', true,
 $r$Correct. Sudden, exertional collapse without warning or prodrome, in a patient with known structural heart disease (aortic stenosis), causing injury from an unbroken fall, is the classic pattern of cardiac syncope, reflecting a sudden drop in cardiac output during exertion when demand is highest.$r$, 1),
('20000000-0000-0000-0000-000000000038', 'B', 'Patient 2', false,
 $r$Ruled out because her symptoms occur specifically on standing with a measured postural drop in blood pressure, which is the defining pattern of orthostatic hypotension (likely contributed to by her amlodipine and tamsulosin), not cardiac syncope.$r$, 2),
('20000000-0000-0000-0000-000000000038', 'C', 'Patient 3', false,
 $r$Ruled out because a preceding prodrome of heat, nausea and sweating with a gradual slump while standing in a triggering situation is the classic pattern of vasovagal (reflex) syncope, not cardiac syncope.$r$, 3),
('20000000-0000-0000-0000-000000000038', 'D', 'All three patients equally', false,
 $r$Ruled out because each patient's history has distinguishing features (a structural cardiac lesion with exertional collapse; a clear postural blood pressure drop; a vasovagal prodrome and trigger) that allow them to be differentiated rather than treated as indistinguishable.$r$, 4),
('20000000-0000-0000-0000-000000000038', 'E', 'None of the three patients, as further tests are required before any pattern can be recognised', false,
 $r$Ruled out because the history alone in these vignettes provides classic, recognisable discriminating features for each type of syncope, even before further investigation is undertaken.$r$, 5),

-- Q39 PAD ABPI
('20000000-0000-0000-0000-000000000039', 'A', 'Peripheral arterial disease', true,
 $r$Correct. An ABPI of 0.55 falls below the normal range (0.9-1.3) and indicates significant peripheral arterial disease, consistent with his history of intermittent claudication.$r$, 1),
('20000000-0000-0000-0000-000000000039', 'B', 'A normal result, excluding peripheral arterial disease', false,
 $r$Ruled out because a normal ABPI is 0.9-1.3; a value of 0.55 is well below this range and is diagnostic of significant arterial disease, not a normal result.$r$, 2),
('20000000-0000-0000-0000-000000000039', 'C', 'Venous insufficiency', false,
 $r$Ruled out because ABPI specifically assesses arterial, not venous, blood flow; a low ABPI points to arterial disease, and the exertional calf pain relieved by rest is classic for arterial claudication rather than venous disease.$r$, 3),
('20000000-0000-0000-0000-000000000039', 'D', 'Arterial calcification causing a falsely elevated reading', false,
 $r$Ruled out because calcified, non-compressible vessels cause a falsely raised (not lowered) ABPI, typically above 1.3; his low reading of 0.55 is a genuine finding of significant arterial disease.$r$, 4),
('20000000-0000-0000-0000-000000000039', 'E', 'Critical limb ischaemia requiring emergency amputation', false,
 $r$Ruled out because critical limb ischaemia is characterised by rest pain, ulceration or gangrene with an ABPI typically below 0.5, and there is no such history here; his presentation of exertional claudication with an ABPI of 0.55 fits significant but non-critical PAD.$r$, 5),

-- Q40 ASD
('20000000-0000-0000-0000-000000000040', 'A', 'Atrial septal defect', true,
 $r$Correct. A fixed splitting of the second heart sound that does not vary with respiration, together with an ejection systolic (pulmonary flow) murmur at the upper left sternal edge, is the classic finding of an atrial septal defect, caused by chronically increased right-sided volume and flow.$r$, 1),
('20000000-0000-0000-0000-000000000040', 'B', 'Ventricular septal defect', false,
 $r$Ruled out because a VSD classically produces a harsh pansystolic murmur at the left lower sternal edge, not an ejection systolic murmur with fixed splitting of S2.$r$, 2),
('20000000-0000-0000-0000-000000000040', 'C', 'Patent ductus arteriosus', false,
 $r$Ruled out because a PDA produces a continuous "machinery" murmur, not an ejection systolic murmur with fixed splitting of the second heart sound.$r$, 3),
('20000000-0000-0000-0000-000000000040', 'D', 'Physiological splitting of the second heart sound', false,
 $r$Ruled out because physiological splitting of S2 varies with respiration (widening on inspiration), whereas the splitting described here is fixed and does not vary, pointing to an underlying structural defect.$r$, 4),
('20000000-0000-0000-0000-000000000040', 'E', 'Pulmonary stenosis', false,
 $r$Ruled out because isolated pulmonary stenosis produces an ejection systolic murmur with a normally split (and often widely split) S2 that still varies with respiration, not the fixed splitting seen with a chronic left-to-right shunt through an ASD.$r$, 5),

-- Q41 AF -> thrombus -> stroke risk
('20000000-0000-0000-0000-000000000041', 'A', 'Loss of coordinated atrial contraction causes blood stasis in the left atrial appendage, predisposing to thrombus formation and embolic stroke; the decision to anticoagulate is guided by her CHA2DS2-VASc score', true,
 $r$Correct. In atrial fibrillation, the atria no longer contract in an organised fashion, causing blood to stagnate (particularly in the left atrial appendage), which predisposes to thrombus formation; if a thrombus embolises it can cause an ischaemic stroke. The CHA2DS2-VASc score estimates this stroke risk and is used to decide whether the benefit of anticoagulation outweighs its bleeding risk, independent of whether the patient has ever had symptoms from her AF.$r$, 1),
('20000000-0000-0000-0000-000000000041', 'B', 'AF causes stroke only through sustained hypertension, so blood pressure control alone is sufficient without anticoagulation', false,
 $r$Ruled out because although hypertension is itself a risk factor captured within the CHA2DS2-VASc score, the principal mechanism specific to AF is atrial stasis and thrombus formation, not blood pressure elevation alone; blood pressure control does not replace the need for a formal anticoagulation decision.$r$, 2),
('20000000-0000-0000-0000-000000000041', 'C', 'Because she has never had symptoms from her AF, she is not at increased stroke risk and does not need risk stratification', false,
 $r$Ruled out because stroke risk in AF is unrelated to whether the arrhythmia itself is symptomatic; asymptomatic AF carries the same embolic stroke risk as symptomatic AF and should still be risk-stratified.$r$, 3),
('20000000-0000-0000-0000-000000000041', 'D', 'Stroke risk in AF is determined solely by whether she is in fast or normal ventricular rate control', false,
 $r$Ruled out because embolic stroke risk relates to the loss of organised atrial contraction and resultant stasis, not to the ventricular rate; a well rate-controlled patient remains at risk of thrombus formation and embolisation.$r$, 4),
('20000000-0000-0000-0000-000000000041', 'E', 'Anticoagulation should be based on echocardiographic left atrial size alone, without a formal risk score', false,
 $r$Ruled out because although left atrial enlargement is associated with AF, current practice uses a validated clinical risk score (CHA2DS2-VASc) incorporating multiple risk factors, not left atrial size in isolation, to guide the anticoagulation decision.$r$, 5),

-- Q42 IE -> embolic stroke -> anticoagulation dilemma
('20000000-0000-0000-0000-000000000042', 'A', 'Anticoagulation should not be started; management is with antibiotics and consideration of valve surgery, with anticoagulation withheld due to the risk of haemorrhagic transformation of the infarct', true,
 $r$Correct. In native valve infective endocarditis complicated by an embolic ischaemic stroke, anticoagulation is not routinely started, because the infarcted brain tissue and any associated mycotic aneurysm carry a significant risk of haemorrhagic transformation; management instead focuses on antimicrobial therapy and assessment for valve surgery.$r$, 1),
('20000000-0000-0000-0000-000000000042', 'B', 'Full-dose therapeutic anticoagulation should be started immediately to prevent further emboli', false,
 $r$Ruled out because starting anticoagulation immediately after an embolic stroke from native valve endocarditis significantly increases the risk of haemorrhagic transformation of the infarct, and is not routinely recommended in this setting.$r$, 2),
('20000000-0000-0000-0000-000000000042', 'C', 'Thrombolysis should be given for the acute stroke as the immediate priority', false,
 $r$Ruled out because thrombolysis is generally avoided in stroke secondary to infective endocarditis, as the underlying infected embolus and risk of associated mycotic aneurysm make haemorrhagic transformation with thrombolytic therapy particularly dangerous.$r$, 3),
('20000000-0000-0000-0000-000000000042', 'D', 'Aspirin should be started as a substitute for anticoagulation to reduce further embolic risk', false,
 $r$Ruled out because antiplatelet therapy has not been shown to reduce embolic events in infective endocarditis and is not a standard substitute for anticoagulation in this context; the mainstay of preventing further emboli is prompt antimicrobial therapy (and surgery where indicated) rather than antithrombotic drugs.$r$, 4),
('20000000-0000-0000-0000-000000000042', 'E', 'No specific action is required regarding anticoagulation, as it is irrelevant to his management', false,
 $r$Ruled out because the anticoagulation decision is a genuine and important clinical question in IE-associated stroke; it is not irrelevant, it specifically needs to be actively withheld rather than defaulted to, because of the bleeding risk explained above.$r$, 5),

-- Q43 Coarctation
('20000000-0000-0000-0000-000000000043', 'A', 'Coarctation of the aorta', true,
 $r$Correct. Hypertension with radiofemoral delay, weak/delayed femoral pulses, and rib notching from dilated collateral intercostal arteries on chest X-ray are classic findings of coarctation of the aorta.$r$, 1),
('20000000-0000-0000-0000-000000000043', 'B', 'Essential (primary) hypertension', false,
 $r$Ruled out because essential hypertension does not explain radiofemoral delay or rib notching, both of which point to a structural narrowing of the aorta rather than a primary blood pressure disorder.$r$, 2),
('20000000-0000-0000-0000-000000000043', 'C', 'Renal artery stenosis', false,
 $r$Ruled out because although this causes secondary hypertension, it does not produce radiofemoral delay or rib notching, which specifically indicate an aortic, not renal, structural abnormality.$r$, 3),
('20000000-0000-0000-0000-000000000043', 'D', 'Takayasu arteritis', false,
 $r$Ruled out because although large vessel vasculitis can cause pulse discrepancies, it typically presents with systemic inflammatory features and asymmetric arm pulses rather than the classic radiofemoral delay and rib notching pattern of coarctation.$r$, 4),
('20000000-0000-0000-0000-000000000043', 'E', 'Bicuspid aortic valve alone', false,
 $r$Ruled out because an isolated bicuspid aortic valve, while often associated with coarctation, does not itself cause radiofemoral delay or rib notching; these findings specifically indicate coexisting aortic coarctation.$r$, 5),

-- Q44 Marfan -> dissection
('20000000-0000-0000-0000-000000000044', 'A', 'Acute aortic dissection arising from progressive aortic root dilatation', true,
 $r$Correct. In Marfan syndrome, weakened aortic wall connective tissue predisposes to progressive aortic root dilatation; when the root enlarges (especially with poor beta-blocker adherence, which normally helps slow this process) it becomes increasingly prone to dissection, presenting with sudden severe tearing pain radiating to the back, exactly as described here.$r$, 1),
('20000000-0000-0000-0000-000000000044', 'B', 'A simple musculoskeletal chest wall strain', false,
 $r$Ruled out because this would not explain sudden severe tearing pain radiating to the back in a patient with known progressive aortic root dilatation and Marfan syndrome, a recognised high-risk substrate for dissection.$r$, 2),
('20000000-0000-0000-0000-000000000044', 'C', 'Acute pericarditis', false,
 $r$Ruled out because pericarditis causes pleuritic pain relieved by sitting forward, not sudden tearing pain radiating to the back, and does not arise from progressive aortic root dilatation.$r$, 3),
('20000000-0000-0000-0000-000000000044', 'D', 'Spontaneous pneumothorax', false,
 $r$Ruled out because although tall, thin body habitus is a risk factor for spontaneous pneumothorax, this would present with sudden breathlessness and pleuritic pain, not tearing pain specifically explained by his known enlarging aortic root.$r$, 4),
('20000000-0000-0000-0000-000000000044', 'E', 'Mitral valve prolapse causing acute chest pain', false,
 $r$Ruled out because mitral valve prolapse, while associated with Marfan syndrome, typically causes palpitations or a mid-systolic click/murmur rather than sudden severe tearing chest pain radiating to the back.$r$, 5),

-- Q45 Cardiac myxoma
('20000000-0000-0000-0000-000000000045', 'A', 'Left atrial myxoma', true,
 $r$Correct. Constitutional symptoms (fever, weight loss, raised inflammatory markers) with negative blood cultures, positional breathlessness from intermittent mitral valve obstruction, and evidence of systemic embolisation (the painful cold toe), together with a mobile mass on the interatrial septum on echocardiogram, are classic for a left atrial myxoma, which can closely mimic infective endocarditis or vasculitis.$r$, 1),
('20000000-0000-0000-0000-000000000045', 'B', 'Infective endocarditis with culture-negative organisms', false,
 $r$Ruled out because although culture-negative endocarditis exists, the echocardiographic finding here is a pedunculated mass specifically attached to the interatrial septum causing positional mitral obstruction, which is the classic appearance of a myxoma rather than a valvular vegetation.$r$, 2),
('20000000-0000-0000-0000-000000000045', 'C', 'Systemic vasculitis alone', false,
 $r$Ruled out because vasculitis would not explain the discrete septal mass causing intermittent mitral valve obstruction seen on echocardiogram; the embolic toe and constitutional symptoms here are a consequence of the myxoma, not a primary vasculitic process.$r$, 3),
('20000000-0000-0000-0000-000000000045', 'D', 'Rheumatic mitral stenosis', false,
 $r$Ruled out because rheumatic mitral stenosis causes fixed, not positional, valve obstruction, and does not explain the discrete mobile septal mass, systemic embolisation and constitutional symptoms seen here.$r$, 4),
('20000000-0000-0000-0000-000000000045', 'E', 'Lymphoma with cardiac involvement', false,
 $r$Ruled out because although lymphoma can rarely involve the heart, a pedunculated mass specifically arising from the interatrial septum near the fossa ovalis and causing positional mitral obstruction is far more characteristic of a myxoma, the most common primary cardiac tumour.$r$, 5),

-- Q46 Takotsubo
('20000000-0000-0000-0000-000000000046', 'A', 'Takotsubo cardiomyopathy', true,
 $r$Correct. Acute chest pain and ST elevation following severe emotional stress, with a raised troponin but unobstructed coronary arteries and a characteristic apical ballooning pattern on ventriculography, is diagnostic of takotsubo (stress) cardiomyopathy.$r$, 1),
('20000000-0000-0000-0000-000000000046', 'B', 'Anterior STEMI', false,
 $r$Ruled out because coronary angiography shows unobstructed arteries, excluding an acute atherothrombotic STEMI as the cause of her ECG changes and troponin rise.$r$, 2),
('20000000-0000-0000-0000-000000000046', 'C', 'Coronary artery vasospasm (Prinzmetal angina)', false,
 $r$Ruled out because although vasospasm can also cause ST elevation with unobstructed arteries, it does not produce the specific apical ballooning wall motion pattern on ventriculography, which is the defining feature of takotsubo cardiomyopathy here.$r$, 3),
('20000000-0000-0000-0000-000000000046', 'D', 'Acute pericarditis', false,
 $r$Ruled out because pericarditis causes diffuse saddle-shaped ST elevation with PR depression, not the focal apical wall motion abnormality with regional ST elevation seen here.$r$, 4),
('20000000-0000-0000-0000-000000000046', 'E', 'Hypertrophic obstructive cardiomyopathy', false,
 $r$Ruled out because HOCM is a chronic structural condition with asymmetric septal hypertrophy, not an acute, reversible, stress-triggered wall motion abnormality with unobstructed coronaries.$r$, 5),

-- Q47 Sick sinus syndrome pacemaker
('20000000-0000-0000-0000-000000000047', 'A', 'Permanent pacemaker implantation', true,
 $r$Correct. Symptomatic sick sinus syndrome, with alternating bradycardia and paroxysmal tachyarrhythmia (tachy-brady syndrome) causing her dizziness and syncope, is an indication for a permanent pacemaker, which also allows safer use of rate-controlling or antiarrhythmic drugs for the tachycardic episodes.$r$, 1),
('20000000-0000-0000-0000-000000000047', 'B', 'Beta-blocker therapy alone', false,
 $r$Ruled out because a beta-blocker would worsen her symptomatic bradycardic episodes; rate-controlling drugs for her tachycardic episodes can only be safely used once a pacemaker is in place to protect against bradycardia.$r$, 2),
('20000000-0000-0000-0000-000000000047', 'C', 'Reassurance with no treatment, as the episodes are self-terminating', false,
 $r$Ruled out because she has had recurrent symptomatic episodes including syncope, which carries a risk of injury and warrants definitive treatment rather than simple reassurance.$r$, 3),
('20000000-0000-0000-0000-000000000047', 'D', 'Emergency temporary transvenous pacing as the definitive long-term solution', false,
 $r$Ruled out because temporary pacing is used for acute, unstable situations; her condition, while symptomatic, is chronic and intermittent and is best managed with a permanent, not temporary, pacing solution.$r$, 4),
('20000000-0000-0000-0000-000000000047', 'E', 'Catheter ablation of the sinoatrial node', false,
 $r$Ruled out because ablating the sinoatrial node would eliminate the heart's native pacemaker entirely, mandating permanent pacing anyway, and is not the standard approach to sick sinus syndrome; a pacemaker alone, without ablation, is the standard treatment.$r$, 5),

-- Q48 Mobitz II
('20000000-0000-0000-0000-000000000048', 'A', 'Permanent pacemaker implantation', true,
 $r$Correct. Mobitz type II second-degree heart block (constant PR interval with intermittently non-conducted P waves) carries a significant risk of unpredictable progression to complete heart block, and is an indication for a permanent pacemaker even with mild symptoms such as pre-syncope.$r$, 1),
('20000000-0000-0000-0000-000000000048', 'B', 'Reassurance, as this is a benign finding requiring no treatment', false,
 $r$Ruled out because, unlike Mobitz type I (Wenckebach), Mobitz type II carries a substantial risk of sudden progression to complete heart block and should not be managed with reassurance alone.$r$, 2),
('20000000-0000-0000-0000-000000000048', 'C', 'IV atropine as definitive long-term management', false,
 $r$Ruled out because atropine is used for acute symptomatic bradycardia, not as definitive long-term management of a rhythm with a high risk of progressing to complete heart block; a pacemaker is required for that.$r$, 3),
('20000000-0000-0000-0000-000000000048', 'D', 'Start a beta-blocker to slow conduction further', false,
 $r$Ruled out because a beta-blocker would further impair AV conduction and could precipitate complete heart block, worsening rather than treating this condition.$r$, 4),
('20000000-0000-0000-0000-000000000048', 'E', '24-hour ambulatory ECG monitoring with no other intervention', false,
 $r$Ruled out because the diagnosis of Mobitz type II is already established on his ECG; further monitoring alone, without proceeding to pacing, would leave him at ongoing risk of progressing to complete heart block.$r$, 5),

-- Q49 Exercise/functional testing choice
('20000000-0000-0000-0000-000000000049', 'A', 'CT coronary angiography', true,
 $r$Correct. Current NICE guidance recommends CT coronary angiography as the first-line investigation for patients with recent-onset chest pain of suspected cardiac origin, having superseded exercise ECG testing, which is no longer recommended to diagnose or exclude stable angina.$r$, 1),
('20000000-0000-0000-0000-000000000049', 'B', 'Exercise ECG (treadmill) testing', false,
 $r$Ruled out because NICE no longer recommends exercise ECG testing to diagnose or exclude stable angina, due to its limited diagnostic accuracy compared with anatomical imaging; CT coronary angiography is preferred first-line.$r$, 2),
('20000000-0000-0000-0000-000000000049', 'C', 'Invasive coronary angiography as the first-line test', false,
 $r$Ruled out because invasive angiography is reserved for when non-invasive imaging (such as CTCA) suggests significant disease or is inconclusive, not as the routine first-line investigation for new suspected stable angina.$r$, 3),
('20000000-0000-0000-0000-000000000049', 'D', 'Myocardial perfusion scintigraphy as the first-line test', false,
 $r$Ruled out because functional imaging such as myocardial perfusion scintigraphy is used as a second-line test when CT coronary angiography shows coronary calcification of uncertain significance or non-diagnostic results, not as the initial first-line investigation.$r$, 4),
('20000000-0000-0000-0000-000000000049', 'E', 'Resting 12-lead ECG alone, with no further imaging required', false,
 $r$Ruled out because a resting ECG is often normal between episodes of stable angina and cannot reliably confirm or exclude the diagnosis; further anatomical or functional testing is required.$r$, 5),

-- Q50 IE prophylaxis / Duke criteria nuance
('20000000-0000-0000-0000-000000000050', 'A', 'Antibiotic prophylaxis is not routinely recommended before dental procedures; good oral hygiene should be emphasised instead', true,
 $r$Correct. Current NICE guidance no longer recommends routine antibiotic prophylaxis against infective endocarditis for people at risk (including those with prosthetic valves) undergoing dental procedures, reflecting a lack of clear evidence of benefit and concerns over antibiotic resistance and adverse reactions; maintaining good oral hygiene is instead emphasised as the key preventive measure.$r$, 1),
('20000000-0000-0000-0000-000000000050', 'B', 'He requires a single dose of oral amoxicillin one hour before the procedure', false,
 $r$Ruled out because this reflects older prophylaxis practice that NICE no longer recommends routinely for dental procedures, even in patients with prosthetic valves.$r$, 2),
('20000000-0000-0000-0000-000000000050', 'C', 'He requires IV antibiotic prophylaxis given his prosthetic valve, as oral prophylaxis is insufficient', false,
 $r$Ruled out because NICE guidance does not recommend routine antibiotic prophylaxis of any route for dental procedures in at-risk patients, including those with prosthetic valves; it is not a question of oral being insufficient, but that routine prophylaxis is not advised at all.$r$, 3),
('20000000-0000-0000-0000-000000000050', 'D', 'He should avoid all dental treatment permanently because of his prosthetic valve', false,
 $r$Ruled out because there is no need to avoid dental treatment; the guidance addresses antibiotic prophylaxis specifically, and dental care (with good oral hygiene) should continue as normal.$r$, 4),
('20000000-0000-0000-0000-000000000050', 'E', 'He should take prophylactic antibiotics only if he has had infective endocarditis before', false,
 $r$Ruled out because NICE's position is that routine antibiotic prophylaxis is not recommended for dental procedures in at-risk patients generally, rather than being selectively recommended only for those with a prior episode of endocarditis.$r$, 5)

on conflict (question_id, label) do nothing;

-- ---------------------------------------------------------------------------
-- Discriminators
-- ---------------------------------------------------------------------------

insert into question_discriminators (question_id, discriminator_text, sort_order) values

('20000000-0000-0000-0000-000000000001', 'ST elevation in II, III and aVF localises the infarct to the inferior wall.', 1),
('20000000-0000-0000-0000-000000000001', 'The right coronary artery supplies the inferior wall (and usually the AV node) in most people, explaining the frequent association with heart block.', 2),

('20000000-0000-0000-0000-000000000002', 'ST elevation in V1-V4 localises the infarct to the anteroseptal wall.', 1),
('20000000-0000-0000-0000-000000000002', 'The LAD is the "widow-maker" vessel; proximal occlusion here carries a particularly poor prognosis given the large territory it supplies.', 2),

('20000000-0000-0000-0000-000000000003', 'The 120-minute rule governs the choice between primary PCI and fibrinolysis: PCI is preferred whenever it can be delivered within this window.', 1),
('20000000-0000-0000-0000-000000000003', 'Time from symptom onset to reperfusion is the key determinant of salvaged myocardium in STEMI.', 2),

('20000000-0000-0000-0000-000000000004', 'When primary PCI cannot be delivered within 120 minutes, fibrinolysis should be given immediately rather than waiting for transfer.', 1),
('20000000-0000-0000-0000-000000000004', 'Rescue PCI or routine angiography should follow fibrinolysis to assess reperfusion success.', 2),

('20000000-0000-0000-0000-000000000005', 'NICE bases first-line antihypertensive choice on age and ethnicity: CCB for patients 55 or over, or of Black African/Caribbean family origin at any age.', 1),
('20000000-0000-0000-0000-000000000005', 'ACE inhibitors are less effective and carry a higher angioedema risk in patients of Black African/Caribbean family origin.', 2),

('20000000-0000-0000-0000-000000000006', 'Step 2 of the NICE hypertension pathway combines an A drug (ACEi/ARB) with a C drug (CCB), or a C drug with a D drug (thiazide-like diuretic).', 1),
('20000000-0000-0000-0000-000000000006', 'Escalation should only occur after confirming adherence and maximising the current drug dose.', 2),

('20000000-0000-0000-0000-000000000007', 'Unprovoked hypokalaemia in the context of resistant hypertension is a specific clue to primary hyperaldosteronism.', 1),
('20000000-0000-0000-0000-000000000007', 'The aldosterone-to-renin ratio is the correct first-line screening test, reflecting autonomous aldosterone secretion suppressing renin.', 2),
('20000000-0000-0000-0000-000000000007', 'Resistant hypertension is defined as uncontrolled blood pressure despite optimised doses of three drug classes (A+C+D), confirmed adherence and out-of-office measurement.', 3),

('20000000-0000-0000-0000-000000000008', 'Beta-blockers and calcium channel blockers are the two recommended first-line drug classes for regular anti-anginal therapy.', 1),
('20000000-0000-0000-0000-000000000008', 'GTN spray is for acute symptomatic relief, separate from regular preventive anti-anginal therapy.', 2),

('20000000-0000-0000-0000-000000000009', 'MRA therapy is the recommended second-line add-on once a patient remains symptomatic on optimised ACE inhibitor and beta-blocker.', 1),
('20000000-0000-0000-0000-000000000009', 'Potassium and renal function should be monitored closely after starting an MRA given the risk of hyperkalaemia.', 2),

('20000000-0000-0000-0000-000000000010', 'ACE inhibitor and beta-blocker together form the foundation of first-line disease-modifying HFrEF therapy.', 1),
('20000000-0000-0000-0000-000000000010', 'Diuretics treat congestive symptoms but do not alter disease progression or improve prognosis on their own.', 2),

('20000000-0000-0000-0000-000000000011', 'Hydralazine-nitrate is a recognised additional or alternative option in HFrEF, particularly relevant when ACE inhibitors and ARBs cannot both be tolerated.', 1),
('20000000-0000-0000-0000-000000000011', 'A prior ACE inhibitor cough and ARB angioedema together mean both renin-angiotensin blocking classes should be avoided going forward.', 2),

('20000000-0000-0000-0000-000000000012', 'Sacubitril-valsartan replaces (not adds to) the ACE inhibitor/ARB once a patient remains symptomatic on optimised triple therapy (ACEi/ARB, beta-blocker, MRA).', 1),
('20000000-0000-0000-0000-000000000012', 'ACE inhibitor and sacubitril-valsartan must never be co-prescribed, due to the shared risk of severe angioedema; a washout period is required when switching.', 2),

('20000000-0000-0000-0000-000000000013', 'Verapamil and diltiazem are CYP3A4 inhibitors that raise ivabradine plasma levels; their co-prescription is contraindicated due to excessive bradycardia risk.', 1),
('20000000-0000-0000-0000-000000000013', 'Ivabradine criteria (sinus rhythm, HR>=75 on maximally tolerated beta-blocker, EF<=35%) are necessary but not sufficient; interacting drugs must also be reviewed before starting.', 2),

('20000000-0000-0000-0000-000000000014', 'CRT criteria combine a reduced ejection fraction with a broad QRS/LBBB pattern causing ventricular dyssynchrony.', 1),
('20000000-0000-0000-0000-000000000014', 'CRT is considered once a patient remains symptomatic despite optimised medical therapy, not as an initial step.', 2),

('20000000-0000-0000-0000-000000000015', 'Chronic pressure overload from hypertension drives concentric LVH, which stiffens the ventricle and impairs relaxation.', 1),
('20000000-0000-0000-0000-000000000015', 'A preserved ejection fraction with impaired diastolic filling (raised E/e'') distinguishes HFpEF from HFrEF.', 2),
('20000000-0000-0000-0000-000000000015', 'Excluding coronary disease on angiography supports a hypertensive, rather than ischaemic, mechanism for her heart failure.', 3),

('20000000-0000-0000-0000-000000000016', 'Adverse signs (shock, syncope, myocardial ischaemia, heart failure) in any tachyarrhythmia mandate synchronised electrical cardioversion.', 1),
('20000000-0000-0000-0000-000000000016', 'Broad-complex, regular tachycardia should be assumed to be VT until proven otherwise, especially with a background of ischaemic heart disease.', 2),

('20000000-0000-0000-0000-000000000017', 'Absence of adverse signs allows pharmacological treatment (IV amiodarone) to be tried before considering electrical cardioversion.', 1),
('20000000-0000-0000-0000-000000000017', 'A prior myocardial infarction is a recognised substrate for scar-related monomorphic VT.', 2),

('20000000-0000-0000-0000-000000000018', 'Vagal manoeuvres are attempted first as a low-risk, rapid intervention before pharmacological therapy.', 1),
('20000000-0000-0000-0000-000000000018', 'Adenosine is given as rapid incremental IV boluses (6 mg, then 12 mg, then 12 mg) via a large cannula with a rapid saline flush.', 2),
('20000000-0000-0000-0000-000000000018', 'Patients should be warned of transient flushing, chest tightness and a sense of impending doom before adenosine is given.', 3),

('20000000-0000-0000-0000-000000000019', 'Adenosine can provoke bronchospasm and is relatively contraindicated in asthma or severe reversible airways disease.', 1),
('20000000-0000-0000-0000-000000000019', 'Verapamil is a recognised alternative for terminating stable SVT when adenosine cannot be used.', 2),

('20000000-0000-0000-0000-000000000020', 'VF and pulseless VT are the shockable rhythms in the cardiac arrest algorithm, treated with immediate unsynchronised defibrillation.', 1),
('20000000-0000-0000-0000-000000000020', 'A chaotic rhythm without discernible QRS complexes cannot be synchronised to for cardioversion, so an unsynchronised shock is required.', 2),

('20000000-0000-0000-0000-000000000021', 'PEA and asystole are the non-shockable rhythms, treated with CPR, early adrenaline and a search for reversible causes.', 1),
('20000000-0000-0000-0000-000000000021', 'An organised rhythm on the monitor without a palpable pulse defines pulseless electrical activity, distinguishing it from a perfusing rhythm.', 2),
('20000000-0000-0000-0000-000000000021', 'The 4 Hs and 4 Ts provide a systematic framework for identifying and treating reversible causes of PEA.', 3),

('20000000-0000-0000-0000-000000000022', 'Adverse signs (shock, syncope, myocardial ischaemia, heart failure) in bradycardia define the need for immediate treatment with atropine.', 1),
('20000000-0000-0000-0000-000000000022', 'Pacing (transcutaneous, then transvenous) is escalated to if atropine fails or is only partially effective.', 2),

('20000000-0000-0000-0000-000000000023', 'A sawtooth pattern of atrial activity at around 300/min is the hallmark ECG feature of atrial flutter.', 1),
('20000000-0000-0000-0000-000000000023', 'Fixed conduction ratios (commonly 2:1) explain why the ventricular rate is often a clean fraction of the atrial rate, such as 150/min.', 2),

('20000000-0000-0000-0000-000000000024', 'The examination triad of loud S1, opening snap and mid-diastolic murmur reflects a stiffened, stenotic mitral valve.', 1),
('20000000-0000-0000-0000-000000000024', 'Left atrial enlargement from chronic mitral stenosis predisposes to atrial fibrillation.', 2),
('20000000-0000-0000-0000-000000000024', 'A history from a region with a high burden of untreated streptococcal disease supports rheumatic heart disease as the underlying cause.', 3),

('20000000-0000-0000-0000-000000000025', 'A collapsing, water-hammer pulse with a wide pulse pressure reflects rapid diastolic run-off back through the incompetent aortic valve.', 1),
('20000000-0000-0000-0000-000000000025', 'Leaning forward in expiration brings the regurgitant jet closer to the stethoscope, accentuating the early diastolic murmur.', 2),

('20000000-0000-0000-0000-000000000026', 'Carvallo sign (a right-sided murmur increasing with inspiration) helps localise a pansystolic murmur to the tricuspid, rather than mitral, valve.', 1),
('20000000-0000-0000-0000-000000000026', 'Giant V waves in the JVP and pulsatile hepatomegaly reflect transmission of right ventricular systolic pressure back through the incompetent tricuspid valve.', 2),
('20000000-0000-0000-0000-000000000026', 'Intravenous drug use is a recognised risk factor for right-sided (tricuspid) infective endocarditis.', 3),

('20000000-0000-0000-0000-000000000027', 'Pain relieved by sitting forward and worse lying flat is a classic postural feature of pericarditis.', 1),
('20000000-0000-0000-0000-000000000027', 'Widespread, non-territorial ST elevation with PR depression distinguishes pericarditis from a coronary event.', 2),

('20000000-0000-0000-0000-000000000028', 'Reciprocal ST depression is expected in a territorial STEMI but characteristically absent in pericarditis.', 1),
('20000000-0000-0000-0000-000000000028', 'ST elevation crossing multiple coronary territories simultaneously cannot be explained by occlusion of a single vessel, favouring a diffuse inflammatory process.', 2),
('20000000-0000-0000-0000-000000000028', 'PR segment depression is a specific additional clue supporting pericarditis over STEMI.', 3),

('20000000-0000-0000-0000-000000000029', 'Ongoing myocardial inflammation after acute viral myocarditis can progressively impair systolic function over weeks to months.', 1),
('20000000-0000-0000-0000-000000000029', 'A normal coronary angiogram at the time of the original presentation argues against a new ischaemic process explaining his later deterioration.', 2),
('20000000-0000-0000-0000-000000000029', 'Myocarditis is a recognised, if uncommon, cause of secondary dilated cardiomyopathy.', 3),

('20000000-0000-0000-0000-000000000030', 'Low-voltage QRS complexes despite marked wall thickening on echo (voltage-thickness discordance) is a specific pointer to an infiltrative cardiomyopathy such as amyloidosis.', 1),
('20000000-0000-0000-0000-000000000030', 'Bilateral carpal tunnel syndrome is a recognised extracardiac clue to amyloid deposition, often preceding the cardiac diagnosis by several years.', 2),
('20000000-0000-0000-0000-000000000030', 'A granular, "sparkling" texture on echocardiography reflects amyloid infiltration of the myocardium.', 3),

('20000000-0000-0000-0000-000000000031', 'Secondary prevention after MI combines antiplatelet, lipid-lowering, and two classes of cardioprotective drugs (ACE inhibitor and beta-blocker) with proven mortality benefit.', 1),
('20000000-0000-0000-0000-000000000031', 'Dual antiplatelet therapy is typically continued for up to 12 months post-MI before de-escalating to a single agent.', 2),

('20000000-0000-0000-0000-000000000032', 'LFT monitoring at baseline, 3 months and 12 months allows early detection of statin-induced hepatotoxicity.', 1),
('20000000-0000-0000-0000-000000000032', 'Persistent transaminases above three times the upper limit of normal should prompt stopping or reducing the statin dose.', 2),

('20000000-0000-0000-0000-000000000033', 'Untreated hypothyroidism is an independent risk factor for statin-induced myopathy, through reduced statin clearance and additive muscle vulnerability.', 1),
('20000000-0000-0000-0000-000000000033', 'A markedly elevated CK with dark urine indicates rhabdomyolysis and myoglobinuria, not simple myalgia.', 2),
('20000000-0000-0000-0000-000000000033', 'Checking thyroid function is a sensible step before or alongside starting a statin, particularly if myopathic symptoms develop.', 3),

('20000000-0000-0000-0000-000000000034', 'Calcium gluconate stabilises the cardiac membrane without lowering serum potassium, buying time for other measures to take effect.', 1),
('20000000-0000-0000-0000-000000000034', 'The ECG progression (tented T waves, then P wave loss, then QRS widening) tracks rising severity of hyperkalaemia.', 2),

('20000000-0000-0000-0000-000000000035', 'ACE inhibitors and MRAs both reduce renal potassium excretion, so their combination requires monitoring, particularly during any acute illness affecting renal function.', 1),
('20000000-0000-0000-0000-000000000035', 'Volume depletion from vomiting and diarrhoea is a common precipitant of acute kidney injury, which sharply reduces potassium excretion.', 2),
('20000000-0000-0000-0000-000000000035', 'Severe hyperkalaemia destabilises cardiac membrane potential, producing the broad, bizarre pre-terminal arrhythmia described.', 3),

('20000000-0000-0000-0000-000000000036', 'Coved ST elevation with T-wave inversion confined to V1-V3 is the specific ECG pattern (Type 1 Brugada pattern) diagnostic of Brugada syndrome.', 1),
('20000000-0000-0000-0000-000000000036', 'Fever is a recognised trigger that can unmask or worsen the Brugada ECG pattern.', 2),
('20000000-0000-0000-0000-000000000036', 'A family history of unexplained sudden death supports an inherited channelopathy.', 3),

('20000000-0000-0000-0000-000000000037', 'Exertional syncope triggered specifically by swimming is a recognised pattern in the LQT1 subtype of congenital long QT syndrome.', 1),
('20000000-0000-0000-0000-000000000037', 'A family history of similar unexplained syncope supports an inherited arrhythmia syndrome over an isolated event.', 2),
('20000000-0000-0000-0000-000000000037', 'A prolonged QTc on the resting ECG is the key diagnostic clue distinguishing this from other causes of exertional syncope.', 3),

('20000000-0000-0000-0000-000000000038', 'Sudden collapse without prodrome during exertion, especially with known structural heart disease, points to a cardiac (often arrhythmic or outflow-obstructive) cause.', 1),
('20000000-0000-0000-0000-000000000038', 'A measured postural blood pressure drop on standing is the defining feature of orthostatic hypotension.', 2),
('20000000-0000-0000-0000-000000000038', 'A prodrome of nausea, sweating and visual dimming in a triggering situation (prolonged standing, heat, crowding) is characteristic of vasovagal syncope.', 3),

('20000000-0000-0000-0000-000000000039', 'An ABPI below 0.9 indicates peripheral arterial disease, with lower values reflecting more severe disease.', 1),
('20000000-0000-0000-0000-000000000039', 'Exertional calf pain relieved by rest (intermittent claudication) is the classic symptom pattern of PAD.', 2),

('20000000-0000-0000-0000-000000000040', 'Fixed splitting of S2, unaffected by respiration, reflects chronic right-sided volume overload from a persistent left-to-right shunt.', 1),
('20000000-0000-0000-0000-000000000040', 'An ejection systolic murmur at the upper left sternal edge reflects increased flow across the pulmonary valve, not the septal defect itself.', 2),

('20000000-0000-0000-0000-000000000041', 'Loss of coordinated atrial contraction in AF causes blood stasis, particularly in the left atrial appendage, favouring thrombus formation.', 1),
('20000000-0000-0000-0000-000000000041', 'The CHA2DS2-VASc score, not symptom status, determines whether the stroke-risk-reduction benefit of anticoagulation outweighs bleeding risk.', 2),
('20000000-0000-0000-0000-000000000041', 'Embolisation of an atrial thrombus, typically to the cerebral circulation, is the mechanism linking AF to ischaemic stroke.', 3),

('20000000-0000-0000-0000-000000000042', 'Haemorrhagic transformation risk, not ongoing embolic risk, is the dominant concern in the acute period after an IE-related embolic stroke.', 1),
('20000000-0000-0000-0000-000000000042', 'Definitive management of the underlying infective process (antibiotics, and surgery where indicated) takes priority over antithrombotic therapy in this situation.', 2),
('20000000-0000-0000-0000-000000000042', 'Thrombolysis is generally avoided after IE-related stroke because of the same haemorrhagic transformation and mycotic aneurysm concerns.', 3),

('20000000-0000-0000-0000-000000000043', 'Radiofemoral delay reflects a mechanical narrowing of the aorta obstructing flow to the lower limbs.', 1),
('20000000-0000-0000-0000-000000000043', 'Rib notching results from dilated collateral intercostal arteries developing to bypass the coarctation.', 2),
('20000000-0000-0000-0000-000000000043', 'Coarctation is a recognised association in Turner syndrome and with bicuspid aortic valve.', 3),

('20000000-0000-0000-0000-000000000044', 'Aortic root dilatation in Marfan syndrome is a progressive process best monitored with regular surveillance echocardiography.', 1),
('20000000-0000-0000-0000-000000000044', 'Beta-blockers slow the rate of aortic root dilatation, so non-adherence is a specific, identifiable risk factor for dissection here.', 2),
('20000000-0000-0000-0000-000000000044', 'Sudden severe tearing pain radiating to the back is the classic presentation of aortic dissection, distinguishing it from other causes of chest pain in Marfan syndrome.', 3),

('20000000-0000-0000-0000-000000000045', 'Constitutional symptoms with negative blood cultures should prompt consideration of a non-infective mimic of endocarditis, such as myxoma.', 1),
('20000000-0000-0000-0000-000000000045', 'Positional breathlessness reflects intermittent mechanical obstruction of the mitral orifice by the mobile tumour.', 2),
('20000000-0000-0000-0000-000000000045', 'Systemic embolisation of tumour fragments can mimic the embolic phenomena seen in infective endocarditis or vasculitis.', 3),

('20000000-0000-0000-0000-000000000046', 'Unobstructed coronary arteries despite a troponin rise and ST elevation is the key finding separating takotsubo cardiomyopathy from a true STEMI.', 1),
('20000000-0000-0000-0000-000000000046', 'A preceding acute emotional or physical stressor is a classic trigger for takotsubo cardiomyopathy.', 2),
('20000000-0000-0000-0000-000000000046', 'The apical ballooning pattern on ventriculography, giving the condition its name, reflects transient regional dysfunction not explained by a single coronary territory.', 3),

('20000000-0000-0000-0000-000000000047', 'Tachy-brady syndrome describes alternating bradycardic and tachycardic episodes arising from sinus node dysfunction.', 1),
('20000000-0000-0000-0000-000000000047', 'A pacemaker allows rate-controlling therapy for the tachycardic component to be used safely without risking dangerous bradycardia.', 2),

('20000000-0000-0000-0000-000000000048', 'A constant PR interval with intermittently dropped QRS complexes is the defining ECG feature of Mobitz type II, distinct from the progressive PR lengthening of Mobitz type I.', 1),
('20000000-0000-0000-0000-000000000048', 'Mobitz type II carries an unpredictable risk of sudden progression to complete heart block, unlike the generally benign Mobitz type I.', 2),
('20000000-0000-0000-0000-000000000048', 'Pacing is indicated in Mobitz type II even with mild or absent symptoms, given this progression risk.', 3),

('20000000-0000-0000-0000-000000000049', 'NICE guidance on recent-onset chest pain moved away from exercise ECG testing towards anatomical imaging (CT coronary angiography) as the first-line investigation.', 1),
('20000000-0000-0000-0000-000000000049', 'Functional imaging tests are reserved as second-line investigations when CT coronary angiography findings are non-diagnostic.', 2),

('20000000-0000-0000-0000-000000000050', 'Current NICE guidance withdrew the recommendation for routine antibiotic prophylaxis against infective endocarditis before dental procedures, even in higher-risk patients such as those with prosthetic valves.', 1),
('20000000-0000-0000-0000-000000000050', 'Good oral hygiene is emphasised as the more effective, evidence-based preventive measure against endocarditis-causing bacteraemia.', 2),
('20000000-0000-0000-0000-000000000050', 'This differs from the diagnostic modified Duke criteria (major/minor criteria used once endocarditis is suspected), which is a separate concept from prophylaxis before the fact.', 3);
