/* Populate database with sample data. */
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg )
VALUES (1, 'Agumon', '2/3/2020', 0, true, 10.23),
(2, 'Gabumon', '11/15/2018', 2, true, 8),
(3, 'Pikachu', '1/7/2021', 1, false, 15.04),
(4, 'Devimon', '5/12/2017', 5, true, 11),
(5, 'Charmander', '2/8/2020', 0, false, -11),
(6, 'Plantmon', '11/15/2021', 2, true, -5.7),
(7, 'Squirtle', '4/2/1993', 3, false, -12.13),
(8, 'Angemon', '6/12/2005', 1, true, -45),
(9, 'Boarmon', '6/7/2005', 7, true, 20.4),
(10, 'Blossom', '10/13/1998', 3, true, 17),
(11, 'Ditto', '5/14/2022', 4, true, 22);


INSERT INTO owners (full_name, age) VALUES

DELETE FROM owners;

ALTER TABLE animals DROP CONSTRAINT animals_owner_id_fkey;

ALTER TABLE owners DROP COLUMN id;

ALTER TABLE owners ADD COLUMN id SERIAL PRIMARY KEY;

ALTER TABLE animals ADD CONSTRAINT animals_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES owners (id);

INSERT INTO owners (full_name, age) VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);
	
INSERT INTO species (name) VALUES
    ('Pokemon'),
    ('Digimon');
	
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE species_id IS NULL;

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');

-- INSERT JOIN TABLE CONTENT 

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
       ('Maisy Smith', 26, '2019-01-17'),
       ('Stephanie Mendez', 64, '1981-05-04'),
       ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_id, species_id)
VALUES (1, 1), -- William Tatcher is specialized in Pokemon
       (2, 1), -- Stephanie Mendez is specialized in Pokemon
       (2, 2), -- Stephanie Mendez is specialized in Digimon
       (3, 2); -- Jack Harkness is specialized in Digimon
	   
INSERT INTO visits (vet_id, animals_id, visit_date)
VALUES (1, 1, '2020-05-24'),    -- Agumon visited William Tatcher on May 24th, 2020
       (2, 1, '2020-07-22'),    -- Agumon visited Stephanie Mendez on Jul 22nd, 2020
       (3, 2, '2021-02-02'),    -- Gabumon visited Jack Harkness on Feb 2nd, 2021
       (4, 3, '2020-01-05'),    -- Pikachu visited Maisy Smith on Jan 5th, 2020
       (4, 3, '2020-03-08'),    -- Pikachu visited Maisy Smith on Mar 8th, 2020
       (4, 3, '2020-05-14'),    -- Pikachu visited Maisy Smith on May 14th, 2020
       (2, 4, '2021-05-04'),    -- Devimon visited Stephanie Mendez on May 4th, 2021
       (3, 5, '2021-02-24'),    -- Charmander visited Jack Harkness on Feb 24th, 2021
       (4, 6, '2019-12-21'),    -- Plantmon visited Maisy Smith on Dec 21st, 2019
       (1, 6, '2020-08-10'),    -- Plantmon visited William Tatcher on Aug 10th, 2020
       (4, 6, '2021-04-07'),    -- Plantmon visited Maisy Smith on Apr 7th, 2021
       (2, 7, '2019-09-29'),    -- Squirtle visited Stephanie Mendez on Sep 29th, 2019
       (3, 8, '2020-10-03'),    -- Angemon visited Jack Harkness on Oct 3rd, 2020
       (3, 8, '2020-11-04'),    -- Angemon visited Jack Harkness on Nov 4th, 2020
       (4, 9, '2019-01-24'),    -- Boarmon visited Maisy Smith on Jan 24th, 2019
       (4, 9, '2019-05-15'),    -- Boarmon visited Maisy Smith on May 15th, 2019
       (4, 9, '2020-02-27'),    -- Boarmon visited Maisy Smith on Feb 27th, 2020
       (4, 9, '2020-08-03'),    -- Boarmon visited Maisy Smith on Aug 3rd, 2020
       (2, 10, '2020-05-24'),   -- Blossom visited Stephanie Mendez on May 24th, 2020
       (1, 10, '2021-01-11');   -- Blossom visited William Tatcher on Jan 11th, 2021
	   

       -- DATABASE PERFORMANCE AUDIT INSERTION

       -- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animals_id, vet_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
INSERT INTO owners (full_name, email) SELECT 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';