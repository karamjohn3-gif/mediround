-- MRCP Part 1 -- Clinical sciences batch 1 (50 questions), the first batch
-- for this topic (0 questions previously). Clinical sciences is MRCP1's
-- basic-science topic, historically split into 7 sub-areas that are now
-- consolidated into a single topic in this app: cell/molecular/membrane
-- biology (7 questions), clinical anatomy (7), clinical biochemistry and
-- metabolism (7), clinical physiology (8), genetics (7), immunology (7),
-- and statistics/epidemiology/evidence-based medicine (7) -- 50 total.
-- Most questions are framed with a brief clinical correlate rather than
-- pure abstract recall, per the brief for this batch; several (Q4, Q19,
-- Q25, Q31, Q41, Q43, Q49) are deliberately built as multi-step chained
-- reasoning questions (advanced tier).
--
-- STATUS: status='published' -- per explicit instruction from the person
-- who commissioned this batch, these questions are inserted directly as
-- published (no draft-then-review step for this batch). This content has
-- NOT been individually reviewed by a clinician or MRCP-specific medical
-- educator; it has been checked by the writing model against standard
-- reference material (Kumar & Clark's Clinical Medicine, Guyton and Hall's
-- Textbook of Medical Physiology, standard immunology/genetics textbooks,
-- and standard MRCP1-level statistics/EBM teaching) to a solid standard,
-- but has not been checked by a human with relevant clinical expertise.
--
-- Format follows mrcp1-cardiology-batch2.sql exactly: dollar-quoting
-- conventions ($stem$/$q$/$t$ for stems and lead-ins containing apostrophes,
-- $r$/$o$ for rationales) for all free text, 5 options A-E per question
-- with exactly one correct answer, "Ruled out because..." wrong-answer
-- rationales tied to specifics in the stem, 2-3 discriminators per
-- question, and on conflict do nothing clauses. The correct-answer label
-- is deliberately varied across A-E (exactly 10 of each across the 50
-- questions) rather than clustered, per the brief for this batch.
--
-- Run after the topics migrations (0001-0004) and seed.sql, via the SQL
-- Editor.

insert into questions (id, exam, topic_id, status, difficulty, stem, lead_in, tags) values

-- ===== Cell / molecular / membrane biology (Q1-7) =====

-- 1. Cell cycle checkpoint -> p53 -> Li-Fraumeni syndrome
(
  '70000000-0000-0000-0000-000000000001', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'core',
  $stem$A 28-year-old woman is diagnosed with breast cancer. Her family history includes a sarcoma in her brother at age 22 and an adrenocortical carcinoma in her mother at age 35. Genetic testing reveals a germline mutation in a tumour suppressor gene that normally arrests the cell cycle at the G1/S checkpoint in response to DNA damage, allowing time for repair or triggering apoptosis if the damage is irreparable.$stem$,
  'Which gene is most likely mutated?',
  array['cell cycle checkpoint','p53','Li-Fraumeni syndrome']
),

-- 2. Apoptosis vs necrosis mechanism
(
  '70000000-0000-0000-0000-000000000002', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'foundation',
  $stem$A cell undergoing a form of cell death shows cell shrinkage, chromatin condensation, DNA fragmentation into regular oligonucleosomal fragments, and formation of membrane-bound cytoplasmic bodies that are cleared by phagocytes without eliciting an inflammatory response.$stem$,
  'Which process does this describe?',
  array['apoptosis','necrosis','cell death mechanisms']
),

-- 3. GPCR signal transduction - beta-1 receptor / cAMP
(
  '70000000-0000-0000-0000-000000000003', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'foundation',
  $stem$Noradrenaline binds to a cardiac cell-surface receptor coupled to a stimulatory G protein (Gs). This activates adenylate cyclase, raising intracellular cyclic AMP, which activates protein kinase A and ultimately increases the force and rate of cardiac contraction.$stem$,
  'Which second messenger system is being described?',
  array['GPCR signalling','cAMP','beta-1 adrenoceptor']
),

-- 4. Microtubule drug (vincristine) + CYP3A4 inhibitor interaction -> toxicity chain
(
  '70000000-0000-0000-0000-000000000004', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'advanced',
  $stem$A 55-year-old man being treated for non-Hodgkin lymphoma with a vinca alkaloid that binds tubulin dimers and blocks their polymerisation into microtubules (arresting cells in metaphase) develops a systemic fungal infection and is started on itraconazole, a potent inhibitor of the hepatic cytochrome P450 enzyme responsible for metabolising this chemotherapy drug. Ten days later he develops severe, progressive peripheral sensorimotor neuropathy with foot drop and paralytic ileus, well beyond what he experienced on previous cycles at the same chemotherapy dose.$stem$,
  'What is the most likely explanation for his worsened toxicity?',
  array['vincristine','CYP3A4 interaction','microtubule inhibitor','chain reasoning']
),

-- 5. Cell junctions - desmosomes and pemphigus vulgaris
(
  '70000000-0000-0000-0000-000000000005', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'core',
  $stem$A 52-year-old woman presents with flaccid skin blisters and oral erosions. Skin biopsy shows loss of cell-to-cell adhesion within the epidermis, with rounded, separated keratinocytes (acantholysis) just above the basal layer. Direct immunofluorescence shows IgG deposited between epidermal cells, targeting desmoglein, a component of a specific intercellular junction.$stem$,
  'Which cell junction type is targeted in this condition?',
  array['desmosome','pemphigus vulgaris','cell junctions']
),

-- 6. Mitochondrial disease - MELAS / maternal inheritance
(
  '70000000-0000-0000-0000-000000000006', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'advanced',
  $stem$A 19-year-old man presents with recurrent stroke-like episodes affecting different arterial territories inconsistent with any single vascular distribution, along with proximal muscle weakness, lactic acidosis, and seizures. Muscle biopsy shows ragged red fibres on Gomori trichrome staining. His mother and maternal aunt have milder features including sensorineural deafness and diabetes, but his father is entirely unaffected.$stem$,
  'What is the most likely underlying mechanism and inheritance pattern?',
  array['mitochondrial disease','MELAS','maternal inheritance']
),

-- 7. Resting membrane potential and Na/K-ATPase
(
  '70000000-0000-0000-0000-000000000007', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'foundation',
  $stem$A neuron at rest has a membrane potential of around -70 mV, maintained largely by a high resting permeability to potassium relative to sodium, and by an ATP-dependent pump that extrudes 3 sodium ions from the cell for every 2 potassium ions it imports, establishing the concentration gradients that the resting potential depends on.$stem$,
  'Which transporter is being described?',
  array['resting membrane potential','Na/K-ATPase','membrane physiology']
),

-- ===== Clinical anatomy (Q8-14) =====

-- 8. Erb palsy (upper brachial plexus, C5-C6)
(
  '70000000-0000-0000-0000-000000000008', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'core',
  $q$A newborn delivered after a difficult shoulder dystocia has an arm held in the "waiter's tip" position: adducted and internally rotated at the shoulder, with the elbow extended and the forearm pronated. The biceps reflex is absent on the affected side, but the grip reflex is intact.$q$,
  'Which nerve roots are most likely injured?',
  array['Erb palsy','brachial plexus','waiter''s tip position']
),

-- 9. Radial nerve palsy - wrist drop
(
  '70000000-0000-0000-0000-000000000009', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'core',
  $stem$A 34-year-old man wakes after an evening of heavy alcohol intake, having fallen asleep with his arm draped over the back of a chair. He now has weakness of wrist and finger extension, with the wrist falling into flexion, and reduced sensation over the dorsum of the first web space. Triceps strength is preserved, and there is no winging of the scapula.$stem$,
  'Which nerve has most likely been compressed, and at what level does the preserved triceps strength localise the lesion to?',
  array['radial nerve','wrist drop','Saturday night palsy']
),

-- 10. Median nerve palsy - carpal tunnel syndrome
(
  '70000000-0000-0000-0000-000000000010', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'foundation',
  $stem$A 50-year-old woman with hypothyroidism reports numbness and tingling in the thumb, index and middle fingers, worse at night, with weakness of thumb abduction and thenar wasting. Tapping over the flexor retinaculum reproduces her symptoms.$stem$,
  'Which nerve is most likely compressed, and at which site?',
  array['median nerve','carpal tunnel syndrome','thenar wasting']
),

-- 11. CN III palsy - posterior communicating artery aneurysm
(
  '70000000-0000-0000-0000-000000000011', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'advanced',
  $stem$A 58-year-old woman develops sudden severe headache followed by a fixed, dilated left pupil, ptosis, and an eye deviated "down and out". Pupillary involvement is present from the onset, alongside the ophthalmoplegia.$stem$,
  'What is the most likely underlying cause, and why does pupillary involvement occur early in this scenario?',
  array['CN III palsy','posterior communicating artery aneurysm','pupil-involving']
),

-- 12. Circle of Willis - MCA stroke territory
(
  '70000000-0000-0000-0000-000000000012', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'core',
  $stem$A 70-year-old right-handed man develops sudden right-sided weakness affecting the face and arm more than the leg, expressive dysphasia, and a right homonymous hemianopia. CT angiography shows occlusion of a vessel arising from the circle of Willis.$stem$,
  'Which artery is most likely occluded?',
  array['circle of Willis','MCA stroke','stroke territory']
),

-- 13. Recurrent laryngeal nerve injury - thyroidectomy
(
  '70000000-0000-0000-0000-000000000013', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'foundation',
  $stem$A 45-year-old woman develops a hoarse, breathy voice the day after a total thyroidectomy. Laryngoscopy shows the left vocal cord fixed in a paramedian position.$stem$,
  'Which nerve has most likely been damaged during surgery?',
  array['recurrent laryngeal nerve','thyroidectomy','vocal cord palsy']
),

-- 14. Inguinal canal - indirect inguinal hernia
(
  '70000000-0000-0000-0000-000000000014', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'advanced',
  $stem$A 60-year-old man has a groin swelling that reduces on lying down and reappears on standing and coughing. At surgery, the hernial sac is found to pass lateral to the inferior epigastric vessels, through the deep inguinal ring, along the inguinal canal, and can extend into the scrotum.$stem$,
  'Which type of inguinal hernia is this, and what anatomical relationship to the inferior epigastric vessels defines it?',
  array['indirect inguinal hernia','inferior epigastric vessels','inguinal canal']
),

-- ===== Clinical biochemistry and metabolism (Q15-21) =====

-- 15. Anion gap metabolic acidosis calculation
(
  '70000000-0000-0000-0000-000000000015', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'core',
  $stem$A 24-year-old man with type 1 diabetes presents unwell. Venous bloods: sodium 138 mmol/L, potassium 5.2 mmol/L, chloride 96 mmol/L, bicarbonate 8 mmol/L.$stem$,
  'What is his anion gap (using Na - (Cl + HCO3)), and what does this indicate?',
  array['anion gap','diabetic ketoacidosis','acid-base']
),

-- 16. Statin mechanism - HMG-CoA reductase
(
  '70000000-0000-0000-0000-000000000016', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'foundation',
  $stem$A 58-year-old man with hypercholesterolaemia is started on atorvastatin, which competitively inhibits a rate-limiting hepatic enzyme in the cholesterol biosynthesis pathway, upregulating LDL receptor expression on hepatocytes and lowering circulating LDL cholesterol.$stem$,
  'Which enzyme is inhibited?',
  array['statin mechanism','HMG-CoA reductase','cholesterol synthesis']
),

-- 17. Phenylketonuria - enzyme defect
(
  '70000000-0000-0000-0000-000000000017', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'core',
  $stem$A neonate identified through routine heel-prick screening is found to have a markedly elevated plasma phenylalanine level. If untreated, accumulation of phenylalanine and its metabolites would be expected to cause severe intellectual disability, seizures, and a musty odour to the urine and sweat.$stem$,
  'Which enzyme is most likely deficient?',
  array['phenylketonuria','phenylalanine hydroxylase','inborn error of metabolism']
),

-- 18. Urea cycle defect - OTC deficiency / hyperammonaemia
(
  '70000000-0000-0000-0000-000000000018', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'advanced',
  $stem$A male neonate, well at birth, becomes lethargic and poorly feeding at 48 hours of age, then develops seizures and a reduced conscious level. Plasma ammonia is markedly elevated, with a respiratory alkalosis (ammonia directly stimulates the respiratory centre) and normal plasma glucose and lactate. A urea cycle enzyme deficiency is suspected, preventing incorporation of ammonia into urea for excretion.$stem$,
  'Which is the most common urea cycle enzyme deficiency, and what is its inheritance pattern?',
  array['urea cycle defect','ornithine transcarbamylase deficiency','hyperammonaemia']
),

-- 19. Enzyme kinetics - competitive inhibition (allopurinol + azathioprine chain)
(
  '70000000-0000-0000-0000-000000000019', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'advanced',
  $stem$A 60-year-old renal transplant recipient established on azathioprine for immunosuppression develops an acute gout flare and is started on allopurinol, which competitively inhibits the same enzyme that normally breaks down the active metabolite of azathioprine (6-mercaptopurine). Two weeks later he is found to have severe pancytopenia.$stem$,
  'Which enzyme is being competitively inhibited, and what is the mechanism linking this to his pancytopenia?',
  array['enzyme kinetics','competitive inhibition','xanthine oxidase','chain reasoning']
),

-- 20. Acute intermittent porphyria - enzyme defect and precipitants
(
  '70000000-0000-0000-0000-000000000020', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'foundation',
  $stem$A 30-year-old woman develops severe abdominal pain, vomiting, constipation, and confusion shortly after starting a new antibiotic. Urine passed during the episode darkens further on standing in light. She has had similar episodes triggered by fasting and alcohol in the past.$stem$,
  'Which enzyme is deficient in this condition?',
  array['acute intermittent porphyria','porphobilinogen deaminase','enzyme deficiency']
),

-- 21. Purine metabolism - Lesch-Nyhan syndrome
(
  '70000000-0000-0000-0000-000000000021', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'advanced',
  $stem$A 2-year-old boy presents with developmental delay, dystonia, and compulsive self-injurious biting of his lips and fingers. Blood tests show markedly elevated uric acid. He is subsequently found to have a deficiency of an enzyme in the purine salvage pathway, causing accumulation of purine precursors that are instead degraded to uric acid rather than being recycled.$stem$,
  'Which enzyme is deficient, and what is the inheritance pattern?',
  array['Lesch-Nyhan syndrome','HGPRT deficiency','purine salvage pathway']
),

-- ===== Clinical physiology (Q22-29) =====

-- 22. Cardiac cycle - isovolumetric contraction
(
  '70000000-0000-0000-0000-000000000022', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'core',
  $stem$During the cardiac cycle, a phase occurs in which both the mitral and aortic valves are closed, left ventricular volume remains constant, and intraventricular pressure rises steeply as the ventricle generates tension prior to the aortic valve opening.$stem$,
  'Which phase of the cardiac cycle is being described?',
  array['cardiac cycle','isovolumetric contraction','pressure-volume loop']
),

-- 23. Oxygen-haemoglobin dissociation curve - Bohr effect
(
  '70000000-0000-0000-0000-000000000023', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'foundation',
  $stem$During intense exercise, a patient's tissues become more acidotic, hypercapnic, and warmer than at rest. Haemoglobin releases oxygen to the tissues more readily under these conditions for a given partial pressure of oxygen.$stem$,
  'Which shift in the oxygen-haemoglobin dissociation curve does this describe, and what is this phenomenon called?',
  array['oxygen dissociation curve','Bohr effect','rightward shift']
),

-- 24. Renal countercurrent multiplication
(
  '70000000-0000-0000-0000-000000000024', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'advanced',
  $stem$A patient is given desmopressin. In the kidney, the loop of Henle actively transports sodium and chloride out of the thick ascending limb (which is impermeable to water), progressively increasing the osmolarity of the medullary interstitium from cortex to papilla. This gradient allows water to be reabsorbed from the collecting duct only when specific channels are inserted into its luminal membrane under hormonal control.$stem$,
  'Which hormone controls this channel insertion in the collecting duct, and what mechanism creates the medullary osmotic gradient it depends on?',
  array['countercurrent multiplication','ADH','loop of Henle']
),

-- 25. HPA axis suppression -> adrenal crisis on steroid withdrawal
(
  '70000000-0000-0000-0000-000000000025', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'advanced',
  $stem$A patient on long-term high-dose oral prednisolone has their dose abruptly stopped before a planned surgery. Chronic exogenous glucocorticoid exposure had suppressed hypothalamic CRH and pituitary ACTH release, leading to adrenal cortical atrophy. Following abrupt cessation, the adrenal glands cannot acutely increase endogenous cortisol production to meet the physiological demands of surgical stress.$stem$,
  'What is the mechanism underlying this risk, and what is the resulting clinical emergency called?',
  array['HPA axis','negative feedback','adrenal crisis']
),

-- 26. Autonomic receptors - beta-2 agonist effects
(
  '70000000-0000-0000-0000-000000000026', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'foundation',
  $stem$Salbutamol is given to a patient with an acute asthma exacerbation. It selectively stimulates a specific adrenergic receptor subtype on bronchial smooth muscle, causing smooth muscle relaxation and bronchodilation, but at higher doses also causes tremor and tachycardia through action on the same receptor subtype in skeletal muscle and the heart.$stem$,
  'Which receptor subtype is being targeted?',
  array['beta-2 adrenoceptor','autonomic pharmacology','salbutamol']
),

-- 27. Baroreceptor reflex
(
  '70000000-0000-0000-0000-000000000027', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'core',
  $stem$A healthy volunteer stands up suddenly from lying down. Stretch receptors in the carotid sinus and aortic arch sense a transient fall in arterial pressure, resulting in reduced afferent firing to the medullary cardiovascular centre, which produces reflex tachycardia and peripheral vasoconstriction to restore blood pressure within seconds.$stem$,
  'Which reflex arc is being described?',
  array['baroreceptor reflex','orthostatic response','autonomic physiology']
),

-- 28. Skeletal muscle excitation-contraction coupling - malignant hyperthermia
(
  '70000000-0000-0000-0000-000000000028', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'advanced',
  $stem$A patient undergoes general anaesthesia with a volatile agent and suxamethonium, and develops rigidity, hyperthermia, and a markedly raised creatine kinase. This is caused by a mutation in the ryanodine receptor, which normally releases calcium from the sarcoplasmic reticulum in response to depolarisation of the T-tubule, triggering calcium binding to troponin C and cross-bridge cycling between actin and myosin.$stem$,
  'What is the underlying condition, and which step in excitation-contraction coupling is disrupted?',
  array['malignant hyperthermia','ryanodine receptor','excitation-contraction coupling']
),

-- 29. Starling forces and oedema
(
  '70000000-0000-0000-0000-000000000029', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'core',
  $stem$A patient with nephrotic syndrome and a serum albumin of 15 g/L develops widespread peripheral oedema. Capillary hydrostatic pressure is not significantly elevated.$stem$,
  'Which change in Starling forces best explains the oedema in this patient?',
  array['Starling forces','oedema','hypoalbuminaemia']
),

-- ===== Genetics (Q30-36) =====

-- 30. Autosomal dominant pedigree - Huntington disease
(
  '70000000-0000-0000-0000-000000000030', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'foundation',
  $stem$A pedigree shows an inherited neurodegenerative condition affecting members of every generation, with both sexes equally affected, and appearing to pass directly from an affected parent to roughly half of their offspring, without skipping generations.$stem$,
  'Which inheritance pattern does this describe, and which condition is a classic example?',
  array['autosomal dominant inheritance','Huntington disease','pedigree analysis']
),

-- 31. Genetic anticipation - trinucleotide repeat expansion
(
  '70000000-0000-0000-0000-000000000031', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'advanced',
  $stem$In a family affected by myotonic dystrophy, the grandfather developed mild cataracts and muscle stiffness in his sixties, his daughter developed clinically apparent myotonia and weakness in her thirties, and her son presented with severe congenital hypotonia in infancy. Molecular testing shows progressively larger trinucleotide repeat expansions in successive generations.$stem$,
  'What is this phenomenon called, and what is its molecular basis?',
  array['genetic anticipation','trinucleotide repeat expansion','myotonic dystrophy']
),

-- 32. Genomic imprinting - Prader-Willi vs Angelman syndrome
(
  '70000000-0000-0000-0000-000000000032', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'advanced',
  $stem$Two children each have a deletion of the same region of chromosome 15q11-13. Child A, in whom the deletion occurred on the paternally inherited chromosome, has hyperphagia, obesity, hypotonia and mild intellectual disability. Child B, in whom the deletion occurred on the maternally inherited chromosome, has severe intellectual disability, ataxia, seizures and inappropriate laughter.$stem$,
  $q$What is the mechanism explaining why the same deletion produces two different phenotypes depending on parental origin, and what is Child B's diagnosis?$q$,
  array['genomic imprinting','Prader-Willi syndrome','Angelman syndrome']
),

-- 33. Chromosomal disorder - Turner syndrome
(
  '70000000-0000-0000-0000-000000000033', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'foundation',
  $stem$A 15-year-old girl presents with short stature and primary amenorrhoea. Examination reveals a webbed neck, widely spaced nipples, and a wide carrying angle at the elbows. Karyotype shows a 45,X pattern.$stem$,
  'What is the diagnosis?',
  array['Turner syndrome','45X karyotype','chromosomal disorder']
),

-- 34. Recurrence risk calculation - autosomal recessive counselling
(
  '70000000-0000-0000-0000-000000000034', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'core',
  $stem$A couple, both unaffected, have already had one child with cystic fibrosis, an autosomal recessive condition. They are expecting another child and seek genetic counselling.$stem$,
  'What is the probability that this next child will also be affected by cystic fibrosis?',
  array['recurrence risk','autosomal recessive inheritance','genetic counselling']
),

-- 35. X-linked recessive pedigree - Duchenne muscular dystrophy
(
  '70000000-0000-0000-0000-000000000035', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'foundation',
  $stem$A pedigree shows a severe muscle-wasting condition affecting only males across several generations, transmitted through unaffected or mildly affected carrier females, with no instance of male-to-male transmission.$stem$,
  'Which inheritance pattern does this describe, and which condition is a classic example?',
  array['X-linked recessive inheritance','Duchenne muscular dystrophy','pedigree analysis']
),

-- 36. Penetrance vs expressivity
(
  '70000000-0000-0000-0000-000000000036', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'core',
  $stem$In a family with neurofibromatosis type 1, all tested relatives carry the pathogenic NF1 mutation. One carrier has only a few cafe-au-lait macules and is otherwise entirely well; another carrier has numerous cutaneous neurofibromas, an optic glioma, and skeletal deformity. A third obligate carrier (confirmed by having an affected parent and an affected child) has no clinically detectable features at all on examination.$stem$,
  'Which two distinct genetic concepts are illustrated by, respectively, the variation in severity between the second carrier and the first, and the complete absence of features in the third carrier?',
  array['penetrance','expressivity','NF1']
),

-- ===== Immunology (Q37-43) =====

-- 37. Type I hypersensitivity - anaphylaxis
(
  '70000000-0000-0000-0000-000000000037', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'foundation',
  $stem$A 24-year-old woman develops facial swelling, wheeze, and hypotension within minutes of eating peanuts. This is mediated by pre-formed IgE bound to mast cells and basophils, which cross-links on re-exposure to the allergen and triggers rapid degranulation with release of histamine and other mediators.$stem$,
  'Which type of hypersensitivity reaction does this describe?',
  array['type I hypersensitivity','anaphylaxis','IgE-mediated']
),

-- 38. Type II hypersensitivity - Goodpasture disease
(
  '70000000-0000-0000-0000-000000000038', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'core',
  $stem$A 45-year-old man presents with haemoptysis and rapidly progressive glomerulonephritis. Renal biopsy shows linear IgG deposition along the glomerular basement membrane, with circulating antibodies directed against type IV collagen in the basement membrane itself.$stem$,
  'Which type of hypersensitivity reaction underlies this condition?',
  array['type II hypersensitivity','Goodpasture disease','anti-GBM antibody']
),

-- 39. Type III hypersensitivity - serum sickness
(
  '70000000-0000-0000-0000-000000000039', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'core',
  $stem$A patient develops fever, urticarial rash, arthralgia, and glomerulonephritis one to two weeks after receiving a foreign antiserum. Immune complexes of antigen and antibody are deposited in vessel walls and glomeruli, activating complement and attracting neutrophils that cause local tissue damage.$stem$,
  'Which type of hypersensitivity reaction does this describe?',
  array['type III hypersensitivity','immune complex deposition','serum sickness']
),

-- 40. Type IV hypersensitivity - allergic contact dermatitis
(
  '70000000-0000-0000-0000-000000000040', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'core',
  $stem$A 40-year-old woman develops an itchy, eczematous rash confined to the skin under a pair of nickel earrings, appearing 2 days after wearing them and settling over the following week once they are removed. Patch testing later reproduces the same delayed reaction. No antibody is required for this reaction; it is instead mediated by sensitised T lymphocytes recruiting macrophages to the site over 48-72 hours.$stem$,
  'Which type of hypersensitivity reaction does this describe?',
  array['type IV hypersensitivity','contact dermatitis','T-cell mediated']
),

-- 41. Complement deficiency - C1 esterase inhibitor / hereditary angioedema
(
  '70000000-0000-0000-0000-000000000041', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'advanced',
  $stem$A 22-year-old woman has recurrent episodes of non-itchy, non-urticarial swelling of the face, lips and limbs, and once had life-threatening laryngeal swelling. Episodes are not associated with any identifiable allergen, do not respond to antihistamines or adrenaline, and her father had similar episodes. During an acute episode, complement studies show a low C4 level with a normal C3.$stem$,
  'Which underlying deficiency is most likely responsible, and by what mechanism does it cause angioedema without urticaria?',
  array['hereditary angioedema','C1 esterase inhibitor deficiency','complement deficiency']
),

-- 42. Primary immunodeficiency - Bruton X-linked agammaglobulinaemia
(
  '70000000-0000-0000-0000-000000000042', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'core',
  $stem$A 7-month-old boy has had three episodes of otitis media and one episode of pneumococcal pneumonia since he was 5 months old, having been well before then. Immunoglobulin levels show markedly low IgG, IgA and IgM. Flow cytometry shows an absence of circulating B lymphocytes, with normal T lymphocyte numbers. A mutation in a B-cell tyrosine kinase gene on the X chromosome is identified.$stem$,
  'What is the diagnosis, and why did symptoms only begin around 5-6 months of age?',
  array['Brutons X-linked agammaglobulinaemia','primary immunodeficiency','B cell defect']
),

-- 43. Transplant rejection - hyperacute rejection
(
  '70000000-0000-0000-0000-000000000043', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'advanced',
  $stem$A patient receives a kidney transplant. Within minutes of the vascular anastomosis being completed and blood flow restored, the graft becomes mottled and cyanotic, and produces no urine. Histology shows widespread thrombosis within the graft's small vessels.$stem$,
  'What is the mechanism responsible for this immediate graft failure?',
  array['hyperacute rejection','preformed antibodies','transplant immunology']
),

-- ===== Statistics, epidemiology and evidence-based medicine (Q44-50) =====

-- 44. Sensitivity/specificity/PPV/NPV calculation from a 2x2 table
(
  '70000000-0000-0000-0000-000000000044', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'core',
  $stem$A new screening test for a disease is evaluated against a gold-standard diagnosis in 1000 patients. Of the 100 patients who truly have the disease, 90 test positive. Of the 900 patients who do not have the disease, 810 test negative.$stem$,
  'What is the sensitivity of this test?',
  array['sensitivity','specificity','2x2 table']
),

-- 45. Likelihood ratio interpretation
(
  '70000000-0000-0000-0000-000000000045', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'foundation',
  $stem$A diagnostic test for a condition has a positive likelihood ratio (LR+) of 15.$stem$,
  'What does this value indicate about the test?',
  array['likelihood ratio','diagnostic test interpretation']
),

-- 46. Number needed to treat calculation
(
  '70000000-0000-0000-0000-000000000046', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'core',
  $stem$A randomised controlled trial finds that over 5 years, 20% of patients on placebo have a stroke, compared with 15% of patients on a new antihypertensive drug.$stem$,
  'What is the number needed to treat (NNT) with this drug to prevent one stroke over 5 years?',
  array['number needed to treat','absolute risk reduction','NNT calculation']
),

-- 47. Relative risk vs odds ratio - case-control study
(
  '70000000-0000-0000-0000-000000000047', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'core',
  $stem$Researchers wish to investigate a possible association between a rare occupational exposure and a rare form of cancer. They recruit patients already diagnosed with the cancer along with matched controls without it, and retrospectively determine each participant's prior exposure status.$stem$,
  'Which measure of association is appropriate for this study design, and why can relative risk not be calculated directly?',
  array['odds ratio','relative risk','case-control study']
),

-- 48. Confidence interval interpretation
(
  '70000000-0000-0000-0000-000000000048', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'foundation',
  $stem$A trial reports that a new drug reduces the relative risk of a cardiovascular outcome, with a relative risk of 0.85 and a 95% confidence interval of 0.70 to 1.05, compared with placebo.$stem$,
  'What can be concluded from this result?',
  array['confidence interval','statistical significance','relative risk']
),

-- 49. Differential loss to follow-up -> attrition bias -> distrust of effect size
(
  '70000000-0000-0000-0000-000000000049', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'advanced',
  $stem$A cohort study compares a new drug against standard care over 2 years. In the new drug arm, a substantially higher proportion of participants withdraw before the study ends, mostly because of side effects or perceived lack of benefit, and are excluded from the final analysis. The control arm has near-complete follow-up. The study reports a large, statistically significant benefit for the new drug.$stem$,
  'What type of bias does this design flaw introduce, and why should the reported effect size be treated with caution?',
  array['attrition bias','loss to follow-up','selection bias','chain reasoning']
),

-- 50. Incidence vs prevalence calculation
(
  '70000000-0000-0000-0000-000000000050', 'mrcp1', '30000000-0000-0000-0000-000000000017',
  'published', 'core',
  $stem$In a stable population of 50,000 people, 2,000 people currently have a chronic disease. Over the following year, 400 new cases of the disease are diagnosed among the 48,000 people who did not previously have it.$stem$,
  'What is the incidence rate of the disease over this year, and how does this differ conceptually from its prevalence?',
  array['incidence','prevalence','epidemiology']
)

on conflict (id) do nothing;

-- ---------------------------------------------------------------------------
-- Options
-- ---------------------------------------------------------------------------

insert into question_options (question_id, label, option_text, is_correct, rationale, sort_order) values

-- Q1 Cell cycle checkpoint / p53 / Li-Fraumeni
('70000000-0000-0000-0000-000000000001', 'A', 'RB1', false,
 $r$Ruled out because RB1 mutations cause retinoblastoma (and osteosarcoma), not the multi-cancer pattern of sarcoma, early breast cancer and adrenocortical carcinoma described here.$r$, 1),
('70000000-0000-0000-0000-000000000001', 'B', 'BRCA1', false,
 $r$Ruled out because BRCA1 mutations cause hereditary breast/ovarian cancer via impaired DNA repair, but do not typically produce the childhood sarcoma and adrenocortical carcinoma seen in this family, nor act primarily as a G1/S checkpoint arrest gene.$r$, 2),
('70000000-0000-0000-0000-000000000001', 'C', 'MLH1', false,
 $r$Ruled out because MLH1 is a mismatch repair gene causing Lynch syndrome (colorectal and endometrial cancer with microsatellite instability), not this checkpoint-arrest mechanism or cancer pattern.$r$, 3),
('70000000-0000-0000-0000-000000000001', 'D', 'TP53', true,
 $r$Correct. TP53 encodes p53, which arrests the cell cycle at the G1/S checkpoint after DNA damage to allow repair or trigger apoptosis. Germline TP53 mutations cause Li-Fraumeni syndrome, characterised by early-onset sarcomas, breast cancer and adrenocortical carcinoma across generations, exactly as described.$r$, 4),
('70000000-0000-0000-0000-000000000001', 'E', 'APC', false,
 $r$Ruled out because APC mutations cause familial adenomatous polyposis via unchecked Wnt signalling, leading to colorectal polyps and cancer, not the sarcoma/breast/adrenocortical pattern here.$r$, 5),

-- Q2 Apoptosis vs necrosis
('70000000-0000-0000-0000-000000000002', 'A', 'Coagulative necrosis', false,
 $r$Ruled out because necrosis involves cell swelling and membrane rupture with release of cellular contents provoking inflammation, the opposite of the organised, non-inflammatory fragmentation described here.$r$, 1),
('70000000-0000-0000-0000-000000000002', 'B', 'Apoptosis', true,
 $r$Correct. Apoptosis is a regulated, energy-dependent form of cell death characterised by cell shrinkage, chromatin condensation, oligonucleosomal DNA fragmentation, and formation of membrane-bound apoptotic bodies that are phagocytosed without triggering inflammation.$r$, 2),
('70000000-0000-0000-0000-000000000002', 'C', 'Pyroptosis', false,
 $r$Ruled out because pyroptosis is a caspase-1-dependent, pro-inflammatory form of programmed cell death involving membrane rupture, unlike the intact membrane-bound bodies and absence of inflammation described here.$r$, 3),
('70000000-0000-0000-0000-000000000002', 'D', 'Liquefactive necrosis', false,
 $r$Ruled out because liquefactive necrosis (as seen in cerebral infarction or abscess) causes tissue to dissolve into a liquid mass, not the formation of discrete membrane-bound apoptotic bodies described here.$r$, 4),
('70000000-0000-0000-0000-000000000002', 'E', 'Caseous necrosis', false,
 $r$Ruled out because caseous necrosis (classically in tuberculosis) produces amorphous, cheese-like acellular debris, not the orderly fragmentation and clearance described here.$r$, 5),

-- Q3 GPCR cAMP beta-1
('70000000-0000-0000-0000-000000000003', 'A', 'Gs-protein-coupled receptor activating adenylate cyclase and raising cAMP', true,
 $r$Correct. Beta-1 adrenoceptors couple to Gs proteins, activating adenylate cyclase to raise intracellular cAMP, which activates protein kinase A and increases cardiac contractility and rate, exactly as described.$r$, 1),
('70000000-0000-0000-0000-000000000003', 'B', 'Gq-protein-coupled receptor activating phospholipase C and the IP3/DAG pathway', false,
 $r$Ruled out because Gq-coupled receptors signal via IP3/DAG and intracellular calcium release, not the cAMP/protein kinase A pathway explicitly described in the stem.$r$, 2),
('70000000-0000-0000-0000-000000000003', 'C', 'Gi-protein-coupled receptor inhibiting adenylate cyclase', false,
 $r$Ruled out because Gi-coupled receptors reduce (not raise) cAMP by inhibiting adenylate cyclase, the opposite of the rise in cAMP described here.$r$, 3),
('70000000-0000-0000-0000-000000000003', 'D', 'Receptor tyrosine kinase', false,
 $r$Ruled out because receptor tyrosine kinases (e.g. the insulin receptor) signal through direct intrinsic enzymatic activity and downstream kinase cascades, not via a G protein/adenylate cyclase/cAMP mechanism.$r$, 4),
('70000000-0000-0000-0000-000000000003', 'E', 'Ligand-gated ion channel', false,
 $r$Ruled out because ligand-gated ion channels open an integral pore directly on ligand binding, producing rapid electrical effects without any second messenger cascade, unlike the cAMP-mediated mechanism described.$r$, 5),

-- Q4 Vincristine + CYP3A4 interaction chain
('70000000-0000-0000-0000-000000000004', 'A', 'The neuropathy is unrelated to the itraconazole and reflects a fixed, dose-independent drug toxicity', false,
 $r$Ruled out because vincristine neurotoxicity is dose (and plasma level) dependent, and the clear temporal link to starting itraconazole points to a drug interaction rather than a fixed, unrelated toxicity.$r$, 1),
('70000000-0000-0000-0000-000000000004', 'B', 'Itraconazole enhances the antitumour effect of vincristine without affecting its toxicity profile', false,
 $r$Ruled out because inhibiting the enzyme that clears vincristine raises its plasma level, increasing toxicity risk, not simply enhancing efficacy in isolation.$r$, 2),
('70000000-0000-0000-0000-000000000004', 'C', 'The neuropathy reflects direct infiltration of peripheral nerves by progressive lymphoma', false,
 $r$Ruled out because this does not explain the temporal relationship to starting itraconazole or the accompanying paralytic ileus, both of which point to worsened vincristine toxicity rather than disease progression.$r$, 3),
('70000000-0000-0000-0000-000000000004', 'D', 'Itraconazole induces hepatic CYP3A4, lowering vincristine levels and unmasking breakthrough tumour-related neuropathy', false,
 $r$Ruled out because itraconazole is a potent CYP3A4 inhibitor, not an inducer; inhibition raises (not lowers) vincristine levels, which is the opposite of what this option describes.$r$, 4),
('70000000-0000-0000-0000-000000000004', 'E', 'Itraconazole inhibits hepatic CYP3A4-mediated metabolism of vincristine, raising its plasma concentration and increasing dose-dependent neurotoxicity', true,
 $r$Correct. Vincristine is metabolised by hepatic CYP3A4. Itraconazole is a potent CYP3A4 inhibitor, so co-administration raises vincristine plasma levels, worsening its characteristic dose-related peripheral neuropathy and autonomic effects such as paralytic ileus.$r$, 5),

-- Q5 Desmosome / pemphigus vulgaris
('70000000-0000-0000-0000-000000000005', 'A', 'Tight junction', false,
 $r$Ruled out because tight junctions seal the paracellular space between epithelial cells to control permeability; they are not the desmoglein-containing adhesion structure targeted in pemphigus vulgaris.$r$, 1),
('70000000-0000-0000-0000-000000000005', 'B', 'Gap junction', false,
 $r$Ruled out because gap junctions allow direct cytoplasmic/electrical communication between cells rather than providing mechanical adhesion, and are not the target of the anti-desmoglein antibodies described.$r$, 2),
('70000000-0000-0000-0000-000000000005', 'C', 'Desmosome', true,
 $r$Correct. Desmosomes use desmoglein (a cadherin) to anchor intermediate filaments between adjacent keratinocytes. In pemphigus vulgaris, IgG autoantibodies against desmoglein disrupt this adhesion, producing intraepidermal acantholysis and flaccid blisters.$r$, 3),
('70000000-0000-0000-0000-000000000005', 'D', 'Hemidesmosome', false,
 $r$Ruled out because hemidesmosomes anchor basal keratinocytes to the underlying basement membrane and are the target in bullous pemphigoid, which causes tense subepidermal blisters, not the flaccid intraepidermal blisters with acantholysis described here.$r$, 4),
('70000000-0000-0000-0000-000000000005', 'E', 'Adherens junction', false,
 $r$Ruled out because although adherens junctions also use cadherins for adhesion, the specific antigen (desmoglein) and the "chicken-wire" intercellular immunofluorescence pattern described are characteristic of desmosomal, not adherens junction, targeting.$r$, 5),

-- Q6 Mitochondrial disease MELAS
('70000000-0000-0000-0000-000000000006', 'A', 'Autosomal dominant inheritance from an unaffected father who is a non-penetrant carrier', false,
 $r$Ruled out because autosomal dominant inheritance would be expected to transmit through either parent, whereas here the disease strictly follows the maternal line and the father is entirely unaffected and non-transmitting, not merely non-penetrant.$r$, 1),
('70000000-0000-0000-0000-000000000006', 'B', 'Mitochondrial (maternal) inheritance due to a mutation in mitochondrial DNA', true,
 $r$Correct. Mitochondria (and mitochondrial DNA) are inherited exclusively from the mother. MELAS, caused by mitochondrial DNA mutations, therefore affects the offspring of an affected mother of either sex, but never the offspring of an affected father, exactly the pattern described.$r$, 2),
('70000000-0000-0000-0000-000000000006', 'C', 'X-linked recessive inheritance', false,
 $r$Ruled out because X-linked recessive conditions typically affect males far more severely than female carriers, whereas here an affected mother and maternal aunt (both female) show clear disease features, a pattern more specific to mitochondrial inheritance.$r$, 3),
('70000000-0000-0000-0000-000000000006', 'D', 'Autosomal recessive inheritance from two carrier parents', false,
 $r$Ruled out because autosomal recessive disease requires both parents to be carriers and typically appears sporadically within a sibship rather than following a strict maternal lineage across generations as described.$r$, 4),
('70000000-0000-0000-0000-000000000006', 'E', 'Genomic imprinting with paternal-origin silencing', false,
 $r$Ruled out because genomic imprinting affects specific autosomal loci depending on parental origin, but does not produce the strict maternal-only, either-sex-affected transmission pattern seen with mitochondrial DNA disease.$r$, 5),

-- Q7 Resting membrane potential / Na-K ATPase
('70000000-0000-0000-0000-000000000007', 'A', 'Voltage-gated sodium channel', false,
 $r$Ruled out because voltage-gated sodium channels mediate the rapid depolarisation phase of the action potential, not the ATP-dependent, 3:2 stoichiometry ion exchange described here.$r$, 1),
('70000000-0000-0000-0000-000000000007', 'B', 'Voltage-gated potassium channel', false,
 $r$Ruled out because voltage-gated potassium channels contribute to action potential repolarisation, not to the active, ATP-hydrolysing pump maintaining resting ion gradients described.$r$, 2),
('70000000-0000-0000-0000-000000000007', 'C', 'Na+/Ca2+ exchanger', false,
 $r$Ruled out because the Na+/Ca2+ exchanger is a secondary active transporter that uses the sodium gradient to extrude calcium; it does not itself hydrolyse ATP or generate the 3:2 sodium/potassium exchange described.$r$, 3),
('70000000-0000-0000-0000-000000000007', 'D', 'Na+/K+-ATPase', true,
 $r$Correct. The Na+/K+-ATPase hydrolyses ATP to pump 3 sodium ions out and 2 potassium ions into the cell, establishing the concentration gradients that, together with high resting potassium permeability, underlie the resting membrane potential.$r$, 4),
('70000000-0000-0000-0000-000000000007', 'E', 'Cl-/HCO3- exchanger', false,
 $r$Ruled out because this exchanger is involved in chloride and bicarbonate (acid-base) handling, not in generating or maintaining the resting membrane potential as described.$r$, 5),

-- Q8 Erb palsy
('70000000-0000-0000-0000-000000000008', 'A', 'C5-C6 (upper trunk of the brachial plexus)', true,
 $r$Correct. Excessive stretching of the head away from the shoulder during a difficult delivery classically injures the upper trunk (C5-C6) roots, producing loss of shoulder abduction/external rotation and elbow flexion (biceps), giving the adducted, internally rotated, extended "waiter''s tip" posture with an absent biceps reflex but preserved hand (grip) function.$r$, 1),
('70000000-0000-0000-0000-000000000008', 'B', 'C8-T1 (lower trunk of the brachial plexus)', false,
 $r$Ruled out because a lower trunk (C8-T1) injury, as in Klumpke palsy, causes intrinsic hand weakness and a clawed hand, with the grip reflex affected rather than preserved as it is here.$r$, 2),
('70000000-0000-0000-0000-000000000008', 'C', 'Isolated C7 root', false,
 $r$Ruled out because an isolated C7 lesion is not a recognised obstetric brachial plexus pattern and does not account for the specific combination of absent biceps reflex with the classic waiter''s tip posture described.$r$, 3),
('70000000-0000-0000-0000-000000000008', 'D', 'The whole brachial plexus (C5-T1)', false,
 $r$Ruled out because a total plexus injury would produce a flail, insensate arm with absent grip reflex as well, whereas this infant''s grip reflex is intact, indicating a more limited (upper trunk) lesion.$r$, 4),
('70000000-0000-0000-0000-000000000008', 'E', 'Long thoracic nerve', false,
 $r$Ruled out because long thoracic nerve injury causes scapular winging from serratus anterior weakness, not the described shoulder/elbow posture and reflex pattern.$r$, 5),

-- Q9 Radial nerve wrist drop
('70000000-0000-0000-0000-000000000009', 'A', 'Compression at the axilla', false,
 $r$Ruled out because axillary compression of the radial nerve (e.g. crutch palsy) would also weaken triceps (elbow extension), which is preserved in this patient.$r$, 1),
('70000000-0000-0000-0000-000000000009', 'B', 'Compression of the posterior interosseous nerve at the elbow', false,
 $r$Ruled out because the posterior interosseous nerve is a purely motor branch and typically spares sensation, whereas this patient has sensory loss over the first dorsal web space, indicating a lesion proximal to this branch point.$r$, 2),
('70000000-0000-0000-0000-000000000009', 'C', 'Compression in the spiral (radial) groove of the humerus, below the level supplying triceps', true,
 $r$Correct. Prolonged pressure on the mid-humerus (classically from an arm draped over a chair, "Saturday night palsy") compresses the radial nerve in the spiral groove, causing wrist and finger drop with sensory loss over the first dorsal web space; preserved triceps strength localises the lesion to below the triceps branches, i.e. at or below the spiral groove.$r$, 3),
('70000000-0000-0000-0000-000000000009', 'D', 'Compression of the ulnar nerve at the cubital tunnel', false,
 $r$Ruled out because ulnar nerve lesions cause clawing and sensory loss over the little finger and medial ring finger, not wrist drop or first web space sensory loss.$r$, 4),
('70000000-0000-0000-0000-000000000009', 'E', 'Compression of the median nerve at the wrist', false,
 $r$Ruled out because median nerve compression at the wrist causes thenar weakness and sensory loss over the thumb, index and middle fingers, not wrist extensor weakness or dorsal first web space sensory loss.$r$, 5),

-- Q10 Median nerve carpal tunnel
('70000000-0000-0000-0000-000000000010', 'A', 'Ulnar nerve at the wrist (Guyon canal)', false,
 $r$Ruled out because ulnar nerve compression causes sensory loss over the little finger and medial half of the ring finger, not the thumb/index/middle finger distribution described here.$r$, 1),
('70000000-0000-0000-0000-000000000010', 'B', 'Radial nerve at the wrist', false,
 $r$Ruled out because the radial nerve is purely sensory at the wrist (dorsum of the hand) and does not innervate the thenar muscles, so it cannot explain the thenar weakness described.$r$, 2),
('70000000-0000-0000-0000-000000000010', 'C', 'Musculocutaneous nerve', false,
 $r$Ruled out because the musculocutaneous nerve supplies elbow flexion and lateral forearm sensation, entirely unrelated to the hand symptoms described.$r$, 3),
('70000000-0000-0000-0000-000000000010', 'D', 'Ulnar nerve at the elbow (cubital tunnel)', false,
 $r$Ruled out because this again produces little finger/medial ring finger sensory loss and hand intrinsic muscle weakness, not the thumb-index-middle distribution and thenar weakness described.$r$, 4),
('70000000-0000-0000-0000-000000000010', 'E', 'Median nerve at the wrist (carpal tunnel)', true,
 $r$Correct. Compression of the median nerve under the flexor retinaculum (carpal tunnel syndrome) causes sensory disturbance in the thumb, index, middle and radial half of the ring finger, thenar wasting/weakness, and a positive Tinel sign; hypothyroidism is a recognised association.$r$, 5),

-- Q11 CN III palsy / PCA aneurysm
('70000000-0000-0000-0000-000000000011', 'A', 'Microvascular (diabetic) third nerve palsy', false,
 $r$Ruled out because microvascular CN III palsies characteristically spare the pupil, as the superficially-located pupillomotor fibres are relatively resistant to the ischaemia affecting the nerve''s core; pupillary involvement from the onset, as here, argues against a microvascular cause.$r$, 1),
('70000000-0000-0000-0000-000000000011', 'B', 'Compression of CN III by a posterior communicating artery aneurysm', true,
 $r$Correct. A posterior communicating artery aneurysm lies adjacent to CN III as it exits the brainstem; external compression affects the superficially-located pupillomotor parasympathetic fibres early, producing a painful, pupil-involving third nerve palsy, often with a preceding thunderclap headache from associated subarachnoid haemorrhage.$r$, 2),
('70000000-0000-0000-0000-000000000011', 'C', 'Cavernous sinus thrombosis', false,
 $r$Ruled out because cavernous sinus pathology typically also involves CN IV, VI and the ophthalmic division of CN V, producing multiple cranial nerve deficits, not an isolated pupil-involving CN III palsy alone.$r$, 3),
('70000000-0000-0000-0000-000000000011', 'D', 'Raised intracranial pressure causing uncal herniation', false,
 $r$Ruled out because uncal herniation from a mass lesion usually presents with additional features of raised intracranial pressure and reduced consciousness, whereas the sudden severe ("thunderclap") headache with isolated pupil-involving CN III palsy described here is the classic presentation of a ruptured posterior communicating artery aneurysm.$r$, 4),
('70000000-0000-0000-0000-000000000011', 'E', 'Myasthenia gravis', false,
 $r$Ruled out because myasthenia gravis affects the neuromuscular junction, causing fluctuating ptosis and diplopia without any pupillary involvement, unlike the fixed dilated pupil described here.$r$, 5),

-- Q12 Circle of Willis / MCA stroke
('70000000-0000-0000-0000-000000000012', 'A', 'Anterior cerebral artery', false,
 $r$Ruled out because anterior cerebral artery occlusion causes leg-predominant weakness with relative sparing of the face and arm, the opposite pattern to this patient''s presentation.$r$, 1),
('70000000-0000-0000-0000-000000000012', 'B', 'Posterior cerebral artery', false,
 $r$Ruled out because posterior cerebral artery occlusion typically causes a contralateral homonymous hemianopia (often with macular sparing) without the face/arm weakness or dysphasia seen here.$r$, 2),
('70000000-0000-0000-0000-000000000012', 'C', 'Anterior spinal artery', false,
 $r$Ruled out because the anterior spinal artery supplies the spinal cord, producing a spinal cord syndrome below a specific level, not a cerebral hemisphere stroke syndrome as described.$r$, 3),
('70000000-0000-0000-0000-000000000012', 'D', 'Middle cerebral artery', true,
 $r$Correct. MCA occlusion causes contralateral face and arm weakness greater than leg weakness (reflecting the larger cortical territory for face/arm), dysphasia when the dominant hemisphere is involved, and homonymous hemianopia from optic radiation involvement.$r$, 4),
('70000000-0000-0000-0000-000000000012', 'E', 'Vertebral artery', false,
 $r$Ruled out because vertebral artery territory strokes affect the posterior circulation (brainstem/cerebellum), causing crossed signs or ataxia, not this anterior circulation cortical syndrome.$r$, 5),

-- Q13 Recurrent laryngeal nerve / thyroidectomy
('70000000-0000-0000-0000-000000000013', 'A', 'Superior laryngeal nerve (external branch)', false,
 $r$Ruled out because superior laryngeal nerve injury weakens voice projection and pitch (loss of cricothyroid tensioning) without fixing the cord in a paramedian position, unlike the breathy, hoarse voice with a fixed cord described here.$r$, 1),
('70000000-0000-0000-0000-000000000013', 'B', 'Vagus nerve at the jugular foramen', false,
 $r$Ruled out because a proximal vagal injury at this level would typically also cause palatal and pharyngeal deficits, and is not the nerve directly at risk during the local dissection of thyroid surgery, unlike the recurrent laryngeal nerve.$r$, 2),
('70000000-0000-0000-0000-000000000013', 'C', 'Glossopharyngeal nerve', false,
 $r$Ruled out because the glossopharyngeal nerve supplies pharyngeal sensation and posterior tongue taste, and has no role in vocal cord movement.$r$, 3),
('70000000-0000-0000-0000-000000000013', 'D', 'Hypoglossal nerve', false,
 $r$Ruled out because the hypoglossal nerve supplies the tongue muscles, causing tongue deviation on injury, not vocal cord palsy.$r$, 4),
('70000000-0000-0000-0000-000000000013', 'E', 'Recurrent laryngeal nerve', true,
 $r$Correct. The recurrent laryngeal nerve runs close to the inferior thyroid artery and thyroid capsule, making it vulnerable during thyroid surgery; unilateral injury causes the ipsilateral vocal cord to lie in the paramedian position, producing a hoarse, breathy voice from glottic incompetence.$r$, 5),

-- Q14 Indirect inguinal hernia
('70000000-0000-0000-0000-000000000014', 'A', 'Indirect inguinal hernia, because the sac passes lateral to the inferior epigastric vessels through the deep inguinal ring', true,
 $r$Correct. Indirect inguinal hernias follow the pathway of the processus vaginalis, passing lateral to the inferior epigastric vessels through the deep inguinal ring and along the inguinal canal, which is why they can extend into the scrotum, exactly as described.$r$, 1),
('70000000-0000-0000-0000-000000000014', 'B', 'Direct inguinal hernia, because the sac passes medial to the inferior epigastric vessels through Hesselbach triangle', false,
 $r$Ruled out because this directly contradicts the operative finding described, in which the sac passes lateral to the inferior epigastric vessels through the deep ring, the defining feature of an indirect (not direct) hernia.$r$, 2),
('70000000-0000-0000-0000-000000000014', 'C', 'Femoral hernia, passing below the inguinal ligament through the femoral canal', false,
 $r$Ruled out because femoral hernias pass below and lateral to the pubic tubercle through the femoral canal, not through the deep inguinal ring and inguinal canal as described here.$r$, 3),
('70000000-0000-0000-0000-000000000014', 'D', 'Direct inguinal hernia arising from acquired weakness of the transversalis fascia', false,
 $r$Ruled out because direct hernias arise medial to the inferior epigastric vessels and rarely extend into the scrotum, unlike the lateral course into the scrotum described in this patient.$r$, 4),
('70000000-0000-0000-0000-000000000014', 'E', 'Umbilical hernia', false,
 $r$Ruled out because umbilical hernias occur through the umbilical ring, an entirely different anatomical site from the groin/inguinal canal swelling described here.$r$, 5),

-- Q15 Anion gap DKA
('70000000-0000-0000-0000-000000000015', 'A', '16 mmol/L, a normal anion gap consistent with a hyperchloraemic acidosis', false,
 $r$Ruled out because this is not the correct arithmetic result from the values given (138 - (96+8) = 34), and a normal anion gap acidosis would not fit a picture of diabetic ketoacidosis.$r$, 1),
('70000000-0000-0000-0000-000000000015', 'B', '8 mmol/L, at the lower end of the normal range', false,
 $r$Ruled out because this does not match the correct calculation from the values given and would represent a normal anion gap, inconsistent with ketoacid accumulation in DKA.$r$, 2),
('70000000-0000-0000-0000-000000000015', 'C', '34 mmol/L, a markedly raised anion gap consistent with accumulation of unmeasured ketoacid anions in diabetic ketoacidosis', true,
 $r$Correct. Anion gap = Na - (Cl + HCO3) = 138 - (96 + 8) = 34 mmol/L, well above the normal range (roughly 8-16 mmol/L). This raised anion gap reflects accumulation of unmeasured ketoacid anions (beta-hydroxybutyrate, acetoacetate) in diabetic ketoacidosis.$r$, 3),
('70000000-0000-0000-0000-000000000015', 'D', '42 mmol/L, calculated by also subtracting the potassium', false,
 $r$Ruled out because potassium is not included in the standard anion gap formula (Na - (Cl + HCO3)); including it produces an incorrect, inflated figure.$r$, 4),
('70000000-0000-0000-0000-000000000015', 'E', '104 mmol/L, the sum of chloride and bicarbonate', false,
 $r$Ruled out because this is simply (Cl + HCO3), the value that must be subtracted from sodium to obtain the anion gap, not the gap itself.$r$, 5),

-- Q16 Statin HMG-CoA reductase
('70000000-0000-0000-0000-000000000016', 'A', 'HMG-CoA reductase', true,
 $r$Correct. Statins competitively inhibit HMG-CoA reductase, the rate-limiting enzyme converting HMG-CoA to mevalonate in cholesterol biosynthesis. Reduced intracellular cholesterol synthesis upregulates hepatocyte LDL receptor expression, increasing clearance of circulating LDL cholesterol.$r$, 1),
('70000000-0000-0000-0000-000000000016', 'B', 'Squalene epoxidase', false,
 $r$Ruled out because squalene epoxidase is a target of antifungal drugs such as terbinafine in ergosterol synthesis, not the enzyme inhibited by statins.$r$, 2),
('70000000-0000-0000-0000-000000000016', 'C', 'Acetyl-CoA carboxylase', false,
 $r$Ruled out because acetyl-CoA carboxylase is the rate-limiting enzyme of fatty acid synthesis, a different metabolic pathway from cholesterol biosynthesis targeted by statins.$r$, 3),
('70000000-0000-0000-0000-000000000016', 'D', 'Cholesterol 7-alpha-hydroxylase', false,
 $r$Ruled out because this enzyme catalyses the rate-limiting step of bile acid synthesis from cholesterol, downstream of the step statins act on, not the statin target itself.$r$, 4),
('70000000-0000-0000-0000-000000000016', 'E', 'PCSK9', false,
 $r$Ruled out because PCSK9 promotes LDL receptor degradation and is instead the target of a separate drug class (PCSK9 inhibitors such as evolocumab), not statins.$r$, 5),

-- Q17 Phenylketonuria
('70000000-0000-0000-0000-000000000017', 'A', 'Tyrosine hydroxylase', false,
 $r$Ruled out because tyrosine hydroxylase converts tyrosine to L-DOPA in catecholamine synthesis, unrelated to the accumulation of phenylalanine described here.$r$, 1),
('70000000-0000-0000-0000-000000000017', 'B', 'Branched-chain alpha-ketoacid dehydrogenase', false,
 $r$Ruled out because deficiency of this enzyme causes maple syrup urine disease, from accumulation of branched-chain amino acids, not phenylalanine.$r$, 2),
('70000000-0000-0000-0000-000000000017', 'C', 'Homogentisate oxidase', false,
 $r$Ruled out because deficiency of this enzyme causes alkaptonuria (dark urine, ochronosis), a different and much milder disorder further down the phenylalanine/tyrosine degradation pathway.$r$, 3),
('70000000-0000-0000-0000-000000000017', 'D', 'Tyrosinase', false,
 $r$Ruled out because tyrosinase deficiency impairs melanin synthesis, causing albinism, and does not cause elevated phenylalanine levels.$r$, 4),
('70000000-0000-0000-0000-000000000017', 'E', 'Phenylalanine hydroxylase', true,
 $r$Correct. Phenylalanine hydroxylase converts phenylalanine to tyrosine; its deficiency causes phenylketonuria, with toxic accumulation of phenylalanine causing severe intellectual disability if untreated, detected by newborn heel-prick screening.$r$, 5),

-- Q18 Urea cycle defect / OTC deficiency
('70000000-0000-0000-0000-000000000018', 'A', 'Carbamoyl phosphate synthetase I deficiency, autosomal recessive', false,
 $r$Ruled out because although this is also a urea cycle defect causing hyperammonaemia, it is much rarer than ornithine transcarbamylase deficiency and is autosomal recessive, not X-linked.$r$, 1),
('70000000-0000-0000-0000-000000000018', 'B', 'Argininosuccinate synthetase deficiency (citrullinaemia), autosomal recessive', false,
 $r$Ruled out because this is a rarer, autosomal recessive urea cycle defect, not the most common cause and not X-linked.$r$, 2),
('70000000-0000-0000-0000-000000000018', 'C', 'Arginase deficiency, autosomal recessive', false,
 $r$Ruled out because arginase deficiency is rarer, typically presents later with progressive spasticity rather than an acute neonatal hyperammonaemic crisis, and is autosomal recessive.$r$, 3),
('70000000-0000-0000-0000-000000000018', 'D', 'Ornithine transcarbamylase deficiency, X-linked', true,
 $r$Correct. Ornithine transcarbamylase (OTC) deficiency is the most common urea cycle defect and is unique among them in being X-linked rather than autosomal recessive. Impaired ammonia incorporation into the urea cycle causes hyperammonaemia, which is directly neurotoxic and stimulates the respiratory centre, producing a respiratory alkalosis with normal glucose and lactate.$r$, 4),
('70000000-0000-0000-0000-000000000018', 'E', 'N-acetylglutamate synthase deficiency, autosomal recessive', false,
 $r$Ruled out because this is a very rare cause of a urea cycle defect, not the most common, and is autosomal recessive rather than X-linked.$r$, 5),

-- Q19 Enzyme kinetics / allopurinol-azathioprine
('70000000-0000-0000-0000-000000000019', 'A', 'Dihydrofolate reductase', false,
 $r$Ruled out because dihydrofolate reductase is inhibited by methotrexate or trimethoprim, and has no role in azathioprine/6-mercaptopurine metabolism or allopurinol''s mechanism.$r$, 1),
('70000000-0000-0000-0000-000000000019', 'B', 'Xanthine oxidase, which normally metabolises the active thiopurine metabolite 6-mercaptopurine', true,
 $r$Correct. Xanthine oxidase normally breaks down 6-mercaptopurine (the active metabolite of azathioprine) as part of purine catabolism. Allopurinol competitively inhibits xanthine oxidase, raising active thiopurine levels and risking severe, potentially life-threatening myelosuppression if the azathioprine dose is not substantially reduced.$r$, 2),
('70000000-0000-0000-0000-000000000019', 'C', 'Thiopurine methyltransferase, inhibited by allopurinol', false,
 $r$Ruled out because thiopurine methyltransferase (TPMT) is a separate thiopurine metabolic pathway; TPMT deficiency is an independent recognised cause of thiopurine toxicity, but allopurinol''s interaction with azathioprine occurs via inhibition of xanthine oxidase, not TPMT.$r$, 3),
('70000000-0000-0000-0000-000000000019', 'D', 'Hypoxanthine-guanine phosphoribosyltransferase, inhibited by allopurinol', false,
 $r$Ruled out because HGPRT is part of the purine salvage pathway and its deficiency (not inhibition by allopurinol) causes Lesch-Nyhan syndrome; allopurinol does not act on this enzyme.$r$, 4),
('70000000-0000-0000-0000-000000000019', 'E', 'Hypoxanthine-guanine phosphoribosyltransferase, which is upregulated by allopurinol to increase purine salvage and reduce myelosuppression', false,
 $r$Ruled out because this reverses the actual direction of harm; allopurinol''s inhibition of xanthine oxidase is what raises active thiopurine metabolite levels and increases toxicity, not a protective salvage-pathway effect.$r$, 5),

-- Q20 Acute intermittent porphyria
('70000000-0000-0000-0000-000000000020', 'A', 'Ferrochelatase', false,
 $r$Ruled out because ferrochelatase deficiency causes erythropoietic protoporphyria, presenting with cutaneous photosensitivity, not acute neurovisceral attacks as described here.$r$, 1),
('70000000-0000-0000-0000-000000000020', 'B', 'ALA synthase', false,
 $r$Ruled out because ALA synthase is the rate-limiting enzyme of haem synthesis that is typically upregulated (not primarily deficient) in acute porphyrias, driving accumulation of precursors made by the downstream deficient enzyme.$r$, 2),
('70000000-0000-0000-0000-000000000020', 'C', 'Porphobilinogen deaminase (hydroxymethylbilane synthase)', true,
 $r$Correct. Acute intermittent porphyria is caused by porphobilinogen deaminase deficiency, causing accumulation of porphobilinogen and delta-aminolevulinic acid. Attacks are precipitated by enzyme-inducing drugs, fasting and alcohol, and cause abdominal pain, vomiting, and neuropsychiatric features without skin photosensitivity.$r$, 3),
('70000000-0000-0000-0000-000000000020', 'D', 'Uroporphyrinogen decarboxylase', false,
 $r$Ruled out because deficiency of this enzyme causes porphyria cutanea tarda, a chronic blistering photosensitivity disorder, not acute abdominal attacks.$r$, 4),
('70000000-0000-0000-0000-000000000020', 'E', 'Protoporphyrinogen oxidase', false,
 $r$Ruled out because this deficiency causes variegate porphyria, which characteristically also produces cutaneous photosensitivity alongside acute attacks, unlike the pure neurovisceral picture (no skin signs) described here.$r$, 5),

-- Q21 Lesch-Nyhan syndrome
('70000000-0000-0000-0000-000000000021', 'A', 'Adenosine deaminase deficiency, autosomal recessive', false,
 $r$Ruled out because adenosine deaminase deficiency causes a form of severe combined immunodeficiency, not self-injurious behaviour or gout.$r$, 1),
('70000000-0000-0000-0000-000000000021', 'B', 'Glucose-6-phosphate dehydrogenase deficiency, X-linked', false,
 $r$Ruled out because G6PD deficiency causes oxidative haemolytic anaemia, unrelated to purine salvage or self-injurious behaviour.$r$, 2),
('70000000-0000-0000-0000-000000000021', 'C', 'Xanthine oxidase deficiency, autosomal recessive', false,
 $r$Ruled out because xanthine oxidase deficiency causes xanthinuria with low (not high) uric acid, the opposite biochemical picture to that described.$r$, 3),
('70000000-0000-0000-0000-000000000021', 'D', 'Adenylosuccinate lyase deficiency, autosomal recessive', false,
 $r$Ruled out because this rare purine synthesis disorder is associated with autism spectrum features, not the classic self-mutilation and gout syndrome described here.$r$, 4),
('70000000-0000-0000-0000-000000000021', 'E', 'Hypoxanthine-guanine phosphoribosyltransferase (HGPRT) deficiency, X-linked recessive', true,
 $r$Correct. HGPRT deficiency prevents purine salvage, diverting hypoxanthine and guanine towards degradation into uric acid, causing marked hyperuricaemia. Lesch-Nyhan syndrome is X-linked recessive, affecting boys, with compulsive self-injurious behaviour and dystonia.$r$, 5),

-- Q22 Cardiac cycle isovolumetric contraction
('70000000-0000-0000-0000-000000000022', 'A', 'Isovolumetric contraction', true,
 $r$Correct. Isovolumetric contraction occurs between mitral valve closure and aortic valve opening: both valves are closed, ventricular volume is constant, and pressure rises steeply as the ventricle generates tension before ejection begins.$r$, 1),
('70000000-0000-0000-0000-000000000022', 'B', 'Isovolumetric relaxation', false,
 $r$Ruled out because isovolumetric relaxation occurs after aortic valve closure and before mitral valve opening, with ventricular pressure falling (not rising) at constant volume, the opposite phase to that described.$r$, 2),
('70000000-0000-0000-0000-000000000022', 'C', 'Rapid ventricular filling', false,
 $r$Ruled out because this phase occurs after the mitral valve opens, with ventricular volume rising (not constant) and low pressure, unlike the constant-volume, rising-pressure phase described.$r$, 3),
('70000000-0000-0000-0000-000000000022', 'D', 'Ventricular ejection', false,
 $r$Ruled out because ejection occurs after the aortic valve opens, with ventricular volume falling as blood is expelled, not remaining constant as described.$r$, 4),
('70000000-0000-0000-0000-000000000022', 'E', 'Atrial systole', false,
 $r$Ruled out because atrial systole occurs earlier, with the mitral valve open (not both valves closed), contributing final ventricular filling rather than generating isovolumetric pressure.$r$, 5),

-- Q23 Bohr effect
('70000000-0000-0000-0000-000000000023', 'A', 'Leftward shift, increased oxygen affinity, called the Haldane effect', false,
 $r$Ruled out because this describes the opposite shift direction to that in the stem, and misnames the phenomenon; the Haldane effect concerns how oxygenation affects carbon dioxide carriage, not oxygen release described here.$r$, 1),
('70000000-0000-0000-0000-000000000023', 'B', 'Rightward shift, reduced oxygen affinity, called the Bohr effect', true,
 $r$Correct. Increased hydrogen ion concentration (acidosis), carbon dioxide and temperature all shift the oxygen-haemoglobin dissociation curve to the right, reducing haemoglobin''s affinity for oxygen and favouring its release to metabolically active, acidotic, hypercapnic, warm tissue. This is the Bohr effect.$r$, 2),
('70000000-0000-0000-0000-000000000023', 'C', 'Leftward shift, increased oxygen affinity, called the Bohr effect', false,
 $r$Ruled out because although the name is correct, the direction is wrong: acidosis, hypercapnia and heat shift the curve right (reducing affinity), not left.$r$, 3),
('70000000-0000-0000-0000-000000000023', 'D', 'Rightward shift, reduced oxygen affinity, called the Haldane effect', false,
 $r$Ruled out because although the direction is correct, this phenomenon is called the Bohr effect; the Haldane effect instead describes how oxygen binding affects haemoglobin''s capacity to carry carbon dioxide and hydrogen ions.$r$, 4),
('70000000-0000-0000-0000-000000000023', 'E', 'No change in oxygen affinity, reflecting a fixed dissociation curve', false,
 $r$Ruled out because this contradicts the stem, which explicitly describes enhanced oxygen release under these conditions, indicating a genuine shift in the curve.$r$, 5),

-- Q24 Countercurrent multiplication / ADH
('70000000-0000-0000-0000-000000000024', 'A', 'Aldosterone, controlling sodium channel insertion in principal cells', false,
 $r$Ruled out because aldosterone regulates sodium (and secondarily potassium) reabsorption via epithelial sodium channels, not the water-channel insertion described in the stem.$r$, 1),
('70000000-0000-0000-0000-000000000024', 'B', 'Atrial natriuretic peptide, controlling aquaporin insertion', false,
 $r$Ruled out because atrial natriuretic peptide promotes natriuresis through other mechanisms (inhibiting sodium reabsorption, afferent arteriolar vasodilation) and does not control aquaporin-2 insertion.$r$, 2),
('70000000-0000-0000-0000-000000000024', 'C', 'Parathyroid hormone, controlling aquaporin insertion', false,
 $r$Ruled out because parathyroid hormone acts on distal tubular calcium reabsorption and bone/gut calcium handling, unrelated to collecting duct water permeability.$r$, 3),
('70000000-0000-0000-0000-000000000024', 'D', 'Antidiuretic hormone (vasopressin), controlling aquaporin-2 insertion, acting on the gradient generated by countercurrent multiplication in the loop of Henle', true,
 $r$Correct. ADH acts on V2 receptors in collecting duct principal cells to insert aquaporin-2 water channels. Water then moves down the medullary osmotic gradient generated by active NaCl reabsorption from the water-impermeable thick ascending limb (countercurrent multiplication), allowing urine concentration.$r$, 4),
('70000000-0000-0000-0000-000000000024', 'E', 'Angiotensin II, controlling aquaporin insertion', false,
 $r$Ruled out because angiotensin II mainly promotes proximal tubular sodium/bicarbonate reabsorption and systemic vasoconstriction, not collecting duct aquaporin insertion.$r$, 5),

-- Q25 HPA axis / adrenal crisis
('70000000-0000-0000-0000-000000000025', 'A', 'Primary adrenal failure from autoimmune destruction of the adrenal cortex (Addison disease)', false,
 $r$Ruled out because this patient''s adrenal atrophy results from chronic exogenous steroid suppression of ACTH (secondary adrenal insufficiency), not primary autoimmune destruction of the gland itself.$r$, 1),
('70000000-0000-0000-0000-000000000025', 'B', 'Conn syndrome from autonomous aldosterone secretion', false,
 $r$Ruled out because this describes excess mineralocorticoid secretion, an unrelated mechanism to the glucocorticoid axis suppression and deficiency described here.$r$, 2),
('70000000-0000-0000-0000-000000000025', 'C', 'Secondary adrenal insufficiency from HPA axis suppression, precipitating an adrenal (Addisonian) crisis on abrupt steroid withdrawal under physiological stress', true,
 $r$Correct. Prolonged exogenous glucocorticoid therapy suppresses hypothalamic CRH and pituitary ACTH via negative feedback, causing adrenal cortical atrophy. Abrupt cessation removes exogenous cortisol before the suppressed axis and atrophied adrenal cortex can recover enough to meet the demands of surgical stress, precipitating an adrenal crisis.$r$, 3),
('70000000-0000-0000-0000-000000000025', 'D', 'Cushing syndrome from continued excess cortisol', false,
 $r$Ruled out because the risk here is a cortisol deficit after stopping the drug, the opposite problem to ongoing cortisol excess.$r$, 4),
('70000000-0000-0000-0000-000000000025', 'E', 'Sheehan syndrome from postpartum pituitary infarction', false,
 $r$Ruled out because there is no pregnancy or postpartum haemorrhage described; the mechanism here is drug-induced HPA axis suppression, not pituitary infarction.$r$, 5),

-- Q26 Beta-2 adrenoceptor / salbutamol
('70000000-0000-0000-0000-000000000026', 'A', 'Beta-2 adrenoceptor', true,
 $r$Correct. Salbutamol selectively stimulates beta-2 adrenoceptors, which are Gs-coupled and raise cAMP in bronchial smooth muscle, causing relaxation and bronchodilation; at higher doses, action on the same receptor subtype in skeletal muscle and the heart causes tremor and tachycardia.$r$, 1),
('70000000-0000-0000-0000-000000000026', 'B', 'Beta-1 adrenoceptor', false,
 $r$Ruled out because beta-1 adrenoceptors predominate in the heart, increasing rate and contractility, and are not the primary receptor mediating bronchodilation.$r$, 2),
('70000000-0000-0000-0000-000000000026', 'C', 'Alpha-1 adrenoceptor', false,
 $r$Ruled out because alpha-1 stimulation causes smooth muscle contraction/vasoconstriction, the opposite effect to the bronchodilation described.$r$, 3),
('70000000-0000-0000-0000-000000000026', 'D', 'Muscarinic M3 receptor', false,
 $r$Ruled out because M3 stimulation causes bronchoconstriction, not bronchodilation; salbutamol is an adrenergic agonist, not an antimuscarinic.$r$, 4),
('70000000-0000-0000-0000-000000000026', 'E', 'Nicotinic acetylcholine receptor', false,
 $r$Ruled out because nicotinic receptors mediate fast synaptic transmission at the neuromuscular junction and autonomic ganglia, unrelated to salbutamol''s mechanism.$r$, 5),

-- Q27 Baroreceptor reflex
('70000000-0000-0000-0000-000000000027', 'A', 'Chemoreceptor reflex via the carotid body', false,
 $r$Ruled out because carotid body chemoreceptors primarily respond to hypoxia, hypercapnia and acidosis, not directly to the fall in blood pressure that is the primary stimulus here.$r$, 1),
('70000000-0000-0000-0000-000000000027', 'B', 'Bainbridge reflex', false,
 $r$Ruled out because the Bainbridge reflex responds to increased venous return/atrial stretch causing tachycardia, a different stimulus and receptor location from arterial baroreceptors responding to a pressure fall.$r$, 2),
('70000000-0000-0000-0000-000000000027', 'C', 'Bezold-Jarisch reflex', false,
 $r$Ruled out because this reflex is triggered by stimulation of cardiac ventricular receptors (e.g. in inferior MI or vasovagal syncope), producing bradycardia and hypotension, not the postural tachycardic response described.$r$, 3),
('70000000-0000-0000-0000-000000000027', 'D', 'Baroreceptor reflex via carotid sinus and aortic arch stretch receptors', true,
 $r$Correct. Carotid sinus and aortic arch stretch receptors sense the transient fall in pressure on standing, reducing afferent firing and producing reflex tachycardia and vasoconstriction within seconds via the medullary cardiovascular centre.$r$, 4),
('70000000-0000-0000-0000-000000000027', 'E', 'Renin-angiotensin-aldosterone system activation', false,
 $r$Ruled out because this is a slower, hormonal blood pressure regulation mechanism acting over minutes to hours, not the rapid neural reflex occurring within seconds as described.$r$, 5),

-- Q28 Malignant hyperthermia / ryanodine receptor
('70000000-0000-0000-0000-000000000028', 'A', 'Neuroleptic malignant syndrome, due to dopamine receptor blockade', false,
 $r$Ruled out because neuroleptic malignant syndrome is triggered by antipsychotic (dopamine-blocking) drugs, not volatile anaesthetics or suxamethonium, and has a distinct central mechanism, not a ryanodine receptor defect.$r$, 1),
('70000000-0000-0000-0000-000000000028', 'B', 'Serotonin syndrome, due to excess synaptic serotonin', false,
 $r$Ruled out because serotonin syndrome is triggered by serotonergic drugs, not anaesthetic agents, and results from neurotransmitter excess rather than disrupted excitation-contraction coupling.$r$, 2),
('70000000-0000-0000-0000-000000000028', 'C', 'Malignant hyperthermia, due to uncontrolled calcium release from the sarcoplasmic reticulum via the mutated ryanodine receptor', true,
 $r$Correct. Malignant hyperthermia is caused by a ryanodine receptor (RYR1) mutation, triggered by volatile anaesthetics and suxamethonium. Uncontrolled calcium release from the sarcoplasmic reticulum causes sustained contraction (rigidity), a hypermetabolic state, and marked heat and creatine kinase release.$r$, 3),
('70000000-0000-0000-0000-000000000028', 'D', 'Malignant hyperthermia, due to failure of calcium reuptake into the sarcoplasmic reticulum by SERCA', false,
 $r$Ruled out because the primary defect is excessive, uncontrolled calcium release through the ryanodine receptor, not a failure of the separate SERCA reuptake pump.$r$, 4),
('70000000-0000-0000-0000-000000000028', 'E', 'Malignant hyperthermia, due to failure of acetylcholine release at the neuromuscular junction', false,
 $r$Ruled out because the defect is intracellular, within the sarcoplasmic reticulum calcium release mechanism, downstream of and unrelated to presynaptic acetylcholine release.$r$, 5),

-- Q29 Starling forces / oedema
('70000000-0000-0000-0000-000000000029', 'A', 'Increased capillary hydrostatic pressure', false,
 $r$Ruled out because the stem explicitly states capillary hydrostatic pressure is not significantly elevated in this patient.$r$, 1),
('70000000-0000-0000-0000-000000000029', 'B', 'Decreased interstitial hydrostatic pressure', false,
 $r$Ruled out because this is not the principal Starling force altered by hypoalbuminaemia and is not the primary driver of oedema in nephrotic syndrome.$r$, 2),
('70000000-0000-0000-0000-000000000029', 'C', 'Increased capillary permeability to protein', false,
 $r$Ruled out because this mechanism drives inflammatory (e.g. septic) oedema, not the hypoalbuminaemic oedema of nephrotic syndrome described here.$r$, 3),
('70000000-0000-0000-0000-000000000029', 'D', 'Decreased lymphatic drainage', false,
 $r$Ruled out because impaired lymphatic drainage causes lymphoedema, a distinct mechanism from the hypoalbuminaemic oedema described in this patient.$r$, 4),
('70000000-0000-0000-0000-000000000029', 'E', 'Decreased plasma oncotic (colloid osmotic) pressure due to hypoalbuminaemia', true,
 $r$Correct. Albumin is the main determinant of plasma oncotic pressure, which normally opposes capillary hydrostatic pressure. Severe hypoalbuminaemia, as in nephrotic syndrome, reduces plasma oncotic pressure, shifting the Starling balance towards net fluid filtration into the interstitium and causing oedema even without raised hydrostatic pressure.$r$, 5),

-- Q30 Autosomal dominant / Huntington disease
('70000000-0000-0000-0000-000000000030', 'A', 'Autosomal recessive inheritance; example, cystic fibrosis', false,
 $r$Ruled out because autosomal recessive conditions typically appear to skip generations, requiring both parents to be carriers, unlike the direct parent-to-child transmission in every generation described here.$r$, 1),
('70000000-0000-0000-0000-000000000030', 'B', 'Autosomal dominant inheritance; example, Huntington disease', true,
 $r$Correct. Autosomal dominant conditions appear in every generation, affect both sexes equally, and transmit from an affected parent to roughly half of their offspring without skipping generations, exactly as described. Huntington disease is a classic example.$r$, 2),
('70000000-0000-0000-0000-000000000030', 'C', 'X-linked recessive inheritance; example, Duchenne muscular dystrophy', false,
 $r$Ruled out because X-linked recessive conditions predominantly affect males, with transmission through carrier females, not the equal-sex, direct parent-to-child pattern described here.$r$, 3),
('70000000-0000-0000-0000-000000000030', 'D', 'X-linked dominant inheritance; example, fragile X syndrome', false,
 $r$Ruled out because X-linked dominant conditions typically show a difference in severity or frequency between affected males and females, unlike the equally-affected-both-sexes pattern described.$r$, 4),
('70000000-0000-0000-0000-000000000030', 'E', 'Mitochondrial inheritance; example, MELAS', false,
 $r$Ruled out because mitochondrial inheritance is exclusively maternal, and affected fathers cannot transmit disease, unlike the direct transmission from an affected parent of either sex described here.$r$, 5),

-- Q31 Genetic anticipation / myotonic dystrophy
('70000000-0000-0000-0000-000000000031', 'A', 'Variable expressivity, caused by differing environmental modifiers between generations', false,
 $r$Ruled out because variable expressivity describes differing severity among individuals with the same genotype at one point in time, not a progressive worsening that tracks with an expanding trinucleotide repeat across successive generations.$r$, 1),
('70000000-0000-0000-0000-000000000031', 'B', 'Incomplete penetrance, caused by epigenetic silencing', false,
 $r$Ruled out because penetrance refers to whether a genotype produces any phenotype at all, not a pattern of progressively earlier onset and greater severity across generations.$r$, 2),
('70000000-0000-0000-0000-000000000031', 'C', 'Mosaicism, caused by a post-zygotic somatic mutation', false,
 $r$Ruled out because mosaicism describes two genetically distinct cell populations within one individual from a mutation arising after fertilisation, not a trans-generational worsening pattern.$r$, 3),
('70000000-0000-0000-0000-000000000031', 'D', 'Genetic anticipation, caused by progressive expansion of an unstable trinucleotide repeat with each generation', true,
 $r$Correct. Genetic anticipation describes a condition presenting earlier and more severely in successive generations. In myotonic dystrophy, the causative CTG repeat is unstable and tends to expand further at each meiosis, with larger expansions correlating with earlier onset and greater severity, exactly as described from grandfather to son to grandson.$r$, 4),
('70000000-0000-0000-0000-000000000031', 'E', 'Genomic imprinting, caused by differential gene expression depending on parental origin', false,
 $r$Ruled out because imprinting explains phenotype differences depending on which parent transmits a mutation, not the progressive, repeat-size-dependent worsening across generations described here.$r$, 5),

-- Q32 Genomic imprinting / Prader-Willi vs Angelman
('70000000-0000-0000-0000-000000000032', 'A', 'Both children have Prader-Willi syndrome, with variable expressivity accounting for the phenotypic difference', false,
 $r$Ruled out because the two children have clearly distinct, named phenotypes, and variable expressivity does not account for why the phenotype depends specifically on which parent the deletion was inherited from.$r$, 1),
('70000000-0000-0000-0000-000000000032', 'B', 'Both children have Angelman syndrome, with incomplete penetrance explaining Child A''s milder features', false,
 $r$Ruled out because Child A''s features (hyperphagia, obesity) are specific to Prader-Willi syndrome, not a milder form of Angelman syndrome, and penetrance does not explain a parent-of-origin-dependent phenotype switch.$r$, 2),
('70000000-0000-0000-0000-000000000032', 'C', 'Child A has Angelman syndrome and Child B has Prader-Willi syndrome', false,
 $r$Ruled out because this reverses the correct parent-of-origin association: a paternally inherited deletion causes Prader-Willi syndrome (Child A''s features), while a maternally inherited deletion causes Angelman syndrome (Child B''s features).$r$, 3),
('70000000-0000-0000-0000-000000000032', 'D', 'The difference is due to an additional independent mutation in Child B, unrelated to the shared deletion', false,
 $r$Ruled out because both children share the identical 15q11-13 deletion; the differing phenotype is explained by the parental origin of that same deletion (imprinting), not a separate unrelated mutation.$r$, 4),
('70000000-0000-0000-0000-000000000032', 'E', 'Genomic imprinting, in which the paternal copy of certain genes in this region is normally active (lost in Child A, causing Prader-Willi syndrome) while the maternal copy of a different gene (UBE3A) in the same region is normally active (lost in Child B, causing Angelman syndrome)', true,
 $r$Correct. Genomic imprinting means some genes in this region are expressed from only one parental allele. Loss of the paternally-active genes causes Prader-Willi syndrome (Child A), while loss of the maternally-active UBE3A gene causes Angelman syndrome (Child B), explaining how an identical deletion produces opposite phenotypes depending on parental origin.$r$, 5),

-- Q33 Turner syndrome
('70000000-0000-0000-0000-000000000033', 'A', 'Turner syndrome', true,
 $r$Correct. Turner syndrome (45,X) causes short stature, webbed neck, widely spaced nipples, wide carrying angle, and gonadal dysgenesis causing primary amenorrhoea in a phenotypic female, exactly as described.$r$, 1),
('70000000-0000-0000-0000-000000000033', 'B', 'Klinefelter syndrome', false,
 $r$Ruled out because Klinefelter syndrome (47,XXY) affects phenotypic males, presenting with tall stature, gynaecomastia and infertility, not short stature and primary amenorrhoea in a female.$r$, 2),
('70000000-0000-0000-0000-000000000033', 'C', 'Down syndrome (trisomy 21)', false,
 $r$Ruled out because Down syndrome is characterised by intellectual disability, characteristic facies and congenital heart disease with a trisomy 21 karyotype, not the 45,X karyotype and features described here.$r$, 3),
('70000000-0000-0000-0000-000000000033', 'D', 'Noonan syndrome', false,
 $r$Ruled out because although Noonan syndrome shares some overlapping features (webbed neck, short stature), it has a normal karyotype and can occur in males, unlike the 45,X karyotype specifically found here.$r$, 4),
('70000000-0000-0000-0000-000000000033', 'E', 'Edwards syndrome (trisomy 18)', false,
 $r$Ruled out because Edwards syndrome is a severe multi-system disorder usually diagnosed in infancy with very high mortality, with a trisomy 18 karyotype, not a condition presenting with primary amenorrhoea in a teenager with a 45,X karyotype.$r$, 5),

-- Q34 Recurrence risk / autosomal recessive counselling
('70000000-0000-0000-0000-000000000034', 'A', '1 in 2 (50%)', false,
 $r$Ruled out because this is the recurrence risk pattern for autosomal dominant inheritance from an affected parent, not autosomal recessive inheritance from two unaffected carrier parents.$r$, 1),
('70000000-0000-0000-0000-000000000034', 'B', '1 in 4 (25%)', true,
 $r$Correct. Both parents of a child with an autosomal recessive condition are obligate carriers, even though unaffected themselves. Two carrier parents (Aa x Aa) have a 1 in 4 chance with each pregnancy of an affected (aa) child.$r$, 2),
('70000000-0000-0000-0000-000000000034', 'C', '1 in 3 (33%)', false,
 $r$Ruled out because this is the risk among unaffected siblings only, after excluding the affected genotype, not the risk for a new, unselected pregnancy.$r$, 3),
('70000000-0000-0000-0000-000000000034', 'D', 'Negligible risk, since both parents are unaffected', false,
 $r$Ruled out because unaffected parents of a child with an autosomal recessive condition are obligate carriers, so the risk is not negligible.$r$, 4),
('70000000-0000-0000-0000-000000000034', 'E', '1 in 16', false,
 $r$Ruled out because this would represent the joint probability of two independent recessive conditions both recurring, not the recurrence risk for the single condition already known to run in this family.$r$, 5),

-- Q35 X-linked recessive / Duchenne muscular dystrophy
('70000000-0000-0000-0000-000000000035', 'A', 'Autosomal dominant inheritance; example, Huntington disease', false,
 $r$Ruled out because autosomal dominant conditions affect both sexes equally and transmit directly from an affected parent, unlike the male-only affected pattern with unaffected/carrier females described here.$r$, 1),
('70000000-0000-0000-0000-000000000035', 'B', 'Autosomal recessive inheritance; example, cystic fibrosis', false,
 $r$Ruled out because autosomal recessive conditions affect both sexes equally, not males exclusively as described in this pedigree.$r$, 2),
('70000000-0000-0000-0000-000000000035', 'C', 'X-linked recessive inheritance; example, Duchenne muscular dystrophy', true,
 $r$Correct. X-linked recessive conditions affect males (who have only one X chromosome) far more often and severely than female carriers, with no male-to-male transmission, exactly as described. Duchenne muscular dystrophy is a classic severe X-linked recessive condition.$r$, 3),
('70000000-0000-0000-0000-000000000035', 'D', 'X-linked dominant inheritance; example, fragile X syndrome', false,
 $r$Ruled out because X-linked dominant conditions typically also produce clinically apparent disease in a substantial proportion of carrier females, unlike the largely unaffected/mildly affected female carriers described here.$r$, 4),
('70000000-0000-0000-0000-000000000035', 'E', 'Mitochondrial inheritance; example, Leber hereditary optic neuropathy', false,
 $r$Ruled out because mitochondrial inheritance passes from an affected mother to children of both sexes, not selectively to males via carrier females as described in this pedigree.$r$, 5),

-- Q36 Penetrance vs expressivity (NF1)
('70000000-0000-0000-0000-000000000036', 'A', 'Both phenomena illustrate reduced penetrance', false,
 $r$Ruled out because reduced penetrance specifically describes a gene carrier having no detectable phenotype at all (the third carrier), which does not describe the severity difference between the first two, clinically affected, carriers.$r$, 1),
('70000000-0000-0000-0000-000000000036', 'B', 'Both phenomena illustrate variable expressivity', false,
 $r$Ruled out because variable expressivity describes differing severity among those who do express some phenotype, and does not on its own account for a carrier with a complete absence of any detectable features.$r$, 2),
('70000000-0000-0000-0000-000000000036', 'C', 'The severity difference reflects variable expressivity; the asymptomatic carrier reflects genetic mosaicism', false,
 $r$Ruled out because mosaicism describes two genetically distinct cell populations within one individual from a post-zygotic mutation, which is not implied simply by a confirmed obligate carrier showing no clinical features.$r$, 3),
('70000000-0000-0000-0000-000000000036', 'D', 'The severity difference reflects incomplete penetrance; the asymptomatic carrier reflects variable expressivity', false,
 $r$Ruled out because this reverses the correct assignment: incomplete penetrance concerns absence versus presence of any phenotype, while expressivity concerns the degree of severity among those with a phenotype.$r$, 4),
('70000000-0000-0000-0000-000000000036', 'E', 'The severity difference between the two symptomatic carriers reflects variable expressivity, while the complete absence of features in the obligate carrier reflects incomplete (reduced) penetrance', true,
 $r$Correct. Expressivity describes how severely a phenotype is expressed among individuals who show features of a condition (the mild versus severe carriers). Penetrance describes the proportion of genotype carriers who show any phenotype at all; incomplete penetrance means some carriers, like the third obligate carrier here, are entirely asymptomatic. The two concepts are independent and can coexist within the same family, as classically seen in neurofibromatosis type 1.$r$, 5),

-- Q37 Type I hypersensitivity / anaphylaxis
('70000000-0000-0000-0000-000000000037', 'A', 'Type II hypersensitivity', false,
 $r$Ruled out because type II hypersensitivity involves antibody directed against fixed cell-surface or matrix antigens causing cell damage, not mast cell degranulation via cross-linked IgE as described here.$r$, 1),
('70000000-0000-0000-0000-000000000037', 'B', 'Type I hypersensitivity', true,
 $r$Correct. Type I hypersensitivity is mediated by pre-formed allergen-specific IgE bound to mast cells and basophils; allergen cross-linking of this IgE triggers immediate degranulation with histamine release, producing anaphylaxis within minutes, exactly as described.$r$, 2),
('70000000-0000-0000-0000-000000000037', 'C', 'Type III hypersensitivity', false,
 $r$Ruled out because type III hypersensitivity involves immune complex deposition and complement-driven neutrophilic inflammation developing over days, not the immediate IgE-mediated reaction described here.$r$, 3),
('70000000-0000-0000-0000-000000000037', 'D', 'Type IV hypersensitivity', false,
 $r$Ruled out because type IV hypersensitivity is T-cell mediated and delayed (48-72 hours), not immediate and antibody-dependent as described.$r$, 4),
('70000000-0000-0000-0000-000000000037', 'E', 'An autoimmune reaction against self-antigen', false,
 $r$Ruled out because this is a classic hypersensitivity reaction to an external allergen (peanut), not an autoimmune reaction against a self-antigen.$r$, 5),

-- Q38 Type II hypersensitivity / Goodpasture disease
('70000000-0000-0000-0000-000000000038', 'A', 'Type II hypersensitivity', true,
 $r$Correct. Type II hypersensitivity involves antibody (here IgG) binding directly to a fixed antigen (type IV collagen) within the basement membrane, producing a linear immunofluorescence pattern, complement activation and tissue damage, exactly as described in Goodpasture disease.$r$, 1),
('70000000-0000-0000-0000-000000000038', 'B', 'Type I hypersensitivity', false,
 $r$Ruled out because type I hypersensitivity is IgE/mast-cell mediated and immediate, not caused by IgG antibody binding a fixed tissue antigen as described here.$r$, 2),
('70000000-0000-0000-0000-000000000038', 'C', 'Type III hypersensitivity', false,
 $r$Ruled out because type III hypersensitivity involves circulating immune complexes depositing in tissue (a granular immunofluorescence pattern), whereas here antibody binds directly (in situ) to a fixed structural antigen, producing the smooth linear pattern described.$r$, 3),
('70000000-0000-0000-0000-000000000038', 'D', 'Type IV hypersensitivity', false,
 $r$Ruled out because type IV hypersensitivity is T-cell (not antibody) mediated and would not produce the linear IgG immunofluorescence staining described.$r$, 4),
('70000000-0000-0000-0000-000000000038', 'E', 'An innate immune response independent of adaptive immunity', false,
 $r$Ruled out because this is clearly antibody (adaptive, humoral) mediated, evidenced by the specific IgG anti-GBM antibodies described.$r$, 5),

-- Q39 Type III hypersensitivity / serum sickness
('70000000-0000-0000-0000-000000000039', 'A', 'Type I hypersensitivity', false,
 $r$Ruled out because type I hypersensitivity is immediate (minutes) and IgE-mediated, not the delayed (1-2 week), immune-complex-mediated multisystem illness described here.$r$, 1),
('70000000-0000-0000-0000-000000000039', 'B', 'Type II hypersensitivity', false,
 $r$Ruled out because type II hypersensitivity involves antibody against a fixed tissue antigen, not circulating immune complexes depositing in multiple tissues as described here.$r$, 2),
('70000000-0000-0000-0000-000000000039', 'C', 'Type IV hypersensitivity', false,
 $r$Ruled out because type IV hypersensitivity is T-cell mediated without antibody or complement involvement, unlike the complement-activating immune complex process described here.$r$, 3),
('70000000-0000-0000-0000-000000000039', 'D', 'Type III hypersensitivity', true,
 $r$Correct. Type III hypersensitivity involves antigen-antibody immune complexes forming in the circulation and depositing in vessel walls and glomeruli, activating complement and attracting neutrophils whose enzyme release causes tissue damage. The 1-2 week delay reflects the time needed to mount an antibody response against the foreign antiserum before immune complexes can form, exactly as in serum sickness.$r$, 4),
('70000000-0000-0000-0000-000000000039', 'E', 'Type I and type II hypersensitivity combined', false,
 $r$Ruled out because this presentation is a single, well-recognised mechanism (immune complex deposition), not a combination of the immediate IgE-mediated and cytotoxic antibody-mediated mechanisms.$r$, 5),

-- Q40 Type IV hypersensitivity / contact dermatitis
('70000000-0000-0000-0000-000000000040', 'A', 'Type I hypersensitivity', false,
 $r$Ruled out because type I reactions occur within minutes and are IgE/mast-cell mediated, not delayed over 48-72 hours and T-cell mediated as described here.$r$, 1),
('70000000-0000-0000-0000-000000000040', 'B', 'Type II hypersensitivity', false,
 $r$Ruled out because type II hypersensitivity is antibody-mediated against a fixed tissue antigen, not a T-cell/macrophage-mediated skin reaction to a hapten as described.$r$, 2),
('70000000-0000-0000-0000-000000000040', 'C', 'Type IV hypersensitivity', true,
 $r$Correct. Type IV (delayed-type) hypersensitivity is mediated by sensitised T lymphocytes and macrophages rather than antibody, typically taking 48-72 hours to develop, exactly as described. Allergic contact dermatitis to nickel, where the metal acts as a hapten, is a classic example, and patch testing exploits this delayed mechanism.$r$, 3),
('70000000-0000-0000-0000-000000000040', 'D', 'Type III hypersensitivity', false,
 $r$Ruled out because type III hypersensitivity involves circulating immune complexes and complement activation, not sensitised T lymphocytes acting locally without antibody as described here.$r$, 4),
('70000000-0000-0000-0000-000000000040', 'E', 'An IgE-independent mast cell degranulation reaction', false,
 $r$Ruled out because this describes a non-immunological mast cell reaction (e.g. to certain drugs), not the T-cell-mediated mechanism explicitly described in the stem.$r$, 5),

-- Q41 Complement deficiency / hereditary angioedema
('70000000-0000-0000-0000-000000000041', 'A', 'Deficiency of C3, causing recurrent pyogenic bacterial infections', false,
 $r$Ruled out because C3 deficiency causes recurrent bacterial infections, not recurrent non-urticarial angioedema, and does not explain the low C4/normal C3 pattern described here.$r$, 1),
('70000000-0000-0000-0000-000000000041', 'B', 'Deficiency of C1 esterase inhibitor, causing unregulated classical complement and kallikrein-kinin pathway activation with excess bradykinin production', true,
 $r$Correct. C1 esterase inhibitor normally restrains classical complement pathway activation and the kallikrein-kinin (contact) system; its deficiency allows excess bradykinin generation, causing recurrent angioedema that does not respond to antihistamines or adrenaline (since it is not histamine-mediated) and is associated with low C4 (consumed by unchecked classical pathway activation) with normal C3.$r$, 2),
('70000000-0000-0000-0000-000000000041', 'C', 'Deficiency of C1 esterase inhibitor, causing excess histamine release from mast cells', false,
 $r$Ruled out because hereditary angioedema is bradykinin-driven, not histamine-mediated, which is precisely why antihistamines and adrenaline are ineffective in this condition.$r$, 3),
('70000000-0000-0000-0000-000000000041', 'D', 'Deficiency of properdin, causing over-activation of the alternative pathway', false,
 $r$Ruled out because properdin deficiency impairs (rather than over-activates) the alternative pathway and predisposes to Neisserial infections, not angioedema.$r$, 4),
('70000000-0000-0000-0000-000000000041', 'E', 'Deficiency of the terminal complement components (C5-C9), causing recurrent Neisserial infections', false,
 $r$Ruled out because terminal complement deficiency causes recurrent Neisseria meningitidis/gonorrhoeae infections from failure of the membrane attack complex, not angioedema.$r$, 5),

-- Q42 Primary immunodeficiency / Bruton XLA
('70000000-0000-0000-0000-000000000042', 'A', 'Severe combined immunodeficiency, due to a defect in T and B lymphocyte development', false,
 $r$Ruled out because SCID typically presents earlier (within the first weeks of life) with severe or opportunistic infections and low T cell numbers as well, unlike this infant''s isolated B-cell absence with normal T cells and onset around 5 months.$r$, 1),
('70000000-0000-0000-0000-000000000042', 'B', 'Common variable immunodeficiency, due to impaired B cell differentiation into plasma cells', false,
 $r$Ruled out because common variable immunodeficiency typically presents later (often in adulthood or later childhood) with variably reduced B cell numbers, not a complete absence of circulating B cells as seen in this infant.$r$, 2),
('70000000-0000-0000-0000-000000000042', 'C', 'DiGeorge syndrome, due to thymic aplasia', false,
 $r$Ruled out because DiGeorge syndrome causes T cell deficiency from thymic aplasia with normal or preserved B cells, the opposite pattern to the one described here.$r$, 3),
('70000000-0000-0000-0000-000000000042', 'D', 'Selective IgA deficiency, due to failure of IgA class switching', false,
 $r$Ruled out because selective IgA deficiency involves an isolated low IgA with normal IgG/IgM and normal B cell numbers, not panhypogammaglobulinaemia with absent B cells as described.$r$, 4),
('70000000-0000-0000-0000-000000000042', 'E', 'Bruton (X-linked) agammaglobulinaemia, due to a Bruton tyrosine kinase mutation blocking B cell maturation', true,
 $r$Correct. Bruton X-linked agammaglobulinaemia is caused by BTK mutations blocking B lymphocyte maturation, causing absent circulating B cells and panhypogammaglobulinaemia with normal T cell numbers. Affected infants are typically well for the first few months due to passive protection from transplacental maternal IgG, becoming symptomatic with recurrent encapsulated bacterial infections as this maternal antibody wanes from around 3-6 months, exactly as described.$r$, 5),

-- Q43 Transplant rejection / hyperacute rejection
('70000000-0000-0000-0000-000000000043', 'A', 'Hyperacute rejection, mediated by pre-existing recipient antibodies against donor ABO or HLA antigens activating complement and causing vascular thrombosis', true,
 $r$Correct. Hyperacute rejection occurs within minutes to hours of graft reperfusion because the recipient already has preformed antibodies (from prior transfusion, pregnancy, or transplantation) against donor ABO or HLA antigens. Antibody binding to donor endothelium activates complement, causing rapid intravascular thrombosis and graft infarction, exactly as described.$r$, 1),
('70000000-0000-0000-0000-000000000043', 'B', 'Chronic rejection, mediated by gradual fibrosis and vascular intimal thickening over months to years', false,
 $r$Ruled out because chronic rejection is a slow process over months to years, inconsistent with the immediate graft failure described.$r$, 2),
('70000000-0000-0000-0000-000000000043', 'C', 'Graft-versus-host disease, mediated by donor T lymphocytes attacking recipient tissue', false,
 $r$Ruled out because graft-versus-host disease involves donor immune cells attacking the recipient (typically after bone marrow/stem cell transplant), not the graft''s own vasculature failing as described here.$r$, 3),
('70000000-0000-0000-0000-000000000043', 'D', 'Acute cellular rejection, mediated by recipient T lymphocytes infiltrating the graft over days to weeks', false,
 $r$Ruled out because acute cellular rejection develops over days to weeks, not within minutes of reperfusion as described here.$r$, 4),
('70000000-0000-0000-0000-000000000043', 'E', 'Acute antibody-mediated rejection developing over the first post-operative week as new donor-specific antibodies form', false,
 $r$Ruled out because this scenario describes graft failure within minutes, far too rapid for a newly forming (as opposed to pre-existing) antibody response to develop.$r$, 5),

-- Q44 Sensitivity calculation
('70000000-0000-0000-0000-000000000044', 'A', '50%, calculated as the positive predictive value', false,
 $r$Ruled out because this is the positive predictive value (90 true positives out of 180 total positive tests), not the sensitivity, which uses only those with the disease as the denominator.$r$, 1),
('70000000-0000-0000-0000-000000000044', 'B', 'Approximately 99%, calculated as the negative predictive value', false,
 $r$Ruled out because this is the negative predictive value (810 true negatives out of 820 total negative tests), not the sensitivity.$r$, 2),
('70000000-0000-0000-0000-000000000044', 'C', '9%, calculated using the total study population (1000) as the denominator', false,
 $r$Ruled out because sensitivity uses only those with the disease (100 patients), not the entire study population, as the denominator.$r$, 3),
('70000000-0000-0000-0000-000000000044', 'D', '90%, calculated as 90 true positives out of the 100 patients who truly have the disease', true,
 $r$Correct. Sensitivity = true positives / (true positives + false negatives) = 90/100 = 90%, the proportion of people with the disease who correctly test positive.$r$, 4),
('70000000-0000-0000-0000-000000000044', 'E', '90%, calculated as 810 true negatives out of the 900 patients who do not have the disease', false,
 $r$Ruled out because although this numerically coincides with the sensitivity in this dataset, it is actually the specificity (true negatives over those without disease), a different metric answering a different question from sensitivity.$r$, 5),

-- Q45 Likelihood ratio
('70000000-0000-0000-0000-000000000045', 'A', 'The test has poor discriminatory value and a positive result should not materially change the probability of disease', false,
 $r$Ruled out because a high LR+ (such as 15) substantially increases the post-test probability of disease if positive, the opposite of poor discriminatory value.$r$, 1),
('70000000-0000-0000-0000-000000000045', 'B', 'The test is positive in 15% of people with the disease', false,
 $r$Ruled out because LR+ is not a percentage of positives among diseased people (that would be sensitivity); it is a ratio comparing the probability of a positive result in diseased versus non-diseased individuals.$r$, 2),
('70000000-0000-0000-0000-000000000045', 'C', 'A positive result is 15 times more likely to occur in a person with the disease than in a person without it, substantially increasing the post-test probability of disease', true,
 $r$Correct. LR+ = sensitivity / (1 - specificity), representing how much more likely a positive result is in someone with the disease compared with someone without it. An LR+ of 15 (well above 10) produces a large, often clinically decisive increase in post-test probability.$r$, 3),
('70000000-0000-0000-0000-000000000045', 'D', 'The test has a false positive rate of 15%', false,
 $r$Ruled out because LR+ is not the same as the false positive rate (1 - specificity); it is a ratio of the true positive rate to the false positive rate, not the false positive rate alone.$r$, 4),
('70000000-0000-0000-0000-000000000045', 'E', 'The test has a sensitivity of 15%', false,
 $r$Ruled out because LR+ is derived from both sensitivity and specificity combined, but is not itself equal to the sensitivity value.$r$, 5),

-- Q46 NNT calculation
('70000000-0000-0000-0000-000000000046', 'A', '20', true,
 $r$Correct. Absolute risk reduction = 20% - 15% = 5% (0.05). NNT = 1 / ARR = 1 / 0.05 = 20 patients need to be treated with the drug to prevent one additional stroke over 5 years.$r$, 1),
('70000000-0000-0000-0000-000000000046', 'B', '5', false,
 $r$Ruled out because 5 is the absolute risk reduction expressed as a percentage, not its reciprocal, which gives the NNT.$r$, 2),
('70000000-0000-0000-0000-000000000046', 'C', '4', false,
 $r$Ruled out because this would result from mistakenly using the relative risk reduction (25%) as if it were the absolute risk reduction (1/0.25 = 4), rather than the correct absolute risk reduction of 5%.$r$, 3),
('70000000-0000-0000-0000-000000000046', 'D', '100', false,
 $r$Ruled out because this reflects an arithmetic error in calculating the absolute risk reduction (e.g. using 1% instead of the correct 5%), not the correct NNT.$r$, 4),
('70000000-0000-0000-0000-000000000046', 'E', '15', false,
 $r$Ruled out because 15 is simply the event rate (%) in the treatment group, not a calculated NNT.$r$, 5),

-- Q47 RR vs OR / case-control study
('70000000-0000-0000-0000-000000000047', 'A', 'Relative risk, because it directly compares the incidence of cancer in exposed versus unexposed groups', false,
 $r$Ruled out because a case-control study samples participants based on outcome (disease status) rather than following a population forward from exposure, so true incidence, and therefore relative risk, cannot be directly calculated.$r$, 1),
('70000000-0000-0000-0000-000000000047', 'B', 'Attributable risk, because it quantifies the excess risk due to exposure', false,
 $r$Ruled out because attributable risk also requires known incidence rates in exposed and unexposed groups, which are unavailable from a case-control design.$r$, 2),
('70000000-0000-0000-0000-000000000047', 'C', 'Relative risk, because the rarity of the cancer makes the odds ratio an invalid approximation', false,
 $r$Ruled out because the rarity of the disease is precisely what makes the odds ratio a good approximation of relative risk, not a reason to distrust it; the fundamental issue remains that a case-control design does not permit direct incidence calculation at all.$r$, 3),
('70000000-0000-0000-0000-000000000047', 'D', 'Odds ratio, because participants are selected based on outcome (disease) status rather than followed forward from exposure, so the incidence needed for relative risk is unavailable', true,
 $r$Correct. In a case-control study, participants are selected by disease status and exposure is assessed retrospectively, so incidence cannot be calculated and relative risk cannot be derived directly. The odds ratio can still be calculated and, for a rare disease, closely approximates the relative risk a cohort study would have measured.$r$, 4),
('70000000-0000-0000-0000-000000000047', 'E', 'Number needed to treat, because this quantifies the clinical impact of the exposure', false,
 $r$Ruled out because NNT applies to interventions compared in trials, not to an observational study of an exposure-disease association, and cannot be derived from a case-control design.$r$, 5),

-- Q48 Confidence interval interpretation
('70000000-0000-0000-0000-000000000048', 'A', 'The drug significantly reduces the outcome, since the point estimate (0.85) shows a 15% relative risk reduction', false,
 $r$Ruled out because statistical significance is judged by whether the confidence interval excludes the null value (1 for a ratio measure), not by the point estimate alone; here the interval crosses 1.$r$, 1),
('70000000-0000-0000-0000-000000000048', 'B', 'The result is not statistically significant at the conventional 5% level, because the 95% confidence interval includes 1 (no effect)', true,
 $r$Correct. For a ratio measure such as relative risk, the null value is 1. Because the 95% confidence interval (0.70 to 1.05) spans 1, the result is not statistically significant at the conventional 5% level, even though the point estimate suggests a possible benefit.$r$, 2),
('70000000-0000-0000-0000-000000000048', 'C', 'The study definitively proves the drug has no effect on the outcome', false,
 $r$Ruled out because a non-significant result means the trial has not demonstrated a statistically significant effect, but does not prove the absence of any true effect (absence of evidence is not evidence of absence).$r$, 3),
('70000000-0000-0000-0000-000000000048', 'D', 'The confidence interval shows the drug is harmful in some patients and beneficial in others', false,
 $r$Ruled out because a confidence interval reflects the range of plausible values for the true population-level effect, not a description of variation in individual patient responses.$r$, 4),
('70000000-0000-0000-0000-000000000048', 'E', 'A 95% confidence interval means there is a 95% probability that this drug reduces risk in this specific patient', false,
 $r$Ruled out because this misinterprets the confidence interval, which is a statement about the reliability of the estimation procedure across repeated sampling, not a probability statement about an individual patient.$r$, 5),

-- Q49 Attrition bias chain
('70000000-0000-0000-0000-000000000049', 'A', 'Recall bias, because participants'' memory of exposure differs between groups', false,
 $r$Ruled out because recall bias applies to retrospective exposure ascertainment (e.g. in case-control studies), not to differential dropout occurring during follow-up in an ongoing cohort study.$r$, 1),
('70000000-0000-0000-0000-000000000049', 'B', 'Confounding, because an unmeasured third variable is influencing both treatment allocation and outcome', false,
 $r$Ruled out because confounding relates to a baseline imbalance in a variable associated with both exposure and outcome at the start of the study, not to differential loss during follow-up after enrolment.$r$, 2),
('70000000-0000-0000-0000-000000000049', 'C', 'Publication bias, because negative trials are less likely to be published', false,
 $r$Ruled out because publication bias concerns which completed studies reach publication, not what happens to participants within a single ongoing study.$r$, 3),
('70000000-0000-0000-0000-000000000049', 'D', 'Lead-time bias, because earlier detection makes survival appear longer without changing the disease course', false,
 $r$Ruled out because lead-time bias is specific to screening and early-diagnosis studies, not to differential dropout in a treatment comparison such as this one.$r$, 4),
('70000000-0000-0000-0000-000000000049', 'E', 'Attrition (differential loss to follow-up) bias, because patients doing poorly on the new drug were selectively removed from the analysis, leaving a residual treatment-arm sample enriched for good responders', true,
 $r$Correct. Patients doing badly on the new drug (side effects, perceived lack of benefit) were disproportionately lost to follow-up and excluded, enriching the remaining treatment-arm sample for good responders. This attrition bias artificially inflates the apparent benefit, meaning the reported effect size should not be taken at face value without checking how dropouts were handled (e.g. an intention-to-treat analysis).$r$, 5),

-- Q50 Incidence vs prevalence
('70000000-0000-0000-0000-000000000050', 'A', '4%, since incidence and prevalence are the same measure in a stable population', false,
 $r$Ruled out because 4% (2000/50,000) is actually the prevalence, and incidence and prevalence remain conceptually distinct measures even in a stable population.$r$, 1),
('70000000-0000-0000-0000-000000000050', 'B', '4.8%, calculated as 2400 total cases divided by 50,000', false,
 $r$Ruled out because this incorrectly combines existing and new cases into a single figure, rather than correctly restricting the incidence calculation to new cases among those at risk.$r$, 2),
('70000000-0000-0000-0000-000000000050', 'C', 'Approximately 0.83% per year, calculated as 400 new cases divided by the 48,000 people at risk (those without pre-existing disease); prevalence is instead a snapshot proportion of the whole population with the disease at one time point', true,
 $r$Correct. Incidence = new cases / population at risk over time = 400 / 48,000 = approximately 0.83% (about 8.3 per 1000 person-years). Prevalence (2000/50,000 = 4%) is a snapshot of existing disease at one point in time regardless of when it developed, a conceptually distinct measure from the rate of new cases.$r$, 3),
('70000000-0000-0000-0000-000000000050', 'D', '2%, calculated as 400 divided by the total population of 50,000', false,
 $r$Ruled out because this uses the whole population (including prevalent cases who are not at risk of becoming a new case) as the denominator, rather than correctly restricting it to the 48,000 people at risk.$r$, 4),
('70000000-0000-0000-0000-000000000050', 'E', '20%, calculated as 400 divided by the 2,000 existing cases', false,
 $r$Ruled out because this does not correspond to a meaningful epidemiological measure of either incidence or prevalence.$r$, 5)

on conflict (question_id, label) do nothing;

-- ---------------------------------------------------------------------------
-- Discriminators
-- ---------------------------------------------------------------------------

insert into question_discriminators (question_id, discriminator_text, sort_order) values

('70000000-0000-0000-0000-000000000001', 'Classic Li-Fraumeni syndrome triad: sarcoma, early-onset breast cancer and adrenocortical carcinoma across generations.', 1),
('70000000-0000-0000-0000-000000000001', 'p53 halts the cell cycle at the G1/S checkpoint in response to DNA damage, allowing repair or triggering apoptosis.', 2),
('70000000-0000-0000-0000-000000000001', 'TP53 mutation carriers develop multiple primary cancers at unusually young ages, inherited in an autosomal dominant pattern.', 3),

('70000000-0000-0000-0000-000000000002', 'Apoptosis is energy-dependent and regulated, with membrane integrity preserved until phagocytic clearance, producing no inflammation.', 1),
('70000000-0000-0000-0000-000000000002', 'DNA fragmentation into regular oligonucleosomal ladders reflects caspase-activated endonuclease activity.', 2),
('70000000-0000-0000-0000-000000000002', 'Necrosis, by contrast, involves cell swelling and membrane rupture, releasing cellular contents and provoking inflammation.', 3),

('70000000-0000-0000-0000-000000000003', 'Gs-coupled receptors activate adenylate cyclase, raising cAMP and activating protein kinase A.', 1),
('70000000-0000-0000-0000-000000000003', 'Beta-1 adrenoceptors increase cardiac contractility and heart rate via this cAMP/PKA pathway (positive inotropy and chronotropy).', 2),
('70000000-0000-0000-0000-000000000003', 'This contrasts with Gq-coupled receptors (IP3/DAG/calcium) and Gi-coupled receptors, which inhibit adenylate cyclase.', 3),

('70000000-0000-0000-0000-000000000004', 'Vincristine is metabolised by hepatic CYP3A4; drugs that inhibit this enzyme raise vincristine levels and toxicity risk.', 1),
('70000000-0000-0000-0000-000000000004', 'Azole antifungals (itraconazole, ketoconazole, voriconazole) are potent CYP3A4 inhibitors, a clinically important interaction with vinca alkaloids.', 2),
('70000000-0000-0000-0000-000000000004', 'Vincristine''s dose-limiting toxicity is a peripheral sensorimotor neuropathy and autonomic effects such as paralytic ileus, both worsened by drug accumulation.', 3),

('70000000-0000-0000-0000-000000000005', 'Desmosomes use desmoglein/desmocollin cadherins to anchor intermediate filaments between adjacent keratinocytes; loss of this adhesion causes acantholysis.', 1),
('70000000-0000-0000-0000-000000000005', 'Pemphigus vulgaris targets desmoglein, causing flaccid, easily ruptured intraepidermal blisters, unlike the tense subepidermal blisters of hemidesmosome-targeting bullous pemphigoid.', 2),
('70000000-0000-0000-0000-000000000005', 'IgG deposition in an intercellular ("chicken-wire") pattern on immunofluorescence reflects the desmosomal target.', 3),

('70000000-0000-0000-0000-000000000006', 'Mitochondria (and mitochondrial DNA) are inherited exclusively from the mother, so disease affects offspring of an affected mother of either sex but never offspring of an affected father.', 1),
('70000000-0000-0000-0000-000000000006', 'MELAS produces stroke-like lesions that do not respect single arterial territories, unlike a typical ischaemic stroke.', 2),
('70000000-0000-0000-0000-000000000006', 'Ragged red fibres on muscle biopsy reflect subsarcolemmal accumulation of abnormal mitochondria.', 3),

('70000000-0000-0000-0000-000000000007', 'The Na+/K+-ATPase hydrolyses ATP to pump 3 Na+ out and 2 K+ into the cell, maintaining the gradients underlying the resting potential.', 1),
('70000000-0000-0000-0000-000000000007', 'High resting membrane permeability to potassium (via leak channels) keeps the resting potential close to the potassium equilibrium potential.', 2),
('70000000-0000-0000-0000-000000000007', 'The pump''s electrogenic 3:2 stoichiometry makes a small direct hyperpolarising contribution in addition to setting up the gradients.', 3),

('70000000-0000-0000-0000-000000000008', 'Excessive stretching of the head away from the shoulder during difficult delivery injures the upper trunk (C5-C6) roots of the brachial plexus.', 1),
('70000000-0000-0000-0000-000000000008', 'Loss of biceps and deltoid/shoulder abductor function produces the classic adducted, internally rotated, extended "waiter''s tip" posture.', 2),
('70000000-0000-0000-0000-000000000008', 'Preserved hand/grip function (C8-T1) distinguishes Erb palsy from a total plexus injury or Klumpke palsy.', 3),

('70000000-0000-0000-0000-000000000009', 'Radial nerve compression in the spiral groove ("Saturday night palsy") from prolonged pressure on the mid-humerus causes wrist and finger drop with sensory loss over the first dorsal web space.', 1),
('70000000-0000-0000-0000-000000000009', 'Preserved triceps strength localises the lesion to below the branches supplying triceps, i.e. at or below the spiral groove.', 2),
('70000000-0000-0000-0000-000000000009', 'This differs from a posterior interosseous nerve lesion, which is purely motor and spares sensation.', 3),

('70000000-0000-0000-0000-000000000010', 'Median nerve compression under the flexor retinaculum causes sensory disturbance in the thumb, index, middle and radial half of the ring finger, plus thenar weakness.', 1),
('70000000-0000-0000-0000-000000000010', 'Tinel sign (tapping over the flexor retinaculum reproducing symptoms) supports a carpal tunnel level lesion.', 2),
('70000000-0000-0000-0000-000000000010', 'Hypothyroidism is a recognised association of carpal tunnel syndrome due to soft tissue swelling within the tunnel.', 3),

('70000000-0000-0000-0000-000000000011', 'The pupillomotor parasympathetic fibres run superficially in the CN III nerve sheath, making them vulnerable to compression but relatively spared in medical (microvascular) causes of CN III palsy.', 1),
('70000000-0000-0000-0000-000000000011', 'A posterior communicating artery aneurysm is anatomically adjacent to CN III, making it the classic compressive cause of a painful, pupil-involving third nerve palsy.', 2),
('70000000-0000-0000-0000-000000000011', 'Sudden severe ("thunderclap") headache accompanying the palsy raises concern for subarachnoid haemorrhage from aneurysm rupture, a neurosurgical emergency.', 3),

('70000000-0000-0000-0000-000000000012', 'MCA occlusion causes contralateral face and arm weakness greater than leg weakness, reflecting the larger cortical territory supplied for the face/arm homunculus.', 1),
('70000000-0000-0000-0000-000000000012', 'Involvement of the dominant hemisphere''s inferior frontal/superior temporal cortex explains the expressive dysphasia.', 2),
('70000000-0000-0000-0000-000000000012', 'Homonymous hemianopia occurs because the MCA territory includes optic radiation fibres.', 3),

('70000000-0000-0000-0000-000000000013', 'The recurrent laryngeal nerve runs close to the inferior thyroid artery and thyroid capsule, making it vulnerable during thyroid surgery.', 1),
('70000000-0000-0000-0000-000000000013', 'Unilateral RLN injury classically causes the ipsilateral vocal cord to lie in the paramedian position, producing a hoarse, breathy voice from glottic incompetence.', 2),
('70000000-0000-0000-0000-000000000013', 'This differs from superior laryngeal nerve injury, which weakens the voice without fixing the cord.', 3),

('70000000-0000-0000-0000-000000000014', 'Indirect inguinal hernias follow the pathway of the processus vaginalis, passing lateral to the inferior epigastric vessels through the deep inguinal ring and along the inguinal canal.', 1),
('70000000-0000-0000-0000-000000000014', 'Direct inguinal hernias instead bulge medial to the inferior epigastric vessels through Hesselbach triangle and rarely reach the scrotum.', 2),
('70000000-0000-0000-0000-000000000014', 'Indirect hernias are more likely to reach the scrotum because they follow the same route as testicular descent.', 3),

('70000000-0000-0000-0000-000000000015', 'Anion gap = Na - (Cl + HCO3); a normal range is roughly 8-16 mmol/L, and here it is markedly raised at 34.', 1),
('70000000-0000-0000-0000-000000000015', 'Diabetic ketoacidosis produces a raised anion gap metabolic acidosis because unmeasured ketoacid anions accumulate.', 2),
('70000000-0000-0000-0000-000000000015', 'A normal (or reduced) anion gap acidosis instead points to bicarbonate loss or chloride retention (e.g. diarrhoea, renal tubular acidosis), not ketoacidosis.', 3),

('70000000-0000-0000-0000-000000000016', 'HMG-CoA reductase catalyses the rate-limiting step of cholesterol biosynthesis (HMG-CoA to mevalonate).', 1),
('70000000-0000-0000-0000-000000000016', 'Reduced intracellular cholesterol synthesis upregulates hepatocyte LDL receptor expression, increasing clearance of circulating LDL cholesterol.', 2),
('70000000-0000-0000-0000-000000000016', 'This differs from PCSK9 inhibitors, which increase LDL receptor recycling by a separate mechanism.', 3),

('70000000-0000-0000-0000-000000000017', 'Phenylalanine hydroxylase converts phenylalanine to tyrosine; its deficiency causes phenylalanine (and phenylketone) accumulation.', 1),
('70000000-0000-0000-0000-000000000017', 'Untreated PKU causes severe intellectual disability from phenylalanine''s toxic effect on the developing brain, preventable by an early low-phenylalanine diet detected on newborn screening.', 2),
('70000000-0000-0000-0000-000000000017', 'This is distinct from tyrosinaemia and alkaptonuria, which involve enzymes further down the same tyrosine degradation pathway.', 3),

('70000000-0000-0000-0000-000000000018', 'Ornithine transcarbamylase (OTC) deficiency is the most common urea cycle defect and is uniquely X-linked, unlike the other urea cycle enzyme deficiencies, which are autosomal recessive.', 1),
('70000000-0000-0000-0000-000000000018', 'Impaired incorporation of ammonia into the urea cycle causes hyperammonaemia, which is directly neurotoxic and stimulates the respiratory centre, producing a respiratory alkalosis.', 2),
('70000000-0000-0000-0000-000000000018', 'Normal glucose and lactate help distinguish a urea cycle defect from an organic acidaemia or glycogen storage disease.', 3),

('70000000-0000-0000-0000-000000000019', 'Xanthine oxidase normally metabolises 6-mercaptopurine (the active metabolite of azathioprine) as part of purine breakdown; allopurinol competitively inhibits this enzyme.', 1),
('70000000-0000-0000-0000-000000000019', 'Co-prescription of allopurinol and azathioprine without a substantial dose reduction (typically to 25-33% of the original dose) raises active thiopurine levels and risks severe myelosuppression.', 2),
('70000000-0000-0000-0000-000000000019', 'This is a classic examinable competitive drug-enzyme interaction, where allopurinol''s therapeutic target enzyme is shared with a step in thiopurine detoxification.', 3),

('70000000-0000-0000-0000-000000000020', 'Acute intermittent porphyria is caused by porphobilinogen deaminase deficiency, causing accumulation of porphobilinogen and delta-aminolevulinic acid.', 1),
('70000000-0000-0000-0000-000000000020', 'Attacks are precipitated by drugs that induce hepatic ALA synthase (many antibiotics, anticonvulsants), fasting and alcohol.', 2),
('70000000-0000-0000-0000-000000000020', 'Unlike variegate porphyria or porphyria cutanea tarda, acute intermittent porphyria causes no cutaneous photosensitivity, only acute neurovisceral attacks.', 3),

('70000000-0000-0000-0000-000000000021', 'HGPRT deficiency prevents purine salvage, diverting hypoxanthine and guanine towards degradation into uric acid, causing marked hyperuricaemia.', 1),
('70000000-0000-0000-0000-000000000021', 'Lesch-Nyhan syndrome is X-linked recessive, affecting boys, with characteristic compulsive self-injurious behaviour and dystonia.', 2),
('70000000-0000-0000-0000-000000000021', 'This contrasts with gout from other causes, where self-injurious behaviour and neurodevelopmental features are absent.', 3),

('70000000-0000-0000-0000-000000000022', 'Isovolumetric contraction occurs between mitral valve closure and aortic valve opening, when ventricular pressure rises sharply at constant volume.', 1),
('70000000-0000-0000-0000-000000000022', 'This phase generates the pressure needed to exceed aortic diastolic pressure, at which point the aortic valve opens and ejection begins.', 2),
('70000000-0000-0000-0000-000000000022', 'It is distinguished from isovolumetric relaxation, which occurs between aortic valve closure and mitral valve opening, with falling pressure.', 3),

('70000000-0000-0000-0000-000000000023', 'Increased H+ (acidosis), CO2 and temperature all shift the oxygen-haemoglobin dissociation curve to the right, reducing haemoglobin''s affinity for oxygen.', 1),
('70000000-0000-0000-0000-000000000023', 'This is called the Bohr effect and is physiologically useful in exercising muscle, which is acidotic, hypercapnic and warm.', 2),
('70000000-0000-0000-0000-000000000023', 'The Haldane effect is a related but distinct phenomenon describing how haemoglobin''s oxygenation state affects its capacity to carry carbon dioxide and hydrogen ions.', 3),

('70000000-0000-0000-0000-000000000024', 'ADH acts on V2 receptors in collecting duct principal cells, inserting aquaporin-2 water channels into the luminal membrane.', 1),
('70000000-0000-0000-0000-000000000024', 'The medullary osmotic gradient that water moves down is generated by active NaCl reabsorption from the water-impermeable thick ascending limb (countercurrent multiplication).', 2),
('70000000-0000-0000-0000-000000000024', 'Without this gradient, aquaporin insertion alone could not concentrate urine, since water would have nowhere osmotically favourable to move to.', 3),

('70000000-0000-0000-0000-000000000025', 'Prolonged exogenous glucocorticoid therapy suppresses hypothalamic CRH and pituitary ACTH via negative feedback, leading to adrenal cortical atrophy.', 1),
('70000000-0000-0000-0000-000000000025', 'Abrupt cessation removes exogenous cortisol before the suppressed axis and atrophied adrenal cortex can recover enough to respond to a physiological stressor such as surgery.', 2),
('70000000-0000-0000-0000-000000000025', 'This is why oral corticosteroids should be tapered gradually after prolonged use, and doses increased to cover physiological stress.', 3),

('70000000-0000-0000-0000-000000000026', 'Beta-2 adrenoceptors on bronchial smooth muscle couple to Gs, raising cAMP and causing relaxation/bronchodilation.', 1),
('70000000-0000-0000-0000-000000000026', 'The same receptor subtype in skeletal muscle and, to a lesser extent, the heart explains salbutamol''s dose-dependent tremor and tachycardia.', 2),
('70000000-0000-0000-0000-000000000026', 'This selectivity is relative, not absolute, which is why high doses can still produce some beta-1-mediated cardiac effects.', 3),

('70000000-0000-0000-0000-000000000027', 'Carotid sinus and aortic arch baroreceptors are stretch receptors that increase firing as arterial pressure rises and reduce firing as it falls.', 1),
('70000000-0000-0000-0000-000000000027', 'A fall in baroreceptor afferent firing reduces vagal tone and increases sympathetic outflow, producing reflex tachycardia and vasoconstriction.', 2),
('70000000-0000-0000-0000-000000000027', 'This reflex acts within seconds, much faster than hormonal mechanisms such as the renin-angiotensin-aldosterone system.', 3),

('70000000-0000-0000-0000-000000000028', 'Malignant hyperthermia is caused by a mutation in the ryanodine receptor (RYR1), triggered by volatile anaesthetics and suxamethonium.', 1),
('70000000-0000-0000-0000-000000000028', 'Uncontrolled calcium release from the sarcoplasmic reticulum causes sustained muscle contraction (rigidity), a hypermetabolic state, and marked heat and creatine kinase release.', 2),
('70000000-0000-0000-0000-000000000028', 'This differs from neuroleptic malignant syndrome, which is triggered by antipsychotic (dopamine-blocking) drugs and has a distinct central mechanism.', 3),

('70000000-0000-0000-0000-000000000029', 'Albumin is the main determinant of plasma oncotic pressure, which normally opposes capillary hydrostatic pressure.', 1),
('70000000-0000-0000-0000-000000000029', 'Severe hypoalbuminaemia reduces plasma oncotic pressure, shifting the Starling balance towards net fluid filtration into the interstitium.', 2),
('70000000-0000-0000-0000-000000000029', 'This mechanism of oedema differs from that of heart failure, where oedema is instead driven mainly by raised capillary hydrostatic pressure.', 3),

('70000000-0000-0000-0000-000000000030', 'Autosomal dominant conditions appear in every generation, affect both sexes equally, and transmit from an affected parent to roughly half of offspring.', 1),
('70000000-0000-0000-0000-000000000030', 'Huntington disease is a classic autosomal dominant neurodegenerative condition caused by a CAG trinucleotide repeat expansion.', 2),
('70000000-0000-0000-0000-000000000030', 'This direct, non-skipping transmission distinguishes autosomal dominant inheritance from autosomal recessive conditions, which typically appear to skip generations.', 3),

('70000000-0000-0000-0000-000000000031', 'Genetic anticipation describes a condition presenting at an earlier age and/or with greater severity in successive generations.', 1),
('70000000-0000-0000-0000-000000000031', 'This occurs in trinucleotide repeat disorders because the repeat is unstable and tends to expand further during meiosis.', 2),
('70000000-0000-0000-0000-000000000031', 'Larger repeat expansions correlate with earlier onset and more severe disease, explaining the progression seen across the three generations here.', 3),

('70000000-0000-0000-0000-000000000032', 'Genomic imprinting means some genes are expressed from only one parental allele, with the other allele epigenetically silenced.', 1),
('70000000-0000-0000-0000-000000000032', 'Deletion of the paternally active genes in 15q11-13 causes Prader-Willi syndrome, because the maternal copy is normally silent.', 2),
('70000000-0000-0000-0000-000000000032', 'Deletion of the maternally active UBE3A gene in the same region causes Angelman syndrome, because the paternal copy is normally silent.', 3),

('70000000-0000-0000-0000-000000000033', 'Turner syndrome (45,X) is caused by complete or partial absence of one X chromosome in a phenotypic female.', 1),
('70000000-0000-0000-0000-000000000033', 'Classic features include short stature, webbed neck, widely spaced nipples, wide carrying angle and gonadal dysgenesis causing primary amenorrhoea.', 2),
('70000000-0000-0000-0000-000000000033', 'Noonan syndrome can mimic some physical features but has a normal karyotype and can occur in males, distinguishing it from Turner syndrome.', 3),

('70000000-0000-0000-0000-000000000034', 'Both parents of a child with an autosomal recessive condition are obligate heterozygous carriers, even though they are themselves unaffected.', 1),
('70000000-0000-0000-0000-000000000034', 'Two carrier parents (Aa x Aa) have a 1 in 4 chance with each pregnancy of an affected (aa) child.', 2),
('70000000-0000-0000-0000-000000000034', 'This recurrence risk is the same for every pregnancy, independent of the outcome of previous pregnancies.', 3),

('70000000-0000-0000-0000-000000000035', 'X-linked recessive conditions affect males far more often and severely than females, who are usually unaffected or mildly affected carriers.', 1),
('70000000-0000-0000-0000-000000000035', 'No male-to-male transmission occurs, because fathers pass their Y (not X) chromosome to sons; affected males transmit the allele to all daughters, who become carriers.', 2),
('70000000-0000-0000-0000-000000000035', 'Duchenne muscular dystrophy, caused by dystrophin gene mutations, is a classic severe X-linked recessive condition presenting in early childhood.', 3),

('70000000-0000-0000-0000-000000000036', 'Expressivity describes how severely a phenotype is expressed among individuals who do show features, and can vary widely even within one family.', 1),
('70000000-0000-0000-0000-000000000036', 'Penetrance describes the proportion of individuals with a given genotype who show any phenotype at all; incomplete penetrance means some carriers are entirely asymptomatic.', 2),
('70000000-0000-0000-0000-000000000036', 'These concepts are independent: a condition can show both variable expressivity among affected individuals and incomplete penetrance in some carriers simultaneously.', 3),

('70000000-0000-0000-0000-000000000037', 'Type I hypersensitivity is mediated by pre-formed allergen-specific IgE on mast cells/basophils; allergen cross-linking triggers immediate degranulation.', 1),
('70000000-0000-0000-0000-000000000037', 'Onset is within minutes of re-exposure, reflecting the immediate, pre-formed nature of the antibody response.', 2),
('70000000-0000-0000-0000-000000000037', 'Histamine, leukotrienes and other mediators cause the vasodilation, increased permeability and bronchoconstriction seen in anaphylaxis.', 3),

('70000000-0000-0000-0000-000000000038', 'Type II hypersensitivity involves antibody binding directly to a fixed antigen on a cell surface or in the extracellular matrix.', 1),
('70000000-0000-0000-0000-000000000038', 'In Goodpasture disease, autoantibodies target type IV collagen in the glomerular basement membrane, producing a linear immunofluorescence pattern, distinct from the granular pattern of immune-complex disease.', 2),
('70000000-0000-0000-0000-000000000038', 'Complement activation and inflammatory cell recruitment at the site of antibody binding drives glomerulonephritis and pulmonary haemorrhage.', 3),

('70000000-0000-0000-0000-000000000039', 'Type III hypersensitivity involves antigen-antibody immune complexes forming in the circulation and depositing in vessel walls and tissues.', 1),
('70000000-0000-0000-0000-000000000039', 'Complement activation by deposited immune complexes attracts neutrophils, whose enzyme release causes local tissue damage.', 2),
('70000000-0000-0000-0000-000000000039', 'The 1-2 week delay reflects the time needed to mount an antibody response against the foreign antigen before immune complexes can form.', 3),

('70000000-0000-0000-0000-000000000040', 'Type IV (delayed-type) hypersensitivity is mediated by sensitised T lymphocytes and macrophages rather than antibody, typically taking 48-72 hours to develop.', 1),
('70000000-0000-0000-0000-000000000040', 'Allergic contact dermatitis to nickel is a classic example, where the metal acts as a hapten binding skin proteins to become immunogenic.', 2),
('70000000-0000-0000-0000-000000000040', 'Patch testing exploits this delayed mechanism, reading the skin reaction 48-96 hours after allergen application.', 3),

('70000000-0000-0000-0000-000000000041', 'C1 esterase inhibitor normally restrains classical complement pathway activation and the kallikrein-kinin (contact) system; its deficiency allows excess bradykinin generation.', 1),
('70000000-0000-0000-0000-000000000041', 'Bradykinin-mediated angioedema does not involve mast cell histamine release, explaining why antihistamines, corticosteroids and adrenaline are ineffective.', 2),
('70000000-0000-0000-0000-000000000041', 'Low C4 with normal C3 is a characteristic biochemical clue to hereditary angioedema, especially during acute attacks.', 3),

('70000000-0000-0000-0000-000000000042', 'Bruton X-linked agammaglobulinaemia is caused by BTK mutations blocking B lymphocyte maturation, resulting in absent circulating B cells and panhypogammaglobulinaemia with normal T cell numbers.', 1),
('70000000-0000-0000-0000-000000000042', 'Affected infants are typically well for the first few months due to passive protection from transplacental maternal IgG, becoming symptomatic as this wanes from around 3-6 months.', 2),
('70000000-0000-0000-0000-000000000042', 'Recurrent infections are typically with encapsulated bacteria (Streptococcus pneumoniae, Haemophilus influenzae), which normally require antibody for effective clearance.', 3),

('70000000-0000-0000-0000-000000000043', 'Hyperacute rejection occurs within minutes to hours of graft reperfusion because the recipient already has preformed antibodies against donor ABO or HLA antigens.', 1),
('70000000-0000-0000-0000-000000000043', 'Antibody binding to donor vascular endothelium activates complement, causing rapid intravascular thrombosis and infarction of the graft.', 2),
('70000000-0000-0000-0000-000000000043', 'Pre-transplant crossmatching and ABO compatibility testing are designed to detect preformed antibodies and prevent this largely untreatable form of rejection.', 3),

('70000000-0000-0000-0000-000000000044', 'Sensitivity = true positives / (true positives + false negatives), the proportion of those with the disease who test positive.', 1),
('70000000-0000-0000-0000-000000000044', 'Specificity = true negatives / (true negatives + false positives); it answers a different clinical question from sensitivity even when the two values coincide numerically.', 2),
('70000000-0000-0000-0000-000000000044', 'Positive and negative predictive values depend on disease prevalence in the tested population, unlike sensitivity and specificity, which are intrinsic properties of the test.', 3),

('70000000-0000-0000-0000-000000000045', 'LR+ = sensitivity / (1 - specificity), representing how much more likely a positive result is in someone with the disease than without it.', 1),
('70000000-0000-0000-0000-000000000045', 'An LR+ greater than 10 produces a large, often clinically decisive increase in post-test probability of disease.', 2),
('70000000-0000-0000-0000-000000000045', 'Likelihood ratios, unlike predictive values, do not depend on disease prevalence, making them more portable across different patient populations.', 3),

('70000000-0000-0000-0000-000000000046', 'NNT = 1 / absolute risk reduction (ARR), where ARR is the difference in event rates between control and treatment groups (here 5%, or 0.05).', 1),
('70000000-0000-0000-0000-000000000046', 'NNT should not be confused with relative risk reduction, which here is 25%, a different (and usually more impressive-looking) statistic.', 2),
('70000000-0000-0000-0000-000000000046', 'A lower NNT indicates a more effective treatment, since fewer patients need to be treated to prevent one additional event.', 3),

('70000000-0000-0000-0000-000000000047', 'In a case-control study, participants are selected based on disease status and exposure is assessed retrospectively, so incidence cannot be calculated.', 1),
('70000000-0000-0000-0000-000000000047', 'The odds ratio can still be calculated from a case-control study and, for a rare disease, closely approximates the relative risk a cohort study would have measured directly.', 2),
('70000000-0000-0000-0000-000000000047', 'Cohort studies and RCTs, which follow participants forward from exposure/allocation to outcome, allow direct calculation of incidence and therefore relative risk.', 3),

('70000000-0000-0000-0000-000000000048', 'For a ratio measure (relative risk or odds ratio), the null value is 1; if the 95% confidence interval spans 1, the result is not statistically significant at the 5% level.', 1),
('70000000-0000-0000-0000-000000000048', 'A wide confidence interval crossing the null is often seen with an underpowered study and does not exclude a true effect existing.', 2),
('70000000-0000-0000-0000-000000000048', 'Non-significance should not be equated with proof of no effect; it means the study could not statistically distinguish the observed result from no effect.', 3),

('70000000-0000-0000-0000-000000000049', 'Attrition bias arises when the proportion (or type) of participants lost to follow-up differs between study arms, distorting the comparison.', 1),
('70000000-0000-0000-0000-000000000049', 'Here, patients doing badly on the new drug were disproportionately excluded, enriching the remaining treatment-arm sample for good responders.', 2),
('70000000-0000-0000-0000-000000000049', 'This artificially inflates the apparent benefit, meaning the reported effect size should not be taken at face value without checking how dropouts were handled (e.g. intention-to-treat analysis).', 3),

('70000000-0000-0000-0000-000000000050', 'Incidence measures the rate of new cases arising over a defined period among those at risk (excluding those who already have the disease).', 1),
('70000000-0000-0000-0000-000000000050', 'Prevalence measures the proportion of the whole population with the disease at a single point in time, regardless of how long ago each case developed.', 2),
('70000000-0000-0000-0000-000000000050', 'In a disease with a long duration, prevalence can be much higher than incidence would suggest, since prevalent cases accumulate over time (prevalence approximates incidence x average disease duration in a stable population).', 3);

