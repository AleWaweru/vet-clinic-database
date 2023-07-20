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


SELECT * FROM animals;