-- Insert default users
INSERT IGNORE INTO Users (id, name, email, password, role) VALUES 
(1, 'System Admin', 'admin@medar.com', '$2b$10$w3vA.uD.g3I1/vV9G4QQuuR5sH2Z3U6K4R3j1Z3U6K4R3j1Z3U6K4', 'admin'),
(2, 'V.LALITH KUMAR', 'student@example.com', '$2b$10$w3vA.uD.g3I1/vV9G4QQuuR5sH2Z3U6K4R3j1Z3U6K4R3j1Z3U6K4', 'student'),
(3, 'Dr. Instructor', 'instructor@example.com', '$2b$10$w3vA.uD.g3I1/vV9G4QQuuR5sH2Z3U6K4R3j1Z3U6K4R3j1Z3U6K4', 'instructor');

-- Clear existing data to avoid duplicates during seeding
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Quizzes;
TRUNCATE TABLE Modules;
SET FOREIGN_KEY_CHECKS = 1;

-- --------------------------------------------------------
-- BEGINNER MODULES (IDs 1-5)
-- --------------------------------------------------------
INSERT INTO Modules (id, title, description, difficulty, model_url, video_url, estimated_time, skill_level, created_by) VALUES
(1, 'Heart Anatomy Basics', 'Learn the 4 chambers of the heart, major veins, and arteries. Perfect for first-year anatomy students.', 'beginner', 'https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Heart/glTF-Binary/Heart.glb', 'https://www.youtube.com/embed/CWFyxn0qDEU', 15, 'Year 1 Medical', 1),
(2, 'Brain Lobes Identification', 'Identify the frontal, parietal, occipital, and temporal lobes and understand their primary functions.', 'beginner', 'https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/BrainStem/glTF-Binary/BrainStem.glb', 'https://www.youtube.com/embed/kMKc8nfPATI', 20, 'Year 1 Medical', 1),
(3, 'Human Skeleton Overview', 'A comprehensive look at the major bones of the human body, including the axial and appendicular skeleton.', 'beginner', 'https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/RiggedFigure/glTF-Binary/RiggedFigure.glb', 'https://www.youtube.com/embed/YWgcd0E58vY', 25, 'Pre-Med', 1),
(4, 'Respiratory System Basics', 'Understand the anatomy of the lungs, trachea, and diaphragm. Learn how gas exchange occurs in the alveoli.', 'beginner', 'https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Box/glTF-Binary/Box.glb', 'https://www.youtube.com/embed/bHZsvBdUC2I', 15, 'Year 1 Medical', 1),
(5, 'Digestive System Structure', 'Trace the path of food from the esophagus to the intestines out through the digestive tract.', 'beginner', 'https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Box/glTF-Binary/Box.glb', 'https://www.youtube.com/embed/VwrsL-lCZYo', 20, 'Year 1 Medical', 1);

-- --------------------------------------------------------
-- INTERMEDIATE MODULES (IDs 6-10)
-- --------------------------------------------------------
INSERT INTO Modules (id, title, description, difficulty, model_url, video_url, estimated_time, skill_level, created_by) VALUES
(6, 'Blood Circulation Simulation', 'Interactive flow of oxygenated and deoxygenated blood through the pulmonary and systemic circuits.', 'intermediate', 'https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Heart/glTF-Binary/Heart.glb', 'https://www.youtube.com/embed/RU0wN2Q_Kkw', 30, 'Year 2 Medical', 1),
(7, 'Neural Pathway Mapping', 'Trace motor and sensory pathways from the cerebral cortex down through the spinal cord.', 'intermediate', 'https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/BrainStem/glTF-Binary/BrainStem.glb', 'https://www.youtube.com/embed/qPix_X-9t7E', 35, 'Neurology Resident', 1),
(8, 'Fracture Diagnosis (X-ray)', 'Analyze 3D bone models alongside simulated 2D X-rays to correctly identify hairline and compound fractures.', 'intermediate', 'https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/RiggedFigure/glTF-Binary/RiggedFigure.glb', 'https://www.youtube.com/embed/v=N2aXlC-bZk4', 40, 'Orthopedics Trainee', 1),
(9, 'Lung Function Mechanics', 'Visualize pleural pressure changes and diaphragmatic contraction during ventilation cycles.', 'intermediate', 'https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Box/glTF-Binary/Box.glb', 'https://www.youtube.com/embed/8NUxvJS-_0k', 25, 'Pulmonology Fellow', 1),
(10, 'Liver Function & Blood Filtering', 'Simulate the hepatic portal system and observe how the liver metabolizes toxins.', 'intermediate', 'https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Box/glTF-Binary/Box.glb', 'https://www.youtube.com/embed/wbh3SjzydnQ', 30, 'Year 2 Medical', 1);

-- --------------------------------------------------------
-- ADVANCED MODULES (IDs 11-15)
-- --------------------------------------------------------
INSERT INTO Modules (id, title, description, difficulty, model_url, video_url, estimated_time, skill_level, created_by) VALUES
(11, 'Cardiac Bypass Surgery', 'Perform a simulated CABG procedure. Identify the blockage, harvest the saphenous vein, and bypass the LAD artery.', 'advanced', 'https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Heart/glTF-Binary/Heart.glb', 'https://www.youtube.com/embed/3Q_yZItIf1E', 60, 'Surgical Resident', 1),
(12, 'Brain Tumor Removal', 'Navigate neurosurgical tools to resect a glioblastoma without damaging eloquent cortical tissue.', 'advanced', 'https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/BrainStem/glTF-Binary/BrainStem.glb', 'https://www.youtube.com/embed/6_Q4c2vDk4k', 90, 'Neurosurgery Resident', 1),
(13, 'Knee Replacement Surgery', 'Execute a total knee arthroplasty (TKA). Make the incision, resect the bone, and place the prosthetic implants.', 'advanced', 'https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/RiggedFigure/glTF-Binary/RiggedFigure.glb', 'https://www.youtube.com/embed/406Z3bJ-QzE', 75, 'Orthopedic Surgeon', 1),
(14, 'Appendectomy Procedure', 'Laparoscopic removal of an inflamed appendix. Master trocar placement and cauterization techniques.', 'advanced', 'https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Box/glTF-Binary/Box.glb', 'https://www.youtube.com/embed/q_2kR-Z_1s8', 45, 'General Surgery Resident', 1),
(15, 'Emergency Trauma Management', 'Manage an incoming ER trauma patient with multiple lacerations and a collapsed lung (tension pneumothorax).', 'advanced', 'https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/RiggedFigure/glTF-Binary/RiggedFigure.glb', 'https://www.youtube.com/embed/3A-Z58Vn4A0', 50, 'ER Resident', 1);

-- --------------------------------------------------------
-- QUIZZES (10 per module = 150 total)
-- --------------------------------------------------------
-- Module 1: Heart Anatomy Basics
INSERT INTO Quizzes (module_id, question, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
(1, 'Which chamber of the heart pumps oxygenated blood to the body?', 'Right Atrium', 'Right Ventricle', 'Left Atrium', 'Left Ventricle', 'D', 'The left ventricle has the thickest muscular wall to pump blood throughout the systemic circulation.'),
(1, 'What is the function of the mitral valve?', 'Prevent backflow into the right atrium', 'Prevent backflow into the left atrium', 'Pump blood to the lungs', 'Connect the ventricles', 'B', 'The mitral (bicuspid) valve separates the left atrium and left ventricle.'),
(1, 'Which blood vessels carry deoxygenated blood to the lungs?', 'Aorta', 'Pulmonary Veins', 'Pulmonary Arteries', 'Vena Cava', 'C', 'Pulmonary arteries are the only arteries that carry deoxygenated blood.'),
(1, 'The pacemaker of the heart is the:', 'AV Node', 'Bundle of His', 'Purkinje Fibers', 'SA Node', 'D', 'The Sinoatrial (SA) node initiates the electrical impulse.'),
(1, 'Which layer of the heart wall is the thickest?', 'Epicardium', 'Myocardium', 'Endocardium', 'Pericardium', 'B', 'The myocardium consists of cardiac muscle tissue responsible for contraction.'),
(1, 'Deoxygenated blood enters the heart through the:', 'Aorta', 'Pulmonary Vein', 'Superior and Inferior Vena Cava', 'Pulmonary Artery', 'C', 'The Vena Cava returns blood from the body to the right atrium.'),
(1, 'The tricuspid valve is located between:', 'Left atrium and left ventricle', 'Right atrium and right ventricle', 'Right ventricle and pulmonary artery', 'Left ventricle and aorta', 'B', 'It prevents backflow into the right atrium.'),
(1, 'What is the main artery carrying oxygenated blood from the heart?', 'Aorta', 'Carotid', 'Pulmonary Artery', 'Coronary Artery', 'A', 'The aorta distributes oxygenated blood to all parts of the body.'),
(1, 'Coronary arteries supply blood to the:', 'Lungs', 'Brain', 'Heart muscle itself', 'Liver', 'C', 'The myocardium needs its own blood supply via coronary arteries.'),
(1, 'Systole refers to:', 'Heart muscle relaxation', 'Heart muscle contraction', 'Valve opening', 'Electrical delay', 'B', 'Systole is the phase of the heartbeat when the heart muscle contracts.');

-- Module 2: Brain Lobes Identification
INSERT INTO Quizzes (module_id, question, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
(2, 'Which lobe is primarily responsible for visual processing?', 'Frontal', 'Parietal', 'Occipital', 'Temporal', 'C', 'The occipital lobe contains the primary visual cortex.'),
(2, 'The frontal lobe is associated with:', 'Hearing', 'Executive functions and motor control', 'Touch perception', 'Breathing', 'B', 'Frontal lobe handles reasoning, planning, parts of speech, and movement.'),
(2, 'Auditory information is primarily processed in the:', 'Frontal lobe', 'Parietal lobe', 'Occipital lobe', 'Temporal lobe', 'D', 'The temporal lobe contains the primary auditory cortex.'),
(2, 'The somatosensory cortex is located in the:', 'Frontal lobe', 'Parietal lobe', 'Occipital lobe', 'Temporal lobe', 'B', 'The parietal lobe integrates sensory information including touch and temperature.'),
(2, 'Which structure connects the two cerebral hemispheres?', 'Brainstem', 'Cerebellum', 'Corpus Callosum', 'Thalamus', 'C', 'The corpus callosum is a thick band of nerve fibers connecting the hemispheres.'),
(2, 'Brocas area, essential for speech production, is usually in the:', 'Left frontal lobe', 'Right parietal lobe', 'Left occipital lobe', 'Right temporal lobe', 'A', 'Brocas area is localized to the left frontal lobe in most people.'),
(2, 'Damage to the cerebellum would most likely inhibit:', 'Memory formation', 'Visual perception', 'Motor coordination and balance', 'Language comprehension', 'C', 'The cerebellum coordinates voluntary movements and balance.'),
(2, 'Which part of the brain stem regulates heart rate and breathing?', 'Pons', 'Medulla oblongata', 'Midbrain', 'Thalamus', 'B', 'The medulla controls vital autonomic functions.'),
(2, 'Wernickes area is involved in:', 'Speech production', 'Language comprehension', 'Visual processing', 'Motor coordination', 'B', 'Wernickes area is responsible for the comprehension of speech.'),
(2, 'The amygdala is primarily associated with:', 'Hunger', 'Thirst', 'Emotion and fear', 'Balance', 'C', 'The amygdala is a processing center for emotions, especially fear.');

-- Module 3: Human Skeleton Overview
INSERT INTO Quizzes (module_id, question, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
(3, 'How many bones are in the adult human body?', '206', '256', '306', '106', 'A', 'An adult human typically has 206 bones.'),
(3, 'Which is the longest bone in the human body?', 'Tibia', 'Fibula', 'Femur', 'Humerus', 'C', 'The femur (thigh bone) is the longest and strongest bone.'),
(3, 'The axial skeleton consists of:', 'Skull, vertebral column, rib cage', 'Arms and legs', 'Pelvis and shoulders', 'Hands and feet', 'A', 'The axial skeleton forms the central axis of the body.'),
(3, 'Which bone protects the brain?', 'Cranium', 'Mandible', 'Sternum', 'Clavicle', 'A', 'The cranial bones fuse to protect the brain.'),
(3, 'The collarbone is anatomically known as the:', 'Scapula', 'Clavicle', 'Sternum', 'Radius', 'B', 'The clavicle is commonly called the collarbone.'),
(3, 'How many pairs of ribs do humans have?', '10', '12', '14', '24', 'B', 'Humans have 12 pairs of ribs.'),
(3, 'What type of joint is the knee?', 'Ball and socket', 'Hinge', 'Pivot', 'Saddle', 'B', 'The knee is a hinge joint allowing flexion and extension.'),
(3, 'The bones of the fingers and toes are called:', 'Carpals', 'Tarsals', 'Phalanges', 'Metacarpals', 'C', 'Phalanges make up the fingers and toes.'),
(3, 'Which bone is located in the lower arm on the thumb side?', 'Radius', 'Ulna', 'Humerus', 'Tibia', 'A', 'The radius aligns with the thumb on the lateral side of the forearm.'),
(3, 'Bone marrow is primarily responsible for:', 'Storing calcium', 'Producing blood cells', 'Connecting muscles', 'Providing flexibility', 'B', 'Red bone marrow produces red blood cells, white blood cells, and platelets.');

-- Module 4: Respiratory System Basics
INSERT INTO Quizzes (module_id, question, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
(4, 'What is the primary muscle of respiration?', 'Intercostals', 'Diaphragm', 'Pectoralis Major', 'Abdominals', 'B', 'The diaphragm contracts to expand the thoracic cavity.'),
(4, 'Gas exchange occurs in the:', 'Bronchi', 'Trachea', 'Alveoli', 'Larynx', 'C', 'Alveoli are tiny air sacs where O2 and CO2 are exchanged.'),
(4, 'The windpipe is anatomically known as the:', 'Pharynx', 'Larynx', 'Trachea', 'Esophagus', 'C', 'The trachea is the tube connecting the larynx to the bronchi.'),
(4, 'What prevents food from entering the trachea?', 'Uvula', 'Epiglottis', 'Tonsils', 'Glottis', 'B', 'The epiglottis acts as a flap covering the windpipe during swallowing.'),
(4, 'Which lung is larger?', 'Right lung', 'Left lung', 'They are the same size', 'It varies per person', 'A', 'The right lung is larger and has three lobes, while the left has two to make room for the heart.'),
(4, 'Oxygen is transported in the blood primarily bound to:', 'Plasma', 'White blood cells', 'Hemoglobin', 'Platelets', 'C', 'Hemoglobin in red blood cells carries the majority of oxygen.'),
(4, 'The process of breathing in is called:', 'Exhalation', 'Inspiration', 'Respiration', 'Ventilation', 'B', 'Inspiration or inhalation is the act of drawing air into the lungs.'),
(4, 'What covers the outer surface of the lungs?', 'Pericardium', 'Pleura', 'Peritoneum', 'Meninges', 'B', 'The visceral pleura covers the lungs.'),
(4, 'What is the normal resting respiratory rate for an adult?', '8-10 breaths/min', '12-20 breaths/min', '25-30 breaths/min', '35-40 breaths/min', 'B', 'Normal adult respiratory rate is 12 to 20 breaths per minute.'),
(4, 'Which gas is considered a waste product of cellular respiration?', 'Oxygen', 'Nitrogen', 'Carbon Dioxide', 'Carbon Monoxide', 'C', 'CO2 is produced by cells and exhaled by the lungs.');

-- Module 5: Digestive System Structure
INSERT INTO Quizzes (module_id, question, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
(5, 'Where does protein digestion begin?', 'Mouth', 'Stomach', 'Small Intestine', 'Large Intestine', 'B', 'Pepsin in the stomach begins the breakdown of proteins.'),
(5, 'Which organ produces bile?', 'Gallbladder', 'Pancreas', 'Liver', 'Stomach', 'C', 'The liver produces bile, which is stored in the gallbladder.'),
(5, 'The primary site of nutrient absorption is the:', 'Stomach', 'Small Intestine', 'Large Intestine', 'Esophagus', 'B', 'Villi in the small intestine maximize surface area for absorption.'),
(5, 'What is the function of the gallbladder?', 'Produce insulin', 'Store and concentrate bile', 'Digest fats directly', 'Filter blood', 'B', 'The gallbladder stores bile produced by the liver until needed.'),
(5, 'Which enzyme in saliva begins carbohydrate digestion?', 'Amylase', 'Lipase', 'Protease', 'Lactase', 'A', 'Salivary amylase breaks down starches.'),
(5, 'The wave-like muscle contractions that move food are called:', 'Mastication', 'Peristalsis', 'Segmentation', 'Deglutition', 'B', 'Peristalsis propels food through the digestive tract.'),
(5, 'Which section of the small intestine connects to the stomach?', 'Jejunum', 'Ileum', 'Duodenum', 'Cecum', 'C', 'The duodenum is the first and shortest section of the small intestine.'),
(5, 'What is the main function of the large intestine?', 'Nutrient absorption', 'Water absorption', 'Protein breakdown', 'Bile production', 'B', 'The large intestine primarily absorbs water and forms feces.'),
(5, 'The sphincter between the stomach and small intestine is the:', 'Lower esophageal', 'Pyloric', 'Ileocecal', 'Anal', 'B', 'The pyloric sphincter regulates the flow of chyme into the duodenum.'),
(5, 'Which organ has both endocrine and exocrine digestive functions?', 'Liver', 'Stomach', 'Pancreas', 'Spleen', 'C', 'The pancreas secretes digestive enzymes (exocrine) and insulin (endocrine).');

-- Module 6: Blood Circulation Simulation
INSERT INTO Quizzes (module_id, question, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
(6, 'Blood flows from the right ventricle to the:', 'Aorta', 'Lungs via Pulmonary Artery', 'Left Atrium', 'Body', 'B', 'The right ventricle pumps to the lungs for oxygenation.'), 
(6, 'The lowest pressure in the cardiovascular system is in the:', 'Aorta', 'Capillaries', 'Vena Cava', 'Arterioles', 'C', 'Venous return to the heart has the lowest systemic pressure.'), 
(6, 'Which valve prevents backflow from the pulmonary artery into the right ventricle?', 'Tricuspid valve', 'Mitral valve', 'Aortic valve', 'Pulmonary semilunar valve', 'D', 'The pulmonary valve sits between the right ventricle and pulmonary artery.'), 
(6, 'The exchange of gases and nutrients occurs in the:', 'Arteries', 'Veins', 'Capillaries', 'Arterioles', 'C', 'Capillaries have walls one cell thick to allow diffusion.'), 
(6, 'Oxygenated blood returns to the heart via the:', 'Pulmonary arteries', 'Vena Cava', 'Aorta', 'Pulmonary veins', 'D', 'Pulmonary veins carry oxygenated blood from lungs to left atrium.'), 
(6, 'The thickest-walled blood vessels are:', 'Veins', 'Capillaries', 'Venules', 'Arteries', 'D', 'Arteries must withstand the high pressure of blood pumped from the heart.'), 
(6, 'Which circuit carries blood between the heart and lungs?', 'Systemic circuit', 'Coronary circuit', 'Hepatic circuit', 'Pulmonary circuit', 'D', 'The pulmonary circuit oxygenates the blood.'), 
(6, 'What is the function of valves in veins?', 'Pump blood', 'Prevent backflow', 'Store oxygen', 'Filter waste', 'B', 'Because venous pressure is low, valves prevent gravity from pulling blood backwards.'), 
(6, 'Blood pressure is highest when the heart:', 'Relaxes (Diastole)', 'Contracts (Systole)', 'Fills with blood', 'Pauses between beats', 'B', 'Systolic pressure is the peak force pushing against artery walls during contraction.'), 
(6, 'The hepatic portal vein carries blood from the digestive organs to the:', 'Heart', 'Lungs', 'Kidneys', 'Liver', 'D', 'It delivers nutrient-rich blood to the liver for processing before returning to the heart.');

-- Module 7: Neural Pathway Mapping
INSERT INTO Quizzes (module_id, question, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
(7, 'Ascending neural tracts primarily carry:', 'Motor commands', 'Sensory information', 'Autonomic signals', 'Endocrine hormones', 'B', 'Ascending tracts send sensory data from the body up to the brain.'), 
(7, 'The primary motor cortex is located in the:', 'Precentral gyrus', 'Postcentral gyrus', 'Occipital lobe', 'Cerebellum', 'A', 'The precentral gyrus of the frontal lobe controls voluntary movement.'), 
(7, 'Which descending pathway is responsible for skilled, voluntary movements?', 'Spinothalamic tract', 'Corticospinal tract', 'Vestibulospinal tract', 'Rubrospinal tract', 'B', 'The corticospinal (pyramidal) tract originates in the motor cortex.'), 
(7, 'The spinothalamic tract conveys sensations of:', 'Fine touch and proprioception', 'Pain and temperature', 'Visual input', 'Auditory input', 'B', 'It is a major sensory pathway for pain and temperature.'), 
(7, 'Where do most fibers of the corticospinal tract cross over (decussate)?', 'Spinal cord', 'Midbrain', 'Pons', 'Medulla oblongata', 'D', 'Decussation of the pyramids occurs in the lower medulla.'), 
(7, 'Damage to the dorsal columns of the spinal cord would affect:', 'Motor function', 'Pain perception', 'Proprioception and fine touch', 'Temperature sensation', 'C', 'The dorsal column-medial lemniscus pathway carries proprioception and fine touch.'), 
(7, 'A reflex arc usually involves:', 'Only the brain', 'Sensory neuron, interneuron, and motor neuron', 'Only motor neurons', 'Hormonal responses', 'B', 'A typical reflex arc bypasses the brain for a rapid response via the spinal cord.'), 
(7, 'Upper motor neurons originate in the:', 'Brain', 'Spinal cord', 'Peripheral nerves', 'Muscles', 'A', 'UMNs start in the cerebral cortex or brainstem and carry info down to LMNs.'), 
(7, 'Which neurotransmitter is primarily used at the neuromuscular junction?', 'Dopamine', 'Serotonin', 'Acetylcholine (ACh)', 'GABA', 'C', 'ACh binds to receptors on the muscle fiber to initiate contraction.'), 
(7, 'The lateral horn of the spinal cord (T1-L2) contains cell bodies for:', 'Somatic motor neurons', 'Sympathetic preganglionic neurons', 'Parasympathetic neurons', 'Sensory neurons', 'B', 'The lateral horns house the autonomic sympathetic nervous system neurons.');

-- Module 8: Fracture Diagnosis
INSERT INTO Quizzes (module_id, question, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
(8, 'A bone fracture that pierces through the skin is called a:', 'Closed fracture', 'Compound (Open) fracture', 'Greenstick fracture', 'Comminuted fracture', 'B', 'Open fractures carry a high risk of deep bone infection.'), 
(8, 'Which type of fracture is most common in children?', 'Comminuted', 'Spiral', 'Greenstick', 'Transverse', 'C', 'Childrens bones are more flexible and often bend and crack rather than breaking completely.'), 
(8, 'A fracture where the bone shatters into three or more pieces is called:', 'Transverse', 'Oblique', 'Comminuted', 'Impacted', 'C', 'Comminuted fractures often require surgical hardware for stabilization.'), 
(8, 'A spiral fracture is typically caused by:', 'Direct perpendicular trauma', 'Twisting forces', 'Compression', 'Pathological disease', 'B', 'Torsional forces cause the break to spiral up the bone shaft.'), 
(8, 'Which of the following is an early sign of compartment syndrome after a fracture?', 'Severe pain disproportionate to the injury', 'Bone callus formation', 'Fever', 'Skin rash', 'A', 'Increased pressure within a muscle compartment restricts blood flow.'), 
(8, 'An impacted fracture occurs when:', 'The bone breaks cleanly in half', 'One broken end is driven into the other', 'A ligament rips off a piece of bone', 'The bone is crushed flat', 'B', 'Often seen in falls where the force drives the bone ends together.'), 
(8, 'The first stage of bone healing is:', 'Soft callus formation', 'Hard callus formation', 'Hematoma formation', 'Bone remodeling', 'C', 'Blood vessels rupture, causing a hematoma (blood clot) at the fracture site.'), 
(8, 'A Colles fracture occurs at the distal end of the:', 'Femur', 'Tibia', 'Radius', 'Humerus', 'C', 'Commonly caused by attempting to break a fall with an outstretched hand.'), 
(8, 'Which imaging modality is the gold standard for diagnosing simple bone fractures?', 'MRI scan', 'Ultrasound', 'PET scan', 'X-ray (Radiography)', 'D', 'X-rays provide excellent visualization of dense bone structures.'), 
(8, 'A stress fracture is usually the result of:', 'A sudden traumatic impact', 'Osteoporosis', 'Repetitive force or overuse', 'Bone cancer', 'C', 'Micro-cracks form when muscles become fatigued and transfer stress to bone.');

-- Module 9: Lung Function Mechanics
INSERT INTO Quizzes (module_id, question, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
(9, 'During normal inspiration, the diaphragm:', 'Relaxes and moves up', 'Contracts and moves down', 'Stays stationary', 'Contracts and moves up', 'B', 'Contraction flattens the diaphragm, increasing thoracic volume.'), 
(9, 'Boyle’s Law states that in a closed container at a constant temperature:', 'Pressure is directly proportional to volume', 'Pressure is inversely proportional to volume', 'Volume is primarily determined by temperature', 'Pressure and volume are unrelated', 'B', 'As lung volume increases during inspiration, alveolar pressure decreases, drawing air in.'), 
(9, 'Which substance reduces surface tension in the alveoli to prevent collapse?', 'Mucus', 'Pleural fluid', 'Surfactant', 'Plasma', 'C', 'Surfactant is a lipoprotein complex that keeps alveoli from sticking together.'), 
(9, 'The amount of air inhaled or exhaled with each resting breath is called:', 'Vital capacity', 'Tidal volume', 'Residual volume', 'Total lung capacity', 'B', 'Normal tidal volume is about 500 mL in adults.'), 
(9, 'Which muscles assist in forced expiration?', 'External intercostals', 'Diaphragm', 'Abdominal muscles and internal intercostals', 'Scalenes', 'C', 'These muscles actively compress the thoracic cavity to push out air faster.'), 
(9, 'What is the primary stimulus for a healthy person to breathe?', 'Low oxygen levels', 'High carbon dioxide levels', 'Low carbon dioxide levels', 'High blood pH', 'B', 'Central chemoreceptors respond primarily to increased CO2 (and resulting low pH).'), 
(9, 'The anatomical dead space refers to:', 'Alveoli that are collapsed', 'Air in the conducting zone that does not undergo gas exchange', 'The pleural cavity', 'The volume of air left after maximum exhalation', 'B', 'Air in the trachea and bronchi does not participate in gas exchange.'), 
(9, 'Pleural fluid is located:', 'Inside the alveoli', 'In the trachea', 'Between the visceral and parietal pleura', 'Inside pulmonary capillaries', 'C', 'It reduces friction as the lungs expand and contract within the chest.'), 
(9, 'A pneumothorax occurs when:', 'The alveoli fill with fluid', 'Air enters the pleural cavity, collapsing the lung', 'The bronchioles constrict', 'A blood clot blocks the pulmonary artery', 'B', 'Loss of negative intrapleural pressure causes the lung to collapse.'), 
(9, 'Spirometry is primarily used to measure:', 'Blood gas concentrations', 'Lung volumes and airflow rates', 'Heart efficiency', 'Diaphragmatic electrical activity', 'B', 'It is a crucial test for diagnosing asthma and COPD.');

-- Module 10: Liver Function & Blood Filtering
INSERT INTO Quizzes (module_id, question, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
(10, 'The liver receives nutrient-rich blood primarily from the:', 'Hepatic artery', 'Aorta', 'Hepatic portal vein', 'Inferior vena cava', 'C', 'The portal vein drains blood from the intestines directly to the liver for processing.'), 
(10, 'Which of the following is NOT a primary function of the liver?', 'Bile production', 'Detoxification of drugs', 'Insulin production', 'Glycogen storage', 'C', 'The pancreas produces insulin, not the liver.'), 
(10, 'Hepatocytes are the main functional cells of the:', 'Kidneys', 'Spleen', 'Pancreas', 'Liver', 'D', 'Hepatocytes perform most of the metabolic, endocrine, and secretory functions.'), 
(10, 'The liver breaks down toxic ammonia into which less toxic substance for excretion?', 'Urea', 'Uric acid', 'Creatinine', 'Bilirubin', 'A', 'Urea is then transported to the kidneys to be excreted in urine.'), 
(10, 'Bilirubin is a waste product created from the breakdown of:', 'White blood cells', 'Red blood cells', 'Platelets', 'Proteins', 'B', 'The liver excretes bilirubin into bile; excess bilirubin causes jaundice.'), 
(10, 'Which plasma protein, essential for maintaining osmotic pressure, is synthesized by the liver?', 'Hemoglobin', 'Albumin', 'Myoglobin', 'Collagen', 'B', 'Albumin prevents fluid from leaking out of blood vessels into tissues.'), 
(10, 'The liver stores excess glucose in the form of:', 'Glucagon', 'Starch', 'Glycogen', 'Adipose', 'C', 'Glycogen is broken back down into glucose when blood sugar drops.'), 
(10, 'Kupffer cells in the liver function as:', 'Hormone secretors', 'Bile producers', 'Macrophages (phagocytosis)', 'Stem cells', 'C', 'Kupffer cells engulf bacteria and old blood cells passing through the liver lobules.'), 
(10, 'Cirrhosis of the liver is characterized by:', 'Enlarged bile ducts', 'Replacement of normal tissue with scar tissue', 'Hyperactive hepatocytes', 'Excessive glycogen storage', 'B', 'Fibrosis impairs liver function and disrupts blood flow.'), 
(10, 'Bile is essential for the digestion of:', 'Carbohydrates', 'Proteins', 'Nucleic acids', 'Fats (Lipids)', 'D', 'Bile salts emulsify large fat globules into smaller droplets for enzymes to break down.');

-- Module 11: Cardiac Bypass Surgery (CABG)
INSERT INTO Quizzes (module_id, question, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
(11, 'CABG stands for:', 'Coronary Artery Bypass Grafting', 'Cardiac Atrial Balloon Graft', 'Coronary Aortic Blood Graft', 'Cardiac Arrest Bypass Guide', 'A', 'It redirects blood around a section of a blocked or partially blocked artery in the heart.'), 
(11, 'Which vessel is most commonly harvested from the leg for a CABG?', 'Femoral artery', 'Great saphenous vein', 'Popliteal vein', 'Tibial artery', 'B', 'The saphenous vein is long, superficial, and can be removed without compromising leg circulation.'), 
(11, 'The LIMA (commonly used in bypass) stands for:', 'Left Internal Main Artery', 'Left Inferior Myocardial Artery', 'Left Internal Mammary Artery', 'Lateral Internal Muscle Artery', 'C', 'The LIMA has excellent long-term patency rates when grafted to the LAD.'), 
(11, 'A cardiopulmonary bypass machine is used to:', 'Ventilate the lungs only', 'Monitor brain waves', 'Take over the function of the heart and lungs', 'Filter the kidneys', 'C', 'It allows the surgeon to operate on a still, bloodless heart.'), 
(11, 'The LAD (Left Anterior Descending) artery supplies blood to the:', 'Right atrium', 'Front of the left ventricle', 'Back of the right ventricle', 'Lungs', 'B', 'The LAD is sometimes called the widowmaker due to its critical supply region.'), 
(11, 'Cardioplegia is the process of:', 'Harvesting the graft', 'Intentionally stopping the heart', 'Suturing the vessels', 'Restarting the heart', 'B', 'A cold potassium-rich solution is infused to induce cardiac arrest and protect the myocardium.'), 
(11, 'An anastomosis in CABG refers to:', 'The incision in the chest', 'Stopping the heart', 'The surgical connection between the graft and the artery', 'The bypass machine tubing', 'C', 'A secure anastomosis is vital to prevent bleeding and ensure blood flow.'), 
(11, 'To access the heart during a standard CABG, the surgeon must perform a:', 'Laparotomy', 'Thoracotomy', 'Median Sternotomy', 'Craniotomy', 'C', 'The sternum is split down the middle to expose the thoracic cavity.'), 
(11, 'Post-operative monitoring after CABG heavily relies on assessing:', 'Cardiac output and arrhythmias', 'Digestion rates', 'Pupil dilation', 'Bone healing', 'A', 'Monitoring for arrhythmias (like Atrial Fibrillation) and sufficient blood pressure is critical.'), 
(11, 'Off-pump coronary artery bypass (OPCAB) means:', 'The surgery is done without anesthesia', 'The heart is still beating during the graft procedure', 'No incisions are made', 'Artificial grafts are used instead of veins', 'B', 'Also known as beating heart surgery, it avoids the heart-lung machine.');

-- Module 12: Brain Tumor Removal
INSERT INTO Quizzes (module_id, question, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
(12, 'The surgical opening of the skull to access the brain is called a:', 'Craniectomy', 'Craniotomy', 'Trepanning', 'Burr hole', 'B', 'A bone flap is temporarily removed to access the brain and replaced afterward.'), 
(12, 'Which imaging modality is primarily used for intraoperative brain navigation (neuronavigation)?', 'X-ray', 'Ultrasound', 'MRI (Magnetic Resonance Imaging)', 'PET scan', 'C', 'MRI provides the most detailed soft tissue contrast for tumor borders.'), 
(12, 'A glioblastoma (GBM) is a type of tumor arising from which cells?', 'Neurons', 'Meninges', 'Astrocytes (Glial cells)', 'Pituitary gland', 'C', 'GBM is an aggressive Grade IV astrocytoma.'), 
(12, 'Eloquent brain areas refer to regions that:', 'Are completely silent', 'Control vital neurologic functions like speech and motor skills', 'Process only visual data', 'Store long-term memories', 'B', 'Damage to eloquent areas causes severe, irreversible neurologic deficits.'), 
(12, 'Awake craniotomy is primarily performed to:', 'Reduce anesthesia costs', 'Map and preserve eloquent areas (e.g., speech)', 'Keep the patient breathing', 'Speed up the surgery', 'B', 'The patient is awakened to perform tasks while the surgeon stimulates the brain to avoid damaging critical areas.'), 
(12, 'Which drug is commonly given intraoperatively to reduce brain swelling (cerebral edema)?', 'Heparin', 'Insulin', 'Mannitol', 'Penicillin', 'C', 'Mannitol is an osmotic diuretic that draws fluid out of brain tissue.'), 
(12, 'The tool most commonly used to break up and aspirate soft brain tumors is the:', 'Scalpel', 'CUSA (Cavitron Ultrasonic Surgical Aspirator)', 'Bone saw', 'Rongeur', 'B', 'CUSA uses ultrasonic vibrations to fragment the tumor while preserving blood vessels.'), 
(12, 'Meningiomas are typically:', 'Highly malignant within the brain tissue', 'Benign tumors growing from the membranes surrounding the brain', 'Originating in the brainstem', 'Metastatic tumors from the lungs', 'B', 'They compress the brain from the outside rather than invading the tissue.'), 
(12, 'Stereotactic surgery utilizes:', 'A 3D coordinate system to locate small targets inside the body', 'Open direct visualization only', 'Endoscopic cameras through the nose', 'Lasers to burn the skull', 'A', 'It allows for highly precise, minimally invasive biopsies or localized treatments.'), 
(12, 'To control bleeding on the brain surface, neurosurgeons frequently use:', 'Heavy sutures', 'Staples', 'Bipolar electrocautery', 'Pressure bandages', 'C', 'Bipolar forceps cauterize tiny vessels precisely without spreading heat to adjacent brain tissue.');

-- Module 13: Knee Replacement Surgery
INSERT INTO Quizzes (module_id, question, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
(13, 'Total Knee Arthroplasty (TKA) involves replacing which bone surfaces?', 'Femur only', 'Tibia only', 'Distal femur, proximal tibia, and sometimes the patella', 'Fibula and femur', 'C', 'The arthritic ends of these bones are replaced with metal and plastic components.'), 
(13, 'The most common indication for a TKA is:', 'A torn ACL', 'Osteoarthritis', 'A fractured patella', 'Meniscus tear', 'B', 'Severe osteoarthritis degrades the cartilage, causing bone-on-bone pain.'), 
(13, 'Which component of a knee prosthesis acts as the new artificial cartilage?', 'Titanium tray', 'Cobalt-chrome sphere', 'Polyethylene (plastic) spacer', 'Ceramic cup', 'C', 'The plastic insert acts as a smooth gliding surface between the metal components.'), 
(13, 'A tourniquet is often applied to the thigh during TKA to:', 'Prevent deep vein thrombosis', 'Create a bloodless surgical field', 'Numb the leg', 'Hold the drapes in place', 'B', 'It inflates to stop arterial blood flow temporarily, improving visibility.'), 
(13, 'Polymethylmethacrylate (PMMA) is used in orthopedics as:', 'A painkiller', 'Bone cement to secure the implants', 'A sterile drape', 'A joint lubricant', 'B', 'Bone cement acts as a grout holding the metal implants to the bone.'), 
(13, 'In TKA, "alignment" primarily refers to:', 'Restoring the mechanical axis of the leg (hip to ankle)', 'Making the scar straight', 'Balancing the kneecap', 'Ensuring the plastic is thick enough', 'A', 'Proper mechanical alignment ensures even wear on the new joint.'), 
(13, 'A crucial step before implant placement is balancing the:', 'Blood pressure', 'Soft tissues (ligaments)', 'Patient weight', 'Surgical lights', 'B', 'The medial and lateral ligaments must be balanced for the knee to be stable in flexion and extension.'), 
(13, 'Which nerve is most at risk of injury during a knee replacement?', 'Sciatic nerve', 'Peroneal nerve', 'Femoral nerve', 'Obturator nerve', 'B', 'The common peroneal nerve wraps around the fibular head and can be stretched or compressed.'), 
(13, 'Post-operative mobilization after a TKA usually begins:', 'After 2 weeks', 'After 1 month', 'On the day of surgery or post-op day 1', 'When the stitches are removed', 'C', 'Early mobilization is critical to prevent stiffness and blood clots.'), 
(13, 'The patellar component in a TKA replaces the:', 'Undersurface of the kneecap', 'Entire kneecap', 'Patellar tendon', 'Quadriceps muscle', 'A', 'Only the articular (undersurface) of the patella is resurfaced if deemed necessary.');

-- Module 14: Appendectomy Procedure
INSERT INTO Quizzes (module_id, question, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
(14, 'The appendix is attached to which part of the intestines?', 'Duodenum', 'Jejunum', 'Cecum', 'Rectum', 'C', 'The appendix extends from the cecum, the first part of the large intestine.'), 
(14, 'The classic clinical presentation of appendicitis is pain migrating to the:', 'Right upper quadrant', 'Left lower quadrant', 'Right lower quadrant', 'Epigastric region', 'C', 'Pain often starts near the umbilicus and migrates to McBurneys point in the RLQ.'), 
(14, 'A laparoscopic appendectomy usually requires how many trocars (incisions)?', '1', '3', '5', '7', 'B', 'Typically, one at the umbilicus for the camera, and two working ports.'), 
(14, 'During laparoscopy, the abdomen is insufflated (inflated) using which gas?', 'Oxygen', 'Nitrogen', 'Carbon Dioxide (CO2)', 'Helium', 'C', 'CO2 is used because it is non-flammable and readily absorbed by the body.'), 
(14, 'The artery that supplies blood to the appendix and must be ligated is the:', 'Superior mesenteric artery', 'Appendiceal artery', 'Iliac artery', 'Hepatic artery', 'B', 'The appendiceal artery is found within the mesoappendix.'), 
(14, 'After finding the appendix, the surgeon separates it from its blood supply (the mesoappendix) using:', 'A scalpel', 'Electrocoagulation or harmonic scalpel', 'Bare hands', 'Sutures alone', 'B', 'Energy devices or clips are used to seal the vessels to prevent bleeding.'), 
(14, 'The base of the appendix is usually secured before amputation using:', 'Glue', 'An endoloop or surgical stapler', 'Tape', 'Cautery only', 'B', 'A stapler or loop ties off the base so bowel contents do not leak into the abdomen.'), 
(14, 'If the appendix has ruptured, the surgeon must thoroughly:', 'Remove the colon', 'Irrigate and suction the abdominal cavity', 'Leave the abdomen open permanently', 'Remove the gallbladder', 'B', 'Pus and feces must be washed out to prevent severe peritonitis and sepsis.'), 
(14, 'The appendiceal stump is sometimes inverted (pushed) into the cecum and secured with a:', 'Purse-string suture', 'Titanium clip', 'Stent', 'Mesh', 'A', 'A purse-string suture acts like a drawstring bag to bury the stump.'), 
(14, 'Which structure must be carefully identified and avoided when dissecting near the appendix base?', 'Ureter', 'Aorta', 'Stomach', 'Spleen', 'A', 'The right ureter lies retroperitoneally near the cecum and can be accidentally injured.');

-- Module 15: Emergency Trauma Management
INSERT INTO Quizzes (module_id, question, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
(15, 'In the ATLS primary survey, the first priority (the A) is:', 'Administer drugs', 'Airway maintenance with cervical spine protection', 'Assess bleeding', 'Apply oxygen', 'B', 'If the airway is blocked, all other interventions will fail.'), 
(15, 'What clinical signs indicate a tension pneumothorax?', 'High blood pressure and slow pulse', 'Tracheal deviation, absent breath sounds, hypotension', 'Normal breathing but chest pain', 'Slow breathing and warm skin', 'B', 'Air trapped in the chest cavity compresses the lung and the heart, causing shock.'), 
(15, 'The immediate treatment for a tension pneumothorax is:', 'Chest X-ray', 'Needle decompression', 'CPR', 'Blood transfusion', 'B', 'A large-bore needle is inserted in the 2nd intercostal space to release the trapped air.'), 
(15, 'The C in the primary survey stands for Circulation and focuses on:', 'Checking cholesterol', 'Controlling hemorrhage and assessing perfusion', 'Cranial nerve testing', 'Cooling the patient', 'B', 'Finding and stopping massive bleeding is the next priority after airway and breathing.'), 
(15, 'A FAST (Focused Assessment with Sonography for Trauma) exam looks for:', 'Brain hemorrhage', 'Bone fractures', 'Free fluid (blood) in the abdomen or pericardium', 'Spinal cord damage', 'C', 'It is a rapid bedside ultrasound to detect internal bleeding.'), 
(15, 'The Glasgow Coma Scale (GCS) assesses which three parameters?', 'Pulse, BP, Respiration', 'Eye opening, Verbal response, Motor response', 'Pupil size, Reflexes, Strength', 'Airway, Breathing, Circulation', 'B', 'A GCS of 8 or less typically indicates severe head injury requiring intubation.'), 
(15, 'Permissive hypotension in trauma resuscitation aims to:', 'Raise BP as high as possible', 'Keep BP slightly low to prevent blowing off fresh blood clots', 'Stop the heart', 'Dilate blood vessels', 'B', 'Aggressive fluid pumping can dislodge clots and worsen internal bleeding before surgical control.'), 
(15, 'Cardiac tamponade occurs when:', 'The heart muscles spasm', 'Blood accumulates in the pericardial sac, compressing the heart', 'A blood clot blocks a coronary artery', 'The lungs collapse', 'B', 'The heart cannot fill with blood during diastole, causing severe shock.'), 
(15, 'What is the treatment for cardiac tamponade?', 'Defibrillation', 'Pericardiocentesis', 'Epinephrine', 'Chest tube', 'B', 'A needle is inserted into the pericardial sac to drain the blood.'), 
(15, 'Massive transfusion protocols (MTP) typically administer blood products in what ratio (PRBC : FFP : Platelets)?', '10:1:1', '1:1:1', '5:2:1', 'Liquid plasma only', 'B', 'A 1:1:1 ratio mimics whole blood and helps prevent coagulopathy in severe trauma.');
