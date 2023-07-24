/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
	 id  SERIAL PRIMARY KEY,
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


ALTER TABLE animals DROP CONSTRAINT IF EXISTS pk_animals;
ALTER TABLE animals
ADD COLUMN id SERIAL PRIMARY KEY;

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INTEGER REFERENCES species (id);

ALTER TABLE animals
ADD COLUMN owner_id INTEGER REFERENCES owners (id);


-- Create Join table content

CREATE TABLE vets (
id  SERIAL PRIMARY KEY,
name VARCHAR(50),
age INTEGER,
date_of_graduation DATE
);

CREATE TABLE specializations (
 id SERIAL PRIMARY KEY,
 vet_id INTEGER REFERENCES vets(id),
 species_id INTEGER REFERENCES species(id)
);

CREATE TABLE visits (
id SERIAL PRIMARY KEY,
vet_id INTEGER REFERENCES vets(id),
animals_id INTEGER REFERENCES animals(id),
visit_date DATE
);

-- database performance audit create index

CREATE INDEX indx_visits_id ON visits (animals_id);


CREATE INDEX idx_owners_email ON owners (email);


