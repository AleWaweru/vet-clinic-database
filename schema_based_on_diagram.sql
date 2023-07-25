-- schema_based_on_diagram.sql

-- Create the database
CREATE DATABASE vet_clinic;
USE vet_clinic;

-- Create the tables

CREATE TABLE animals (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    date_of_birth DATE,
    escape_attempts INT(11),
    neutered TINYINT(1),
    weight_kg DECIMAL(10, 2),
    species_id INT(11),
    owner_id INT(11),
    CONSTRAINT fk_animals_species FOREIGN KEY (species_id) REFERENCES species (id),
    CONSTRAINT fk_animals_owners FOREIGN KEY (owner_id) REFERENCES owners (id)
);

CREATE TABLE owners (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    age INT(11),
    email VARCHAR(100) -- Adding the email column for the index
);

CREATE TABLE species (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255)
);

CREATE TABLE vets (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT(11),
    date_of_graduation DATE
);

CREATE TABLE specializations (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    vet_id INT(11),
    species_id INT(11),
    CONSTRAINT fk_specializations_vets FOREIGN KEY (vet_id) REFERENCES vets (id),
    CONSTRAINT fk_specializations_species FOREIGN KEY (species_id) REFERENCES species (id)
);

CREATE TABLE visits (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    vet_id INT(11),
    animal_id INT(11),
    visit_date DATE,
    CONSTRAINT fk_visits_vets FOREIGN KEY (vet_id) REFERENCES vets (id),
    CONSTRAINT fk_visits_animals FOREIGN KEY (animal_id) REFERENCES animals (id)
);

-- Create indexes for foreign keys
CREATE INDEX idx_animals_species_id ON animals (species_id);
CREATE INDEX idx_animals_owner_id ON animals (owner_id);
CREATE INDEX idx_specializations_vet_id ON specializations (vet_id);
CREATE INDEX idx_specializations_species_id ON specializations (species_id);
CREATE INDEX idx_visits_vet_id ON visits (vet_id);
CREATE INDEX idx_visits_animal_id ON visits (animal_id);
CREATE INDEX idx_owners_email ON owners (email);

