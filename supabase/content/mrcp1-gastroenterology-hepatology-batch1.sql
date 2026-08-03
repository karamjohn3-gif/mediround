-- MRCP Part 1 -- Gastroenterology and Hepatology batch 1 (50 questions), the
-- first batch for this topic (previously 0 questions). Coverage spans
-- obstructive jaundice and its causes (gallstones, pancreatic head cancer,
-- cholangiocarcinoma) with ERCP/EUS management; spontaneous bacterial
-- peritonitis (diagnosis, organisms, treatment, prophylaxis); hepatic
-- encephalopathy pathophysiology and precipitants; oesophageal cancer and
-- Barrett oesophagus; Clostridioides difficile infection (risk factors,
-- severity stratification, first-line through recurrent-episode
-- management); acute upper GI bleeding (variceal vs peptic ulcer,
-- Glasgow-Blatchford/Rockall scoring, endoscopic and pharmacological
-- management); coeliac disease; inflammatory bowel disease; primary
-- biliary cholangitis; autoimmune hepatitis; Fitz-Hugh-Curtis syndrome;
-- ascites and cirrhosis complications including hepatorenal syndrome;
-- Wilson disease; haemochromatosis; alpha-1 antitrypsin deficiency; acute
-- pancreatitis; pancreatic cancer; peptic ulcer disease/H. pylori
-- eradication; GORD and achalasia; primary sclerosing cholangitis and
-- hepatocellular carcinoma surveillance; drug-induced liver injury
-- (paracetamol/NAPQI); non-alcoholic fatty liver disease; alcohol-related
-- liver disease and withdrawal; terminal ileal malabsorption; irritable
-- bowel syndrome; carcinoid syndrome; Zollinger-Ellison syndrome;
-- Budd-Chiari syndrome; and refeeding syndrome.
--
-- STATUS: status='published' -- per explicit instruction from the person
-- who commissioned this batch, these questions are inserted directly as
-- published (no draft-then-review step for this batch). This content has
-- NOT been individually reviewed by a clinician or MRCP-specific medical
-- educator; it has been checked by the writing model against standard UK
-- reference sources (NICE guidance including NG12 suspected cancer
-- referral and CG184-style dyspepsia/GORD management; NICE NG199-aligned
-- CDI severity/treatment principles; British Society of Gastroenterology
-- guidance on variceal bleeding, ascites/SBP management and Barrett
-- oesophagus surveillance; Public Health England CDI severity
-- stratification; standard MRCP1-level textbook physiology) to a solid
-- standard, but has not been checked by a human with relevant clinical
-- expertise.
--
-- Run after the topics migrations (0001-0004) and seed.sql, via the SQL
-- Editor.

insert into questions (id, exam, topic_id, status, difficulty, stem, lead_in, tags) values

-- 1. PBC - anti-mitochondrial antibody
(
  '50000000-0000-0000-0000-000000000001', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'foundation',
  $stem$A 52-year-old woman presents with several months of pruritus and fatigue. Liver function tests show a cholestatic pattern with a markedly raised alkaline phosphatase and gamma-GT, with only mildly elevated transaminases.$stem$,
  'Which antibody is most strongly associated with the underlying diagnosis?',
  array['primary biliary cholangitis','anti-mitochondrial antibody','cholestasis']
),

-- 2. C. difficile - diagnostic stool test
(
  '50000000-0000-0000-0000-000000000002', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'foundation',
  $stem$A 78-year-old man on a medical ward develops profuse watery diarrhoea five days after starting a course of co-amoxiclav for a chest infection.$stem$,
  'Which stool investigation confirms active Clostridioides difficile infection, as opposed to simple colonisation?',
  array['Clostridioides difficile','stool toxin test','diarrhoea']
),

-- 3. Coeliac disease - anti-tTG IgA serology
(
  '50000000-0000-0000-0000-000000000003', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'foundation',
  $stem$A 29-year-old woman presents with chronic bloating, fatigue and iron deficiency anaemia. She is currently eating a normal gluten-containing diet.$stem$,
  'Which serological test is most appropriate as the first-line investigation for coeliac disease?',
  array['coeliac disease','serology','anti-tissue transglutaminase']
),

-- 4. Wilson disease - low caeruloplasmin
(
  '50000000-0000-0000-0000-000000000004', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'foundation',
  $stem$A 19-year-old man presents with abnormal liver function tests and a mild tremor. Slit-lamp examination reveals brownish rings around the periphery of both corneas.$stem$,
  'Which blood test result would most support the underlying diagnosis?',
  array['Wilson disease','caeruloplasmin','Kayser-Fleischer rings']
),

-- 5. Haemochromatosis - transferrin saturation
(
  '50000000-0000-0000-0000-000000000005', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'foundation',
  $stem$A 48-year-old man is found on routine blood tests to have a raised ferritin. He is otherwise well but mentions new joint pains affecting his hands.$stem$,
  'Which is the most appropriate first-line test to confirm iron overload before considering genetic testing?',
  array['haemochromatosis','transferrin saturation','iron overload']
),

-- 6. Achalasia - bird's beak on barium swallow
(
  '50000000-0000-0000-0000-000000000006', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'foundation',
  $stem$A 45-year-old man presents with several months of progressive dysphagia to both solids and liquids, and regurgitation of undigested food. A barium swallow is performed.$stem$,
  'What appearance on the barium swallow would be most characteristic of the underlying diagnosis?',
  array['achalasia','barium swallow','bird beak sign']
),

-- 7. Autoimmune hepatitis type 1 - anti-smooth muscle antibody
(
  '50000000-0000-0000-0000-000000000007', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'foundation',
  $stem$A 34-year-old woman presents with fatigue and is found to have markedly elevated transaminases. She has a background of autoimmune thyroiditis.$stem$,
  'Which antibody is most characteristic of type 1 autoimmune hepatitis?',
  array['autoimmune hepatitis','anti-smooth muscle antibody','type 1']
),

-- 8. SBP - ascitic neutrophil diagnostic threshold
(
  '50000000-0000-0000-0000-000000000008', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'foundation',
  $stem$A 61-year-old man with alcohol-related cirrhosis and known ascites presents with fever and abdominal discomfort. A diagnostic ascitic tap is performed.$stem$,
  'Above which ascitic fluid neutrophil count is a diagnosis of spontaneous bacterial peritonitis confirmed?',
  array['spontaneous bacterial peritonitis','ascitic neutrophil count','diagnosis']
),

-- 9. Zollinger-Ellison syndrome - fasting gastrin
(
  '50000000-0000-0000-0000-000000000009', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'foundation',
  $stem$A 50-year-old man presents with multiple recurrent peptic ulcers despite standard-dose proton pump inhibitor therapy and confirmed H. pylori eradication. He also reports chronic diarrhoea.$stem$,
  'Which investigation would be most useful to confirm the suspected underlying diagnosis?',
  array['Zollinger-Ellison syndrome','gastrinoma','fasting gastrin']
),

-- 10. Barrett oesophagus - columnar metaplasia
(
  '50000000-0000-0000-0000-000000000010', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'foundation',
  $stem$A 58-year-old man with a 15-year history of gastro-oesophageal reflux disease undergoes endoscopy, which shows a segment of salmon-pink mucosa extending from the gastro-oesophageal junction into the distal oesophagus. Biopsies are taken.$stem$,
  'What histological change would confirm a diagnosis of Barrett oesophagus?',
  array['Barrett oesophagus','columnar metaplasia','GORD']
),

-- 11. Alpha-1 antitrypsin deficiency - liver and lung disease
(
  '50000000-0000-0000-0000-000000000011', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'foundation',
  $stem$A 34-year-old non-smoker presents with early-onset breathlessness and is found to have panacinar emphysema, most marked at the lung bases, on CT chest. Liver function tests are also mildly deranged.$stem$,
  'Which underlying condition links these pulmonary and hepatic findings?',
  array['alpha-1 antitrypsin deficiency','panacinar emphysema','liver disease']
),

-- 12. Carcinoid syndrome - urinary 5-HIAA
(
  '50000000-0000-0000-0000-000000000012', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'foundation',
  $stem$A 55-year-old woman presents with episodic facial flushing, watery diarrhoea and wheeze. Examination reveals a pansystolic murmur suggestive of tricuspid regurgitation.$stem$,
  'Which urinary test is most useful to support the suspected diagnosis?',
  array['carcinoid syndrome','5-HIAA','neuroendocrine tumour']
),

-- 13. Refeeding syndrome - hypophosphataemia
(
  '50000000-0000-0000-0000-000000000013', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'foundation',
  $stem$A 24-year-old woman with anorexia nervosa and a BMI of 13 kg/m2, who has eaten very little for the past two weeks, is admitted for nutritional rehabilitation and started on enteral feeding.$stem$,
  'Which electrolyte abnormality is most characteristic of refeeding syndrome in this patient?',
  array['refeeding syndrome','hypophosphataemia','malnutrition']
),

-- 14. GORD - first-line PPI trial
(
  '50000000-0000-0000-0000-000000000014', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'foundation',
  $stem$A 40-year-old man presents with a 6-month history of retrosternal burning after meals and at night, with no dysphagia, weight loss or anaemia.$stem$,
  'What is the most appropriate initial management?',
  array['GORD','proton pump inhibitor','first-line management']
),

-- 15. IBS - Rome IV criteria
(
  '50000000-0000-0000-0000-000000000015', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'foundation',
  $stem$A 27-year-old woman has had recurrent abdominal pain for the past year, occurring on average at least one day per week over the last three months. The pain is associated with a change in stool frequency and is typically relieved by defecation. Coeliac serology and faecal calprotectin are normal.$stem$,
  'Which diagnostic framework is most appropriate for confirming irritable bowel syndrome in this patient?',
  array['irritable bowel syndrome','Rome IV criteria','functional bowel disorder']
),

-- 16. Obstructive jaundice - choledocholithiasis pathway
(
  '50000000-0000-0000-0000-000000000016', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'core',
  $stem$A 62-year-old woman presents with sudden-onset right upper quadrant pain, jaundice, pale stools and dark urine. She has known gallstones. Liver function tests show a markedly raised conjugated bilirubin, ALP and GGT. Abdominal ultrasound shows a dilated common bile duct with gallstones in the gallbladder, but no stone is clearly seen within the duct itself.$stem$,
  'What is the most appropriate next step in investigation and management?',
  array['obstructive jaundice','choledocholithiasis','MRCP','ERCP']
),

-- 17. Fitz-Hugh-Curtis syndrome
(
  '50000000-0000-0000-0000-000000000017', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'core',
  $stem$A 24-year-old sexually active woman presents with several days of right upper quadrant pain and lower abdominal pain, with associated vaginal discharge. She is systemically unwell with a low-grade fever. Examination reveals right upper quadrant tenderness and cervical motion tenderness on bimanual examination. Liver function tests are normal.$stem$,
  'What is the most likely explanation for her right upper quadrant pain?',
  array['Fitz-Hugh-Curtis syndrome','perihepatitis','pelvic inflammatory disease']
),

-- 18. SBP - prophylaxis criteria
(
  '50000000-0000-0000-0000-000000000018', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'core',
  $stem$A 57-year-old man with alcohol-related cirrhosis and ascites is reviewed in clinic. Ascitic fluid analysis shows a protein concentration of 8 g/L. His bilirubin is 45 micromol/L and his Child-Pugh score is 10. He has never had spontaneous bacterial peritonitis.$stem$,
  'What is the most appropriate next step regarding antibiotic prophylaxis against spontaneous bacterial peritonitis?',
  array['spontaneous bacterial peritonitis','antibiotic prophylaxis','ascitic protein']
),

-- 19. Hepatic encephalopathy - lactulose mechanism
(
  '50000000-0000-0000-0000-000000000019', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'core',
  $stem$A 64-year-old man with known cirrhosis is started on lactulose for grade II hepatic encephalopathy.$stem$,
  'By which mechanism does lactulose improve hepatic encephalopathy?',
  array['hepatic encephalopathy','lactulose','ammonia']
),

-- 20. Hepatic encephalopathy - precipitant vignette
(
  '50000000-0000-0000-0000-000000000020', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'core',
  $stem$A 59-year-old man with known cirrhosis is brought in by his family with two days of increasing confusion and drowsiness. He has not opened his bowels for five days. He denies any recent illness, and observations, including temperature, are normal. Abdominal examination reveals a soft, non-tender abdomen loaded with faeces on palpation.$stem$,
  'What is the most likely precipitant of his current presentation?',
  array['hepatic encephalopathy','precipitant','constipation']
),

-- 21. Oesophageal cancer - SCC vs adenocarcinoma
(
  '50000000-0000-0000-0000-000000000021', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'core',
  $stem$Two patients present with progressive dysphagia and weight loss.

Patient 1 is a 68-year-old man with a long history of heavy alcohol use and smoking, found to have a tumour in the middle third of the oesophagus.

Patient 2 is a 61-year-old man with long-standing gastro-oesophageal reflux disease and known Barrett oesophagus, found to have a tumour in the lower third of the oesophagus.$stem$,
  'What is the most likely histological type of tumour in each patient, respectively?',
  array['oesophageal cancer','squamous cell carcinoma','adenocarcinoma']
),

-- 22. C. difficile - risk factors
(
  '50000000-0000-0000-0000-000000000022', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'core',
  $stem$An 82-year-old woman in a nursing home develops profuse diarrhoea ten days after completing a course of clindamycin for a dental abscess. She has also been on long-term omeprazole for several years.$stem$,
  'Which two factors in her history have most contributed to her risk of this presentation?',
  array['Clostridioides difficile','risk factors','proton pump inhibitor']
),

-- 23. C. difficile - severity stratification
(
  '50000000-0000-0000-0000-000000000023', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'core',
  $stem$A 74-year-old man develops diarrhoea after a course of antibiotics for a urinary tract infection, and stool testing confirms C. difficile toxin. Observations show a temperature of 39.1C and a white cell count of 19x10^9/L. His creatinine has risen from a baseline of 80 to 145 micromol/L over the past two days.$stem$,
  'How should the severity of this episode be classified, and what does this imply for first-line treatment?',
  array['Clostridioides difficile','severity stratification','vancomycin']
),

-- 24. C. difficile - first-line oral vancomycin
(
  '50000000-0000-0000-0000-000000000024', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'core',
  $stem$A 68-year-old man is diagnosed with his first episode of C. difficile infection after developing diarrhoea following a course of ciprofloxacin.$stem$,
  'What is the most appropriate first-line antibiotic treatment?',
  array['Clostridioides difficile','oral vancomycin','first episode']
),

-- 25. C. difficile - recurrence management
(
  '50000000-0000-0000-0000-000000000025', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'core',
  $stem$A 70-year-old woman completes a 10-day course of oral vancomycin for C. difficile infection, with initial resolution of symptoms. Three weeks later, her diarrhoea recurs and stool toxin testing is again positive.$stem$,
  'What is the most appropriate next step in management?',
  array['Clostridioides difficile','recurrence','fidaxomicin']
),

-- 26. Upper GI bleed - Glasgow-Blatchford score
(
  '50000000-0000-0000-0000-000000000026', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'core',
  $stem$A 45-year-old man presents to the emergency department with a single episode of coffee-ground vomiting. He is haemodynamically stable, with normal observations, a normal haemoglobin, and a urea within the normal range. He has no melaena, no syncope, and no significant comorbidities.$stem$,
  'Which scoring system is most appropriate to help decide whether he can be safely managed as an outpatient without immediate admission?',
  array['upper GI bleed','Glasgow-Blatchford score','risk stratification']
),

-- 27. Upper GI bleed - Rockall score
(
  '50000000-0000-0000-0000-000000000027', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'core',
  $stem$A 70-year-old man undergoes endoscopy following an admission with melaena, which identifies a bleeding gastric ulcer with a visible vessel, successfully treated with endoscopic haemostasis.$stem$,
  'Which scoring system, incorporating this endoscopic finding, is used to estimate his risk of rebleeding and mortality?',
  array['upper GI bleed','Rockall score','post-endoscopy risk']
),

-- 28. Peptic ulcer bleed - endoscopic haemostasis, PPI, H. pylori eradication
(
  '50000000-0000-0000-0000-000000000028', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'core',
  $stem$A 66-year-old man undergoes endoscopy for melaena, which identifies a duodenal ulcer with active bleeding. Dual endoscopic haemostasis (adrenaline injection plus thermal coagulation) successfully controls the bleeding.$stem$,
  'What is the most appropriate next step in his management after endoscopic haemostasis?',
  array['peptic ulcer bleed','proton pump inhibitor','H pylori eradication']
),

-- 29. Coeliac disease - duodenal biopsy findings
(
  '50000000-0000-0000-0000-000000000029', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'core',
  $stem$A 32-year-old woman with strongly positive anti-tissue transglutaminase IgA antibodies undergoes upper GI endoscopy with duodenal biopsies while continuing a normal gluten-containing diet.$stem$,
  'Which histological findings would confirm the diagnosis of coeliac disease?',
  array['coeliac disease','duodenal biopsy','villous atrophy']
),

-- 30. Crohn disease vs ulcerative colitis - distinguishing features
(
  '50000000-0000-0000-0000-000000000030', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'core',
  $stem$Two patients present with chronic diarrhoea.

Patient 1 has perianal fistulae, right iliac fossa pain, and colonoscopy showing patchy inflammation with skip lesions and rectal sparing.

Patient 2 has bloody diarrhoea, tenesmus, and colonoscopy showing continuous inflammation starting at the rectum and extending proximally, with no skip lesions.$stem$,
  'What is the most likely diagnosis in each patient, respectively?',
  array['Crohn disease','ulcerative colitis','distinguishing features']
),

-- 31. Ulcerative colitis - toxic megacolon
(
  '50000000-0000-0000-0000-000000000031', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'core',
  $stem$A 34-year-old woman with known ulcerative colitis, currently having a severe flare with bloody diarrhoea, develops worsening abdominal distension, tachycardia and fever. Abdominal X-ray shows a dilated transverse colon measuring 7 cm in diameter, with systemic signs of toxicity.$stem$,
  'What is the most likely diagnosis, and what does it require?',
  array['toxic megacolon','ulcerative colitis','colonic dilatation']
),

-- 32. PBC - ursodeoxycholic acid management
(
  '50000000-0000-0000-0000-000000000032', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'core',
  $stem$A 55-year-old woman with confirmed primary biliary cholangitis, diagnosed on the basis of a positive anti-mitochondrial antibody and cholestatic liver function tests, is reviewed in clinic.$stem$,
  'What is the most appropriate first-line disease-modifying treatment?',
  array['primary biliary cholangitis','ursodeoxycholic acid','management']
),

-- 33. Acute pancreatitis - causes and Glasgow-Imrie score
(
  '50000000-0000-0000-0000-000000000033', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'core',
  $stem$A 48-year-old man presents with severe epigastric pain radiating to the back, nausea and vomiting. Serum amylase is markedly elevated. He admits to significant regular alcohol intake. Initial bloods show: PaO2 7.5 kPa, white cell count 17x10^9/L, corrected calcium 1.8 mmol/L, urea 18 mmol/L, albumin 28 g/L, and glucose 12 mmol/L.$stem$,
  'What does this combination of findings indicate about the severity of his presentation?',
  array['acute pancreatitis','Glasgow-Imrie score','severity']
),

-- 34. Variceal bleed - terlipressin, antibiotics, band ligation
(
  '50000000-0000-0000-0000-000000000034', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'core',
  $stem$A 58-year-old man with known cirrhosis and previously documented oesophageal varices presents with a large haematemesis. He is tachycardic and hypotensive.$stem$,
  'Alongside fluid resuscitation, what is the most appropriate immediate pharmacological and subsequent endoscopic management?',
  array['variceal bleeding','terlipressin','band ligation']
),

-- 35. Crohn disease - induction and maintenance therapy
(
  '50000000-0000-0000-0000-000000000035', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'core',
  $stem$A 26-year-old woman with newly diagnosed Crohn disease affecting the terminal ileum is started on treatment to induce remission of her current flare.$stem$,
  'What is the most appropriate first-line treatment to induce remission, and what would typically be used to maintain it afterwards?',
  array['Crohn disease','induction therapy','azathioprine']
),

-- 36. Cirrhosis -> ascites -> SBP chain
(
  '50000000-0000-0000-0000-000000000036', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'advanced',
  $stem$A 60-year-old man with alcohol-related cirrhosis has longstanding ascites. His serum albumin is 22 g/L, and he has known portal hypertension with a large spleen and oesophageal varices on previous endoscopy. He presents with new fever, abdominal pain and worsening confusion. Ascitic tap shows a neutrophil count of 620 cells/microlitre.$stem$,
  'What sequence of events links his chronic liver disease to this presentation?',
  array['cirrhosis','ascites','spontaneous bacterial peritonitis','chain reasoning']
),

-- 37. Variceal GI bleed -> ammonia -> hepatic encephalopathy chain
(
  '50000000-0000-0000-0000-000000000037', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'advanced',
  $stem$A 56-year-old man with known cirrhosis and oesophageal varices has a large variceal bleed, treated with terlipressin, antibiotics and endoscopic band ligation, with the bleeding successfully controlled. Two days later, he becomes increasingly drowsy and confused, with a flapping tremor on examination. His ammonia level is markedly elevated.$stem$,
  'What is the mechanism by which his GI bleed has led to this new confusion?',
  array['hepatic encephalopathy','GI bleed','ammonia','chain reasoning']
),

-- 38. TIPS -> portosystemic shunting -> hepatic encephalopathy chain
(
  '50000000-0000-0000-0000-000000000038', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'advanced',
  $stem$A 62-year-old woman with cirrhosis and recurrent variceal bleeding despite endoscopic therapy undergoes insertion of a transjugular intrahepatic portosystemic shunt (TIPS) to reduce her portal pressure. Two weeks later, she develops new confusion and a flapping tremor, with no evidence of infection, GI bleeding or constipation.$stem$,
  'What is the most likely explanation for her new confusion?',
  array['TIPS','hepatic encephalopathy','portosystemic shunting','chain reasoning']
),

-- 39. Long-term PPI -> C. difficile -> severe colitis chain
(
  '50000000-0000-0000-0000-000000000039', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'advanced',
  $stem$An 80-year-old woman has been on long-term omeprazole for many years for GORD. She is admitted with a chest infection and treated with a course of co-amoxiclav. Ten days later, she develops profuse diarrhoea, abdominal pain and fever, with stool testing positive for C. difficile toxin. Her condition progresses over the following two days to severe colitis with a markedly raised white cell count.$stem$,
  'What sequence of events, beginning with her long-term PPI use, has most contributed to this outcome?',
  array['proton pump inhibitor','Clostridioides difficile','severe colitis','chain reasoning']
),

-- 40. Alcohol -> acute pancreatitis -> hypocalcaemia -> tetany chain
(
  '50000000-0000-0000-0000-000000000040', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'advanced',
  $stem$A 42-year-old man with a history of heavy alcohol use presents with severe epigastric pain radiating to the back, and a markedly elevated serum amylase confirms acute pancreatitis. Over the next 24 hours, he develops perioral tingling and carpal spasm when a blood pressure cuff is inflated on his arm. Corrected calcium is 1.7 mmol/L.$stem$,
  'What is the mechanism linking his acute pancreatitis to this new finding?',
  array['acute pancreatitis','hypocalcaemia','fat saponification','chain reasoning']
),

-- 41. Haemochromatosis -> cirrhosis -> HCC surveillance chain
(
  '50000000-0000-0000-0000-000000000041', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'advanced',
  $stem$A 54-year-old man with genetically confirmed hereditary haemochromatosis (homozygous for the C282Y mutation) has been undergoing regular venesection for several years, but was diagnosed relatively late, after his ferritin had already been markedly elevated for some time, with established cirrhosis found on imaging and liver biopsy taken at diagnosis.$stem$,
  'Given this history, what additional monitoring does he specifically require that would not be needed in a haemochromatosis patient diagnosed and treated before cirrhosis developed?',
  array['haemochromatosis','cirrhosis','hepatocellular carcinoma','chain reasoning']
),

-- 42. Crohn terminal ileal disease -> B12/bile acid malabsorption chain
(
  '50000000-0000-0000-0000-000000000042', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'advanced',
  $stem$A 30-year-old woman with known Crohn disease affecting the terminal ileum, previously resected surgically, presents with fatigue, peripheral paraesthesia, and chronic watery diarrhoea that is separate from her usual inflammatory flares. Blood tests show macrocytic anaemia with a low B12 level.$stem$,
  'What is the underlying explanation for both her anaemia and her chronic diarrhoea?',
  array['Crohn disease','terminal ileal disease','B12 malabsorption','chain reasoning']
),

-- 43. Wilson disease - copper deposition chain
(
  '50000000-0000-0000-0000-000000000043', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'advanced',
  $stem$A 17-year-old boy presents with a six-month history of deteriorating school performance, a resting tremor, and slurred speech. His parents also report a personality change with new irritability. Examination reveals mild hepatomegaly and brownish-green rings at the corneal periphery on slit-lamp examination. Liver function tests are mildly deranged, and serum caeruloplasmin is low.$stem$,
  'What is the underlying process linking his neurological, ophthalmological and hepatic findings, and which treatment most directly addresses this?',
  array['Wilson disease','copper deposition','penicillamine','chain reasoning']
),

-- 44. Paracetamol overdose -> NAPQI -> N-acetylcysteine chain
(
  '50000000-0000-0000-0000-000000000044', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'advanced',
  $stem$A 22-year-old woman is brought to the emergency department 6 hours after taking a large, deliberate paracetamol overdose. Her paracetamol level is above the treatment line on the nomogram, and treatment with intravenous N-acetylcysteine is started.$stem$,
  'By what mechanism does paracetamol overdose cause hepatocyte damage, and how does N-acetylcysteine specifically prevent this?',
  array['paracetamol overdose','NAPQI','N-acetylcysteine','chain reasoning']
),

-- 45. Budd-Chiari syndrome - hepatic vein thrombosis chain
(
  '50000000-0000-0000-0000-000000000045', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'advanced',
  $stem$A 33-year-old woman with a known myeloproliferative disorder presents with a two-week history of abdominal pain, abdominal distension and tender hepatomegaly. Ascitic fluid analysis shows a protein concentration of 34 g/L. Doppler ultrasound of the liver shows absent flow in the hepatic veins.$stem$,
  'What is the underlying mechanism causing her ascites, and how does the ascitic protein result support this diagnosis?',
  array['Budd-Chiari syndrome','hepatic vein thrombosis','ascites protein','chain reasoning']
),

-- 46. Pancreatic head cancer -> CBD compression -> biochemical chain
(
  '50000000-0000-0000-0000-000000000046', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'advanced',
  $stem$A 68-year-old man presents with several weeks of painless progressive jaundice, pale stools, dark urine and generalised itching, alongside unintentional weight loss. Examination reveals a palpable, non-tender gallbladder. Liver function tests show a markedly raised conjugated bilirubin, ALP and GGT, with only mildly elevated transaminases.$stem$,
  'What sequence of events links the underlying mass to each of his presenting clinical and biochemical findings?',
  array['pancreatic cancer','obstructive jaundice','Courvoisier sign','chain reasoning']
),

-- 47. PSC + UC -> cholangiocarcinoma risk chain
(
  '50000000-0000-0000-0000-000000000047', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'advanced',
  $stem$A 38-year-old man with long-standing ulcerative colitis is found on surveillance blood tests to have a persistently raised alkaline phosphatase. MRCP shows multifocal strictures and dilatations of the intrahepatic and extrahepatic bile ducts, giving a beaded appearance.$stem$,
  'Given this diagnosis, what specific additional malignancy risk does he now carry, and why?',
  array['primary sclerosing cholangitis','ulcerative colitis','cholangiocarcinoma','chain reasoning']
),

-- 48. NAFLD -> NASH -> fibrosis chain
(
  '50000000-0000-0000-0000-000000000048', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'advanced',
  $stem$A 52-year-old man with obesity, type 2 diabetes and dyslipidaemia is found incidentally to have a "bright" liver on ultrasound, in keeping with hepatic steatosis. He has no history of significant alcohol intake. Blood tests show mildly elevated transaminases.$stem$,
  'What is the mechanism by which his metabolic risk factors could progress to clinically significant liver disease, and how should this risk be assessed?',
  array['non-alcoholic fatty liver disease','NASH','fibrosis','chain reasoning']
),

-- 49. Alcohol withdrawal -> delirium tremens chain
(
  '50000000-0000-0000-0000-000000000049', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'advanced',
  $stem$A 48-year-old man with a long history of heavy daily alcohol consumption is admitted for an elective hip operation and has no alcohol for 48 hours post-operatively. He becomes increasingly agitated and tremulous, then develops visual hallucinations, marked confusion, tachycardia and hypertension on the third day of admission.$stem$,
  'What is the underlying neurochemical mechanism explaining this progression, and what is the most appropriate immediate treatment?',
  array['alcohol withdrawal','delirium tremens','GABA','chain reasoning']
),

-- 50. Hepatorenal syndrome chain
(
  '50000000-0000-0000-0000-000000000050', 'mrcp1', '30000000-0000-0000-0000-000000000005',
  'published', 'advanced',
  $stem$A 65-year-old man with decompensated cirrhosis and longstanding ascites develops a progressive rise in creatinine over several days, from a baseline of 90 to 260 micromol/L, with a corresponding fall in urine output. Urinalysis is bland with no proteinuria or casts, and there is no improvement in renal function despite stopping diuretics and giving a trial of intravenous albumin. Renal ultrasound is normal, and there is no evidence of sepsis, nephrotoxic drug exposure, or obstruction.$stem$,
  'What is the underlying pathophysiological mechanism responsible for his renal failure?',
  array['hepatorenal syndrome','portal hypertension','splanchnic vasodilation','chain reasoning']
)

on conflict (id) do nothing;

-- ---------------------------------------------------------------------------
-- Options
-- ---------------------------------------------------------------------------

insert into question_options (question_id, label, option_text, is_correct, rationale, sort_order) values

-- Q1 PBC AMA
('50000000-0000-0000-0000-000000000001', 'A', 'Anti-mitochondrial antibody', true,
 $r$Correct. AMA (specifically the M2 subtype) is positive in over 95% of patients with primary biliary cholangitis and is the serological hallmark of the condition, fitting this cholestatic pruritus-and-fatigue picture.$r$, 1),
('50000000-0000-0000-0000-000000000001', 'B', 'Anti-smooth muscle antibody', false,
 $r$Ruled out because ASMA is characteristic of type 1 autoimmune hepatitis, which typically produces a hepatitic (transaminase-predominant) rather than cholestatic LFT pattern.$r$, 2),
('50000000-0000-0000-0000-000000000001', 'C', 'Anti-liver kidney microsomal type 1 antibody', false,
 $r$Ruled out because anti-LKM1 is characteristic of type 2 autoimmune hepatitis, seen predominantly in children and young people with a hepatitic LFT pattern, not the cholestatic picture described here.$r$, 3),
('50000000-0000-0000-0000-000000000001', 'D', 'Anti-neutrophil cytoplasmic antibody (p-ANCA)', false,
 $r$Ruled out because p-ANCA is more typically associated with primary sclerosing cholangitis and ulcerative colitis, not the antibody most specific to this presentation.$r$, 4),
('50000000-0000-0000-0000-000000000001', 'E', 'Anti-double-stranded DNA antibody', false,
 $r$Ruled out because anti-dsDNA is specific to systemic lupus erythematosus, which is not suggested by this isolated cholestatic liver picture.$r$, 5),

-- Q2 C diff diagnostic test
('50000000-0000-0000-0000-000000000002', 'A', 'Stool testing for C. difficile toxin (by enzyme immunoassay or PCR)', true,
 $r$Correct. Detecting C. difficile toxin (or toxin gene by PCR) in the stool confirms active toxin-mediated infection; this is the step that distinguishes true infection from asymptomatic colonisation.$r$, 1),
('50000000-0000-0000-0000-000000000002', 'B', 'Stool culture for C. difficile organisms alone', false,
 $r$Ruled out because culture (or glutamate dehydrogenase antigen testing) only detects the presence of the organism, which may reflect asymptomatic colonisation rather than active toxin-producing infection.$r$, 2),
('50000000-0000-0000-0000-000000000002', 'C', 'Stool microscopy for ova, cysts and parasites', false,
 $r$Ruled out because this looks for parasitic infection, not C. difficile, and would not be expected to identify this antibiotic-associated diarrhoea.$r$, 3),
('50000000-0000-0000-0000-000000000002', 'D', 'Faecal calprotectin', false,
 $r$Ruled out because faecal calprotectin is a non-specific marker of intestinal inflammation used to help distinguish inflammatory bowel disease from irritable bowel syndrome, not a diagnostic test for C. difficile infection.$r$, 4),
('50000000-0000-0000-0000-000000000002', 'E', 'Stool culture for routine enteric bacterial pathogens (e.g. Salmonella, Campylobacter)', false,
 $r$Ruled out because standard enteric stool culture does not reliably detect C. difficile toxin production and would not explain this clearly antibiotic-associated case.$r$, 5),

-- Q3 Coeliac serology
('50000000-0000-0000-0000-000000000003', 'A', 'IgA anti-tissue transglutaminase antibody, with a total IgA level', true,
 $r$Correct. IgA anti-tTG antibody is the recommended first-line serological test for coeliac disease, with a total IgA level checked at the same time to exclude selective IgA deficiency, which would cause a false-negative anti-tTG result.$r$, 1),
('50000000-0000-0000-0000-000000000003', 'B', 'IgG anti-gliadin antibody', false,
 $r$Ruled out because anti-gliadin antibodies have largely been superseded by anti-tTG and anti-endomysial antibodies due to poorer sensitivity and specificity, and are not first-line.$r$, 2),
('50000000-0000-0000-0000-000000000003', 'C', 'Anti-mitochondrial antibody', false,
 $r$Ruled out because AMA is the marker for primary biliary cholangitis, an unrelated cholestatic liver condition, not coeliac disease.$r$, 3),
('50000000-0000-0000-0000-000000000003', 'D', 'Anti-nuclear antibody', false,
 $r$Ruled out because ANA is a non-specific marker used in the work-up of connective tissue disease, not a test for coeliac disease.$r$, 4),
('50000000-0000-0000-0000-000000000003', 'E', 'Helicobacter pylori stool antigen test', false,
 $r$Ruled out because this tests for H. pylori infection, relevant to peptic ulcer disease and gastritis, not coeliac disease.$r$, 5),

-- Q4 Wilson disease caeruloplasmin
('50000000-0000-0000-0000-000000000004', 'A', 'Low serum caeruloplasmin', true,
 $r$Correct. Reduced serum caeruloplasmin, the main copper-carrying protein, is the characteristic biochemical finding in Wilson disease, reflecting the underlying defect in biliary copper excretion and incorporation of copper into caeruloplasmin.$r$, 1),
('50000000-0000-0000-0000-000000000004', 'B', 'Raised serum caeruloplasmin', false,
 $r$Ruled out because caeruloplasmin is typically reduced, not raised, in Wilson disease; a raised level would argue against this diagnosis.$r$, 2),
('50000000-0000-0000-0000-000000000004', 'C', 'Low serum ferritin', false,
 $r$Ruled out because serum ferritin reflects iron stores and is relevant to haemochromatosis or iron deficiency, not the copper metabolism defect described here.$r$, 3),
('50000000-0000-0000-0000-000000000004', 'D', 'Raised alpha-1 antitrypsin level', false,
 $r$Ruled out because alpha-1 antitrypsin is an unrelated protein whose deficiency (not excess) causes a different liver and lung disease; it is not relevant to this copper-overload presentation.$r$, 4),
('50000000-0000-0000-0000-000000000004', 'E', 'Positive anti-mitochondrial antibody', false,
 $r$Ruled out because AMA is specific to primary biliary cholangitis, a cholestatic autoimmune liver disease, and does not explain the neurological and corneal findings described here.$r$, 5),

-- Q5 Haemochromatosis transferrin saturation
('50000000-0000-0000-0000-000000000005', 'A', 'Transferrin saturation', true,
 $r$Correct. Transferrin saturation is the most sensitive initial screening test for iron overload and rises earlier and more specifically than ferritin (which is also an acute-phase reactant), making it the appropriate next step before proceeding to HFE genetic testing.$r$, 1),
('50000000-0000-0000-0000-000000000005', 'B', 'Serum caeruloplasmin', false,
 $r$Ruled out because caeruloplasmin relates to copper metabolism and Wilson disease, not iron overload.$r$, 2),
('50000000-0000-0000-0000-000000000005', 'C', 'Liver biopsy as the first investigation', false,
 $r$Ruled out because liver biopsy is invasive and reserved for cases where iron quantification or fibrosis staging is needed after non-invasive tests suggest overload; it is not the first-line confirmatory test.$r$, 3),
('50000000-0000-0000-0000-000000000005', 'D', 'Faecal elastase', false,
 $r$Ruled out because faecal elastase assesses pancreatic exocrine function and is not relevant to confirming iron overload.$r$, 4),
('50000000-0000-0000-0000-000000000005', 'E', 'Serum vitamin B12 level', false,
 $r$Ruled out because B12 level does not relate to iron metabolism and would not help confirm or refute haemochromatosis.$r$, 5),

-- Q6 Achalasia bird's beak
('50000000-0000-0000-0000-000000000006', 'A', 'A dilated oesophagus tapering to a smooth, narrow bird beak at the gastro-oesophageal junction', true,
 $r$Correct. This bird beak appearance, with a dilated oesophageal body tapering smoothly at the lower oesophageal sphincter, is the classic barium swallow finding in achalasia, reflecting failure of sphincter relaxation with proximal dilatation.$r$, 1),
('50000000-0000-0000-0000-000000000006', 'B', 'A shouldered, irregular stricture with mucosal destruction', false,
 $r$Ruled out because this appearance is more typical of an oesophageal malignancy, not the smooth tapering seen in achalasia.$r$, 2),
('50000000-0000-0000-0000-000000000006', 'C', 'Multiple small outpouchings along the oesophageal wall', false,
 $r$Ruled out because this describes oesophageal diverticula, not the single smooth tapering narrowing of achalasia.$r$, 3),
('50000000-0000-0000-0000-000000000006', 'D', 'A corkscrew appearance with diffuse simultaneous contractions', false,
 $r$Ruled out because a corkscrew pattern reflects diffuse oesophageal spasm, a different motility disorder from achalasia.$r$, 4),
('50000000-0000-0000-0000-000000000006', 'E', 'Free reflux of contrast into the oesophagus with a hiatus hernia', false,
 $r$Ruled out because this describes a sliding hiatus hernia with reflux, not the dysphagia-predominant, motility-failure picture of achalasia.$r$, 5),

-- Q7 AIH type 1 ASMA
('50000000-0000-0000-0000-000000000007', 'A', 'Anti-smooth muscle antibody', true,
 $r$Correct. Anti-smooth muscle antibody (often alongside anti-nuclear antibody) is characteristic of type 1 autoimmune hepatitis, the more common form seen predominantly in adults and frequently associated with other autoimmune conditions such as autoimmune thyroid disease.$r$, 1),
('50000000-0000-0000-0000-000000000007', 'B', 'Anti-liver kidney microsomal type 1 antibody', false,
 $r$Ruled out because anti-LKM1 defines type 2 autoimmune hepatitis, which typically presents in children and young people and tends to run a more aggressive course, not the pattern described here.$r$, 2),
('50000000-0000-0000-0000-000000000007', 'C', 'Anti-mitochondrial antibody', false,
 $r$Ruled out because AMA is specific to primary biliary cholangitis, a cholestatic condition, rather than the hepatitic picture of autoimmune hepatitis.$r$, 3),
('50000000-0000-0000-0000-000000000007', 'D', 'Anti-hepatitis B surface antibody', false,
 $r$Ruled out because this reflects either past hepatitis B infection or vaccination, not an autoimmune process.$r$, 4),
('50000000-0000-0000-0000-000000000007', 'E', 'Anti-centromere antibody', false,
 $r$Ruled out because anti-centromere antibody is associated with limited cutaneous systemic sclerosis, not autoimmune hepatitis.$r$, 5),

-- Q8 SBP ascitic neutrophil threshold
('50000000-0000-0000-0000-000000000008', 'A', 'Greater than 250 neutrophils per microlitre', true,
 $r$Correct. An ascitic fluid polymorphonuclear (neutrophil) count above 250 cells/microlitre is the diagnostic threshold for spontaneous bacterial peritonitis, regardless of whether ascitic culture grows an organism.$r$, 1),
('50000000-0000-0000-0000-000000000008', 'B', 'Greater than 25 neutrophils per microlitre', false,
 $r$Ruled out because this threshold is far too low and would misclassify normal or minimally inflamed ascitic fluid as infected.$r$, 2),
('50000000-0000-0000-0000-000000000008', 'C', 'Greater than 1000 neutrophils per microlitre', false,
 $r$Ruled out because this sets an unnecessarily high threshold; a diagnosis of SBP is made once the count exceeds 250 cells/microlitre, well below this figure.$r$, 3),
('50000000-0000-0000-0000-000000000008', 'D', 'A positive ascitic fluid Gram stain, regardless of cell count', false,
 $r$Ruled out because Gram stain is frequently negative in SBP even when infection is present, since bacterial numbers are often low; the neutrophil count, not Gram stain positivity, is the diagnostic criterion.$r$, 4),
('50000000-0000-0000-0000-000000000008', 'E', 'A positive ascitic fluid culture, regardless of cell count', false,
 $r$Ruled out because ascitic culture is negative in a substantial proportion of true SBP cases (culture-negative neutrocytic ascites); diagnosis is based on the neutrophil count rather than requiring a positive culture.$r$, 5),

-- Q9 Zollinger-Ellison
('50000000-0000-0000-0000-000000000009', 'A', 'Fasting serum gastrin level', true,
 $r$Correct. Recurrent, refractory peptic ulceration with diarrhoea raises suspicion of a gastrin-secreting neuroendocrine tumour (gastrinoma), and a markedly raised fasting serum gastrin level is the key initial test to support this diagnosis of Zollinger-Ellison syndrome.$r$, 1),
('50000000-0000-0000-0000-000000000009', 'B', 'Urinary 5-hydroxyindoleacetic acid', false,
 $r$Ruled out because 5-HIAA is used to investigate carcinoid syndrome, which presents with flushing and diarrhoea rather than refractory peptic ulcer disease.$r$, 2),
('50000000-0000-0000-0000-000000000009', 'C', 'Serum calcitonin', false,
 $r$Ruled out because calcitonin is a tumour marker for medullary thyroid carcinoma, unrelated to this presentation of refractory ulcers and diarrhoea.$r$, 3),
('50000000-0000-0000-0000-000000000009', 'D', 'Overnight dexamethasone suppression test', false,
 $r$Ruled out because this investigates for Cushing syndrome, which does not explain recurrent peptic ulceration and diarrhoea in this pattern.$r$, 4),
('50000000-0000-0000-0000-000000000009', 'E', 'Serum vasoactive intestinal peptide', false,
 $r$Ruled out because a VIPoma causes profound watery diarrhoea (WDHA syndrome) rather than the refractory peptic ulcer disease that dominates this presentation, making gastrin the more relevant first test.$r$, 5),

-- Q10 Barrett oesophagus
('50000000-0000-0000-0000-000000000010', 'A', 'Metaplasia of the normal squamous epithelium to columnar epithelium', true,
 $r$Correct. Barrett oesophagus is defined by metaplastic replacement of the normal distal oesophageal squamous epithelium with columnar (specialised intestinal-type) epithelium, occurring as an adaptive response to chronic acid reflux.$r$, 1),
('50000000-0000-0000-0000-000000000010', 'B', 'Dysplasia of squamous epithelium without any change in epithelial type', false,
 $r$Ruled out because Barrett oesophagus is specifically defined by columnar metaplasia; squamous dysplasia alone, without a change in epithelial type, does not meet this definition.$r$, 2),
('50000000-0000-0000-0000-000000000010', 'C', 'Granulomatous inflammation of the submucosa', false,
 $r$Ruled out because granulomas are a feature of conditions such as Crohn disease, not the metaplastic change that defines Barrett oesophagus.$r$, 3),
('50000000-0000-0000-0000-000000000010', 'D', 'Complete villous atrophy with crypt hyperplasia', false,
 $r$Ruled out because this describes the histological picture of coeliac disease in the small bowel, an unrelated small intestinal process.$r$, 4),
('50000000-0000-0000-0000-000000000010', 'E', 'Dense eosinophilic infiltration of the epithelium', false,
 $r$Ruled out because dense eosinophilic infiltration is characteristic of eosinophilic oesophagitis, a distinct condition from the metaplastic change of Barrett oesophagus.$r$, 5),

-- Q11 A1AT deficiency
('50000000-0000-0000-0000-000000000011', 'A', 'Alpha-1 antitrypsin deficiency', true,
 $r$Correct. Alpha-1 antitrypsin deficiency causes early-onset, lower-zone-predominant panacinar emphysema (from unopposed neutrophil elastase activity in the lungs) alongside liver disease (from accumulation of abnormal, misfolded protein within hepatocytes), explaining both findings in this young non-smoker.$r$, 1),
('50000000-0000-0000-0000-000000000011', 'B', 'Cystic fibrosis', false,
 $r$Ruled out because cystic fibrosis typically causes upper-zone bronchiectasis rather than panacinar emphysema, and its liver involvement (biliary cirrhosis) has a different mechanism from the pattern described here.$r$, 2),
('50000000-0000-0000-0000-000000000011', 'C', 'Alpha-1 antitrypsin excess', false,
 $r$Ruled out because it is deficiency, not excess, of alpha-1 antitrypsin that causes this combined lung and liver disease.$r$, 3),
('50000000-0000-0000-0000-000000000011', 'D', 'Chronic bronchitis secondary to smoking', false,
 $r$Ruled out because this patient is a non-smoker, and smoking-related emphysema is typically upper-zone predominant rather than the lower-zone panacinar pattern described.$r$, 4),
('50000000-0000-0000-0000-000000000011', 'E', 'Sarcoidosis', false,
 $r$Ruled out because sarcoidosis characteristically causes upper-zone fibrosis and hilar lymphadenopathy, not panacinar emphysema, and does not typically cause this pattern of liver disease.$r$, 5),

-- Q12 Carcinoid syndrome
('50000000-0000-0000-0000-000000000012', 'A', 'Urinary 5-hydroxyindoleacetic acid (5-HIAA)', true,
 $r$Correct. 5-HIAA is the breakdown product of serotonin, and a raised 24-hour urinary 5-HIAA supports a diagnosis of carcinoid syndrome, caused by a serotonin-secreting neuroendocrine tumour, typically once hepatic metastases allow vasoactive mediators to bypass first-pass hepatic metabolism.$r$, 1),
('50000000-0000-0000-0000-000000000012', 'B', 'Urinary metanephrines', false,
 $r$Ruled out because urinary metanephrines investigate for phaeochromocytoma, which classically causes paroxysmal hypertension, palpitations and sweating rather than this flushing-diarrhoea-wheeze triad with a right-sided cardiac murmur.$r$, 2),
('50000000-0000-0000-0000-000000000012', 'C', 'Urinary free cortisol', false,
 $r$Ruled out because this investigates for Cushing syndrome, which does not explain the flushing, diarrhoea and right-sided valvular findings described here.$r$, 3),
('50000000-0000-0000-0000-000000000012', 'D', 'Fasting serum gastrin', false,
 $r$Ruled out because gastrin relates to Zollinger-Ellison syndrome, which causes refractory peptic ulceration rather than flushing and carcinoid heart disease.$r$, 4),
('50000000-0000-0000-0000-000000000012', 'E', 'Urinary catecholamines', false,
 $r$Ruled out because catecholamines are relevant to phaeochromocytoma, not the serotonin-mediated features described in this vignette.$r$, 5),

-- Q13 Refeeding syndrome
('50000000-0000-0000-0000-000000000013', 'A', 'Hypophosphataemia', true,
 $r$Correct. Reintroduction of a carbohydrate load triggers an insulin surge that drives glucose, phosphate, potassium and magnesium intracellularly; the resulting fall in serum phosphate is the biochemical hallmark of refeeding syndrome and can cause muscle weakness, cardiac dysfunction and respiratory failure.$r$, 1),
('50000000-0000-0000-0000-000000000013', 'B', 'Hyperphosphataemia', false,
 $r$Ruled out because refeeding causes a fall, not a rise, in serum phosphate as it shifts intracellularly under the influence of insulin.$r$, 2),
('50000000-0000-0000-0000-000000000013', 'C', 'Hypercalcaemia', false,
 $r$Ruled out because calcium is not the characteristic electrolyte disturbance of refeeding syndrome; hypophosphataemia, hypokalaemia and hypomagnesaemia are the key abnormalities.$r$, 3),
('50000000-0000-0000-0000-000000000013', 'D', 'Hypernatraemia', false,
 $r$Ruled out because sodium disturbance is not the hallmark biochemical feature of refeeding syndrome, which is driven primarily by intracellular shifts of phosphate, potassium and magnesium.$r$, 4),
('50000000-0000-0000-0000-000000000013', 'E', 'Metabolic alkalosis', false,
 $r$Ruled out because refeeding syndrome is not primarily characterised by an acid-base disturbance; its defining features are the electrolyte shifts described, particularly hypophosphataemia.$r$, 5),

-- Q14 GORD PPI first-line
('50000000-0000-0000-0000-000000000014', 'A', 'Lifestyle advice and a trial of a proton pump inhibitor', true,
 $r$Correct. In uncomplicated suspected GORD without alarm features, NICE recommends lifestyle advice (weight loss, avoiding trigger foods, smoking cessation) together with a trial of a full-dose proton pump inhibitor, without the need for upfront endoscopy.$r$, 1),
('50000000-0000-0000-0000-000000000014', 'B', 'Urgent upper GI endoscopy before starting any treatment', false,
 $r$Ruled out because endoscopy is reserved for patients with alarm features or those not responding to initial empirical treatment; it is not required as first-line management here.$r$, 2),
('50000000-0000-0000-0000-000000000014', 'C', 'Helicobacter pylori eradication therapy without testing first', false,
 $r$Ruled out because eradication therapy should only be given if H. pylori testing is positive; empirical eradication without testing is not the recommended approach.$r$, 3),
('50000000-0000-0000-0000-000000000014', 'D', 'Long-term high-dose opioid analgesia for symptom control', false,
 $r$Ruled out because opioids do not address the underlying reflux mechanism and can worsen gastrointestinal motility and constipation.$r$, 4),
('50000000-0000-0000-0000-000000000014', 'E', 'Immediate referral for anti-reflux surgery', false,
 $r$Ruled out because surgery is reserved for patients with confirmed GORD who fail to respond adequately to medical therapy, not as an initial step.$r$, 5),

-- Q15 IBS Rome IV
('50000000-0000-0000-0000-000000000015', 'A', 'Rome IV criteria for irritable bowel syndrome', true,
 $r$Correct. The Rome IV criteria define IBS as recurrent abdominal pain, on average at least one day per week in the last three months, associated with two or more of a change in stool frequency, a change in stool form, or a relationship to defecation; this presentation fits this pattern, supported by normal organic investigations.$r$, 1),
('50000000-0000-0000-0000-000000000015', 'B', 'Truelove and Witts criteria', false,
 $r$Ruled out because these criteria grade the severity of acute ulcerative colitis, an organic inflammatory condition, not a functional bowel disorder like IBS.$r$, 2),
('50000000-0000-0000-0000-000000000015', 'C', 'Modified Duke criteria', false,
 $r$Ruled out because these criteria are used to diagnose infective endocarditis and are entirely unrelated to gastrointestinal symptoms.$r$, 3),
('50000000-0000-0000-0000-000000000015', 'D', 'Glasgow-Imrie criteria', false,
 $r$Ruled out because these assess the severity of acute pancreatitis, not a chronic functional bowel disorder.$r$, 4),
('50000000-0000-0000-0000-000000000015', 'E', 'Light criteria', false,
 $r$Ruled out because these distinguish transudative from exudative pleural effusions and have no relevance to bowel symptoms.$r$, 5),

-- Q16 Obstructive jaundice choledocholithiasis
('50000000-0000-0000-0000-000000000016', 'A', 'Magnetic resonance cholangiopancreatography (MRCP), followed by ERCP if a duct stone is confirmed', true,
 $r$Correct. When ultrasound shows a dilated common bile duct suggestive of obstruction but does not directly visualise a ductal stone, MRCP is the appropriate next non-invasive step to confirm choledocholithiasis, allowing ERCP (with sphincterotomy and stone extraction) to be reserved for cases where a stone is actually demonstrated.$r$, 1),
('50000000-0000-0000-0000-000000000016', 'B', 'Immediate ERCP without further imaging', false,
 $r$Ruled out because proceeding straight to ERCP, an invasive procedure with risks including pancreatitis and perforation, is not appropriate before a duct stone has been confirmed on further imaging such as MRCP.$r$, 2),
('50000000-0000-0000-0000-000000000016', 'C', 'Elective laparoscopic cholecystectomy alone, with no attention to the bile duct', false,
 $r$Ruled out because this addresses the gallbladder but does not deal with a possible retained bile duct stone causing the current obstructive jaundice, which requires duct clearance first.$r$, 3),
('50000000-0000-0000-0000-000000000016', 'D', 'Percutaneous transhepatic cholangiography as the first-line investigation', false,
 $r$Ruled out because PTC is more invasive than MRCP and is generally reserved for cases where ERCP is not technically possible (e.g. altered anatomy), not as a first-line investigation here.$r$, 4),
('50000000-0000-0000-0000-000000000016', 'E', 'Reassurance and outpatient review in six weeks', false,
 $r$Ruled out because ongoing biliary obstruction risks ascending cholangitis and worsening liver injury, so this requires prompt further imaging and treatment rather than a delayed outpatient review.$r$, 5),

-- Q17 Fitz-Hugh-Curtis
('50000000-0000-0000-0000-000000000017', 'A', 'Fitz-Hugh-Curtis syndrome (perihepatitis complicating pelvic inflammatory disease)', true,
 $r$Correct. The combination of right upper quadrant pain with pelvic symptoms and cervical motion tenderness in a sexually active young woman is characteristic of Fitz-Hugh-Curtis syndrome, in which ascending infection (typically Chlamydia trachomatis or Neisseria gonorrhoeae) causes inflammation of the liver capsule and adjacent peritoneum, alongside pelvic inflammatory disease.$r$, 1),
('50000000-0000-0000-0000-000000000017', 'B', 'Acute cholecystitis', false,
 $r$Ruled out because although this can also cause right upper quadrant pain, it does not explain the concurrent vaginal discharge and cervical motion tenderness, and liver function tests are normal here rather than showing a cholestatic pattern.$r$, 2),
('50000000-0000-0000-0000-000000000017', 'C', 'Acute viral hepatitis', false,
 $r$Ruled out because viral hepatitis typically produces deranged transaminases, which are normal here, and would not explain the pelvic examination findings.$r$, 3),
('50000000-0000-0000-0000-000000000017', 'D', 'Budd-Chiari syndrome', false,
 $r$Ruled out because this presents with hepatomegaly and ascites from hepatic venous outflow obstruction, not the combined pelvic and right upper quadrant picture seen here.$r$, 4),
('50000000-0000-0000-0000-000000000017', 'E', 'Right basal pneumonia', false,
 $r$Ruled out because although this can occasionally cause referred upper abdominal pain, it does not account for the pelvic symptoms and cervical motion tenderness found on examination.$r$, 5),

-- Q18 SBP prophylaxis criteria
('50000000-0000-0000-0000-000000000018', 'A', 'Start prophylactic ciprofloxacin (or norfloxacin)', true,
 $r$Correct. Antibiotic prophylaxis against SBP is recommended for patients with ascitic protein of 15 g/L or less together with either a Child-Pugh score of at least 9 with a raised bilirubin, or impaired renal function; this patient's low ascitic protein and Child-Pugh score of 10 meet this threshold, so prophylaxis should be started.$r$, 1),
('50000000-0000-0000-0000-000000000018', 'B', 'No prophylaxis is indicated because he has never had a prior episode of SBP', false,
 $r$Ruled out because prophylaxis is not restricted to secondary prevention after a previous episode; primary prophylaxis is also indicated based on low ascitic protein combined with advanced liver disease, as seen here.$r$, 2),
('50000000-0000-0000-0000-000000000018', 'C', 'Start prophylactic co-amoxiclav', false,
 $r$Ruled out because co-amoxiclav is not the recommended prophylactic agent for SBP; ciprofloxacin or norfloxacin are the standard choices.$r$, 3),
('50000000-0000-0000-0000-000000000018', 'D', 'Only start antibiotics if he develops fever or abdominal pain', false,
 $r$Ruled out because prophylaxis is intended to prevent the first episode of SBP in high-risk patients, rather than waiting for symptoms to develop before treating an established infection.$r$, 4),
('50000000-0000-0000-0000-000000000018', 'E', 'Perform an ascitic tap only if he becomes symptomatic, with no prophylactic antibiotics considered', false,
 $r$Ruled out because this patient already meets recognised criteria for primary antibiotic prophylaxis based on his ascitic protein and Child-Pugh score, independent of any future ascitic tap result.$r$, 5),

-- Q19 Hepatic encephalopathy lactulose mechanism
('50000000-0000-0000-0000-000000000019', 'A', 'It acidifies the colonic lumen, trapping ammonia as the non-absorbable ammonium ion, and increases gut transit to reduce ammonia absorption', true,
 $r$Correct. Lactulose is metabolised by colonic bacteria to short-chain fatty acids, lowering colonic pH; this favours conversion of absorbable ammonia (NH3) to non-absorbable ammonium (NH4+), while its osmotic laxative effect also reduces the time available for ammonia production and absorption.$r$, 1),
('50000000-0000-0000-0000-000000000019', 'B', 'It directly binds and inactivates circulating ammonia in the bloodstream', false,
 $r$Ruled out because lactulose acts within the gut lumen, not by binding ammonia already absorbed into the systemic circulation.$r$, 2),
('50000000-0000-0000-0000-000000000019', 'C', 'It suppresses hepatic ammonia production directly within hepatocytes', false,
 $r$Ruled out because lactulose does not act on the liver itself; its effect is exerted in the colon, reducing ammonia generation and absorption from the gut.$r$, 3),
('50000000-0000-0000-0000-000000000019', 'D', 'It increases urinary excretion of ammonia via a direct renal action', false,
 $r$Ruled out because lactulose has no direct renal mechanism of action; its effect is confined to the gastrointestinal tract.$r$, 4),
('50000000-0000-0000-0000-000000000019', 'E', 'It replaces deficient clotting factors to improve hepatic synthetic function', false,
 $r$Ruled out because lactulose has no role in clotting factor synthesis; it targets ammonia handling in the gut, not hepatic synthetic function.$r$, 5),

-- Q20 Hepatic encephalopathy precipitant
('50000000-0000-0000-0000-000000000020', 'A', 'Constipation', true,
 $r$Correct. Prolonged colonic transit time from constipation allows increased bacterial breakdown of nitrogenous substrates and greater time for ammonia production and absorption, making it a well-recognised precipitant of hepatic encephalopathy, consistent with this patient's five-day history of not opening his bowels and otherwise normal observations.$r$, 1),
('50000000-0000-0000-0000-000000000020', 'B', 'Spontaneous bacterial peritonitis', false,
 $r$Ruled out because there is no fever, and the abdomen is soft and non-tender without signs suggesting infected ascites; his presentation is better explained by the clearly documented constipation.$r$, 2),
('50000000-0000-0000-0000-000000000020', 'C', 'Gastrointestinal haemorrhage', false,
 $r$Ruled out because there is no history or examination finding suggestive of bleeding (such as melaena or haematemesis), making a GI bleed a less likely precipitant here than the described constipation.$r$, 3),
('50000000-0000-0000-0000-000000000020', 'D', 'Hypoglycaemia', false,
 $r$Ruled out because no blood glucose abnormality is mentioned, and his clinical picture is well explained by the reported severe constipation rather than a glycaemic precipitant.$r$, 4),
('50000000-0000-0000-0000-000000000020', 'E', 'A newly started sedative medication', false,
 $r$Ruled out because no new sedating drug is described in this history; the clearly identified precipitant is his prolonged constipation.$r$, 5),

-- Q21 Oesophageal SCC vs adenocarcinoma
('50000000-0000-0000-0000-000000000021', 'A', 'Patient 1: squamous cell carcinoma; Patient 2: adenocarcinoma', true,
 $r$Correct. Squamous cell carcinoma is strongly associated with alcohol and smoking and typically arises in the upper or middle oesophagus, whereas adenocarcinoma arises from Barrett metaplasia secondary to chronic GORD and typically occurs in the lower oesophagus, matching each patient's risk factors and tumour location.$r$, 1),
('50000000-0000-0000-0000-000000000021', 'B', 'Patient 1: adenocarcinoma; Patient 2: squamous cell carcinoma', false,
 $r$Ruled out because this reverses the expected pattern; alcohol and smoking are classic risk factors for squamous cell carcinoma, while Barrett metaplasia from chronic reflux predisposes specifically to adenocarcinoma, not squamous cell carcinoma.$r$, 2),
('50000000-0000-0000-0000-000000000021', 'C', 'Both patients most likely have squamous cell carcinoma', false,
 $r$Ruled out because Patient 2's history of Barrett oesophagus from chronic GORD is a specific risk factor for adenocarcinoma, not squamous cell carcinoma.$r$, 3),
('50000000-0000-0000-0000-000000000021', 'D', 'Both patients most likely have adenocarcinoma', false,
 $r$Ruled out because Patient 1's alcohol and smoking history with a middle-third tumour is more typical of squamous cell carcinoma, not adenocarcinoma.$r$, 4),
('50000000-0000-0000-0000-000000000021', 'E', 'Both patients most likely have gastric MALT lymphoma', false,
 $r$Ruled out because MALT lymphoma is a distinct B-cell lymphoma of the stomach, typically associated with H. pylori infection, and does not fit either patient's described oesophageal tumour location and risk factors.$r$, 5),

-- Q22 C diff risk factors
('50000000-0000-0000-0000-000000000022', 'A', 'Recent broad-spectrum antibiotic use and long-term proton pump inhibitor therapy', true,
 $r$Correct. Broad-spectrum antibiotics (clindamycin is a particularly high-risk agent) disrupt the normal protective gut flora, allowing C. difficile overgrowth, while long-term PPI use reduces gastric acid, which would otherwise help destroy ingested C. difficile spores; both are well-recognised, additive risk factors for C. difficile infection.$r$, 1),
('50000000-0000-0000-0000-000000000022', 'B', 'Her age alone, independent of any medication history', false,
 $r$Ruled out because although advanced age is a recognised risk factor for C. difficile infection, this does not account for the clearly identifiable and modifiable contributions from her recent antibiotic and long-term acid-suppression history.$r$, 2),
('50000000-0000-0000-0000-000000000022', 'C', 'Nursing home residence alone, independent of any medication history', false,
 $r$Ruled out because although institutional care settings increase exposure risk through cross-transmission, this does not explain the individual physiological risk conferred by her antibiotic and PPI use.$r$, 3),
('50000000-0000-0000-0000-000000000022', 'D', 'Dental abscess as an ongoing source of systemic infection', false,
 $r$Ruled out because the dental abscess itself is not a risk factor for C. difficile infection; it was the reason for the antibiotic course, which is the true underlying risk factor here.$r$, 4),
('50000000-0000-0000-0000-000000000022', 'E', 'Chronic constipation', false,
 $r$Ruled out because there is no history of constipation described here, and this would not explain new-onset diarrhoea following antibiotic exposure in any case.$r$, 5),

-- Q23 C diff severity stratification
('50000000-0000-0000-0000-000000000023', 'A', 'Severe C. difficile infection, requiring oral vancomycin as first-line treatment', true,
 $r$Correct. A white cell count above 15x10^9/L, temperature above 38.5C, or a rise in creatinine of more than 50% above baseline each indicate severe C. difficile infection per PHE/NICE severity criteria; oral vancomycin remains the recommended first-line antibiotic even at this severity, though the patient requires closer monitoring and consideration of specialist input.$r$, 1),
('50000000-0000-0000-0000-000000000023', 'B', 'Mild C. difficile infection, requiring no specific antibiotic treatment', false,
 $r$Ruled out because a raised white cell count, fever above 38.5C and an acute rise in creatinine are all markers of severe, not mild, disease, which still requires active antibiotic treatment.$r$, 2),
('50000000-0000-0000-0000-000000000023', 'C', 'Life-threatening C. difficile infection, requiring emergency colectomy', false,
 $r$Ruled out because there are no features described here of life-threatening disease, such as hypotension, ileus or toxic megacolon; emergency colectomy is not indicated at this stage.$r$, 3),
('50000000-0000-0000-0000-000000000023', 'D', 'Moderate C. difficile infection, best treated with oral metronidazole as first-line', false,
 $r$Ruled out because this episode meets severe, not moderate, criteria, and oral vancomycin (not metronidazole) is the recommended first-line agent under current guidance regardless of severity band.$r$, 4),
('50000000-0000-0000-0000-000000000023', 'E', 'This represents asymptomatic colonisation not requiring treatment', false,
 $r$Ruled out because the patient has active diarrhoea with a positive toxin test and systemic markers of severity, which together confirm true infection requiring treatment, not simple colonisation.$r$, 5),

-- Q24 C diff first-line vancomycin
('50000000-0000-0000-0000-000000000024', 'A', 'Oral vancomycin 125mg four times daily for 10 days', true,
 $r$Correct. Current UK guidance recommends oral vancomycin as first-line treatment for a first episode of C. difficile infection (replacing the older first-line role of metronidazole), given orally so it acts locally within the gut lumen where it is not systemically absorbed.$r$, 1),
('50000000-0000-0000-0000-000000000024', 'B', 'Oral metronidazole 400mg three times daily for 10 days', false,
 $r$Ruled out because metronidazole is no longer recommended as first-line treatment for C. difficile infection under current guidance, having been superseded by oral vancomycin.$r$, 2),
('50000000-0000-0000-0000-000000000024', 'C', 'Intravenous vancomycin', false,
 $r$Ruled out because intravenous vancomycin does not achieve adequate concentrations within the gut lumen to treat C. difficile colitis; the oral route is required for local action against the infection.$r$, 3),
('50000000-0000-0000-0000-000000000024', 'D', 'Oral co-amoxiclav', false,
 $r$Ruled out because co-amoxiclav is itself a recognised risk factor for precipitating C. difficile infection and has no role in its treatment.$r$, 4),
('50000000-0000-0000-0000-000000000024', 'E', 'Faecal microbiota transplantation as first-line therapy', false,
 $r$Ruled out because FMT is reserved for patients with multiple recurrent episodes who have failed appropriate antibiotic therapy, not as first-line treatment for a first episode.$r$, 5),

-- Q25 C diff recurrence
('50000000-0000-0000-0000-000000000025', 'A', 'Oral fidaxomicin', true,
 $r$Correct. For a recurrent episode of C. difficile infection occurring within 12 weeks of a previous episode, fidaxomicin is recommended in preference to repeating vancomycin, as it is associated with lower rates of further recurrence.$r$, 1),
('50000000-0000-0000-0000-000000000025', 'B', 'Repeat the same course of oral vancomycin', false,
 $r$Ruled out because although vancomycin can be used again in some recurrence settings, fidaxomicin is preferred at this point because of its lower recurrence rate compared with repeating vancomycin.$r$, 2),
('50000000-0000-0000-0000-000000000025', 'C', 'Oral metronidazole', false,
 $r$Ruled out because metronidazole is not recommended even for recurrent C. difficile infection under current guidance, having been superseded across the treatment pathway by vancomycin and fidaxomicin.$r$, 3),
('50000000-0000-0000-0000-000000000025', 'D', 'Immediate faecal microbiota transplantation, bypassing further antibiotic treatment', false,
 $r$Ruled out because FMT is reserved for patients with multiple (typically two or more) recurrences who have already failed appropriate antibiotic therapy, not for this first recurrence before an antibiotic such as fidaxomicin has been tried.$r$, 4),
('50000000-0000-0000-0000-000000000025', 'E', 'No further treatment, since the infection is likely to resolve spontaneously', false,
 $r$Ruled out because untreated recurrent C. difficile infection risks ongoing symptoms and complications such as dehydration and toxic megacolon, and active treatment is indicated.$r$, 5),

-- Q26 Glasgow-Blatchford score
('50000000-0000-0000-0000-000000000026', 'A', 'Glasgow-Blatchford score', true,
 $r$Correct. The Glasgow-Blatchford score is used at initial presentation, before endoscopy, to risk-stratify patients with suspected upper GI bleeding using bedside and blood parameters (urea, haemoglobin, systolic blood pressure, pulse, melaena, syncope, hepatic disease, cardiac failure); a score of 0 identifies patients at very low risk who may be suitable for outpatient management.$r$, 1),
('50000000-0000-0000-0000-000000000026', 'B', 'Rockall score', false,
 $r$Ruled out because the full Rockall score requires endoscopic findings and is used after endoscopy to predict rebleeding and mortality risk, not to make the initial decision about safe outpatient management before endoscopy.$r$, 2),
('50000000-0000-0000-0000-000000000026', 'C', 'Child-Pugh score', false,
 $r$Ruled out because this assesses the severity of chronic liver disease and prognosis in cirrhosis, not the risk stratification of an acute GI bleed.$r$, 3),
('50000000-0000-0000-0000-000000000026', 'D', 'CURB-65 score', false,
 $r$Ruled out because this assesses severity and mortality risk in community-acquired pneumonia, not gastrointestinal bleeding.$r$, 4),
('50000000-0000-0000-0000-000000000026', 'E', 'Glasgow-Imrie score', false,
 $r$Ruled out because this assesses the severity of acute pancreatitis, not upper GI bleeding risk.$r$, 5),

-- Q27 Rockall score
('50000000-0000-0000-0000-000000000027', 'A', 'The full (post-endoscopy) Rockall score', true,
 $r$Correct. The full Rockall score incorporates age, haemodynamic status (shock), comorbidity, endoscopic diagnosis, and endoscopic stigmata of recent haemorrhage (such as this visible vessel) to estimate the risk of rebleeding and mortality after endoscopy has been performed.$r$, 1),
('50000000-0000-0000-0000-000000000027', 'B', 'The Glasgow-Blatchford score', false,
 $r$Ruled out because this score is calculated before endoscopy from clinical and laboratory parameters alone and does not incorporate endoscopic findings such as a visible vessel.$r$, 2),
('50000000-0000-0000-0000-000000000027', 'C', 'The CHA2DS2-VASc score', false,
 $r$Ruled out because this estimates stroke risk in atrial fibrillation and has no relevance to upper GI bleeding.$r$, 3),
('50000000-0000-0000-0000-000000000027', 'D', 'The Child-Pugh score', false,
 $r$Ruled out because this grades the severity of chronic liver disease, not the endoscopic risk of rebleeding after an acute ulcer bleed.$r$, 4),
('50000000-0000-0000-0000-000000000027', 'E', 'The Wells score', false,
 $r$Ruled out because this estimates the pre-test probability of venous thromboembolism, not gastrointestinal bleeding risk.$r$, 5),

-- Q28 Peptic ulcer bleed haemostasis+PPI+Hpylori
('50000000-0000-0000-0000-000000000028', 'A', 'High-dose intravenous proton pump inhibitor, with testing for and eradication of H. pylori once stable', true,
 $r$Correct. Following successful endoscopic haemostasis for a bleeding peptic ulcer, high-dose PPI therapy reduces the risk of rebleeding by maintaining a higher intragastric pH that stabilises clot formation, and once the patient is stable, testing for and eradicating H. pylori (if positive) reduces the risk of future ulcer recurrence.$r$, 1),
('50000000-0000-0000-0000-000000000028', 'B', 'High-dose intravenous proton pump inhibitor given routinely before endoscopy, with no need for further PPI or H. pylori testing afterwards', false,
 $r$Ruled out because current guidance does not recommend giving PPI before endoscopy has been performed and does not support omitting eradication testing afterwards, as untreated H. pylori would leave him at ongoing risk of ulcer recurrence.$r$, 2),
('50000000-0000-0000-0000-000000000028', 'C', 'No further treatment is required, since endoscopic haemostasis alone is curative', false,
 $r$Ruled out because endoscopic haemostasis controls the acute bleed but does not address the underlying ulcer risk; PPI therapy and H. pylori eradication (if positive) are both needed to reduce rebleeding and recurrence risk.$r$, 3),
('50000000-0000-0000-0000-000000000028', 'D', 'Long-term aspirin should be started to reduce further bleeding risk', false,
 $r$Ruled out because aspirin is an antiplatelet agent that would increase, not reduce, the risk of further ulcer bleeding; it has no role in this acute post-haemostasis management.$r$, 4),
('50000000-0000-0000-0000-000000000028', 'E', 'Immediate surgical resection of the ulcer, bypassing medical therapy', false,
 $r$Ruled out because surgery is reserved for cases where endoscopic haemostasis fails or bleeding recurs uncontrollably, not as a routine next step after successful endoscopic treatment.$r$, 5),

-- Q29 Coeliac duodenal biopsy
('50000000-0000-0000-0000-000000000029', 'A', 'Villous atrophy, crypt hyperplasia and increased intraepithelial lymphocytes', true,
 $r$Correct. This triad, most pronounced in the duodenum, is the classical histological picture of coeliac disease, reflecting gluten-driven immune damage to the small bowel mucosa, and biopsy remains required to confirm the diagnosis suggested by positive serology.$r$, 1),
('50000000-0000-0000-0000-000000000029', 'B', 'Granulomas with transmural inflammation', false,
 $r$Ruled out because this describes the histology of Crohn disease, not coeliac disease, which characteristically spares the deeper bowel wall layers.$r$, 2),
('50000000-0000-0000-0000-000000000029', 'C', 'Continuous mucosal inflammation with crypt abscesses', false,
 $r$Ruled out because this describes the mucosal picture of ulcerative colitis affecting the colon, not the small bowel villous changes seen in coeliac disease.$r$, 3),
('50000000-0000-0000-0000-000000000029', 'D', 'Eosinophilic infiltration of the full thickness of the bowel wall', false,
 $r$Ruled out because this pattern is characteristic of eosinophilic gastroenteritis, a distinct and much rarer condition from coeliac disease.$r$, 4),
('50000000-0000-0000-0000-000000000029', 'E', 'Normal villous architecture with a surface neutrophilic infiltrate', false,
 $r$Ruled out because coeliac disease characteristically shows villous atrophy, not normal architecture; a purely neutrophilic surface infiltrate would not support this diagnosis.$r$, 5),

-- Q30 Crohn vs UC distinguishing
('50000000-0000-0000-0000-000000000030', 'A', 'Patient 1: Crohn disease; Patient 2: ulcerative colitis', true,
 $r$Correct. Perianal fistulae, skip lesions and rectal sparing are characteristic of Crohn disease, which can affect any part of the GI tract with patchy, transmural inflammation, whereas continuous inflammation beginning at the rectum and extending proximally without skip lesions is characteristic of ulcerative colitis, which is confined to the colon and rectum with mucosal-only inflammation.$r$, 1),
('50000000-0000-0000-0000-000000000030', 'B', 'Patient 1: ulcerative colitis; Patient 2: Crohn disease', false,
 $r$Ruled out because this reverses the classic pattern; perianal fistulae and skip lesions with rectal sparing point to Crohn disease, while continuous rectal-onset inflammation points to ulcerative colitis, not the other way round.$r$, 2),
('50000000-0000-0000-0000-000000000030', 'C', 'Both patients most likely have ulcerative colitis', false,
 $r$Ruled out because Patient 1's perianal fistulae and skip lesions with rectal sparing are not features of ulcerative colitis, which characteristically causes continuous, rectal-onset disease without fistulating perianal involvement.$r$, 3),
('50000000-0000-0000-0000-000000000030', 'D', 'Both patients most likely have Crohn disease', false,
 $r$Ruled out because Patient 2's continuous inflammation from the rectum without skip lesions is not typical of Crohn disease, which characteristically produces patchy, discontinuous involvement.$r$, 4),
('50000000-0000-0000-0000-000000000030', 'E', 'Both patients most likely have infective colitis', false,
 $r$Ruled out because the chronic, relapsing pattern with the specific structural findings described (fistulae and skip lesions versus continuous rectal-onset inflammation) is more consistent with inflammatory bowel disease than an acute infective process.$r$, 5),

-- Q31 UC toxic megacolon
('50000000-0000-0000-0000-000000000031', 'A', 'Toxic megacolon, requiring urgent surgical review alongside intensive medical therapy', true,
 $r$Correct. Colonic dilatation above 6 cm with systemic toxicity in the context of severe colitis defines toxic megacolon, a life-threatening complication carrying a high risk of perforation; it requires urgent surgical review alongside intravenous corticosteroids, fluid resuscitation and bowel rest, with colectomy if there is no rapid improvement.$r$, 1),
('50000000-0000-0000-0000-000000000031', 'B', 'Acute diverticulitis', false,
 $r$Ruled out because diverticulitis typically causes localised left iliac fossa pain rather than the diffuse colonic dilatation and systemic toxicity described here, and this patient has an established diagnosis of ulcerative colitis explaining her presentation instead.$r$, 2),
('50000000-0000-0000-0000-000000000031', 'C', 'Colorectal carcinoma causing large bowel obstruction', false,
 $r$Ruled out because the acute onset in a young patient with a known severe ulcerative colitis flare, alongside marked systemic toxicity, points to toxic megacolon rather than an obstructing malignancy, which would typically present more gradually.$r$, 3),
('50000000-0000-0000-0000-000000000031', 'D', 'Simple constipation with faecal loading', false,
 $r$Ruled out because the combination of marked colonic dilatation with fever, tachycardia and systemic toxicity in the context of an active severe colitis flare far exceeds the picture of simple constipation.$r$, 4),
('50000000-0000-0000-0000-000000000031', 'E', 'Irritable bowel syndrome exacerbation', false,
 $r$Ruled out because IBS is a functional disorder without colonic dilatation, fever or systemic toxicity, none of which fit this presentation.$r$, 5),

-- Q32 PBC UDCA management
('50000000-0000-0000-0000-000000000032', 'A', 'Ursodeoxycholic acid', true,
 $r$Correct. Ursodeoxycholic acid is the first-line disease-modifying treatment for primary biliary cholangitis, improving bile flow and reducing the toxicity of retained bile acids, which slows disease progression and improves liver biochemistry in most patients.$r$, 1),
('50000000-0000-0000-0000-000000000032', 'B', 'Prednisolone and azathioprine', false,
 $r$Ruled out because this combination is the standard treatment for autoimmune hepatitis, not primary biliary cholangitis, which does not typically respond to this immunosuppressive regimen as first-line therapy.$r$, 2),
('50000000-0000-0000-0000-000000000032', 'C', 'Penicillamine', false,
 $r$Ruled out because penicillamine is a copper-chelating agent used in Wilson disease, an unrelated condition of copper metabolism, not primary biliary cholangitis.$r$, 3),
('50000000-0000-0000-0000-000000000032', 'D', 'Interferon-based antiviral therapy', false,
 $r$Ruled out because this is used for chronic viral hepatitis, not the autoimmune cholestatic process of primary biliary cholangitis.$r$, 4),
('50000000-0000-0000-0000-000000000032', 'E', 'Venesection', false,
 $r$Ruled out because venesection is the treatment for iron overload in haemochromatosis, not for the bile-acid-mediated liver injury of primary biliary cholangitis.$r$, 5),

-- Q33 Acute pancreatitis Glasgow-Imrie
('50000000-0000-0000-0000-000000000033', 'A', 'Severe acute pancreatitis, as he meets three or more adverse Glasgow-Imrie criteria', true,
 $r$Correct. He meets multiple adverse Glasgow-Imrie criteria (PaO2 <8 kPa, WCC >15x10^9/L, calcium <2 mmol/L, urea >16 mmol/L, albumin <32 g/L, glucose >10 mmol/L); a score of 3 or more within 48 hours of admission indicates severe pancreatitis, warranting consideration of high-dependency or intensive care.$r$, 1),
('50000000-0000-0000-0000-000000000033', 'B', 'Mild acute pancreatitis requiring only oral analgesia and outpatient follow-up', false,
 $r$Ruled out because meeting multiple adverse severity markers indicates severe, not mild, disease, requiring close inpatient monitoring rather than outpatient management.$r$, 2),
('50000000-0000-0000-0000-000000000033', 'C', 'This scoring system is not validated for alcohol-induced pancreatitis', false,
 $r$Ruled out because the Glasgow-Imrie score is validated for pancreatitis of any aetiology, including alcohol-induced disease, and is not restricted to gallstone pancreatitis.$r$, 3),
('50000000-0000-0000-0000-000000000033', 'D', 'This pattern of blood results is diagnostic of chronic, not acute, pancreatitis', false,
 $r$Ruled out because these acute inflammatory and biochemical markers reflect an acute severity assessment; chronic pancreatitis is diagnosed on a different basis (such as pancreatic calcification or exocrine insufficiency), not this acute severity scoring.$r$, 4),
('50000000-0000-0000-0000-000000000033', 'E', 'The findings suggest a diagnosis of acute cholangitis rather than pancreatitis', false,
 $r$Ruled out because the clinical picture (epigastric pain radiating to the back, markedly raised amylase) together with these severity markers fits acute pancreatitis, not cholangitis, which would be expected to show a cholestatic LFT pattern with fever and jaundice.$r$, 5),

-- Q34 Variceal bleed management
('50000000-0000-0000-0000-000000000034', 'A', 'IV terlipressin and prophylactic broad-spectrum antibiotics, followed by endoscopy with variceal band ligation', true,
 $r$Correct. Terlipressin should be started as soon as a variceal bleed is suspected, causing splanchnic vasoconstriction that reduces portal pressure and variceal blood flow, alongside prophylactic antibiotics (which reduce mortality in cirrhotic patients with GI bleeding); endoscopy with band ligation, the preferred endoscopic technique over sclerotherapy, should follow once the patient is stabilised.$r$, 1),
('50000000-0000-0000-0000-000000000034', 'B', 'Immediate endoscopy with sclerotherapy as the first-choice endoscopic technique', false,
 $r$Ruled out because band ligation, not sclerotherapy, is the preferred first-line endoscopic technique for variceal bleeding, being associated with lower rates of complications such as oesophageal stricture and perforation.$r$, 2),
('50000000-0000-0000-0000-000000000034', 'C', 'High-dose intravenous proton pump inhibitor as the key pharmacological agent, with no vasoactive drug', false,
 $r$Ruled out because terlipressin, a vasoactive drug that reduces splanchnic and portal pressure, is the key pharmacological therapy for suspected variceal bleeding; PPI therapy is directed at peptic ulcer bleeding rather than variceal haemorrhage.$r$, 3),
('50000000-0000-0000-0000-000000000034', 'D', 'Withhold antibiotics until blood cultures confirm infection', false,
 $r$Ruled out because prophylactic antibiotics should be given empirically to all cirrhotic patients with suspected variceal bleeding, given their proven mortality benefit, rather than waiting for culture confirmation of infection.$r$, 4),
('50000000-0000-0000-0000-000000000034', 'E', 'Emergency oesophagectomy', false,
 $r$Ruled out because surgical resection has no role in the acute management of variceal bleeding; endoscopic and pharmacological measures, with TIPS or balloon tamponade as rescue options, are used instead.$r$, 5),

-- Q35 Crohn induction/maintenance
('50000000-0000-0000-0000-000000000035', 'A', 'Corticosteroids to induce remission, followed by azathioprine (after checking TPMT activity) for maintenance', true,
 $r$Correct. Corticosteroids (such as prednisolone or budesonide) are first-line to induce remission in an active Crohn disease flare, with azathioprine or mercaptopurine used for maintenance thereafter; thiopurine methyltransferase (TPMT) activity should be checked before starting azathioprine because of the risk of severe myelosuppression in patients with low or absent enzyme activity.$r$, 1),
('50000000-0000-0000-0000-000000000035', 'B', '5-aminosalicylate (mesalazine) as the most effective induction agent', false,
 $r$Ruled out because 5-ASA agents are less effective for inducing remission in Crohn disease than in ulcerative colitis, and corticosteroids are preferred first-line for induction in Crohn disease.$r$, 2),
('50000000-0000-0000-0000-000000000035', 'C', 'Long-term corticosteroids as the maintenance agent of choice', false,
 $r$Ruled out because corticosteroids are not used for long-term maintenance due to their side-effect burden; a steroid-sparing agent such as azathioprine is used instead once remission is induced.$r$, 3),
('50000000-0000-0000-0000-000000000035', 'D', 'Azathioprine alone, without first checking TPMT activity', false,
 $r$Ruled out because TPMT activity must be checked before starting azathioprine, since patients with reduced or absent enzyme activity are at high risk of severe, potentially life-threatening myelosuppression.$r$, 4),
('50000000-0000-0000-0000-000000000035', 'E', 'Total colectomy as first-line management of a new diagnosis', false,
 $r$Ruled out because surgery is reserved for complications or medically refractory disease, not as first-line management of a newly diagnosed flare that has not yet been trialled on medical therapy.$r$, 5),

-- Q36 Cirrhosis ascites SBP chain
('50000000-0000-0000-0000-000000000036', 'A', 'Hepatic synthetic failure causing hypoalbuminaemia, combined with portal hypertension, has driven ascites formation; the resulting ascitic fluid, with reduced opsonic (protein) activity, has become secondarily infected as spontaneous bacterial peritonitis', true,
 $r$Correct. Reduced hepatic albumin synthesis lowers plasma oncotic pressure, while portal hypertension raises hydrostatic pressure within the splanchnic circulation; together these drive fluid into the peritoneal cavity as ascites. Ascitic fluid with low protein content has reduced complement and opsonic activity, impairing its ability to clear translocated gut bacteria, which predisposes to spontaneous bacterial peritonitis, exactly as demonstrated by the raised ascitic neutrophil count here.$r$, 1),
('50000000-0000-0000-0000-000000000036', 'B', 'The ascites is caused directly by bacterial translocation alone, with no contribution from hypoalbuminaemia or portal hypertension', false,
 $r$Ruled out because ascites formation itself is primarily driven by hypoalbuminaemia and portal hypertension; bacterial translocation and infection occur as a secondary complication of established, low-protein ascites, not as its primary cause.$r$, 2),
('50000000-0000-0000-0000-000000000036', 'C', 'His confusion and fever are both directly caused by alcohol withdrawal, unrelated to his ascites', false,
 $r$Ruled out because the combination of fever, abdominal pain and a markedly raised ascitic neutrophil count specifically indicates infected ascites (SBP), which independently explains both his systemic symptoms and encephalopathy-like confusion, rather than withdrawal alone.$r$, 3),
('50000000-0000-0000-0000-000000000036', 'D', 'The ascitic fluid neutrophil count reflects malignant peritoneal infiltration rather than infection', false,
 $r$Ruled out because a markedly raised neutrophil count with fever and abdominal pain in a cirrhotic patient is the defining picture of spontaneous bacterial peritonitis, not malignant ascites, which would not typically show this neutrophilic response.$r$, 4),
('50000000-0000-0000-0000-000000000036', 'E', 'Portal hypertension alone, without any change in albumin, fully explains both the ascites and the infection risk', false,
 $r$Ruled out because hypoalbuminaemia specifically contributes to low ascitic protein and reduced opsonic activity, which is the key mechanistic link to infection risk; portal hypertension alone does not explain this reduced antibacterial defence within the fluid.$r$, 5),

-- Q37 Variceal UGIB ammonia encephalopathy chain
('50000000-0000-0000-0000-000000000037', 'A', 'Digested blood within the gut acts as a large protein (nitrogenous) load, increasing bacterial ammonia production and absorption, which his cirrhotic liver cannot adequately clear, precipitating hepatic encephalopathy', true,
 $r$Correct. Blood in the gastrointestinal tract is broken down by colonic bacteria in the same way as dietary protein, generating a large ammonia load; in a patient with cirrhosis, impaired hepatic urea cycle function means this ammonia is not efficiently cleared, allowing it to cross the blood-brain barrier, where astrocytes convert it to glutamine, causing cerebral oedema and the clinical picture of hepatic encephalopathy seen here.$r$, 1),
('50000000-0000-0000-0000-000000000037', 'B', 'The confusion is caused directly by hypovolaemic shock from ongoing blood loss', false,
 $r$Ruled out because his bleeding has already been successfully controlled two days earlier; the markedly raised ammonia level and flapping tremor point specifically to hepatic encephalopathy rather than ongoing hypovolaemia.$r$, 2),
('50000000-0000-0000-0000-000000000037', 'C', 'Terlipressin has directly caused cerebral toxicity, unrelated to his ammonia level', false,
 $r$Ruled out because terlipressin acts as a splanchnic vasoconstrictor and is not a recognised direct cause of confusion or a flapping tremor; the raised ammonia level specifically points to hepatic encephalopathy as the explanation.$r$, 3),
('50000000-0000-0000-0000-000000000037', 'D', 'The band ligation procedure has caused a stroke, explaining his new confusion', false,
 $r$Ruled out because there is no focal neurological deficit described, and a markedly raised ammonia level with a flapping tremor is far more consistent with hepatic encephalopathy than a procedural cerebrovascular event.$r$, 4),
('50000000-0000-0000-0000-000000000037', 'E', 'His confusion reflects untreated ongoing infection from the antibiotics failing, unrelated to the GI bleed itself', false,
 $r$Ruled out because while infection is a separate recognised precipitant of encephalopathy, this patient's markedly raised ammonia level in the specific context of a large recent GI bleed points to the digested blood protein load as the driving mechanism here.$r$, 5),

-- Q38 TIPS encephalopathy chain
('50000000-0000-0000-0000-000000000038', 'A', 'The TIPS has created a direct portosystemic shunt, allowing portal blood (and the ammonia it carries) to bypass hepatic metabolism entirely, precipitating hepatic encephalopathy', true,
 $r$Correct. A TIPS deliberately diverts portal venous blood directly into the systemic (hepatic venous) circulation to relieve portal hypertension; while this reduces variceal bleeding risk, it also means that ammonia and other gut-derived nitrogenous substances bypass hepatic detoxification entirely, making new or worsening hepatic encephalopathy a recognised complication of the procedure.$r$, 1),
('50000000-0000-0000-0000-000000000038', 'B', 'She has developed a new spontaneous GI bleed causing this presentation', false,
 $r$Ruled out because there is no evidence of GI bleeding described, and this typical post-TIPS timeframe and absence of other precipitants points instead to the shunt itself as the direct cause of her encephalopathy.$r$, 2),
('50000000-0000-0000-0000-000000000038', 'C', 'The TIPS procedure has caused an ischaemic stroke', false,
 $r$Ruled out because there is no focal neurological deficit described, and post-TIPS encephalopathy from portosystemic shunting is a specific, well-recognised complication that better explains this global confusional picture.$r$, 3),
('50000000-0000-0000-0000-000000000038', 'D', 'Her confusion is caused by alcohol withdrawal, unrelated to the TIPS', false,
 $r$Ruled out because no history of recent alcohol cessation is given, and the temporal relationship to a procedure that specifically bypasses hepatic ammonia clearance points to TIPS-related encephalopathy as the explanation.$r$, 4),
('50000000-0000-0000-0000-000000000038', 'E', 'Undiagnosed spontaneous bacterial peritonitis is driving her confusion', false,
 $r$Ruled out because there is no fever, abdominal pain or other feature suggesting infection described, and the clear absence of these standard precipitants alongside a recent TIPS points to portosystemic shunting itself as the cause.$r$, 5),

-- Q39 PPI Cdiff severe colitis chain
('50000000-0000-0000-0000-000000000039', 'A', 'Long-term acid suppression from the PPI reduced the gastric acid barrier that would normally destroy ingested C. difficile spores; combined with antibiotic-induced disruption of protective gut flora, this allowed C. difficile overgrowth and toxin production, progressing to severe colitis', true,
 $r$Correct. Gastric acid is an important barrier against ingested pathogens, including C. difficile spores; chronic PPI use removes much of this barrier, and when combined with broad-spectrum antibiotic therapy (which disrupts the normal, protective colonic flora that would otherwise resist C. difficile colonisation), the risk of toxin-producing C. difficile overgrowth and subsequent severe colitis is substantially increased, exactly as seen in this sequence of events.$r$, 1),
('50000000-0000-0000-0000-000000000039', 'B', 'The PPI has caused direct chemical damage to the colonic mucosa, independent of any effect on gut flora or gastric acid', false,
 $r$Ruled out because PPIs act by reducing gastric acid secretion in the stomach, not by directly damaging the colon; their contribution to C. difficile risk is through loss of the acid barrier against spores, not direct colonic toxicity.$r$, 2),
('50000000-0000-0000-0000-000000000039', 'C', 'Her chest infection itself, rather than either the PPI or the antibiotic, is the sole explanation for her colitis', false,
 $r$Ruled out because the chest infection was the reason for antibiotic treatment, but it is the antibiotic-induced disruption of gut flora (compounded by long-term acid suppression) that directly explains her subsequent C. difficile colitis, not the respiratory infection itself.$r$, 3),
('50000000-0000-0000-0000-000000000039', 'D', 'Long-term PPI use has caused vitamin B12 deficiency, which is directly responsible for her diarrhoea and colitis', false,
 $r$Ruled out because although long-term PPI use can contribute to reduced B12 absorption over time, this does not explain acute toxin-positive diarrhoea and colitis; the acid-suppression-plus-antibiotic mechanism described is the relevant pathway here.$r$, 4),
('50000000-0000-0000-0000-000000000039', 'E', 'Co-amoxiclav has caused an IgE-mediated allergic colitis, unrelated to C. difficile', false,
 $r$Ruled out because her stool testing is positive for C. difficile toxin, confirming true infective colitis rather than an allergic process, and her risk was compounded by the pre-existing PPI-related loss of the gastric acid barrier.$r$, 5),

-- Q40 Alcohol pancreatitis hypocalcaemia tetany chain
('50000000-0000-0000-0000-000000000040', 'A', 'Pancreatic lipase released during acute pancreatitis breaks down peripancreatic and mesenteric fat, releasing free fatty acids that bind calcium to form insoluble calcium soaps (saponification), depleting serum calcium and causing tetany', true,
 $r$Correct. In acute pancreatitis, released lipase digests surrounding adipose tissue, liberating free fatty acids that chelate circulating calcium to form calcium soaps within areas of fat necrosis; this sequestration lowers serum calcium, and when sufficiently severe, produces the neuromuscular irritability seen here as carpal spasm (Trousseau sign) and perioral tingling, consistent with hypocalcaemic tetany.$r$, 1),
('50000000-0000-0000-0000-000000000040', 'B', 'Alcohol has directly suppressed parathyroid hormone secretion, independent of the pancreatitis itself', false,
 $r$Ruled out because although alcohol excess can affect calcium and magnesium homeostasis through other pathways, the specific and well-recognised mechanism linking acute pancreatitis to hypocalcaemia is fat saponification from released lipase, not direct parathyroid suppression.$r$, 2),
('50000000-0000-0000-0000-000000000040', 'C', 'This represents hypercalcaemia-induced pancreatitis, with the tetany unrelated to the pancreatic process', false,
 $r$Ruled out because his calcium is markedly low, not high, and hypocalcaemia (not hypercalcaemia) is the abnormality driving his tetany here, arising as a consequence of the pancreatitis rather than its cause.$r$, 3),
('50000000-0000-0000-0000-000000000040', 'D', 'The tetany is caused by alcohol withdrawal seizures, unrelated to his calcium level', false,
 $r$Ruled out because carpal spasm on cuff inflation (Trousseau sign) and perioral tingling in the setting of a markedly low corrected calcium specifically indicate hypocalcaemic tetany, not a withdrawal seizure, which would present differently.$r$, 4),
('50000000-0000-0000-0000-000000000040', 'E', 'Renal failure secondary to pancreatitis is causing hyperphosphataemia-driven calcium precipitation', false,
 $r$Ruled out because there is no renal failure or hyperphosphataemia described here; the well-established route from pancreatitis to hypocalcaemia is fat saponification by released lipase, not a renal-phosphate mechanism.$r$, 5),

-- Q41 Haemochromatosis cirrhosis HCC chain
('50000000-0000-0000-0000-000000000041', 'A', 'Six-monthly hepatocellular carcinoma surveillance with liver ultrasound (with or without alpha-fetoprotein)', true,
 $r$Correct. Chronic iron deposition in haemochromatosis causes progressive hepatocyte injury and fibrosis, culminating in cirrhosis; once cirrhosis has developed, from any cause including haemochromatosis, patients are at significantly increased risk of hepatocellular carcinoma and require regular surveillance, typically six-monthly liver ultrasound with or without AFP, a requirement that would not apply to a haemochromatosis patient successfully treated before reaching the cirrhotic stage.$r$, 1),
('50000000-0000-0000-0000-000000000041', 'B', 'More frequent venesection, with no additional imaging surveillance required', false,
 $r$Ruled out because although venesection remains important to control ongoing iron loading, it does not address the separate, established risk of hepatocellular carcinoma that arises specifically because cirrhosis has already developed; this requires dedicated surveillance imaging, not simply more frequent venesection.$r$, 2),
('50000000-0000-0000-0000-000000000041', 'C', 'Annual bone density scanning as the main additional requirement', false,
 $r$Ruled out because while haemochromatosis-related arthropathy and endocrine complications are recognised, the specific consequence of his now-established cirrhosis is a markedly increased hepatocellular carcinoma risk, which is the additional surveillance need highlighted by this history, not bone density monitoring.$r$, 3),
('50000000-0000-0000-0000-000000000041', 'D', 'Referral for liver transplantation as the immediate next step, without surveillance', false,
 $r$Ruled out because compensated cirrhosis from haemochromatosis does not automatically mandate transplantation; regular HCC surveillance is the appropriate next step, with transplantation reserved for decompensation or the development of malignancy.$r$, 4),
('50000000-0000-0000-0000-000000000041', 'E', 'Annual chest CT surveillance for pulmonary iron deposition', false,
 $r$Ruled out because haemochromatosis causes iron deposition predominantly in the liver, pancreas, heart, joints and skin, not clinically significant pulmonary iron deposition, so this is not the relevant surveillance requirement here.$r$, 5),

-- Q42 Crohn terminal ileal B12/bile acid chain
('50000000-0000-0000-0000-000000000042', 'A', 'Terminal ileal disease and resection have impaired absorption of both vitamin B12 (normally absorbed there, bound to intrinsic factor) and bile acids, causing macrocytic anaemia and bile-acid-mediated diarrhoea respectively', true,
 $r$Correct. The terminal ileum is the specific site of absorption for the vitamin B12-intrinsic factor complex and for reabsorption of bile acids in the enterohepatic circulation; disease or resection affecting this segment causes B12 deficiency (leading to macrocytic anaemia and peripheral neuropathy) and allows unabsorbed bile acids to pass into the colon, where they stimulate secretory (bile-acid) diarrhoea, explaining both of her separate findings from a single anatomical cause.$r$, 1),
('50000000-0000-0000-0000-000000000042', 'B', 'Both findings are explained by ongoing active Crohn inflammation alone, unrelated to the site of disease', false,
 $r$Ruled out because her diarrhoea is specifically described as separate from her usual inflammatory flares, and the combination of macrocytic anaemia with chronic diarrhoea is better explained by the specific malabsorptive consequences of terminal ileal disease/resection than by generic disease activity.$r$, 2),
('50000000-0000-0000-0000-000000000042', 'C', 'Her anaemia is due to iron deficiency from chronic blood loss, unrelated to her ileal disease', false,
 $r$Ruled out because her anaemia is macrocytic with a low B12 level, not the microcytic picture expected from iron deficiency due to blood loss; this points specifically to B12 malabsorption from terminal ileal disease.$r$, 3),
('50000000-0000-0000-0000-000000000042', 'D', 'Her diarrhoea is due to lactose intolerance, unrelated to her surgical history', false,
 $r$Ruled out because although lactose intolerance can cause diarrhoea, it does not explain her B12 deficiency, whereas terminal ileal disease/resection provides a single unifying explanation for both her anaemia and her diarrhoea.$r$, 4),
('50000000-0000-0000-0000-000000000042', 'E', 'Both findings reflect small intestinal bacterial overgrowth unrelated to the site of her Crohn disease', false,
 $r$Ruled out because while SIBO can occur in Crohn disease, it does not specifically explain isolated B12 deficiency in the way that loss of the terminal ileal absorption site does, which is the more directly relevant mechanism given her surgical history.$r$, 5),

-- Q43 Wilson disease copper chain
('50000000-0000-0000-0000-000000000043', 'A', 'Impaired biliary copper excretion causes copper accumulation in the liver, basal ganglia and cornea, producing hepatic dysfunction, extrapyramidal/psychiatric features and Kayser-Fleischer rings respectively; penicillamine chelates and promotes urinary excretion of this excess copper', true,
 $r$Correct. Wilson disease results from a defect in the ATP7B copper-transporting protein, impairing biliary copper excretion and incorporation of copper into caeruloplasmin; the resulting copper accumulates in the liver (causing hepatitis/cirrhosis), the basal ganglia (causing tremor, dysarthria and personality/psychiatric change), and the cornea (Kayser-Fleischer rings), unifying all three findings under one mechanism. Penicillamine is a chelating agent that binds this excess copper and promotes its urinary excretion, directly targeting the underlying copper overload.$r$, 1),
('50000000-0000-0000-0000-000000000043', 'B', 'This represents a primary psychiatric disorder with coincidental, unrelated liver and eye findings', false,
 $r$Ruled out because a single unifying mechanism (impaired copper handling) explains the hepatic, neurological/psychiatric and ophthalmological findings together, making a coincidental primary psychiatric diagnosis a far less likely explanation.$r$, 2),
('50000000-0000-0000-0000-000000000043', 'C', 'Excess iron deposition in the basal ganglia and liver explains all three findings, and venesection is the most appropriate treatment', false,
 $r$Ruled out because the low caeruloplasmin and corneal Kayser-Fleischer rings specifically indicate a copper, not iron, overload disorder; venesection treats iron overload in haemochromatosis, not the copper accumulation of Wilson disease.$r$, 3),
('50000000-0000-0000-0000-000000000043', 'D', 'The liver disease is caused by an unrelated viral hepatitis, and the neurological and eye findings are coincidental', false,
 $r$Ruled out because this fragments a presentation that is fully explained by a single disorder of copper metabolism, and does not account for the characteristic combination of low caeruloplasmin and Kayser-Fleischer rings.$r$, 4),
('50000000-0000-0000-0000-000000000043', 'E', 'Ursodeoxycholic acid is the most appropriate treatment, targeting bile acid-mediated liver injury as the primary process', false,
 $r$Ruled out because ursodeoxycholic acid treats cholestatic bile-acid-mediated liver disease such as primary biliary cholangitis, not the copper overload of Wilson disease, for which copper chelation with penicillamine is the appropriate targeted treatment.$r$, 5),

-- Q44 Paracetamol NAPQI NAC chain
('50000000-0000-0000-0000-000000000044', 'A', 'Excess paracetamol is metabolised via CYP2E1 to the toxic metabolite NAPQI, which depletes hepatic glutathione stores and then binds directly to hepatocyte proteins causing centrilobular necrosis; N-acetylcysteine replenishes glutathione, allowing safe conjugation and detoxification of NAPQI', true,
 $r$Correct. At therapeutic doses, most paracetamol is safely metabolised by glucuronidation and sulfation, with only a small fraction converted by CYP2E1 to the reactive, toxic metabolite NAPQI, which is normally rapidly conjugated and inactivated by hepatic glutathione. In overdose, the safe conjugation pathways are saturated, more paracetamol is diverted to NAPQI production, and glutathione stores become depleted, allowing NAPQI to bind covalently to hepatocyte proteins and cause centrilobular (zone 3) necrosis. N-acetylcysteine acts as a glutathione precursor, replenishing hepatic glutathione so that NAPQI can again be safely conjugated and detoxified, which is most effective when given early after ingestion.$r$, 1),
('50000000-0000-0000-0000-000000000044', 'B', 'Paracetamol directly damages hepatocyte membranes through an osmotic effect, and N-acetylcysteine works by binding paracetamol itself in the bloodstream', false,
 $r$Ruled out because paracetamol hepatotoxicity arises from its toxic metabolite NAPQI depleting glutathione and binding hepatocyte proteins, not a direct osmotic membrane effect, and N-acetylcysteine acts by replenishing glutathione rather than by binding paracetamol directly.$r$, 2),
('50000000-0000-0000-0000-000000000044', 'C', 'Paracetamol overdose causes hepatotoxicity through an IgE-mediated hypersensitivity reaction, and N-acetylcysteine is a corticosteroid-sparing immunosuppressant', false,
 $r$Ruled out because paracetamol hepatotoxicity is a dose-dependent toxic metabolite effect, not an immune-mediated hypersensitivity reaction, and N-acetylcysteine is a glutathione precursor, not an immunosuppressant.$r$, 3),
('50000000-0000-0000-0000-000000000044', 'D', 'NAPQI is a protective metabolite, and toxicity results from its deficiency rather than its accumulation', false,
 $r$Ruled out because NAPQI is the toxic metabolite whose accumulation (once glutathione stores are depleted) causes hepatocyte injury; it is not a protective substance whose deficiency causes harm.$r$, 4),
('50000000-0000-0000-0000-000000000044', 'E', 'Hepatotoxicity results from direct renal excretion failure of unmetabolised paracetamol, and N-acetylcysteine works by enhancing renal clearance', false,
 $r$Ruled out because paracetamol hepatotoxicity is a hepatic metabolic phenomenon driven by NAPQI and glutathione depletion, not a renal excretion problem, and N-acetylcysteine's mechanism is glutathione repletion, not enhanced renal clearance.$r$, 5),

-- Q45 Budd-Chiari chain
('50000000-0000-0000-0000-000000000045', 'A', 'Thrombotic occlusion of the hepatic veins obstructs hepatic venous outflow, causing sinusoidal congestion and directly raised hepatic sinusoidal pressure; this produces a high-protein (exudative) ascites, distinguishing it from the low-protein transudate typical of cirrhotic portal hypertension', true,
 $r$Correct. In Budd-Chiari syndrome, thrombosis of the hepatic veins (favoured by her underlying myeloproliferative disorder) obstructs venous outflow from the liver, causing back-pressure and congestion within the hepatic sinusoids; this directly raises hydrostatic pressure across the sinusoidal wall, producing an ascitic fluid with a relatively high protein content, in contrast to the typically low-protein (transudative) ascites of cirrhotic portal hypertension where the primary problem is hypoalbuminaemia and portal venous, rather than hepatic venous, pressure.$r$, 1),
('50000000-0000-0000-0000-000000000045', 'B', 'This is standard cirrhotic ascites, and the ascitic protein level of 34 g/L is an incidental, unrelated finding', false,
 $r$Ruled out because a protein level of 34 g/L is high for typical cirrhotic (transudative) ascites, which usually has a low protein content; this raised protein specifically points to a hepatic venous outflow problem such as Budd-Chiari syndrome rather than routine cirrhotic ascites.$r$, 2),
('50000000-0000-0000-0000-000000000045', 'C', 'Her ascites is caused by peritoneal tuberculosis, unrelated to her myeloproliferative disorder', false,
 $r$Ruled out because the absent hepatic vein flow on Doppler ultrasound directly demonstrates hepatic venous outflow obstruction, providing a clear unifying explanation without needing to invoke a separate infective process.$r$, 3),
('50000000-0000-0000-0000-000000000045', 'D', 'Portal vein thrombosis alone, sparing the hepatic veins, is the cause of her presentation', false,
 $r$Ruled out because the Doppler findings specifically show absent flow in the hepatic veins themselves (not simply the portal vein), which is the defining feature of Budd-Chiari syndrome.$r$, 4),
('50000000-0000-0000-0000-000000000045', 'E', 'Hypoalbuminaemia from her myeloproliferative disorder is the primary driver of her ascites', false,
 $r$Ruled out because her myeloproliferative disorder is relevant as a hypercoagulable risk factor for hepatic vein thrombosis, not as a cause of hypoalbuminaemia, and the high ascitic protein argues against a purely hypoalbuminaemic (low-protein) mechanism.$r$, 5),

-- Q46 Pancreatic head cancer CBD compression biochem chain
('50000000-0000-0000-0000-000000000046', 'A', 'A tumour in the head of the pancreas compresses the distal common bile duct, causing post-hepatic (obstructive) biliary obstruction; this raises conjugated bilirubin, ALP and GGT, prevents bilirubin and bile salts from reaching the gut (causing pale stools and pruritus from retained bile salts) while excess conjugated bilirubin is excreted in urine (dark urine), and the resulting chronically distended, non-tender gallbladder produces Courvoisier sign', true,
 $r$Correct. A pancreatic head tumour mechanically compresses the distal common bile duct as it passes through or adjacent to the pancreatic head, producing post-hepatic obstructive jaundice; obstruction prevents conjugated bilirubin and bile acids from draining into the duodenum, causing pale (acholic) stools and pruritus from accumulating bile salts, while the excess conjugated bilirubin backs up into the bloodstream, raising serum levels and being excreted in urine (dark urine); the biliary pressure also causes chronic, painless gallbladder distension, producing the palpable, non-tender gallbladder of Courvoisier sign, which in this context (painless jaundice) favours a malignant rather than gallstone cause of obstruction.$r$, 1),
('50000000-0000-0000-0000-000000000046', 'B', 'Direct hepatocellular injury from tumour infiltration of the liver explains all of his findings', false,
 $r$Ruled out because his LFT pattern (markedly raised ALP/GGT with only mild transaminase elevation) is a cholestatic, not hepatocellular, pattern, consistent with extrahepatic biliary obstruction from a pancreatic head mass rather than direct hepatocyte injury.$r$, 2),
('50000000-0000-0000-0000-000000000046', 'C', 'Courvoisier sign in this context makes gallstone disease the most likely underlying cause', false,
 $r$Ruled out because Courvoisier law states that a palpable, non-tender gallbladder with jaundice is unlikely to be due to gallstones (which typically cause a chronically scarred, non-distensible gallbladder), making malignancy the more likely explanation, the opposite of what this option suggests.$r$, 3),
('50000000-0000-0000-0000-000000000046', 'D', 'Increased unconjugated bilirubin production from haemolysis explains his jaundice and dark urine', false,
 $r$Ruled out because his cholestatic LFT pattern with markedly raised conjugated bilirubin, ALP and GGT reflects biliary obstruction, not haemolysis, which would be expected to raise unconjugated bilirubin without this cholestatic enzyme pattern.$r$, 4),
('50000000-0000-0000-0000-000000000046', 'E', 'Pancreatic exocrine insufficiency alone explains his pale stools, independent of any biliary obstruction', false,
 $r$Ruled out because although pancreatic insufficiency can contribute to steatorrhoea, the specific combination of dark urine, pruritus and a markedly cholestatic LFT pattern is explained by biliary obstruction preventing bile salt and bilirubin excretion into the gut, not by exocrine enzyme deficiency alone.$r$, 5),

-- Q47 PSC UC cholangiocarcinoma chain
('50000000-0000-0000-0000-000000000047', 'A', 'He has primary sclerosing cholangitis, which is strongly associated with ulcerative colitis; the resulting chronic biliary inflammation and stricturing predispose to cholangiocarcinoma, requiring ongoing surveillance', true,
 $r$Correct. Primary sclerosing cholangitis, suggested here by the beaded MRCP appearance of multifocal biliary strictures and dilatations, has a strong association with ulcerative colitis (most patients with PSC have coexisting IBD, usually UC); the chronic inflammatory and fibrotic process affecting the bile ducts in PSC substantially increases the lifetime risk of cholangiocarcinoma arising within the diseased ducts, which is why patients with PSC require ongoing surveillance for this specific malignancy.$r$, 1),
('50000000-0000-0000-0000-000000000047', 'B', 'He has primary biliary cholangitis, which carries no increased risk of any hepatobiliary malignancy', false,
 $r$Ruled out because the MRCP finding of multifocal ductal strictures and dilatations with a beaded appearance is characteristic of primary sclerosing cholangitis, not primary biliary cholangitis (which is typically diagnosed serologically with AMA and does not classically show this ductal beading), and PSC does carry an increased cholangiocarcinoma risk.$r$, 2),
('50000000-0000-0000-0000-000000000047', 'C', 'His raised ALP is simply due to his ulcerative colitis flare and requires no further specific hepatobiliary evaluation', false,
 $r$Ruled out because a persistently raised ALP with these specific beaded MRCP ductal changes indicates a distinct hepatobiliary diagnosis (PSC) requiring dedicated management and cancer surveillance, rather than being a non-specific consequence of colitis activity.$r$, 3),
('50000000-0000-0000-0000-000000000047', 'D', 'He has choledocholithiasis, explaining both the biliary findings and requiring no additional cancer surveillance beyond routine care', false,
 $r$Ruled out because gallstone disease typically causes a discrete stone or focal duct dilatation rather than the multifocal, beaded stricturing pattern described, which is characteristic of PSC and its associated malignancy risk.$r$, 4),
('50000000-0000-0000-0000-000000000047', 'E', 'The biliary findings are an incidental, benign variant unrelated to his ulcerative colitis', false,
 $r$Ruled out because the specific combination of ulcerative colitis with this beaded MRCP appearance is a well-recognised, non-incidental association (PSC-IBD), carrying important implications for future malignancy surveillance.$r$, 5),

-- Q48 NAFLD NASH fibrosis chain
('50000000-0000-0000-0000-000000000048', 'A', 'Insulin resistance and excess free fatty acid delivery to the liver cause hepatic steatosis; in some patients this progresses to steatohepatitis (NASH) with lobular inflammation and hepatocyte injury, which can drive progressive fibrosis and ultimately cirrhosis, so a non-invasive fibrosis test (such as the enhanced liver fibrosis test or FIB-4 score) should be used to identify those at higher risk needing hepatology referral', true,
 $r$Correct. In non-alcoholic fatty liver disease, insulin resistance associated with obesity, type 2 diabetes and dyslipidaemia increases free fatty acid flux to the liver, causing triglyceride accumulation as simple steatosis; in a subset of patients this progresses to non-alcoholic steatohepatitis (NASH), with lobular inflammation and hepatocyte injury that can drive progressive fibrosis and, over years, cirrhosis. Because most patients with simple steatosis do not progress, non-invasive fibrosis assessment (such as the enhanced liver fibrosis test, FIB-4 score, or transient elastography) is used to identify those with significant fibrosis who need hepatology referral, rather than assuming all NAFLD patients are at equally high risk.$r$, 1),
('50000000-0000-0000-0000-000000000048', 'B', 'His liver disease is caused by covert alcohol excess, and this should simply be treated as alcohol-related liver disease', false,
 $r$Ruled out because he has no history of significant alcohol intake, and the described metabolic risk factors (obesity, type 2 diabetes, dyslipidaemia) point specifically to non-alcoholic fatty liver disease rather than an alcohol-related process.$r$, 2),
('50000000-0000-0000-0000-000000000048', 'C', 'Simple hepatic steatosis on ultrasound always indicates established cirrhosis, regardless of further testing', false,
 $r$Ruled out because simple steatosis represents only the earliest stage of NAFLD, and most patients with steatosis alone do not have or progress to cirrhosis; further non-invasive fibrosis testing, not an assumption of established cirrhosis, is the appropriate next step.$r$, 3),
('50000000-0000-0000-0000-000000000048', 'D', 'His transaminase elevation is caused by viral hepatitis, unrelated to his metabolic risk factors', false,
 $r$Ruled out because there is no history or evidence suggestive of viral hepatitis given here, whereas his combination of obesity, diabetes and dyslipidaemia points directly to a metabolic (NAFLD/NASH) explanation for his liver findings.$r$, 4),
('50000000-0000-0000-0000-000000000048', 'E', 'Liver biopsy is required in all patients with steatosis on ultrasound before any other assessment', false,
 $r$Ruled out because non-invasive fibrosis scoring (such as FIB-4 or the enhanced liver fibrosis test) is used first-line to risk-stratify NAFLD patients, reserving biopsy for selected cases where non-invasive results are inconclusive or a definitive diagnosis is required.$r$, 5),

-- Q49 Alcohol withdrawal delirium tremens chain
('50000000-0000-0000-0000-000000000049', 'A', 'Chronic alcohol use causes adaptive downregulation of inhibitory GABA-A receptors and upregulation of excitatory NMDA receptors; abrupt cessation removes alcohol''s usual GABA-potentiating, NMDA-suppressing effect, leaving the brain in a state of unopposed excitatory hyperactivity that produces this progression to delirium tremens, requiring benzodiazepines (with IV thiamine) as first-line treatment', true,
 $r$Correct. Chronic alcohol exposure potentiates inhibitory GABA-A receptor activity and suppresses excitatory NMDA receptor activity; to maintain neuronal equilibrium, the brain adapts over time by downregulating GABA-A receptors and upregulating NMDA receptors. When alcohol is abruptly withdrawn, this adaptation is unmasked as relative GABA underactivity and NMDA/glutamate overactivity, producing progressive CNS hyperexcitability, from early tremor and anxiety through to seizures and, at its most severe, delirium tremens (confusion, hallucinations, autonomic hyperactivity). Benzodiazepines, which potentiate GABA-A receptor activity in the same way alcohol did, are first-line treatment, alongside IV thiamine to prevent Wernicke encephalopathy in this at-risk patient.$r$, 1),
('50000000-0000-0000-0000-000000000049', 'B', 'This represents an acute confusional state from post-operative sepsis, unrelated to his alcohol history', false,
 $r$Ruled out because the clear temporal relationship to alcohol cessation and the classic progression of tremor, agitation, hallucinations and autonomic instability is far more consistent with alcohol withdrawal and delirium tremens than an unexplained septic process, though sepsis should still be excluded as part of his assessment.$r$, 2),
('50000000-0000-0000-0000-000000000049', 'C', 'Alcohol withdrawal is caused by excess GABA activity persisting after alcohol cessation, and the treatment should be a GABA antagonist', false,
 $r$Ruled out because withdrawal is caused by relative GABA underactivity (from receptor downregulation) once alcohol''s potentiating effect is removed, not persistent excess GABA activity; a GABA antagonist would worsen, not treat, this hyperexcitable state.$r$, 3),
('50000000-0000-0000-0000-000000000049', 'D', 'His symptoms reflect opioid withdrawal from post-operative analgesia, unrelated to alcohol', false,
 $r$Ruled out because his clinical picture (tremor progressing to hallucinations and autonomic instability in a patient with a long history of heavy alcohol use and 48 hours of abstinence) is the classic pattern of alcohol withdrawal, not opioid withdrawal, which produces a different symptom profile.$r$, 4),
('50000000-0000-0000-0000-000000000049', 'E', 'Hepatic encephalopathy from underlying cirrhosis is the most likely explanation, and lactulose is the most appropriate treatment', false,
 $r$Ruled out because his clinical progression (tremor, agitation, hallucinations, autonomic hyperactivity, temporally linked to alcohol cessation) is characteristic of alcohol withdrawal/delirium tremens rather than hepatic encephalopathy, and benzodiazepines with thiamine, not lactulose, are the appropriate treatment here.$r$, 5),

-- Q50 Hepatorenal syndrome chain
('50000000-0000-0000-0000-000000000050', 'A', 'Portal hypertension drives splanchnic arterial vasodilation, reducing effective circulating volume; this activates the renin-angiotensin-aldosterone system and sympathetic nervous system, causing intense renal vasoconstriction and a functional (pre-renal-like) fall in glomerular filtration despite structurally normal kidneys, defining hepatorenal syndrome', true,
 $r$Correct. In advanced cirrhosis, portal hypertension promotes nitric oxide-mediated splanchnic arterial vasodilation, which reduces effective arterial circulating volume; the body compensates by activating the renin-angiotensin-aldosterone system and sympathetic nervous system, causing profound renal vasoconstriction. This produces a severe fall in renal perfusion and glomerular filtration rate in the absence of any intrinsic structural kidney damage, a diagnosis of exclusion (having ruled out sepsis, nephrotoxic drugs, obstruction and hypovolaemia unresponsive to albumin) that defines hepatorenal syndrome, exactly as described in this patient.$r$, 1),
('50000000-0000-0000-0000-000000000050', 'B', 'This represents acute tubular necrosis from an unrecognised nephrotoxic drug', false,
 $r$Ruled out because a bland urinalysis without evidence of tubular injury, together with the specific exclusion of nephrotoxic drug exposure and lack of improvement with volume expansion, argues against acute tubular necrosis and supports a functional renal failure from splanchnic vasodilation instead.$r$, 2),
('50000000-0000-0000-0000-000000000050', 'C', 'This represents pre-renal acute kidney injury from simple dehydration, which should resolve fully with further intravenous fluids', false,
 $r$Ruled out because he has already failed to improve despite a trial of intravenous albumin, distinguishing this functional renal failure of hepatorenal syndrome from simple volume-responsive pre-renal AKI.$r$, 3),
('50000000-0000-0000-0000-000000000050', 'D', 'Obstructive uropathy from an enlarged prostate is the most likely explanation', false,
 $r$Ruled out because renal ultrasound is normal with no evidence of obstruction, excluding an obstructive cause for his renal failure.$r$, 4),
('50000000-0000-0000-0000-000000000050', 'E', 'Glomerulonephritis secondary to his liver disease is the most likely explanation', false,
 $r$Ruled out because urinalysis is bland with no proteinuria or casts, which would be expected with glomerulonephritis; this instead supports a functional, non-structural renal process such as hepatorenal syndrome.$r$, 5)

on conflict (question_id, label) do nothing;

-- ---------------------------------------------------------------------------
-- Discriminators
-- ---------------------------------------------------------------------------

insert into question_discriminators (question_id, discriminator_text, sort_order) values

('50000000-0000-0000-0000-000000000001', 'AMA (M2 subtype) positivity in a cholestatic LFT pattern is the serological hallmark of primary biliary cholangitis.', 1),
('50000000-0000-0000-0000-000000000001', 'Pruritus and fatigue, often preceding any derangement in bilirubin, are the classic early symptoms of PBC.', 2),

('50000000-0000-0000-0000-000000000002', 'Toxin detection (EIA or PCR), not simple organism detection, is required to confirm active C. difficile infection.', 1),
('50000000-0000-0000-0000-000000000002', 'Recent broad-spectrum antibiotic exposure (here, co-amoxiclav) is the classic precipitant of C. difficile-associated diarrhoea.', 2),

('50000000-0000-0000-0000-000000000003', 'Anti-tTG IgA is the recommended first-line serological test for suspected coeliac disease, performed while the patient remains on a gluten-containing diet.', 1),
('50000000-0000-0000-0000-000000000003', 'Total IgA must be checked alongside anti-tTG, since selective IgA deficiency is more common in coeliac disease and would otherwise cause a false-negative result.', 2),

('50000000-0000-0000-0000-000000000004', 'Low serum caeruloplasmin, alongside Kayser-Fleischer rings, is the key screening finding for Wilson disease.', 1),
('50000000-0000-0000-0000-000000000004', 'Wilson disease is an autosomal recessive disorder of the ATP7B copper-transporting gene, causing copper accumulation in the liver, basal ganglia and cornea.', 2),

('50000000-0000-0000-0000-000000000005', 'Transferrin saturation is a more specific early marker of iron overload than ferritin, which can also rise as part of an acute-phase response.', 1),
('50000000-0000-0000-0000-000000000005', 'A raised transferrin saturation and ferritin should prompt HFE gene testing (commonly C282Y homozygosity) to confirm hereditary haemochromatosis.', 2),
('50000000-0000-0000-0000-000000000005', 'Arthropathy affecting the second and third metacarpophalangeal joints is a recognised early clinical clue to haemochromatosis.', 3),

('50000000-0000-0000-0000-000000000006', 'The bird beak sign reflects failure of lower oesophageal sphincter relaxation with proximal oesophageal dilatation.', 1),
('50000000-0000-0000-0000-000000000006', 'Achalasia results from degeneration of the myenteric (Auerbach) plexus, causing loss of coordinated peristalsis alongside impaired sphincter relaxation.', 2),
('50000000-0000-0000-0000-000000000006', 'Oesophageal manometry, showing absent peristalsis and elevated lower oesophageal sphincter pressure, is the diagnostic gold standard, with barium swallow supporting the diagnosis.', 3),

('50000000-0000-0000-0000-000000000007', 'Type 1 autoimmune hepatitis is associated with ANA and/or anti-smooth muscle antibody and typically affects adults.', 1),
('50000000-0000-0000-0000-000000000007', 'Type 2 autoimmune hepatitis, defined by anti-LKM1, occurs mainly in children and young people and tends to be more severe.', 2),
('50000000-0000-0000-0000-000000000007', 'Autoimmune hepatitis frequently coexists with other autoimmune conditions, such as autoimmune thyroid disease, as seen here.', 3),

('50000000-0000-0000-0000-000000000008', 'An ascitic neutrophil count above 250 cells/microlitre defines SBP, independent of culture result.', 1),
('50000000-0000-0000-0000-000000000008', 'Culture-negative neutrocytic ascites (raised neutrophils, negative culture) is still treated as SBP.', 2),

('50000000-0000-0000-0000-000000000009', 'Refractory or recurrent peptic ulcers despite adequate acid suppression and H. pylori eradication should raise suspicion of a gastrin-secreting tumour.', 1),
('50000000-0000-0000-0000-000000000009', 'A markedly elevated fasting gastrin level supports gastrinoma (Zollinger-Ellison syndrome) as the cause of excess gastric acid secretion.', 2),
('50000000-0000-0000-0000-000000000009', 'Diarrhoea in Zollinger-Ellison syndrome results from the inactivation of pancreatic enzymes by excess gastric acid delivered to the small bowel.', 3),

('50000000-0000-0000-0000-000000000010', 'Barrett oesophagus is defined by metaplastic conversion of squamous to columnar epithelium, driven by chronic gastro-oesophageal reflux.', 1),
('50000000-0000-0000-0000-000000000010', 'Barrett oesophagus is a recognised precursor lesion for oesophageal adenocarcinoma, hence the need for surveillance endoscopy.', 2),

('50000000-0000-0000-0000-000000000011', 'Alpha-1 antitrypsin deficiency causes lower-zone panacinar emphysema through loss of the protective anti-elastase effect in the lungs.', 1),
('50000000-0000-0000-0000-000000000011', 'Liver disease in alpha-1 antitrypsin deficiency arises from a toxic gain-of-function mechanism, with accumulation of misfolded protein within hepatocytes, rather than loss of function.', 2),
('50000000-0000-0000-0000-000000000011', 'The homozygous PiZZ genotype carries the highest risk of both clinically significant lung and liver disease.', 3),

('50000000-0000-0000-0000-000000000012', 'Carcinoid syndrome typically only manifests once liver metastases are present, since hepatic first-pass metabolism otherwise clears secreted serotonin.', 1),
('50000000-0000-0000-0000-000000000012', 'Right-sided valvular lesions (tricuspid regurgitation, pulmonary stenosis) reflect serotonin-induced fibrosis, with the left heart relatively protected by pulmonary metabolism of serotonin.', 2),
('50000000-0000-0000-0000-000000000012', 'Urinary 5-HIAA is the standard biochemical screening test, reflecting serotonin breakdown.', 3),

('50000000-0000-0000-0000-000000000013', 'An insulin surge on refeeding drives phosphate, potassium and magnesium intracellularly, causing the characteristic biochemical picture of refeeding syndrome.', 1),
('50000000-0000-0000-0000-000000000013', 'At-risk patients (very low BMI, minimal intake for over 10 days, or significant unintentional weight loss) should have feeding introduced slowly with electrolyte monitoring and replacement.', 2),
('50000000-0000-0000-0000-000000000013', 'Thiamine should be given before and during refeeding to reduce the risk of precipitating Wernicke encephalopathy.', 3),

('50000000-0000-0000-0000-000000000014', 'In the absence of alarm features, a PPI trial alongside lifestyle measures is first-line, without needing endoscopy first.', 1),
('50000000-0000-0000-0000-000000000014', 'Alarm features (dysphagia, weight loss, anaemia, persistent vomiting, or new symptoms in an older patient) should prompt urgent endoscopic referral instead.', 2),

('50000000-0000-0000-0000-000000000015', 'Rome IV criteria require pain related to defecation or altered stool frequency/form, occurring for at least three months with onset at least six months earlier.', 1),
('50000000-0000-0000-0000-000000000015', 'Normal investigations (coeliac serology, faecal calprotectin) help exclude organic disease such as coeliac disease or inflammatory bowel disease before a diagnosis of IBS is made.', 2),

('50000000-0000-0000-0000-000000000016', 'MRCP is the standard non-invasive step to confirm a suspected common bile duct stone when ultrasound shows ductal dilatation without a clearly visualised stone.', 1),
('50000000-0000-0000-0000-000000000016', 'ERCP is both diagnostic and therapeutic for choledocholithiasis, allowing sphincterotomy and stone extraction once a stone is confirmed.', 2),
('50000000-0000-0000-0000-000000000016', 'Cholecystectomy is still required afterwards to prevent further gallstone-related complications, but duct clearance takes priority when there is active obstruction.', 3),

('50000000-0000-0000-0000-000000000017', 'Fitz-Hugh-Curtis syndrome results from ascending spread of infection (chlamydia or gonorrhoea) from the pelvis to the liver capsule, producing violin-string adhesions seen at laparoscopy.', 1),
('50000000-0000-0000-0000-000000000017', 'Right upper quadrant pain from perihepatitis can mimic cholecystitis or biliary colic, but the coexisting pelvic findings point to a gynaecological source.', 2),
('50000000-0000-0000-0000-000000000017', 'Treatment follows standard pelvic inflammatory disease antibiotic regimens, covering both chlamydia and gonorrhoea.', 3),

('50000000-0000-0000-0000-000000000018', 'Primary SBP prophylaxis is indicated when ascitic protein is 15 g/L or less together with a Child-Pugh score of at least 9 and a raised bilirubin, or with renal impairment.', 1),
('50000000-0000-0000-0000-000000000018', 'Secondary prophylaxis is also indicated after any previous episode of SBP, regardless of ascitic protein level.', 2),
('50000000-0000-0000-0000-000000000018', 'Ciprofloxacin or norfloxacin are the standard prophylactic antibiotic choices in this setting.', 3),

('50000000-0000-0000-0000-000000000019', 'Colonic acidification traps ammonia as ammonium, reducing its absorption into the portal circulation.', 1),
('50000000-0000-0000-0000-000000000019', 'The osmotic laxative effect of lactulose reduces colonic transit time, limiting the time available for bacterial ammonia production.', 2),
('50000000-0000-0000-0000-000000000019', 'Rifaximin, a poorly absorbed antibiotic that reduces ammonia-producing gut flora, is used as an adjunct for recurrent encephalopathy.', 3),

('50000000-0000-0000-0000-000000000020', 'Constipation increases the time available for colonic bacteria to generate ammonia from nitrogenous waste, precipitating encephalopathy.', 1),
('50000000-0000-0000-0000-000000000020', 'Common precipitants of hepatic encephalopathy include GI bleeding, infection, constipation, electrolyte disturbance and sedative drugs; a search for the specific precipitant guides targeted treatment alongside lactulose.', 2),

('50000000-0000-0000-0000-000000000021', 'Squamous cell carcinoma is associated with alcohol, smoking and achalasia, typically affecting the upper/middle oesophagus.', 1),
('50000000-0000-0000-0000-000000000021', 'Adenocarcinoma arises from Barrett metaplasia secondary to chronic GORD, typically affecting the lower oesophagus, and is now the more common oesophageal cancer type in the UK.', 2),

('50000000-0000-0000-0000-000000000022', 'Broad-spectrum antibiotics (particularly clindamycin, cephalosporins, co-amoxiclav and fluoroquinolones) disrupt protective gut flora, the single strongest risk factor for C. difficile infection.', 1),
('50000000-0000-0000-0000-000000000022', 'Long-term proton pump inhibitor therapy reduces gastric acid, removing a natural barrier to ingested C. difficile spores and independently increasing infection risk.', 2),
('50000000-0000-0000-0000-000000000022', 'Advanced age and institutional care settings (such as nursing homes or hospitals) further increase exposure and susceptibility.', 3),

('50000000-0000-0000-0000-000000000023', 'Severe C. difficile infection is defined by a WCC above 15x10^9/L, an acute rise in creatinine (more than 50% above baseline), a temperature above 38.5C, or clinical/radiological evidence of severe colitis.', 1),
('50000000-0000-0000-0000-000000000023', 'Oral vancomycin is recommended as first-line treatment across severity bands under current guidance, with fidaxomicin reserved for recurrence.', 2),
('50000000-0000-0000-0000-000000000023', 'Life-threatening features (hypotension, ileus, toxic megacolon) mandate consideration of surgical review in addition to medical therapy.', 3),

('50000000-0000-0000-0000-000000000024', 'Oral vancomycin, acting locally within the gut lumen, is first-line for C. difficile infection under current UK guidance, having replaced metronidazole in this role.', 1),
('50000000-0000-0000-0000-000000000024', 'Intravenous vancomycin is ineffective for C. difficile colitis because it does not reach sufficient concentrations in the bowel lumen.', 2),
('50000000-0000-0000-0000-000000000024', 'Fidaxomicin is reserved as an alternative or for recurrence, and FMT for multiple recurrences.', 3),

('50000000-0000-0000-0000-000000000025', 'A recurrence within 12 weeks of a previous episode is treated with fidaxomicin in preference to repeating vancomycin.', 1),
('50000000-0000-0000-0000-000000000025', 'Faecal microbiota transplantation is reserved for patients with multiple recurrent episodes despite appropriate antibiotic therapy.', 2),

('50000000-0000-0000-0000-000000000026', 'The Glasgow-Blatchford score is calculated at first presentation, before endoscopy, using clinical and laboratory parameters.', 1),
('50000000-0000-0000-0000-000000000026', 'A Glasgow-Blatchford score of 0 identifies very low-risk patients who may be considered for early discharge and outpatient management.', 2),

('50000000-0000-0000-0000-000000000027', 'The full Rockall score is calculated after endoscopy and incorporates endoscopic stigmata of recent haemorrhage, unlike the pre-endoscopy Glasgow-Blatchford score.', 1),
('50000000-0000-0000-0000-000000000027', 'Endoscopic findings such as a visible vessel or active bleeding carry a higher risk of rebleeding than a clean ulcer base.', 2),

('50000000-0000-0000-0000-000000000028', 'High-dose PPI after endoscopic haemostasis reduces rebleeding risk by raising intragastric pH and stabilising clot formation.', 1),
('50000000-0000-0000-0000-000000000028', 'Testing for and eradicating H. pylori, once the acute bleed has settled, reduces the risk of ulcer recurrence.', 2),
('50000000-0000-0000-0000-000000000028', 'PPI is not given routinely before endoscopy in suspected ulcer bleeding, as it may mask endoscopic stigmata without proven outcome benefit.', 3),

('50000000-0000-0000-0000-000000000029', 'Villous atrophy with crypt hyperplasia and intraepithelial lymphocytosis is the classical histological triad of coeliac disease, most marked in the duodenum.', 1),
('50000000-0000-0000-0000-000000000029', 'Biopsy should be performed while the patient remains on a gluten-containing diet, since gluten avoidance before biopsy can normalise the appearances and obscure the diagnosis.', 2),
('50000000-0000-0000-0000-000000000029', 'Complications of untreated coeliac disease include osteoporosis, iron/folate deficiency anaemia, and a small increased risk of enteropathy-associated T-cell lymphoma.', 3),

('50000000-0000-0000-0000-000000000030', 'Skip lesions, transmural inflammation and perianal fistulating disease with rectal sparing are characteristic of Crohn disease.', 1),
('50000000-0000-0000-0000-000000000030', 'Continuous mucosal inflammation beginning at the rectum and extending proximally without skip lesions is characteristic of ulcerative colitis.', 2),
('50000000-0000-0000-0000-000000000030', 'Crohn disease can affect any part of the GI tract from mouth to anus, while ulcerative colitis is confined to the colon and rectum.', 3),

('50000000-0000-0000-0000-000000000031', 'Colonic diameter above 6 cm with systemic toxicity, in the context of severe colitis, defines toxic megacolon.', 1),
('50000000-0000-0000-0000-000000000031', 'Toxic megacolon carries a high risk of colonic perforation and requires close surgical and medical co-management.', 2),
('50000000-0000-0000-0000-000000000031', 'Failure to improve within 24-72 hours of intensive medical therapy, or evidence of perforation, is an indication for emergency colectomy.', 3),

('50000000-0000-0000-0000-000000000032', 'Ursodeoxycholic acid is first-line and improves bile flow, slowing disease progression in most patients with PBC.', 1),
('50000000-0000-0000-0000-000000000032', 'Cholestyramine is used specifically to help control pruritus, a separate symptomatic issue from disease-modifying treatment.', 2),
('50000000-0000-0000-0000-000000000032', 'Liver transplantation is considered for end-stage disease or treatment failure.', 3),

('50000000-0000-0000-0000-000000000033', 'The Glasgow-Imrie score uses eight parameters (PaO2, age, neutrophils/WCC, calcium, renal function, enzymes, albumin, sugar) assessed within 48 hours; three or more positive criteria indicate severe pancreatitis.', 1),
('50000000-0000-0000-0000-000000000033', 'Gallstones and alcohol are the two most common causes of acute pancreatitis in the UK.', 2),
('50000000-0000-0000-0000-000000000033', 'Hypocalcaemia in pancreatitis, one of the adverse criteria here, reflects calcium sequestration by fat saponification in areas of pancreatic fat necrosis.', 3),

('50000000-0000-0000-0000-000000000034', 'Terlipressin should be started empirically as soon as variceal bleeding is suspected, without waiting for endoscopic confirmation.', 1),
('50000000-0000-0000-0000-000000000034', 'Prophylactic antibiotics reduce mortality in cirrhotic patients with upper GI bleeding and should be given regardless of the confirmed source.', 2),
('50000000-0000-0000-0000-000000000034', 'Band ligation is preferred over sclerotherapy because of a lower complication rate, including reduced rates of stricture formation.', 3),

('50000000-0000-0000-0000-000000000035', 'Corticosteroids are first-line for inducing remission in active Crohn disease, with 5-ASA agents playing a lesser role than in ulcerative colitis.', 1),
('50000000-0000-0000-0000-000000000035', 'Azathioprine (or mercaptopurine) is used for maintenance, with TPMT activity checked beforehand to reduce the risk of severe myelosuppression.', 2),
('50000000-0000-0000-0000-000000000035', 'Biologic therapy (e.g. infliximab, adalimumab) is reserved for refractory or fistulating disease.', 3),

('50000000-0000-0000-0000-000000000036', 'Hypoalbuminaemia and portal hypertension together drive ascites formation in cirrhosis, through reduced oncotic pressure and raised hydrostatic pressure respectively.', 1),
('50000000-0000-0000-0000-000000000036', 'Low-protein ascitic fluid has reduced opsonic activity, impairing bacterial clearance and predisposing to spontaneous bacterial peritonitis.', 2),
('50000000-0000-0000-0000-000000000036', 'A raised ascitic neutrophil count (>250 cells/microlitre) with systemic features confirms SBP as the cause of new fever and confusion in a cirrhotic patient with ascites.', 3),

('50000000-0000-0000-0000-000000000037', 'Digested blood acts as a protein load in the gut, increasing colonic bacterial ammonia production, in the same way excess dietary protein or constipation does.', 1),
('50000000-0000-0000-0000-000000000037', 'Cirrhotic hepatic dysfunction impairs the urea cycle capacity to clear this ammonia load, allowing it to accumulate systemically.', 2),
('50000000-0000-0000-0000-000000000037', 'Astrocytes convert excess ammonia to glutamine, causing an osmotic effect that contributes to cerebral oedema and the clinical features of hepatic encephalopathy.', 3),

('50000000-0000-0000-0000-000000000038', 'TIPS reduces portal pressure by creating a direct low-resistance channel between the portal and hepatic venous systems, bypassing the liver parenchyma.', 1),
('50000000-0000-0000-0000-000000000038', 'Because ammonia-rich portal blood bypasses hepatic detoxification via this shunt, new or worsening hepatic encephalopathy is a well-recognised complication of TIPS.', 2),
('50000000-0000-0000-0000-000000000038', 'Encephalopathy following TIPS should be actively considered even when the standard precipitants (infection, GI bleed, constipation) are absent, given the procedure itself alters ammonia handling.', 3),

('50000000-0000-0000-0000-000000000039', 'Gastric acid is a natural barrier against ingested pathogens, including C. difficile spores; long-term PPI use weakens this defence.', 1),
('50000000-0000-0000-0000-000000000039', 'Broad-spectrum antibiotics disrupt the normal colonic flora that would otherwise resist C. difficile colonisation, acting additively with acid suppression to raise infection risk.', 2),
('50000000-0000-0000-0000-000000000039', 'The combination of two modifiable risk factors (PPI and antibiotic exposure) substantially raises the risk of severe C. difficile colitis compared with either alone.', 3),

('50000000-0000-0000-0000-000000000040', 'Hypocalcaemia in acute pancreatitis results from fat saponification, where lipase-released free fatty acids bind calcium in areas of peripancreatic fat necrosis.', 1),
('50000000-0000-0000-0000-000000000040', 'Hypocalcaemia is one of the adverse Glasgow-Imrie criteria and is associated with a worse prognosis in acute pancreatitis.', 2),
('50000000-0000-0000-0000-000000000040', 'Trousseau sign (carpal spasm on cuff inflation) and Chvostek sign (facial twitching on tapping the facial nerve) are clinical signs of neuromuscular irritability from hypocalcaemia.', 3),

('50000000-0000-0000-0000-000000000041', 'Chronic iron deposition in haemochromatosis causes progressive hepatocyte injury, fibrosis and ultimately cirrhosis if diagnosis and venesection are delayed.', 1),
('50000000-0000-0000-0000-000000000041', 'Once cirrhosis has developed, from any underlying cause, six-monthly HCC surveillance (ultrasound with or without AFP) is indicated and continues even once iron overload itself is controlled by venesection.', 2),
('50000000-0000-0000-0000-000000000041', 'Early diagnosis and venesection before cirrhosis develops can prevent this increased hepatocellular carcinoma risk altogether, unlike in this patient diagnosed after cirrhosis was already established.', 3),

('50000000-0000-0000-0000-000000000042', 'The terminal ileum is the specific site of absorption of the vitamin B12-intrinsic factor complex; its loss causes macrocytic anaemia and neurological features of B12 deficiency.', 1),
('50000000-0000-0000-0000-000000000042', 'The terminal ileum also reabsorbs bile acids as part of the enterohepatic circulation; when this fails, bile acids pass into the colon and stimulate secretory diarrhoea.', 2),
('50000000-0000-0000-0000-000000000042', 'A single anatomical site of disease or resection can therefore produce two apparently unrelated clinical problems (anaemia and diarrhoea) through two distinct absorptive mechanisms.', 3),

('50000000-0000-0000-0000-000000000043', 'A single defect in biliary copper excretion (ATP7B mutation) explains simultaneous hepatic, basal ganglia and corneal copper deposition in Wilson disease.', 1),
('50000000-0000-0000-0000-000000000043', 'Kayser-Fleischer rings, best seen on slit-lamp examination, reflect copper deposition in the cornea and strongly support the diagnosis when combined with low caeruloplasmin.', 2),
('50000000-0000-0000-0000-000000000043', 'Penicillamine chelates copper and promotes its urinary excretion; trientine is used as an alternative if penicillamine is not tolerated.', 3),

('50000000-0000-0000-0000-000000000044', 'Only a small fraction of paracetamol is normally metabolised via CYP2E1 to NAPQI, which is rapidly detoxified by conjugation with glutathione under normal circumstances.', 1),
('50000000-0000-0000-0000-000000000044', 'In overdose, safe conjugation pathways (glucuronidation/sulfation) are saturated, diverting more paracetamol to NAPQI production and depleting glutathione stores, allowing NAPQI to cause centrilobular hepatocyte necrosis.', 2),
('50000000-0000-0000-0000-000000000044', 'N-acetylcysteine replenishes glutathione and is most effective when given early, ideally within 8-10 hours of ingestion, though it is still given later in significant overdose.', 3),

('50000000-0000-0000-0000-000000000045', 'Myeloproliferative disorders (e.g. polycythaemia vera with JAK2 mutation) are a recognised hypercoagulable cause of hepatic vein thrombosis in Budd-Chiari syndrome.', 1),
('50000000-0000-0000-0000-000000000045', 'Hepatic venous outflow obstruction raises sinusoidal pressure directly, producing high-protein (exudative) ascites, unlike the typically low-protein ascites of cirrhotic portal hypertension.', 2),
('50000000-0000-0000-0000-000000000045', 'Doppler ultrasound demonstrating absent or reversed hepatic vein flow is a key non-invasive diagnostic step.', 3),

('50000000-0000-0000-0000-000000000046', 'Courvoisier law: a palpable, non-tender gallbladder with jaundice suggests a malignant cause of biliary obstruction rather than gallstones.', 1),
('50000000-0000-0000-0000-000000000046', 'Obstruction prevents conjugated bilirubin and bile salts reaching the gut, explaining pale stools (loss of stercobilin) and pruritus (retained bile salts), while excess conjugated bilirubin is excreted renally, explaining dark urine.', 2),
('50000000-0000-0000-0000-000000000046', 'CA19-9 and cross-sectional imaging (CT/EUS) are used for staging, with ERCP or EUS-guided biliary stenting offering palliative decompression when the tumour is unresectable.', 3),

('50000000-0000-0000-0000-000000000047', 'Most patients with primary sclerosing cholangitis have coexisting inflammatory bowel disease, most commonly ulcerative colitis.', 1),
('50000000-0000-0000-0000-000000000047', 'Chronic biliary inflammation and stricturing in PSC substantially increase the lifetime risk of cholangiocarcinoma, distinct from the risk seen in simple gallstone disease.', 2),
('50000000-0000-0000-0000-000000000047', 'A beaded appearance of multifocal biliary strictures and dilatations on MRCP is characteristic of PSC, distinguishing it from the AMA-associated, non-stricturing pattern of primary biliary cholangitis.', 3),

('50000000-0000-0000-0000-000000000048', 'Insulin resistance drives excess free fatty acid delivery to the liver, causing simple hepatic steatosis, the earliest stage of NAFLD.', 1),
('50000000-0000-0000-0000-000000000048', 'A subset of patients progress from simple steatosis to NASH (steatohepatitis), and then to progressive fibrosis and cirrhosis, though most with simple steatosis do not progress.', 2),
('50000000-0000-0000-0000-000000000048', 'Non-invasive fibrosis tests (enhanced liver fibrosis test, FIB-4, transient elastography) are used to identify patients with significant fibrosis who require hepatology referral, avoiding the need for liver biopsy in most patients.', 3),

('50000000-0000-0000-0000-000000000049', 'Chronic alcohol use causes adaptive downregulation of GABA-A receptors and upregulation of NMDA receptors, unmasked as CNS hyperexcitability on abrupt withdrawal.', 1),
('50000000-0000-0000-0000-000000000049', 'Symptoms typically progress from tremor and anxiety (6-12 hours), through seizures (around 36 hours), to delirium tremens (48-72 hours) if untreated.', 2),
('50000000-0000-0000-0000-000000000049', 'Benzodiazepines (e.g. a reducing chlordiazepoxide regimen) are first-line treatment, with IV thiamine given to prevent Wernicke encephalopathy in at-risk patients.', 3),

('50000000-0000-0000-0000-000000000050', 'Splanchnic arterial vasodilation from portal hypertension reduces effective circulating volume, triggering compensatory renal vasoconstriction via RAAS and sympathetic activation.', 1),
('50000000-0000-0000-0000-000000000050', 'Hepatorenal syndrome is a diagnosis of exclusion, requiring exclusion of sepsis, nephrotoxic drugs, obstruction, and hypovolaemia unresponsive to albumin challenge.', 2),
('50000000-0000-0000-0000-000000000050', 'The kidneys are structurally normal in hepatorenal syndrome (a functional failure), which is why renal function can recover fully after successful liver transplantation.', 3);
