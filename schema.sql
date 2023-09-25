-- vetclinic database
CREATE DATABASE vet_clinic;

-- animals table
CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    species VARCHAR(255), -- 'species column'
    species_id INTEGER, -- 'species_id column'
    owner_id INTEGER -- 'owner_id column'
);

-- foreign key
ALTER TABLE animals
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id)
REFERENCES species(id);

-- foreign key
ALTER TABLE animals
ADD CONSTRAINT fk_owner
FOREIGN KEY (owner_id)
REFERENCES owners(id);

-- owner's table
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    age INTEGER
);

-- species table
CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

-- Create the vets table
CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INTEGER,
    date_of_graduation DATE
);

-- create the specializations TABLE
CREATE TABLE specializations (
    vets_id INTEGER REFERENCES vets(id),
    species_id INTEGER REFERENCES species(id),
    PRIMARY KEY (vets_id, species_id)
);

-- Create the visits TABLE
CREATE TABLE visits(
animal_id INT,
vet_id INT,
date_of_visits DATE,
CONSTRAINT fk_animals
FOREIGN KEY(animal_id)
REFERENCES animals(id),
CONSTRAINT fk_vets
FOREIGN KEY(vet_id)
REFERENCES vets(id)
);

-- Performance Database
-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Drop previous visits table and recreated
DROP TABLE visits;

CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY,
  animal_id INT REFERENCES animals(id),
  vet_id INT REFERENCES vets(id),
  date_of_visits DATE,
  PRIMARY KEY(id)
);

