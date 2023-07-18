/*Queries that provide answers to the questions from all projects.*/

SELECT DISTINCT * FROM animals WHERE name LIKE '%mon';
SELECT DISTINCT name FROM animals WHERE date_of_birth BETWEEN '1/1/2016' AND '12/31/2019';
SELECT DISTINCT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT DISTINCT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT DISTINCT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT DISTINCT * FROM animals WHERE neutered = true;
SELECT DISTINCT * FROM animals WHERE name <> 'Gabumon';
SELECT DISTINCT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

ALTER TABLE animals ADD species varchar(50);
BEGIN;

UPDATE animals SET species = 'unspecified';

ROLLBACK;

BEGIN;

UPDATE animals SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals SET species = 'pokemon'
WHERE species IS NULL;

COMMIT;

BEGIN;

DELETE FROM animals;

ROLLBACK;


BEGIN;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT my_savepoint;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO SAVEPOINT my_savepoint;

UPDATE animals SET weight_kg = weight_kg * -1;

COMMIT;


SELECT COUNT(*) AS animal_count FROM animals;

SELECT COUNT(*) AS never_escaped_count
FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) AS average_weight
FROM animals;

SELECT neutered, COUNT(*) AS escape_count
FROM animals
WHERE escape_attempts > 0
GROUP BY neutered
ORDER BY escape_count DESC;

SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) AS average_escape_attempts
FROM animals
WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000
GROUP BY species;

SELECT * FROM animals;














