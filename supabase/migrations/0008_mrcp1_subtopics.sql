-- Break MRCP1 topics from one flat topic per specialty into proper sub-topics,
-- matching the granularity UKMLA already has (e.g. Cardiology -> Acute coronary
-- syndromes, Arrhythmias, Heart failure & cardiomyopathy, ...). Existing questions
-- and Learn chapters are re-tagged onto the new sub-topics, then the old flat
-- per-specialty topic rows are removed.
--
-- This migration is idempotent-unsafe by design (hardcoded IDs from the live DB
-- at time of writing) and documents a change already applied directly via the
-- Supabase REST API. Re-running against a fresh/reset database: run the INSERTs,
-- then the UPDATEs will only match if the same seed IDs are present.

-- 1. New sub-topics
insert into topics (id, exam, specialty, name, slug) values
  ('fe3bd107-a3ed-4de0-8195-ab4e992bd58a', 'mrcp1', 'Cardiology', 'Acute coronary syndromes', 'acute-coronary-syndromes'),
  ('8a2a3a95-236d-4c60-accf-058096c37ab6', 'mrcp1', 'Cardiology', 'Arrhythmias', 'arrhythmias'),
  ('7a1e5a14-e1d6-498b-a23f-85f12f43db37', 'mrcp1', 'Cardiology', 'Heart failure & cardiomyopathy', 'heart-failure-and-cardiomyopathy'),
  ('c7059b76-0861-4468-93e5-d75f85676ea6', 'mrcp1', 'Cardiology', 'Valvular & structural heart disease', 'valvular-and-structural-heart-disease'),
  ('4a5e6a7a-c37f-43e1-8407-d5a894206bf0', 'mrcp1', 'Cardiology', 'Pericardial disease', 'pericardial-disease'),
  ('e43bb69b-565c-4975-bc64-6838180523fb', 'mrcp1', 'Cardiology', 'Infective endocarditis', 'infective-inflammatory-heart-disease'),
  ('35569b11-2a68-457a-86cd-5f75bf9751b6', 'mrcp1', 'Cardiology', 'Hypertension', 'hypertension'),
  ('97402963-cf84-4e9e-92f0-ce5cfcc5be43', 'mrcp1', 'Cardiology', 'Vascular & cardiac emergencies', 'vascular-and-cardiac-emergencies'),
  ('77fe7728-0d96-497b-af3a-bfc3f22f6ff6', 'mrcp1', 'Clinical Pharmacology and Therapeutics', 'Poisoning & overdose', 'poisoning-overdose'),
  ('b11d4afc-ef6c-4aca-a9b3-7949ec2e91e0', 'mrcp1', 'Clinical Pharmacology and Therapeutics', 'Anticoagulation & antiplatelet therapy', 'anticoagulation-antiplatelet-therapy'),
  ('6ab3f630-5969-44b0-a039-6c8e6576691f', 'mrcp1', 'Clinical Pharmacology and Therapeutics', 'Prescribing in renal & hepatic impairment', 'prescribing-renal-hepatic-impairment'),
  ('ea8f8012-65c3-4232-840e-af35563fbfbd', 'mrcp1', 'Clinical Pharmacology and Therapeutics', 'Pharmacokinetics', 'pharmacokinetics'),
  ('db7bd4dd-1591-4ea3-a912-2932c5e1e997', 'mrcp1', 'Clinical Pharmacology and Therapeutics', 'Adverse drug reactions', 'adverse-drug-reactions'),
  ('9f5024b3-ac2d-492e-a09e-1bb5b9078253', 'mrcp1', 'Clinical Pharmacology and Therapeutics', 'Drug interactions', 'drug-interactions'),
  ('5a21f126-80a3-4238-a806-897a42723100', 'mrcp1', 'Dermatology', 'Skin cancer', 'skin-cancer'),
  ('ce6a2228-9d18-4b60-ba97-5c1b6509a176', 'mrcp1', 'Dermatology', 'Eczema & urticaria', 'eczema-urticaria'),
  ('f1795316-0e2d-4cf0-99fe-e66d862b47a3', 'mrcp1', 'Dermatology', 'Psoriasis & papulosquamous disease', 'psoriasis-and-papulosquamous-disease'),
  ('001849f0-da1b-413a-853d-864baae4845c', 'mrcp1', 'Dermatology', 'Blistering & autoimmune skin disease', 'blistering-autoimmune-skin-disease'),
  ('59b47534-de35-4fc6-b9b4-6d22c7f21826', 'mrcp1', 'Dermatology', 'Infections & infestations', 'infections-and-infestations'),
  ('61151bfb-de90-4415-a331-b3f8ac74789c', 'mrcp1', 'Dermatology', 'Follicular & sebaceous disorders', 'follicular-and-sebaceous-disorders'),
  ('4d24063c-8e7b-4449-89d0-93a09b4f90fc', 'mrcp1', 'Dermatology', 'Systemic disease & the skin', 'systemic-disease-and-the-skin'),
  ('d68f9f33-1ba3-4784-94d5-fd046beebe2d', 'mrcp1', 'Dermatology', 'Hair, nail & sweat gland disorders', 'hair-nail-and-sweat-gland-disorders'),
  ('fc317108-43e9-4f96-9bda-b48241b99fa6', 'mrcp1', 'Dermatology', 'Drug eruptions & skin emergencies', 'drug-eruptions-and-skin-emergencies'),
  ('76c491aa-90dc-4e4c-a70e-533052a3d73b', 'mrcp1', 'Gastroenterology and Hepatology', 'Inflammatory bowel disease', 'inflammatory-bowel-disease'),
  ('caa73514-bd3e-4778-9c0d-45cab6eb6959', 'mrcp1', 'Gastroenterology and Hepatology', 'Liver disease & cirrhosis', 'liver-disease-and-cirrhosis'),
  ('d5c56644-e9c8-4b3e-a8d8-85d71d7e29fd', 'mrcp1', 'Gastroenterology and Hepatology', 'Pancreatic & biliary disease', 'pancreatic-and-biliary-disease'),
  ('57eaa5e1-d9bb-48e4-b421-bc64de1c2fd7', 'mrcp1', 'Gastroenterology and Hepatology', 'Upper GI disease', 'upper-gi-disease'),
  ('d8199296-ba7c-436a-b512-a42e4e6acb19', 'mrcp1', 'Gastroenterology and Hepatology', 'Malabsorption & nutrition', 'malabsorption-and-nutrition'),
  ('fdba6e34-b529-4efd-9790-c44f06c9b395', 'mrcp1', 'Gastroenterology and Hepatology', 'Infections & GI emergencies', 'infections-and-gi-emergencies'),
  ('0875f9b1-cdee-48ca-9000-b6041d3b5811', 'mrcp1', 'Gastroenterology and Hepatology', 'Functional & motility disorders', 'functional-and-motility-disorders'),
  ('9be4832d-e9ab-4160-a286-11de3df9411c', 'mrcp1', 'Renal medicine', 'Acute kidney injury', 'acute-kidney-injury'),
  ('a306b8da-0680-4ec8-bcdd-304a01b5170a', 'mrcp1', 'Renal medicine', 'Glomerular disease', 'glomerular-disease'),
  ('13e9afbd-3cb7-4a27-b5d4-027a0a806bc2', 'mrcp1', 'Renal medicine', 'Chronic kidney disease & CKD-MBD', 'chronic-kidney-disease-and-ckd-mbd'),
  ('432f9577-fc05-4e0f-9372-172bffe5f1d3', 'mrcp1', 'Renal medicine', 'Electrolyte & water balance disorders', 'electrolyte-and-water-balance-disorders'),
  ('f83b0841-3681-45ad-904a-73db4cda979c', 'mrcp1', 'Renal medicine', 'Renal tubular disease', 'renal-tubular-disease'),
  ('7a7e5a2f-a9de-4276-a469-330a216be759', 'mrcp1', 'Renal medicine', 'Drug-induced kidney disease', 'drug-induced-kidney-disease'),
  ('55c79d4c-2fbb-4ca5-972b-2769198bf4f2', 'mrcp1', 'Renal medicine', 'Genetic & cystic kidney disease', 'genetic-and-cystic-kidney-disease'),
  ('3d967ce4-40ed-4d5c-8803-0e71afa55eab', 'mrcp1', 'Renal medicine', 'Renal transplantation', 'renal-transplantation'),
  ('d062b02e-f4f3-4b4d-b246-2b804b694ef3', 'mrcp1', 'Respiratory medicine', 'Airways disease', 'airways-disease'),
  ('2483a794-e93b-4ff7-a8ce-5dd1037e63cb', 'mrcp1', 'Respiratory medicine', 'Respiratory infection', 'infection'),
  ('e4700d9f-8a59-43e6-aead-0e878641448a', 'mrcp1', 'Respiratory medicine', 'Pulmonary embolism & vascular disease', 'pulmonary-embolism-vascular-disease'),
  ('eb0cb2e7-2143-4d3b-b209-10cf5e486fd8', 'mrcp1', 'Respiratory medicine', 'Interstitial lung disease', 'interstitial-lung-disease'),
  ('ab86e543-ff82-418a-b6ed-ef000cb8f936', 'mrcp1', 'Respiratory medicine', 'Pleural disease', 'pleural-disease'),
  ('abf0c3f8-5d55-4c5b-8439-9adc3533909e', 'mrcp1', 'Respiratory medicine', 'Lung cancer', 'lung-cancer'),
  ('d9d773f2-60f4-48fa-bce9-13fcef31774e', 'mrcp1', 'Respiratory medicine', 'Sleep & ventilatory disorders', 'sleep-and-ventilatory-disorders'),
  ('ff7409bf-effb-49e6-aded-aeae01b0c8bd', 'mrcp1', 'Clinical sciences', 'Genetics', 'genetics'),
  ('5844a2c1-d306-456b-8302-8dbc785f94fd', 'mrcp1', 'Clinical sciences', 'Immunology', 'immunology'),
  ('4bb12ed7-0347-4682-bf1e-c9af2445957e', 'mrcp1', 'Clinical sciences', 'Statistics & epidemiology', 'statistics-and-epidemiology'),
  ('248a522d-b59b-4057-9a88-29ab8a443a5b', 'mrcp1', 'Clinical sciences', 'Clinical biochemistry', 'clinical-biochemistry'),
  ('26fd0b64-3bd6-46f0-b481-0941e90e92ed', 'mrcp1', 'Clinical sciences', 'Clinical physiology', 'clinical-physiology'),
  ('fb615642-574d-47d5-9c8a-f0e9539aaee5', 'mrcp1', 'Endocrinology, diabetes and metabolic medicine', 'Diabetes mellitus', 'diabetes-mellitus'),
  ('5e151d63-1e17-455b-8a43-b3dcacfbb112', 'mrcp1', 'Endocrinology, diabetes and metabolic medicine', 'Diabetic emergencies', 'diabetic-emergencies'),
  ('29cf27fe-c4e5-4222-ac0d-70736a78498e', 'mrcp1', 'Endocrinology, diabetes and metabolic medicine', 'Thyroid disease', 'thyroid-disease'),
  ('e5613ce4-466a-4fa5-9e5b-50165b81e74b', 'mrcp1', 'Endocrinology, diabetes and metabolic medicine', 'Pituitary disease', 'pituitary-disease'),
  ('5f084292-9ac5-4768-af33-e08937a06281', 'mrcp1', 'Endocrinology, diabetes and metabolic medicine', 'Adrenal disease', 'adrenal-disease'),
  ('5aa99010-1762-4ce0-b89c-fe70c015e56a', 'mrcp1', 'Endocrinology, diabetes and metabolic medicine', 'Calcium & metabolic bone disease', 'calcium-and-metabolic-bone-disease'),
  ('920d7743-c58f-4542-868a-62c3d08a33f5', 'mrcp1', 'Endocrinology, diabetes and metabolic medicine', 'Lipid disorders', 'lipid-disorders'),
  ('66dbeeb3-f3ab-4d0c-98f6-e5d8e53224f6', 'mrcp1', 'Geriatric medicine', 'Falls & frailty', 'falls-and-frailty'),
  ('17706bdb-ada8-4431-9ac9-72b604ce38f2', 'mrcp1', 'Geriatric medicine', 'Delirium & dementia', 'delirium-and-dementia'),
  ('2406840c-0629-413c-914b-ddbbcd538ba9', 'mrcp1', 'Geriatric medicine', 'Polypharmacy', 'polypharmacy'),
  ('132f4006-7fcf-40b8-98fd-a4ab8035979b', 'mrcp1', 'Geriatric medicine', 'Osteoporosis', 'osteoporosis'),
  ('67fc4091-2701-4d21-a5cb-58f859844954', 'mrcp1', 'Geriatric medicine', 'Continence & functional decline', 'continence-and-functional-decline'),
  ('8804e531-a0b3-4614-9881-6656f0622d76', 'mrcp1', 'Haematology', 'Anaemia', 'anaemia'),
  ('ad81b6fc-930b-4708-8df7-a66baf84b432', 'mrcp1', 'Haematology', 'Leukaemia & lymphoma', 'leukaemia-and-lymphoma'),
  ('ed0ad9a4-0b1a-4d76-b883-aae9ed879ca1', 'mrcp1', 'Haematology', 'Bleeding & coagulation disorders', 'bleeding-and-coagulation-disorders'),
  ('2a5ca191-f6f6-40ff-9195-e82ffd9971bd', 'mrcp1', 'Haematology', 'Myeloproliferative disorders', 'myeloproliferative-disorders'),
  ('ef983b3d-88fa-4f33-9591-a17217e1dd85', 'mrcp1', 'Haematology', 'Transfusion medicine', 'transfusion-medicine'),
  ('dfd19686-0722-4055-bf6a-4ed7a82f25c2', 'mrcp1', 'Infectious diseases', 'Sepsis & bacteraemia', 'sepsis-and-bacteraemia'),
  ('63c6f6c6-9141-4b5e-9c19-956d9615fc42', 'mrcp1', 'Infectious diseases', 'HIV & opportunistic infection', 'hiv-and-opportunistic-infection'),
  ('f94813b6-8152-4f58-9f33-c7ee3dbf629d', 'mrcp1', 'Infectious diseases', 'Travel & tropical medicine', 'travel-and-tropical-medicine'),
  ('65eb87b3-ebf6-4a6b-a31b-c6465882ec18', 'mrcp1', 'Infectious diseases', 'Healthcare-associated infection', 'healthcare-associated-infection'),
  ('33fc24cd-e214-4911-8261-07a40175007f', 'mrcp1', 'Infectious diseases', 'Antimicrobial therapy', 'antimicrobial-therapy'),
  ('d850e569-b182-4bde-93f5-5e5c4f0fd1c3', 'mrcp1', 'Medical ophthalmology', 'Diabetic eye disease', 'diabetic-eye-disease'),
  ('1ca97b74-49ab-42ec-8192-91e25b9874cf', 'mrcp1', 'Medical ophthalmology', 'Vascular & neuro-ophthalmology', 'vascular-and-neuro-ophthalmology'),
  ('f00445be-f408-4490-9ceb-0e65bfbe2eb3', 'mrcp1', 'Medical ophthalmology', 'Uveitis & inflammatory eye disease', 'uveitis-and-inflammatory-eye-disease'),
  ('947f2f83-2109-4210-8d32-eb0a66c3b4c9', 'mrcp1', 'Medical ophthalmology', 'Acute visual loss', 'acute-visual-loss'),
  ('5ee1985d-25fc-4878-ad2a-b9268266ef7b', 'mrcp1', 'Neurology', 'Stroke & cerebrovascular disease', 'stroke-and-cerebrovascular-disease'),
  ('0d112933-521a-43ee-ae77-e56fd2ffd5ce', 'mrcp1', 'Neurology', 'Epilepsy & seizures', 'epilepsy-and-seizures'),
  ('a2aaf25d-3fa1-4f14-9276-8baa43ecd991', 'mrcp1', 'Neurology', 'Headache', 'headache'),
  ('5665f31f-1ab5-4ed2-8cf3-52ae1c60a0ea', 'mrcp1', 'Neurology', 'Neuromuscular & peripheral nerve disease', 'neuromuscular-and-peripheral-nerve-disease'),
  ('90e6edd6-b344-4c59-b79d-107ed930be9d', 'mrcp1', 'Neurology', 'Movement disorders', 'movement-disorders'),
  ('e61fe531-fc4d-4faf-9a00-bfd0e3257287', 'mrcp1', 'Neurology', 'CNS infection', 'cns-infection'),
  ('b3752cac-b2dc-4062-91f8-add9258dbb3c', 'mrcp1', 'Neurology', 'Multiple sclerosis & demyelination', 'multiple-sclerosis-and-demyelination'),
  ('8263d166-b8f1-41d2-abb0-085b8b1ed5a6', 'mrcp1', 'Oncology', 'Oncological emergencies', 'oncological-emergencies'),
  ('fe8ae781-fd2a-43d8-97e7-7417ce90cf62', 'mrcp1', 'Oncology', 'Tumour markers & screening', 'tumour-markers-and-screening'),
  ('a7aba884-5ed9-4898-a609-9f4dac0aa633', 'mrcp1', 'Oncology', 'Chemotherapy toxicity', 'chemotherapy-toxicity'),
  ('fd7fda58-6fc3-4391-8342-0a76b18c599c', 'mrcp1', 'Oncology', 'Paraneoplastic syndromes', 'paraneoplastic-syndromes'),
  ('0e353931-7fcd-45ab-ab0f-3ad235bddc57', 'mrcp1', 'Palliative medicine and end of life care', 'Pain management', 'pain-management'),
  ('175c990b-a2d9-426b-a084-c6a3907b9e78', 'mrcp1', 'Palliative medicine and end of life care', 'Symptom control', 'symptom-control'),
  ('ecf5a6df-245b-45a2-a8e1-3faee3c2fec3', 'mrcp1', 'Palliative medicine and end of life care', 'End of life decision-making', 'end-of-life-decision-making'),
  ('4425b793-f4d1-46c7-b189-3a73543a179e', 'mrcp1', 'Palliative medicine and end of life care', 'Opioid conversion & syringe drivers', 'opioid-conversion-and-syringe-drivers'),
  ('c54ada26-f1f1-48ab-a7a3-86325e8f2b78', 'mrcp1', 'Psychiatry', 'Mood disorders', 'mood-disorders'),
  ('fae57da5-b044-48da-8990-1fd082f7cf9a', 'mrcp1', 'Psychiatry', 'Psychosis', 'psychosis'),
  ('56079685-2688-460d-981c-b39cdd88d6db', 'mrcp1', 'Psychiatry', 'Substance misuse', 'substance-misuse'),
  ('1136ddb3-0a79-402c-bba6-94ebd06bbb4b', 'mrcp1', 'Psychiatry', 'Capacity & the Mental Health Act', 'capacity-and-mental-health-act'),
  ('1988bf84-d213-4daa-9b9e-6b46aa8724ec', 'mrcp1', 'Psychiatry', 'Anxiety & somatic disorders', 'anxiety-and-somatic-disorders'),
  ('a41601f9-ee4b-4ae5-a5cb-e736b267cd7d', 'mrcp1', 'Rheumatology', 'Inflammatory arthritis', 'inflammatory-arthritis'),
  ('d0a71836-a657-4bae-8959-04bfad16ba14', 'mrcp1', 'Rheumatology', 'Connective tissue disease', 'connective-tissue-disease'),
  ('d7fccd66-137a-4f7e-aa83-c78f55dba46e', 'mrcp1', 'Rheumatology', 'Vasculitis', 'vasculitis'),
  ('fdf869a3-e415-4096-bcb9-7644c7de66ad', 'mrcp1', 'Rheumatology', 'Crystal arthropathy', 'crystal-arthropathy'),
  ('565f3186-7337-4ad2-82ab-ffbdbeaff9e3', 'mrcp1', 'Rheumatology', 'Seronegative spondyloarthropathies', 'seronegative-spondyloarthropathies');

-- 2. Re-tag existing questions onto the new sub-topics
update questions set topic_id = 'fe3bd107-a3ed-4de0-8195-ab4e992bd58a' where id in (
  'b0000000-0000-0000-0000-000000000001',
  '20000000-0000-0000-0000-000000000002',
  '20000000-0000-0000-0000-000000000001',
  '20000000-0000-0000-0000-000000000003',
  '20000000-0000-0000-0000-000000000004',
  '20000000-0000-0000-0000-000000000008',
  '20000000-0000-0000-0000-000000000028',
  '20000000-0000-0000-0000-000000000031',
  '20000000-0000-0000-0000-000000000032',
  '20000000-0000-0000-0000-000000000033',
  '20000000-0000-0000-0000-000000000049'
);
update questions set topic_id = '9be4832d-e9ab-4160-a286-11de3df9411c' where id in (
  '60000000-0000-0000-0000-000000000001',
  '60000000-0000-0000-0000-000000000016',
  '60000000-0000-0000-0000-000000000017',
  '60000000-0000-0000-0000-000000000018',
  '60000000-0000-0000-0000-000000000019',
  '60000000-0000-0000-0000-000000000020',
  '60000000-0000-0000-0000-000000000021',
  '60000000-0000-0000-0000-000000000022',
  '60000000-0000-0000-0000-000000000030',
  '60000000-0000-0000-0000-000000000036',
  '60000000-0000-0000-0000-000000000037',
  '60000000-0000-0000-0000-000000000040',
  '60000000-0000-0000-0000-000000000042',
  '60000000-0000-0000-0000-000000000043',
  '60000000-0000-0000-0000-000000000049'
);
update questions set topic_id = 'db7bd4dd-1591-4ea3-a912-2932c5e1e997' where id in (
  'c0000000-0000-0000-0000-000000000006',
  'c0000000-0000-0000-0000-000000000009'
);
update questions set topic_id = 'd062b02e-f4f3-4b4d-b246-2b804b694ef3' where id in (
  'd0000000-0000-0000-0000-000000000001',
  'd0000000-0000-0000-0000-000000000002',
  'd0000000-0000-0000-0000-000000000010'
);
update questions set topic_id = 'b11d4afc-ef6c-4aca-a9b3-7949ec2e91e0' where id in (
  'c0000000-0000-0000-0000-000000000002',
  'c0000000-0000-0000-0000-000000000014'
);
update questions set topic_id = '8a2a3a95-236d-4c60-accf-058096c37ab6' where id in (
  'b0000000-0000-0000-0000-000000000002',
  'b0000000-0000-0000-0000-000000000008',
  'b0000000-0000-0000-0000-000000000009',
  'b0000000-0000-0000-0000-000000000010',
  'b0000000-0000-0000-0000-000000000012',
  '20000000-0000-0000-0000-000000000016',
  '20000000-0000-0000-0000-000000000017',
  '20000000-0000-0000-0000-000000000018',
  '20000000-0000-0000-0000-000000000019',
  '20000000-0000-0000-0000-000000000022',
  '20000000-0000-0000-0000-000000000037',
  '20000000-0000-0000-0000-000000000041',
  '20000000-0000-0000-0000-000000000047',
  '20000000-0000-0000-0000-000000000048'
);
update questions set topic_id = '001849f0-da1b-413a-853d-864baae4845c' where id in (
  '40000000-0000-0000-0000-000000000018',
  '40000000-0000-0000-0000-000000000019',
  '40000000-0000-0000-0000-000000000025',
  '40000000-0000-0000-0000-000000000026',
  '40000000-0000-0000-0000-000000000027'
);
update questions set topic_id = '13e9afbd-3cb7-4a27-b5d4-027a0a806bc2' where id in (
  '60000000-0000-0000-0000-000000000005',
  '60000000-0000-0000-0000-000000000010',
  '60000000-0000-0000-0000-000000000024',
  '60000000-0000-0000-0000-000000000025',
  '60000000-0000-0000-0000-000000000031',
  '60000000-0000-0000-0000-000000000032',
  '60000000-0000-0000-0000-000000000035',
  '60000000-0000-0000-0000-000000000039'
);
update questions set topic_id = 'fc317108-43e9-4f96-9bda-b48241b99fa6' where id in (
  '40000000-0000-0000-0000-000000000020',
  '40000000-0000-0000-0000-000000000021',
  '40000000-0000-0000-0000-000000000036',
  '40000000-0000-0000-0000-000000000039',
  '40000000-0000-0000-0000-000000000050'
);
update questions set topic_id = '7a7e5a2f-a9de-4276-a469-330a216be759' where id in (
  '60000000-0000-0000-0000-000000000023',
  '60000000-0000-0000-0000-000000000033'
);
update questions set topic_id = '9f5024b3-ac2d-492e-a09e-1bb5b9078253' where id in (
  'c0000000-0000-0000-0000-000000000015'
);
update questions set topic_id = 'ce6a2228-9d18-4b60-ba97-5c1b6509a176' where id in (
  '40000000-0000-0000-0000-000000000006',
  '40000000-0000-0000-0000-000000000007',
  '40000000-0000-0000-0000-000000000008',
  '40000000-0000-0000-0000-000000000009'
);
update questions set topic_id = '432f9577-fc05-4e0f-9372-172bffe5f1d3' where id in (
  '60000000-0000-0000-0000-000000000013',
  '60000000-0000-0000-0000-000000000014',
  '60000000-0000-0000-0000-000000000015',
  '60000000-0000-0000-0000-000000000038',
  '60000000-0000-0000-0000-000000000046',
  '60000000-0000-0000-0000-000000000047'
);
update questions set topic_id = '61151bfb-de90-4415-a331-b3f8ac74789c' where id in (
  '40000000-0000-0000-0000-000000000004',
  '40000000-0000-0000-0000-000000000034',
  '40000000-0000-0000-0000-000000000035'
);
update questions set topic_id = '0875f9b1-cdee-48ca-9000-b6041d3b5811' where id in (
  '50000000-0000-0000-0000-000000000012',
  '50000000-0000-0000-0000-000000000015'
);
update questions set topic_id = '55c79d4c-2fbb-4ca5-972b-2769198bf4f2' where id in (
  '60000000-0000-0000-0000-000000000009'
);
update questions set topic_id = 'a306b8da-0680-4ec8-bcdd-304a01b5170a' where id in (
  '60000000-0000-0000-0000-000000000002',
  '60000000-0000-0000-0000-000000000003',
  '60000000-0000-0000-0000-000000000004',
  '60000000-0000-0000-0000-000000000006',
  '60000000-0000-0000-0000-000000000007',
  '60000000-0000-0000-0000-000000000008',
  '60000000-0000-0000-0000-000000000012',
  '60000000-0000-0000-0000-000000000027',
  '60000000-0000-0000-0000-000000000028',
  '60000000-0000-0000-0000-000000000029',
  '60000000-0000-0000-0000-000000000034',
  '60000000-0000-0000-0000-000000000041',
  '60000000-0000-0000-0000-000000000044',
  '60000000-0000-0000-0000-000000000045',
  '60000000-0000-0000-0000-000000000048'
);
update questions set topic_id = 'd68f9f33-1ba3-4784-94d5-fd046beebe2d' where id in (
  '40000000-0000-0000-0000-000000000047',
  '40000000-0000-0000-0000-000000000048'
);
update questions set topic_id = '7a1e5a14-e1d6-498b-a23f-85f12f43db37' where id in (
  'b0000000-0000-0000-0000-000000000003',
  '20000000-0000-0000-0000-000000000009',
  '20000000-0000-0000-0000-000000000010',
  '20000000-0000-0000-0000-000000000011',
  '20000000-0000-0000-0000-000000000012',
  '20000000-0000-0000-0000-000000000013',
  '20000000-0000-0000-0000-000000000014',
  '20000000-0000-0000-0000-000000000029',
  '20000000-0000-0000-0000-000000000030',
  '20000000-0000-0000-0000-000000000046'
);
update questions set topic_id = '35569b11-2a68-457a-86cd-5f75bf9751b6' where id in (
  '20000000-0000-0000-0000-000000000005',
  '20000000-0000-0000-0000-000000000006',
  '20000000-0000-0000-0000-000000000007',
  '20000000-0000-0000-0000-000000000015'
);
update questions set topic_id = '2483a794-e93b-4ff7-a8ce-5dd1037e63cb' where id in (
  'd0000000-0000-0000-0000-000000000003',
  'd0000000-0000-0000-0000-000000000004'
);
update questions set topic_id = 'fdba6e34-b529-4efd-9790-c44f06c9b395' where id in (
  '50000000-0000-0000-0000-000000000002',
  '50000000-0000-0000-0000-000000000023',
  '50000000-0000-0000-0000-000000000024',
  '50000000-0000-0000-0000-000000000025'
);
update questions set topic_id = '59b47534-de35-4fc6-b9b4-6d22c7f21826' where id in (
  '40000000-0000-0000-0000-000000000005',
  '40000000-0000-0000-0000-000000000010',
  '40000000-0000-0000-0000-000000000045',
  '40000000-0000-0000-0000-000000000012',
  '40000000-0000-0000-0000-000000000024',
  '40000000-0000-0000-0000-000000000029',
  '40000000-0000-0000-0000-000000000030',
  '40000000-0000-0000-0000-000000000031',
  '40000000-0000-0000-0000-000000000043',
  '40000000-0000-0000-0000-000000000044',
  '40000000-0000-0000-0000-000000000046'
);
update questions set topic_id = 'e43bb69b-565c-4975-bc64-6838180523fb' where id in (
  'b0000000-0000-0000-0000-000000000006',
  '20000000-0000-0000-0000-000000000042',
  '20000000-0000-0000-0000-000000000050'
);
update questions set topic_id = '76c491aa-90dc-4e4c-a70e-533052a3d73b' where id in (
  '50000000-0000-0000-0000-000000000030',
  '50000000-0000-0000-0000-000000000031',
  '50000000-0000-0000-0000-000000000035',
  '50000000-0000-0000-0000-000000000042',
  '50000000-0000-0000-0000-000000000047'
);
update questions set topic_id = 'eb0cb2e7-2143-4d3b-b209-10cf5e486fd8' where id in (
  'd0000000-0000-0000-0000-000000000008',
  'd0000000-0000-0000-0000-000000000009',
  'd0000000-0000-0000-0000-000000000014'
);
update questions set topic_id = 'caa73514-bd3e-4778-9c0d-45cab6eb6959' where id in (
  '50000000-0000-0000-0000-000000000001',
  '50000000-0000-0000-0000-000000000004',
  '50000000-0000-0000-0000-000000000005',
  '50000000-0000-0000-0000-000000000007',
  '50000000-0000-0000-0000-000000000008',
  '50000000-0000-0000-0000-000000000011',
  '50000000-0000-0000-0000-000000000018',
  '50000000-0000-0000-0000-000000000019',
  '50000000-0000-0000-0000-000000000020',
  '50000000-0000-0000-0000-000000000032',
  '50000000-0000-0000-0000-000000000034',
  '50000000-0000-0000-0000-000000000036',
  '50000000-0000-0000-0000-000000000037',
  '50000000-0000-0000-0000-000000000038',
  '50000000-0000-0000-0000-000000000041',
  '50000000-0000-0000-0000-000000000043',
  '50000000-0000-0000-0000-000000000044',
  '50000000-0000-0000-0000-000000000045',
  '50000000-0000-0000-0000-000000000048',
  '50000000-0000-0000-0000-000000000049',
  '50000000-0000-0000-0000-000000000050'
);
update questions set topic_id = 'abf0c3f8-5d55-4c5b-8439-9adc3533909e' where id in (
  'd0000000-0000-0000-0000-000000000011'
);
update questions set topic_id = 'd8199296-ba7c-436a-b512-a42e4e6acb19' where id in (
  '50000000-0000-0000-0000-000000000003',
  '50000000-0000-0000-0000-000000000013',
  '50000000-0000-0000-0000-000000000029'
);
update questions set topic_id = 'd5c56644-e9c8-4b3e-a8d8-85d71d7e29fd' where id in (
  'a0000000-0000-0000-0000-000000000005',
  '50000000-0000-0000-0000-000000000016',
  '50000000-0000-0000-0000-000000000017',
  '50000000-0000-0000-0000-000000000033',
  '50000000-0000-0000-0000-000000000040',
  '50000000-0000-0000-0000-000000000046'
);
update questions set topic_id = '4a5e6a7a-c37f-43e1-8407-d5a894206bf0' where id in (
  'b0000000-0000-0000-0000-000000000007',
  'b0000000-0000-0000-0000-000000000014',
  '20000000-0000-0000-0000-000000000027'
);
update questions set topic_id = 'ea8f8012-65c3-4232-840e-af35563fbfbd' where id in (
  'c0000000-0000-0000-0000-000000000011'
);
update questions set topic_id = 'ab86e543-ff82-418a-b6ed-ef000cb8f936' where id in (
  'd0000000-0000-0000-0000-000000000006',
  'd0000000-0000-0000-0000-000000000007'
);
update questions set topic_id = '77fe7728-0d96-497b-af3a-bfc3f22f6ff6' where id in (
  'c0000000-0000-0000-0000-000000000001',
  'c0000000-0000-0000-0000-000000000003',
  'c0000000-0000-0000-0000-000000000004',
  'c0000000-0000-0000-0000-000000000007',
  'c0000000-0000-0000-0000-000000000008',
  'c0000000-0000-0000-0000-000000000012'
);
update questions set topic_id = '6ab3f630-5969-44b0-a039-6c8e6576691f' where id in (
  'c0000000-0000-0000-0000-000000000005',
  'c0000000-0000-0000-0000-000000000010',
  'c0000000-0000-0000-0000-000000000013'
);
update questions set topic_id = 'f1795316-0e2d-4cf0-99fe-e66d862b47a3' where id in (
  '40000000-0000-0000-0000-000000000011',
  '40000000-0000-0000-0000-000000000013',
  '40000000-0000-0000-0000-000000000032'
);
update questions set topic_id = 'e4700d9f-8a59-43e6-aead-0e878641448a' where id in (
  'd0000000-0000-0000-0000-000000000005',
  'd0000000-0000-0000-0000-000000000013'
);
update questions set topic_id = '3d967ce4-40ed-4d5c-8803-0e71afa55eab' where id in (
  '60000000-0000-0000-0000-000000000050'
);
update questions set topic_id = 'f83b0841-3681-45ad-904a-73db4cda979c' where id in (
  '60000000-0000-0000-0000-000000000011',
  '60000000-0000-0000-0000-000000000026'
);
update questions set topic_id = '5a21f126-80a3-4238-a806-897a42723100' where id in (
  '40000000-0000-0000-0000-000000000001',
  '40000000-0000-0000-0000-000000000002',
  '40000000-0000-0000-0000-000000000003',
  '40000000-0000-0000-0000-000000000028'
);
update questions set topic_id = 'd9d773f2-60f4-48fa-bce9-13fcef31774e' where id in (
  'd0000000-0000-0000-0000-000000000012'
);
update questions set topic_id = '4d24063c-8e7b-4449-89d0-93a09b4f90fc' where id in (
  '40000000-0000-0000-0000-000000000014',
  '40000000-0000-0000-0000-000000000015',
  '40000000-0000-0000-0000-000000000016',
  '40000000-0000-0000-0000-000000000017',
  '40000000-0000-0000-0000-000000000022',
  '40000000-0000-0000-0000-000000000023',
  '40000000-0000-0000-0000-000000000033',
  '40000000-0000-0000-0000-000000000037',
  '40000000-0000-0000-0000-000000000038',
  '40000000-0000-0000-0000-000000000040',
  '40000000-0000-0000-0000-000000000041',
  '40000000-0000-0000-0000-000000000042',
  '40000000-0000-0000-0000-000000000049'
);
update questions set topic_id = '57eaa5e1-d9bb-48e4-b421-bc64de1c2fd7' where id in (
  '50000000-0000-0000-0000-000000000006',
  '50000000-0000-0000-0000-000000000009',
  '50000000-0000-0000-0000-000000000010',
  '50000000-0000-0000-0000-000000000014',
  '50000000-0000-0000-0000-000000000021',
  '50000000-0000-0000-0000-000000000022',
  '50000000-0000-0000-0000-000000000026',
  '50000000-0000-0000-0000-000000000027',
  '50000000-0000-0000-0000-000000000028',
  '50000000-0000-0000-0000-000000000039'
);
update questions set topic_id = 'c7059b76-0861-4468-93e5-d75f85676ea6' where id in (
  'b0000000-0000-0000-0000-000000000004',
  'b0000000-0000-0000-0000-000000000005',
  'b0000000-0000-0000-0000-000000000013',
  '20000000-0000-0000-0000-000000000023',
  '20000000-0000-0000-0000-000000000024',
  '20000000-0000-0000-0000-000000000025',
  '20000000-0000-0000-0000-000000000026',
  '20000000-0000-0000-0000-000000000040',
  '20000000-0000-0000-0000-000000000043',
  '20000000-0000-0000-0000-000000000045'
);
update questions set topic_id = '97402963-cf84-4e9e-92f0-ce5cfcc5be43' where id in (
  'b0000000-0000-0000-0000-000000000011',
  '20000000-0000-0000-0000-000000000020',
  '20000000-0000-0000-0000-000000000021',
  '20000000-0000-0000-0000-000000000034',
  '20000000-0000-0000-0000-000000000035',
  '20000000-0000-0000-0000-000000000036',
  '20000000-0000-0000-0000-000000000038',
  '20000000-0000-0000-0000-000000000039',
  '20000000-0000-0000-0000-000000000044'
);

-- 3. Re-tag existing Learn chapters onto the new sub-topics
update chapters set topic_id = 'fe3bd107-a3ed-4de0-8195-ab4e992bd58a' where id in (
  '204ec7f9-e2cf-47be-bf07-d6c04d65080e',
  '8739a4b0-fcc7-480b-97c6-3d8c2ce7a8e2'
);
update chapters set topic_id = '8a2a3a95-236d-4c60-accf-058096c37ab6' where id in (
  '567c072a-2f37-415c-8bc4-136fc24febc7'
);
update chapters set topic_id = '7a1e5a14-e1d6-498b-a23f-85f12f43db37' where id in (
  '74e87e00-d8a2-4f06-8604-80e96fa1e7f8',
  'a4fb4c4e-63e7-4154-86b2-3f9c03e3ffb7',
  '57e3be5d-0bee-4c1c-8533-9b610ec6b5f7',
  '60aa3685-54d0-4f38-aa3c-34f613e9e7d5'
);
update chapters set topic_id = '35569b11-2a68-457a-86cd-5f75bf9751b6' where id in (
  '1b527449-d805-4c37-968b-dc865bbec4f9'
);
update chapters set topic_id = 'e43bb69b-565c-4975-bc64-6838180523fb' where id in (
  'f3ee4727-77ad-4af5-9430-803b99c4f126'
);
update chapters set topic_id = '4a5e6a7a-c37f-43e1-8407-d5a894206bf0' where id in (
  'ce834b00-2e38-4759-a524-3ebe0fc04fcc'
);
update chapters set topic_id = 'c7059b76-0861-4468-93e5-d75f85676ea6' where id in (
  '00ca3b62-00d0-4f3a-ae6b-9f44e32c087c',
  '1f03cff3-054a-4164-b4bb-8de7d944ca79',
  '205a02f3-d6c3-414c-be89-c78af204d203'
);
update chapters set topic_id = '97402963-cf84-4e9e-92f0-ce5cfcc5be43' where id in (
  'e30be63f-4f4d-48ec-87a2-5b09ae68014d',
  'cd347a3a-9eaf-4f70-be3e-86b2fc3096f9',
  'db4edadb-344e-42fa-a666-f69ef427a39f'
);

-- 4. Drop the old flat per-specialty topics (now unreferenced)
delete from topics where id in (
  '30000000-0000-0000-0000-000000000001',
  '30000000-0000-0000-0000-000000000006',
  '30000000-0000-0000-0000-000000000017',
  '30000000-0000-0000-0000-000000000007',
  '30000000-0000-0000-0000-000000000003',
  '30000000-0000-0000-0000-000000000005',
  '30000000-0000-0000-0000-000000000008',
  '30000000-0000-0000-0000-000000000009',
  '30000000-0000-0000-0000-000000000010',
  '30000000-0000-0000-0000-000000000012',
  '30000000-0000-0000-0000-000000000004',
  '30000000-0000-0000-0000-000000000011',
  '30000000-0000-0000-0000-000000000013',
  '30000000-0000-0000-0000-000000000014',
  '30000000-0000-0000-0000-000000000015',
  '30000000-0000-0000-0000-000000000002',
  '30000000-0000-0000-0000-000000000016'
);
