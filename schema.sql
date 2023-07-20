/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
	id  integer,
	name  varchar(50),
	date_of_birth date,
	escape_attempts  integer,
	neutered  boolean,
	weight_kg  decimal,
	species varchar(50)
);
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INTEGER
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);


ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INTEGER REFERENCES species (id);

ALTER TABLE animals
ADD COLUMN owner_id INTEGER REFERENCES owners (id);



SELECT * FROM animals;
