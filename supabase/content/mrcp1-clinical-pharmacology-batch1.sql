-- MRCP Part 1 — Clinical Pharmacology and Therapeutics batch 1 (15
-- questions, matching the blueprint's allocation).
--
-- STATUS: status='draft' — will NOT appear to students until reviewed and
-- published via /admin. Not reviewed by a clinician or MRCP-specific
-- medical educator. See mrcp1-cardiology-batch1.sql for the same note in
-- full.

insert into questions (id, exam, topic_id, status, difficulty, stem, lead_in, tags) values

-- 1. Paracetamol overdose
(
  'c0000000-0000-0000-0000-000000000001', 'mrcp1', '30000000-0000-0000-0000-000000000006',
  'draft', 'advanced',
  $stem$A 22-year-old woman ingests 40 x 500mg paracetamol tablets (20g) in a single episode 3 hours ago. She is distressed and wants to leave the department.

Her plasma paracetamol level, plotted on the treatment nomogram at 3 hours post-ingestion, falls above the treatment line.$stem$,
  'What is the most appropriate management?',
  array['paracetamol overdose','toxicology']
),

-- 2. Warfarin reversal
(
  'c0000000-0000-0000-0000-000000000002', 'mrcp1', '30000000-0000-0000-0000-000000000006',
  'draft', 'advanced',
  $stem$A 76-year-old man on warfarin for atrial fibrillation presents with haematemesis and melaena. He is hypotensive.

INR: 6.8.$stem$,
  'What is the most appropriate immediate management?',
  array['warfarin','anticoagulation reversal']
),

-- 3. Serotonin syndrome
(
  'c0000000-0000-0000-0000-000000000003', 'mrcp1', '30000000-0000-0000-0000-000000000006',
  'draft', 'advanced',
  $stem$A 28-year-old woman on fluoxetine for depression is started on tramadol for back pain. Within hours she develops agitation, sweating, tremor and myoclonic jerks.

Observations: temperature 38.9°C, HR 118 bpm. Examination shows hyperreflexia and clonus.$stem$,
  'What is the most likely diagnosis?',
  array['serotonin syndrome','drug interaction']
),

-- 4. Lithium toxicity
(
  'c0000000-0000-0000-0000-000000000004', 'mrcp1', '30000000-0000-0000-0000-000000000006',
  'draft', 'advanced',
  $stem$A 65-year-old woman on long-term lithium for bipolar disorder is started on ibuprofen for osteoarthritis and becomes dehydrated after a diarrhoeal illness. She presents with coarse tremor, ataxia, confusion and vomiting.

Lithium level: 2.1 mmol/L (therapeutic range 0.6-1.0 mmol/L).$stem$,
  'What is the most likely diagnosis?',
  array['lithium toxicity','drug interaction']
),

-- 5. ACE inhibitor hyperkalaemia/renal impairment
(
  'c0000000-0000-0000-0000-000000000005', 'mrcp1', '30000000-0000-0000-0000-000000000006',
  'draft', 'advanced',
  $stem$A 72-year-old man with CKD stage 3 is started on ramipril for hypertension. Two weeks later, routine bloods show potassium 6.4 mmol/L and a creatinine risen by 35% from baseline. He has no ECG changes.$stem$,
  'What is the most appropriate next step?',
  array['ACE inhibitor','hyperkalaemia','renal impairment']
),

-- 6. Statin + clarithromycin rhabdomyolysis
(
  'c0000000-0000-0000-0000-000000000006', 'mrcp1', '30000000-0000-0000-0000-000000000006',
  'draft', 'advanced',
  $stem$A 58-year-old man on simvastatin 40mg is prescribed a course of clarithromycin for a chest infection. A week later he develops severe generalised muscle pain and dark urine.

Bloods: creatine kinase markedly elevated (>10,000 U/L), creatinine mildly raised.$stem$,
  'What is the most likely diagnosis and mechanism?',
  array['statin','rhabdomyolysis','drug interaction']
),

-- 7. Opioid toxicity
(
  'c0000000-0000-0000-0000-000000000007', 'mrcp1', '30000000-0000-0000-0000-000000000006',
  'draft', 'advanced',
  $stem$A 45-year-old man is found unresponsive at home with drug paraphernalia nearby.

Observations: RR 6/min and shallow, pinpoint pupils, GCS 6.$stem$,
  'What is the most appropriate immediate management?',
  array['opioid toxicity','naloxone']
),

-- 8. TCA overdose
(
  'c0000000-0000-0000-0000-000000000008', 'mrcp1', '30000000-0000-0000-0000-000000000006',
  'draft', 'advanced',
  $stem$A 34-year-old woman ingests a large quantity of amitriptyline in a suicide attempt. She is drowsy with dilated pupils and a dry mouth.

ECG: QRS duration 140ms, sinus tachycardia.$stem$,
  'What is the most appropriate treatment for the cardiotoxicity?',
  array['TCA overdose','sodium channel blockade']
),

-- 9. Methotrexate + trimethoprim
(
  'c0000000-0000-0000-0000-000000000009', 'mrcp1', '30000000-0000-0000-0000-000000000006',
  'draft', 'advanced',
  $stem$A 68-year-old woman on weekly methotrexate for rheumatoid arthritis is prescribed a course of trimethoprim for a urinary tract infection. A week later she presents with mouth ulcers, sore throat and bruising.

Bloods: pancytopenia.$stem$,
  'What is the most likely mechanism underlying this presentation?',
  array['methotrexate','drug interaction','pancytopenia']
),

-- 10. Aminoglycoside toxicity
(
  'c0000000-0000-0000-0000-000000000010', 'mrcp1', '30000000-0000-0000-0000-000000000006',
  'draft', 'advanced',
  $stem$A 70-year-old man is treated with IV gentamicin for severe pyelonephritis. After 5 days he reports new tinnitus and unsteadiness, and his creatinine has risen from baseline.$stem$,
  'What is the most likely explanation for this presentation?',
  array['aminoglycoside','ototoxicity','nephrotoxicity']
),

-- 11. Phenytoin zero-order kinetics
(
  'c0000000-0000-0000-0000-000000000011', 'mrcp1', '30000000-0000-0000-0000-000000000006',
  'draft', 'advanced',
  $stem$A 40-year-old man with epilepsy on phenytoin has his dose increased due to breakthrough seizures. A week later he presents with nystagmus, ataxia and slurred speech.

Phenytoin level: significantly above the therapeutic range.$stem$,
  'What pharmacokinetic principle best explains why a modest dose increase led to a disproportionately large rise in his phenytoin level?',
  array['phenytoin','pharmacokinetics','zero-order kinetics']
),

-- 12. Beta-blocker overdose
(
  'c0000000-0000-0000-0000-000000000012', 'mrcp1', '30000000-0000-0000-0000-000000000006',
  'draft', 'advanced',
  $stem$A 30-year-old woman ingests a large quantity of propranolol in an overdose. She is bradycardic and hypotensive, unresponsive to IV fluids and atropine.$stem$,
  'What is the most appropriate next treatment?',
  array['beta-blocker overdose','glucagon']
),

-- 13. Flucloxacillin cholestatic DILI
(
  'c0000000-0000-0000-0000-000000000013', 'mrcp1', '30000000-0000-0000-0000-000000000006',
  'draft', 'advanced',
  $stem$A 62-year-old man is treated with a 2-week course of flucloxacillin for cellulitis. Several weeks after completing the course he develops jaundice, pruritus and pale stools.

LFTs: markedly raised ALP and bilirubin, mildly raised ALT (a cholestatic pattern).$stem$,
  'What is the most likely diagnosis?',
  array['drug-induced liver injury','cholestasis']
),

-- 14. Clopidogrel-PPI interaction
(
  'c0000000-0000-0000-0000-000000000014', 'mrcp1', '30000000-0000-0000-0000-000000000006',
  'draft', 'advanced',
  $stem$A 66-year-old man who had a coronary stent inserted 2 months ago is taking clopidogrel and aspirin. His GP starts omeprazole for dyspepsia. He is later found to have in-stent thrombosis.$stem$,
  'What is the most likely explanation for reduced clopidogrel efficacy in this patient?',
  array['clopidogrel','drug interaction','CYP2C19']
),

-- 15. Digoxin-amiodarone interaction
(
  'c0000000-0000-0000-0000-000000000015', 'mrcp1', '30000000-0000-0000-0000-000000000006',
  'draft', 'advanced',
  $stem$A 75-year-old woman on long-term digoxin for atrial fibrillation is started on amiodarone for recurrent arrhythmia. Two weeks later she develops nausea and visual disturbance, and is found to have a digoxin level well above the therapeutic range, despite no change in her digoxin dose.$stem$,
  'What is the most likely explanation?',
  array['digoxin','amiodarone','drug interaction']
)

on conflict (id) do nothing;

-- ---------------------------------------------------------------------------
-- Options
-- ---------------------------------------------------------------------------

insert into question_options (question_id, label, option_text, is_correct, rationale, sort_order) values

-- Q1 Paracetamol
('c0000000-0000-0000-0000-000000000001', 'A', 'IV N-acetylcysteine', true,
 $r$Correct. A paracetamol level above the treatment nomogram line after a single acute ingestion indicates significant risk of hepatotoxicity; IV NAC replenishes hepatic glutathione and prevents or limits hepatocellular injury.$r$, 1),
('c0000000-0000-0000-0000-000000000001', 'B', 'Oral activated charcoal only', false,
 $r$Ruled out because charcoal is only effective within about 1 hour of ingestion and would not be appropriate as sole treatment now at 3 hours with a level already above the treatment threshold.$r$, 2),
('c0000000-0000-0000-0000-000000000001', 'C', 'Discharge with outpatient follow-up', false,
 $r$Ruled out because a level above the treatment line indicates significant hepatotoxicity risk requiring urgent treatment, not discharge.$r$, 3),
('c0000000-0000-0000-0000-000000000001', 'D', 'IV vitamin K', false,
 $r$Ruled out because vitamin K treats coagulopathy, not the underlying hepatocellular injury from paracetamol; NAC is the specific antidote.$r$, 4),
('c0000000-0000-0000-0000-000000000001', 'E', 'Haemodialysis', false,
 $r$Ruled out because dialysis is not first-line for paracetamol overdose, reserved for exceptional cases of massive ingestion; NAC is standard first-line treatment.$r$, 5),

-- Q2 Warfarin
('c0000000-0000-0000-0000-000000000002', 'A', 'IV vitamin K plus prothrombin complex concentrate', true,
 $r$Correct. Major life-threatening bleeding on warfarin requires immediate reversal with PCC for rapid factor replacement plus IV vitamin K for sustained reversal.$r$, 1),
('c0000000-0000-0000-0000-000000000002', 'B', 'IV vitamin K alone', false,
 $r$Ruled out because vitamin K alone takes 6-24 hours to reverse the INR; PCC is needed for immediate factor replacement in life-threatening bleeding.$r$, 2),
('c0000000-0000-0000-0000-000000000002', 'C', 'Fresh frozen plasma alone', false,
 $r$Ruled out because FFP is slower and less effective at correcting INR than PCC and requires larger volumes; PCC is preferred first-line.$r$, 3),
('c0000000-0000-0000-0000-000000000002', 'D', 'Withhold warfarin and observe', false,
 $r$Ruled out because this is inadequate for major life-threatening bleeding, which requires active reversal.$r$, 4),
('c0000000-0000-0000-0000-000000000002', 'E', 'Protamine sulfate', false,
 $r$Ruled out because protamine reverses heparin, not warfarin.$r$, 5),

-- Q3 Serotonin syndrome
('c0000000-0000-0000-0000-000000000003', 'A', 'Serotonin syndrome', true,
 $r$Correct. Rapid onset after starting a second serotonergic drug (tramadol) on top of an SSRI, with hyperreflexia, clonus, myoclonus and autonomic instability, is classic for serotonin syndrome.$r$, 1),
('c0000000-0000-0000-0000-000000000003', 'B', 'Neuroleptic malignant syndrome', false,
 $r$Ruled out because NMS typically develops over days with antipsychotic use, presenting with lead-pipe rigidity and hyporeflexia, not hyperreflexia and clonus.$r$, 2),
('c0000000-0000-0000-0000-000000000003', 'C', 'Malignant hyperthermia', false,
 $r$Ruled out because this is triggered by volatile anaesthetics or suxamethonium in a surgical setting, not oral serotonergic drugs.$r$, 3),
('c0000000-0000-0000-0000-000000000003', 'D', 'Anticholinergic toxicity', false,
 $r$Ruled out because this causes dry skin and mydriasis without hyperreflexia or clonus, unlike the diaphoresis and neuromuscular hyperactivity described.$r$, 4),
('c0000000-0000-0000-0000-000000000003', 'E', 'Sepsis', false,
 $r$Ruled out because sepsis would not produce the specific neuromuscular findings temporally linked to a new serotonergic drug.$r$, 5),

-- Q4 Lithium
('c0000000-0000-0000-0000-000000000004', 'A', 'Lithium toxicity', true,
 $r$Correct. Coarse tremor, ataxia and confusion with a markedly elevated lithium level, precipitated by an NSAID and dehydration, is diagnostic of lithium toxicity.$r$, 1),
('c0000000-0000-0000-0000-000000000004', 'B', 'Serotonin syndrome', false,
 $r$Ruled out because this patient is not on a serotonergic drug combination, and the elevated lithium level directly confirms the diagnosis instead.$r$, 2),
('c0000000-0000-0000-0000-000000000004', 'C', 'Delirium tremens', false,
 $r$Ruled out because there is no history of alcohol withdrawal, and the elevated lithium level points specifically to lithium toxicity.$r$, 3),
('c0000000-0000-0000-0000-000000000004', 'D', 'Hepatic encephalopathy', false,
 $r$Ruled out because there is no evidence of liver disease, and the elevated lithium level explains the presentation directly.$r$, 4),
('c0000000-0000-0000-0000-000000000004', 'E', 'Hypothyroidism', false,
 $r$Ruled out because although lithium can cause chronic hypothyroidism, this acute presentation with a markedly elevated level is toxicity, not hypothyroid decompensation.$r$, 5),

-- Q5 ACEi hyperkalaemia
('c0000000-0000-0000-0000-000000000005', 'A', 'Stop the ACE inhibitor and recheck renal function and potassium', true,
 $r$Correct. A significant rise in creatinine and hyperkalaemia after starting an ACE inhibitor, especially with pre-existing renal impairment, requires stopping the drug and rechecking bloods.$r$, 1),
('c0000000-0000-0000-0000-000000000005', 'B', 'Increase the ramipril dose', false,
 $r$Ruled out because increasing the dose would worsen the hyperkalaemia and renal impairment.$r$, 2),
('c0000000-0000-0000-0000-000000000005', 'C', 'Continue ramipril and add a potassium-binding resin only', false,
 $r$Ruled out because continuing the likely causative drug without addressing the cause is inappropriate; the drug should be stopped first.$r$, 3),
('c0000000-0000-0000-0000-000000000005', 'D', 'Start emergency haemodialysis', false,
 $r$Ruled out because a potassium of 6.4 mmol/L without ECG changes does not mandate emergency dialysis; stopping the causative drug and rechecking is the appropriate first step.$r$, 4),
('c0000000-0000-0000-0000-000000000005', 'E', 'Switch to a higher dose of an angiotensin receptor blocker', false,
 $r$Ruled out because ARBs have a similar mechanism (reduced aldosterone, reduced renal perfusion) and would likely cause the same problem.$r$, 5),

-- Q6 Statin rhabdo
('c0000000-0000-0000-0000-000000000006', 'A', 'Statin-induced rhabdomyolysis due to CYP3A4 inhibition by clarithromycin', true,
 $r$Correct. Clarithromycin is a potent CYP3A4 inhibitor, markedly raising simvastatin levels (simvastatin is CYP3A4-metabolised), precipitating rhabdomyolysis, evidenced by the markedly raised CK and myoglobinuric urine.$r$, 1),
('c0000000-0000-0000-0000-000000000006', 'B', 'Viral myositis', false,
 $r$Ruled out because the temporal relationship with starting clarithromycin and the specific interaction mechanism better explain the markedly elevated CK than a coincidental viral illness.$r$, 2),
('c0000000-0000-0000-0000-000000000006', 'C', 'Polymyalgia rheumatica', false,
 $r$Ruled out because PMR causes proximal stiffness with a raised ESR/CRP, not markedly elevated CK or myoglobinuria.$r$, 3),
('c0000000-0000-0000-0000-000000000006', 'D', 'Guillain-Barre syndrome', false,
 $r$Ruled out because GBS causes ascending weakness with areflexia, not markedly elevated CK and myoglobinuric urine.$r$, 4),
('c0000000-0000-0000-0000-000000000006', 'E', 'Acute kidney injury from direct clarithromycin nephrotoxicity', false,
 $r$Ruled out because clarithromycin is not directly nephrotoxic in this way; the renal impairment here follows from myoglobin-induced injury from rhabdomyolysis.$r$, 5),

-- Q7 Opioid toxicity
('c0000000-0000-0000-0000-000000000007', 'A', 'IV/IM naloxone', true,
 $r$Correct. Respiratory depression, pinpoint pupils and reduced consciousness in the context of likely opioid use is classic opioid toxicity; naloxone is the specific antidote and should be given immediately.$r$, 1),
('c0000000-0000-0000-0000-000000000007', 'B', 'Flumazenil', false,
 $r$Ruled out because flumazenil reverses benzodiazepine toxicity; pinpoint pupils are specific to opioid, not benzodiazepine, toxicity.$r$, 2),
('c0000000-0000-0000-0000-000000000007', 'C', 'IV N-acetylcysteine', false,
 $r$Ruled out because NAC treats paracetamol toxicity; there is no indication of paracetamol overdose here.$r$, 3),
('c0000000-0000-0000-0000-000000000007', 'D', 'IV glucagon', false,
 $r$Ruled out because glucagon is used for beta-blocker or calcium channel blocker overdose, not opioid toxicity.$r$, 4),
('c0000000-0000-0000-0000-000000000007', 'E', 'Activated charcoal', false,
 $r$Ruled out because reduced consciousness and respiratory depression make airway protection and reversal the priority; charcoal risks aspiration in an unprotected airway.$r$, 5),

-- Q8 TCA overdose
('c0000000-0000-0000-0000-000000000008', 'A', 'IV sodium bicarbonate', true,
 $r$Correct. QRS widening in TCA overdose reflects cardiac sodium channel blockade; IV sodium bicarbonate increases extracellular sodium and alkalinises the blood, reducing TCA binding to sodium channels and narrowing the QRS.$r$, 1),
('c0000000-0000-0000-0000-000000000008', 'B', 'IV flecainide', false,
 $r$Ruled out because flecainide is itself a sodium channel blocker and would worsen TCA cardiotoxicity.$r$, 2),
('c0000000-0000-0000-0000-000000000008', 'C', 'IV calcium gluconate', false,
 $r$Ruled out because calcium gluconate is used for calcium channel blocker overdose or hyperkalaemia, not TCA-induced sodium channel blockade.$r$, 3),
('c0000000-0000-0000-0000-000000000008', 'D', 'IV atropine', false,
 $r$Ruled out because atropine treats bradycardia; this patient has tachycardia, and atropine does not address the sodium channel blockade causing QRS widening.$r$, 4),
('c0000000-0000-0000-0000-000000000008', 'E', 'Beta-blockade', false,
 $r$Ruled out because beta-blockers can worsen hypotension and cardiac depression in TCA overdose and do not address sodium channel blockade.$r$, 5),

-- Q9 Methotrexate + trimethoprim
('c0000000-0000-0000-0000-000000000009', 'A', 'Trimethoprim potentiating methotrexate toxicity via additive folate antagonism', true,
 $r$Correct. Trimethoprim, like methotrexate, inhibits dihydrofolate reductase; co-administration causes severe additive folate antagonism, leading to bone marrow suppression and mucositis, a well-recognised dangerous interaction.$r$, 1),
('c0000000-0000-0000-0000-000000000009', 'B', 'Direct trimethoprim-induced bone marrow suppression alone', false,
 $r$Ruled out because the temporal relationship with methotrexate and the specific additive-folate-antagonism mechanism is the key interaction being tested here, not trimethoprim acting alone.$r$, 2),
('c0000000-0000-0000-0000-000000000009', 'C', 'Methotrexate-induced pulmonary fibrosis', false,
 $r$Ruled out because this presents with progressive dyspnoea and cough, not mucositis and pancytopenia.$r$, 3),
('c0000000-0000-0000-0000-000000000009', 'D', 'Autoimmune haemolytic anaemia from rheumatoid arthritis', false,
 $r$Ruled out because this would cause anaemia with evidence of haemolysis alone, not pancytopenia with mucositis following a new interacting drug.$r$, 4),
('c0000000-0000-0000-0000-000000000009', 'E', 'Viral infection causing pancytopenia', false,
 $r$Ruled out because the temporal relationship with starting trimethoprim and the known drug interaction better explain this presentation than a coincidental viral illness.$r$, 5),

-- Q10 Aminoglycoside
('c0000000-0000-0000-0000-000000000010', 'A', 'Aminoglycoside-induced ototoxicity and nephrotoxicity', true,
 $r$Correct. Gentamicin causes dose- and duration-dependent ototoxicity (vestibular/cochlear) and nephrotoxicity, particularly with prolonged courses, requiring therapeutic level monitoring.$r$, 1),
('c0000000-0000-0000-0000-000000000010', 'B', 'Progression of the underlying pyelonephritis', false,
 $r$Ruled out because worsening infection would not specifically cause tinnitus and vestibular unsteadiness, which are specific to aminoglycoside toxicity.$r$, 2),
('c0000000-0000-0000-0000-000000000010', 'C', 'Vestibular neuritis', false,
 $r$Ruled out because this is typically self-limiting and unrelated to gentamicin; the temporal relationship with a nephrotoxic/ototoxic drug better explains both findings together.$r$, 3),
('c0000000-0000-0000-0000-000000000010', 'D', $o$Meniere's disease$o$, false,
 $r$Ruled out because this is a chronic, relapsing condition, not an acute new presentation temporally linked to starting an ototoxic drug.$r$, 4),
('c0000000-0000-0000-0000-000000000010', 'E', 'Sepsis-associated acute kidney injury alone', false,
 $r$Ruled out because this would not explain the tinnitus and unsteadiness, which are specific to aminoglycoside ototoxicity.$r$, 5),

-- Q11 Phenytoin
('c0000000-0000-0000-0000-000000000011', 'A', 'Zero-order (saturation) kinetics', true,
 $r$Correct. Phenytoin metabolism becomes saturated at therapeutic doses, so above a certain dose small increases can cause disproportionately large rises in plasma level, explaining the toxicity seen here.$r$, 1),
('c0000000-0000-0000-0000-000000000011', 'B', 'First-order kinetics', false,
 $r$Ruled out because first-order kinetics would predict a proportional, not disproportionate, rise in level with a dose increase.$r$, 2),
('c0000000-0000-0000-0000-000000000011', 'C', 'Enzyme induction', false,
 $r$Ruled out because enzyme induction would lower phenytoin levels over time by increasing its own metabolism, the opposite of what is seen here.$r$, 3),
('c0000000-0000-0000-0000-000000000011', 'D', 'Increased protein binding', false,
 $r$Ruled out because increased protein binding would reduce free drug levels, not explain a toxic rise.$r$, 4),
('c0000000-0000-0000-0000-000000000011', 'E', 'Reduced renal clearance', false,
 $r$Ruled out because phenytoin is primarily hepatically metabolised, not renally cleared, so renal function is not the main determinant of its levels.$r$, 5),

-- Q12 Beta-blocker overdose
('c0000000-0000-0000-0000-000000000012', 'A', 'IV glucagon', true,
 $r$Correct. Glucagon bypasses the blocked beta-adrenergic receptor by directly activating cardiac adenylate cyclase, improving heart rate and contractility, making it the specific antidote for beta-blocker overdose refractory to atropine.$r$, 1),
('c0000000-0000-0000-0000-000000000012', 'B', 'IV adrenaline at standard dose', false,
 $r$Ruled out because beta-receptor blockade limits the effect of standard-dose adrenaline; glucagon is the specific first-line antidote that bypasses the blocked receptor.$r$, 2),
('c0000000-0000-0000-0000-000000000012', 'C', 'IV calcium gluconate as first-line', false,
 $r$Ruled out because calcium is first-line for calcium channel blocker overdose; glucagon is the specific first-line antidote for beta-blocker toxicity.$r$, 3),
('c0000000-0000-0000-0000-000000000012', 'D', 'Further IV atropine', false,
 $r$Ruled out because the patient is already unresponsive to atropine, indicating receptor blockade rather than simple vagal tone needs to be addressed.$r$, 4),
('c0000000-0000-0000-0000-000000000012', 'E', 'IV digoxin', false,
 $r$Ruled out because digoxin does not address beta-receptor blockade and carries its own toxicity risk, with no role in beta-blocker overdose.$r$, 5),

-- Q13 Flucloxacillin DILI
('c0000000-0000-0000-0000-000000000013', 'A', 'Flucloxacillin-induced cholestatic drug-induced liver injury', true,
 $r$Correct. Flucloxacillin is a well-recognised cause of delayed-onset cholestatic hepatitis, occurring weeks after completing the course, with jaundice, pruritus and a cholestatic LFT pattern.$r$, 1),
('c0000000-0000-0000-0000-000000000013', 'B', 'Acute viral hepatitis', false,
 $r$Ruled out because viral hepatitis typically causes a hepatocellular (ALT-predominant) pattern, not the cholestatic pattern described, with a clear temporal drug link here instead.$r$, 2),
('c0000000-0000-0000-0000-000000000013', 'C', 'Gallstone-related common bile duct obstruction', false,
 $r$Ruled out because there is no biliary colic history, and the clear temporal relationship with a known hepatotoxic drug is more specific.$r$, 3),
('c0000000-0000-0000-0000-000000000013', 'D', 'Autoimmune hepatitis', false,
 $r$Ruled out because this typically causes a hepatocellular pattern and is not temporally linked to a specific antibiotic course.$r$, 4),
('c0000000-0000-0000-0000-000000000013', 'E', 'Paracetamol-induced hepatotoxicity', false,
 $r$Ruled out because paracetamol toxicity causes an acute hepatocellular (markedly raised ALT) pattern, not a delayed cholestatic pattern weeks after antibiotic use.$r$, 5),

-- Q14 Clopidogrel-PPI
('c0000000-0000-0000-0000-000000000014', 'A', 'Omeprazole inhibiting CYP2C19-mediated activation of clopidogrel', true,
 $r$Correct. Clopidogrel is a prodrug requiring hepatic activation via CYP2C19; omeprazole is a potent CYP2C19 inhibitor, reducing formation of the active metabolite and antiplatelet effect, a recognised cause of stent thrombosis.$r$, 1),
('c0000000-0000-0000-0000-000000000014', 'B', 'Omeprazole reducing clopidogrel absorption', false,
 $r$Ruled out because the mechanism is hepatic enzyme inhibition affecting drug activation, not reduced gastrointestinal absorption.$r$, 2),
('c0000000-0000-0000-0000-000000000014', 'C', 'Aspirin resistance', false,
 $r$Ruled out because there is no specific evidence of aspirin resistance; the known omeprazole-clopidogrel interaction is the more precise explanation.$r$, 3),
('c0000000-0000-0000-0000-000000000014', 'D', 'Poor compliance with dual antiplatelet therapy', false,
 $r$Ruled out because a specific, well-recognised pharmacological interaction is described, a more precise explanation than assumed non-adherence.$r$, 4),
('c0000000-0000-0000-0000-000000000014', 'E', 'Simple in-stent restenosis unrelated to drug therapy', false,
 $r$Ruled out because restenosis is typically a gradual process from neointimal proliferation, not acute thrombosis, and does not explain the temporal drug relationship.$r$, 5),

-- Q15 Digoxin-amiodarone
('c0000000-0000-0000-0000-000000000015', 'A', 'Amiodarone reducing renal and non-renal clearance of digoxin, raising its plasma level', true,
 $r$Correct. Amiodarone reduces both renal tubular secretion and P-glycoprotein-mediated clearance of digoxin, roughly doubling plasma digoxin concentration even without a dose change — a well-recognised interaction.$r$, 1),
('c0000000-0000-0000-0000-000000000015', 'B', 'Coincidental deterioration in renal function unrelated to amiodarone', false,
 $r$Ruled out because the well-documented pharmacokinetic interaction between amiodarone and digoxin, and the clear temporal relationship, is the recognised explanation here.$r$, 2),
('c0000000-0000-0000-0000-000000000015', 'C', 'Amiodarone increasing digoxin absorption from the gut', false,
 $r$Ruled out because the interaction is mediated by reduced clearance, not increased intestinal absorption.$r$, 3),
('c0000000-0000-0000-0000-000000000015', 'D', 'Amiodarone-induced hyperthyroidism increasing digoxin sensitivity', false,
 $r$Ruled out because the mechanism being tested here is the pharmacokinetic clearance interaction, and there is no evidence of thyrotoxicosis in this vignette.$r$, 4),
('c0000000-0000-0000-0000-000000000015', 'E', 'Digoxin toxicity unrelated to any drug interaction', false,
 $r$Ruled out because the clear temporal relationship with starting amiodarone, a well-documented interacting drug, points specifically to a pharmacokinetic interaction.$r$, 5)

on conflict (question_id, label) do nothing;

-- ---------------------------------------------------------------------------
-- Discriminators
-- ---------------------------------------------------------------------------

insert into question_discriminators (question_id, discriminator_text, sort_order) values

('c0000000-0000-0000-0000-000000000001', 'A plasma paracetamol level above the treatment nomogram line after a single acute ingestion is the indication for starting NAC.', 1),
('c0000000-0000-0000-0000-000000000001', 'NAC works by replenishing hepatic glutathione, which detoxifies the toxic metabolite NAPQI.', 2),
('c0000000-0000-0000-0000-000000000001', 'Activated charcoal is only useful within about 1 hour of ingestion, too late to be the primary intervention here.', 3),

('c0000000-0000-0000-0000-000000000002', 'Major bleeding on warfarin requires rapid reversal with PCC, not vitamin K alone which is too slow.', 1),
('c0000000-0000-0000-0000-000000000002', 'PCC provides immediate replacement of vitamin K-dependent clotting factors (II, VII, IX, X).', 2),
('c0000000-0000-0000-0000-000000000002', 'Protamine is specific to heparin reversal and has no role in warfarin reversal.', 3),

('c0000000-0000-0000-0000-000000000003', 'Rapid onset after adding a second serotonergic agent is characteristic of serotonin syndrome, versus the more gradual onset of NMS.', 1),
('c0000000-0000-0000-0000-000000000003', 'Hyperreflexia and clonus distinguish serotonin syndrome from NMS, which causes hyporeflexia and lead-pipe rigidity.', 2),
('c0000000-0000-0000-0000-000000000003', 'The combination of an SSRI plus a serotonergic opioid (tramadol) is a recognised precipitant.', 3),

('c0000000-0000-0000-0000-000000000004', 'A lithium level well above the therapeutic range confirms toxicity as the cause of the neurological picture.', 1),
('c0000000-0000-0000-0000-000000000004', 'NSAIDs reduce renal lithium clearance by inhibiting prostaglandin-mediated renal blood flow, precipitating toxicity.', 2),
('c0000000-0000-0000-0000-000000000004', 'Dehydration reduces lithium excretion further, a recognised and common precipitant of toxicity.', 3),

('c0000000-0000-0000-0000-000000000005', 'A significant rise in creatinine after starting an ACE inhibitor is a recognised threshold prompting the drug to be stopped and investigated.', 1),
('c0000000-0000-0000-0000-000000000005', 'ACE inhibitors reduce aldosterone secretion, predisposing to hyperkalaemia, especially in pre-existing renal impairment.', 2),
('c0000000-0000-0000-0000-000000000005', 'Stopping the likely causative drug and rechecking bloods is the appropriate initial step before more invasive measures.', 3),

('c0000000-0000-0000-0000-000000000006', 'A markedly elevated CK with dark, myoglobinuric urine confirms rhabdomyolysis.', 1),
('c0000000-0000-0000-0000-000000000006', $d$Clarithromycin's inhibition of CYP3A4, the enzyme that metabolises simvastatin, is a well-recognised interaction precipitating statin toxicity.$d$, 2),
('c0000000-0000-0000-0000-000000000006', 'The temporal relationship with starting the interacting drug supports a drug-interaction cause over other myopathies.', 3),

('c0000000-0000-0000-0000-000000000007', 'Pinpoint pupils with respiratory depression and reduced consciousness is the classic triad of opioid toxicity.', 1),
('c0000000-0000-0000-0000-000000000007', 'Naloxone is a specific, rapidly-acting opioid receptor antagonist that reverses respiratory depression.', 2),
('c0000000-0000-0000-0000-000000000007', 'Charcoal is contraindicated in a patient with reduced consciousness and an unprotected airway due to aspiration risk.', 3),

('c0000000-0000-0000-0000-000000000008', 'QRS widening (>100ms) in TCA overdose reflects cardiac sodium channel blockade and predicts ventricular arrhythmia risk.', 1),
('c0000000-0000-0000-0000-000000000008', 'Sodium bicarbonate works by increasing extracellular sodium and alkalinising serum pH, both reducing TCA binding to sodium channels.', 2),
('c0000000-0000-0000-0000-000000000008', 'Drugs that further block sodium or calcium channels are contraindicated as they would worsen cardiotoxicity.', 3),

('c0000000-0000-0000-0000-000000000009', 'Both methotrexate and trimethoprim inhibit dihydrofolate reductase, so co-administration causes dangerous additive folate antagonism.', 1),
('c0000000-0000-0000-0000-000000000009', 'Mucositis alongside pancytopenia reflects toxicity to rapidly-dividing cells from severe folate deficiency.', 2),
('c0000000-0000-0000-0000-000000000009', 'The temporal relationship with starting a new interacting drug is key to recognising a preventable drug interaction.', 3),

('c0000000-0000-0000-0000-000000000010', 'Aminoglycosides cause dose-dependent, cumulative ototoxicity affecting both vestibular and cochlear function.', 1),
('c0000000-0000-0000-0000-000000000010', 'Concurrent nephrotoxicity is a recognised and related adverse effect requiring level monitoring and dose adjustment.', 2),
('c0000000-0000-0000-0000-000000000010', 'The temporal relationship with a prolonged aminoglycoside course, not the underlying infection, best explains both findings together.', 3),

('c0000000-0000-0000-0000-000000000011', 'Phenytoin exhibits zero-order kinetics once hepatic metabolic enzymes are saturated, so small dose increases can cause disproportionate rises in plasma level.', 1),
('c0000000-0000-0000-0000-000000000011', 'Nystagmus, ataxia and slurred speech are classic clinical signs of phenytoin toxicity.', 2),
('c0000000-0000-0000-0000-000000000011', 'This saturation kinetic behaviour is why phenytoin dose increases should be small and levels monitored closely.', 3),

('c0000000-0000-0000-0000-000000000012', 'Glucagon bypasses the blocked beta-adrenergic receptor by directly stimulating adenylate cyclase, making it the specific antidote for beta-blocker toxicity.', 1),
('c0000000-0000-0000-0000-000000000012', 'Failure to respond to atropine indicates the bradycardia is due to receptor blockade rather than simple vagal tone.', 2),
('c0000000-0000-0000-0000-000000000012', 'Beta-blocker overdose classically causes combined bradycardia and hypotension refractory to standard fluid resuscitation.', 3),

('c0000000-0000-0000-0000-000000000013', 'Flucloxacillin is a classically recognised cause of delayed cholestatic drug-induced liver injury, presenting weeks after the drug is stopped.', 1),
('c0000000-0000-0000-0000-000000000013', 'A cholestatic LFT pattern (ALP and bilirubin disproportionately raised relative to ALT) points to biliary rather than hepatocellular injury.', 2),
('c0000000-0000-0000-0000-000000000013', 'A clear temporal relationship with a recent antibiotic course, absent other risk factors, supports a drug-induced cause.', 3),

('c0000000-0000-0000-0000-000000000014', 'Clopidogrel requires hepatic CYP2C19-mediated conversion to its active metabolite to exert an antiplatelet effect.', 1),
('c0000000-0000-0000-0000-000000000014', 'Omeprazole is a potent CYP2C19 inhibitor, reducing clopidogrel activation more than other PPIs.', 2),
('c0000000-0000-0000-0000-000000000014', 'The temporal relationship between starting the interacting drug and the thrombotic event supports a pharmacokinetic interaction as the cause.', 3),

('c0000000-0000-0000-0000-000000000015', 'Amiodarone reduces both renal and P-glycoprotein-mediated clearance of digoxin, a well-documented and clinically important interaction.', 1),
('c0000000-0000-0000-0000-000000000015', 'Digoxin doses are typically halved when amiodarone is started, reflecting the significant expected rise in plasma level.', 2),
('c0000000-0000-0000-0000-000000000015', 'The temporal relationship between starting amiodarone and developing toxicity, without any digoxin dose change, points to a pharmacokinetic interaction.', 3);
