-- MRCP Part 1 — Respiratory medicine batch 1 (14 questions, matching the
-- blueprint's allocation).
--
-- STATUS: status='draft' — will NOT appear to students until reviewed and
-- published via /admin. Not reviewed by a clinician or MRCP-specific
-- medical educator. See mrcp1-cardiology-batch1.sql for the same note in
-- full.

insert into questions (id, exam, topic_id, status, difficulty, stem, lead_in, tags) values

-- 1. Life-threatening asthma
(
  'd0000000-0000-0000-0000-000000000001', 'mrcp1', '30000000-0000-0000-0000-000000000002',
  'draft', 'advanced',
  $stem$A 24-year-old woman with known asthma presents with acute breathlessness and wheeze. She is unable to complete full sentences. On auscultation her chest is silent.

Observations: HR 128 bpm, RR 32/min, SpO2 89% on 15L oxygen, PEFR 40% predicted.

ABG: PaCO2 6.1 kPa.$stem$,
  'Which feature indicates this is a life-threatening (rather than simply severe) asthma attack?',
  array['asthma','life-threatening features']
),

-- 2. COPD controlled oxygen
(
  'd0000000-0000-0000-0000-000000000002', 'mrcp1', '30000000-0000-0000-0000-000000000002',
  'draft', 'advanced',
  $stem$A 68-year-old man with known severe COPD (FEV1 35% predicted) is brought in with an infective exacerbation, breathless and drowsy. He was given high-flow 15L oxygen by the ambulance crew.

ABG on arrival: pH 7.22, PaCO2 9.8 kPa, PaO2 18 kPa, bicarbonate 28 mmol/L.$stem$,
  'What is the most appropriate immediate management of his oxygenation?',
  array['COPD','controlled oxygen','hypercapnia']
),

-- 3. CAP CURB-65
(
  'd0000000-0000-0000-0000-000000000003', 'mrcp1', '30000000-0000-0000-0000-000000000002',
  'draft', 'advanced',
  $stem$An 82-year-old man presents with fever, cough and confusion. He is unable to state today's date correctly.

Observations: RR 32/min, BP 88/56 mmHg.

Bloods: urea 9.2 mmol/L.$stem$,
  'What is his CURB-65 score, and what does this indicate?',
  array['pneumonia','CURB-65']
),

-- 4. Legionella
(
  'd0000000-0000-0000-0000-000000000004', 'mrcp1', '30000000-0000-0000-0000-000000000002',
  'draft', 'advanced',
  $stem$A 54-year-old man returns from a hotel stay abroad and develops fever, dry cough, confusion and diarrhoea over 3 days.

Bloods: sodium 126 mmol/L, deranged liver function tests.

Chest X-ray: patchy consolidation.$stem$,
  'What is the most likely causative organism?',
  array['atypical pneumonia','Legionella']
),

-- 5. PE Wells/CTPA
(
  'd0000000-0000-0000-0000-000000000005', 'mrcp1', '30000000-0000-0000-0000-000000000002',
  'draft', 'advanced',
  $stem$A 45-year-old woman on the combined oral contraceptive pill presents with sudden-onset pleuritic chest pain and breathlessness after a long-haul flight. Examination reveals a swollen, tender left calf.

Her Wells score indicates a high clinical probability of pulmonary embolism.$stem$,
  'What is the most appropriate next investigation?',
  array['pulmonary embolism','Wells score','CTPA']
),

-- 6. Tension pneumothorax
(
  'd0000000-0000-0000-0000-000000000006', 'mrcp1', '30000000-0000-0000-0000-000000000002',
  'draft', 'advanced',
  $stem$A 26-year-old man sustains a stab wound to the chest. He rapidly develops severe breathlessness and is found to have tracheal deviation away from the affected side, absent breath sounds on that side, and a hyper-resonant hemithorax.

Observations: HR 130 bpm, BP 78/50 mmHg.$stem$,
  'What is the most appropriate immediate management?',
  array['tension pneumothorax','needle decompression']
),

-- 7. Pleural effusion Light's criteria
(
  'd0000000-0000-0000-0000-000000000007', 'mrcp1', '30000000-0000-0000-0000-000000000002',
  'draft', 'advanced',
  $stem$A 62-year-old man with a history of heart failure presents with progressive breathlessness. Chest X-ray shows a large right-sided pleural effusion. Pleural fluid aspiration is performed.

Pleural fluid protein: 28 g/L (serum protein 65 g/L). Pleural fluid LDH: 90 U/L (serum LDH 250 U/L, upper limit of normal 200 U/L).$stem$,
  $q$According to Light's criteria, is this effusion a transudate or an exudate?$q$,
  array['pleural effusion', $t$Light's criteria$t$]
),

-- 8. IPF
(
  'd0000000-0000-0000-0000-000000000008', 'mrcp1', '30000000-0000-0000-0000-000000000002',
  'draft', 'advanced',
  $stem$A 70-year-old man presents with a 12-month history of progressive breathlessness and a dry cough. Examination reveals bilateral fine end-inspiratory crackles at the lung bases and finger clubbing.

HRCT: bilateral subpleural, basal reticulation with honeycombing, no ground-glass predominance.$stem$,
  'What is the most likely diagnosis?',
  array['pulmonary fibrosis','IPF','HRCT']
),

-- 9. Sarcoidosis
(
  'd0000000-0000-0000-0000-000000000009', 'mrcp1', '30000000-0000-0000-0000-000000000002',
  'draft', 'advanced',
  $stem$A 32-year-old woman of Afro-Caribbean descent presents with dry cough, mild breathlessness and tender red nodules on her shins. Chest X-ray shows bilateral hilar lymphadenopathy.

Bloods: raised serum ACE.$stem$,
  'What is the most likely diagnosis?',
  array['sarcoidosis','hilar lymphadenopathy']
),

-- 10. Bronchiectasis
(
  'd0000000-0000-0000-0000-000000000010', 'mrcp1', '30000000-0000-0000-0000-000000000002',
  'draft', 'advanced',
  $stem$A 45-year-old woman reports a lifelong history of daily productive cough with copious purulent sputum and recurrent chest infections since childhood.

HRCT: dilated, thick-walled bronchi with a "signet ring" sign.$stem$,
  'What is the most likely diagnosis?',
  array['bronchiectasis','HRCT']
),

-- 11. Lung cancer SIADH
(
  'd0000000-0000-0000-0000-000000000011', 'mrcp1', '30000000-0000-0000-0000-000000000002',
  'draft', 'advanced',
  $stem$A 66-year-old man with a 40 pack-year smoking history presents with confusion and lethargy.

Bloods: sodium 118 mmol/L, low plasma osmolality, inappropriately concentrated urine.

Chest X-ray: central lung mass.$stem$,
  'What is the most likely underlying mechanism?',
  array['lung cancer','SIADH','paraneoplastic']
),

-- 12. OSA
(
  'd0000000-0000-0000-0000-000000000012', 'mrcp1', '30000000-0000-0000-0000-000000000002',
  'draft', 'advanced',
  $stem$A 52-year-old man with obesity presents with excessive daytime sleepiness and loud snoring, witnessed by his partner to include episodes of apnoea during sleep. He scores highly on the Epworth Sleepiness Scale.$stem$,
  'What is the most appropriate investigation to confirm the diagnosis?',
  array['obstructive sleep apnoea','polysomnography']
),

-- 13. Pulmonary hypertension
(
  'd0000000-0000-0000-0000-000000000013', 'mrcp1', '30000000-0000-0000-0000-000000000002',
  'draft', 'advanced',
  $stem$A 38-year-old woman with a history of systemic sclerosis presents with progressive exertional breathlessness. Examination reveals a loud second heart sound (P2), a raised JVP, and peripheral oedema.

Echocardiogram: raised estimated pulmonary artery pressure with right ventricular hypertrophy.$stem$,
  'What is the most likely diagnosis?',
  array['pulmonary hypertension','systemic sclerosis']
),

-- 14. Hypersensitivity pneumonitis
(
  'd0000000-0000-0000-0000-000000000014', 'mrcp1', '30000000-0000-0000-0000-000000000002',
  'draft', 'advanced',
  $stem$A 55-year-old pigeon breeder presents with several months of progressive breathlessness, dry cough and weight loss, worse a few hours after time spent in his pigeon loft. Examination reveals fine bibasal crackles.

HRCT: upper-zone predominant ground-glass change and mosaic attenuation.$stem$,
  'What is the most likely diagnosis?',
  array['hypersensitivity pneumonitis','occupational lung disease']
)

on conflict (id) do nothing;

-- ---------------------------------------------------------------------------
-- Options
-- ---------------------------------------------------------------------------

insert into question_options (question_id, label, option_text, is_correct, rationale, sort_order) values

-- Q1 Life-threatening asthma
('d0000000-0000-0000-0000-000000000001', 'A', 'A silent chest with a normal PaCO2', true,
 $r$Correct. A silent chest reflects minimal air entry from severe bronchoconstriction, and a normal (rather than the expected low) PaCO2 in a tachypnoeic patient indicates she is tiring and failing to compensate — both are specific life-threatening features.$r$, 1),
('d0000000-0000-0000-0000-000000000001', 'B', 'Inability to complete full sentences', false,
 $r$Ruled out because this is a marker of at least severe (or even moderate) asthma, not specific to the life-threatening category.$r$, 2),
('d0000000-0000-0000-0000-000000000001', 'C', 'Respiratory rate 32/min', false,
 $r$Ruled out because a respiratory rate 25/min or above defines severe asthma; life-threatening asthma is defined by different specific features such as a silent chest.$r$, 3),
('d0000000-0000-0000-0000-000000000001', 'D', 'Heart rate 128 bpm', false,
 $r$Ruled out because a heart rate of 110/min or above defines severe asthma; life-threatening asthma is more specifically associated with bradycardia, arrhythmia or hypotension.$r$, 4),
('d0000000-0000-0000-0000-000000000001', 'E', 'PEFR 40% predicted', false,
 $r$Ruled out because a PEFR of 33-50% predicted defines severe asthma; the life-threatening threshold is below 33% or unrecordable.$r$, 5),

-- Q2 COPD oxygen
('d0000000-0000-0000-0000-000000000002', 'A', 'Reduce to controlled oxygen therapy (e.g. 24-28% via Venturi mask) titrated to target SpO2 88-92%', true,
 $r$Correct. In COPD patients at risk of hypercapnic respiratory failure, high-flow oxygen can worsen hypercapnia; controlled oxygen titrated to a lower target saturation prevents this while maintaining adequate oxygenation.$r$, 1),
('d0000000-0000-0000-0000-000000000002', 'B', 'Continue high-flow 15L oxygen', false,
 $r$Ruled out because this has precipitated significant hypercapnic acidosis and worsening consciousness; it should be reduced, not continued.$r$, 2),
('d0000000-0000-0000-0000-000000000002', 'C', 'Discontinue all supplemental oxygen', false,
 $r$Ruled out because the patient remains at risk of significant hypoxia and needs oxygen, just at a controlled, titrated rate rather than complete withdrawal.$r$, 3),
('d0000000-0000-0000-0000-000000000002', 'D', 'Immediate intubation and mechanical ventilation', false,
 $r$Ruled out because the first step is to correct oxygen delivery and reassess with NIV if the acidosis persists; not every hypercapnic COPD patient requires immediate invasive ventilation.$r$, 4),
('d0000000-0000-0000-0000-000000000002', 'E', 'Nebulised oxygen-driven bronchodilators only', false,
 $r$Ruled out because this does not address the excess oxygen delivery that is driving the hypercapnia, the primary issue here.$r$, 5),

-- Q3 CURB-65
('d0000000-0000-0000-0000-000000000003', 'A', 'CURB-65 score of 5, indicating very high mortality risk requiring hospital admission and consideration of ICU/HDU care', true,
 $r$Correct. He scores 1 point each for confusion, urea >7 mmol/L, RR 30 or above, blood pressure below threshold, and age 65 or above, totalling 5 — the maximum score, indicating very high mortality risk.$r$, 1),
('d0000000-0000-0000-0000-000000000003', 'B', 'CURB-65 score of 2, indicating outpatient management is appropriate', false,
 $r$Ruled out because this significantly underestimates his risk; he meets all 5 criteria, not 2.$r$, 2),
('d0000000-0000-0000-0000-000000000003', 'C', 'CURB-65 score of 5, indicating outpatient antibiotics are sufficient', false,
 $r$Ruled out because a score of 5 indicates very high mortality risk requiring admission, not outpatient management.$r$, 3),
('d0000000-0000-0000-0000-000000000003', 'D', 'CURB-65 does not apply because his confusion may be from another cause', false,
 $r$Ruled out because CURB-65 is calculated on the clinical findings present regardless of aetiological uncertainty about the confusion.$r$, 4),
('d0000000-0000-0000-0000-000000000003', 'E', 'CURB-65 score of 3, indicating hospital admission without need for critical care assessment', false,
 $r$Ruled out because this underestimates his actual score of 5 and its associated very high mortality risk, which should prompt consideration of critical care input.$r$, 5),

-- Q4 Legionella
('d0000000-0000-0000-0000-000000000004', 'A', 'Legionella pneumophila', true,
 $r$Correct. Travel/hotel exposure, atypical features (confusion, GI symptoms), hyponatraemia and deranged LFTs together are classic for Legionella pneumonia.$r$, 1),
('d0000000-0000-0000-0000-000000000004', 'B', 'Streptococcus pneumoniae', false,
 $r$Ruled out because typical pneumococcal pneumonia presents with a more acute lobar pattern and does not typically cause this combination of hyponatraemia, deranged LFTs and prominent GI symptoms.$r$, 2),
('d0000000-0000-0000-0000-000000000004', 'C', 'Mycoplasma pneumoniae', false,
 $r$Ruled out because while also atypical, Mycoplasma more classically affects younger patients and is associated with erythema multiforme or cold agglutinin haemolysis, not this hotel-exposure/hyponatraemia picture.$r$, 3),
('d0000000-0000-0000-0000-000000000004', 'D', 'Haemophilus influenzae', false,
 $r$Ruled out because this typically causes pneumonia in patients with underlying COPD, not this systemic atypical picture with hyponatraemia.$r$, 4),
('d0000000-0000-0000-0000-000000000004', 'E', 'Chlamydia psittaci', false,
 $r$Ruled out because this is specifically associated with bird exposure, not hotel/travel exposure.$r$, 5),

-- Q5 PE
('d0000000-0000-0000-0000-000000000005', 'A', 'CT pulmonary angiography', true,
 $r$Correct. In a patient with a high clinical probability of PE, CTPA is the most appropriate first-line definitive imaging investigation, without the need for a D-dimer.$r$, 1),
('d0000000-0000-0000-0000-000000000005', 'B', 'D-dimer testing', false,
 $r$Ruled out because D-dimer is used to help exclude PE only in patients with a low clinical probability; in high-probability patients it should not delay definitive imaging.$r$, 2),
('d0000000-0000-0000-0000-000000000005', 'C', 'Ventilation-perfusion (V/Q) scan as first-line', false,
 $r$Ruled out because CTPA is preferred first-line in most patients; V/Q scanning is reserved for situations such as significant renal impairment or contrast allergy.$r$, 3),
('d0000000-0000-0000-0000-000000000005', 'D', 'Doppler ultrasound of the leg only, without chest imaging', false,
 $r$Ruled out because this does not confirm or exclude PE itself, and definitive chest imaging is needed given the respiratory symptoms and high clinical probability.$r$, 4),
('d0000000-0000-0000-0000-000000000005', 'E', 'Await outpatient echocardiography', false,
 $r$Ruled out because this is not the appropriate next step for suspected acute PE, which requires urgent definitive imaging.$r$, 5),

-- Q6 Tension pneumothorax
('d0000000-0000-0000-0000-000000000006', 'A', 'Immediate needle decompression of the affected hemithorax', true,
 $r$Correct. Tracheal deviation, absent breath sounds, hyper-resonance and haemodynamic compromise are diagnostic of tension pneumothorax, requiring immediate needle decompression before any imaging.$r$, 1),
('d0000000-0000-0000-0000-000000000006', 'B', 'Urgent chest X-ray to confirm the diagnosis', false,
 $r$Ruled out because tension pneumothorax is a clinical diagnosis requiring immediate treatment; waiting for imaging in a haemodynamically unstable patient risks cardiac arrest.$r$, 2),
('d0000000-0000-0000-0000-000000000006', 'C', 'IV fluid resuscitation alone', false,
 $r$Ruled out because this does not address the underlying mechanical cause of the shock, which requires decompression.$r$, 3),
('d0000000-0000-0000-0000-000000000006', 'D', 'Insertion of a chest drain as the first step', false,
 $r$Ruled out because immediate needle decompression takes priority to rapidly relieve the tension physiology; a formal chest drain follows afterwards.$r$, 4),
('d0000000-0000-0000-0000-000000000006', 'E', 'Urgent CT chest', false,
 $r$Ruled out because CT is far too slow for this immediately life-threatening diagnosis, which should be treated clinically without delay.$r$, 5),

-- Q7 Pleural effusion
('d0000000-0000-0000-0000-000000000007', 'A', 'Transudate', true,
 $r$Correct. None of Light's criteria for an exudate are met (protein ratio 0.43, LDH ratio 0.36, pleural LDH below two-thirds the upper limit of normal serum LDH), consistent with a transudate, fitting his heart failure.$r$, 1),
('d0000000-0000-0000-0000-000000000007', 'B', 'Exudate', false,
 $r$Ruled out because none of the three Light's criteria thresholds are exceeded; all values are consistent with a transudate.$r$, 2),
('d0000000-0000-0000-0000-000000000007', 'C', 'Cannot be determined without pleural fluid cholesterol', false,
 $r$Ruled out because Light's criteria (protein and LDH ratios) are sufficient to classify the effusion here.$r$, 3),
('d0000000-0000-0000-0000-000000000007', 'D', 'Empyema', false,
 $r$Ruled out because there is no indication of infection, such as a low pH or frank pus, in the fluid results given.$r$, 4),
('d0000000-0000-0000-0000-000000000007', 'E', 'Chylothorax', false,
 $r$Ruled out because there is no mention of a milky appearance or elevated pleural fluid triglycerides, which would suggest chylothorax.$r$, 5),

-- Q8 IPF
('d0000000-0000-0000-0000-000000000008', 'A', 'Idiopathic pulmonary fibrosis', true,
 $r$Correct. Progressive dyspnoea and dry cough over months to years, bibasal fine crackles, clubbing, and a HRCT pattern of basal subpleural honeycombing are classic for IPF.$r$, 1),
('d0000000-0000-0000-0000-000000000008', 'B', 'Sarcoidosis', false,
 $r$Ruled out because sarcoidosis typically shows bilateral hilar lymphadenopathy with upper-zone predominant changes, not basal honeycombing, and clubbing is uncommon.$r$, 2),
('d0000000-0000-0000-0000-000000000008', 'C', 'Hypersensitivity pneumonitis', false,
 $r$Ruled out because this is typically associated with an identifiable antigen exposure and shows upper/mid-zone, ground-glass and mosaic attenuation changes, not basal honeycombing.$r$, 3),
('d0000000-0000-0000-0000-000000000008', 'D', 'COPD', false,
 $r$Ruled out because COPD causes airflow obstruction with hyperinflation, not the restrictive, fibrotic HRCT pattern and fine crackles described.$r$, 4),
('d0000000-0000-0000-0000-000000000008', 'E', 'Pulmonary oedema', false,
 $r$Ruled out because this is typically acute or subacute with signs of fluid overload, not a 12-month progressive course with honeycombing on HRCT.$r$, 5),

-- Q9 Sarcoidosis
('d0000000-0000-0000-0000-000000000009', 'A', 'Sarcoidosis', true,
 $r$Correct. Bilateral hilar lymphadenopathy with erythema nodosum and a raised ACE level in a young woman of Afro-Caribbean descent is classic for sarcoidosis.$r$, 1),
('d0000000-0000-0000-0000-000000000009', 'B', 'Tuberculosis', false,
 $r$Ruled out because TB hilar lymphadenopathy is typically unilateral and associated with systemic symptoms and a relevant exposure history, and does not classically cause erythema nodosum with a raised ACE.$r$, 2),
('d0000000-0000-0000-0000-000000000009', 'C', 'Lymphoma', false,
 $r$Ruled out because lymphoma-associated lymphadenopathy is often asymmetric and associated with systemic B symptoms, not this combination of bilateral hilar nodes, erythema nodosum and raised ACE.$r$, 3),
('d0000000-0000-0000-0000-000000000009', 'D', 'Bronchogenic carcinoma', false,
 $r$Ruled out because this is unlikely in a young patient without a smoking history described and does not explain the erythema nodosum or bilateral hilar changes.$r$, 4),
('d0000000-0000-0000-0000-000000000009', 'E', 'Silicosis', false,
 $r$Ruled out because this requires a specific occupational dust exposure history, which is not described, and does not typically cause erythema nodosum.$r$, 5),

-- Q10 Bronchiectasis
('d0000000-0000-0000-0000-000000000010', 'A', 'Bronchiectasis', true,
 $r$Correct. A lifelong history of chronic productive cough with copious purulent sputum, recurrent infections, and the HRCT signet ring sign are diagnostic of bronchiectasis.$r$, 1),
('d0000000-0000-0000-0000-000000000010', 'B', 'Chronic bronchitis (COPD)', false,
 $r$Ruled out because this is typically associated with a significant smoking history and does not produce the specific HRCT signet ring sign of bronchial dilatation seen here.$r$, 2),
('d0000000-0000-0000-0000-000000000010', 'C', 'Asthma', false,
 $r$Ruled out because asthma causes episodic wheeze and reversible airflow obstruction, not a lifelong history of copious purulent sputum or bronchial dilatation on HRCT.$r$, 3),
('d0000000-0000-0000-0000-000000000010', 'D', 'Lung abscess', false,
 $r$Ruled out because this typically presents with a localised cavitating lesion, not diffuse bronchial dilatation with a chronic lifelong history.$r$, 4),
('d0000000-0000-0000-0000-000000000010', 'E', 'Pulmonary tuberculosis', false,
 $r$Ruled out because although TB can lead to bronchiectasis as a complication, the vignette describes a primary lifelong pattern without a specific TB history.$r$, 5),

-- Q11 Lung cancer SIADH
('d0000000-0000-0000-0000-000000000011', 'A', 'Ectopic ADH secretion from a small cell lung cancer causing SIADH', true,
 $r$Correct. Hyponatraemia with low plasma osmolality and inappropriately concentrated urine in a heavy smoker with a central lung mass is classic for SIADH from ectopic ADH secretion by a small cell lung cancer.$r$, 1),
('d0000000-0000-0000-0000-000000000011', 'B', 'PTHrP secretion causing hypercalcaemia', false,
 $r$Ruled out because this vignette describes hyponatraemia, not hypercalcaemia; PTHrP-mediated hypercalcaemia is classically associated with squamous cell, not small cell, lung cancer.$r$, 2),
('d0000000-0000-0000-0000-000000000011', 'C', $o$Ectopic ACTH secretion causing Cushing's syndrome$o$, false,
 $r$Ruled out because this would present with hypokalaemia, hypertension and Cushingoid features, not isolated hyponatraemia with concentrated urine.$r$, 3),
('d0000000-0000-0000-0000-000000000011', 'D', 'Lambert-Eaton myasthenic syndrome', false,
 $r$Ruled out because this presents with proximal muscle weakness that improves with repeated use, not hyponatraemia and confusion.$r$, 4),
('d0000000-0000-0000-0000-000000000011', 'E', 'Primary adrenal insufficiency', false,
 $r$Ruled out because although this can cause hyponatraemia, it is typically accompanied by hyperkalaemia and hypotension, and fits less well than SIADH in this paraneoplastic context.$r$, 5),

-- Q12 OSA
('d0000000-0000-0000-0000-000000000012', 'A', 'Polysomnography (sleep study)', true,
 $r$Correct. Polysomnography, measuring apnoea-hypopnoea episodes during sleep, is the gold-standard investigation to confirm obstructive sleep apnoea suggested by this history.$r$, 1),
('d0000000-0000-0000-0000-000000000012', 'B', 'Spirometry', false,
 $r$Ruled out because spirometry assesses airflow obstruction or restriction during wakefulness and does not diagnose sleep-related breathing disorders.$r$, 2),
('d0000000-0000-0000-0000-000000000012', 'C', 'Chest X-ray', false,
 $r$Ruled out because this does not assess sleep-related breathing events and has no role in diagnosing OSA.$r$, 3),
('d0000000-0000-0000-0000-000000000012', 'D', 'Arterial blood gas during the day', false,
 $r$Ruled out because a daytime ABG does not capture the nocturnal apnoeic episodes characteristic of OSA.$r$, 4),
('d0000000-0000-0000-0000-000000000012', 'E', 'Overnight pulse oximetry alone as a definitive diagnostic test', false,
 $r$Ruled out because while overnight oximetry can support a diagnosis and is sometimes used as an initial screen, full polysomnography remains the gold-standard confirmatory test.$r$, 5),

-- Q13 Pulmonary hypertension
('d0000000-0000-0000-0000-000000000013', 'A', 'Pulmonary arterial hypertension secondary to systemic sclerosis', true,
 $r$Correct. Progressive breathlessness with a loud P2, signs of right heart strain, and echocardiographic evidence of pulmonary hypertension in a patient with systemic sclerosis (a recognised association) is diagnostic.$r$, 1),
('d0000000-0000-0000-0000-000000000013', 'B', 'Left ventricular failure', false,
 $r$Ruled out because this would show signs of left heart strain and typically pulmonary oedema, not isolated right heart strain with a loud P2.$r$, 2),
('d0000000-0000-0000-0000-000000000013', 'C', 'Mitral stenosis', false,
 $r$Ruled out because this would produce a mid-diastolic murmur and left atrial enlargement; systemic sclerosis is a more directly recognised primary cause here.$r$, 3),
('d0000000-0000-0000-0000-000000000013', 'D', 'Constrictive pericarditis', false,
 $r$Ruled out because this would show Kussmaul's sign and a pericardial knock, not the echocardiographic finding of raised pulmonary artery pressure with RVH described.$r$, 4),
('d0000000-0000-0000-0000-000000000013', 'E', 'Anaemia', false,
 $r$Ruled out because while anaemia can cause breathlessness, it would not explain the loud P2 and echocardiographic right ventricular hypertrophy with raised pulmonary pressures.$r$, 5),

-- Q14 Hypersensitivity pneumonitis
('d0000000-0000-0000-0000-000000000014', 'A', $o$Hypersensitivity pneumonitis (bird fancier's lung)$o$, true,
 $r$Correct. A recognised antigen exposure (pigeons), symptoms occurring hours after exposure, and HRCT showing upper-zone ground-glass and mosaic attenuation are classic for hypersensitivity pneumonitis.$r$, 1),
('d0000000-0000-0000-0000-000000000014', 'B', 'Idiopathic pulmonary fibrosis', false,
 $r$Ruled out because IPF shows basal, subpleural honeycombing without ground-glass predominance and has no association with a specific antigen exposure or symptom timing.$r$, 2),
('d0000000-0000-0000-0000-000000000014', 'C', 'Occupational asthma', false,
 $r$Ruled out because asthma causes episodic reversible wheeze, not the progressive fibrotic HRCT changes and weight loss described.$r$, 3),
('d0000000-0000-0000-0000-000000000014', 'D', 'Sarcoidosis', false,
 $r$Ruled out because this typically shows bilateral hilar lymphadenopathy, not upper-zone ground-glass change linked temporally to a specific antigen exposure.$r$, 4),
('d0000000-0000-0000-0000-000000000014', 'E', $o$Loffler's syndrome$o$, false,
 $r$Ruled out because this is a transient, self-limiting eosinophilic pneumonia typically related to parasitic larval migration, not a chronic progressive picture linked to bird exposure.$r$, 5)

on conflict (question_id, label) do nothing;

-- ---------------------------------------------------------------------------
-- Discriminators
-- ---------------------------------------------------------------------------

insert into question_discriminators (question_id, discriminator_text, sort_order) values

('d0000000-0000-0000-0000-000000000001', 'A silent chest reflects such severe bronchoconstriction that air movement is inaudible, a hallmark life-threatening sign.', 1),
('d0000000-0000-0000-0000-000000000001', 'A normal or rising PaCO2 in a tachypnoeic asthmatic indicates respiratory muscle fatigue and impending respiratory failure, not reassuring normalisation.', 2),
('d0000000-0000-0000-0000-000000000001', 'Severe asthma features (RR 25+, HR 110+, PEFR 33-50%) sit on a lower rung of severity than the specific life-threatening criteria.', 3),

('d0000000-0000-0000-0000-000000000002', 'High-flow oxygen in COPD can worsen hypercapnia via loss of hypoxic drive and V/Q mismatch, particularly in chronic CO2 retainers.', 1),
('d0000000-0000-0000-0000-000000000002', 'A target SpO2 of 88-92% balances adequate oxygenation against the risk of worsening hypercapnic respiratory failure.', 2),
('d0000000-0000-0000-0000-000000000002', 'Reassessing ABG after adjusting oxygen delivery, before escalating to NIV or intubation, is the correct stepwise approach.', 3),

('d0000000-0000-0000-0000-000000000003', 'CURB-65 scores one point each for Confusion, Urea >7 mmol/L, Respiratory rate 30+, Blood pressure below threshold, and age 65+.', 1),
('d0000000-0000-0000-0000-000000000003', 'A score of 3 or more indicates severe pneumonia with high mortality risk, warranting consideration of critical care input.', 2),
('d0000000-0000-0000-0000-000000000003', 'Accurately calculating each component, rather than estimating severity by gestalt, is essential to appropriately triaging pneumonia.', 3),

('d0000000-0000-0000-0000-000000000004', 'A recent travel or hotel stay is a classic epidemiological clue for Legionella, spread via contaminated water or air conditioning systems.', 1),
('d0000000-0000-0000-0000-000000000004', 'Hyponatraemia and deranged liver function tests, alongside confusion and GI symptoms, are relatively specific systemic features of Legionella among atypical pathogens.', 2),
('d0000000-0000-0000-0000-000000000004', 'The combination of extrapulmonary features with pneumonia is characteristic of atypical pathogens like Legionella, unlike typical lobar pneumococcal pneumonia.', 3),

('d0000000-0000-0000-0000-000000000005', 'D-dimer is only useful to help exclude PE in patients with a low pre-test clinical probability.', 1),
('d0000000-0000-0000-0000-000000000005', 'CTPA is the first-line definitive imaging investigation for suspected PE in most patients.', 2),
('d0000000-0000-0000-0000-000000000005', 'Recognised risk factors (the combined pill, prolonged immobility from a long flight) support a high clinical probability assessment.', 3),

('d0000000-0000-0000-0000-000000000006', 'Tracheal deviation away from the affected side with absent breath sounds and hyper-resonance is the classic clinical triad of tension pneumothorax.', 1),
('d0000000-0000-0000-0000-000000000006', 'Tension pneumothorax is a clinical diagnosis treated immediately, without waiting for confirmatory imaging.', 2),
('d0000000-0000-0000-0000-000000000006', 'Haemodynamic compromise reflects impaired venous return from mediastinal shift, the life-threatening mechanism requiring urgent decompression.', 3),

('d0000000-0000-0000-0000-000000000007', $d$Light's criteria classify an effusion as an exudate if any one of the three protein/LDH ratio thresholds is exceeded; none are met here.$d$, 1),
('d0000000-0000-0000-0000-000000000007', 'A transudate in the context of heart failure reflects raised hydrostatic pressure rather than pleural or systemic inflammatory disease.', 2),
('d0000000-0000-0000-0000-000000000007', $d$Applying all three of Light's criteria systematically, rather than relying on protein alone, avoids misclassification.$d$, 3),

('d0000000-0000-0000-0000-000000000008', 'Bibasal fine end-inspiratory crackles with clubbing is a classic examination finding in pulmonary fibrosis.', 1),
('d0000000-0000-0000-0000-000000000008', 'A HRCT pattern of subpleural, basal honeycombing (usual interstitial pneumonia pattern) is characteristic of IPF.', 2),
('d0000000-0000-0000-0000-000000000008', 'An insidious, progressive course over months to years without an identifiable exposure points to an idiopathic rather than secondary cause of fibrosis.', 3),

('d0000000-0000-0000-0000-000000000009', 'Bilateral, rather than unilateral, hilar lymphadenopathy is a hallmark radiological feature of sarcoidosis.', 1),
('d0000000-0000-0000-0000-000000000009', 'Erythema nodosum alongside bilateral hilar lymphadenopathy forms part of the classic acute sarcoidosis presentation.', 2),
('d0000000-0000-0000-0000-000000000009', 'Afro-Caribbean ethnicity is a recognised risk factor for a higher incidence and more severe sarcoidosis.', 3),

('d0000000-0000-0000-0000-000000000010', 'Copious purulent sputum production with recurrent infections over a lifelong course is characteristic of bronchiectasis.', 1),
('d0000000-0000-0000-0000-000000000010', $d$The HRCT "signet ring" sign, a dilated bronchus larger than its adjacent pulmonary artery, is a specific radiological marker of bronchiectasis.$d$, 2),
('d0000000-0000-0000-0000-000000000010', 'Identifying an underlying cause, such as cystic fibrosis or primary ciliary dyskinesia, is an important next step once the structural diagnosis is made.', 3),

('d0000000-0000-0000-0000-000000000011', 'Hyponatraemia with low plasma osmolality and inappropriately concentrated urine is diagnostic of SIADH.', 1),
('d0000000-0000-0000-0000-000000000011', 'Small cell lung cancer is the classic cause of ectopic ADH secretion among paraneoplastic lung cancer syndromes.', 2),
('d0000000-0000-0000-0000-000000000011', 'Squamous cell (not small cell) lung cancer is more classically associated with PTHrP-mediated hypercalcaemia, an important distinguishing pairing.', 3),

('d0000000-0000-0000-0000-000000000012', 'Polysomnography directly measures apnoea and hypopnoea episodes during sleep, the gold-standard for diagnosing OSA.', 1),
('d0000000-0000-0000-0000-000000000012', 'Excessive daytime sleepiness combined with witnessed apnoeic episodes is the classic clinical picture prompting investigation.', 2),
('d0000000-0000-0000-0000-000000000012', 'Obesity is a major recognised risk factor for OSA due to upper airway soft tissue narrowing.', 3),

('d0000000-0000-0000-0000-000000000013', 'A loud P2 reflects raised pressure closing the pulmonic valve, a key clinical sign of pulmonary hypertension.', 1),
('d0000000-0000-0000-0000-000000000013', 'Systemic sclerosis is a well-recognised cause of pulmonary arterial hypertension, an important disease association to know.', 2),
('d0000000-0000-0000-0000-000000000013', 'Right ventricular hypertrophy and strain reflect the right heart''s response to chronically elevated pulmonary pressures.', 3),

('d0000000-0000-0000-0000-000000000014', 'Symptom onset several hours after a recognised antigen exposure is characteristic of hypersensitivity pneumonitis.', 1),
('d0000000-0000-0000-0000-000000000014', 'Upper/mid-zone ground-glass change and mosaic attenuation on HRCT, rather than basal honeycombing, points away from IPF towards an inhalational cause.', 2),
('d0000000-0000-0000-0000-000000000014', 'Identifying and avoiding the causative antigen is central to management.', 3);
