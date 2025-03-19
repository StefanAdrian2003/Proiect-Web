DROP TYPE IF EXISTS categ_prajitura;
DROP TYPE IF EXISTS tipuri_produse;

CREATE TYPE categ_prajitura AS ENUM( 'comanda speciala', 'aniversara', 'editie limitata', 'pentru copii', 'dietetica','comuna');
CREATE TYPE tipuri_produse AS ENUM('cofetarie', 'patiserie', 'gelaterie');


CREATE TABLE IF NOT EXISTS prajituri (
   id serial PRIMARY KEY,
   nume VARCHAR(50) UNIQUE NOT NULL,
   descriere TEXT,
   pret NUMERIC(8,2) NOT NULL,
   gramaj INT NOT NULL CHECK (gramaj>=0),   
   tip_produs tipuri_produse DEFAULT 'cofetarie',
   calorii INT NOT NULL CHECK (calorii>=0),
   categorie categ_prajitura DEFAULT 'comuna',
   ingrediente VARCHAR [], --pot sa nu fie specificare deci nu punem NOT NULL
   pt_diabetici BOOLEAN NOT NULL DEFAULT FALSE,
   imagine VARCHAR(300),
   data_adaugare TIMESTAMP DEFAULT current_timestamp
);

INSERT into prajituri (nume,descriere,pret, gramaj, calorii, tip_produs, categorie, ingrediente, pt_diabetici, imagine) VALUES 
('Savarină', 'Prăjitură insiropată, cu frișcă', 7.5 , 200, 400, 'cofetarie', 'comuna', '{"faina","lapte","frisca","zahar"}', False, 'aproximativ-savarina.jpg'),

('Amandină', 'Prăjitură cu ciocolată', 6 , 200, 400, 'cofetarie', 'comuna', '{"faina","ciocolata","lapte","zahar","unt"}', False, 'posibil-amandina.jpg'),

('Tort glazurat', 'Tort pentru evenimente, poate fi decorat cu diverse culori', 35 , 1000, 2500, 'cofetarie', 'comanda speciala', '{"oua","zahar","faina","lapte","ciocolata","alune"}', False,'tort-glazurat.jpg'),

('Dulcelind cu fructe', 'Rețetă proprie, cu conținut sănătos (dacă ignorați tonele de zahăr) de fruncte proaspete', 10 , 250, 620, 'cofetarie', 'aniversara', '{"frisca","zahar","faina","zmeura","lapte","mure","capsuni"}', False,'dulcelind.jpg'),

('Tartă cu căpșuni', 'Sub căpșuni se află o tartă.', 6 , 245, 280, 'cofetarie', 'comuna', '{"vanilie","faina","capsuni","lapte", "indulcitor"}', True,'tarta-capsuni.jpg'),

('Nimic', 'Nimic', 10 , 0, 0, 'cofetarie', 'dietetica', '{}', False, 'nimic.jpg'),

('Cozonac zburător', 'Cineva a vărsat heliu peste aluat.', 25.5 , 1000, 1800, 'patiserie', 'comuna', '{"zahar","unt","faina","lapte","cacao","alune", "nuca"}', False, 'cozonac-zburator.jpg'),

('Brioșe', 'Aluat pufos, cu bucățele de ciocolată. Bucățelele de ciocolata, însă, nu sunt tocmai pufoase.', 8 , 145, 320, 'patiserie', 'comuna', '{"ciocolata","lapte","unt","migdale","faina","zahar"}', False, 'briose.jpg'),

('Turtă dulce', 'Un produs bun de savurat de Craciun. Sau și mai târziu dacă stocul a depășit cererea. De obicei mai găsiți și prin iunie...', 12 , 400, 550, 'patiserie', 'aniversara', '{"faina","lapte","scortisoara","zahar","unt"}', False, 'turta-dulce.jpg'),

('Turtă dulce dietetică', 'Îndulcitor în loc de zahăr. Dar nu vă lăsați păcăliți de nume, în rest nimic nu-i dietetic.', 10 , 400, 520, 'patiserie', 'aniversara', '{"faina","lapte","zaharina","unt","scortisoara"}', True, 'turta-dulce-dietetica.jpg'),

('Căsuță din turtă dulce', 'Vine cu tot cu vrăjitoare și cuptor la pachet. A nu se lăsa în mijlocul pădurii.', 70 , 450, 2700, 'patiserie', 'aniversara', '{"unt","scortisoara", "oua","faina","lapte","zahar"}', False, 'casuta-turta-dulce.jpg'),

('Croissant', 'Un răsfăț pufos și dulce... mda... dulce... dacă nu încurcă Dorelina, iar, sarea cu zahărul!!!', 5 , 150, 285, 'patiserie', 'comuna', '{"faina","lapte","zahar/sare","unt","ciocolata","migdale"}', False, 'croissant.jpg'),

('Prajitura căpșuni', 'Prăjitura se face doar cu comandă specială, fiindcă apoi o comandăm și noi la rândul nostru la cofetăria vecină.', 15 , 180, 385, 'cofetarie', 'comanda speciala', '{"faina","lapte","zahar", "capsuni","unt","gelatina"}', False, 'prajitura-capsuni.jpg'),

('Nasturei cu dulceață', 'Pentru când năstureii normali cedează fiindcă ați mâncat prea multă dulceață', 20.5 , 350, 700, 'patiserie', 'comuna', '{"migdale", "faina","lapte","zahar","unt","dulceata"}', False, 'nasturei-dulceata.jpg'),


('Bomboane de ciocolată pe băț', 'Bățul e cel comestibil, nu bomboana.', 6, 100, 210,'cofetarie', 'pentru copii', '{"ciocolata", "zahar", "lapte", "alune", "faina"}', False, 'bomboane-ciocolata-bat.jpg'),

('Înghețată fumătoare', 'Din când în când, tușește... Dar nu are COVID!', 18.5 , 225, 370, 'gelaterie', 'comuna', '{"smantana","lapte","migdale", "dulceata","zahar","vanilie","ciocolata", "frisca"}', False, 'inghetata-fumatoare.jpg'),


('Înghețată multicoloră', 'Când storci un curcubeu peste înghețată... Ediție limitată; fabricăm doar după ploaie.', 12 , 120, 270, 'gelaterie', 'editie limitata', '{"smantana","lapte","migdale", "dulceata","zahar","vanilie","ciocolata", "frisca"}', False, 'inghetata-multicolora.jpg'),


('Brioșă cu înghețată', 'Nu încercam să fim creativi... Dorelina a încurcat iar rețetele. Măcar are culoare roz', 14 , 235, 340, 'gelaterie', 'pentru copii', '{"frisca", "smantana", "lapte", "ceva roz", "faina","zahar","vanilie"}', False, 'briosa-inghetata.jpg'),

('Înghețată generică', 'Când bușim așa de tare rețeta încât nu se mai încadrează în niuna dintre celelalte categorii.', 8, 90, 130, 'gelaterie','comuna','{"frisca", "smantana", "lapte", "ceva roz", "faina","zahar","vanilie"}', False, 'inghetata-generica.jpg'),

('Imagine cu înghețată', 'Pentru cei aflați la dietă.', 5, 10,10,'gelaterie', 'comuna', '{"hârtie", "tuș"}', False, 'imagine-cu-inghetata.jpg'),


('Bomboane colorate', 'Pentru copiii care doresc să afle devreme cum e o vizită la dentist.', 7, 150,340,'cofetarie', 'pentru copii', '{"zahar", "ciocolata","lapte"}', False, 'bomboane-colorate.jpg');







DROP TYPE IF EXISTS categorie;

CREATE TYPE categorie AS ENUM( 'sport', 'clasice', 'off-road', 'curse', 'premium');




CREATE TABLE IF NOT EXISTS jante (
   id serial PRIMARY KEY,
   nume VARCHAR(50) UNIQUE NOT NULL,
   descriere TEXT,
   imagine VARCHAR(300),
   categorie VARCHAR(100),  --sport/clasice/off-road/curse/premium
   nr_prezoane int NOT NULL,
   pret NUMERIC(8,2) NOT NULL,
   dimensiune int NOT NULL,  --diametrul
   data_aparitie timestamp DEFAULT current_timestamp,
   culoare varchar(100) NOT NULL,
   materiale VARCHAR [], 
   editie_limitata BOOLEAN NOT NULL DEFAULT FALSE
);

INSERT INTO jante (nume, descriere, imagine, categorie, nr_prezoane, pret, dimensiune, culoare, materiale, editie_limitata)
VALUES 
('SportiveX1', 'Jante sport moderne', 'jante1.jpg', 'sport', 5, 999.99, 18, 'Negru', ARRAY['Aluminiu', 'Carbon'], FALSE),
	
('ClasiceElegante', 'Jante clasice și elegante', 'jante2.jpg', 'clasice', 4, 799.99, 17, 'Argintiu', ARRAY['Oțel'], FALSE),
	
('OffRoadBeast', 'Jante rezistente pentru off-road', 'jante3.jpg', 'off-road', 6, 1200.00, 20, 'Negru Mat', ARRAY['Aluminiu', 'Oțel'], TRUE),
	
('CurseTurbo', 'Jante ultra-usoare pentru curse', 'jante4.jpg', 'curse', 5, 1500.50, 19, 'Rosu', ARRAY['Magnesiu'], FALSE),
	
('PremiumLux', 'Jante de lux premium', 'jante5.jpg', 'premium', 4, 2000.75, 21, 'Auriu', ARRAY['Titan'], TRUE),
	
('SportiveY2', 'Jante sport de performanta', 'jante6.jpg', 'sport', 5, 950.00, 18, 'Albastru', ARRAY['Aluminiu'], FALSE),
	
('ClasiceRetro', 'Jante clasice retro', 'jante7.jpg', 'clasice', 4, 720.50, 16, 'Negru Lucios', ARRAY['Oțel'], FALSE),
	
('OffRoadExtreme', 'Jante off-road extreme', 'jante8.jpg', 'off-road', 6, 1300.00, 20, 'Verde Militar', ARRAY['Aluminiu', 'Oțel'], TRUE),
	
('CurseSpeed', 'Jante pentru viteza maxima', 'jante9.jpg', 'curse', 5, 1450.75, 19, 'Galben', ARRAY['Magnesiu'], FALSE),
	
('PremiumElegance', 'Jante premium elegante', 'jante10.jpg', 'premium', 4, 2100.80, 21, 'Argintiu', ARRAY['Titan'], TRUE),
	
('SportiveZ3', 'Jante sport inovative', 'jante11.jpg', 'sport', 5, 980.25, 18, 'Portocaliu', ARRAY['Aluminiu', 'Carbon'], FALSE),
	
('ClasiceChic', 'Jante clasice cu design chic', 'jante12.jpg', 'clasice', 4, 755.00, 17, 'Bej', ARRAY['Oțel'], FALSE),
	
('OffRoadAdventure', 'Jante pentru aventuri off-road', 'jante13.jpg', 'off-road', 6, 1250.00, 20, 'Gri', ARRAY['Aluminiu', 'Oțel'], TRUE),
	
('CursePro', 'Jante profesionale pentru curse', 'jante14.jpg', 'curse', 5, 1400.99, 19, 'Albastru Metalizat', ARRAY['Magnesiu'], FALSE),
	
('PremiumRoyal', 'Jante premium de top', 'jante15.jpg', 'premium', 4, 2200.90, 21, 'Negru Aurit', ARRAY['Titan'], TRUE),
	
('SportiveA4', 'Jante sport pentru performanțe superioare', 'jante16.jpg', 'sport', 5, 1050.00, 18, 'Roșu Aprins', ARRAY['Aluminiu', 'Carbon'], FALSE),
	
('ClasiceVintage', 'Jante clasice cu un aspect vintage', 'jante17.jpg', 'clasice', 4, 780.00, 17, 'Bronz', ARRAY['Oțel'], FALSE);

