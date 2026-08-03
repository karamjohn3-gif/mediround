-- MRCP Part 1 — Renal medicine batch 1 (50 questions). This is the first
-- content batch for this topic (0 questions previously live), covering: AKI
-- classification (prerenal/intrinsic/postrenal) and KDIGO staging; AKI vs
-- CKD differentiation including the recognised exceptions (ADPKD, diabetic
-- nephropathy, amyloidosis, HIV-associated nephropathy) where kidney size
-- does not reliably distinguish acute from chronic disease; nephrotoxic
-- drug management in AKI (which drugs to stop vs continue, the "triple
-- whammy", metformin/contrast risk); nephrology referral criteria; CKD
-- staging and complications (CKD-MBD/secondary hyperparathyroidism, anaemia
-- of CKD, renal tubular acidosis types 1 and 4); glomerulonephritis subtypes
-- (IgA nephropathy, post-streptococcal GN, membranous nephropathy, minimal
-- change disease, FSGS/HIV-associated nephropathy, anti-GBM disease,
-- ANCA-associated vasculitis); nephrotic vs nephritic syndrome; renal artery
-- stenosis; ADPKD; renal amyloidosis; hyperkalaemia recognition and
-- emergency management; rhabdomyolysis; tumour lysis syndrome; renal stones
-- and imaging; pyelonephritis vs lower UTI and antibiotic choice; drug-
-- induced acute interstitial nephritis; lupus nephritis; diabetic
-- nephropathy; dialysis indications (AEIOU); renal transplant rejection;
-- SIADH vs diabetes insipidus; myeloma cast nephropathy; and haemolytic
-- uraemic syndrome vs thrombotic thrombocytopenic purpura.
--
-- STATUS: status='published' — per explicit instruction from the person
-- who commissioned this batch, these questions are inserted directly as
-- published (no draft-then-review step for this batch). This content has
-- NOT been individually reviewed by a clinician or MRCP-specific medical
-- educator; it has been checked by the writing model against standard UK
-- reference sources (KDIGO 2012 AKI guideline, NICE NG148 AKI, NICE NG203
-- CKD, NICE NG111 UTI/pyelonephritis, NICE NG28/NG17 type 2/type 1 diabetes,
-- Renal Association / UK Kidney Association guidance, Resuscitation Council
-- UK hyperkalaemia guidance, standard MRCP1-level textbook renal physiology
-- and pathology) to a solid standard, but has not been checked by a human
-- with relevant clinical expertise.
--
-- Format follows mrcp1-cardiology-batch2.sql exactly (dollar-quoting for
-- stem/rationale/discriminator free text; plain-quoted lead_in with ''
-- escaping if ever needed; on conflict clauses on questions and options).
--
-- Run after the topics migrations (0001-0004) and seed.sql, via the SQL
-- Editor.

insert into questions (id, exam, topic_id, status, difficulty, stem, lead_in, tags) values

-- 1. AKI KDIGO stage 1 creatinine criteria
(
  '60000000-0000-0000-0000-000000000001', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'foundation',
  $stem$A 72-year-old man admitted with a chest infection has a serum creatinine that rises from a baseline of 80 micromol/L to 115 micromol/L over 36 hours. His urine output remains normal throughout.$stem$,
  'According to KDIGO criteria, which stage of acute kidney injury does this rise in creatinine meet?',
  array['AKI','KDIGO staging','creatinine criteria']
),

-- 2. Anti-GBM antibody / Goodpasture disease
(
  '60000000-0000-0000-0000-000000000002', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'foundation',
  $stem$A 24-year-old man presents with haemoptysis and haematuria over 2 weeks. Renal biopsy shows linear IgG deposition along the glomerular basement membrane.$stem$,
  'Which antibody is most strongly associated with this presentation?',
  array['anti-GBM disease','Goodpasture disease','antibody']
),

-- 3. Nephrotic syndrome triad
(
  '60000000-0000-0000-0000-000000000003', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'foundation',
  $stem$A 6-year-old boy presents with periorbital and leg swelling. Urinalysis shows heavy proteinuria, and blood tests show a serum albumin of 18 g/L and a raised cholesterol.$stem$,
  'Which combination of features defines nephrotic syndrome?',
  array['nephrotic syndrome','proteinuria','hypoalbuminaemia']
),

-- 4. Nephritic syndrome defining feature
(
  '60000000-0000-0000-0000-000000000004', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'foundation',
  $stem$A 9-year-old girl presents with dark, tea-coloured urine, mild facial swelling and a blood pressure of 132/88 mmHg two weeks after a sore throat. Urine microscopy shows red cell casts and dysmorphic red cells.$stem$,
  'Which finding is most specific for a nephritic, rather than a nephrotic, process?',
  array['nephritic syndrome','red cell casts','glomerulonephritis']
),

-- 5. CKD staging eGFR categories
(
  '60000000-0000-0000-0000-000000000005', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'foundation',
  $stem$A 60-year-old woman has two eGFR measurements of 42 and 38 mL/min/1.73m2, taken 4 months apart, with no evidence of an acute change in renal function.$stem$,
  'Which CKD (eGFR) stage does this correspond to?',
  array['CKD staging','eGFR categories']
),

-- 6. Minimal change disease
(
  '60000000-0000-0000-0000-000000000006', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'foundation',
  $stem$A 4-year-old boy presents with sudden-onset generalised oedema and heavy proteinuria. Renal biopsy is normal on light microscopy; electron microscopy shows effacement of podocyte foot processes.$stem$,
  'What is the most likely diagnosis, and its expected response to treatment?',
  array['minimal change disease','nephrotic syndrome','children']
),

-- 7. IgA nephropathy
(
  '60000000-0000-0000-0000-000000000007', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'foundation',
  $stem$A 22-year-old man develops visible haematuria 1-2 days after an upper respiratory tract infection, with recurrent similar episodes accompanying subsequent infections. Renal biopsy shows mesangial IgA deposition.$stem$,
  'What is the most likely diagnosis?',
  array['IgA nephropathy','synpharyngitic haematuria']
),

-- 8. Post-streptococcal GN
(
  '60000000-0000-0000-0000-000000000008', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'foundation',
  $stem$A 7-year-old boy develops dark urine, periorbital swelling and hypertension 2 weeks after a sore throat. Blood tests show a low C3 level, which normalises over the following weeks.$stem$,
  'What is the most likely diagnosis?',
  array['post-streptococcal glomerulonephritis','complement']
),

-- 9. ADPKD genetics
(
  '60000000-0000-0000-0000-000000000009', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'foundation',
  $stem$A 35-year-old woman is found to have multiple bilateral renal cysts on an ultrasound performed for vague loin discomfort. Her father had similar findings and progressed to end-stage renal disease in his 60s.$stem$,
  'Which gene is most commonly implicated in this condition?',
  array['ADPKD','PKD1','genetics']
),

-- 10. Renal artery stenosis + ACEi mechanism
(
  '60000000-0000-0000-0000-000000000010', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'foundation',
  $stem$A 68-year-old man with bilateral renal artery stenosis is started on ramipril for hypertension. Within days his creatinine rises sharply.$stem$,
  'What is the mechanism underlying this deterioration in renal function?',
  array['renal artery stenosis','ACE inhibitor','efferent arteriole']
),

-- 11. RTA type 1 (distal)
(
  '60000000-0000-0000-0000-000000000011', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'foundation',
  $stem$A 40-year-old woman with an autoimmune connective tissue disease presents with recurrent renal stones and a low serum potassium. Her urine pH remains persistently above 5.5 despite a systemic metabolic acidosis.$stem$,
  'What is the most likely diagnosis?',
  array['renal tubular acidosis','type 1 RTA','nephrocalcinosis']
),

-- 12. Renal amyloidosis
(
  '60000000-0000-0000-0000-000000000012', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'foundation',
  $stem$A 65-year-old man with longstanding rheumatoid arthritis develops nephrotic-range proteinuria. A renal biopsy stained with Congo red shows apple-green birefringence under polarised light.$stem$,
  'What is the most likely diagnosis?',
  array['renal amyloidosis','AA amyloid','Congo red']
),

-- 13. Hyperkalaemia earliest ECG change
(
  '60000000-0000-0000-0000-000000000013', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'foundation',
  $stem$A patient with chronic kidney disease is found on routine bloods to have a serum potassium of 6.2 mmol/L.$stem$,
  'What is the earliest ECG change expected as serum potassium rises?',
  array['hyperkalaemia','ECG changes','tented T waves']
),

-- 14. Calcium gluconate mechanism
(
  '60000000-0000-0000-0000-000000000014', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'foundation',
  $stem$A patient with severe hyperkalaemia and ECG changes is given IV calcium gluconate as part of emergency treatment.$stem$,
  'What is the primary mechanism of action of this treatment?',
  array['hyperkalaemia','calcium gluconate','membrane stabilisation']
),

-- 15. Rhabdomyolysis recognition
(
  '60000000-0000-0000-0000-000000000015', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'foundation',
  $stem$A 30-year-old man is found collapsed after a prolonged seizure, with dark brown urine noted on catheterisation. His creatine kinase is 45,000 U/L.$stem$,
  'What is the most likely diagnosis?',
  array['rhabdomyolysis','creatine kinase','myoglobinuria']
),

-- 16. AKI KDIGO stage 3 urine output criteria
(
  '60000000-0000-0000-0000-000000000016', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'core',
  $stem$A 55-year-old man in intensive care has passed no urine for the past 14 hours despite adequate fluid resuscitation and a patent urinary catheter.$stem$,
  'What KDIGO AKI stage does this degree of anuria correspond to?',
  array['AKI','KDIGO staging','urine output criteria']
),

-- 17. Prerenal AKI vs ATN - urine indices
(
  '60000000-0000-0000-0000-000000000017', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'core',
  $stem$A 70-year-old woman develops AKI after 3 days of vomiting and diarrhoea. Urine sodium is low (<20 mmol/L), fractional excretion of sodium is under 1%, and urine osmolality is high. Her creatinine improves promptly after IV fluid resuscitation.$stem$,
  'What is the most likely category of AKI?',
  array['prerenal AKI','fractional excretion of sodium']
),

-- 18. Postrenal AKI - bilateral hydronephrosis
(
  '60000000-0000-0000-0000-000000000018', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'core',
  $stem$A 78-year-old man with known benign prostatic hyperplasia presents with reduced urine output and suprapubic discomfort. A bladder scan shows a large residual volume, and renal ultrasound shows bilateral hydronephrosis.$stem$,
  'What is the most appropriate immediate management?',
  array['postrenal AKI','obstruction','catheterisation']
),

-- 19. AKI drug management - stop NSAID/ACEi/diuretic
(
  '60000000-0000-0000-0000-000000000019', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'core',
  $stem$A 74-year-old man taking ibuprofen (recently started for knee pain), ramipril and furosemide develops AKI, with creatinine rising from 90 to 180 micromol/L during an intercurrent chest infection with reduced oral intake.$stem$,
  'Which of his regular medications should be stopped as part of his acute management?',
  array['AKI','nephrotoxic drugs','medicines management']
),

-- 20. Metformin in AKI
(
  '60000000-0000-0000-0000-000000000020', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'core',
  $stem$A 66-year-old woman with type 2 diabetes on metformin develops AKI during severe pneumonia, with her eGFR falling from a baseline of 70 to 25 mL/min/1.73m2.$stem$,
  'What is the most appropriate action regarding her metformin?',
  array['metformin','AKI','lactic acidosis']
),

-- 21. Nephrology referral criteria
(
  '60000000-0000-0000-0000-000000000021', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'core',
  $stem$Five patients on the medical take have developed acute kidney injury.

Patient A: a 60-year-old man with AKI stage 3, hyperkalaemia refractory to medical treatment, and no improvement after a fluid challenge.
Patient B: a 50-year-old woman with AKI stage 1 due to dehydration, improving with oral fluids.
Patient C: a 45-year-old man with a creatinine rise from 70 to 90 micromol/L after starting an NSAID, resolving fully after the drug is stopped.
Patient D: a 30-year-old woman with mild prerenal AKI from vomiting, now tolerating oral fluids with improving renal function.
Patient E: a 65-year-old man with stable CKD G3a and no acute change in his creatinine.$stem$,
  'Which patient most warrants urgent nephrology referral?',
  array['AKI','nephrology referral criteria']
),

-- 22. Contrast-induced nephropathy prevention
(
  '60000000-0000-0000-0000-000000000022', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'core',
  $stem$A 68-year-old man with an eGFR of 40 mL/min/1.73m2 requires an urgent contrast-enhanced CT scan.$stem$,
  'What is the most appropriate measure to reduce his risk of contrast-induced nephropathy?',
  array['contrast-induced nephropathy','prevention','IV fluids']
),

-- 23. Triple whammy recognition
(
  '60000000-0000-0000-0000-000000000023', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'core',
  $stem$A 72-year-old woman taking ibuprofen (self-purchased for back pain), lisinopril and bendroflumethiazide becomes unwell with vomiting, and AKI subsequently develops.$stem$,
  'What is this combination of an NSAID, an ACE inhibitor and a diuretic, together with an intercurrent illness, commonly known as, given its recognised tendency to precipitate AKI?',
  array['triple whammy','nephrotoxic combination']
),

-- 24. CKD-MBD secondary hyperparathyroidism
(
  '60000000-0000-0000-0000-000000000024', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'core',
  $stem$A 55-year-old man with CKD stage G4 has the following blood results: corrected calcium low-normal, phosphate raised, parathyroid hormone markedly elevated, and 25-hydroxyvitamin D low-normal.$stem$,
  'What is the most likely explanation for this biochemical pattern?',
  array['CKD-MBD','secondary hyperparathyroidism']
),

-- 25. Anaemia of CKD
(
  '60000000-0000-0000-0000-000000000025', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'core',
  $stem$A 60-year-old woman with CKD stage G4 (eGFR 22 mL/min/1.73m2) develops progressive fatigue. Blood tests show a normocytic anaemia with normal ferritin and iron studies, and there is no evidence of bleeding.$stem$,
  'What is the most likely explanation for her anaemia, and the most appropriate treatment?',
  array['anaemia of CKD','erythropoietin']
),

-- 26. RTA type 4 (diabetic nephropathy)
(
  '60000000-0000-0000-0000-000000000026', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'core',
  $stem$A 62-year-old man with long-standing type 2 diabetes and mild CKD (eGFR 58 mL/min/1.73m2) is found to have persistent hyperkalaemia (potassium 5.8 mmol/L) with a mild hyperchloraemic metabolic acidosis. Plasma renin and aldosterone are both low.$stem$,
  'What is the most likely diagnosis?',
  array['renal tubular acidosis','type 4 RTA','diabetic nephropathy']
),

-- 27. Membranous nephropathy
(
  '60000000-0000-0000-0000-000000000027', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'core',
  $stem$A 58-year-old man presents with nephrotic syndrome. Renal biopsy shows diffuse thickening of the glomerular basement membrane with subepithelial immune deposits on electron microscopy. Serum anti-PLA2R antibody is positive.$stem$,
  'What is the most likely diagnosis?',
  array['membranous nephropathy','anti-PLA2R']
),

-- 28. FSGS / HIV-associated nephropathy
(
  '60000000-0000-0000-0000-000000000028', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'core',
  $stem$A 34-year-old man with untreated HIV infection develops nephrotic-range proteinuria and rapidly progressive renal impairment. Renal ultrasound shows large, echogenic kidneys, and biopsy shows focal segmental sclerosis with a collapsing pattern.$stem$,
  'What is the most likely diagnosis?',
  array['HIV-associated nephropathy','FSGS']
),

-- 29. Anti-GBM disease vignette
(
  '60000000-0000-0000-0000-000000000029', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'core',
  $stem$A 50-year-old man presents with haemoptysis, breathlessness and haematuria over several days. Chest X-ray shows diffuse alveolar shadowing, and urinalysis shows red cell casts. Renal biopsy shows crescentic glomerulonephritis with linear IgG deposition along the basement membrane.$stem$,
  'What is the most likely diagnosis?',
  array['anti-GBM disease','pulmonary-renal syndrome']
),

-- 30. Renal stones imaging
(
  '60000000-0000-0000-0000-000000000030', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'core',
  $stem$A 45-year-old man presents with sudden, severe left loin-to-groin pain and microscopic haematuria.$stem$,
  'What is the most appropriate first-line imaging investigation?',
  array['renal colic','renal stones','CT KUB']
),

-- 31. Pyelonephritis vs lower UTI
(
  '60000000-0000-0000-0000-000000000031', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'core',
  $stem$A 28-year-old woman presents with a fever of 38.9C, right-sided loin pain and tenderness, rigors, nausea and vomiting, in addition to dysuria and urinary frequency.$stem$,
  'What is the most likely diagnosis?',
  array['pyelonephritis','loin pain','fever']
),

-- 32. Antibiotic choice pyelonephritis
(
  '60000000-0000-0000-0000-000000000032', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'core',
  $stem$A 30-year-old non-pregnant woman is diagnosed with acute pyelonephritis. She is systemically well enough to be treated as an outpatient with oral antibiotics, in line with current NICE guidance.$stem$,
  'What is the most appropriate first-line oral antibiotic choice?',
  array['pyelonephritis','antibiotic choice','NICE guidance']
),

-- 33. Drug-induced AIN
(
  '60000000-0000-0000-0000-000000000033', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'core',
  $stem$A 60-year-old man started on omeprazole 3 weeks ago develops AKI, a low-grade fever, a skin rash, and eosinophilia on his blood film. Urinalysis shows sterile pyuria with white cell casts, and urine culture is negative.$stem$,
  'What is the most likely diagnosis?',
  array['acute interstitial nephritis','drug-induced','eosinophilia']
),

-- 34. Lupus nephritis
(
  '60000000-0000-0000-0000-000000000034', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'core',
  $stem$A 30-year-old woman with known systemic lupus erythematosus develops nephrotic-range proteinuria, haematuria and a rising creatinine. Renal biopsy shows diffuse proliferative glomerulonephritis with subendothelial immune deposits, consistent with class IV lupus nephritis.$stem$,
  'What is the most appropriate treatment approach?',
  array['lupus nephritis','class IV','immunosuppression']
),

-- 35. Diabetic nephropathy renoprotection
(
  '60000000-0000-0000-0000-000000000035', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'core',
  $stem$A 55-year-old man with type 2 diabetes is found to have a urine albumin:creatinine ratio of 4.5 mg/mmol on two separate occasions (microalbuminuria), with a blood pressure of 128/78 mmHg.$stem$,
  'What is the most appropriate management to reduce progression of his renal disease?',
  array['diabetic nephropathy','microalbuminuria','ACE inhibitor']
),

-- 36. AKI vs CKD differentiation - ADPKD exception
(
  '60000000-0000-0000-0000-000000000036', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'advanced',
  $stem$A 50-year-old man presents with AKI, his creatinine having risen to 380 micromol/L from an unknown baseline. Renal ultrasound shows bilaterally enlarged kidneys with multiple cysts. Serum calcium is normal, and there is no documented history of prior renal disease, though his father died of "kidney failure" in his 60s.$stem$,
  'Why is renal ultrasound less useful than usual here for distinguishing an acute from a chronic component to his renal impairment?',
  array['AKI vs CKD','ADPKD','ultrasound','chain reasoning']
),

-- 37. Triple whammy + intercurrent illness -> prerenal AKI -> drug accumulation
(
  '60000000-0000-0000-0000-000000000037', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'advanced',
  $stem$A 70-year-old woman has been stable for years on naproxen for osteoarthritis, ramipril for hypertension, and bendroflumethiazide. She develops a norovirus-like illness with 2 days of vomiting and diarrhoea, continuing all three medications throughout. She presents drowsy and confused.

Bloods: creatinine markedly elevated above her known baseline, potassium 6.4 mmol/L, sodium 148 mmol/L (previously normal).$stem$,
  'What is the mechanism most directly responsible for her deterioration?',
  array['triple whammy','prerenal AKI','hyperkalaemia','chain reasoning']
),

-- 38. Crush injury -> rhabdomyolysis -> myoglobin ATN -> hyperkalaemia -> cardiac arrest
(
  '60000000-0000-0000-0000-000000000038', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'advanced',
  $stem$A 45-year-old man is extracted after 6 hours trapped under rubble following a building collapse, with both legs crushed. On arrival he is alert; initial bloods show CK 65,000 U/L and potassium 5.2 mmol/L. Over the next few hours, despite IV fluids, his urine output falls and turns dark red-brown, and he then suffers a cardiac arrest with a broad, bizarre rhythm on the monitor.$stem$,
  'What is the mechanism most directly responsible for his cardiac arrest?',
  array['rhabdomyolysis','myoglobin','acute tubular necrosis','hyperkalaemia','chain reasoning']
),

-- 39. CKD -> vitamin D -> hypocalcaemia -> secondary hyperPTH -> renal osteodystrophy
(
  '60000000-0000-0000-0000-000000000039', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'advanced',
  $stem$A 58-year-old woman with CKD stage G5 on conservative management complains of diffuse bone pain and sustains a pathological fracture. Bloods: corrected calcium low, phosphate high, parathyroid hormone markedly elevated, alkaline phosphatase raised.$stem$,
  'What sequence of events most likely explains her bone pain and fracture?',
  array['CKD-MBD','renal osteodystrophy','secondary hyperparathyroidism','chain reasoning']
),

-- 40. Myeloma cast nephropathy + hypercalcaemia
(
  '60000000-0000-0000-0000-000000000040', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'advanced',
  $stem$A 70-year-old man presents with fatigue, back pain and increasing confusion. Bloods: corrected calcium markedly raised, creatinine acutely elevated from a normal baseline, haemoglobin low, ESR very high. Serum protein electrophoresis shows a monoclonal paraprotein band, and urine dipstick is only weakly positive for protein despite a heavy proteinuria on formal quantification.$stem$,
  'What is the most likely combined explanation for his acute kidney injury?',
  array['myeloma','cast nephropathy','hypercalcaemia','chain reasoning']
),

-- 41. Diabetes -> hyperfiltration -> nephropathy -> nephrotic proteinuria -> hypoalbuminaemia/oedema
(
  '60000000-0000-0000-0000-000000000041', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'advanced',
  $stem$A 52-year-old man with type 2 diabetes for 15 years, previously known to have only microalbuminuria, presents with progressive leg swelling. Bloods: albumin 22 g/L, urine albumin:creatinine ratio markedly elevated (nephrotic range), creatinine mildly elevated. Retinal screening shows background diabetic retinopathy.$stem$,
  'What sequence of events most likely explains his oedema?',
  array['diabetic nephropathy','nephrotic syndrome','hypoalbuminaemia','chain reasoning']
),

-- 42. ACEi + spironolactone + diarrhoea -> prerenal AKI -> reduced K clearance -> severe hyperkalaemia
(
  '60000000-0000-0000-0000-000000000042', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'advanced',
  $stem$A 78-year-old woman with heart failure has been stable for 3 years on ramipril and spironolactone, with normal renal function and electrolytes. She develops a gastroenteritis-type illness with 4 days of profuse watery diarrhoea, continuing both medications throughout. She is brought in drowsy with generalised muscle weakness.

Bloods: sodium 133 mmol/L, potassium 7.6 mmol/L, urea and creatinine markedly above her known baseline.$stem$,
  'What is the mechanism most directly responsible for her severe hyperkalaemia?',
  array['ACE inhibitor','spironolactone','prerenal AKI','hyperkalaemia','chain reasoning']
),

-- 43. Tumour lysis syndrome
(
  '60000000-0000-0000-0000-000000000043', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'advanced',
  $stem$A 19-year-old man with newly diagnosed high-grade Burkitt lymphoma and a very high tumour burden starts induction chemotherapy. Within 24 hours he becomes oliguric.

Bloods: potassium 6.8 mmol/L, phosphate markedly raised, corrected calcium low, uric acid markedly raised, creatinine acutely elevated.$stem$,
  'What is the underlying mechanism of his acute kidney injury?',
  array['tumour lysis syndrome','uric acid nephropathy','chain reasoning']
),

-- 44. HUS
(
  '60000000-0000-0000-0000-000000000044', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'advanced',
  $stem$A 4-year-old boy develops bloody diarrhoea after a family barbecue, followed 5 days later by pallor, bruising and reduced urine output. Bloods: haemoglobin low with fragmented red cells (schistocytes) on blood film, platelets markedly low, creatinine acutely elevated. Stool culture grows Escherichia coli O157:H7.$stem$,
  'What is the mechanism most directly responsible for his renal failure?',
  array['haemolytic uraemic syndrome','Shiga toxin','microangiopathic haemolysis','chain reasoning']
),

-- 45. TTP
(
  '60000000-0000-0000-0000-000000000045', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'advanced',
  $stem$A 38-year-old woman presents with confusion, fever and petechiae. Bloods: haemoglobin low with schistocytes on blood film, platelets markedly low, creatinine mildly elevated, LDH raised, direct Coombs test negative. ADAMTS13 activity is severely deficient.$stem$,
  'What is the mechanism most directly responsible for her presentation?',
  array['thrombotic thrombocytopenic purpura','ADAMTS13','chain reasoning']
),

-- 46. SIADH from small cell lung cancer
(
  '60000000-0000-0000-0000-000000000046', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'advanced',
  $stem$A 68-year-old heavy smoker presents with confusion and lethargy. Bloods: sodium 118 mmol/L, low plasma osmolality, inappropriately high urine osmolality, urine sodium above 30 mmol/L. He is clinically euvolaemic with no oedema, and thyroid and adrenal function are normal. CT chest reveals a central mass.$stem$,
  'What is the most likely mechanism underlying his hyponatraemia?',
  array['SIADH','ectopic ADH','small cell lung cancer','chain reasoning']
),

-- 47. Cranial DI post-pituitary surgery
(
  '60000000-0000-0000-0000-000000000047', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'advanced',
  $stem$A 45-year-old woman undergoes transsphenoidal resection of a pituitary macroadenoma. On the second post-operative day she develops profound polyuria (urine output over 300 mL/hour) and marked thirst.

Bloods: sodium 152 mmol/L, plasma osmolality high, urine osmolality inappropriately low.$stem$,
  'What is the most likely mechanism underlying her presentation?',
  array['diabetes insipidus','pituitary surgery','ADH deficiency','chain reasoning']
),

-- 48. GPA (ANCA-associated vasculitis)
(
  '60000000-0000-0000-0000-000000000048', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'advanced',
  $stem$A 55-year-old man presents with a 6-week history of nasal crusting, epistaxis and sinusitis, now with new haemoptysis and haematuria. cANCA is strongly positive, with anti-PR3 antibody confirmed. Renal biopsy shows a pauci-immune crescentic glomerulonephritis with minimal immune complex deposition on immunofluorescence.$stem$,
  'What is the most likely diagnosis, and its mechanism of renal injury?',
  array['granulomatosis with polyangiitis','ANCA','pauci-immune GN','chain reasoning']
),

-- 49. Dialysis indications (AEIOU)
(
  '60000000-0000-0000-0000-000000000049', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'advanced',
  $stem$A 60-year-old man with AKI secondary to sepsis has been treated for 24 hours with IV fluids and antibiotics and remains anuric.

Bloods: potassium 7.1 mmol/L, unresponsive to calcium gluconate, insulin-dextrose and nebulised salbutamol given over the preceding 2 hours; bicarbonate 8 mmol/L with a pH of 7.05. He is increasingly drowsy with a coarse tremor attributed to uraemia, and has bilateral crepitations with worsening hypoxia despite oxygen therapy, in keeping with pulmonary oedema unresponsive to IV furosemide.$stem$,
  'What is the most appropriate next step in his management?',
  array['dialysis indications','AEIOU','emergency haemodialysis','chain reasoning']
),

-- 50. Renal transplant rejection differential
(
  '60000000-0000-0000-0000-000000000050', 'mrcp1', '30000000-0000-0000-0000-000000000015',
  'published', 'advanced',
  $stem$A 34-year-old woman received a live-donor renal transplant 8 days ago, with an uncomplicated post-operative course and creatinine returning to a stable baseline of 95 micromol/L on tacrolimus, mycophenolate mofetil and prednisolone. On day 9 her creatinine rises to 180 micromol/L, with reduced urine output and mild graft tenderness. Her tacrolimus trough level is within the therapeutic target range, and renal ultrasound shows no ureteric obstruction or vascular thrombosis.$stem$,
  'What is the most likely explanation for her rising creatinine, and what would confirm it?',
  array['renal transplant','acute rejection','tacrolimus','chain reasoning']
)

on conflict (id) do nothing;

-- ---------------------------------------------------------------------------
-- Options
-- ---------------------------------------------------------------------------

insert into question_options (question_id, label, option_text, is_correct, rationale, sort_order) values

-- Q1 AKI KDIGO stage 1
('60000000-0000-0000-0000-000000000001', 'A', 'Stage 1 AKI', true,
 $r$Correct. KDIGO stage 1 is defined by a creatinine rise of at least 26.5 micromol/L within 48 hours (or 1.5-1.9 times baseline within 7 days); his rise of 35 micromol/L within 36 hours meets this threshold even though the absolute values remain modest.$r$, 1),
('60000000-0000-0000-0000-000000000001', 'B', 'Stage 2 AKI', false,
 $r$Ruled out because stage 2 requires the creatinine to reach 2.0-2.9 times baseline; his creatinine has risen to only around 1.44 times baseline.$r$, 2),
('60000000-0000-0000-0000-000000000001', 'C', 'Stage 3 AKI', false,
 $r$Ruled out because stage 3 requires a rise to at least 3 times baseline, an absolute creatinine of 354 micromol/L or more, or initiation of renal replacement therapy, none of which apply here.$r$, 3),
('60000000-0000-0000-0000-000000000001', 'D', 'No AKI, as this represents normal day-to-day fluctuation', false,
 $r$Ruled out because a rise of at least 26.5 micromol/L within 48 hours meets the KDIGO definition of AKI in its own right, regardless of how small the absolute values look.$r$, 4),
('60000000-0000-0000-0000-000000000001', 'E', 'AKI cannot be diagnosed unless urine output has also fallen', false,
 $r$Ruled out because KDIGO AKI can be defined by creatinine criteria alone; a fall in urine output is an alternative criterion, not a mandatory one.$r$, 5),

-- Q2 Anti-GBM antibody
('60000000-0000-0000-0000-000000000002', 'A', 'Anti-glomerular basement membrane (anti-GBM) antibody', true,
 $r$Correct. Linear IgG deposition along the GBM, together with pulmonary haemorrhage and glomerulonephritis, is the hallmark of anti-GBM disease, in which autoantibodies target the alpha-3 chain of type IV collagen present in both alveolar and glomerular basement membranes.$r$, 1),
('60000000-0000-0000-0000-000000000002', 'B', 'Anti-double-stranded DNA (anti-dsDNA) antibody', false,
 $r$Ruled out because anti-dsDNA is associated with systemic lupus erythematosus and lupus nephritis, which shows granular "full house" immune complex deposition, not the linear IgG pattern described here.$r$, 2),
('60000000-0000-0000-0000-000000000002', 'C', 'Anti-neutrophil cytoplasmic antibody with PR3 specificity (cANCA)', false,
 $r$Ruled out because cANCA/PR3-associated vasculitis produces a pauci-immune crescentic glomerulonephritis with minimal immunofluorescence staining, not the linear IgG deposition seen in this biopsy.$r$, 3),
('60000000-0000-0000-0000-000000000002', 'D', 'Anti-phospholipase A2 receptor (anti-PLA2R) antibody', false,
 $r$Ruled out because anti-PLA2R is associated with membranous nephropathy, which produces subepithelial deposits and nephrotic syndrome, not the pulmonary-renal syndrome with linear GBM staining seen here.$r$, 4),
('60000000-0000-0000-0000-000000000002', 'E', 'Antistreptolysin O (ASO) antibody', false,
 $r$Ruled out because ASO reflects recent streptococcal infection and is associated with post-streptococcal glomerulonephritis, not the linear IgG deposition and pulmonary haemorrhage described here.$r$, 5),

-- Q3 Nephrotic syndrome triad
('60000000-0000-0000-0000-000000000003', 'A', 'Heavy proteinuria, hypoalbuminaemia and oedema', true,
 $r$Correct. Nephrotic syndrome is defined by the triad of heavy proteinuria (typically over 3.5 g/24h in adults), hypoalbuminaemia and oedema, often with an accompanying hyperlipidaemia, exactly as seen in this child.$r$, 1),
('60000000-0000-0000-0000-000000000003', 'B', 'Haematuria, hypertension and red cell casts', false,
 $r$Ruled out because this triad describes nephritic, not nephrotic, syndrome, which reflects glomerular inflammation and bleeding rather than a purely proteinuric process.$r$, 2),
('60000000-0000-0000-0000-000000000003', 'C', 'Isolated microscopic haematuria with normal renal function', false,
 $r$Ruled out because this child has heavy proteinuria, hypoalbuminaemia and oedema, not isolated haematuria, which would not explain his clinical picture at all.$r$, 3),
('60000000-0000-0000-0000-000000000003', 'D', 'Raised creatinine, oliguria and hypertension', false,
 $r$Ruled out because this combination describes a picture of renal impairment with fluid retention, not the specific proteinuria/hypoalbuminaemia/oedema triad that defines nephrotic syndrome.$r$, 4),
('60000000-0000-0000-0000-000000000003', 'E', 'Proteinuria alone, without any other biochemical or clinical feature', false,
 $r$Ruled out because proteinuria alone is insufficient for the diagnosis; the accompanying hypoalbuminaemia and oedema seen in this child are required components of the syndrome.$r$, 5),

-- Q4 Nephritic syndrome feature
('60000000-0000-0000-0000-000000000004', 'A', 'Red cell casts and dysmorphic red cells on urine microscopy', true,
 $r$Correct. Red cell casts and dysmorphic red cells reflect bleeding directly from inflamed, damaged glomeruli, and are the most specific finding for a nephritic (glomerulonephritic) process, distinguishing it from lower urinary tract sources of blood or from a purely nephrotic picture.$r$, 1),
('60000000-0000-0000-0000-000000000004', 'B', 'Heavy proteinuria alone', false,
 $r$Ruled out because heavy proteinuria is the dominant feature of nephrotic syndrome; while some proteinuria occurs in nephritic syndrome too, it is not the specific discriminating feature between the two.$r$, 2),
('60000000-0000-0000-0000-000000000004', 'C', 'Hypoalbuminaemia', false,
 $r$Ruled out because hypoalbuminaemia results from heavy sustained proteinuria and is characteristic of nephrotic syndrome, not the acute inflammatory nephritic picture described here.$r$, 3),
('60000000-0000-0000-0000-000000000004', 'D', 'Generalised oedema', false,
 $r$Ruled out because generalised oedema is typically a nephrotic feature driven by hypoalbuminaemia; the mild facial swelling here reflects fluid retention from renal impairment and hypertension rather than the same mechanism.$r$, 4),
('60000000-0000-0000-0000-000000000004', 'E', 'Hyperlipidaemia', false,
 $r$Ruled out because hyperlipidaemia is a recognised consequence of nephrotic-range proteinuria, not a feature that indicates glomerular inflammation or bleeding.$r$, 5),

-- Q5 CKD staging
('60000000-0000-0000-0000-000000000005', 'A', 'CKD G3b', true,
 $r$Correct. An eGFR of 30-44 mL/min/1.73m2, confirmed on repeat testing at least 3 months apart, defines CKD stage G3b.$r$, 1),
('60000000-0000-0000-0000-000000000005', 'B', 'CKD G3a', false,
 $r$Ruled out because G3a corresponds to an eGFR of 45-59 mL/min/1.73m2, higher than her measured values of 42 and 38.$r$, 2),
('60000000-0000-0000-0000-000000000005', 'C', 'CKD G2', false,
 $r$Ruled out because G2 corresponds to an eGFR of 60-89 mL/min/1.73m2, well above her measured values.$r$, 3),
('60000000-0000-0000-0000-000000000005', 'D', 'CKD G4', false,
 $r$Ruled out because G4 corresponds to an eGFR of 15-29 mL/min/1.73m2, lower than her measured values of 42 and 38.$r$, 4),
('60000000-0000-0000-0000-000000000005', 'E', 'CKD G1', false,
 $r$Ruled out because G1 requires an eGFR of 90 mL/min/1.73m2 or above (with evidence of kidney damage), far higher than her measured values.$r$, 5),

-- Q6 Minimal change disease
('60000000-0000-0000-0000-000000000006', 'A', 'Minimal change disease, which is typically steroid-responsive', true,
 $r$Correct. Minimal change disease is the most common cause of nephrotic syndrome in young children, characteristically shows normal light microscopy with podocyte foot process effacement on electron microscopy, and usually responds well to corticosteroid therapy.$r$, 1),
('60000000-0000-0000-0000-000000000006', 'B', 'Focal segmental glomerulosclerosis, which is typically steroid-resistant', false,
 $r$Ruled out because FSGS shows segmental scarring on light microscopy, not the normal appearance described here; this biopsy pattern fits minimal change disease instead.$r$, 2),
('60000000-0000-0000-0000-000000000006', 'C', 'Membranous nephropathy, which is typically steroid-resistant', false,
 $r$Ruled out because membranous nephropathy shows basement membrane thickening with subepithelial deposits on light and electron microscopy, and is rare in young children; the normal light microscopy here fits minimal change disease.$r$, 3),
('60000000-0000-0000-0000-000000000006', 'D', 'Post-streptococcal glomerulonephritis', false,
 $r$Ruled out because this typically presents with a nephritic picture (haematuria, hypertension) after a preceding infection and shows proliferative changes on biopsy, not the normal light microscopy and isolated nephrotic presentation described here.$r$, 4),
('60000000-0000-0000-0000-000000000006', 'E', 'IgA nephropathy', false,
 $r$Ruled out because IgA nephropathy shows mesangial IgA deposition and typically presents with haematuria following an infection, not the isolated nephrotic syndrome with normal light microscopy seen here.$r$, 5),

-- Q7 IgA nephropathy
('60000000-0000-0000-0000-000000000007', 'A', 'IgA nephropathy', true,
 $r$Correct. Recurrent visible haematuria occurring within 1-2 days of an upper respiratory tract infection ("synpharyngitic" haematuria), with mesangial IgA deposition on biopsy, is classic for IgA nephropathy.$r$, 1),
('60000000-0000-0000-0000-000000000007', 'B', 'Post-streptococcal glomerulonephritis', false,
 $r$Ruled out because post-streptococcal GN has a latent period of 1-3 weeks after infection, not the 1-2 day synpharyngitic pattern described, and shows a different immune-complex deposition pattern with low complement.$r$, 2),
('60000000-0000-0000-0000-000000000007', 'C', 'IgA vasculitis (Henoch-Schonlein purpura)', false,
 $r$Ruled out because although this shares the same IgA deposition, it is a systemic small-vessel vasculitis with additional features such as a purpuric rash, arthralgia and abdominal pain, none of which are described in this isolated renal presentation.$r$, 3),
('60000000-0000-0000-0000-000000000007', 'D', 'Thin basement membrane disease', false,
 $r$Ruled out because this typically causes persistent asymptomatic microscopic haematuria with a thinned (not IgA-deposited) basement membrane on electron microscopy, not the mesangial IgA deposition and infection-related flares described here.$r$, 4),
('60000000-0000-0000-0000-000000000007', 'E', 'Anti-GBM disease', false,
 $r$Ruled out because anti-GBM disease shows linear IgG deposition and typically presents with a pulmonary-renal syndrome, not the mesangial IgA deposition and recurrent synpharyngitic haematuria described here.$r$, 5),

-- Q8 Post-strep GN
('60000000-0000-0000-0000-000000000008', 'A', 'Post-streptococcal glomerulonephritis', true,
 $r$Correct. A nephritic presentation 1-3 weeks after a streptococcal throat infection, with a transiently low C3 that normalises over subsequent weeks, is classic for post-streptococcal glomerulonephritis.$r$, 1),
('60000000-0000-0000-0000-000000000008', 'B', 'IgA nephropathy', false,
 $r$Ruled out because IgA nephropathy classically causes haematuria within 1-2 days of infection (synpharyngitic), with normal complement levels, not the 2-week latency and transiently low C3 described here.$r$, 2),
('60000000-0000-0000-0000-000000000008', 'C', 'Membranous nephropathy', false,
 $r$Ruled out because membranous nephropathy causes a nephrotic, not nephritic, presentation and is not typically triggered by a recent streptococcal throat infection with transient hypocomplementaemia.$r$, 3),
('60000000-0000-0000-0000-000000000008', 'D', 'Minimal change disease', false,
 $r$Ruled out because minimal change disease causes nephrotic syndrome with normal complement levels, not the nephritic picture with transiently low C3 described here.$r$, 4),
('60000000-0000-0000-0000-000000000008', 'E', 'Lupus nephritis', false,
 $r$Ruled out because lupus nephritis typically causes persistently low complement levels rather than the transient dip seen here, and there is no other feature of SLE in this vignette; the recent sore throat and self-resolving hypocomplementaemia instead fit post-streptococcal GN.$r$, 5),

-- Q9 ADPKD genetics
('60000000-0000-0000-0000-000000000009', 'A', 'PKD1', true,
 $r$Correct. PKD1, on chromosome 16, accounts for the large majority of autosomal dominant polycystic kidney disease and is associated with earlier progression to end-stage renal disease than the alternative gene, fitting this family history.$r$, 1),
('60000000-0000-0000-0000-000000000009', 'B', 'PKD2', false,
 $r$Ruled out because although PKD2 also causes ADPKD, it accounts for a minority of cases and is typically associated with a milder course and later onset of end-stage renal disease than PKD1.$r$, 2),
('60000000-0000-0000-0000-000000000009', 'C', 'PKHD1', false,
 $r$Ruled out because PKHD1 causes autosomal recessive polycystic kidney disease, which presents in infancy or childhood, not the autosomal dominant, adult-onset pattern with a father affected in this family.$r$, 3),
('60000000-0000-0000-0000-000000000009', 'D', 'NPHS1', false,
 $r$Ruled out because NPHS1 mutations cause congenital nephrotic syndrome (encoding nephrin), an unrelated condition presenting with heavy proteinuria in infancy, not adult-onset polycystic kidneys.$r$, 4),
('60000000-0000-0000-0000-000000000009', 'E', 'VHL', false,
 $r$Ruled out because VHL mutations cause von Hippel-Lindau syndrome, associated with renal cysts and clear cell renal cell carcinoma alongside other tumours, not the classic autosomal dominant polycystic kidney phenotype described here.$r$, 5),

-- Q10 RAS + ACEi mechanism
('60000000-0000-0000-0000-000000000010', 'A', 'ACE inhibition removes angiotensin II-mediated efferent arteriolar vasoconstriction, which was maintaining glomerular filtration pressure distal to the stenosis', true,
 $r$Correct. In renal artery stenosis, angiotensin II preferentially constricts the efferent arteriole to preserve glomerular filtration pressure despite reduced renal blood flow; ACE inhibitors abolish this compensatory mechanism, causing a sharp fall in GFR, particularly with bilateral disease.$r$, 1),
('60000000-0000-0000-0000-000000000010', 'B', 'Direct nephrotoxic injury to the renal tubules from the ACE inhibitor', false,
 $r$Ruled out because ACE inhibitors are not directly tubulotoxic; the deterioration here is a predictable haemodynamic consequence of losing efferent arteriolar tone in the presence of renal artery stenosis, not direct cellular toxicity.$r$, 2),
('60000000-0000-0000-0000-000000000010', 'C', 'An allergic interstitial nephritis reaction to the ACE inhibitor', false,
 $r$Ruled out because there is no fever, rash or eosinophilia described, and the rapid, predictable creatinine rise specifically in the context of renal artery stenosis fits the known haemodynamic mechanism rather than a hypersensitivity reaction.$r$, 3),
('60000000-0000-0000-0000-000000000010', 'D', 'ACE inhibition causes afferent, not efferent, arteriolar vasoconstriction', false,
 $r$Ruled out because this describes the wrong arteriole and the wrong direction of effect; ACE inhibitors dilate the efferent arteriole by blocking angiotensin II, they do not constrict the afferent arteriole.$r$, 4),
('60000000-0000-0000-0000-000000000010', 'E', 'Coincidental development of acute tubular necrosis unrelated to the new drug', false,
 $r$Ruled out because the temporal relationship (creatinine rising within days of starting an ACE inhibitor in a patient with known bilateral renal artery stenosis) points specifically to the well-recognised haemodynamic mechanism, not an unrelated coincidental process.$r$, 5),

-- Q11 RTA type 1
('60000000-0000-0000-0000-000000000011', 'A', 'Type 1 (distal) renal tubular acidosis', true,
 $r$Correct. An inability to acidify the urine (persistently high urine pH) despite systemic metabolic acidosis, with hypokalaemia and recurrent stones/nephrocalcinosis, is characteristic of type 1 (distal) RTA, which is recognised in association with autoimmune connective tissue disease such as Sjogren syndrome.$r$, 1),
('60000000-0000-0000-0000-000000000011', 'B', 'Type 2 (proximal) renal tubular acidosis', false,
 $r$Ruled out because type 2 RTA results from impaired proximal bicarbonate reabsorption and is often associated with a broader Fanconi-type proximal tubular defect, rather than the specific failure to acidify urine and stone-forming tendency of distal RTA described here.$r$, 2),
('60000000-0000-0000-0000-000000000011', 'C', 'Type 4 RTA', false,
 $r$Ruled out because type 4 RTA is characterised by hyperkalaemia (from hypoaldosteronism), the opposite of the hypokalaemia described in this patient.$r$, 3),
('60000000-0000-0000-0000-000000000011', 'D', 'Fanconi syndrome', false,
 $r$Ruled out because Fanconi syndrome involves generalised proximal tubular dysfunction with glycosuria, phosphaturia and aminoaciduria alongside bicarbonate wasting, a broader defect than the isolated distal acidification failure described here.$r$, 4),
('60000000-0000-0000-0000-000000000011', 'E', 'Diabetic ketoacidosis', false,
 $r$Ruled out because there is no history of diabetes or hyperglycaemia, and DKA causes an appropriately acidic urine as the kidneys attempt to excrete excess acid, the opposite of the persistently alkaline urine described here.$r$, 5),

-- Q12 Renal amyloidosis
('60000000-0000-0000-0000-000000000012', 'A', 'Renal amyloidosis (AA amyloid secondary to chronic inflammation)', true,
 $r$Correct. Apple-green birefringence under polarised light after Congo red staining is diagnostic of amyloid deposition, and AA amyloidosis is a recognised complication of longstanding chronic inflammatory conditions such as rheumatoid arthritis, presenting with nephrotic-range proteinuria.$r$, 1),
('60000000-0000-0000-0000-000000000012', 'B', 'Membranous nephropathy', false,
 $r$Ruled out because membranous nephropathy shows subepithelial immune deposits without the Congo red apple-green birefringence that specifically identifies amyloid.$r$, 2),
('60000000-0000-0000-0000-000000000012', 'C', 'Minimal change disease', false,
 $r$Ruled out because minimal change disease shows normal light microscopy without any Congo red staining abnormality; the amyloid finding described here indicates a specific infiltrative process instead.$r$, 3),
('60000000-0000-0000-0000-000000000012', 'D', 'Diabetic nephropathy', false,
 $r$Ruled out because there is no history of diabetes, and diabetic nephropathy shows glomerulosclerosis (including Kimmelstiel-Wilson nodules) rather than Congo red-positive amyloid deposits.$r$, 4),
('60000000-0000-0000-0000-000000000012', 'E', 'Myeloma cast nephropathy', false,
 $r$Ruled out because cast nephropathy is a tubular process caused by light chain casts obstructing the distal tubules, not a glomerular amyloid deposition process, and there is no mention here of a paraprotein or myeloma-related features.$r$, 5),

-- Q13 Hyperkalaemia earliest ECG change
('60000000-0000-0000-0000-000000000013', 'A', 'Tall, tented T waves', true,
 $r$Correct. Tall, tented T waves are typically the earliest ECG change seen with rising serum potassium, before progression to flattening/loss of P waves and then QRS widening as hyperkalaemia worsens.$r$, 1),
('60000000-0000-0000-0000-000000000013', 'B', 'Loss of visible P waves', false,
 $r$Ruled out because P wave flattening and loss occurs at a later stage of hyperkalaemia than the earlier appearance of tented T waves.$r$, 2),
('60000000-0000-0000-0000-000000000013', 'C', 'Widened QRS complex', false,
 $r$Ruled out because QRS widening is a later, more severe ECG change reflecting more advanced hyperkalaemia, occurring after the earlier tented T wave change.$r$, 3),
('60000000-0000-0000-0000-000000000013', 'D', 'A sine-wave pattern', false,
 $r$Ruled out because a sine-wave pattern is a pre-terminal finding seen in very severe, life-threatening hyperkalaemia, far later in the progression than the earliest change.$r$, 4),
('60000000-0000-0000-0000-000000000013', 'E', 'ST segment elevation', false,
 $r$Ruled out because ST elevation is not a typical feature of the classic hyperkalaemia ECG progression, which instead proceeds through tented T waves, P wave loss and QRS widening.$r$, 5),

-- Q14 Calcium gluconate mechanism
('60000000-0000-0000-0000-000000000014', 'A', 'It stabilises the cardiac cell membrane by raising the threshold potential, reducing arrhythmia risk, without lowering serum potassium', true,
 $r$Correct. IV calcium gluconate acts rapidly to stabilise the myocardial cell membrane against the arrhythmogenic effects of hyperkalaemia by antagonising its effect on membrane excitability; it does not lower the serum potassium concentration itself, so other measures are still needed to shift and remove potassium.$r$, 1),
('60000000-0000-0000-0000-000000000014', 'B', 'It shifts potassium from the extracellular to the intracellular compartment', false,
 $r$Ruled out because this describes the mechanism of insulin-dextrose or nebulised salbutamol, not calcium gluconate, which works by membrane stabilisation rather than transcellular potassium shift.$r$, 2),
('60000000-0000-0000-0000-000000000014', 'C', 'It increases renal excretion of potassium', false,
 $r$Ruled out because increased renal excretion is not how calcium gluconate acts; this effect is more relevant to loop diuretics or dialysis, and calcium gluconate has no significant effect on renal potassium handling.$r$, 3),
('60000000-0000-0000-0000-000000000014', 'D', 'It binds potassium within the gastrointestinal tract to prevent absorption', false,
 $r$Ruled out because this describes the mechanism of potassium-binding resins such as calcium resonium, not IV calcium gluconate, which acts directly on the myocardium rather than in the gut.$r$, 4),
('60000000-0000-0000-0000-000000000014', 'E', 'It directly lowers the serum potassium concentration', false,
 $r$Ruled out because calcium gluconate does not reduce serum potassium at all; its benefit is purely in protecting the myocardium from the effects of the existing hyperkalaemia while other treatments lower the potassium level.$r$, 5),

-- Q15 Rhabdomyolysis
('60000000-0000-0000-0000-000000000015', 'A', 'Rhabdomyolysis', true,
 $r$Correct. A markedly elevated creatine kinase with dark (myoglobin-containing) urine following a prolonged period of immobility/muscle compression, as can occur after a prolonged seizure, is classic for rhabdomyolysis.$r$, 1),
('60000000-0000-0000-0000-000000000015', 'B', 'Acute glomerulonephritis', false,
 $r$Ruled out because glomerulonephritis causes haematuria from glomerular bleeding, not myoglobin-related dark urine, and would not produce this degree of CK elevation.$r$, 2),
('60000000-0000-0000-0000-000000000015', 'C', 'Haemolytic anaemia', false,
 $r$Ruled out because haemolysis causes dark urine through free haemoglobin, not myoglobin, and would show a falling haemoglobin with haemolytic markers rather than a massively elevated CK.$r$, 3),
('60000000-0000-0000-0000-000000000015', 'D', 'Urinary tract infection', false,
 $r$Ruled out because a UTI would not explain a CK of 45,000 U/L, and the clinical context (collapse after a prolonged seizure) specifically points to muscle breakdown rather than infection.$r$, 4),
('60000000-0000-0000-0000-000000000015', 'E', 'Bladder tumour', false,
 $r$Ruled out because a bladder tumour would present with painless visible haematuria rather than the markedly raised CK and myoglobin-related dark urine following prolonged muscle compression described here.$r$, 5),

-- Q16 AKI KDIGO stage 3 urine output
('60000000-0000-0000-0000-000000000016', 'A', 'Stage 3 AKI', true,
 $r$Correct. Anuria for 12 hours or more (or urine output under 0.3 mL/kg/h for 24 hours or more) meets the KDIGO stage 3 urine-output criterion, the most severe AKI stage.$r$, 1),
('60000000-0000-0000-0000-000000000016', 'B', 'Stage 1 AKI', false,
 $r$Ruled out because stage 1 requires urine output under 0.5 mL/kg/h for only 6-12 hours, a much less severe and shorter threshold than his 14 hours of complete anuria.$r$, 2),
('60000000-0000-0000-0000-000000000016', 'C', 'Stage 2 AKI', false,
 $r$Ruled out because stage 2 requires urine output under 0.5 mL/kg/h for 12 hours or more, whereas his complete anuria for 14 hours meets the more severe stage 3 threshold instead.$r$, 3),
('60000000-0000-0000-0000-000000000016', 'D', 'AKI cannot be staged on urine output alone', false,
 $r$Ruled out because KDIGO explicitly allows AKI to be staged using either the creatinine criteria or the urine output criteria, whichever gives the higher (more severe) stage.$r$, 4),
('60000000-0000-0000-0000-000000000016', 'E', 'A creatinine result is required before urine output criteria can be applied', false,
 $r$Ruled out because the urine output criterion is a standalone staging pathway in the KDIGO definition and does not require a creatinine result to be applied.$r$, 5),

-- Q17 Prerenal AKI vs ATN
('60000000-0000-0000-0000-000000000017', 'A', 'Prerenal AKI', true,
 $r$Correct. A low urine sodium, fractional excretion of sodium under 1%, high urine osmolality and rapid improvement with fluid resuscitation all reflect an intact, avidly sodium- and water-conserving kidney responding appropriately to reduced perfusion, characteristic of prerenal AKI.$r$, 1),
('60000000-0000-0000-0000-000000000017', 'B', 'Acute tubular necrosis (intrinsic AKI)', false,
 $r$Ruled out because ATN typically shows a fractional excretion of sodium above 1-2%, low urine osmolality and muddy brown casts, reflecting loss of tubular concentrating ability, the opposite pattern to that described here.$r$, 2),
('60000000-0000-0000-0000-000000000017', 'C', 'Postrenal (obstructive) AKI', false,
 $r$Ruled out because there is no mention of hydronephrosis or obstructive symptoms, and the urine indices and prompt response to fluids fit a prerenal, not obstructive, mechanism.$r$, 3),
('60000000-0000-0000-0000-000000000017', 'D', 'Acute glomerulonephritis', false,
 $r$Ruled out because there is no haematuria, red cell casts or proteinuria described; the urine indices here reflect a haemodynamic, not glomerular inflammatory, process.$r$, 4),
('60000000-0000-0000-0000-000000000017', 'E', 'Acute interstitial nephritis', false,
 $r$Ruled out because AIN typically presents with sterile pyuria, eosinophilia and a drug exposure history, not the classic prerenal urine indices and rapid fluid-responsiveness described here.$r$, 5),

-- Q18 Postrenal AKI
('60000000-0000-0000-0000-000000000018', 'A', 'Urethral (or suprapubic) catheterisation to relieve the obstruction', true,
 $r$Correct. Bilateral hydronephrosis with a distended bladder and a large post-void residual in a man with known BPH points to bladder outflow obstruction; prompt catheterisation to relieve this lower urinary tract obstruction is the most appropriate immediate step.$r$, 1),
('60000000-0000-0000-0000-000000000018', 'B', 'IV fluids alone, without addressing the obstruction', false,
 $r$Ruled out because fluids alone do not relieve the underlying bladder outflow obstruction causing the bilateral hydronephrosis, and could worsen distension while the obstruction remains untreated.$r$, 2),
('60000000-0000-0000-0000-000000000018', 'C', 'Urgent haemodialysis', false,
 $r$Ruled out because there is no indication yet given for emergency dialysis (no refractory hyperkalaemia, severe acidosis or fluid overload described), and the priority is to relieve the readily treatable obstruction first.$r$, 3),
('60000000-0000-0000-0000-000000000018', 'D', 'An ACE inhibitor to reduce intraglomerular pressure', false,
 $r$Ruled out because an ACE inhibitor has no role in relieving urinary obstruction and could worsen renal perfusion in this setting; the obstruction itself must be relieved first.$r$, 4),
('60000000-0000-0000-0000-000000000018', 'E', 'Bilateral percutaneous nephrostomy as the first-line intervention', false,
 $r$Ruled out because a lower urinary tract obstruction from bladder outflow obstruction is first managed with catheterisation; nephrostomy is reserved for upper tract obstruction that is not relieved by bladder decompression.$r$, 5),

-- Q19 AKI drug management
('60000000-0000-0000-0000-000000000019', 'A', 'The NSAID, the ACE inhibitor and the diuretic should all be stopped or withheld until his renal function recovers', true,
 $r$Correct. NSAIDs, ACE inhibitors/ARBs and diuretics all have the potential to worsen or perpetuate AKI (via effects on renal autoregulation and volume status) and should be temporarily stopped during an episode of AKI until renal function has recovered.$r$, 1),
('60000000-0000-0000-0000-000000000019', 'B', 'All three medications should be continued unchanged', false,
 $r$Ruled out because continuing an NSAID, ACE inhibitor and diuretic together during AKI risks further worsening his renal function; all three should be withheld.$r$, 2),
('60000000-0000-0000-0000-000000000019', 'C', 'Only the diuretic needs to be stopped', false,
 $r$Ruled out because the NSAID and ACE inhibitor also impair renal autoregulation and volume handling during AKI and should be withheld alongside the diuretic, not just the diuretic alone.$r$, 3),
('60000000-0000-0000-0000-000000000019', 'D', 'Only the NSAID needs to be stopped', false,
 $r$Ruled out because although the NSAID is an important culprit, the ACE inhibitor and diuretic also contribute to renal hypoperfusion during acute illness and should be withheld too.$r$, 4),
('60000000-0000-0000-0000-000000000019', 'E', 'The ACE inhibitor dose should be increased to provide renoprotection', false,
 $r$Ruled out because increasing an ACE inhibitor dose during active AKI would further reduce glomerular filtration pressure and worsen, not protect, his renal function.$r$, 5),

-- Q20 Metformin in AKI
('60000000-0000-0000-0000-000000000020', 'A', 'Stop metformin because of the risk of lactic acidosis with reduced renal clearance', true,
 $r$Correct. Metformin is renally cleared, and its accumulation during AKI substantially increases the risk of life-threatening lactic acidosis; it should be stopped during acute illness with significant renal impairment and only restarted once renal function has recovered.$r$, 1),
('60000000-0000-0000-0000-000000000020', 'B', 'Continue metformin at the same dose', false,
 $r$Ruled out because continuing metformin unchanged with an eGFR of 25 mL/min/1.73m2 during acute illness carries a significant risk of accumulation and lactic acidosis.$r$, 2),
('60000000-0000-0000-0000-000000000020', 'C', 'Simply halve the metformin dose and continue', false,
 $r$Ruled out because dose reduction is not the recommended approach during an acute deterioration in renal function of this severity; metformin should be stopped altogether until renal function recovers.$r$, 3),
('60000000-0000-0000-0000-000000000020', 'D', 'Switch to a higher dose of a sulfonylurea instead', false,
 $r$Ruled out because sulfonylureas carry their own risk of hypoglycaemia (worsened by reduced renal clearance) during acute illness, and this does not address the immediate priority of stopping metformin to prevent lactic acidosis.$r$, 4),
('60000000-0000-0000-0000-000000000020', 'E', 'Continue metformin but add prophylactic sodium bicarbonate', false,
 $r$Ruled out because prophylactic bicarbonate does not prevent metformin accumulation or its risk of lactic acidosis; the appropriate action is to stop the drug during this acute illness.$r$, 5),

-- Q21 Nephrology referral criteria
('60000000-0000-0000-0000-000000000021', 'A', 'Patient A', true,
 $r$Correct. AKI stage 3 with hyperkalaemia refractory to medical treatment and no response to a fluid challenge represents severe, treatment-resistant AKI, meeting recognised criteria for urgent nephrology referral (and likely renal replacement therapy).$r$, 1),
('60000000-0000-0000-0000-000000000021', 'B', 'Patient B', false,
 $r$Ruled out because mild AKI stage 1 from dehydration that is improving with simple oral fluids does not require urgent nephrology input; it can be managed and monitored on the general medical take.$r$, 2),
('60000000-0000-0000-0000-000000000021', 'C', 'Patient C', false,
 $r$Ruled out because a small, self-limiting creatinine rise that fully resolves once the causative NSAID is stopped does not require nephrology referral.$r$, 3),
('60000000-0000-0000-0000-000000000021', 'D', 'Patient D', false,
 $r$Ruled out because mild, improving prerenal AKI that is responding to oral fluids and simple supportive care does not meet referral criteria.$r$, 4),
('60000000-0000-0000-0000-000000000021', 'E', 'Patient E', false,
 $r$Ruled out because stable CKD with no acute change in creatinine is a chronic, not acute, issue and does not represent the urgent scenario that warrants immediate nephrology referral.$r$, 5),

-- Q22 Contrast-induced nephropathy prevention
('60000000-0000-0000-0000-000000000022', 'A', 'IV isotonic fluids given before and after the contrast study', true,
 $r$Correct. Peri-procedural IV isotonic fluids (such as 0.9% saline) are the mainstay of reducing contrast-induced nephropathy risk in patients with reduced eGFR undergoing contrast-enhanced imaging, by maintaining adequate renal perfusion and diluting the contrast load.$r$, 1),
('60000000-0000-0000-0000-000000000022', 'B', 'Routine prophylactic N-acetylcysteine', false,
 $r$Ruled out because N-acetylcysteine is no longer routinely recommended for contrast nephropathy prevention, as trial evidence has not consistently shown benefit; IV fluid hydration remains the primary evidence-based measure.$r$, 2),
('60000000-0000-0000-0000-000000000022', 'C', 'Stopping all IV fluids to reduce renal workload', false,
 $r$Ruled out because withholding fluids would worsen, not reduce, contrast nephropathy risk by leaving him relatively volume-depleted going into the contrast study.$r$, 3),
('60000000-0000-0000-0000-000000000022', 'D', 'Prophylactic haemodialysis immediately after the scan', false,
 $r$Ruled out because prophylactic dialysis is not a standard preventive measure for contrast nephropathy in a patient with this degree of renal impairment and carries its own risks; simple IV hydration is the appropriate first-line measure.$r$, 4),
('60000000-0000-0000-0000-000000000022', 'E', 'High-dose furosemide before the contrast is given', false,
 $r$Ruled out because diuretics can cause volume depletion, which would increase (not reduce) the risk of contrast-induced nephropathy in this setting.$r$, 5),

-- Q23 Triple whammy
('60000000-0000-0000-0000-000000000023', 'A', 'The "triple whammy"', true,
 $r$Correct. The combination of an NSAID, an ACE inhibitor (or ARB) and a diuretic is widely termed the "triple whammy," reflecting its recognised propensity to precipitate AKI, particularly when volume depletion or intercurrent illness is superimposed.$r$, 1),
('60000000-0000-0000-0000-000000000023', 'B', 'Fanconi syndrome', false,
 $r$Ruled out because Fanconi syndrome describes a specific proximal tubular reabsorption defect, unrelated to this particular three-drug combination and its haemodynamic effect on the kidney.$r$, 2),
('60000000-0000-0000-0000-000000000023', 'C', 'Hepatorenal syndrome', false,
 $r$Ruled out because hepatorenal syndrome describes renal failure occurring in the context of advanced liver disease and portal hypertension, not this specific drug combination.$r$, 3),
('60000000-0000-0000-0000-000000000023', 'D', 'Cardiorenal syndrome', false,
 $r$Ruled out because cardiorenal syndrome describes renal impairment arising from heart failure (and vice versa), a distinct clinical entity from the named drug-combination effect described here.$r$, 4),
('60000000-0000-0000-0000-000000000023', 'E', 'Bartter syndrome', false,
 $r$Ruled out because Bartter syndrome is an inherited renal tubular disorder causing salt wasting and hypokalaemic alkalosis, unrelated to this acquired drug-combination effect.$r$, 5),

-- Q24 CKD-MBD secondary hyperPTH
('60000000-0000-0000-0000-000000000024', 'A', 'Secondary hyperparathyroidism due to CKD-related phosphate retention and reduced renal activation of vitamin D', true,
 $r$Correct. In CKD, reduced renal 1-alpha-hydroxylase activity impairs vitamin D activation (reducing intestinal calcium absorption) while phosphate is retained; both changes drive a compensatory rise in PTH, producing this pattern of low-normal calcium, raised phosphate and markedly elevated PTH.$r$, 1),
('60000000-0000-0000-0000-000000000024', 'B', 'Primary hyperparathyroidism from an autonomous parathyroid adenoma', false,
 $r$Ruled out because primary hyperparathyroidism typically causes a raised (not low-normal) calcium, unlike the picture here, which is explained by his underlying CKD instead.$r$, 2),
('60000000-0000-0000-0000-000000000024', 'C', 'Vitamin D toxicity', false,
 $r$Ruled out because vitamin D toxicity causes hypercalcaemia and suppressed PTH, the opposite biochemical pattern to the low-normal calcium and markedly raised PTH seen here.$r$, 3),
('60000000-0000-0000-0000-000000000024', 'D', 'Primary hypoparathyroidism', false,
 $r$Ruled out because hypoparathyroidism causes a low PTH level, the opposite of the markedly elevated PTH described in this patient.$r$, 4),
('60000000-0000-0000-0000-000000000024', 'E', 'Tertiary hyperparathyroidism with autonomous PTH secretion', false,
 $r$Ruled out because tertiary hyperparathyroidism describes autonomous PTH secretion causing hypercalcaemia after prolonged secondary hyperparathyroidism, whereas this patient still has a low-normal (not raised) calcium, fitting ongoing secondary, not tertiary, disease.$r$, 5),

-- Q25 Anaemia of CKD
('60000000-0000-0000-0000-000000000025', 'A', 'Anaemia of CKD due to reduced erythropoietin production, treated with an erythropoiesis-stimulating agent once iron stores are adequate', true,
 $r$Correct. Reduced renal erythropoietin production is the principal cause of the normocytic anaemia seen in progressive CKD; treatment is with an erythropoiesis-stimulating agent (ESA), but only after ensuring adequate iron stores, since ESAs are ineffective (and can be harmful) if iron is deficient.$r$, 1),
('60000000-0000-0000-0000-000000000025', 'B', 'Iron deficiency anaemia, requiring iron replacement alone', false,
 $r$Ruled out because her iron studies and ferritin are stated to be normal, making isolated iron deficiency an unlikely explanation; the anaemia here reflects erythropoietin deficiency instead.$r$, 2),
('60000000-0000-0000-0000-000000000025', 'C', 'Vitamin B12 or folate deficiency', false,
 $r$Ruled out because B12/folate deficiency typically causes a macrocytic, not normocytic, anaemia, and there is no such deficiency described here; her renal impairment is the more likely explanation.$r$, 3),
('60000000-0000-0000-0000-000000000025', 'D', 'Ongoing occult haemolysis', false,
 $r$Ruled out because there is no evidence of haemolysis (such as raised bilirubin, LDH or reticulocytosis) provided, and her clinical picture fits the well-recognised anaemia of CKD instead.$r$, 4),
('60000000-0000-0000-0000-000000000025', 'E', 'Bone marrow failure requiring stem cell transplantation', false,
 $r$Ruled out because there is no evidence of pancytopenia or marrow failure described; a normocytic anaemia with normal iron studies in the context of advanced CKD is far more simply explained by erythropoietin deficiency.$r$, 5),

-- Q26 RTA type 4
('60000000-0000-0000-0000-000000000026', 'A', 'Type 4 renal tubular acidosis (hyporeninaemic hypoaldosteronism), a recognised complication of diabetic nephropathy', true,
 $r$Correct. Type 4 RTA results from hyporeninaemic hypoaldosteronism, causing hyperkalaemia disproportionate to the degree of renal impairment together with a mild hyperchloraemic metabolic acidosis; it is a well-recognised complication of diabetic nephropathy due to damage to the juxtaglomerular apparatus.$r$, 1),
('60000000-0000-0000-0000-000000000026', 'B', 'Type 1 (distal) renal tubular acidosis', false,
 $r$Ruled out because type 1 RTA causes hypokalaemia, the opposite of the hyperkalaemia seen in this patient.$r$, 2),
('60000000-0000-0000-0000-000000000026', 'C', 'Type 2 (proximal) renal tubular acidosis', false,
 $r$Ruled out because type 2 RTA is also typically associated with hypokalaemia (from increased distal potassium secretion), not the hyperkalaemia and low renin/aldosterone seen here.$r$, 3),
('60000000-0000-0000-0000-000000000026', 'D', 'Addison disease', false,
 $r$Ruled out because Addison disease typically causes hyponatraemia and hypotension alongside hyperkalaemia, from combined glucocorticoid and mineralocorticoid deficiency, a broader picture than the isolated hyporeninaemic hypoaldosteronism of type 4 RTA seen in this diabetic patient.$r$, 4),
('60000000-0000-0000-0000-000000000026', 'E', 'Simple progression of CKD explaining the hyperkalaemia alone', false,
 $r$Ruled out because his hyperkalaemia is disproportionate to his only moderately reduced eGFR, and the low renin and aldosterone levels specifically point to type 4 RTA as an additional mechanism rather than renal impairment alone.$r$, 5),

-- Q27 Membranous nephropathy
('60000000-0000-0000-0000-000000000027', 'A', 'Membranous nephropathy', true,
 $r$Correct. Diffuse GBM thickening with subepithelial immune deposits and a positive anti-PLA2R antibody is characteristic of primary membranous nephropathy, the most common cause of nephrotic syndrome in non-diabetic adults.$r$, 1),
('60000000-0000-0000-0000-000000000027', 'B', 'Minimal change disease', false,
 $r$Ruled out because minimal change disease shows normal light and electron microscopy findings other than foot process effacement, not the GBM thickening and subepithelial deposits described here.$r$, 2),
('60000000-0000-0000-0000-000000000027', 'C', 'Focal segmental glomerulosclerosis', false,
 $r$Ruled out because FSGS shows segmental scarring, not the diffuse basement membrane thickening with subepithelial deposits and anti-PLA2R positivity seen in this biopsy.$r$, 3),
('60000000-0000-0000-0000-000000000027', 'D', 'Membranoproliferative glomerulonephritis', false,
 $r$Ruled out because membranoproliferative GN shows mesangial and endocapillary proliferation with a "tram-track" double-contour appearance, a different pattern from the subepithelial deposits and anti-PLA2R positivity described here.$r$, 4),
('60000000-0000-0000-0000-000000000027', 'E', 'Diabetic nephropathy', false,
 $r$Ruled out because there is no history of diabetes provided, and diabetic nephropathy shows mesangial expansion and nodular glomerulosclerosis rather than the subepithelial immune deposits and anti-PLA2R positivity found here.$r$, 5),

-- Q28 HIV-associated nephropathy/FSGS
('60000000-0000-0000-0000-000000000028', 'A', 'HIV-associated nephropathy (a collapsing variant of focal segmental glomerulosclerosis)', true,
 $r$Correct. Rapidly progressive nephrotic syndrome with large, echogenic kidneys and collapsing FSGS on biopsy in a patient with untreated HIV is characteristic of HIV-associated nephropathy, which reflects direct viral infection of renal epithelial cells.$r$, 1),
('60000000-0000-0000-0000-000000000028', 'B', 'Minimal change disease', false,
 $r$Ruled out because minimal change disease shows normal light microscopy without the segmental sclerosis and collapsing pattern seen on this biopsy.$r$, 2),
('60000000-0000-0000-0000-000000000028', 'C', 'Membranous nephropathy', false,
 $r$Ruled out because membranous nephropathy shows GBM thickening with subepithelial deposits, not the collapsing FSGS pattern described here, and does not typically produce the large echogenic kidneys seen in this patient.$r$, 3),
('60000000-0000-0000-0000-000000000028', 'D', 'Diabetic nephropathy', false,
 $r$Ruled out because there is no history of diabetes, and this patient's rapid course with large echogenic kidneys and collapsing FSGS is specifically associated with untreated HIV infection.$r$, 4),
('60000000-0000-0000-0000-000000000028', 'E', 'Renal amyloidosis', false,
 $r$Ruled out because amyloidosis shows Congo red apple-green birefringence on biopsy, not the collapsing FSGS pattern described here.$r$, 5),

-- Q29 Anti-GBM vignette
('60000000-0000-0000-0000-000000000029', 'A', 'Anti-GBM disease (Goodpasture disease)', true,
 $r$Correct. Simultaneous pulmonary haemorrhage and glomerulonephritis with linear IgG deposition along the basement membrane on renal biopsy is the classic presentation of anti-GBM disease.$r$, 1),
('60000000-0000-0000-0000-000000000029', 'B', 'Granulomatosis with polyangiitis', false,
 $r$Ruled out because this typically shows a pauci-immune (not linear IgG) pattern on biopsy, is associated with cANCA/PR3, and usually features upper respiratory tract granulomatous disease not described here.$r$, 2),
('60000000-0000-0000-0000-000000000029', 'C', 'Microscopic polyangiitis', false,
 $r$Ruled out because this is also a pauci-immune, ANCA-associated (usually pANCA/MPO) vasculitis, not the linear IgG deposition pattern seen in this biopsy.$r$, 3),
('60000000-0000-0000-0000-000000000029', 'D', 'Eosinophilic granulomatosis with polyangiitis (Churg-Strauss)', false,
 $r$Ruled out because this is characterised by asthma, eosinophilia and pauci-immune vasculitis, not the linear IgG deposition and lack of eosinophilic features described here.$r$, 4),
('60000000-0000-0000-0000-000000000029', 'E', 'Lupus nephritis', false,
 $r$Ruled out because lupus nephritis shows granular "full house" immune complex deposition, not the linear IgG pattern seen here, and there is no other feature of SLE described.$r$, 5),

-- Q30 Renal stones imaging
('60000000-0000-0000-0000-000000000030', 'A', 'Non-contrast CT of the kidneys, ureters and bladder (CT KUB)', true,
 $r$Correct. Non-contrast CT KUB is the recommended first-line imaging investigation for suspected renal colic, as it is highly sensitive and specific for stones of any composition (including radiolucent stones) and can also identify hydronephrosis or an alternative cause of pain.$r$, 1),
('60000000-0000-0000-0000-000000000030', 'B', 'Plain abdominal X-ray alone', false,
 $r$Ruled out because a plain X-ray misses radiolucent stones (such as uric acid stones) and has lower sensitivity overall compared with CT KUB, which is the recommended first-line test.$r$, 2),
('60000000-0000-0000-0000-000000000030', 'C', 'Intravenous urography', false,
 $r$Ruled out because intravenous urography has largely been superseded by non-contrast CT KUB, which is faster, avoids contrast exposure, and has superior diagnostic accuracy.$r$, 3),
('60000000-0000-0000-0000-000000000030', 'D', 'MRI of the kidneys, ureters and bladder', false,
 $r$Ruled out because MRI is not the standard first-line investigation for renal colic; it is reserved for specific situations (such as pregnancy) where radiation must be avoided but ultrasound is inconclusive.$r$, 4),
('60000000-0000-0000-0000-000000000030', 'E', 'Renal ultrasound as the routine first-line test in all adults', false,
 $r$Ruled out because although ultrasound is preferred in pregnancy and children to avoid radiation, non-contrast CT KUB remains the first-line investigation for suspected renal colic in the general adult population due to its superior sensitivity.$r$, 5),

-- Q31 Pyelonephritis vs lower UTI
('60000000-0000-0000-0000-000000000031', 'A', 'Acute pyelonephritis', true,
 $r$Correct. Fever, rigors, loin pain and tenderness, and systemic upset (nausea and vomiting) alongside lower urinary tract symptoms indicate upper urinary tract (renal) involvement, characteristic of acute pyelonephritis rather than a simple lower UTI.$r$, 1),
('60000000-0000-0000-0000-000000000031', 'B', 'Uncomplicated lower urinary tract infection (cystitis)', false,
 $r$Ruled out because cystitis typically causes dysuria and frequency without fever, rigors or loin tenderness; the systemic and renal-angle features here indicate upper tract involvement instead.$r$, 2),
('60000000-0000-0000-0000-000000000031', 'C', 'Vaginitis', false,
 $r$Ruled out because vaginitis causes vaginal discharge and irritation, not fever, rigors and loin tenderness, and does not explain her systemic upset.$r$, 3),
('60000000-0000-0000-0000-000000000031', 'D', 'Acute appendicitis', false,
 $r$Ruled out because appendicitis classically causes right iliac fossa (not loin) pain and tenderness, and does not typically present with prominent urinary symptoms such as dysuria and frequency.$r$, 4),
('60000000-0000-0000-0000-000000000031', 'E', 'Renal colic from a ureteric stone', false,
 $r$Ruled out because renal colic causes colicky (not constant tender) pain without fever or rigors in the absence of an infected obstructed system; the systemic infective features here point to pyelonephritis instead.$r$, 5),

-- Q32 Antibiotic choice pyelonephritis
('60000000-0000-0000-0000-000000000032', 'A', 'Cefalexin', true,
 $r$Correct. Current NICE guidance recommends cefalexin (or co-amoxiclav if culture results support it) as a first-line oral antibiotic choice for acute pyelonephritis in a systemically well patient suitable for outpatient treatment.$r$, 1),
('60000000-0000-0000-0000-000000000032', 'B', 'Nitrofurantoin', false,
 $r$Ruled out because nitrofurantoin achieves poor tissue and blood levels and is not effective for upper urinary tract infection/pyelonephritis, even though it is a first-line choice for uncomplicated lower UTI.$r$, 2),
('60000000-0000-0000-0000-000000000032', 'C', 'Trimethoprim, started empirically without any culture information', false,
 $r$Ruled out because trimethoprim is only recommended for pyelonephritis once susceptibility results are known, owing to variable resistance rates, rather than as an empirical first choice.$r$, 3),
('60000000-0000-0000-0000-000000000032', 'D', 'Single-dose oral fosfomycin', false,
 $r$Ruled out because single-dose fosfomycin is used for uncomplicated lower UTI, not for pyelonephritis, which requires a longer course of an antibiotic with adequate renal tissue penetration.$r$, 4),
('60000000-0000-0000-0000-000000000032', 'E', 'Doxycycline', false,
 $r$Ruled out because doxycycline is not a recommended first-line agent for pyelonephritis in current UK guidance, which favours cefalexin, co-amoxiclav or ciprofloxacin depending on local policy and culture results.$r$, 5),

-- Q33 Drug-induced AIN
('60000000-0000-0000-0000-000000000033', 'A', 'Acute interstitial nephritis, likely due to the proton pump inhibitor', true,
 $r$Correct. AKI developing within weeks of starting a new drug, with fever, rash, eosinophilia and sterile pyuria with white cell casts, is classic for drug-induced acute interstitial nephritis; PPIs (alongside NSAIDs, penicillins and other antibiotics) are a recognised cause.$r$, 1),
('60000000-0000-0000-0000-000000000033', 'B', 'Acute tubular necrosis', false,
 $r$Ruled out because ATN does not typically cause fever, rash and eosinophilia, and urine microscopy in ATN shows granular/muddy brown casts rather than the white cell casts and sterile pyuria described here.$r$, 2),
('60000000-0000-0000-0000-000000000033', 'C', 'Acute pyelonephritis', false,
 $r$Ruled out because urine culture is negative here, arguing against a bacterial infective process; the systemic hypersensitivity features (rash, eosinophilia) alongside sterile pyuria instead point to a drug reaction.$r$, 3),
('60000000-0000-0000-0000-000000000033', 'D', 'Acute glomerulonephritis', false,
 $r$Ruled out because there is no haematuria or red cell casts described, and the combination of fever, rash and eosinophilia with sterile pyuria is characteristic of interstitial, not glomerular, inflammation.$r$, 4),
('60000000-0000-0000-0000-000000000033', 'E', 'Prerenal AKI from reduced oral intake', false,
 $r$Ruled out because prerenal AKI would not explain the fever, rash, eosinophilia or sterile pyuria with white cell casts, all of which point to a specific drug hypersensitivity reaction instead.$r$, 5),

-- Q34 Lupus nephritis
('60000000-0000-0000-0000-000000000034', 'A', 'Induction immunosuppression with high-dose corticosteroids plus cyclophosphamide or mycophenolate mofetil', true,
 $r$Correct. Class IV (diffuse proliferative) lupus nephritis is an aggressive, high-risk form requiring induction immunosuppression, typically high-dose corticosteroids combined with cyclophosphamide or mycophenolate mofetil, to prevent progression to end-stage renal disease.$r$, 1),
('60000000-0000-0000-0000-000000000034', 'B', 'An ACE inhibitor alone, without any immunosuppression', false,
 $r$Ruled out because although ACE inhibitors provide useful adjunctive antiproteinuric benefit, class IV lupus nephritis requires active immunosuppression to control the underlying proliferative inflammation; an ACE inhibitor alone is insufficient.$r$, 2),
('60000000-0000-0000-0000-000000000034', 'C', 'Hydroxychloroquine as monotherapy', false,
 $r$Ruled out because hydroxychloroquine is a useful background therapy in SLE but is not sufficient alone for active class IV nephritis, which requires more intensive induction immunosuppression.$r$, 3),
('60000000-0000-0000-0000-000000000034', 'D', 'Observation only, with repeat biopsy in 6 months', false,
 $r$Ruled out because class IV lupus nephritis is an aggressive lesion with a high risk of progression to renal failure if untreated; prompt induction immunosuppression, not observation, is required.$r$, 4),
('60000000-0000-0000-0000-000000000034', 'E', 'Plasma exchange alone', false,
 $r$Ruled out because plasma exchange is not standard first-line therapy for lupus nephritis; induction immunosuppression with corticosteroids and cyclophosphamide or mycophenolate mofetil is the established approach.$r$, 5),

-- Q35 Diabetic nephropathy renoprotection
('60000000-0000-0000-0000-000000000035', 'A', 'Start an ACE inhibitor (or ARB) for renoprotection, regardless of his blood pressure being at target', true,
 $r$Correct. In diabetic patients with confirmed microalbuminuria, an ACE inhibitor or ARB is started for its renoprotective effect (reducing intraglomerular pressure and proteinuria) even when blood pressure is already within target range, because the benefit is independent of blood pressure lowering alone.$r$, 1),
('60000000-0000-0000-0000-000000000035', 'B', 'No treatment is needed because his blood pressure is already within target', false,
 $r$Ruled out because renoprotective therapy with an ACE inhibitor/ARB is indicated on the basis of confirmed microalbuminuria itself, independent of his blood pressure already being at target.$r$, 2),
('60000000-0000-0000-0000-000000000035', 'C', 'Start a calcium channel blocker first-line for renoprotection', false,
 $r$Ruled out because calcium channel blockers do not have the same specific renoprotective, antiproteinuric effect in diabetic nephropathy as ACE inhibitors/ARBs, which are the preferred first-line agents in this context.$r$, 3),
('60000000-0000-0000-0000-000000000035', 'D', 'Start a high-dose loop diuretic', false,
 $r$Ruled out because a loop diuretic addresses fluid overload, not the underlying intraglomerular pressure and proteinuria driving progression of diabetic nephropathy; it is not the renoprotective agent of choice here.$r$, 4),
('60000000-0000-0000-0000-000000000035', 'E', 'Delay any treatment until macroalbuminuria develops', false,
 $r$Ruled out because starting renoprotective therapy at the microalbuminuria stage, before progression to macroalbuminuria, is precisely when intervention is most effective at slowing progression.$r$, 5),

-- Q36 AKI vs CKD - ADPKD exception
('60000000-0000-0000-0000-000000000036', 'A', 'Bilaterally enlarged kidneys are an expected feature of ADPKD, so kidney size cannot be relied upon here to exclude an underlying chronic component; other markers of chronicity should instead be sought', true,
 $r$Correct. Although bilaterally small kidneys usually support CKD over AKI, ADPKD (suggested here by the enlarged, cystic kidneys and a father with renal failure) is a recognised exception in which kidneys remain enlarged despite substantial chronic renal disease, so additional clues such as symptom duration, anaemia or hypocalcaemia are needed to assess chronicity.$r$, 1),
('60000000-0000-0000-0000-000000000036', 'B', 'Small kidneys on ultrasound always indicate acute kidney injury', false,
 $r$Ruled out because this is the reverse of the usual pattern; bilaterally small kidneys are the classic ultrasound feature supporting chronic, not acute, kidney disease.$r$, 2),
('60000000-0000-0000-0000-000000000036', 'C', 'Enlarged kidneys on ultrasound exclude any element of chronic kidney disease', false,
 $r$Ruled out because ADPKD is a specific, recognised exception in which kidneys remain enlarged despite significant underlying chronic renal impairment, so enlargement alone cannot exclude a chronic component.$r$, 3),
('60000000-0000-0000-0000-000000000036', 'D', 'Renal ultrasound has no useful role in the assessment of AKI', false,
 $r$Ruled out because ultrasound remains valuable for excluding obstruction and assessing kidney size/echogenicity as a clue to chronicity; its interpretation simply needs to account for recognised exceptions such as ADPKD here.$r$, 4),
('60000000-0000-0000-0000-000000000036', 'E', 'A normal serum calcium confirms this is a purely acute process', false,
 $r$Ruled out because a normal calcium does not exclude chronic kidney disease; hypocalcaemia is a supportive but not mandatory biochemical clue to chronicity, and its absence does not rule out an underlying chronic component, particularly with ADPKD.$r$, 5),

-- Q37 Triple whammy + vomiting -> prerenal AKI -> drug accumulation
('60000000-0000-0000-0000-000000000037', 'A', 'Volume depletion from vomiting and diarrhoea, combined with continued NSAID and ACE inhibitor use, removed the renal autoregulatory mechanisms protecting her GFR, causing prerenal AKI and impaired renal clearance of potassium', true,
 $r$Correct. NSAIDs impair afferent arteriolar vasodilation via prostaglandin inhibition, while ACE inhibitors impair efferent arteriolar vasoconstriction; together, in the setting of volume depletion from her gastrointestinal illness, they remove both compensatory mechanisms that normally preserve GFR, precipitating prerenal AKI, which then reduces renal potassium clearance (further impaired by the ACE inhibitor itself) and drives her severe hyperkalaemia and confusion.$r$, 1),
('60000000-0000-0000-0000-000000000037', 'B', 'Direct nephrotoxic tubular necrosis caused by the diuretic alone', false,
 $r$Ruled out because diuretics are not typically directly nephrotoxic in this way; the mechanism here is haemodynamic (prerenal), driven by volume depletion combined with the NSAID/ACE inhibitor effect on renal autoregulation, not direct tubular toxicity from the diuretic.$r$, 2),
('60000000-0000-0000-0000-000000000037', 'C', 'An allergic interstitial nephritis reaction to the naproxen', false,
 $r$Ruled out because there is no fever, rash or eosinophilia described, and the clinical timeline (vomiting/diarrhoea illness with continued triple whammy medication use) specifically points to a haemodynamic prerenal mechanism rather than a hypersensitivity reaction.$r$, 3),
('60000000-0000-0000-0000-000000000037', 'D', 'A primary Addisonian crisis unrelated to her medications', false,
 $r$Ruled out because there is no history of adrenal insufficiency, and her presentation is fully explained by the well-recognised triple whammy mechanism combined with volume depletion, rather than primary adrenal failure.$r$, 4),
('60000000-0000-0000-0000-000000000037', 'E', 'Rhabdomyolysis secondary to her vomiting illness', false,
 $r$Ruled out because there is no CK elevation or myoglobinuria described, and her biochemical and clinical picture is fully accounted for by the triple whammy drug interaction with volume depletion, not muscle breakdown.$r$, 5),

-- Q38 Crush injury -> rhabdo -> myoglobin ATN -> hyperkalaemia -> arrest
('60000000-0000-0000-0000-000000000038', 'A', 'Myoglobin released from crushed muscle caused acute tubular necrosis and oliguric AKI, and the resulting failure to excrete potassium (already raised from cell lysis) caused progressive, fatal hyperkalaemia', true,
 $r$Correct. Massive muscle breakdown releases myoglobin, which is directly nephrotoxic to renal tubules and can obstruct them as casts, causing acute tubular necrosis and oliguric AKI; cell lysis also releases large amounts of intracellular potassium, and once the kidneys fail to excrete this, potassium rises to a level that destabilises the cardiac membrane and precipitates the arrhythmic cardiac arrest.$r$, 1),
('60000000-0000-0000-0000-000000000038', 'B', 'Hypovolaemic shock from external blood loss alone', false,
 $r$Ruled out because there is no external haemorrhage described; his deterioration is explained by myoglobin-mediated renal failure and the resulting hyperkalaemia, not exsanguination.$r$, 2),
('60000000-0000-0000-0000-000000000038', 'C', 'Fat embolism syndrome', false,
 $r$Ruled out because fat embolism classically causes respiratory distress, confusion and a petechial rash following long bone fracture, not the oliguric renal failure and hyperkalaemic arrest described here.$r$, 3),
('60000000-0000-0000-0000-000000000038', 'D', 'Compartment syndrome directly causing the cardiac arrest', false,
 $r$Ruled out because compartment syndrome threatens the limb and can precipitate rhabdomyolysis, but the arrest itself is caused by the resulting hyperkalaemia from myoglobin-induced ATN, not the compartment pressure itself.$r$, 4),
('60000000-0000-0000-0000-000000000038', 'E', 'A primary cardiac contusion from the crush injury', false,
 $r$Ruled out because no chest injury is described, and the biochemical trajectory (rising CK, oliguria, dark urine, then arrest) specifically points to hyperkalaemic arrest from myoglobin-induced ATN rather than direct cardiac trauma.$r$, 5),

-- Q39 CKD -> vit D -> hypocalcaemia -> secondary hyperPTH -> osteodystrophy
('60000000-0000-0000-0000-000000000039', 'A', 'Failing kidneys lost the ability to activate vitamin D and retained phosphate, causing hypocalcaemia that drove secondary hyperparathyroidism and increased osteoclastic bone resorption (renal osteodystrophy)', true,
 $r$Correct. Reduced renal 1-alpha-hydroxylase activity impairs conversion of 25-hydroxyvitamin D to its active form, reducing intestinal calcium absorption, while phosphate retention further lowers calcium and directly stimulates PTH secretion; the resulting chronic secondary hyperparathyroidism increases osteoclastic bone resorption, producing renal osteodystrophy and her pathological fracture.$r$, 1),
('60000000-0000-0000-0000-000000000039', 'B', 'Primary hyperparathyroidism from an autonomous parathyroid adenoma', false,
 $r$Ruled out because primary hyperparathyroidism causes hypercalcaemia, not the low calcium seen here, and is unrelated to her underlying renal disease.$r$, 2),
('60000000-0000-0000-0000-000000000039', 'C', 'Age-related osteoporosis alone', false,
 $r$Ruled out because osteoporosis alone does not explain the specific biochemical pattern of hypocalcaemia, hyperphosphataemia and markedly raised PTH seen in CKD-mineral bone disease.$r$, 3),
('60000000-0000-0000-0000-000000000039', 'D', 'Vitamin D toxicity', false,
 $r$Ruled out because vitamin D toxicity causes hypercalcaemia with a suppressed PTH, the opposite biochemical pattern to that described here.$r$, 4),
('60000000-0000-0000-0000-000000000039', 'E', 'Multiple myeloma with lytic bone lesions', false,
 $r$Ruled out because myeloma classically causes hypercalcaemia (not hypocalcaemia) and would be expected to show a paraprotein or other myeloma-related features, neither of which is described here; her pattern instead fits CKD-mineral bone disease.$r$, 5),

-- Q40 Myeloma cast nephropathy + hypercalcaemia
('60000000-0000-0000-0000-000000000040', 'A', 'Excess monoclonal free light chains formed obstructive casts in the distal tubules (myeloma cast nephropathy), and this was compounded by myeloma-related hypercalcaemia further reducing renal perfusion', true,
 $r$Correct. Multiple myeloma produces excess free light chains, which precipitate with Tamm-Horsfall protein to form obstructive intratubular casts, directly injuring the renal tubules; this is compounded by osteoclast-activating-factor-driven hypercalcaemia, which causes renal vasoconstriction and volume depletion, further worsening the AKI.$r$, 1),
('60000000-0000-0000-0000-000000000040', 'B', 'Contrast-induced nephropathy from a recent imaging study', false,
 $r$Ruled out because no recent contrast exposure is mentioned, and the systemic features (hypercalcaemia, paraprotein, anaemia, bone pain) specifically point to myeloma-related renal injury instead.$r$, 2),
('60000000-0000-0000-0000-000000000040', 'C', 'Diabetic nephropathy', false,
 $r$Ruled out because there is no history of diabetes, and his acute deterioration alongside hypercalcaemia and a paraprotein is far more consistent with myeloma than a chronic glomerular process.$r$, 3),
('60000000-0000-0000-0000-000000000040', 'D', 'AL amyloidosis alone, without cast nephropathy', false,
 $r$Ruled out because although myeloma-associated AL amyloidosis can occur and cause nephrotic-range proteinuria on formal testing, the near-negative urine dipstick despite significant proteinuria (light chains not detected by standard dipstick) is more typical of light-chain cast nephropathy than glomerular amyloid deposition.$r$, 4),
('60000000-0000-0000-0000-000000000040', 'E', 'Acute pyelonephritis', false,
 $r$Ruled out because there is no fever, loin pain or urinary symptoms described; his systemic features instead point to myeloma-related renal injury.$r$, 5),

-- Q41 Diabetes -> hyperfiltration -> nephropathy -> nephrotic proteinuria -> hypoalbuminaemia/oedema
('60000000-0000-0000-0000-000000000041', 'A', 'Progressive diabetic glomerular damage advanced from microalbuminuria to nephrotic-range proteinuria, and the resulting heavy protein loss caused hypoalbuminaemia, reducing plasma oncotic pressure and driving fluid into the interstitium', true,
 $r$Correct. Longstanding hyperglycaemia causes glomerular hyperfiltration, basement membrane thickening and mesangial expansion (diabetic nephropathy), progressing over years from microalbuminuria to overt nephrotic-range proteinuria; the resulting heavy protein loss produces hypoalbuminaemia, which lowers plasma oncotic pressure and drives fluid into the interstitial space, explaining his oedema.$r$, 1),
('60000000-0000-0000-0000-000000000041', 'B', 'An acute glomerulonephritis unrelated to his diabetes', false,
 $r$Ruled out because the gradual progression from known microalbuminuria over 15 years, alongside coexisting diabetic retinopathy, fits chronic diabetic nephropathy rather than a new acute nephritic process.$r$, 2),
('60000000-0000-0000-0000-000000000041', 'C', 'Right heart failure causing peripheral oedema', false,
 $r$Ruled out because this does not explain his marked hypoalbuminaemia and nephrotic-range proteinuria; his oedema is driven by loss of oncotic pressure from renal protein loss, not venous congestion.$r$, 3),
('60000000-0000-0000-0000-000000000041', 'D', 'Liver cirrhosis causing hypoalbuminaemia', false,
 $r$Ruled out because there is no history or examination finding of chronic liver disease, and his renal findings (heavy proteinuria, diabetic retinopathy) point to a renal, not hepatic, cause of his hypoalbuminaemia.$r$, 4),
('60000000-0000-0000-0000-000000000041', 'E', 'Malnutrition-related hypoalbuminaemia', false,
 $r$Ruled out because this does not account for the nephrotic-range proteinuria found on urine testing, which indicates renal protein loss rather than reduced hepatic synthesis.$r$, 5),

-- Q42 ACEi + spironolactone + diarrhoea -> prerenal AKI -> severe hyperkalaemia
('60000000-0000-0000-0000-000000000042', 'A', 'Diarrhoeal volume depletion caused prerenal AKI, which sharply reduced her renal potassium excretion, and this compounded the pre-existing reduction in potassium excretion from her ACE inhibitor and spironolactone', true,
 $r$Correct. Diarrhoeal fluid loss caused volume depletion and prerenal AKI, which sharply reduces renal potassium excretion; because both ramipril (reducing aldosterone-driven potassium secretion) and spironolactone (directly blocking the mineralocorticoid receptor) already limited her capacity to excrete potassium, the additional loss of renal perfusion tipped her into severe, life-threatening hyperkalaemia.$r$, 1),
('60000000-0000-0000-0000-000000000042', 'B', 'Increased dietary potassium intake from oral rehydration solutions', false,
 $r$Ruled out because standard oral rehydration solutions do not contain enough potassium to independently cause this degree of hyperkalaemia; the dominant mechanism here is impaired renal excretion, not excess intake.$r$, 2),
('60000000-0000-0000-0000-000000000042', 'C', 'A direct cardiotoxic effect of spironolactone independent of potassium', false,
 $r$Ruled out because spironolactone's clinical risk in this context operates specifically through causing hyperkalaemia via aldosterone antagonism, not a separate direct cardiotoxic mechanism.$r$, 3),
('60000000-0000-0000-0000-000000000042', 'D', 'A metabolic alkalosis from vomiting driving a transcellular potassium shift', false,
 $r$Ruled out because there is no vomiting described, only diarrhoea, which causes bicarbonate loss and a tendency towards acidosis rather than alkalosis, and the dominant mechanism here is impaired renal excretion of potassium, not a transcellular shift.$r$, 4),
('60000000-0000-0000-0000-000000000042', 'E', 'A primary Addisonian crisis unrelated to her medications', false,
 $r$Ruled out because there is no prior history of adrenal insufficiency, and her presentation is fully explained by the combination of volume-depletion-driven AKI and two potassium-retaining medications.$r$, 5),

-- Q43 Tumour lysis syndrome
('60000000-0000-0000-0000-000000000043', 'A', 'Massive chemotherapy-induced lysis of a large tumour burden released potassium, phosphate and nucleic acids (metabolised to uric acid), and uric acid and calcium phosphate crystals precipitated in the renal tubules, causing obstructive injury', true,
 $r$Correct. Rapid lysis of a large tumour burden after induction chemotherapy releases massive amounts of intracellular potassium, phosphate and nucleic acids (metabolised to uric acid); uric acid and calcium phosphate crystals then precipitate within the renal tubules, causing obstructive intratubular crystal deposition and direct tubular injury, while released phosphate binds calcium, causing the hypocalcaemia seen alongside his AKI.$r$, 1),
('60000000-0000-0000-0000-000000000043', 'B', 'Direct nephrotoxicity from the chemotherapy drug itself', false,
 $r$Ruled out because although some chemotherapy agents are directly nephrotoxic, the specific biochemical pattern here (hyperkalaemia, hyperphosphataemia, hypocalcaemia and hyperuricaemia appearing together rapidly after treating a high-burden tumour) is the hallmark of tumour lysis syndrome rather than direct drug toxicity.$r$, 2),
('60000000-0000-0000-0000-000000000043', 'C', 'Contrast-induced nephropathy', false,
 $r$Ruled out because no contrast exposure is mentioned, and the electrolyte pattern described is specific to cell lysis, not contrast toxicity.$r$, 3),
('60000000-0000-0000-0000-000000000043', 'D', 'Sepsis-related acute tubular necrosis', false,
 $r$Ruled out because no fever or evidence of infection is described, and the temporal relationship to chemotherapy alongside the classic electrolyte tetrad points to tumour lysis syndrome instead.$r$, 4),
('60000000-0000-0000-0000-000000000043', 'E', 'Hyperviscosity syndrome from the underlying malignancy', false,
 $r$Ruled out because hyperviscosity is typically seen with very high paraprotein or cell counts causing microvascular sludging, not this acute electrolyte-driven crystal nephropathy following cytotoxic treatment.$r$, 5),

-- Q44 HUS
('60000000-0000-0000-0000-000000000044', 'A', 'Shiga toxin damaged renal microvascular endothelial cells, triggering platelet activation and fibrin microthrombi that mechanically sheared red cells and obstructed glomerular capillaries', true,
 $r$Correct. Shiga toxin produced by this E. coli strain enters the circulation and damages glomerular and renal microvascular endothelial cells, triggering localised platelet activation and fibrin deposition; this consumes platelets and mechanically shears red cells passing through the damaged microvasculature (producing the schistocytes and haemolysis seen), while the microthrombi themselves obstruct glomerular capillaries and cause his acute kidney injury.$r$, 1),
('60000000-0000-0000-0000-000000000044', 'B', 'Direct bacterial invasion and infection of the renal parenchyma', false,
 $r$Ruled out because haemolytic uraemic syndrome results from the systemic effects of a circulating toxin, not direct bacterial invasion of the kidney itself.$r$, 2),
('60000000-0000-0000-0000-000000000044', 'C', 'Autoimmune (Coombs-positive) destruction of red cells', false,
 $r$Ruled out because the haemolysis in HUS is mechanical (microangiopathic, from red cells shearing on damaged endothelium and fibrin strands), not immune-mediated, and the direct Coombs test is typically negative.$r$, 3),
('60000000-0000-0000-0000-000000000044', 'D', 'ADAMTS13 deficiency causing uncontrolled platelet aggregation', false,
 $r$Ruled out because this describes the mechanism of TTP, not typical Shiga-toxin-associated HUS, in which ADAMTS13 activity is normal.$r$, 4),
('60000000-0000-0000-0000-000000000044', 'E', 'Disseminated intravascular coagulation triggered by sepsis', false,
 $r$Ruled out because DIC typically shows a coagulopathy with prolonged clotting times and low fibrinogen alongside widespread bleeding, which is not the pattern described; this is a localised microangiopathic process rather than a systemic sepsis-driven consumptive coagulopathy.$r$, 5),

-- Q45 TTP
('60000000-0000-0000-0000-000000000045', 'A', 'Severe ADAMTS13 deficiency allowed ultra-large von Willebrand factor multimers to persist, promoting spontaneous platelet aggregation and widespread microthrombi that sheared red cells and caused ischaemic organ damage', true,
 $r$Correct. Severe deficiency of ADAMTS13 (the enzyme that normally cleaves ultra-large von Willebrand factor multimers) allows these large multimers to persist in the circulation, promoting spontaneous platelet aggregation and widespread microthrombi in small vessels; this causes mechanical shearing of red cells (microangiopathic haemolysis), consumption of platelets, and ischaemic organ damage, particularly affecting the brain (her confusion) and kidneys.$r$, 1),
('60000000-0000-0000-0000-000000000045', 'B', 'Shiga-toxin-mediated endothelial injury', false,
 $r$Ruled out because this is the mechanism of typical HUS, which does not feature the severe ADAMTS13 deficiency or the prominent neurological involvement seen in this patient.$r$, 2),
('60000000-0000-0000-0000-000000000045', 'C', 'Immune thrombocytopenic purpura from anti-platelet antibodies', false,
 $r$Ruled out because ITP causes isolated thrombocytopenia without haemolysis, schistocytes or ADAMTS13 deficiency, unlike the picture described here.$r$, 3),
('60000000-0000-0000-0000-000000000045', 'D', 'Disseminated intravascular coagulation', false,
 $r$Ruled out because DIC would typically show deranged clotting times and low fibrinogen from consumption of clotting factors, not an isolated severe ADAMTS13 deficiency as found here.$r$, 4),
('60000000-0000-0000-0000-000000000045', 'E', 'Autoimmune haemolytic anaemia with secondary thrombocytopenia (Evans syndrome)', false,
 $r$Ruled out because the direct Coombs test is negative here, and the presence of schistocytes together with severe ADAMTS13 deficiency indicates a mechanical, not autoimmune, haemolytic process.$r$, 5),

-- Q46 SIADH from small cell lung cancer
('60000000-0000-0000-0000-000000000046', 'A', 'Ectopic ADH secretion from a small cell lung cancer caused inappropriate renal water retention, producing dilutional, euvolaemic hyponatraemia with inappropriately concentrated urine', true,
 $r$Correct. The central lung mass is most likely a small cell lung cancer producing ectopic ADH, which causes inappropriate renal water retention (via increased aquaporin insertion in the collecting duct) despite normal or expanded intravascular volume; the resulting dilutional effect lowers serum sodium while the kidneys continue to excrete sodium appropriately, producing euvolaemic hyponatraemia with the characteristic biochemical pattern of SIADH.$r$, 1),
('60000000-0000-0000-0000-000000000046', 'B', 'Cranial diabetes insipidus', false,
 $r$Ruled out because DI causes hypernatraemia with inappropriately dilute (not concentrated) urine, the opposite biochemical pattern to that described here.$r$, 2),
('60000000-0000-0000-0000-000000000046', 'C', 'Primary polydipsia', false,
 $r$Ruled out because this would show appropriately dilute (low osmolality) urine as the kidneys attempt to excrete the excess water load, not the inappropriately concentrated urine seen here.$r$, 3),
('60000000-0000-0000-0000-000000000046', 'D', 'Adrenal insufficiency', false,
 $r$Ruled out because his adrenal function is stated to be normal, and Addison disease would typically also feature hyperkalaemia and hypotension, which are not described here.$r$, 4),
('60000000-0000-0000-0000-000000000046', 'E', 'Salt-losing nephropathy causing hypovolaemic hyponatraemia', false,
 $r$Ruled out because he is described as clinically euvolaemic, not volume-depleted, which fits SIADH rather than a renal salt-wasting process.$r$, 5),

-- Q47 Cranial DI post-pituitary surgery
('60000000-0000-0000-0000-000000000047', 'A', 'Surgical disruption of the hypothalamic-pituitary axis caused ADH deficiency (cranial diabetes insipidus), so the collecting ducts could not concentrate urine and large volumes of free water were lost, producing hypernatraemia', true,
 $r$Correct. Surgical disruption of the posterior pituitary/hypothalamic-pituitary axis has caused a deficiency of antidiuretic hormone (cranial diabetes insipidus); without ADH, the renal collecting ducts cannot insert aquaporin-2 water channels, so free water is lost in large volumes of inappropriately dilute urine despite rising plasma osmolality, producing her hypernatraemic dehydration.$r$, 1),
('60000000-0000-0000-0000-000000000047', 'B', 'SIADH from surgical stress', false,
 $r$Ruled out because SIADH would cause hyponatraemia with concentrated urine, the opposite biochemical pattern to the hypernatraemia and dilute urine seen here.$r$, 2),
('60000000-0000-0000-0000-000000000047', 'C', 'Osmotic diuresis from hyperglycaemia', false,
 $r$Ruled out because there is no mention of elevated glucose, and the clinical context of recent pituitary surgery points specifically to disruption of ADH secretion rather than an osmotic diuresis.$r$, 3),
('60000000-0000-0000-0000-000000000047', 'D', 'Acute tubular necrosis with a polyuric recovery phase', false,
 $r$Ruled out because there is no preceding oliguric AKI described, and the inappropriately dilute urine with hypernatraemia is specific to ADH deficiency, not tubular recovery.$r$, 4),
('60000000-0000-0000-0000-000000000047', 'E', 'Primary polydipsia', false,
 $r$Ruled out because this is a behavioural excess water intake causing dilute urine with low-normal or low sodium, not the hypernatraemia driven by pathological water loss seen here.$r$, 5),

-- Q48 GPA/ANCA vasculitis
('60000000-0000-0000-0000-000000000048', 'A', 'Granulomatosis with polyangiitis, in which ANCA-activated neutrophils attack small vessel walls, causing pauci-immune necrotising crescentic glomerulonephritis', true,
 $r$Correct. This is granulomatosis with polyangiitis, a cANCA/PR3-associated small-vessel vasculitis; ANCA antibodies activate primed neutrophils, which attack the walls of small vessels including glomerular capillaries, causing necrotising, pauci-immune crescentic glomerulonephritis alongside the upper respiratory and pulmonary features described.$r$, 1),
('60000000-0000-0000-0000-000000000048', 'B', 'Anti-GBM disease (Goodpasture disease)', false,
 $r$Ruled out because anti-GBM disease typically shows linear IgG deposition along the GBM on immunofluorescence, not the pauci-immune pattern described here, and does not usually feature upper airway granulomatous disease.$r$, 2),
('60000000-0000-0000-0000-000000000048', 'C', 'Post-streptococcal glomerulonephritis', false,
 $r$Ruled out because this occurs after streptococcal infection with immune-complex deposition and low complement, not the pauci-immune, ANCA-associated pattern with upper respiratory granulomatous disease described here.$r$, 3),
('60000000-0000-0000-0000-000000000048', 'D', 'Lupus nephritis', false,
 $r$Ruled out because lupus nephritis shows immune-complex ("full house") deposition on immunofluorescence and is associated with anti-dsDNA antibodies, not the pauci-immune pattern and cANCA/PR3 positivity seen here.$r$, 4),
('60000000-0000-0000-0000-000000000048', 'E', 'IgA nephropathy', false,
 $r$Ruled out because this shows mesangial IgA deposition and typically presents with isolated haematuria after a respiratory infection, not the systemic vasculitic features and cANCA positivity described here.$r$, 5),

-- Q49 Dialysis indications AEIOU
('60000000-0000-0000-0000-000000000049', 'A', 'Urgent (emergency) haemodialysis', true,
 $r$Correct. He has multiple concurrent indications for emergency dialysis: hyperkalaemia refractory to medical treatment, severe acidosis (pH 7.05), uraemic encephalopathy and diuretic-resistant pulmonary oedema; urgent haemodialysis is required to address all of these simultaneously.$r$, 1),
('60000000-0000-0000-0000-000000000049', 'B', 'Further doses of insulin-dextrose to continue treating his hyperkalaemia medically', false,
 $r$Ruled out because his hyperkalaemia has already failed to respond to standard medical therapy, and alongside his refractory acidosis, uraemic encephalopathy and diuretic-resistant fluid overload, this meets multiple indications for emergency dialysis rather than further medical measures alone.$r$, 2),
('60000000-0000-0000-0000-000000000049', 'C', 'IV sodium bicarbonate alone to correct his acidosis', false,
 $r$Ruled out because bicarbonate does not address his co-existing refractory hyperkalaemia, fluid overload or uraemic encephalopathy, all of which are addressed definitively by dialysis.$r$, 3),
('60000000-0000-0000-0000-000000000049', 'D', 'Further high-dose IV furosemide', false,
 $r$Ruled out because he is anuric and already unresponsive to furosemide, so escalating diuretic dosing is unlikely to be effective and does not address the multiple concurrent indications for dialysis.$r$, 4),
('60000000-0000-0000-0000-000000000049', 'E', 'Watchful waiting with repeat bloods in 12 hours', false,
 $r$Ruled out because he has multiple immediately life-threatening indications for emergency renal replacement therapy, and delaying treatment risks fatal arrhythmia, respiratory failure or coma.$r$, 5),

-- Q50 Renal transplant rejection differential
('60000000-0000-0000-0000-000000000050', 'A', 'Acute T-cell-mediated (cellular) rejection, confirmed by graft biopsy showing lymphocytic tubulointerstitial infiltration', true,
 $r$Correct. A rising creatinine with graft tenderness occurring days after an initially uncomplicated transplant, with a therapeutic tacrolimus level and no obstruction or vascular thrombosis on ultrasound, is most likely acute T-cell-mediated rejection, in which recipient T-lymphocytes infiltrate the graft causing tubulitis; this is confirmed by graft biopsy and treated with pulsed corticosteroids or escalated immunosuppression.$r$, 1),
('60000000-0000-0000-0000-000000000050', 'B', 'Calcineurin inhibitor (tacrolimus) nephrotoxicity', false,
 $r$Ruled out because her tacrolimus level is within the therapeutic target range, making drug-level-related toxicity a less likely primary explanation than acute rejection, although it remains a differential to exclude on biopsy.$r$, 2),
('60000000-0000-0000-0000-000000000050', 'C', 'Hyperacute (antibody-mediated) rejection', false,
 $r$Ruled out because hyperacute rejection occurs within minutes to hours of transplantation due to pre-formed recipient antibodies, not on day 9 after an initially uncomplicated course.$r$, 3),
('60000000-0000-0000-0000-000000000050', 'D', 'Acute tubular necrosis from prolonged cold ischaemia time', false,
 $r$Ruled out because this typically presents as delayed graft function immediately post-operatively, not after a week of normal graft function followed by a new rise in creatinine.$r$, 4),
('60000000-0000-0000-0000-000000000050', 'E', 'Ureteric obstruction from a surgical stricture', false,
 $r$Ruled out because renal ultrasound has already excluded ureteric obstruction/hydronephrosis in this patient.$r$, 5)

on conflict (question_id, label) do nothing;

-- ---------------------------------------------------------------------------
-- Discriminators
-- ---------------------------------------------------------------------------

insert into question_discriminators (question_id, discriminator_text, sort_order) values

('60000000-0000-0000-0000-000000000001', $d$KDIGO stage 1 is defined by a creatinine rise of at least 26.5 micromol/L in 48 hours, or 1.5-1.9x baseline in 7 days, or urine output under 0.5 mL/kg/h for 6-12 hours.$d$, 1),
('60000000-0000-0000-0000-000000000001', $d$Even a small absolute creatinine rise can qualify as AKI if it crosses the KDIGO threshold, regardless of whether the patient looks otherwise well.$d$, 2),
('60000000-0000-0000-0000-000000000001', $d$AKI is staged using whichever of the creatinine or urine-output criteria gives the higher (more severe) stage.$d$, 3),

('60000000-0000-0000-0000-000000000002', $d$Anti-GBM antibodies target the alpha-3 chain of type IV collagen, found in both the glomerular and alveolar basement membranes, explaining the combined renal and pulmonary presentation.$d$, 1),
('60000000-0000-0000-0000-000000000002', $d$Linear (not granular) immunofluorescence staining along the GBM is the classic biopsy pattern distinguishing anti-GBM disease from immune-complex glomerulonephritides.$d$, 2),

('60000000-0000-0000-0000-000000000003', $d$Nephrotic syndrome requires proteinuria, hypoalbuminaemia and oedema together; nephritic syndrome is instead defined by haematuria, red cell casts and hypertension.$d$, 1),
('60000000-0000-0000-0000-000000000003', $d$Hyperlipidaemia is a recognised secondary feature of nephrotic syndrome, driven by increased hepatic lipoprotein synthesis in response to hypoalbuminaemia.$d$, 2),

('60000000-0000-0000-0000-000000000004', $d$Red cell casts indicate bleeding directly from the glomerulus and are one of the most specific urinary findings in glomerulonephritis.$d$, 1),
('60000000-0000-0000-0000-000000000004', $d$Dysmorphic red cells (as opposed to normally-shaped red cells) also point to a glomerular, rather than lower urinary tract, source of bleeding.$d$, 2),

('60000000-0000-0000-0000-000000000005', $d$CKD staging by eGFR requires two measurements at least 3 months apart to confirm chronicity.$d$, 1),
('60000000-0000-0000-0000-000000000005', $d$G3b (eGFR 30-44) is distinguished from G3a (45-59) purely by the eGFR band, both falling within the broader "moderate" CKD category.$d$, 2),

('60000000-0000-0000-0000-000000000006', $d$Minimal change disease is the most common cause of nephrotic syndrome in children and is typically highly steroid-responsive.$d$, 1),
('60000000-0000-0000-0000-000000000006', $d$Foot process effacement on electron microscopy, with an otherwise normal biopsy, is the defining histological feature.$d$, 2),

('60000000-0000-0000-0000-000000000007', $d$IgA nephropathy classically causes visible haematuria within 1-2 days of a mucosal (upper respiratory or gastrointestinal) infection, termed a synpharyngitic pattern.$d$, 1),
('60000000-0000-0000-0000-000000000007', $d$It is the most common cause of glomerulonephritis worldwide.$d$, 2),
('60000000-0000-0000-0000-000000000007', $d$Mesangial IgA deposition on biopsy, without the systemic features of IgA vasculitis (Henoch-Schonlein purpura), distinguishes isolated renal IgA nephropathy.$d$, 3),

('60000000-0000-0000-0000-000000000008', $d$Post-streptococcal GN has a latent period of 1-3 weeks after streptococcal infection, longer than the synpharyngitic pattern of IgA nephropathy.$d$, 1),
('60000000-0000-0000-0000-000000000008', $d$A transiently low C3 that normalises over subsequent weeks is a supportive biochemical clue, unlike the persistently low complement seen in lupus nephritis.$d$, 2),

('60000000-0000-0000-0000-000000000009', $d$PKD1 mutations (chromosome 16) cause the majority of ADPKD cases and are associated with earlier progression to end-stage renal disease than PKD2.$d$, 1),
('60000000-0000-0000-0000-000000000009', $d$ADPKD is inherited in an autosomal dominant pattern, so an affected parent gives roughly a 50% risk of transmission to each child.$d$, 2),

('60000000-0000-0000-0000-000000000010', $d$Angiotensin II preferentially constricts the efferent arteriole to preserve glomerular filtration pressure when renal blood flow is reduced by arterial stenosis.$d$, 1),
('60000000-0000-0000-0000-000000000010', $d$ACE inhibitors and ARBs should be used cautiously (with renal function monitoring) or avoided in bilateral renal artery stenosis or stenosis in a single functioning kidney, given the risk of a sharp GFR fall.$d$, 2),

('60000000-0000-0000-0000-000000000011', $d$Type 1 (distal) RTA causes an inability to acidify the urine below pH 5.5 despite systemic acidosis, distinguishing it from type 2 (proximal) RTA.$d$, 1),
('60000000-0000-0000-0000-000000000011', $d$Hypokalaemia and nephrocalcinosis/renal stones are recognised complications of type 1 RTA, in contrast to the hyperkalaemia of type 4 RTA.$d$, 2),
('60000000-0000-0000-0000-000000000011', $d$Type 1 RTA is associated with autoimmune conditions such as Sjogren syndrome and rheumatoid arthritis.$d$, 3),

('60000000-0000-0000-0000-000000000012', $d$Congo red staining with apple-green birefringence under polarised light is the diagnostic hallmark of amyloid deposition on biopsy.$d$, 1),
('60000000-0000-0000-0000-000000000012', $d$AA amyloidosis arises from chronic inflammatory conditions (such as rheumatoid arthritis), distinct from AL amyloidosis, which arises from a plasma cell dyscrasia such as myeloma.$d$, 2),

('60000000-0000-0000-0000-000000000013', $d$The ECG progression in worsening hyperkalaemia runs from tall tented T waves, to P wave flattening/loss, to QRS widening, and finally to a sine-wave pattern.$d$, 1),
('60000000-0000-0000-0000-000000000013', $d$Recognising the earliest ECG change allows treatment to be started before more dangerous, later changes develop.$d$, 2),

('60000000-0000-0000-0000-000000000014', $d$Calcium gluconate stabilises the cardiac membrane without lowering serum potassium, buying time for other measures (insulin-dextrose, salbutamol) to shift potassium intracellularly.$d$, 1),
('60000000-0000-0000-0000-000000000014', $d$Definitive potassium removal (via calcium resonium, diuretics or dialysis) is still required after initial membrane stabilisation and transcellular shift.$d$, 2),

('60000000-0000-0000-0000-000000000015', $d$A markedly elevated CK with dark urine indicates rhabdomyolysis and myoglobinuria, not simple muscle strain.$d$, 1),
('60000000-0000-0000-0000-000000000015', $d$Prolonged immobility (as after a seizure, collapse or entrapment) is a recognised precipitant of rhabdomyolysis through sustained muscle compression.$d$, 2),

('60000000-0000-0000-0000-000000000016', $d$KDIGO stage 3 by urine output requires anuria for at least 12 hours, or urine output under 0.3 mL/kg/h for at least 24 hours.$d$, 1),
('60000000-0000-0000-0000-000000000016', $d$Urine output and creatinine criteria are applied independently, and the more severe stage from either pathway is used.$d$, 2),

('60000000-0000-0000-0000-000000000017', $d$A low urine sodium and FENa under 1% reflect an intact kidney appropriately conserving sodium in response to reduced perfusion.$d$, 1),
('60000000-0000-0000-0000-000000000017', $d$Prompt improvement in renal function after fluid resuscitation is a practical bedside confirmation of a prerenal, rather than intrinsic, cause.$d$, 2),

('60000000-0000-0000-0000-000000000018', $d$Bilateral hydronephrosis on ultrasound points to a lower urinary tract (bladder outflow) or bilateral upper tract obstruction as the cause of AKI.$d$, 1),
('60000000-0000-0000-0000-000000000018', $d$Catheterisation to relieve bladder outflow obstruction is the first step; nephrostomy is reserved for upper tract obstruction not relieved by bladder decompression.$d$, 2),

('60000000-0000-0000-0000-000000000019', $d$NSAIDs, ACE inhibitors/ARBs and diuretics are all recognised to worsen or perpetuate AKI and should be temporarily withheld ("sick day rules") until renal function recovers.$d$, 1),
('60000000-0000-0000-0000-000000000019', $d$These drugs can usually be safely restarted once creatinine has returned to baseline.$d$, 2),

('60000000-0000-0000-0000-000000000020', $d$Metformin accumulation during AKI carries a significant risk of life-threatening lactic acidosis, given its reliance on renal clearance.$d$, 1),
('60000000-0000-0000-0000-000000000020', $d$Metformin should be stopped during acute illness with significant renal impairment and only restarted once renal function has recovered.$d$, 2),

('60000000-0000-0000-0000-000000000021', $d$AKI stage 3, or AKI with complications (refractory hyperkalaemia, severe acidosis, fluid overload) unresponsive to initial treatment, are recognised indications for urgent nephrology referral.$d$, 1),
('60000000-0000-0000-0000-000000000021', $d$Mild, self-limiting or rapidly improving AKI generally does not require urgent specialist referral and can be managed by the admitting team.$d$, 2),

('60000000-0000-0000-0000-000000000022', $d$Peri-procedural IV isotonic fluids are the primary evidence-based measure to reduce contrast-induced nephropathy risk in patients with reduced eGFR.$d$, 1),
('60000000-0000-0000-0000-000000000022', $d$N-acetylcysteine is no longer routinely recommended, as trial evidence has not consistently demonstrated benefit.$d$, 2),

('60000000-0000-0000-0000-000000000023', $d$The "triple whammy" (NSAID + ACE inhibitor/ARB + diuretic) removes multiple renal autoregulatory mechanisms simultaneously, particularly during volume depletion.$d$, 1),
('60000000-0000-0000-0000-000000000023', $d$Patients on this combination should be counselled on "sick day rules" to temporarily stop these drugs during illness with vomiting, diarrhoea or reduced fluid intake.$d$, 2),

('60000000-0000-0000-0000-000000000024', $d$Reduced renal 1-alpha-hydroxylase activity in CKD impairs vitamin D activation, reducing intestinal calcium absorption.$d$, 1),
('60000000-0000-0000-0000-000000000024', $d$Phosphate retention in CKD both binds calcium and directly stimulates PTH secretion, compounding secondary hyperparathyroidism.$d$, 2),
('60000000-0000-0000-0000-000000000024', $d$Unchecked secondary hyperparathyroidism can progress to tertiary hyperparathyroidism, with autonomous PTH secretion and hypercalcaemia.$d$, 3),

('60000000-0000-0000-0000-000000000025', $d$Reduced erythropoietin production is the principal mechanism of anaemia in progressive CKD.$d$, 1),
('60000000-0000-0000-0000-000000000025', $d$Iron stores must be adequate before starting an erythropoiesis-stimulating agent, as ESAs are ineffective (and can be unsafe) in iron deficiency.$d$, 2),

('60000000-0000-0000-0000-000000000026', $d$Type 4 RTA results from hyporeninaemic hypoaldosteronism and is a recognised complication of diabetic nephropathy due to juxtaglomerular apparatus damage.$d$, 1),
('60000000-0000-0000-0000-000000000026', $d$Hyperkalaemia that is disproportionate to the degree of renal impairment should prompt consideration of type 4 RTA.$d$, 2),

('60000000-0000-0000-0000-000000000027', $d$Anti-PLA2R antibody positivity is a specific serological marker for primary membranous nephropathy.$d$, 1),
('60000000-0000-0000-0000-000000000027', $d$Secondary causes of membranous nephropathy include malignancy, hepatitis B, NSAIDs and lupus, and should be screened for even when anti-PLA2R is positive.$d$, 2),

('60000000-0000-0000-0000-000000000028', $d$HIV-associated nephropathy is a collapsing variant of FSGS caused by direct viral infection of renal epithelial cells.$d$, 1),
('60000000-0000-0000-0000-000000000028', $d$Large, echogenic kidneys on ultrasound despite renal impairment is a recognised feature that helps distinguish HIV-associated nephropathy from most other causes of CKD, which typically show small kidneys.$d$, 2),

('60000000-0000-0000-0000-000000000029', $d$Linear IgG deposition along the GBM on immunofluorescence is specific to anti-GBM disease, distinguishing it from the pauci-immune pattern of ANCA-associated vasculitis.$d$, 1),
('60000000-0000-0000-0000-000000000029', $d$Simultaneous pulmonary haemorrhage and glomerulonephritis defines a pulmonary-renal syndrome, seen in both anti-GBM disease and ANCA-associated vasculitis.$d$, 2),

('60000000-0000-0000-0000-000000000030', $d$Non-contrast CT KUB is highly sensitive for stones of all compositions, including radiolucent stones missed on plain X-ray.$d$, 1),
('60000000-0000-0000-0000-000000000030', $d$Calcium oxalate stones are the most common type of renal stone overall.$d$, 2),

('60000000-0000-0000-0000-000000000031', $d$Fever, rigors and loin tenderness indicate upper urinary tract (renal) involvement, distinguishing pyelonephritis from a simple lower UTI.$d$, 1),
('60000000-0000-0000-0000-000000000031', $d$Systemic upset (nausea, vomiting, malaise) is more typical of pyelonephritis than uncomplicated cystitis.$d$, 2),

('60000000-0000-0000-0000-000000000032', $d$Cefalexin achieves adequate renal tissue levels, unlike nitrofurantoin, which is unsuitable for upper urinary tract infection.$d$, 1),
('60000000-0000-0000-0000-000000000032', $d$Trimethoprim and fosfomycin are reserved for lower UTI or for use once culture sensitivities are known, not as empirical pyelonephritis therapy.$d$, 2),

('60000000-0000-0000-0000-000000000033', $d$Fever, rash and eosinophilia alongside sterile pyuria with white cell casts point to a drug hypersensitivity reaction (acute interstitial nephritis) rather than infection.$d$, 1),
('60000000-0000-0000-0000-000000000033', $d$NSAIDs, penicillins, other antibiotics and proton pump inhibitors are all recognised causes of drug-induced AIN.$d$, 2),
('60000000-0000-0000-0000-000000000033', $d$Management is to stop the causative drug; corticosteroids may be considered if renal function does not recover.$d$, 3),

('60000000-0000-0000-0000-000000000034', $d$Class IV (diffuse proliferative) lupus nephritis is the most aggressive histological class and carries the highest risk of progression to renal failure if untreated.$d$, 1),
('60000000-0000-0000-0000-000000000034', $d$Induction immunosuppression (corticosteroids plus cyclophosphamide or mycophenolate mofetil) aims to halt active inflammation, followed by a maintenance immunosuppression phase.$d$, 2),

('60000000-0000-0000-0000-000000000035', $d$ACE inhibitors/ARBs reduce intraglomerular pressure and proteinuria in diabetic nephropathy through a mechanism independent of their blood-pressure-lowering effect.$d$, 1),
('60000000-0000-0000-0000-000000000035', $d$Renoprotective therapy is started at the microalbuminuria stage, before progression to macroalbuminuria, when intervention is most effective.$d$, 2),

('60000000-0000-0000-0000-000000000036', $d$Bilaterally small kidneys on ultrasound are the classic finding supporting CKD over AKI, but ADPKD, diabetic nephropathy (early), amyloidosis and HIV-associated nephropathy are recognised exceptions where kidneys can remain normal-sized or enlarged despite chronic disease.$d$, 1),
('60000000-0000-0000-0000-000000000036', $d$Hypocalcaemia (from reduced renal vitamin D activation) is a biochemical clue favouring a chronic rather than acute process when the duration of renal impairment is uncertain.$d$, 2),
('60000000-0000-0000-0000-000000000036', $d$A family history of renal failure alongside bilateral renal cysts should raise suspicion of ADPKD as the underlying chronic diagnosis.$d$, 3),

('60000000-0000-0000-0000-000000000037', $d$NSAIDs impair afferent arteriolar vasodilation (via prostaglandin inhibition), while ACE inhibitors impair efferent arteriolar vasoconstriction; together they remove both mechanisms that normally preserve GFR during volume depletion.$d$, 1),
('60000000-0000-0000-0000-000000000037', $d$This combination (the "triple whammy") is a recognised precipitant of AKI, particularly during intercurrent illness with volume loss.$d$, 2),
('60000000-0000-0000-0000-000000000037', $d$All three drugs should be temporarily withheld during acute illness with vomiting or diarrhoea to prevent this cascade.$d$, 3),

('60000000-0000-0000-0000-000000000038', $d$Myoglobin released from crushed muscle is directly nephrotoxic to renal tubules and can precipitate as casts, causing acute tubular necrosis.$d$, 1),
('60000000-0000-0000-0000-000000000038', $d$Cell lysis releases large amounts of intracellular potassium, and this is compounded once AKI develops and renal excretion fails.$d$, 2),
('60000000-0000-0000-0000-000000000038', $d$Aggressive early IV fluid resuscitation aims to maintain renal perfusion and dilute nephrotoxic myoglobin to prevent this cascade.$d$, 3),

('60000000-0000-0000-0000-000000000039', $d$Reduced renal 1-alpha-hydroxylase activity in CKD impairs activation of vitamin D, reducing intestinal calcium absorption.$d$, 1),
('60000000-0000-0000-0000-000000000039', $d$Phosphate retention in CKD further suppresses calcium and directly stimulates PTH secretion.$d$, 2),
('60000000-0000-0000-0000-000000000039', $d$Chronic secondary hyperparathyroidism drives increased osteoclastic activity, producing renal osteodystrophy; if unchecked it can progress to autonomous tertiary hyperparathyroidism.$d$, 3),

('60000000-0000-0000-0000-000000000040', $d$Standard urine dipstick detects albumin, not free light chains, so a near-negative dipstick despite heavy proteinuria on formal testing is a clue to light-chain (Bence Jones) proteinuria.$d$, 1),
('60000000-0000-0000-0000-000000000040', $d$Hypercalcaemia in myeloma results from osteoclast-activating factors released by malignant plasma cells and independently worsens renal function via vasoconstriction and volume depletion.$d$, 2),
('60000000-0000-0000-0000-000000000040', $d$Cast (myeloma) nephropathy is the most common cause of severe AKI in myeloma; dehydration and nephrotoxins (including contrast and NSAIDs) should be avoided.$d$, 3),

('60000000-0000-0000-0000-000000000041', $d$Diabetic nephropathy typically progresses through glomerular hyperfiltration, microalbuminuria, then overt (macroalbuminuria/nephrotic-range) proteinuria with declining GFR.$d$, 1),
('60000000-0000-0000-0000-000000000041', $d$Diabetic retinopathy often co-exists with diabetic nephropathy, reflecting shared microvascular damage, and supports a diabetic aetiology for renal disease.$d$, 2),
('60000000-0000-0000-0000-000000000041', $d$Nephrotic-range proteinuria causes oedema through loss of plasma oncotic pressure, distinct from oedema driven by venous or right heart congestion.$d$, 3),

('60000000-0000-0000-0000-000000000042', $d$ACE inhibitors and mineralocorticoid receptor antagonists both reduce renal potassium excretion, and their combination is a recognised risk factor for hyperkalaemia, especially during intercurrent illness.$d$, 1),
('60000000-0000-0000-0000-000000000042', $d$Volume depletion from vomiting or diarrhoea causes prerenal AKI, which further impairs the kidneys' capacity to excrete potassium, compounding drug-related retention.$d$, 2),
('60000000-0000-0000-0000-000000000042', $d$"Sick day rules" advising temporary cessation of these drugs during acute illness with fluid loss are intended to prevent exactly this scenario.$d$, 3),

('60000000-0000-0000-0000-000000000043', $d$Tumour lysis syndrome classically produces the tetrad of hyperkalaemia, hyperphosphataemia, hypocalcaemia (secondary to phosphate binding) and hyperuricaemia.$d$, 1),
('60000000-0000-0000-0000-000000000043', $d$Uric acid and calcium phosphate crystals precipitating in the renal tubules cause obstructive AKI, distinct from a purely haemodynamic mechanism.$d$, 2),
('60000000-0000-0000-0000-000000000043', $d$Rasburicase and/or allopurinol, together with aggressive IV hydration, are used to prevent this in high-risk patients before or during chemotherapy.$d$, 3),

('60000000-0000-0000-0000-000000000044', $d$Shiga-toxin-producing E. coli (classically O157:H7) is the most common cause of childhood HUS, typically following a prodrome of bloody diarrhoea.$d$, 1),
('60000000-0000-0000-0000-000000000044', $d$The classic triad of HUS is microangiopathic haemolytic anaemia, thrombocytopenia and acute kidney injury.$d$, 2),
('60000000-0000-0000-0000-000000000044', $d$ADAMTS13 activity is typically normal in Shiga-toxin-associated HUS, and neurological involvement is less prominent than in TTP.$d$, 3),

('60000000-0000-0000-0000-000000000045', $d$TTP classically features a pentad of fever, microangiopathic haemolytic anaemia, thrombocytopenia, neurological signs and renal impairment, though not all five need be present.$d$, 1),
('60000000-0000-0000-0000-000000000045', $d$Severe ADAMTS13 deficiency (autoimmune or hereditary) distinguishes TTP from Shiga-toxin-associated HUS, where ADAMTS13 activity is normal.$d$, 2),
('60000000-0000-0000-0000-000000000045', $d$Neurological involvement is more prominent in TTP than in typical HUS, reflecting cerebral microvascular thrombosis.$d$, 3),

('60000000-0000-0000-0000-000000000046', $d$SIADH produces euvolaemic hyponatraemia with inappropriately concentrated urine and a urine sodium usually above 20-30 mmol/L.$d$, 1),
('60000000-0000-0000-0000-000000000046', $d$Small cell lung cancer is a classic cause of ectopic ADH secretion, alongside CNS pathology, pulmonary infection and certain drugs.$d$, 2),
('60000000-0000-0000-0000-000000000046', $d$Rapid correction of sodium is avoided in SIADH due to the risk of osmotic demyelination syndrome.$d$, 3),

('60000000-0000-0000-0000-000000000047', $d$Cranial diabetes insipidus results from deficient ADH secretion, most commonly following pituitary/hypothalamic surgery, trauma or infiltrative disease.$d$, 1),
('60000000-0000-0000-0000-000000000047', $d$Hypernatraemia with inappropriately dilute urine is the key biochemical signature of DI, in contrast to the concentrated urine of SIADH.$d$, 2),
('60000000-0000-0000-0000-000000000047', $d$Desmopressin is the treatment for cranial DI; a water deprivation test with subsequent desmopressin administration helps distinguish cranial from nephrogenic DI.$d$, 3),

('60000000-0000-0000-0000-000000000048', $d$cANCA with anti-PR3 specificity is strongly associated with granulomatosis with polyangiitis, in contrast to pANCA/anti-MPO, which is more typical of microscopic polyangiitis.$d$, 1),
('60000000-0000-0000-0000-000000000048', $d$"Pauci-immune" crescentic GN (minimal immunofluorescence staining) is the pathological hallmark of ANCA-associated vasculitis, distinguishing it from immune-complex-mediated glomerulonephritides.$d$, 2),
('60000000-0000-0000-0000-000000000048', $d$Upper respiratory tract involvement together with pulmonary and renal disease defines the classic pulmonary-renal presentation of GPA.$d$, 3),

('60000000-0000-0000-0000-000000000049', $d$The "AEIOU" mnemonic for emergency dialysis indications covers refractory Acidosis, refractory Electrolyte abnormalities (especially hyperkalaemia), certain Intoxications, refractory fluid Overload, and symptomatic Uraemia.$d$, 1),
('60000000-0000-0000-0000-000000000049', $d$This patient meets several of these criteria simultaneously, reinforcing the urgency of dialysis rather than further trials of the same failed medical measures.$d$, 2),

('60000000-0000-0000-0000-000000000050', $d$Acute T-cell-mediated rejection typically occurs days to weeks post-transplant and is diagnosed on biopsy by lymphocytic tubulointerstitial infiltration (tubulitis).$d$, 1),
('60000000-0000-0000-0000-000000000050', $d$A therapeutic (rather than toxic) tacrolimus level makes calcineurin inhibitor toxicity a less likely primary explanation, though biopsy is needed to distinguish rejection from other causes definitively.$d$, 2),
('60000000-0000-0000-0000-000000000050', $d$Hyperacute rejection (pre-formed antibodies, within hours) and chronic rejection (progressive dysfunction over months to years) are distinct in timing and mechanism from this acute cellular rejection episode.$d$, 3);
