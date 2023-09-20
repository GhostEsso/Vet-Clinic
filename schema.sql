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
