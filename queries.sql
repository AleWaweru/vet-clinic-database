/*Queries that provide answers to the questions from all projects.*/

SELECT DISTINCT * FROM animals WHERE name LIKE '%mon';
SELECT DISTINCT name FROM animals WHERE date_of_birth BETWEEN '1/1/2016' AND '12/31/2019';
SELECT DISTINCT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT DISTINCT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT DISTINCT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT DISTINCT * FROM animals WHERE neutered = true;
SELECT DISTINCT * FROM animals WHERE name <> 'Gabumon';
SELECT DISTINCT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

