-- MRCP Part 1 — Dermatology batch 1 (50 questions). This is the first
-- Dermatology batch for this topic, which previously had zero questions, so
-- it aims for broad coverage: skin cancer recognition (BCC/SCC/melanoma,
-- ABCDE, referral pathways), acne management ladder, cellulitis vs
-- erysipelas, urticaria/angioedema/anaphylaxis, atopic eczema and eczema
-- herpeticum, psoriasis subtypes/nail changes/psoriatic arthritis/systemic
-- therapy, Henoch-Schonlein purpura, dermatomyositis/polymyositis and
-- malignancy association, dermatitis herpetiformis and coeliac disease,
-- drug eruptions (fixed and morbilliform), erythema nodosum, erythema
-- multiforme/Stevens-Johnson syndrome/toxic epidermal necrolysis,
-- pemphigus vulgaris vs bullous pemphigoid, benign vs malignant lesion
-- differentiation, fungal infections, scabies, lichen planus, vitiligo,
-- rosacea, hidradenitis suppurativa, pressure ulcer staging, diabetic foot
-- care, burns assessment, skin signs of systemic disease (necrobiosis
-- lipoidica, pyoderma gangrenosum, acanthosis nigricans, xanthelasma),
-- herpes zoster (including ophthalmic zoster and Ramsay Hunt syndrome),
-- molluscum contagiosum, viral warts, alopecia subtypes, hyperhidrosis and
-- skin signs of thyroid disease.
--
-- STATUS: status='published' — per explicit instruction from the person
-- who commissioned this batch, these questions are inserted directly as
-- published (no draft-then-review step for this batch). This content has
-- NOT been individually reviewed by a clinician or MRCP-specific medical
-- educator; it has been checked by the writing model against standard UK
-- reference sources (NICE guidance including NG198 acne, NG19 diabetic
-- foot problems, NG12/2WW referral criteria for suspected cancer, CG179/
-- NICE quality standards on pressure ulcers; British Association of
-- Dermatologists guidelines on urticaria/angioedema, psoriasis and
-- rosacea; Resuscitation Council UK anaphylaxis guidance; National Burn
-- Care Referral Guidance; standard MRCP1-level textbook physiology and
-- immunology) to a solid standard, but has not been checked by a human
-- with relevant clinical expertise.
--
-- Run after the topics migrations (0001-0004) and seed.sql, via the SQL
-- Editor.

insert into questions (id, exam, topic_id, status, difficulty, stem, lead_in, tags) values

-- 1. BCC vs SCC differentiation
(
  '40000000-0000-0000-0000-000000000001', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$Two patients attend the dermatology clinic with new lesions on sun-exposed skin.

Patient 1: a 74-year-old man has a 1 cm pearly, translucent papule on the nasal ala with overlying telangiectasia and a rolled, well-defined edge. It has grown slowly over 18 months and has never bled spontaneously.

Patient 2: a 69-year-old former roofer has a 2 cm firm, indurated nodule on the dorsum of his right hand with a central hyperkeratotic crust and ulceration. It has grown noticeably over the past 8 weeks and bleeds easily on minor contact.$stem$,
  'Which of these two lesions carries the greater risk of metastasis if left untreated?',
  array['skin cancer','basal cell carcinoma','squamous cell carcinoma','differentiation']
),

-- 2. Melanoma ABCDE + Breslow thickness
(
  '40000000-0000-0000-0000-000000000002', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$A 45-year-old woman is concerned about a mole on her calf that her partner says has changed. Examination shows a 9 mm pigmented lesion with an irregular, notched border, asymmetrical shape, and three shades of brown and black within it. She reports it has grown over the past 4 months.$stem$,
  'What is the most appropriate immediate action?',
  array['melanoma','ABCDE criteria','urgent referral']
),

-- 3. Chronic sun exposure -> actinic keratosis -> SCC in transplant patient
(
  '40000000-0000-0000-0000-000000000003', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'advanced',
  $stem$A 61-year-old man had a renal transplant 9 years ago and remains on long-term ciclosporin and azathioprine. He has widespread actinic keratoses on his scalp and forearms, previously managed with cryotherapy. He now presents with a rapidly enlarging, indurated, ulcerated nodule on his forearm that has grown over the last 6 weeks and bleeds when knocked.$stem$,
  'What is the most likely explanation for this new lesion?',
  array['actinic keratosis','squamous cell carcinoma','immunosuppression','chain reasoning']
),

-- 4. Acne vulgaris management ladder - first-line
(
  '40000000-0000-0000-0000-000000000004', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'foundation',
  $stem$A 16-year-old boy has mild-to-moderate facial acne with open and closed comedones and a small number of inflammatory papules. He has not tried any treatment before.$stem$,
  'What is the most appropriate first-line treatment?',
  array['acne vulgaris','management ladder','topical therapy']
),

-- 5. Cellulitis vs erysipelas
(
  '40000000-0000-0000-0000-000000000005', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$A 58-year-old man presents with a 2-day history of a red, warm, tender area on his lower leg. On examination, the affected area has a sharply demarcated, raised edge, with clear separation from the surrounding normal skin. He has a mild fever but is otherwise systemically well, with no significant comorbidities.$stem$,
  'What is the most likely diagnosis and most appropriate first-line oral antibiotic if he is treated as an outpatient?',
  array['erysipelas','cellulitis','antibiotic choice']
),

-- 6. Chronic urticaria first-line antihistamine
(
  '40000000-0000-0000-0000-000000000006', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'foundation',
  $stem$A 34-year-old woman has had recurrent itchy wheals affecting different areas of her skin most days for the past 3 months, with no identifiable trigger. She has no angioedema and no systemic symptoms.$stem$,
  'What is the most appropriate first-line treatment?',
  array['chronic urticaria','antihistamine']
),

-- 7. Acute urticaria + anaphylaxis red flags
(
  '40000000-0000-0000-0000-000000000007', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$A 22-year-old woman develops widespread itchy wheals and facial swelling minutes after eating a meal containing peanuts. She now has audible stridor, a hoarse voice and wheeze, with BP 82/50 mmHg.$stem$,
  'What is the most appropriate immediate treatment?',
  array['anaphylaxis','angioedema','adrenaline']
),

-- 8. ACE inhibitor-induced angioedema
(
  '40000000-0000-0000-0000-000000000008', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'advanced',
  $stem$A 64-year-old man who has taken ramipril for hypertension for 3 years presents with sudden swelling of his lips and tongue. There is no urticarial rash, no preceding itch, and no history of any new food, drug or insect sting exposure. He has never had this reaction before.$stem$,
  'What is the most likely mechanism underlying this presentation?',
  array['angioedema','ACE inhibitor','bradykinin']
),

-- 9. Atopic eczema features + eosinophilia
(
  '40000000-0000-0000-0000-000000000009', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$A 6-year-old boy has an itchy, dry, erythematous rash affecting the antecubital and popliteal fossae, present intermittently since infancy. He also has asthma, and his mother has hay fever. Full blood count shows a mild peripheral eosinophilia.$stem$,
  'What is the most likely diagnosis?',
  array['atopic eczema','eosinophilia','atopy']
),

-- 10. Eczema herpeticum
(
  '40000000-0000-0000-0000-000000000010', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'advanced',
  $stem$A 4-year-old girl with longstanding atopic eczema develops a rapidly spreading cluster of small, monomorphic, punched-out vesicles and erosions over her eczematous cheek and neck, 2 days after close contact with her uncle, who has active cold sores. She is now febrile and miserable.$stem$,
  'What is the most appropriate immediate management?',
  array['eczema herpeticum','HSV','emergency']
),

-- 11. Chronic plaque psoriasis
(
  '40000000-0000-0000-0000-000000000011', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'foundation',
  $stem$A 40-year-old man has well-demarcated, erythematous plaques with silvery-white scale over both elbows and knees, present for several years. Gently removing the scale produces small points of bleeding.$stem$,
  'What is the most likely diagnosis?',
  array['chronic plaque psoriasis','Auspitz sign']
),

-- 12. Guttate psoriasis
(
  '40000000-0000-0000-0000-000000000012', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$A 14-year-old girl develops widespread small, erythematous, scaly, "drop-like" papules over her trunk and proximal limbs over the course of a few days. She had a sore throat with confirmed streptococcal pharyngitis 2 weeks earlier.$stem$,
  'What is the most likely diagnosis?',
  array['guttate psoriasis','streptococcal infection']
),

-- 13. Generalised pustular psoriasis (von Zumbusch)
(
  '40000000-0000-0000-0000-000000000013', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'advanced',
  $stem$A 52-year-old woman with chronic plaque psoriasis abruptly stopped a course of oral prednisolone that had been given for an unrelated chest complaint. She now presents acutely unwell with fever, malaise and widespread sheets of erythema studded with numerous sterile pustules covering most of her body surface.$stem$,
  'What is the most appropriate management?',
  array['pustular psoriasis','von Zumbusch','emergency admission']
),

-- 14. Psoriasis nail changes, arthritis and systemic therapy
(
  '40000000-0000-0000-0000-000000000014', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'advanced',
  $stem$A 47-year-old man with extensive chronic plaque psoriasis affecting more than 20% of his body surface area has nail pitting, onycholysis and swelling of several distal interphalangeal joints with dactylitis of two toes. Topical vitamin D analogues, topical corticosteroids and narrowband UVB phototherapy have all failed to control his skin disease.$stem$,
  'What is the most appropriate next step in his management?',
  array['psoriatic arthritis','nail changes','methotrexate','systemic therapy']
),

-- 15. HSP tetrad and renal involvement
(
  '40000000-0000-0000-0000-000000000015', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'advanced',
  $stem$A 6-year-old boy develops palpable purpura over his buttocks and extensor lower legs, 10 days after an upper respiratory tract infection. He also has abdominal pain and swollen, painful ankles. Urinalysis shows microscopic haematuria and proteinuria.$stem$,
  'What is the most likely diagnosis, and what determines his long-term prognosis?',
  array['Henoch-Schonlein purpura','IgA nephropathy','renal prognosis']
),

-- 16. Dermatomyositis skin signs
(
  '40000000-0000-0000-0000-000000000016', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'foundation',
  $stem$A 55-year-old woman presents with a violaceous, oedematous rash around both eyes and violaceous, scaly papules over the extensor surfaces of her metacarpophalangeal and interphalangeal joints. She also reports increasing difficulty climbing stairs and combing her hair over the last 2 months.$stem$,
  'What are the two named skin signs described in this vignette?',
  array['dermatomyositis','heliotrope rash','Gottron papules']
),

-- 17. Dermatomyositis and occult malignancy
(
  '40000000-0000-0000-0000-000000000017', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'advanced',
  $stem$A 68-year-old woman presents with a new heliotrope rash, Gottron papules and progressive proximal muscle weakness. Creatine kinase is markedly elevated. She has lost 6 kg in weight over the past 3 months without trying to.$stem$,
  'What is the most appropriate next step in her investigation?',
  array['dermatomyositis','malignancy screening','chain reasoning']
),

-- 18. Dermatitis herpetiformis - coeliac and dapsone
(
  '40000000-0000-0000-0000-000000000018', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'foundation',
  $stem$A 38-year-old man has an intensely itchy, vesicular rash symmetrically distributed over his elbows, knees and buttocks. Skin biopsy shows granular IgA deposition at the dermo-epidermal junction, and coeliac serology is strongly positive.$stem$,
  'What is the most appropriate first-line treatment to rapidly control his skin symptoms?',
  array['dermatitis herpetiformis','coeliac disease','dapsone']
),

-- 19. Coeliac -> DH -> malabsorption -> iron-deficiency anaemia
(
  '40000000-0000-0000-0000-000000000019', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'advanced',
  $stem$A 29-year-old woman has had an itchy vesicular rash over her elbows and knees for 2 years, previously dismissed as eczema and treated with emollients alone with little effect. She has continued to eat a normal diet throughout. She now presents with fatigue and is found to have microcytic anaemia with a low ferritin.$stem$,
  'What is the most likely underlying explanation linking her rash and her anaemia?',
  array['dermatitis herpetiformis','coeliac disease','iron deficiency anaemia','chain reasoning']
),

-- 20. Fixed drug eruption
(
  '40000000-0000-0000-0000-000000000020', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$A 40-year-old man develops a well-demarcated, round, dusky red-violet plaque on his forearm each time he takes co-trimoxazole for recurrent urinary tract infections, always appearing at exactly the same site within hours of the dose and slowly fading to leave residual hyperpigmentation.$stem$,
  'What is the most likely diagnosis?',
  array['fixed drug eruption','co-trimoxazole']
),

-- 21. Morbilliform drug rash - amoxicillin and EBV
(
  '40000000-0000-0000-0000-000000000021', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$A 19-year-old university student is given amoxicillin for a presumed bacterial tonsillitis. Three days later he develops a widespread, itchy, maculopapular rash. He also has marked cervical lymphadenopathy, splenomegaly and atypical lymphocytes on his blood film.$stem$,
  'What is the most likely explanation for his rash?',
  array['morbilliform rash','amoxicillin','infectious mononucleosis']
),

-- 22. Erythema nodosum causes
(
  '40000000-0000-0000-0000-000000000022', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$A 24-year-old woman develops tender, erythematous nodules over both shins, alongside bilateral hilar lymphadenopathy on chest X-ray and mild breathlessness. She has no gastrointestinal symptoms and no recent sore throat.$stem$,
  'What is the most likely underlying cause of her erythema nodosum?',
  array['erythema nodosum','sarcoidosis']
),

-- 23. IBD flare -> erythema nodosum vs pyoderma gangrenosum
(
  '40000000-0000-0000-0000-000000000023', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'advanced',
  $stem$A 31-year-old woman with known ulcerative colitis is currently in clinical remission on maintenance mesalazine. She develops a small pustule on her shin that rapidly breaks down over 48 hours into a painful, rapidly enlarging ulcer with a violaceous, undermined border, without any preceding trauma.$stem$,
  'What does this new finding most likely indicate about her underlying bowel disease?',
  array['pyoderma gangrenosum','inflammatory bowel disease','erythema nodosum','chain reasoning']
),

-- 24. Erythema multiforme
(
  '40000000-0000-0000-0000-000000000024', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'foundation',
  $stem$A 26-year-old man develops multiple target-shaped lesions, each with a dusky central zone, a pale ring and an erythematous outer border, over his hands and forearms. He had a cold sore 10 days earlier.$stem$,
  'What is the most likely diagnosis?',
  array['erythema multiforme','target lesions','HSV']
),

-- 25. SJS vs TEN
(
  '40000000-0000-0000-0000-000000000025', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$A 50-year-old man started allopurinol 3 weeks ago for gout. He now has widespread painful erythema, mucosal ulceration of his mouth and eyes, and a positive Nikolsky sign, with epidermal detachment estimated at 35% of his total body surface area.$stem$,
  'What is the most likely diagnosis?',
  array['toxic epidermal necrolysis','allopurinol','Nikolsky sign']
),

-- 26. Pemphigus vulgaris
(
  '40000000-0000-0000-0000-000000000026', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'foundation',
  $stem$A 55-year-old woman presents with painful oral erosions followed by flaccid, easily ruptured skin blisters. Gentle lateral pressure on apparently normal skin causes it to shear away.$stem$,
  'Which autoantibody is most closely associated with this condition?',
  array['pemphigus vulgaris','desmoglein','Nikolsky sign']
),

-- 27. Bullous pemphigoid
(
  '40000000-0000-0000-0000-000000000027', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$An 82-year-old man develops several large, tense, fluid-filled blisters on his forearms and trunk over a few weeks, arising on a background of itchy, urticated plaques. His oral mucosa is unaffected, and lateral pressure on normal-looking skin does not cause it to shear.$stem$,
  'What is the most likely diagnosis?',
  array['bullous pemphigoid','BP180','subepidermal blister']
),

-- 28. AK vs SK vs melanoma differentiation
(
  '40000000-0000-0000-0000-000000000028', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$A 70-year-old man has three skin lesions reviewed in one clinic visit.

Lesion 1: a well-demarcated, warty, waxy, brown plaque on his back with a "stuck-on" appearance, unchanged for years.

Lesion 2: a rough, scaly, erythematous macule on his bald scalp that feels like sandpaper.

Lesion 3: an asymmetrical, irregularly bordered pigmented lesion on his calf with multiple colours, which his wife says has enlarged over the last 3 months.$stem$,
  'Which lesion requires urgent two-week-wait referral for suspected malignancy?',
  array['seborrhoeic keratosis','actinic keratosis','melanoma','differentiation']
),

-- 29. Tinea corporis
(
  '40000000-0000-0000-0000-000000000029', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'foundation',
  $stem$A 27-year-old man has an itchy, annular, scaly plaque on his forearm with a well-defined, slightly raised, active edge and central clearing. Skin scrapings show fungal hyphae on microscopy.$stem$,
  'What is the most appropriate first-line treatment for this localised lesion?',
  array['tinea corporis','dermatophyte','topical antifungal']
),

-- 30. Candidal intertrigo
(
  '40000000-0000-0000-0000-000000000030', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'foundation',
  $stem$An 82-year-old woman with poorly controlled type 2 diabetes and obesity has sore, erythematous, macerated skin in the inframammary and groin folds, with small satellite papules and pustules extending beyond the main margin.$stem$,
  'What is the most likely diagnosis?',
  array['candidal intertrigo','diabetes']
),

-- 31. Scabies
(
  '40000000-0000-0000-0000-000000000031', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$A 25-year-old man presents with intensely itchy papules and linear burrows in the finger webs and around the wrists, worse at night. His girlfriend, with whom he lives, has recently developed a similar itchy rash but has not yet been treated.$stem$,
  'What is the most appropriate management?',
  array['scabies','permethrin','contact treatment']
),

-- 32. Lichen planus
(
  '40000000-0000-0000-0000-000000000032', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$A 46-year-old woman has intensely itchy, flat-topped, violaceous, polygonal papules on the flexor surfaces of both wrists, with fine white lacy lines visible on the surface of the papules. She also has similar white lacy streaks on her buccal mucosa.$stem$,
  'What is the most likely diagnosis?',
  array['lichen planus','Wickham striae']
),

-- 33. Vitiligo autoimmune association
(
  '40000000-0000-0000-0000-000000000033', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'foundation',
  $stem$A 30-year-old woman has well-demarcated, symmetrical, completely depigmented (not merely pale) patches of skin around her eyes and on the backs of her hands.$stem$,
  'Which other condition is she at greatest increased risk of, given this diagnosis?',
  array['vitiligo','autoimmune thyroid disease']
),

-- 34. Rosacea management
(
  '40000000-0000-0000-0000-000000000034', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$A 48-year-old woman has persistent central facial erythema, visible telangiectasia and papulopustules over her cheeks and nose, with no comedones. Symptoms are worsened by sunlight, alcohol and spicy food.$stem$,
  'What is the most appropriate first-line topical treatment?',
  array['rosacea','topical metronidazole']
),

-- 35. Hidradenitis suppurativa
(
  '40000000-0000-0000-0000-000000000035', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$A 33-year-old woman who smokes and has obesity presents with recurrent, painful nodules and abscesses in both axillae and the groin over several years, now with sinus tract formation and scarring.$stem$,
  'Alongside long-term antibiotics, what is the most important modifiable lifestyle measure to address?',
  array['hidradenitis suppurativa','smoking cessation']
),

-- 36. Pressure ulcer staging and prevention
(
  '40000000-0000-0000-0000-000000000036', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'foundation',
  $stem$A bedbound 84-year-old man in a nursing home is found to have a sacral area of full-thickness skin loss with visible subcutaneous fat, but no exposed bone, tendon or muscle.$stem$,
  'What pressure ulcer category/grade does this represent?',
  array['pressure ulcer','staging']
),

-- 37. Diabetic foot prevention and education
(
  '40000000-0000-0000-0000-000000000037', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$A 60-year-old man with type 2 diabetes attends his annual diabetic review. He has never had a foot problem and his feet look normal today.$stem$,
  'What is the most appropriate routine assessment to perform to guide his ongoing foot care?',
  array['diabetic foot','prevention','risk stratification']
),

-- 38. Diabetes -> foot ulcer -> osteomyelitis
(
  '40000000-0000-0000-0000-000000000038', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'advanced',
  $stem$A 67-year-old man with poorly controlled type 2 diabetes (HbA1c 98 mmol/mol) and known peripheral neuropathy has had a non-healing ulcer over his first metatarsal head for 6 weeks, which he only noticed when he saw blood on his sock. It is now malodourous with surrounding erythema, and a probe passed through the base of the ulcer reaches hard, gritty tissue.$stem$,
  'What is the most likely explanation for this finding?',
  array['diabetic foot ulcer','osteomyelitis','chain reasoning']
),

-- 39. Burns depth, %TBSA and Parkland formula
(
  '40000000-0000-0000-0000-000000000039', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'advanced',
  $stem$A 30-year-old man weighing 80 kg sustains scald burns 1 hour ago. On examination, his entire anterior trunk and his entire right arm are covered by pink, blistered, painful skin that blanches on pressure.$stem$,
  'Using the Parkland formula, what is his estimated intravenous fluid requirement for the first 8 hours from the time of the burn?',
  array['burns','TBSA','Parkland formula']
),

-- 40. Necrobiosis lipoidica diabeticorum
(
  '40000000-0000-0000-0000-000000000040', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$A 45-year-old woman with type 1 diabetes has a well-demarcated, shiny, yellow-brown, atrophic plaque with visible telangiectasia over her left shin, present for over a year.$stem$,
  'What is the most likely diagnosis?',
  array['necrobiosis lipoidica diabeticorum','diabetes']
),

-- 41. Acanthosis nigricans and occult malignancy
(
  '40000000-0000-0000-0000-000000000041', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'advanced',
  $stem$A 71-year-old man of normal body weight develops symmetrical, velvety, hyperpigmented thickening of the skin in both axillae and around his neck over the course of only 6 weeks. He has also lost weight and reports early satiety.$stem$,
  'What is the most appropriate next step?',
  array['acanthosis nigricans','malignancy','chain reasoning']
),

-- 42. Xanthelasma
(
  '40000000-0000-0000-0000-000000000042', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'foundation',
  $stem$A 52-year-old man is noted to have soft, yellowish plaques at the medial aspects of both upper eyelids.$stem$,
  'What is the most appropriate next investigation?',
  array['xanthelasma','lipid profile']
),

-- 43. Herpes zoster ophthalmicus
(
  '40000000-0000-0000-0000-000000000043', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$A 70-year-old woman develops a painful, vesicular rash in a band across her forehead and upper eyelid on one side, respecting the midline. There are also vesicles visible on the tip and side of her nose.$stem$,
  'What is the most appropriate immediate action, given this specific finding?',
  array['herpes zoster ophthalmicus','ophthalmology referral']
),

-- 44. Ramsay Hunt syndrome
(
  '40000000-0000-0000-0000-000000000044', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$A 58-year-old man presents with sudden unilateral facial weakness affecting both his forehead and the lower half of his face equally. On close examination, there are also small vesicles within his external ear canal and over the pinna on the same side, and he reports new hearing loss and dizziness.$stem$,
  'What is the most likely diagnosis?',
  array['Ramsay Hunt syndrome','facial nerve palsy']
),

-- 45. Molluscum contagiosum
(
  '40000000-0000-0000-0000-000000000045', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'foundation',
  $stem$A 5-year-old girl has multiple small, firm, dome-shaped, pearly papules with central umbilication scattered over her trunk and axillae.$stem$,
  'What is the most appropriate management?',
  array['molluscum contagiosum','reassurance']
),

-- 46. Viral warts
(
  '40000000-0000-0000-0000-000000000046', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'foundation',
  $stem$A 12-year-old boy has a rough, hyperkeratotic papule on the sole of his foot that is mildly tender on direct pressure.$stem$,
  'What is the most likely diagnosis?',
  array['viral wart','verruca','HPV']
),

-- 47. Alopecia areata vs androgenetic alopecia vs telogen effluvium
(
  '40000000-0000-0000-0000-000000000047', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'advanced',
  $stem$Three patients are seen in the hair loss clinic.

Patient 1: a 26-year-old woman notices a single, well-demarcated, smooth, round patch of complete hair loss on her scalp, with short, tapered "exclamation mark" hairs at the margin. She has no scarring and no other skin changes.

Patient 2: a 45-year-old man has gradual, progressive thinning at his bitemporal hairline and vertex over several years, with a family history of similar hair loss in his father and brother.

Patient 3: a 32-year-old woman notices diffuse, non-patchy thinning of her hair over her whole scalp, first noticed about 3 months after a complicated delivery with significant blood loss.$stem$,
  'Which patient has telogen effluvium?',
  array['alopecia areata','androgenetic alopecia','telogen effluvium','differentiation']
),

-- 48. Hyperhidrosis
(
  '40000000-0000-0000-0000-000000000048', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'foundation',
  $stem$A 19-year-old man has excessive sweating of both palms and axillae, present since early adolescence, worsened by anxiety but present even at rest, with no other systemic symptoms.$stem$,
  'What is the most appropriate first-line treatment?',
  array['hyperhidrosis','aluminium chloride']
),

-- 49. Graves disease skin signs
(
  '40000000-0000-0000-0000-000000000049', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'core',
  $stem$A 38-year-old woman with known Graves disease and significant thyroid eye disease develops non-pitting, waxy, thickened skin plaques over both shins, together with clubbing and soft tissue swelling of her fingers.$stem$,
  'What are these two skin and soft tissue signs called?',
  array['Graves disease','pretibial myxoedema','thyroid acropachy']
),

-- 50. Topical steroid misuse -> atrophy -> secondary infection
(
  '40000000-0000-0000-0000-000000000050', 'mrcp1', '30000000-0000-0000-0000-000000000007',
  'published', 'advanced',
  $stem$A 50-year-old woman has been self-treating presumed facial eczema with a potent topical corticosteroid obtained from a relative, applying it daily for over a year without medical review. Her facial skin is now thin, with visible telangiectasia and easy bruising. She now presents with a spreading area of honey-coloured crusting and weeping over the same area.$stem$,
  'What is the most likely explanation for this new finding?',
  array['topical corticosteroid','skin atrophy','secondary infection','chain reasoning']
)

on conflict (id) do nothing;

-- ---------------------------------------------------------------------------
-- Options
-- ---------------------------------------------------------------------------

insert into question_options (question_id, label, option_text, is_correct, rationale, sort_order) values

-- Q1 BCC vs SCC differentiation
('40000000-0000-0000-0000-000000000001', 'A', 'The lesion in Patient 2 (a squamous cell carcinoma)', true,
 $r$Correct. Patient 2 has a rapidly growing, indurated, ulcerated and crusted nodule, the classic appearance of a squamous cell carcinoma, which - unlike basal cell carcinoma - carries a recognised (though still overall low, around 2 to 5%) risk of regional and distant metastasis, particularly given its size (over 2 cm) and rapid growth.$r$, 1),
('40000000-0000-0000-0000-000000000001', 'B', 'The lesion in Patient 1 (a basal cell carcinoma)', false,
 $r$Ruled out because Patient 1 has a pearly, telangiectatic nodule with a rolled edge, the classic appearance of a basal cell carcinoma, which grows slowly by local invasion and very rarely metastasises.$r$, 2),
('40000000-0000-0000-0000-000000000001', 'C', 'Both lesions carry an equal, clinically significant risk of metastasis', false,
 $r$Ruled out because basal cell carcinoma very rarely metastasises, in clear contrast to squamous cell carcinoma, which does carry a meaningful (if still overall low) metastatic potential; the two lesions do not carry equal risk.$r$, 3),
('40000000-0000-0000-0000-000000000001', 'D', 'Neither lesion carries any risk of metastasis', false,
 $r$Ruled out because although basal cell carcinoma has minimal metastatic potential, squamous cell carcinoma does have a recognised risk of metastasis, especially with high-risk features such as those seen in Patient 2.$r$, 4),
('40000000-0000-0000-0000-000000000001', 'E', 'The lesion in Patient 1, because it has been present for longer', false,
 $r$Ruled out because duration of a lesion does not determine its metastatic potential; it is the histological subtype and specific high-risk features (rapid growth, ulceration, size, immunosuppression) that matter, and these point to the lesion in Patient 2 as the higher-risk squamous cell carcinoma.$r$, 5),

-- Q2 Melanoma ABCDE + Breslow
('40000000-0000-0000-0000-000000000002', 'A', 'Urgent (two-week-wait) referral for dermatology assessment of a suspected melanoma', true,
 $r$Correct. This lesion has several ABCDE features of melanoma (asymmetry, an irregular/notched border, colour variation, diameter over 6 mm, and evolution/change reported over 4 months), which meets the threshold for urgent suspected skin cancer referral for excision biopsy and histological diagnosis.$r$, 1),
('40000000-0000-0000-0000-000000000002', 'B', 'Reassurance and routine review in 6 months', false,
 $r$Ruled out because the described features (change in size, irregular border, colour variation, diameter over 6 mm) are concerning for melanoma and warrant urgent referral rather than reassurance or a delayed routine review, which would risk delayed diagnosis of a potentially life-threatening malignancy.$r$, 2),
('40000000-0000-0000-0000-000000000002', 'C', 'Cryotherapy to the lesion in primary care', false,
 $r$Ruled out because cryotherapy is used for benign or premalignant lesions such as viral warts or actinic keratoses; destroying a potentially malignant pigmented lesion without a tissue diagnosis would prevent histological staging and is inappropriate.$r$, 3),
('40000000-0000-0000-0000-000000000002', 'D', 'Shave biopsy in primary care to establish the diagnosis before referral', false,
 $r$Ruled out because a shave biopsy risks incomplete excision and inaccurate Breslow thickness measurement, which is the key prognostic factor in melanoma; suspicious pigmented lesions should go directly to urgent specialist assessment for complete excision biopsy.$r$, 4),
('40000000-0000-0000-0000-000000000002', 'E', 'Dermoscopy in primary care followed by routine referral if still of concern', false,
 $r$Ruled out because the combination of ABCDE features described already meets the threshold for urgent, not routine, referral; dermoscopy may support triage but should not delay urgent referral when malignancy is already suspected clinically.$r$, 5),

-- Q3 Chain: AK -> SCC in transplant patient
('40000000-0000-0000-0000-000000000003', 'A', 'Malignant transformation of a pre-existing actinic keratosis into an invasive squamous cell carcinoma, driven by his chronic immunosuppression', true,
 $r$Correct. Long-term immunosuppression after transplantation (particularly with agents such as ciclosporin and azathioprine) markedly increases the risk of squamous cell carcinoma, including malignant transformation of pre-existing actinic keratoses; the rapid growth, induration, ulceration and bleeding described here are features suggesting progression to invasive SCC rather than a benign process.$r$, 1),
('40000000-0000-0000-0000-000000000003', 'B', 'A simple recurrence of a previously treated actinic keratosis, requiring only repeat cryotherapy', false,
 $r$Ruled out because the rapid growth, induration, ulceration and bleeding described are red flags for invasive malignant transformation rather than a benign, superficial actinic keratosis, which would not typically show these features; a biopsy is required rather than repeat cryotherapy alone.$r$, 2),
('40000000-0000-0000-0000-000000000003', 'C', 'A basal cell carcinoma arising independently of his actinic keratoses', false,
 $r$Ruled out because a rapidly growing, indurated, ulcerated and bleeding nodule arising from chronic actinic damage in an immunosuppressed patient is far more typical of squamous cell carcinoma than basal cell carcinoma, and immunosuppression specifically raises SCC risk more than BCC risk.$r$, 3),
('40000000-0000-0000-0000-000000000003', 'D', 'A drug-induced cutaneous reaction to his immunosuppressive therapy', false,
 $r$Ruled out because a localised, indurated, ulcerated, rapidly enlarging nodule is not a typical drug eruption pattern; drug reactions are usually more widespread and inflammatory rather than a single, tumour-like lesion.$r$, 4),
('40000000-0000-0000-0000-000000000003', 'E', 'A benign keratoacanthoma that can be safely observed to resolve spontaneously', false,
 $r$Ruled out because although keratoacanthoma can mimic SCC clinically, it cannot be reliably distinguished from true SCC without histology, and in an immunosuppressed patient a rapidly growing ulcerated nodule must be biopsied and treated as SCC until proven otherwise rather than presumed to resolve spontaneously.$r$, 5),

-- Q4 Acne first-line
('40000000-0000-0000-0000-000000000004', 'A', 'A fixed-combination topical treatment (e.g. a topical retinoid with benzoyl peroxide, or benzoyl peroxide with a topical antibiotic)', true,
 $r$Correct. For mild-to-moderate acne, NICE recommends a 12-week course of a fixed-combination topical treatment as first-line therapy, rather than any single agent used alone, to improve efficacy and reduce the risk of antibiotic resistance.$r$, 1),
('40000000-0000-0000-0000-000000000004', 'B', 'Topical antibiotic monotherapy', false,
 $r$Ruled out because topical antibiotic monotherapy is specifically avoided as first-line therapy due to the risk of promoting antibiotic resistance; it should always be combined with benzoyl peroxide rather than used alone.$r$, 2),
('40000000-0000-0000-0000-000000000004', 'C', 'Oral antibiotic monotherapy', false,
 $r$Ruled out because oral antibiotics are reserved for acne that has not responded to an adequate trial of topical combination therapy, and even then should be combined with a topical agent rather than used alone, to limit resistance.$r$, 3),
('40000000-0000-0000-0000-000000000004', 'D', 'Oral isotretinoin', false,
 $r$Ruled out because oral isotretinoin is reserved for severe, nodulocystic or scarring acne, or acne that has failed to respond to both topical and oral antibiotic treatment, under specialist supervision; it is not appropriate as a first treatment for mild-to-moderate acne.$r$, 4),
('40000000-0000-0000-0000-000000000004', 'E', 'The combined oral contraceptive pill as first-line monotherapy', false,
 $r$Ruled out because although a combined oral contraceptive can be a useful option for women with acne, it is not the standard first-line choice for this male patient, and even in women it is generally considered after or alongside topical therapy rather than as the very first step.$r$, 5),

-- Q5 Cellulitis vs erysipelas
('40000000-0000-0000-0000-000000000005', 'A', 'Erysipelas; oral flucloxacillin', true,
 $r$Correct. The sharply demarcated, raised border with clear separation from surrounding skin is characteristic of erysipelas (infection confined to the upper dermis and superficial lymphatics, usually caused by Streptococcus pyogenes), as opposed to the more diffuse, poorly demarcated spread of cellulitis; flucloxacillin remains the first-line oral antibiotic choice, covering both streptococci and staphylococci, for a patient well enough for outpatient treatment.$r$, 1),
('40000000-0000-0000-0000-000000000005', 'B', 'Cellulitis; oral flucloxacillin', false,
 $r$Ruled out because although flucloxacillin would still be an appropriate antibiotic, cellulitis typically has a more diffuse, poorly demarcated border extending into deeper subcutaneous tissue, unlike the sharply demarcated, raised edge described here, which is specific to erysipelas.$r$, 2),
('40000000-0000-0000-0000-000000000005', 'C', 'Erysipelas; oral co-amoxiclav', false,
 $r$Ruled out because although the diagnosis of erysipelas is correct, flucloxacillin (not co-amoxiclav) is the standard first-line oral choice for straightforward erysipelas or cellulitis in a systemically well outpatient; co-amoxiclav is generally reserved for specific higher-risk sites such as facial cellulitis or bite wounds.$r$, 3),
('40000000-0000-0000-0000-000000000005', 'D', 'Necrotising fasciitis; emergency intravenous antibiotics and surgical debridement', false,
 $r$Ruled out because there is no evidence here of disproportionate pain, rapidly spreading skin necrosis, crepitus, or systemic sepsis, which would be expected in necrotising fasciitis; this presentation is consistent with a straightforward localised skin and soft tissue infection.$r$, 4),
('40000000-0000-0000-0000-000000000005', 'E', 'Contact dermatitis; topical corticosteroid', false,
 $r$Ruled out because fever and a warm, tender, sharply demarcated erythematous area are not features of contact dermatitis, which is typically itchy rather than tender and not associated with systemic fever.$r$, 5),

-- Q6 Chronic urticaria antihistamine
('40000000-0000-0000-0000-000000000006', 'A', 'A standard-dose, non-sedating (second-generation) antihistamine, such as cetirizine', true,
 $r$Correct. First-line treatment for chronic spontaneous urticaria is a standard dose of a non-sedating second-generation H1 antihistamine, taken regularly rather than only as needed.$r$, 1),
('40000000-0000-0000-0000-000000000006', 'B', 'A sedating first-generation antihistamine, such as chlorphenamine, taken regularly', false,
 $r$Ruled out because sedating first-generation antihistamines are not recommended for regular first-line use due to their side-effect profile (sedation, anticholinergic effects); non-sedating second-generation agents are preferred.$r$, 2),
('40000000-0000-0000-0000-000000000006', 'C', 'Oral corticosteroids as long-term maintenance therapy', false,
 $r$Ruled out because long-term oral corticosteroids are not appropriate for chronic urticaria due to their side-effect burden; short courses may be used for severe flares only, not as maintenance treatment.$r$, 3),
('40000000-0000-0000-0000-000000000006', 'D', 'Omalizumab', false,
 $r$Ruled out because omalizumab is reserved for chronic spontaneous urticaria that remains refractory to antihistamines, including up-titrated doses, and requires specialist initiation; it is not first-line.$r$, 4),
('40000000-0000-0000-0000-000000000006', 'E', 'An elimination diet as the primary intervention', false,
 $r$Ruled out because chronic spontaneous urticaria is rarely caused by a specific dietary trigger, unlike some cases of acute urticaria; pharmacological therapy with an antihistamine is the appropriate first-line approach.$r$, 5),

-- Q7 Anaphylaxis
('40000000-0000-0000-0000-000000000007', 'A', 'Intramuscular adrenaline', true,
 $r$Correct. Stridor, wheeze and hypotension following a likely allergen exposure (peanuts) indicate anaphylaxis; intramuscular adrenaline is the immediate first-line treatment, given without delay alongside high-flow oxygen, an ABCDE assessment and a call for emergency help.$r$, 1),
('40000000-0000-0000-0000-000000000007', 'B', 'Intravenous chlorphenamine as the first treatment', false,
 $r$Ruled out because antihistamines are a second-line adjunct in anaphylaxis; they act too slowly to address the life-threatening airway and cardiovascular compromise described here, and must not be given before, or instead of, adrenaline.$r$, 2),
('40000000-0000-0000-0000-000000000007', 'C', 'Intravenous hydrocortisone as the first treatment', false,
 $r$Ruled out because corticosteroids have a delayed onset of action and are not the immediate first-line treatment for anaphylaxis; they may be considered as an adjunct after adrenaline has been given.$r$, 3),
('40000000-0000-0000-0000-000000000007', 'D', 'Oral antihistamine and observation', false,
 $r$Ruled out because this presentation with stridor and hypotension is life-threatening anaphylaxis, requiring immediate intramuscular adrenaline; oral treatment and simple observation would risk fatal airway or cardiovascular collapse.$r$, 4),
('40000000-0000-0000-0000-000000000007', 'E', 'Nebulised salbutamol alone', false,
 $r$Ruled out because although nebulised salbutamol may help bronchospasm as an adjunct, it does not address the systemic anaphylactic reaction or upper airway swelling, and must not replace intramuscular adrenaline as the first-line treatment.$r$, 5),

-- Q8 ACE inhibitor angioedema
('40000000-0000-0000-0000-000000000008', 'A', 'Bradykinin accumulation due to inhibition of ACE-mediated bradykinin breakdown', true,
 $r$Correct. ACE inhibitors block the breakdown of bradykinin as well as angiotensin I; accumulated bradykinin increases vascular permeability and causes angioedema, a mechanism that is independent of mast cell degranulation or IgE-mediated allergy and can occur at any point during treatment, even after years of uneventful use.$r$, 1),
('40000000-0000-0000-0000-000000000008', 'B', 'IgE-mediated mast cell degranulation, as in classical allergic angioedema', false,
 $r$Ruled out because there is no preceding urticaria, itch or identifiable allergen exposure, and ACE inhibitor angioedema is a bradykinin-mediated, non-allergic reaction rather than an IgE-mediated mast cell process.$r$, 2),
('40000000-0000-0000-0000-000000000008', 'C', 'Hereditary deficiency of C1 esterase inhibitor', false,
 $r$Ruled out because there is nothing in the history to suggest a hereditary condition, such as a family history or recurrent episodes since childhood; this presentation is temporally and mechanistically explained by his ACE inhibitor rather than a separate hereditary disorder, although both conditions share a bradykinin-mediated mechanism.$r$, 3),
('40000000-0000-0000-0000-000000000008', 'D', 'Direct histamine release triggered by ramipril', false,
 $r$Ruled out because ACE inhibitor angioedema is mediated by bradykinin accumulation, not direct histamine release, which is why antihistamines are typically ineffective in this condition.$r$, 4),
('40000000-0000-0000-0000-000000000008', 'E', 'An IgG-mediated autoimmune reaction against skin desmosomal proteins', false,
 $r$Ruled out because this describes the mechanism of pemphigus, an autoimmune blistering disease, not angioedema; there is no blistering described here, and the mechanism of ACE inhibitor angioedema is bradykinin accumulation.$r$, 5),

-- Q9 Atopic eczema
('40000000-0000-0000-0000-000000000009', 'A', 'Atopic eczema', true,
 $r$Correct. An itchy rash in the classic flexural distribution, personal and family history of atopy (asthma, hay fever), and peripheral eosinophilia together are typical of atopic eczema.$r$, 1),
('40000000-0000-0000-0000-000000000009', 'B', 'Psoriasis', false,
 $r$Ruled out because psoriasis typically produces well-demarcated, scaly plaques on extensor surfaces (elbows, knees) rather than an itchy rash in the flexural creases, and is not typically associated with peripheral eosinophilia.$r$, 2),
('40000000-0000-0000-0000-000000000009', 'C', 'Allergic contact dermatitis', false,
 $r$Ruled out because contact dermatitis is triggered by a specific external allergen and would not typically be present intermittently since infancy in a classic flexural distribution with a personal and family history of atopy.$r$, 3),
('40000000-0000-0000-0000-000000000009', 'D', 'Scabies', false,
 $r$Ruled out because scabies causes intensely itchy burrows, typically in the finger webs and wrists, usually with a history of contact with an affected individual, rather than a chronic, relapsing flexural rash since infancy.$r$, 4),
('40000000-0000-0000-0000-000000000009', 'E', 'Tinea corporis', false,
 $r$Ruled out because tinea corporis produces an annular, scaly plaque with an active edge and central clearing, not a chronic, symmetrical flexural rash associated with atopy.$r$, 5),

-- Q10 Eczema herpeticum
('40000000-0000-0000-0000-000000000010', 'A', 'Urgent same-day assessment and treatment with systemic (intravenous or oral) aciclovir', true,
 $r$Correct. Rapidly spreading, monomorphic, punched-out vesicles on a background of eczema, with fever and recent cold sore contact, indicate eczema herpeticum, a potentially serious herpes simplex superinfection that requires urgent systemic antiviral treatment rather than routine eczema management.$r$, 1),
('40000000-0000-0000-0000-000000000010', 'B', 'Increasing the potency of her regular topical corticosteroid', false,
 $r$Ruled out because this presentation is not simply an eczema flare but a herpes simplex superinfection; increasing topical corticosteroid potency would further impair local immune defence and could worsen the infection.$r$, 2),
('40000000-0000-0000-0000-000000000010', 'C', 'Topical antifungal cream', false,
 $r$Ruled out because the punched-out vesicular lesions and history of cold sore contact point to a herpes simplex viral infection, not a fungal one; topical antifungal treatment would not address the underlying cause.$r$, 3),
('40000000-0000-0000-0000-000000000010', 'D', 'Reassurance that this is a typical eczema flare and review in one week', false,
 $r$Ruled out because eczema herpeticum can disseminate rapidly and cause systemic illness, and delaying treatment for a week risks serious complications; this requires same-day assessment and treatment.$r$, 4),
('40000000-0000-0000-0000-000000000010', 'E', 'Oral antibiotics for presumed bacterial impetiginisation', false,
 $r$Ruled out because the monomorphic, punched-out vesicles and history of HSV contact are typical of a viral, not bacterial, superinfection; antibiotics alone would not treat the underlying herpes simplex infection.$r$, 5)
,

-- Q11 Chronic plaque psoriasis
('40000000-0000-0000-0000-000000000011', 'A', 'Chronic plaque psoriasis', true,
 $r$Correct. Well-demarcated erythematous plaques with silvery-white scale on extensor surfaces, with pinpoint bleeding on removal of scale (the Auspitz sign), are classic features of chronic plaque psoriasis.$r$, 1),
('40000000-0000-0000-0000-000000000011', 'B', 'Atopic eczema', false,
 $r$Ruled out because eczema typically affects flexural surfaces with ill-defined, itchy, excoriated patches rather than well-demarcated, silvery-scaled plaques on extensor surfaces, and does not produce pinpoint bleeding on scale removal.$r$, 2),
('40000000-0000-0000-0000-000000000011', 'C', 'Tinea corporis', false,
 $r$Ruled out because tinea corporis produces an annular plaque with an active edge and central clearing, typically as a single or few lesions, rather than symmetrical, well-demarcated plaques over both elbows and knees for several years.$r$, 3),
('40000000-0000-0000-0000-000000000011', 'D', 'Lichen planus', false,
 $r$Ruled out because lichen planus produces violaceous, polygonal, flat-topped papules with fine white surface striae, typically on flexor surfaces, not silvery-scaled plaques on extensor surfaces with pinpoint bleeding on scale removal.$r$, 4),
('40000000-0000-0000-0000-000000000011', 'E', 'Pityriasis rosea', false,
 $r$Ruled out because pityriasis rosea produces oval, fawn-coloured patches with a fine collarette of scale in a Christmas-tree distribution on the trunk, typically preceded by a herald patch, and resolves over weeks, unlike the chronic extensor-surface plaques described here.$r$, 5),

-- Q12 Guttate psoriasis
('40000000-0000-0000-0000-000000000012', 'A', 'Guttate psoriasis', true,
 $r$Correct. An acute eruption of small, drop-like, scaly papules over the trunk and proximal limbs, occurring 2 to 4 weeks after a streptococcal throat infection in a child or young adult, is classic for guttate psoriasis.$r$, 1),
('40000000-0000-0000-0000-000000000012', 'B', 'Chronic plaque psoriasis', false,
 $r$Ruled out because chronic plaque psoriasis usually presents as larger, well-established plaques on extensor surfaces rather than an acute eruption of small, drop-like lesions closely following a streptococcal infection.$r$, 2),
('40000000-0000-0000-0000-000000000012', 'C', 'Pityriasis rosea', false,
 $r$Ruled out because pityriasis rosea is not typically preceded by streptococcal pharyngitis and usually begins with a single herald patch followed by a Christmas-tree pattern of oval patches, rather than uniform small guttate papules.$r$, 3),
('40000000-0000-0000-0000-000000000012', 'D', 'A non-specific viral exanthem', false,
 $r$Ruled out because a viral exanthem would not classically follow confirmed streptococcal pharyngitis, nor produce this specific scaly, drop-like papular morphology typical of guttate psoriasis.$r$, 4),
('40000000-0000-0000-0000-000000000012', 'E', 'Pityriasis versicolor', false,
 $r$Ruled out because pityriasis versicolor produces hypopigmented or hyperpigmented scaly macules on the trunk caused by Malassezia yeast, with no association with streptococcal throat infection.$r$, 5),

-- Q13 Generalised pustular psoriasis
('40000000-0000-0000-0000-000000000013', 'A', 'Emergency hospital admission for supportive care and specialist treatment of generalised pustular psoriasis', true,
 $r$Correct. Abrupt withdrawal of systemic corticosteroids is a recognised trigger for generalised pustular psoriasis (von Zumbusch type) in patients with underlying psoriasis; widespread sterile pustules on erythematous skin with fever and systemic illness is a dermatological emergency requiring admission for supportive care, correction of fluid and electrolyte disturbance, and specialist systemic treatment.$r$, 1),
('40000000-0000-0000-0000-000000000013', 'B', 'Reassurance and topical emollients alone', false,
 $r$Ruled out because this is a life-threatening emergency with systemic illness, fever and widespread pustulation, which is not amenable to emollients alone and requires hospital admission.$r$, 2),
('40000000-0000-0000-0000-000000000013', 'C', 'Restarting oral prednisolone as monotherapy', false,
 $r$Ruled out because although steroid withdrawal can precipitate this presentation, restarting systemic corticosteroids as sole therapy is not standard management; specific specialist systemic treatment alongside supportive admission is required instead.$r$, 3),
('40000000-0000-0000-0000-000000000013', 'D', 'Topical antibiotics for presumed bacterial folliculitis', false,
 $r$Ruled out because the pustules of generalised pustular psoriasis are sterile, not infective, so this is not folliculitis and antibiotics would not address the underlying disease process.$r$, 4),
('40000000-0000-0000-0000-000000000013', 'E', 'Discharge with oral antihistamines for symptomatic itch relief', false,
 $r$Ruled out because this is a systemic dermatological emergency with risk of complications such as hypocalcaemia and high-output cardiac failure, not simply an itch that can be managed as an outpatient.$r$, 5),

-- Q14 Psoriasis nail/arthritis/methotrexate
('40000000-0000-0000-0000-000000000014', 'A', 'Start methotrexate as first-line systemic therapy', true,
 $r$Correct. Extensive plaque disease with nail changes and features of psoriatic arthritis (distal interphalangeal joint involvement, dactylitis) that has failed topical treatment and phototherapy meets criteria for systemic therapy; methotrexate is the standard first-line systemic agent for both severe skin and joint disease.$r$, 1),
('40000000-0000-0000-0000-000000000014', 'B', 'Refer directly for a biologic agent, bypassing methotrexate', false,
 $r$Ruled out because biologic agents are reserved for disease that has failed or is unsuitable for conventional systemic therapy such as methotrexate, which should generally be trialled first.$r$, 2),
('40000000-0000-0000-0000-000000000014', 'C', 'Continue topical therapy alone at a higher potency', false,
 $r$Ruled out because topical therapy has already failed given the extent of his disease and additional joint involvement, so escalation to systemic therapy is indicated rather than simply increasing topical potency.$r$, 3),
('40000000-0000-0000-0000-000000000014', 'D', 'Start oral isotretinoin', false,
 $r$Ruled out because isotretinoin is used to treat acne, not psoriasis, and has no established role in treating psoriatic skin or joint disease.$r$, 4),
('40000000-0000-0000-0000-000000000014', 'E', 'Increase the frequency of narrowband UVB phototherapy alone', false,
 $r$Ruled out because phototherapy has already been tried and failed, and it does not address his joint disease, which itself requires systemic disease-modifying treatment.$r$, 5),

-- Q15 HSP tetrad and renal prognosis
('40000000-0000-0000-0000-000000000015', 'A', 'Henoch-Schonlein purpura; renal involvement determines his long-term prognosis', true,
 $r$Correct. Palpable purpura over the buttocks and extensor lower limbs, arthralgia, abdominal pain and renal involvement (haematuria and proteinuria) following a preceding upper respiratory tract infection form the classic tetrad of Henoch-Schonlein purpura; renal involvement, which resembles IgA nephropathy, is the key determinant of whether he progresses to long-term kidney impairment, so it dictates his long-term prognosis rather than the skin or joint findings.$r$, 1),
('40000000-0000-0000-0000-000000000015', 'B', 'Meningococcal septicaemia; blood cultures determine his prognosis', false,
 $r$Ruled out because meningococcal septicaemia typically causes a rapidly progressive non-blanching petechial or purpuric rash with systemic sepsis, fever and often meningism, not this classic distribution and combination of arthralgia, abdominal pain, renal findings and a preceding upper respiratory infection.$r$, 2),
('40000000-0000-0000-0000-000000000015', 'C', 'Immune thrombocytopenic purpura; platelet count determines his prognosis', false,
 $r$Ruled out because immune thrombocytopenic purpura causes bruising and petechiae due to a low platelet count, but does not cause arthralgia, abdominal pain or the classic buttock and extensor leg distribution of palpable purpura, and renal involvement is not a feature.$r$, 3),
('40000000-0000-0000-0000-000000000015', 'D', 'Kawasaki disease; coronary artery involvement determines his prognosis', false,
 $r$Ruled out because Kawasaki disease presents with prolonged fever, conjunctivitis, mucositis, a polymorphous rash and lymphadenopathy, not palpable purpura in this distribution, and its key prognostic concern is coronary artery aneurysm rather than renal disease.$r$, 4),
('40000000-0000-0000-0000-000000000015', 'E', 'Haemolytic uraemic syndrome; renal involvement determines his prognosis', false,
 $r$Ruled out because although renal involvement is correctly identified as prognostically important, haemolytic uraemic syndrome presents with microangiopathic haemolytic anaemia, thrombocytopenia and acute kidney injury, typically after a diarrhoeal illness, rather than this purpuric rash, arthralgia and abdominal pain picture.$r$, 5),

-- Q16 Dermatomyositis skin signs
('40000000-0000-0000-0000-000000000016', 'A', 'Heliotrope rash and Gottron papules', true,
 $r$Correct. A violaceous, oedematous periorbital rash is called a heliotrope rash, and violaceous, scaly papules over the extensor surfaces of the finger joints are called Gottron papules; both are classic cutaneous signs of dermatomyositis, alongside the proximal muscle weakness described.$r$, 1),
('40000000-0000-0000-0000-000000000016', 'B', 'Malar rash and discoid lesions', false,
 $r$Ruled out because a malar rash and discoid lesions are features of systemic lupus erythematosus, not the periorbital and extensor joint findings described here, which are specific to dermatomyositis.$r$, 2),
('40000000-0000-0000-0000-000000000016', 'C', 'Target lesions and a positive Nikolsky sign', false,
 $r$Ruled out because target lesions are seen in erythema multiforme and a positive Nikolsky sign is a feature of pemphigus, neither of which matches the periorbital rash and extensor joint papules described here.$r$, 3),
('40000000-0000-0000-0000-000000000016', 'D', 'Livedo reticularis and digital ulcers', false,
 $r$Ruled out because livedo reticularis and digital ulcers are seen in conditions such as antiphospholipid syndrome or systemic sclerosis, not the specific periorbital and extensor-joint findings described here.$r$, 4),
('40000000-0000-0000-0000-000000000016', 'E', 'Salmon-pink plaques and white lacy surface striae', false,
 $r$Ruled out because white lacy surface striae are seen in lichen planus, and this combination does not match the periorbital and extensor-joint findings of dermatomyositis.$r$, 5),

-- Q17 Dermatomyositis and occult malignancy
('40000000-0000-0000-0000-000000000017', 'A', 'Age-appropriate malignancy screening, given the recognised association between new dermatomyositis and occult malignancy in older adults', true,
 $r$Correct. New dermatomyositis in an older adult, especially with unintentional weight loss, should prompt screening for an occult malignancy (commonly ovarian, lung, pancreatic, gastric or colorectal cancer, or lymphoma), as dermatomyositis has a well-recognised paraneoplastic association, more so than polymyositis (in which anti-Jo-1 antibodies and muscle-only disease without skin signs are more typical).$r$, 1),
('40000000-0000-0000-0000-000000000017', 'B', 'Reassurance that this is simply an age-related presentation of dermatomyositis, with no further investigation needed', false,
 $r$Ruled out because dermatomyositis in an older adult carries a significant risk of underlying occult malignancy, particularly with unexplained weight loss, and warrants active investigation rather than reassurance alone.$r$, 2),
('40000000-0000-0000-0000-000000000017', 'C', 'Muscle biopsy alone, with no further systemic investigation', false,
 $r$Ruled out because although muscle biopsy may support the diagnosis of an inflammatory myopathy, it would not detect an underlying malignancy, which is the more urgent concern given her age and weight loss.$r$, 3),
('40000000-0000-0000-0000-000000000017', 'D', 'Anti-Jo-1 antibody testing alone, with no imaging', false,
 $r$Ruled out because anti-Jo-1 antibody testing helps identify antisynthetase syndrome and associated interstitial lung disease, but does not screen for or exclude an occult malignancy, which requires dedicated imaging and age-appropriate cancer screening.$r$, 4),
('40000000-0000-0000-0000-000000000017', 'E', 'Referral for cardiac MRI, as myocarditis is the most likely explanation', false,
 $r$Ruled out because although cardiac involvement can rarely occur in inflammatory myopathies, it does not explain her systemic weight loss, and the priority in a woman of this age with new dermatomyositis is to exclude an occult malignancy.$r$, 5),

-- Q18 Dermatitis herpetiformis treatment
('40000000-0000-0000-0000-000000000018', 'A', 'Dapsone', true,
 $r$Correct. Dapsone gives rapid symptomatic relief of the intensely itchy vesicular rash of dermatitis herpetiformis, while a gluten-free diet (the definitive long-term treatment addressing the underlying coeliac disease) takes effect more slowly.$r$, 1),
('40000000-0000-0000-0000-000000000018', 'B', 'A gluten-free diet alone, with no medication', false,
 $r$Ruled out because although a gluten-free diet is the definitive long-term treatment, the skin response to diet alone is slow, taking weeks to months, so dapsone is used to control symptoms rapidly in the interim.$r$, 2),
('40000000-0000-0000-0000-000000000018', 'C', 'Topical corticosteroids', false,
 $r$Ruled out because topical corticosteroids provide little benefit in dermatitis herpetiformis compared with dapsone, which specifically and rapidly controls the itch and blistering.$r$, 3),
('40000000-0000-0000-0000-000000000018', 'D', 'Oral prednisolone', false,
 $r$Ruled out because systemic corticosteroids are not the standard treatment for dermatitis herpetiformis; dapsone is specifically effective and preferred, sparing the patient from long-term steroid side effects.$r$, 4),
('40000000-0000-0000-0000-000000000018', 'E', 'Oral antihistamines alone', false,
 $r$Ruled out because antihistamines provide only symptomatic itch relief and do not address the underlying immune-mediated blistering process; dapsone is the specific first-line treatment.$r$, 5),

-- Q19 Chain: coeliac -> DH -> malabsorption -> IDA
('40000000-0000-0000-0000-000000000019', 'A', 'Ongoing gluten exposure driving both her dermatitis herpetiformis and coeliac-related small bowel malabsorption of iron', true,
 $r$Correct. Years of unrecognised dermatitis herpetiformis, misdiagnosed as eczema, implies ongoing undiagnosed coeliac disease and continued gluten exposure; the resulting small bowel villous damage causes malabsorption, most classically of iron, folate and vitamin B12, explaining her iron-deficiency anaemia. Her rash and her anaemia therefore share the same underlying cause.$r$, 1),
('40000000-0000-0000-0000-000000000019', 'B', 'An unrelated coincidental cause of anaemia, such as menorrhagia', false,
 $r$Ruled out because although menorrhagia is a common cause of iron-deficiency anaemia in women, the vignette specifically links a longstanding, undiagnosed vesicular rash typical of dermatitis herpetiformis to a well-recognised malabsorptive mechanism, making the shared coeliac disease explanation far more likely than an unrelated coincidence.$r$, 2),
('40000000-0000-0000-0000-000000000019', 'C', 'Chronic blood loss from skin excoriation as the primary cause of her anaemia', false,
 $r$Ruled out because skin excoriation from itching does not cause clinically significant blood loss sufficient to produce iron-deficiency anaemia; malabsorption due to underlying coeliac disease is the recognised mechanism linking her rash and anaemia.$r$, 3),
('40000000-0000-0000-0000-000000000019', 'D', 'Dapsone-induced haemolytic anaemia', false,
 $r$Ruled out because there is no mention of dapsone having been started, and dapsone-induced haemolysis classically causes a normocytic haemolytic anaemia rather than a microcytic anaemia with a low ferritin.$r$, 4),
('40000000-0000-0000-0000-000000000019', 'E', 'Vitamin B12 deficiency due to pernicious anaemia', false,
 $r$Ruled out because pernicious anaemia causes a macrocytic, not microcytic, anaemia, and the low ferritin described here specifically indicates iron deficiency rather than vitamin B12 deficiency.$r$, 5),

-- Q20 Fixed drug eruption
('40000000-0000-0000-0000-000000000020', 'A', 'Fixed drug eruption', true,
 $r$Correct. A well-demarcated plaque recurring at exactly the same site with each re-exposure to a causative drug, here co-trimoxazole, is the defining feature of a fixed drug eruption.$r$, 1),
('40000000-0000-0000-0000-000000000020', 'B', 'Erythema multiforme', false,
 $r$Ruled out because erythema multiforme produces multiple target lesions typically triggered by infection, especially herpes simplex virus, rather than a single lesion recurring at the same site with each dose of a specific drug.$r$, 2),
('40000000-0000-0000-0000-000000000020', 'C', 'Urticaria', false,
 $r$Ruled out because urticaria produces transient, itchy wheals that move around and resolve within hours, not a fixed plaque recurring at the identical site with residual hyperpigmentation.$r$, 3),
('40000000-0000-0000-0000-000000000020', 'D', 'Cellulitis', false,
 $r$Ruled out because cellulitis is an acute infective process with diffuse, spreading erythema and systemic signs of infection, not a recurrent, drug-triggered lesion confined to the same site.$r$, 4),
('40000000-0000-0000-0000-000000000020', 'E', 'Allergic contact dermatitis', false,
 $r$Ruled out because contact dermatitis requires direct skin contact with an allergen or irritant, not systemic drug ingestion, and would not classically recur at exactly the same site with systemic re-exposure to an oral medication.$r$, 5)
,

-- Q21 Morbilliform drug rash
('40000000-0000-0000-0000-000000000021', 'A', 'An amoxicillin-induced morbilliform (maculopapular) drug rash occurring in the context of undiagnosed infectious mononucleosis', true,
 $r$Correct. Patients with infectious mononucleosis (Epstein-Barr virus) given amoxicillin or ampicillin for presumed bacterial tonsillitis classically develop a widespread maculopapular rash at very high incidence; the clinical picture here, with lymphadenopathy, splenomegaly and atypical lymphocytes, confirms Epstein-Barr virus infection as the underlying cause.$r$, 1),
('40000000-0000-0000-0000-000000000021', 'B', 'A type I, IgE-mediated penicillin allergy', false,
 $r$Ruled out because this specific reaction pattern in infectious mononucleosis is thought to be a transient phenomenon related to the underlying viral infection rather than a true type I, IgE-mediated penicillin allergy, and does not reliably predict a reaction to penicillins outside this context.$r$, 2),
('40000000-0000-0000-0000-000000000021', 'C', 'Meningococcal septicaemia', false,
 $r$Ruled out because there is no non-blanching petechial rash, hypotension or other signs of sepsis described, and the clinical picture of lymphadenopathy, splenomegaly and atypical lymphocytes is specific for infectious mononucleosis rather than meningococcal disease.$r$, 3),
('40000000-0000-0000-0000-000000000021', 'D', 'Scarlet fever', false,
 $r$Ruled out because scarlet fever produces a fine, sandpaper-like erythematous rash with circumoral pallor and a strawberry tongue due to a streptococcal exotoxin, not the combination of lymphadenopathy, splenomegaly and atypical lymphocytes seen here, which points to Epstein-Barr virus.$r$, 4),
('40000000-0000-0000-0000-000000000021', 'E', 'Stevens-Johnson syndrome', false,
 $r$Ruled out because there is no mucosal involvement, blistering, skin detachment or positive Nikolsky sign described, all of which would be expected in Stevens-Johnson syndrome; this is a benign, self-limiting morbilliform eruption.$r$, 5),

-- Q22 Erythema nodosum causes
('40000000-0000-0000-0000-000000000022', 'A', 'Sarcoidosis', true,
 $r$Correct. Tender erythema nodosum together with bilateral hilar lymphadenopathy and mild breathlessness, without gastrointestinal or throat symptoms, is a classic presentation of sarcoidosis-associated erythema nodosum.$r$, 1),
('40000000-0000-0000-0000-000000000022', 'B', 'Streptococcal pharyngitis', false,
 $r$Ruled out because she has no recent sore throat, and the specific accompanying finding of bilateral hilar lymphadenopathy on chest X-ray is a hallmark of sarcoidosis, not streptococcal infection.$r$, 2),
('40000000-0000-0000-0000-000000000022', 'C', 'Inflammatory bowel disease', false,
 $r$Ruled out because she has no gastrointestinal symptoms, and bilateral hilar lymphadenopathy is not a feature of inflammatory bowel disease-associated erythema nodosum.$r$, 3),
('40000000-0000-0000-0000-000000000022', 'D', 'Pregnancy', false,
 $r$Ruled out because there is no mention of pregnancy, and the specific finding of bilateral hilar lymphadenopathy points toward sarcoidosis rather than a pregnancy-related cause.$r$, 4),
('40000000-0000-0000-0000-000000000022', 'E', 'A drug reaction (e.g. to the combined oral contraceptive pill)', false,
 $r$Ruled out because no relevant drug history is given, and bilateral hilar lymphadenopathy with breathlessness specifically points toward sarcoidosis rather than a drug-induced cause.$r$, 5),

-- Q23 Chain: IBD -> EN vs PG
('40000000-0000-0000-0000-000000000023', 'A', 'Pyoderma gangrenosum, which - unlike erythema nodosum - can arise independently of her bowel disease activity and does not necessarily indicate a flare', true,
 $r$Correct. A rapidly enlarging, ulcerating lesion with a violaceous, undermined border developing from a pustule without preceding trauma is classic for pyoderma gangrenosum. Unlike erythema nodosum, which typically correlates with bowel disease activity, pyoderma gangrenosum can occur even when the underlying inflammatory bowel disease is in clinical remission, so this new skin finding does not necessarily indicate a flare of her ulcerative colitis.$r$, 1),
('40000000-0000-0000-0000-000000000023', 'B', 'Erythema nodosum, indicating an active flare of her ulcerative colitis', false,
 $r$Ruled out because erythema nodosum presents as tender nodules without ulceration, whereas this lesion has rapidly ulcerated with a violaceous, undermined border, which is the specific pattern of pyoderma gangrenosum, not erythema nodosum.$r$, 2),
('40000000-0000-0000-0000-000000000023', 'C', 'Cellulitis secondary to a minor skin injury', false,
 $r$Ruled out because there is no history of trauma, and the rapid pustule-to-ulcer evolution with an undermined, violaceous border is a specific description of pyoderma gangrenosum rather than typical infective cellulitis.$r$, 3),
('40000000-0000-0000-0000-000000000023', 'D', 'Necrotising fasciitis', false,
 $r$Ruled out because there is no severe pain out of proportion to examination findings, systemic sepsis or rapidly spreading necrosis beyond the local ulcer, which would be expected in necrotising fasciitis.$r$, 4),
('40000000-0000-0000-0000-000000000023', 'E', 'A simple skin abscess requiring incision and drainage', false,
 $r$Ruled out because incision and drainage of pyoderma gangrenosum can worsen the lesion through pathergy, and this presentation with an undermined, violaceous border is not consistent with a straightforward abscess.$r$, 5),

-- Q24 Erythema multiforme
('40000000-0000-0000-0000-000000000024', 'A', 'Erythema multiforme', true,
 $r$Correct. Multiple target lesions, each with a dusky centre, a pale ring and an erythematous outer border, developing after a recent herpes simplex virus infection (cold sore), is the classic presentation of erythema multiforme, most commonly triggered by HSV.$r$, 1),
('40000000-0000-0000-0000-000000000024', 'B', 'Stevens-Johnson syndrome', false,
 $r$Ruled out because there is no extensive mucosal involvement, skin blistering or detachment, or positive Nikolsky sign described, and Stevens-Johnson syndrome is usually drug-induced rather than triggered by a recent cold sore.$r$, 2),
('40000000-0000-0000-0000-000000000024', 'C', 'Urticaria', false,
 $r$Ruled out because urticarial wheals are typically itchy and transient, resolving within 24 hours, and lack the fixed three-zone target morphology described here.$r$, 3),
('40000000-0000-0000-0000-000000000024', 'D', 'Guttate psoriasis', false,
 $r$Ruled out because guttate psoriasis produces small, scaly, drop-like papules typically following streptococcal infection, not target-shaped lesions following a herpes simplex infection.$r$, 4),
('40000000-0000-0000-0000-000000000024', 'E', 'Pemphigus vulgaris', false,
 $r$Ruled out because pemphigus vulgaris produces flaccid blisters and erosions, often with prominent oral involvement, rather than fixed target lesions, and is not triggered by HSV infection.$r$, 5),

-- Q25 SJS vs TEN
('40000000-0000-0000-0000-000000000025', 'A', 'Toxic epidermal necrolysis', true,
 $r$Correct. This drug-triggered reaction (allopurinol is a recognised high-risk culprit), with widespread mucocutaneous involvement, a positive Nikolsky sign and epidermal detachment affecting 35% of body surface area, meets the definition of toxic epidermal necrolysis, which is defined by detachment over 30%; Stevens-Johnson syndrome is under 10%, with 10 to 30% classified as overlap.$r$, 1),
('40000000-0000-0000-0000-000000000025', 'B', 'Stevens-Johnson syndrome', false,
 $r$Ruled out because Stevens-Johnson syndrome is defined by epidermal detachment affecting less than 10% of body surface area; this patient's 35% detachment places him in the toxic epidermal necrolysis category, not Stevens-Johnson syndrome.$r$, 2),
('40000000-0000-0000-0000-000000000025', 'C', 'Erythema multiforme', false,
 $r$Ruled out because erythema multiforme is typically a milder, self-limiting condition triggered by infection, especially herpes simplex virus, with limited or no mucosal involvement and no significant epidermal detachment, unlike the extensive drug-induced involvement described here.$r$, 3),
('40000000-0000-0000-0000-000000000025', 'D', 'Staphylococcal scalded skin syndrome', false,
 $r$Ruled out because although this can also cause widespread skin detachment with a positive Nikolsky sign, it is caused by staphylococcal exfoliative toxin, typically in young children, rather than a drug reaction, and does not usually cause the prominent mucosal ulceration seen here.$r$, 4),
('40000000-0000-0000-0000-000000000025', 'E', 'Pemphigus vulgaris', false,
 $r$Ruled out because although pemphigus vulgaris also causes a positive Nikolsky sign and mucosal involvement, it develops gradually over weeks and is autoimmune rather than triggered acutely by a new drug three weeks prior with this rapid, extensive presentation.$r$, 5),

-- Q26 Pemphigus vulgaris
('40000000-0000-0000-0000-000000000026', 'A', 'Anti-desmoglein antibodies (against desmoglein 3, and often desmoglein 1)', true,
 $r$Correct. Pemphigus vulgaris is caused by IgG autoantibodies against desmoglein 3 (and often desmoglein 1), disrupting keratinocyte adhesion and causing an intraepidermal split; this explains the flaccid, easily ruptured blisters, prominent oral mucosal involvement and positive Nikolsky sign described.$r$, 1),
('40000000-0000-0000-0000-000000000026', 'B', 'Anti-BP180 and anti-BP230 antibodies', false,
 $r$Ruled out because these antibodies target hemidesmosomal proteins in bullous pemphigoid, causing a subepidermal split with tense, intact bullae, a different clinical picture from the flaccid blisters and prominent oral involvement described here.$r$, 2),
('40000000-0000-0000-0000-000000000026', 'C', 'Anti-endomysial antibodies', false,
 $r$Ruled out because anti-endomysial antibodies are associated with coeliac disease and dermatitis herpetiformis, not pemphigus vulgaris.$r$, 3),
('40000000-0000-0000-0000-000000000026', 'D', 'Antinuclear antibodies', false,
 $r$Ruled out because antinuclear antibodies are a non-specific marker associated with conditions such as systemic lupus erythematosus, not the specific blistering disease described here.$r$, 4),
('40000000-0000-0000-0000-000000000026', 'E', 'Anti-Jo-1 antibodies', false,
 $r$Ruled out because anti-Jo-1 antibodies are associated with antisynthetase syndrome in inflammatory myopathies, not with a blistering skin disease.$r$, 5),

-- Q27 Bullous pemphigoid
('40000000-0000-0000-0000-000000000027', 'A', 'Bullous pemphigoid', true,
 $r$Correct. Tense, large bullae arising from urticated plaques in an elderly patient, with minimal mucosal involvement and a negative Nikolsky sign, are classic for bullous pemphigoid, caused by autoantibodies against BP180 and BP230 producing a subepidermal split.$r$, 1),
('40000000-0000-0000-0000-000000000027', 'B', 'Pemphigus vulgaris', false,
 $r$Ruled out because pemphigus vulgaris causes flaccid, easily ruptured blisters with prominent early oral involvement and a positive Nikolsky sign, unlike the tense bullae, minimal mucosal involvement and negative Nikolsky sign described here.$r$, 2),
('40000000-0000-0000-0000-000000000027', 'C', 'Dermatitis herpetiformis', false,
 $r$Ruled out because dermatitis herpetiformis causes small, intensely itchy vesicles typically on extensor surfaces such as elbows, knees and buttocks, associated with coeliac disease, not large tense bullae on the trunk and forearms in an elderly patient.$r$, 3),
('40000000-0000-0000-0000-000000000027', 'D', 'Bullous impetigo', false,
 $r$Ruled out because bullous impetigo is a superficial bacterial infection typically seen in children, causing flaccid, fragile blisters that rupture to leave a golden crust, not tense bullae arising from urticated plaques in an elderly adult.$r$, 4),
('40000000-0000-0000-0000-000000000027', 'E', 'Erythema multiforme', false,
 $r$Ruled out because erythema multiforme produces target lesions rather than tense bullae, and is usually triggered by infection rather than arising insidiously over weeks in an elderly patient.$r$, 5),

-- Q28 AK vs SK vs melanoma
('40000000-0000-0000-0000-000000000028', 'A', 'Lesion 3 (the melanoma)', true,
 $r$Correct. Lesion 3's asymmetry, irregular border, multiple colours and reported growth over 3 months meet ABCDE criteria for suspected melanoma, warranting urgent two-week-wait referral. Lesion 1 is a benign seborrhoeic keratosis and lesion 2 is a premalignant actinic keratosis, neither of which requires urgent cancer referral.$r$, 1),
('40000000-0000-0000-0000-000000000028', 'B', 'Lesion 1 (the seborrhoeic keratosis)', false,
 $r$Ruled out because a well-demarcated, stuck-on, waxy plaque unchanged for years is the classic benign appearance of a seborrhoeic keratosis, which does not require urgent referral.$r$, 2),
('40000000-0000-0000-0000-000000000028', 'C', 'Lesion 2 (the actinic keratosis)', false,
 $r$Ruled out because although actinic keratosis is premalignant and should be monitored and treated, for example with cryotherapy or topical therapy, it does not meet the threshold for urgent two-week-wait referral in the way a suspected melanoma does.$r$, 3),
('40000000-0000-0000-0000-000000000028', 'D', 'All three lesions require urgent referral', false,
 $r$Ruled out because only lesion 3 has features suspicious for melanoma; lesions 1 and 2 can be managed in primary care or via routine dermatology review rather than urgent referral.$r$, 4),
('40000000-0000-0000-0000-000000000028', 'E', 'None of the lesions require referral of any kind', false,
 $r$Ruled out because lesion 3 has clear ABCDE features of melanoma, including asymmetry, border irregularity, colour variation and reported growth, which mandates urgent referral for excision biopsy.$r$, 5),

-- Q29 Tinea corporis
('40000000-0000-0000-0000-000000000029', 'A', 'Topical antifungal therapy (e.g. terbinafine cream)', true,
 $r$Correct. Localised tinea corporis confirmed by microscopy is treated with topical antifungal therapy such as terbinafine cream; oral antifungal therapy is reserved for extensive, resistant, or hair- or nail-involving disease.$r$, 1),
('40000000-0000-0000-0000-000000000029', 'B', 'A topical corticosteroid', false,
 $r$Ruled out because topical corticosteroids can worsen and mask a fungal infection, a phenomenon known as tinea incognito, allowing it to spread further, and do not treat the underlying dermatophyte infection.$r$, 2),
('40000000-0000-0000-0000-000000000029', 'C', 'Oral antifungal therapy as first-line for this localised lesion', false,
 $r$Ruled out because oral antifungal therapy is reserved for extensive, resistant, or scalp- or nail-involving dermatophyte infections, not first-line for a single, localised plaque.$r$, 3),
('40000000-0000-0000-0000-000000000029', 'D', 'Oral antibiotics', false,
 $r$Ruled out because this is a fungal, not bacterial, infection, so antibiotics would not be effective.$r$, 4),
('40000000-0000-0000-0000-000000000029', 'E', 'No treatment, as the lesion will resolve spontaneously without intervention', false,
 $r$Ruled out because untreated tinea corporis can persist and spread to other body sites or other people; topical antifungal treatment is indicated to clear the infection.$r$, 5),

-- Q30 Candidal intertrigo
('40000000-0000-0000-0000-000000000030', 'A', 'Candidal intertrigo', true,
 $r$Correct. Erythematous, macerated skin in flexural folds with satellite papules and pustules extending beyond the main margin, in a patient with risk factors such as diabetes and obesity, is classic for candidal intertrigo.$r$, 1),
('40000000-0000-0000-0000-000000000030', 'B', 'Tinea corporis', false,
 $r$Ruled out because tinea corporis produces an annular plaque with an active edge and central clearing, not macerated flexural erythema with satellite pustules.$r$, 2),
('40000000-0000-0000-0000-000000000030', 'C', 'Allergic contact dermatitis', false,
 $r$Ruled out because contact dermatitis is triggered by an external irritant or allergen and does not typically produce satellite lesions beyond the main margin, which is a specific feature of candidal infection.$r$, 3),
('40000000-0000-0000-0000-000000000030', 'D', 'Inverse (flexural) psoriasis', false,
 $r$Ruled out because although inverse psoriasis can affect skin folds, it does not typically produce satellite pustules beyond the margin, which is characteristic of Candida infection.$r$, 4),
('40000000-0000-0000-0000-000000000030', 'E', 'Erythrasma', false,
 $r$Ruled out because erythrasma is a bacterial infection producing well-demarcated, reddish-brown patches that fluoresce coral-pink under Wood lamp examination, without the satellite pustules typical of candidal intertrigo.$r$, 5)
,

-- Q31 Scabies
('40000000-0000-0000-0000-000000000031', 'A', 'Topical permethrin 5% cream applied to the whole body, with simultaneous treatment of all household and close contacts regardless of symptoms', true,
 $r$Correct. Scabies management requires permethrin applied to the whole body, repeated after 7 days, plus simultaneous treatment of all close contacts, even if currently asymptomatic, to prevent reinfestation and ongoing transmission given the incubation period before symptoms appear.$r$, 1),
('40000000-0000-0000-0000-000000000031', 'B', 'Topical permethrin for the patient only, with contacts treated only if they develop symptoms', false,
 $r$Ruled out because scabies has an incubation period before symptoms develop, so waiting for contacts to become symptomatic risks ongoing transmission and reinfestation; all close contacts should be treated simultaneously regardless of symptoms.$r$, 2),
('40000000-0000-0000-0000-000000000031', 'C', 'Oral antihistamines alone', false,
 $r$Ruled out because antihistamines only relieve itch symptomatically and do not eradicate the underlying mite infestation.$r$, 3),
('40000000-0000-0000-0000-000000000031', 'D', 'A topical corticosteroid alone', false,
 $r$Ruled out because topical corticosteroids do not kill the scabies mite and would not resolve the infestation, and could mask the underlying diagnosis.$r$, 4),
('40000000-0000-0000-0000-000000000031', 'E', 'Oral flucloxacillin', false,
 $r$Ruled out because this is a parasitic infestation, not a primary bacterial infection, so antibiotics would not treat the underlying cause.$r$, 5),

-- Q32 Lichen planus
('40000000-0000-0000-0000-000000000032', 'A', 'Lichen planus', true,
 $r$Correct. Itchy, flat-topped, violaceous, polygonal papules with fine white surface striae on the flexor wrists, together with similar white lacy streaks on the buccal mucosa, is classic for lichen planus.$r$, 1),
('40000000-0000-0000-0000-000000000032', 'B', 'Psoriasis', false,
 $r$Ruled out because psoriasis produces well-demarcated, silvery-scaled plaques typically on extensor surfaces, not violaceous, polygonal papules with fine white surface striae on flexor surfaces and oral mucosa.$r$, 2),
('40000000-0000-0000-0000-000000000032', 'C', 'Discoid lupus erythematosus', false,
 $r$Ruled out because discoid lupus produces scarring, erythematous, scaly plaques typically on sun-exposed skin such as the face and scalp, not violaceous, polygonal, flat-topped papules with white surface striae on the wrists and mouth.$r$, 3),
('40000000-0000-0000-0000-000000000032', 'D', 'Pityriasis rosea', false,
 $r$Ruled out because pityriasis rosea produces oval, fawn-coloured patches with a fine collarette of scale in a Christmas-tree distribution, not violaceous polygonal papules with white surface striae.$r$, 4),
('40000000-0000-0000-0000-000000000032', 'E', 'Oral candidiasis with a coincidental unrelated skin rash', false,
 $r$Ruled out because the oral white lacy streaks and the wrist papules together represent a single unifying diagnosis of lichen planus affecting both skin and mucosa, rather than two coincidental, unrelated conditions.$r$, 5),

-- Q33 Vitiligo
('40000000-0000-0000-0000-000000000033', 'A', 'Autoimmune thyroid disease', true,
 $r$Correct. Vitiligo results from autoimmune destruction of melanocytes and is most commonly associated with other autoimmune conditions, particularly autoimmune thyroid disease, as well as type 1 diabetes, pernicious anaemia and Addison disease.$r$, 1),
('40000000-0000-0000-0000-000000000033', 'B', 'Chronic kidney disease', false,
 $r$Ruled out because chronic kidney disease is not a recognised autoimmune association of vitiligo.$r$, 2),
('40000000-0000-0000-0000-000000000033', 'C', 'Ischaemic heart disease', false,
 $r$Ruled out because ischaemic heart disease is not part of the recognised autoimmune disease cluster associated with vitiligo.$r$, 3),
('40000000-0000-0000-0000-000000000033', 'D', 'Hepatitis C infection', false,
 $r$Ruled out because hepatitis C is more classically associated with lichen planus and porphyria cutanea tarda, not vitiligo.$r$, 4),
('40000000-0000-0000-0000-000000000033', 'E', 'Chronic obstructive pulmonary disease', false,
 $r$Ruled out because COPD is not an autoimmune condition and has no recognised association with vitiligo.$r$, 5),

-- Q34 Rosacea
('40000000-0000-0000-0000-000000000034', 'A', 'Topical metronidazole (or topical ivermectin)', true,
 $r$Correct. Topical metronidazole (or ivermectin) is first-line treatment for the papulopustular component of rosacea, alongside trigger avoidance such as sunlight, alcohol and spicy food.$r$, 1),
('40000000-0000-0000-0000-000000000034', 'B', 'A potent topical corticosteroid', false,
 $r$Ruled out because potent topical corticosteroids can worsen rosacea and precipitate steroid-induced rosacea or perioral dermatitis, and should be avoided.$r$, 2),
('40000000-0000-0000-0000-000000000034', 'C', 'Oral isotretinoin as first-line therapy', false,
 $r$Ruled out because oral isotretinoin is reserved for severe or refractory rosacea, not first-line treatment for typical papulopustular disease.$r$, 3),
('40000000-0000-0000-0000-000000000034', 'D', 'Benzoyl peroxide', false,
 $r$Ruled out because benzoyl peroxide is a first-line treatment for acne, not rosacea, and can be irritating to the more sensitive skin typically affected by rosacea.$r$, 4),
('40000000-0000-0000-0000-000000000034', 'E', 'A topical retinoid as first-line monotherapy', false,
 $r$Ruled out because topical retinoids are a mainstay of acne treatment, not first-line for rosacea, and the absence of comedones here specifically distinguishes rosacea from acne.$r$, 5),

-- Q35 Hidradenitis suppurativa
('40000000-0000-0000-0000-000000000035', 'A', 'Smoking cessation', true,
 $r$Correct. Smoking is strongly associated with the severity and progression of hidradenitis suppurativa, and smoking cessation (alongside weight loss) is the most important modifiable lifestyle measure to reduce disease activity.$r$, 1),
('40000000-0000-0000-0000-000000000035', 'B', 'Increasing dietary fibre intake', false,
 $r$Ruled out because dietary fibre has no established role in modifying hidradenitis suppurativa disease activity.$r$, 2),
('40000000-0000-0000-0000-000000000035', 'C', 'Strict avoidance of all deodorants and antiperspirants', false,
 $r$Ruled out because although some products may irritate affected skin, this is not established as the most important modifiable lifestyle measure; smoking cessation has the strongest evidence base for reducing disease severity.$r$, 3),
('40000000-0000-0000-0000-000000000035', 'D', 'Increasing sun exposure to the affected areas', false,
 $r$Ruled out because sun exposure has no recognised benefit in hidradenitis suppurativa, and excess sun exposure carries its own separate skin cancer risk.$r$, 4),
('40000000-0000-0000-0000-000000000035', 'E', 'Daily use of antibacterial soap alone, with no other lifestyle changes', false,
 $r$Ruled out because although good skin hygiene may help symptomatically, this alone does not address the most significant modifiable risk factors of smoking and obesity, which are more strongly linked to disease severity.$r$, 5),

-- Q36 Pressure ulcer staging
('40000000-0000-0000-0000-000000000036', 'A', 'Category/Grade 3 (full-thickness skin loss, with visible subcutaneous fat but no exposed bone, tendon or muscle)', true,
 $r$Correct. Full-thickness skin loss with visible subcutaneous fat, but without exposed bone, tendon or muscle, defines a Category/Grade 3 pressure ulcer.$r$, 1),
('40000000-0000-0000-0000-000000000036', 'B', 'Category/Grade 1 (non-blanching erythema with intact skin)', false,
 $r$Ruled out because Category 1 describes intact skin with non-blanching erythema, not the full-thickness skin loss with visible subcutaneous fat described here.$r$, 2),
('40000000-0000-0000-0000-000000000036', 'C', 'Category/Grade 2 (partial-thickness skin loss, such as a blister or abrasion)', false,
 $r$Ruled out because Category 2 involves only partial-thickness skin loss, whereas this description of full-thickness skin loss with visible fat is more severe, meeting Category 3 criteria.$r$, 3),
('40000000-0000-0000-0000-000000000036', 'D', 'Category/Grade 4 (full-thickness tissue loss with exposed bone, tendon or muscle)', false,
 $r$Ruled out because Category 4 specifically requires exposed bone, tendon or muscle, which is explicitly stated as absent in this case.$r$, 4),
('40000000-0000-0000-0000-000000000036', 'E', 'Unstageable (obscured full-thickness tissue loss)', false,
 $r$Ruled out because the wound bed is clearly visible and described, with subcutaneous fat seen and no bone, tendon or muscle exposed, allowing accurate staging as Category 3 rather than being obscured by slough or eschar.$r$, 5),

-- Q37 Diabetic foot prevention
('40000000-0000-0000-0000-000000000037', 'A', 'Annual diabetic foot risk assessment, including screening for peripheral neuropathy (e.g. 10g monofilament testing) and peripheral arterial disease (e.g. palpation of foot pulses)', true,
 $r$Correct. All patients with diabetes should have an annual foot risk assessment screening for loss of protective sensation and reduced blood supply, to stratify their risk and guide preventive education and follow-up.$r$, 1),
('40000000-0000-0000-0000-000000000037', 'B', 'Routine plain X-ray of both feet', false,
 $r$Ruled out because plain X-ray is not part of routine annual screening in an asymptomatic patient with normal-looking feet; it is reserved for investigating suspected complications such as osteomyelitis or Charcot foot.$r$, 2),
('40000000-0000-0000-0000-000000000037', 'C', 'Referral for prophylactic vascular surgery', false,
 $r$Ruled out because there is no indication for surgical intervention in a patient with no foot problems and normal-appearing feet; screening comes first to identify those at risk.$r$, 3),
('40000000-0000-0000-0000-000000000037', 'D', 'Nerve conduction studies', false,
 $r$Ruled out because simple bedside tests such as the 10g monofilament are used for routine screening; formal nerve conduction studies are not part of standard annual diabetic foot review.$r$, 4),
('40000000-0000-0000-0000-000000000037', 'E', 'No specific foot assessment is needed unless symptoms develop', false,
 $r$Ruled out because diabetic peripheral neuropathy can be asymptomatic, and routine annual screening, even with no symptoms, is essential to detect at-risk feet before ulceration occurs.$r$, 5),

-- Q38 Chain: diabetes -> foot ulcer -> osteomyelitis
('40000000-0000-0000-0000-000000000038', 'A', 'Osteomyelitis, resulting from a chronic, unnoticed diabetic foot ulcer becoming deeply infected', true,
 $r$Correct. Poor glycaemic control causes peripheral neuropathy, so the ulcer went unnoticed for weeks, and impairs healing; the chronic ulcer has become infected, and a positive probe-to-bone test, reaching hard, gritty tissue, is a strong clinical indicator of underlying osteomyelitis.$r$, 1),
('40000000-0000-0000-0000-000000000038', 'B', 'A simple, uninfected neuropathic ulcer requiring only dressing changes', false,
 $r$Ruled out because the malodour, surrounding erythema and positive probe-to-bone test indicate deep infection extending to bone, not a simple uninfected ulcer that would resolve with dressings alone.$r$, 2),
('40000000-0000-0000-0000-000000000038', 'C', 'Charcot foot (neuropathic osteoarthropathy)', false,
 $r$Ruled out because Charcot foot classically presents with a warm, swollen and often painless but deformed foot due to bone and joint destruction, rather than a malodorous ulcer with a positive probe-to-bone test suggesting infection.$r$, 3),
('40000000-0000-0000-0000-000000000038', 'D', 'Critical limb ischaemia alone, without infection', false,
 $r$Ruled out because although peripheral arterial disease can contribute to poor healing, the malodour, erythema and probe-to-bone test specifically indicate infection extending to bone, which is not explained by ischaemia alone.$r$, 4),
('40000000-0000-0000-0000-000000000038', 'E', 'An allergic contact reaction to his dressings', false,
 $r$Ruled out because contact dermatitis would present with itchy, erythematous, eczematous change at the dressing site, not a malodorous, deep ulcer with a positive probe-to-bone test.$r$, 5),

-- Q39 Burns depth/TBSA/Parkland
('40000000-0000-0000-0000-000000000039', 'A', '4320 mL, given over the first 8 hours from the time of the burn', true,
 $r$Correct. His burns affect the entire anterior trunk (18% TBSA) and one entire arm (9% TBSA) using the Wallace rule of nines, giving 27% TBSA. The Parkland formula 24-hour requirement is 4 mL x %TBSA x body weight in kg = 4 x 27 x 80 = 8640 mL, of which half (4320 mL) is given over the first 8 hours, timed from the moment of the burn, not from presentation.$r$, 1),
('40000000-0000-0000-0000-000000000039', 'B', '8640 mL, given over the first 8 hours from the time of the burn', false,
 $r$Ruled out because 8640 mL is the correct total 24-hour Parkland requirement, but only half of this total (4320 mL) is given in the first 8 hours, with the remaining half over the subsequent 16 hours; giving the entire 24-hour amount in the first 8 hours would risk fluid overload.$r$, 2),
('40000000-0000-0000-0000-000000000039', 'C', '4320 mL, given over the first 8 hours from the time of arrival in hospital', false,
 $r$Ruled out because Parkland formula timing is calculated from the time of the burn itself, not from the time of hospital arrival; since he presented 1 hour after the burn, that hour has already elapsed and must be accounted for, rather than restarting the 8-hour clock at arrival.$r$, 3),
('40000000-0000-0000-0000-000000000039', 'D', '2160 mL, given over the first 8 hours from the time of the burn', false,
 $r$Ruled out because this figure would only be reached by underestimating the affected %TBSA (for example using only the arm alone); the correct %TBSA here, combining the anterior trunk and one arm, is 27%, giving 4320 mL for the first 8 hours.$r$, 4),
('40000000-0000-0000-0000-000000000039', 'E', 'No intravenous fluid resuscitation is required, as burns are best managed with oral rehydration alone', false,
 $r$Ruled out because burns affecting 27% of body surface area require formal intravenous fluid resuscitation using the Parkland formula; oral rehydration alone would be inadequate for a burn of this extent.$r$, 5),

-- Q40 Necrobiosis lipoidica diabeticorum
('40000000-0000-0000-0000-000000000040', 'A', 'Necrobiosis lipoidica diabeticorum', true,
 $r$Correct. A shiny, yellow-brown, atrophic plaque with telangiectasia on the shin in a patient with type 1 diabetes is classic for necrobiosis lipoidica diabeticorum.$r$, 1),
('40000000-0000-0000-0000-000000000040', 'B', 'Diabetic dermopathy', false,
 $r$Ruled out because diabetic dermopathy ("shin spots") presents as small, multiple, hyperpigmented, atrophic macules, not a larger, well-demarcated, shiny, yellow-brown plaque with telangiectasia.$r$, 2),
('40000000-0000-0000-0000-000000000040', 'C', 'Pretibial myxoedema', false,
 $r$Ruled out because pretibial myxoedema is a non-pitting, waxy, thickened plaque associated with Graves disease, not the shiny, yellow-brown, atrophic, telangiectatic appearance described here, and there is no mention of thyroid disease.$r$, 3),
('40000000-0000-0000-0000-000000000040', 'D', 'Venous stasis eczema', false,
 $r$Ruled out because venous stasis eczema is typically associated with signs of chronic venous insufficiency such as oedema, haemosiderin pigmentation and varicosities, and is itchy and eczematous rather than a well-demarcated, shiny, atrophic plaque.$r$, 4),
('40000000-0000-0000-0000-000000000040', 'E', 'Erythema nodosum', false,
 $r$Ruled out because erythema nodosum presents as tender, erythematous nodules, not a chronic, shiny, yellow-brown, atrophic plaque with telangiectasia.$r$, 5)
,

-- Q41 Acanthosis nigricans and occult malignancy
('40000000-0000-0000-0000-000000000041', 'A', 'Urgent investigation for an occult gastrointestinal malignancy (most classically gastric adenocarcinoma)', true,
 $r$Correct. Abrupt-onset, extensive acanthosis nigricans in an older, non-obese patient with weight loss and early satiety is a red flag for malignant (paraneoplastic) acanthosis nigricans, most classically associated with gastric adenocarcinoma; this pattern differs from the common, gradual-onset, obesity/insulin-resistance-associated form and warrants urgent investigation.$r$, 1),
('40000000-0000-0000-0000-000000000041', 'B', 'Reassurance that this is a benign finding related to insulin resistance, with routine follow-up', false,
 $r$Ruled out because the abrupt onset over only 6 weeks in a normal-weight older man, together with weight loss, is atypical for benign, insulin-resistance-related acanthosis nigricans, and should instead raise concern for an underlying malignancy.$r$, 2),
('40000000-0000-0000-0000-000000000041', 'C', 'Screening oral glucose tolerance test as the priority investigation', false,
 $r$Ruled out because although acanthosis nigricans can reflect insulin resistance, the abrupt onset, normal body weight, older age and systemic symptoms of weight loss and early satiety make an occult malignancy a far more urgent concern than screening for diabetes.$r$, 3),
('40000000-0000-0000-0000-000000000041', 'D', 'Topical retinoid therapy to the affected skin', false,
 $r$Ruled out because topical treatment addresses only the cosmetic appearance of the skin change and does not investigate or treat the underlying cause, which in this atypical presentation should prompt malignancy screening.$r$, 4),
('40000000-0000-0000-0000-000000000041', 'E', 'Referral for bariatric surgery assessment', false,
 $r$Ruled out because he is of normal body weight, so obesity-related insulin resistance is not the likely explanation here; bariatric surgery would not be an appropriate step in this presentation.$r$, 5),

-- Q42 Xanthelasma
('40000000-0000-0000-0000-000000000042', 'A', 'A fasting lipid profile', true,
 $r$Correct. Xanthelasma reflects lipid-laden macrophage deposition and warrants assessment of the lipid profile, as it may indicate underlying hyperlipidaemia, including familial hypercholesterolaemia, although it can occasionally occur with normal lipid levels.$r$, 1),
('40000000-0000-0000-0000-000000000042', 'B', 'Skin biopsy of the lesion', false,
 $r$Ruled out because the clinical appearance of xanthelasma is usually diagnostic, and biopsy is not routinely required; the priority is to investigate for an underlying lipid disorder rather than confirm the skin diagnosis histologically.$r$, 2),
('40000000-0000-0000-0000-000000000042', 'C', 'Thyroid function tests as the priority investigation', false,
 $r$Ruled out because although some skin changes, such as pretibial myxoedema, are linked to thyroid disease, xanthelasma is specifically associated with lipid abnormalities, making a lipid profile the priority investigation.$r$, 3),
('40000000-0000-0000-0000-000000000042', 'D', 'Referral for urgent ophthalmology assessment', false,
 $r$Ruled out because xanthelasma itself does not typically threaten vision or require urgent ophthalmological intervention; the priority is systemic assessment for hyperlipidaemia.$r$, 4),
('40000000-0000-0000-0000-000000000042', 'E', 'No further investigation is required, as this is a purely cosmetic finding', false,
 $r$Ruled out because although xanthelasma itself is benign, it can be a marker of underlying hyperlipidaemia, including familial hypercholesterolaemia, which should be actively investigated rather than dismissed.$r$, 5),

-- Q43 Herpes zoster ophthalmicus
('40000000-0000-0000-0000-000000000043', 'A', 'Urgent ophthalmology referral, given the presence of Hutchinson sign', true,
 $r$Correct. Vesicles on the tip or side of the nose (Hutchinson sign) indicate involvement of the nasociliary branch of the trigeminal nerve, which predicts a significantly higher risk of ocular involvement in herpes zoster ophthalmicus, and mandates urgent ophthalmology referral alongside prompt antiviral treatment.$r$, 1),
('40000000-0000-0000-0000-000000000043', 'B', 'Reassurance, as vesicles on the nose are an incidental and unimportant finding', false,
 $r$Ruled out because this finding, Hutchinson sign, specifically predicts a higher risk of serious ocular complications such as keratitis and uveitis, and should not be dismissed as incidental.$r$, 2),
('40000000-0000-0000-0000-000000000043', 'C', 'Oral aciclovir alone, with no need for ophthalmology input regardless of examination findings', false,
 $r$Ruled out because although oral antiviral treatment is appropriate, the presence of Hutchinson sign specifically warrants urgent ophthalmology assessment to detect and manage any ocular involvement before vision-threatening complications develop.$r$, 3),
('40000000-0000-0000-0000-000000000043', 'D', 'Topical antibiotic eye drops as sole treatment, without systemic antiviral therapy', false,
 $r$Ruled out because this is a viral, not bacterial, condition, so systemic antiviral therapy is required, alongside specialist ophthalmology assessment, rather than topical antibiotics alone.$r$, 4),
('40000000-0000-0000-0000-000000000043', 'E', 'Delay any specialist referral until vision changes actually develop', false,
 $r$Ruled out because waiting for vision changes to develop risks permanent visual damage; the presence of Hutchinson sign should prompt referral before symptoms of ocular involvement become apparent.$r$, 5),

-- Q44 Ramsay Hunt syndrome
('40000000-0000-0000-0000-000000000044', 'A', 'Ramsay Hunt syndrome (herpes zoster oticus)', true,
 $r$Correct. Unilateral facial nerve palsy affecting the whole side of the face equally, together with vesicles in the ear canal and pinna and vestibulocochlear symptoms such as hearing loss and dizziness, is classic for Ramsay Hunt syndrome, caused by varicella zoster virus reactivation in the geniculate ganglion.$r$, 1),
('40000000-0000-0000-0000-000000000044', 'B', $o$Bell's palsy$o$, false,
 $r$Ruled out because this is an idiopathic facial nerve palsy without a vesicular rash; the presence of vesicles in the ear canal and pinna, together with hearing loss and dizziness, points specifically to Ramsay Hunt syndrome instead.$r$, 2),
('40000000-0000-0000-0000-000000000044', 'C', 'A stroke affecting the facial nerve nucleus', false,
 $r$Ruled out because a central (upper motor neurone) cause of facial weakness would typically spare the forehead, unlike the equal, whole-face weakness described here, which indicates a peripheral facial nerve lesion; the vesicular rash further supports Ramsay Hunt syndrome over a central cause.$r$, 3),
('40000000-0000-0000-0000-000000000044', 'D', 'Otitis externa with an unrelated coincidental facial palsy', false,
 $r$Ruled out because the combination of vesicles in the ear canal, facial palsy and vestibulocochlear symptoms represents a single unifying diagnosis of Ramsay Hunt syndrome rather than two coincidental, unrelated conditions.$r$, 4),
('40000000-0000-0000-0000-000000000044', 'E', 'Acoustic neuroma', false,
 $r$Ruled out because although an acoustic neuroma can cause hearing loss and, if large, facial weakness, it develops gradually over a much longer timescale and would not present with an acute vesicular rash in the ear canal.$r$, 5),

-- Q45 Molluscum contagiosum
('40000000-0000-0000-0000-000000000045', 'A', 'Reassurance, as the lesions are usually self-limiting and resolve without treatment over months to a couple of years', true,
 $r$Correct. Molluscum contagiosum, caused by a poxvirus, is common and usually self-limiting in immunocompetent children; active treatment is not routinely required, though physical removal such as cryotherapy can be considered if lesions are troublesome or persistent.$r$, 1),
('40000000-0000-0000-0000-000000000045', 'B', 'Oral antiviral therapy', false,
 $r$Ruled out because there is no established oral antiviral treatment for molluscum contagiosum, and it is not caused by a virus that responds to agents such as aciclovir.$r$, 2),
('40000000-0000-0000-0000-000000000045', 'C', 'Urgent excision biopsy to exclude malignancy', false,
 $r$Ruled out because the classic umbilicated, dome-shaped papules described are clinically diagnostic of molluscum contagiosum in a child, and urgent biopsy is not required.$r$, 3),
('40000000-0000-0000-0000-000000000045', 'D', 'Systemic corticosteroids', false,
 $r$Ruled out because systemic corticosteroids have no role in treating molluscum contagiosum and could worsen the infection by further suppressing local immunity.$r$, 4),
('40000000-0000-0000-0000-000000000045', 'E', 'Topical antibiotic cream', false,
 $r$Ruled out because this is a viral, not bacterial, skin infection, so topical antibiotics would not be effective against the underlying cause.$r$, 5),

-- Q46 Viral warts
('40000000-0000-0000-0000-000000000046', 'A', 'A viral wart (verruca), caused by human papillomavirus', true,
 $r$Correct. A rough, hyperkeratotic papule on the sole, tender on pressure, is the classic description of a plantar viral wart caused by human papillomavirus.$r$, 1),
('40000000-0000-0000-0000-000000000046', 'B', 'A corn (clavus) due to pressure', false,
 $r$Ruled out because although corns also occur on pressure-bearing areas of the foot, they typically have a central translucent core and lack the rough, hyperkeratotic, papillomatous surface characteristic of a viral wart.$r$, 2),
('40000000-0000-0000-0000-000000000046', 'C', 'Tinea pedis', false,
 $r$Ruled out because tinea pedis typically causes scaling and maceration between the toes or a diffuse "moccasin" scaling pattern, not a discrete, rough, hyperkeratotic papule.$r$, 3),
('40000000-0000-0000-0000-000000000046', 'D', 'A seborrhoeic keratosis', false,
 $r$Ruled out because seborrhoeic keratoses are more common on the trunk and face in older adults, presenting as waxy, stuck-on plaques, not a tender, rough papule on the sole of a child's foot.$r$, 4),
('40000000-0000-0000-0000-000000000046', 'E', 'Malignant melanoma', false,
 $r$Ruled out because there is no description of pigmentation, irregular borders or other ABCDE features of melanoma; this is a benign, common viral lesion.$r$, 5),

-- Q47 Three-patient alopecia vignette
('40000000-0000-0000-0000-000000000047', 'A', 'Patient 3', true,
 $r$Correct. Diffuse, non-patchy scalp thinning beginning around 2 to 3 months after a major physiological stressor, here a complicated delivery with significant blood loss, is the classic pattern of telogen effluvium, caused by a synchronised shift of hair follicles into the resting (telogen) phase.$r$, 1),
('40000000-0000-0000-0000-000000000047', 'B', 'Patient 1', false,
 $r$Ruled out because a single, well-demarcated, smooth patch of hair loss with exclamation mark hairs at the margin is the classic pattern of alopecia areata, not telogen effluvium.$r$, 2),
('40000000-0000-0000-0000-000000000047', 'C', 'Patient 2', false,
 $r$Ruled out because gradual, patterned thinning at the bitemporal hairline and vertex with a positive family history is the classic pattern of androgenetic alopecia, not telogen effluvium.$r$, 3),
('40000000-0000-0000-0000-000000000047', 'D', 'All three patients have the same underlying diagnosis', false,
 $r$Ruled out because each patient's history and examination findings, patchy loss with exclamation mark hairs, patterned familial thinning, and diffuse shedding after a stressor, are distinct and allow each to be diagnosed separately rather than treated as the same condition.$r$, 4),
('40000000-0000-0000-0000-000000000047', 'E', 'None of the three patients, as scalp biopsy is required before any diagnosis can be made', false,
 $r$Ruled out because the history and examination findings described are sufficient to reach a clinical diagnosis in each case without requiring scalp biopsy.$r$, 5),

-- Q48 Hyperhidrosis
('40000000-0000-0000-0000-000000000048', 'A', 'Topical aluminium chloride antiperspirant', true,
 $r$Correct. Topical aluminium chloride is first-line treatment for primary focal hyperhidrosis affecting the palms, soles or axillae.$r$, 1),
('40000000-0000-0000-0000-000000000048', 'B', 'Oral anticholinergic medication as first-line therapy', false,
 $r$Ruled out because oral anticholinergics are used as a later-line option if topical treatment and measures such as iontophoresis or botulinum toxin fail, not first-line.$r$, 2),
('40000000-0000-0000-0000-000000000048', 'C', 'Botulinum toxin injections as first-line therapy', false,
 $r$Ruled out because botulinum toxin is typically reserved for cases not responding to first-line topical antiperspirant therapy.$r$, 3),
('40000000-0000-0000-0000-000000000048', 'D', 'Surgical sympathectomy', false,
 $r$Ruled out because surgery is a last-resort option after other treatments have failed, given its irreversibility and potential complications such as compensatory sweating.$r$, 4),
('40000000-0000-0000-0000-000000000048', 'E', 'Investigation for an underlying malignancy as the priority', false,
 $r$Ruled out because this presentation, focal, bilateral, symmetric, present since adolescence with no systemic symptoms, is typical of primary rather than secondary hyperhidrosis, which does not require malignancy screening.$r$, 5),

-- Q49 Graves disease skin signs
('40000000-0000-0000-0000-000000000049', 'A', 'Pretibial myxoedema and thyroid acropachy', true,
 $r$Correct. Non-pitting, waxy, thickened skin plaques over the shins is pretibial myxoedema, and clubbing with soft tissue swelling of the fingers is thyroid acropachy; both are rare manifestations of Graves disease that occur almost always alongside significant thyroid eye disease.$r$, 1),
('40000000-0000-0000-0000-000000000049', 'B', 'Necrobiosis lipoidica and diabetic dermopathy', false,
 $r$Ruled out because these are both associated with diabetes mellitus, not Graves disease, and do not match the specific waxy shin plaques and finger clubbing described here.$r$, 2),
('40000000-0000-0000-0000-000000000049', 'C', 'Xanthelasma and corneal arcus', false,
 $r$Ruled out because these are markers of hyperlipidaemia, not Graves disease, and do not match the described shin and finger findings.$r$, 3),
('40000000-0000-0000-0000-000000000049', 'D', 'Erythema nodosum and pyoderma gangrenosum', false,
 $r$Ruled out because these are associated with conditions such as sarcoidosis, streptococcal infection and inflammatory bowel disease, not Graves disease, and do not match the waxy shin plaques and clubbing described here.$r$, 4),
('40000000-0000-0000-0000-000000000049', 'E', 'Livedo reticularis and digital ulcers', false,
 $r$Ruled out because these are associated with conditions such as antiphospholipid syndrome or systemic sclerosis, not Graves disease.$r$, 5),

-- Q50 Chain: topical steroid misuse -> atrophy -> secondary infection
('40000000-0000-0000-0000-000000000050', 'A', 'Secondary bacterial skin infection (impetiginisation), resulting from a compromised skin barrier caused by long-term potent topical corticosteroid-induced skin atrophy', true,
 $r$Correct. Prolonged, unsupervised use of a potent topical corticosteroid causes cutaneous atrophy (thinning, telangiectasia, easy bruising), which weakens the skin barrier and predisposes to secondary bacterial infection, presenting here as honey-coloured crusting and weeping typical of impetiginisation.$r$, 1),
('40000000-0000-0000-0000-000000000050', 'B', 'A simple flare of her original eczema, unrelated to her steroid use', false,
 $r$Ruled out because honey-coloured crusting and weeping is characteristic of secondary bacterial infection, not a typical eczema flare, and her skin atrophy from prolonged steroid use is a specific, identifiable risk factor for this complication.$r$, 2),
('40000000-0000-0000-0000-000000000050', 'C', 'Steroid-induced rosacea', false,
 $r$Ruled out because steroid-induced rosacea typically presents with persistent facial erythema, papules and pustules rather than honey-coloured crusting and weeping, which is more typical of a secondary bacterial infection.$r$, 3),
('40000000-0000-0000-0000-000000000050', 'D', 'An allergic contact reaction to the topical corticosteroid itself', false,
 $r$Ruled out because although contact allergy to topical corticosteroids can occur, it typically presents as an eczematous reaction rather than honey-coloured crusting and weeping, which is a specific feature of bacterial impetiginisation.$r$, 4),
('40000000-0000-0000-0000-000000000050', 'E', 'Cutaneous T-cell lymphoma', false,
 $r$Ruled out because this is a rare, chronic malignant condition that would not explain an acute change of honey-coloured crusting and weeping in the setting of known topical steroid misuse and skin atrophy, which is a much more common and directly explicable cause.$r$, 5)

on conflict (question_id, label) do nothing;

-- ---------------------------------------------------------------------------
-- Discriminators
-- ---------------------------------------------------------------------------

insert into question_discriminators (question_id, discriminator_text, sort_order) values

('40000000-0000-0000-0000-000000000001', $d$Basal cell carcinoma classically presents as a slow-growing, pearly or translucent papule or nodule with overlying telangiectasia and a rolled edge, and very rarely metastasises.$d$, 1),
('40000000-0000-0000-0000-000000000001', $d$Squamous cell carcinoma classically presents as a more rapidly growing, indurated, ulcerated or hyperkeratotic nodule, and carries a recognised, though still overall low, risk of metastasis.$d$, 2),
('40000000-0000-0000-0000-000000000001', $d$Chronic sun exposure is the dominant risk factor for both, but rapid growth, ulceration, larger size and immunosuppression specifically raise concern for squamous cell carcinoma over basal cell carcinoma.$d$, 3),

('40000000-0000-0000-0000-000000000002', $d$The ABCDE mnemonic (Asymmetry, Border irregularity, Colour variation, Diameter over 6 mm, Evolution/change) helps identify lesions suspicious for melanoma.$d$, 1),
('40000000-0000-0000-0000-000000000002', $d$Breslow thickness, the depth of invasion measured on histology after complete excision, is the single most important prognostic factor in melanoma.$d$, 2),
('40000000-0000-0000-0000-000000000002', $d$Suspicious pigmented lesions should be referred urgently for excision biopsy rather than partially sampled or destroyed in primary care, to allow accurate histological staging.$d$, 3),

('40000000-0000-0000-0000-000000000003', $d$Chronic immunosuppression after solid organ transplantation substantially increases the risk of cutaneous squamous cell carcinoma, more so than basal cell carcinoma, reversing the usual population ratio.$d$, 1),
('40000000-0000-0000-0000-000000000003', $d$Actinic keratoses are premalignant and can progress to invasive squamous cell carcinoma; rapid growth, induration, ulceration and bleeding in a previously stable lesion are red flags for this transformation.$d$, 2),
('40000000-0000-0000-0000-000000000003', $d$Any suspicious lesion in an immunosuppressed transplant recipient warrants prompt biopsy rather than reassurance or ablative treatment alone.$d$, 3),

('40000000-0000-0000-0000-000000000004', $d$NICE recommends combination topical therapy, not single-agent monotherapy, as first-line treatment for mild-to-moderate acne, given for a 12-week course.$d$, 1),
('40000000-0000-0000-0000-000000000004', $d$Topical and oral antibiotic monotherapy are both avoided specifically to reduce the risk of antibiotic resistance.$d$, 2),
('40000000-0000-0000-0000-000000000004', $d$The acne treatment ladder escalates from topical combination therapy, to oral antibiotic plus topical agent (or the combined oral contraceptive pill in women), to oral isotretinoin for severe or resistant disease.$d$, 3),

('40000000-0000-0000-0000-000000000005', $d$Erysipelas involves the upper dermis and superficial lymphatics, producing a sharply demarcated, raised border, whereas cellulitis involves deeper dermis and subcutaneous tissue with a more diffuse edge.$d$, 1),
('40000000-0000-0000-0000-000000000005', $d$Flucloxacillin is first-line oral therapy for straightforward cellulitis or erysipelas, covering both Streptococcus pyogenes and Staphylococcus aureus.$d$, 2),
('40000000-0000-0000-0000-000000000005', $d$The Eron classification, based on systemic toxicity and comorbidity, guides whether treatment can be managed orally in the community or requires admission for intravenous therapy.$d$, 3),

('40000000-0000-0000-0000-000000000006', $d$Non-sedating second-generation antihistamines are first-line for chronic urticaria, and the dose can be increased up to fourfold if there is an inadequate response before adding other agents.$d$, 1),
('40000000-0000-0000-0000-000000000006', $d$Sedating first-generation antihistamines and long-term oral corticosteroids are avoided as regular treatment due to their side-effect profiles.$d$, 2),
('40000000-0000-0000-0000-000000000006', $d$Omalizumab is reserved for antihistamine-refractory chronic spontaneous urticaria under specialist care.$d$, 3),

('40000000-0000-0000-0000-000000000007', $d$Anaphylaxis is defined by the acute onset of an allergic-type reaction with life-threatening airway, breathing or circulatory problems, usually with skin or mucosal changes.$d$, 1),
('40000000-0000-0000-0000-000000000007', $d$Intramuscular adrenaline is given immediately and can be repeated after 5 minutes if there is no improvement, without waiting for other treatments.$d$, 2),
('40000000-0000-0000-0000-000000000007', $d$Antihistamines and corticosteroids are useful adjuncts but must never delay or replace adrenaline as the first-line treatment.$d$, 3),

('40000000-0000-0000-0000-000000000008', $d$ACE inhibitor angioedema is bradykinin-mediated and occurs without preceding urticaria, distinguishing it from allergic (mast cell/IgE-mediated) angioedema.$d$, 1),
('40000000-0000-0000-0000-000000000008', $d$It can occur at any time during treatment, including after years of uneventful use, and does not reliably respond to antihistamines, corticosteroids or adrenaline.$d$, 2),
('40000000-0000-0000-0000-000000000008', $d$Management is to stop the ACE inhibitor immediately and manage the airway; specific bradykinin-pathway therapies, such as icatibant, may be used in severe cases.$d$, 3),

('40000000-0000-0000-0000-000000000009', $d$Atopic eczema classically affects flexural surfaces (antecubital and popliteal fossae) in older children and adults, with a personal or family history of atopy.$d$, 1),
('40000000-0000-0000-0000-000000000009', $d$Peripheral eosinophilia and raised serum IgE are commonly found in atopic eczema, reflecting the underlying Th2-driven immune response.$d$, 2),
('40000000-0000-0000-0000-000000000009', $d$The chronic, relapsing course since infancy in a flexural distribution helps distinguish atopic eczema from other itchy rashes such as scabies or contact dermatitis.$d$, 3),

('40000000-0000-0000-0000-000000000010', $d$Eczema herpeticum is a herpes simplex virus superinfection of eczematous skin, presenting with clusters of monomorphic, punched-out vesicles or erosions, often with fever and malaise.$d$, 1),
('40000000-0000-0000-0000-000000000010', $d$It is a medical emergency requiring urgent systemic aciclovir, given the risk of rapid dissemination, particularly in children.$d$, 2),
('40000000-0000-0000-0000-000000000010', $d$Periorbital involvement requires urgent ophthalmology input because of the risk of herpetic keratitis.$d$, 3),

('40000000-0000-0000-0000-000000000011', $d$Chronic plaque psoriasis classically affects extensor surfaces such as the elbows and knees, the scalp and the lower back, with well-demarcated, silvery-scaled plaques.$d$, 1),
('40000000-0000-0000-0000-000000000011', $d$The Auspitz sign, pinpoint bleeding when scale is removed, reflects the thinned suprapapillary epidermis over elongated dermal papillae.$d$, 2),
('40000000-0000-0000-0000-000000000011', $d$The Koebner phenomenon describes new psoriatic plaques developing at sites of skin trauma.$d$, 3),

('40000000-0000-0000-0000-000000000012', $d$Guttate psoriasis is triggered by streptococcal infection, often pharyngitis, in children and young adults, appearing 2 to 4 weeks later.$d$, 1),
('40000000-0000-0000-0000-000000000012', $d$It presents as widespread small, drop-like, scaly papules predominantly on the trunk and proximal limbs.$d$, 2),
('40000000-0000-0000-0000-000000000012', $d$It is often self-limiting but can recur or evolve into chronic plaque psoriasis.$d$, 3),

('40000000-0000-0000-0000-000000000013', $d$Generalised pustular psoriasis (von Zumbusch type) is a rare, life-threatening variant with widespread sterile pustules on erythematous skin, fever and systemic illness.$d$, 1),
('40000000-0000-0000-0000-000000000013', $d$Abrupt withdrawal of systemic corticosteroids is a recognised trigger in patients with underlying psoriasis.$d$, 2),
('40000000-0000-0000-0000-000000000013', $d$Complications include hypoalbuminaemia, hypocalcaemia and high-output cardiac failure, requiring hospital admission and specialist care.$d$, 3),

('40000000-0000-0000-0000-000000000014', $d$Nail pitting, onycholysis and subungual hyperkeratosis in psoriasis correlate with an increased risk of psoriatic arthritis.$d$, 1),
('40000000-0000-0000-0000-000000000014', $d$Dactylitis (sausage digit) and distal interphalangeal joint involvement are characteristic features of psoriatic arthritis.$d$, 2),
('40000000-0000-0000-0000-000000000014', $d$Methotrexate is the standard first-line systemic agent for extensive psoriasis and psoriatic arthritis, with biologics reserved for disease that fails or is unsuitable for conventional systemic therapy.$d$, 3),

('40000000-0000-0000-0000-000000000015', $d$Henoch-Schonlein purpura is an IgA-mediated small vessel vasculitis presenting with palpable purpura over the buttocks and extensor lower limbs, arthralgia, abdominal pain and renal involvement.$d$, 1),
('40000000-0000-0000-0000-000000000015', $d$Renal involvement resembles IgA nephropathy and is the main determinant of long-term outcome, requiring monitoring of blood pressure and urinalysis.$d$, 2),
('40000000-0000-0000-0000-000000000015', $d$Most cases are self-limiting, but a minority progress to chronic kidney disease, particularly if there is significant proteinuria or nephrotic-range findings.$d$, 3),

('40000000-0000-0000-0000-000000000016', $d$Heliotrope rash is a violaceous, often oedematous rash around the eyes, classic for dermatomyositis.$d$, 1),
('40000000-0000-0000-0000-000000000016', $d$Gottron papules are violaceous, scaly papules over the extensor surfaces of the finger joints, also classic for dermatomyositis.$d$, 2),
('40000000-0000-0000-0000-000000000016', $d$These skin signs distinguish dermatomyositis from polymyositis, which causes muscle disease without these cutaneous features.$d$, 3),

('40000000-0000-0000-0000-000000000017', $d$Dermatomyositis, more so than polymyositis, has a well-recognised association with occult malignancy, particularly in adults over 50.$d$, 1),
('40000000-0000-0000-0000-000000000017', $d$Ovarian, lung, pancreatic, gastric and colorectal cancers, and lymphoma, are among the most commonly associated malignancies.$d$, 2),
('40000000-0000-0000-0000-000000000017', $d$Unexplained weight loss alongside new dermatomyositis should prompt thorough malignancy screening rather than reassurance.$d$, 3),

('40000000-0000-0000-0000-000000000018', $d$Dermatitis herpetiformis is strongly associated with coeliac disease, with granular IgA deposition at the dermo-epidermal junction on skin biopsy.$d$, 1),
('40000000-0000-0000-0000-000000000018', $d$Dapsone rapidly controls the intensely itchy vesicular rash, while a gluten-free diet is the definitive long-term treatment addressing the underlying coeliac disease.$d$, 2),
('40000000-0000-0000-0000-000000000018', $d$Patients should be screened for coeliac disease with serology (anti-tTG or anti-endomysial antibodies) when dermatitis herpetiformis is suspected.$d$, 3),

('40000000-0000-0000-0000-000000000019', $d$Dermatitis herpetiformis is a cutaneous marker of coeliac disease and implies ongoing gluten-driven small bowel villous damage if unrecognised or untreated.$d$, 1),
('40000000-0000-0000-0000-000000000019', $d$Coeliac-related malabsorption classically causes iron, folate and vitamin B12 deficiency, most commonly presenting as iron-deficiency anaemia.$d$, 2),
('40000000-0000-0000-0000-000000000019', $d$A gluten-free diet addresses both the skin disease and the malabsorption at their shared root cause.$d$, 3),

('40000000-0000-0000-0000-000000000020', $d$Fixed drug eruption recurs at the same anatomical site with each re-exposure to the causative drug.$d$, 1),
('40000000-0000-0000-0000-000000000020', $d$Common culprits include co-trimoxazole, NSAIDs, tetracyclines and sulphonamides.$d$, 2),
('40000000-0000-0000-0000-000000000020', $d$Lesions typically leave residual post-inflammatory hyperpigmentation after resolution.$d$, 3),

('40000000-0000-0000-0000-000000000021', $d$Amoxicillin (or ampicillin) given to a patient with undiagnosed infectious mononucleosis classically triggers a widespread morbilliform rash in a very high proportion of cases.$d$, 1),
('40000000-0000-0000-0000-000000000021', $d$This reaction is thought to be a transient phenomenon related to the viral illness rather than a true IgE-mediated penicillin allergy, though patients are often still advised to avoid penicillins as a precaution.$d$, 2),
('40000000-0000-0000-0000-000000000021', $d$Lymphadenopathy, splenomegaly and atypical lymphocytes on blood film support a diagnosis of infectious mononucleosis (Epstein-Barr virus).$d$, 3),

('40000000-0000-0000-0000-000000000022', $d$Erythema nodosum presents as tender, erythematous nodules typically over the shins.$d$, 1),
('40000000-0000-0000-0000-000000000022', $d$Recognised causes include sarcoidosis, streptococcal infection, inflammatory bowel disease, pregnancy, tuberculosis and certain drugs such as sulphonamides or the combined oral contraceptive pill.$d$, 2),
('40000000-0000-0000-0000-000000000022', $d$Bilateral hilar lymphadenopathy on chest X-ray, alongside erythema nodosum, is a hallmark of sarcoidosis-associated disease.$d$, 3),

('40000000-0000-0000-0000-000000000023', $d$Pyoderma gangrenosum begins as a pustule or papule that rapidly breaks down into a painful ulcer with a violaceous, undermined border, and shows pathergy, worsening with minor trauma or surgical intervention.$d$, 1),
('40000000-0000-0000-0000-000000000023', $d$Unlike erythema nodosum, which typically correlates with inflammatory bowel disease activity, pyoderma gangrenosum can occur independently of bowel disease activity, including during clinical remission.$d$, 2),
('40000000-0000-0000-0000-000000000023', $d$Surgical debridement or incision should generally be avoided in suspected pyoderma gangrenosum because of the risk of pathergy worsening the ulcer.$d$, 3),

('40000000-0000-0000-0000-000000000024', $d$Erythema multiforme presents as target lesions with three zones: a dusky or blistered centre, a pale ring, and an erythematous outer border.$d$, 1),
('40000000-0000-0000-0000-000000000024', $d$Herpes simplex virus infection is the most common trigger, though mycoplasma and certain drugs can also cause it.$d$, 2),
('40000000-0000-0000-0000-000000000024', $d$It is usually self-limiting and distinct from the more severe Stevens-Johnson syndrome/toxic epidermal necrolysis spectrum, which is typically drug-induced.$d$, 3),

('40000000-0000-0000-0000-000000000025', $d$Stevens-Johnson syndrome and toxic epidermal necrolysis form a spectrum classified by the percentage of epidermal detachment: SJS under 10%, SJS/TEN overlap 10 to 30%, and TEN over 30%.$d$, 1),
('40000000-0000-0000-0000-000000000025', $d$Common causative drugs include allopurinol, carbamazepine, lamotrigine, sulphonamides and certain NSAIDs.$d$, 2),
('40000000-0000-0000-0000-000000000025', $d$The SCORTEN score uses clinical and laboratory parameters to estimate mortality risk and guide the intensity of supportive care.$d$, 3)
,

('40000000-0000-0000-0000-000000000026', $d$Pemphigus vulgaris is caused by IgG autoantibodies against desmoglein 3 (and often desmoglein 1), causing an intraepidermal split.$d$, 1),
('40000000-0000-0000-0000-000000000026', $d$Flaccid, easily ruptured blisters and early, prominent oral mucosal erosions are characteristic, with a positive Nikolsky sign.$d$, 2),
('40000000-0000-0000-0000-000000000026', $d$This contrasts with bullous pemphigoid, which involves a subepidermal split and produces tense, intact bullae with a negative Nikolsky sign.$d$, 3),

('40000000-0000-0000-0000-000000000027', $d$Bullous pemphigoid is caused by IgG autoantibodies against BP180 and BP230, hemidesmosomal proteins producing a subepidermal split.$d$, 1),
('40000000-0000-0000-0000-000000000027', $d$It typically affects elderly patients, causing tense, intact bullae, often preceded by itchy, urticated plaques, with a negative Nikolsky sign.$d$, 2),
('40000000-0000-0000-0000-000000000027', $d$Mucosal involvement is less common and less severe than in pemphigus vulgaris, which involves an intraepidermal split with flaccid blisters.$d$, 3),

('40000000-0000-0000-0000-000000000028', $d$Seborrhoeic keratosis is a benign lesion with a characteristic well-demarcated, waxy, "stuck-on" appearance and no malignant potential.$d$, 1),
('40000000-0000-0000-0000-000000000028', $d$Actinic keratosis is a premalignant, rough, scaly lesion on chronically sun-exposed skin, carrying a small risk of progression to squamous cell carcinoma, managed with treatment and surveillance rather than urgent referral.$d$, 2),
('40000000-0000-0000-0000-000000000028', $d$Melanoma, identified by ABCDE features and a history of change, requires urgent two-week-wait referral for excision biopsy.$d$, 3),

('40000000-0000-0000-0000-000000000029', $d$Tinea corporis produces an annular, scaly plaque with a well-defined, active edge and central clearing, confirmed by microscopy or culture of skin scrapings.$d$, 1),
('40000000-0000-0000-0000-000000000029', $d$Topical antifungal therapy is first-line for localised disease; oral antifungal therapy is reserved for extensive, resistant or hair- or nail-involving infection.$d$, 2),
('40000000-0000-0000-0000-000000000029', $d$Topical corticosteroids should be avoided, as they can mask and worsen the infection, a phenomenon known as tinea incognito.$d$, 3),

('40000000-0000-0000-0000-000000000030', $d$Candidal intertrigo affects moist, occluded skin folds and characteristically produces satellite papules or pustules beyond the main erythematous margin.$d$, 1),
('40000000-0000-0000-0000-000000000030', $d$Diabetes, obesity and immunosuppression are recognised risk factors due to warmth, moisture and impaired local immunity.$d$, 2),
('40000000-0000-0000-0000-000000000030', $d$Treatment involves topical antifungal therapy and keeping the affected area dry, alongside addressing modifiable risk factors such as glycaemic control.$d$, 3),

('40000000-0000-0000-0000-000000000031', $d$Scabies is caused by the mite Sarcoptes scabiei, producing intensely itchy burrows, characteristically in the finger webs, wrists and genitals, worse at night.$d$, 1),
('40000000-0000-0000-0000-000000000031', $d$Topical permethrin 5% is first-line treatment, applied to the whole body and repeated after 7 days.$d$, 2),
('40000000-0000-0000-0000-000000000031', $d$All household and close contacts should be treated simultaneously, regardless of symptoms, to prevent reinfestation.$d$, 3),

('40000000-0000-0000-0000-000000000032', $d$Lichen planus produces itchy, flat-topped, violaceous, polygonal papules, classically on the flexor surfaces of the wrists.$d$, 1),
('40000000-0000-0000-0000-000000000032', $d$Wickham striae, fine white lines on the surface of the papules, are a characteristic diagnostic feature.$d$, 2),
('40000000-0000-0000-0000-000000000032', $d$Oral involvement produces a white, lacy pattern on the buccal mucosa, and lichen planus can also affect the nails and genital skin.$d$, 3),

('40000000-0000-0000-0000-000000000033', $d$Vitiligo results from autoimmune destruction of melanocytes, producing well-demarcated, completely depigmented, rather than merely pale, patches of skin.$d$, 1),
('40000000-0000-0000-0000-000000000033', $d$It is strongly associated with other autoimmune conditions, especially autoimmune thyroid disease, and also type 1 diabetes, pernicious anaemia and Addison disease.$d$, 2),
('40000000-0000-0000-0000-000000000033', $d$Screening for associated autoimmune conditions should be considered in patients presenting with vitiligo.$d$, 3),

('40000000-0000-0000-0000-000000000034', $d$Rosacea causes central facial erythema, telangiectasia and papulopustules without comedones, distinguishing it from acne vulgaris.$d$, 1),
('40000000-0000-0000-0000-000000000034', $d$Topical metronidazole or ivermectin is first-line treatment for the papulopustular component.$d$, 2),
('40000000-0000-0000-0000-000000000034', $d$Potent topical corticosteroids should be avoided, as they can worsen rosacea or precipitate steroid-induced rosacea.$d$, 3),

('40000000-0000-0000-0000-000000000035', $d$Hidradenitis suppurativa is a chronic inflammatory condition of apocrine gland-bearing skin, such as the axillae, groin, inframammary and perianal areas, causing recurrent painful nodules, abscesses and sinus tract formation.$d$, 1),
('40000000-0000-0000-0000-000000000035', $d$Smoking and obesity are the two most significant modifiable risk factors associated with disease severity and progression.$d$, 2),
('40000000-0000-0000-0000-000000000035', $d$Management includes long-term antibiotics, hormonal therapy or biologics for more severe disease, alongside these lifestyle measures.$d$, 3),

('40000000-0000-0000-0000-000000000036', $d$Pressure ulcer staging (Category/Grade 1-4) is based on the depth of tissue involved, from non-blanching erythema with intact skin (1) through to exposed bone, tendon or muscle (4).$d$, 1),
('40000000-0000-0000-0000-000000000036', $d$Category 3 describes full-thickness skin loss with visible subcutaneous fat, but no exposed bone, tendon or muscle.$d$, 2),
('40000000-0000-0000-0000-000000000036', $d$Prevention relies on regular repositioning, risk assessment such as the Waterlow score, pressure-redistributing equipment and skin inspection.$d$, 3),

('40000000-0000-0000-0000-000000000037', $d$Diabetic foot risk stratification is based on screening for loss of protective sensation (neuropathy) and peripheral arterial disease, alongside foot deformity and previous ulceration or amputation history.$d$, 1),
('40000000-0000-0000-0000-000000000037', $d$Annual review and patient education, including self-inspection, appropriate footwear and prompt attention to wounds, are central to preventing diabetic foot ulceration.$d$, 2),
('40000000-0000-0000-0000-000000000037', $d$Patients found to be at moderate or high risk are referred to specialist diabetic foot services or podiatry for closer monitoring.$d$, 3),

('40000000-0000-0000-0000-000000000038', $d$Poor glycaemic control leads to peripheral neuropathy (loss of protective sensation) and impaired wound healing, both of which predispose to unnoticed, chronic foot ulceration.$d$, 1),
('40000000-0000-0000-0000-000000000038', $d$A positive probe-to-bone test, reaching hard, gritty tissue at the base of an ulcer, is a strong clinical indicator of underlying osteomyelitis and should prompt further imaging and consideration of prolonged antibiotic therapy.$d$, 2),
('40000000-0000-0000-0000-000000000038', $d$Malodour and surrounding erythema suggest deep or spreading infection rather than a simple, uninfected ulcer.$d$, 3),

('40000000-0000-0000-0000-000000000039', $d$Burn depth is assessed by colour, blister formation, pain and blanching: superficial partial-thickness burns are pink, blistered, painful and blanch, whereas deeper burns may appear pale or leathery, non-blanching and less painful due to nerve damage.$d$, 1),
('40000000-0000-0000-0000-000000000039', $d$The Wallace rule of nines estimates %TBSA in adults using multiples of nine for major body regions (e.g. one arm = 9%, anterior trunk = 18%), and the Parkland formula (4 mL x %TBSA x body weight in kg) calculates the 24-hour fluid requirement, with half given in the first 8 hours from the time of the burn.$d$, 2),
('40000000-0000-0000-0000-000000000039', $d$Burns affecting a significant %TBSA, or involving the face, hands, feet, perineum, genitalia or major joints, meet criteria for referral to a specialist burns unit.$d$, 3),

('40000000-0000-0000-0000-000000000040', $d$Necrobiosis lipoidica diabeticorum presents as well-demarcated, shiny, yellow-brown, atrophic plaques with telangiectasia, typically on the shins.$d$, 1),
('40000000-0000-0000-0000-000000000040', $d$It is strongly associated with diabetes mellitus, more often type 1, although it can rarely occur without diabetes.$d$, 2),
('40000000-0000-0000-0000-000000000040', $d$The atrophic skin is fragile and prone to ulceration, particularly after minor trauma.$d$, 3),

('40000000-0000-0000-0000-000000000041', $d$Benign acanthosis nigricans is typically gradual in onset and associated with obesity, insulin resistance, or endocrinopathies such as polycystic ovary syndrome.$d$, 1),
('40000000-0000-0000-0000-000000000041', $d$Malignant (paraneoplastic) acanthosis nigricans has an abrupt onset, is often more extensive, and occurs in older, frequently non-obese patients, most classically associated with gastric adenocarcinoma.$d$, 2),
('40000000-0000-0000-0000-000000000041', $d$Systemic features such as unintentional weight loss alongside abrupt-onset acanthosis nigricans should prompt urgent investigation for an underlying malignancy.$d$, 3),

('40000000-0000-0000-0000-000000000042', $d$Xanthelasma consists of yellowish plaques of lipid-laden macrophages, typically at the medial aspects of the eyelids.$d$, 1),
('40000000-0000-0000-0000-000000000042', $d$It is associated with hyperlipidaemia, including familial hypercholesterolaemia, and should prompt a fasting lipid profile, although it can occur with normal lipid levels.$d$, 2),
('40000000-0000-0000-0000-000000000042', $d$Other stigmata of lipid disease, such as corneal arcus and tendon xanthomata, should also be examined for.$d$, 3),

('40000000-0000-0000-0000-000000000043', $d$Herpes zoster ophthalmicus involves the ophthalmic division (V1) of the trigeminal nerve and can threaten vision through keratitis, uveitis or secondary glaucoma.$d$, 1),
('40000000-0000-0000-0000-000000000043', $d$Hutchinson sign, vesicles on the tip or side of the nose, reflects nasociliary nerve involvement and predicts a significantly increased risk of ocular complications.$d$, 2),
('40000000-0000-0000-0000-000000000043', $d$Any evidence of ocular or periocular involvement in shingles warrants urgent ophthalmology referral alongside systemic antiviral treatment.$d$, 3),

('40000000-0000-0000-0000-000000000044', $d$Ramsay Hunt syndrome results from varicella zoster virus reactivation in the geniculate ganglion of the facial nerve, causing facial palsy with vesicles in the ear canal or on the pinna.$d$, 1),
('40000000-0000-0000-0000-000000000044', $d$Whole-face weakness, with the forehead and lower face equally affected, indicates a peripheral (lower motor neurone) facial nerve lesion, distinguishing it from a central cause, which would spare the forehead.$d$, 2),
('40000000-0000-0000-0000-000000000044', $d$Unlike Bell palsy, Ramsay Hunt syndrome has a worse prognosis for facial nerve recovery and requires prompt antiviral treatment plus corticosteroids.$d$, 3),

('40000000-0000-0000-0000-000000000045', $d$Molluscum contagiosum is caused by a poxvirus, producing small, firm, dome-shaped papules with central umbilication.$d$, 1),
('40000000-0000-0000-0000-000000000045', $d$It is usually self-limiting in immunocompetent individuals, typically resolving over months to around 2 years without treatment.$d$, 2),
('40000000-0000-0000-0000-000000000045', $d$Widespread or persistent lesions in an adult should prompt consideration of underlying immunosuppression.$d$, 3),

('40000000-0000-0000-0000-000000000046', $d$Viral warts are caused by human papillomavirus and commonly affect the hands (common warts) and soles (plantar warts/verrucae).$d$, 1),
('40000000-0000-0000-0000-000000000046', $d$They are usually self-limiting in immunocompetent individuals, though this can take months to years, and treatment options include topical salicylic acid or cryotherapy if troublesome.$d$, 2),
('40000000-0000-0000-0000-000000000046', $d$Extensive or persistent warts should prompt consideration of underlying immunosuppression, similarly to molluscum contagiosum.$d$, 3),

('40000000-0000-0000-0000-000000000047', $d$Alopecia areata produces well-demarcated, smooth, non-scarring patches of hair loss, often with exclamation mark hairs at the margin, and is autoimmune in nature.$d$, 1),
('40000000-0000-0000-0000-000000000047', $d$Androgenetic alopecia produces gradual, patterned, genetically determined thinning, such as bitemporal recession and vertex thinning in men, unlike the diffuse or patchy patterns of the other two conditions.$d$, 2),
('40000000-0000-0000-0000-000000000047', $d$Telogen effluvium produces diffuse, non-patchy shedding typically 2 to 3 months after a triggering physiological stressor, and is usually self-limiting with spontaneous regrowth.$d$, 3),

('40000000-0000-0000-0000-000000000048', $d$Primary focal hyperhidrosis typically affects the palms, soles, axillae or face bilaterally and symmetrically, with onset in childhood or adolescence.$d$, 1),
('40000000-0000-0000-0000-000000000048', $d$Secondary hyperhidrosis is more generalised and has an identifiable underlying cause, such as hyperthyroidism, infection or malignancy, which should be considered when the pattern or history is atypical.$d$, 2),
('40000000-0000-0000-0000-000000000048', $d$Topical aluminium chloride is first-line treatment, escalating to iontophoresis, botulinum toxin injections and, rarely, surgery for refractory cases.$d$, 3),

('40000000-0000-0000-0000-000000000049', $d$Pretibial myxoedema is an infiltrative dermopathy of Graves disease, causing non-pitting, waxy, thickened plaques over the shins due to glycosaminoglycan deposition.$d$, 1),
('40000000-0000-0000-0000-000000000049', $d$Thyroid acropachy is a rare manifestation of Graves disease causing clubbing and soft tissue swelling of the fingers with periosteal new bone formation.$d$, 2),
('40000000-0000-0000-0000-000000000049', $d$Both signs almost always occur alongside significant thyroid eye disease (Graves ophthalmopathy) and high TSH-receptor antibody titres.$d$, 3),

('40000000-0000-0000-0000-000000000050', $d$Long-term, unsupervised use of potent topical corticosteroids causes cutaneous atrophy: thinning of the epidermis and dermis, telangiectasia, striae and easy bruising.$d$, 1),
('40000000-0000-0000-0000-000000000050', $d$This atrophic, compromised skin barrier increases susceptibility to secondary bacterial infection, such as impetiginisation, presenting with honey-coloured crusting and weeping.$d$, 2),
('40000000-0000-0000-0000-000000000050', $d$Potent topical corticosteroids should be used under medical supervision, with appropriate potency, duration and site restrictions, to prevent these complications.$d$, 3);
