/* Database schema to keep the structure of the entire database. */

-- Create the vet_clinic database
CREATE DATABASE vet_clinic;
-- Create the animals' table
CREATE TABLE animals (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL
);

ALTER TABLE animals
ADD COLUMN owner_id INT,
ADD CONSTRAINT fk_owner
  FOREIGN KEY (owner_id)
  REFERENCES owners (id);

ALTER TABLE animals
ADD COLUMN species_id INT,
ADD CONSTRAINT fk_species
  FOREIGN KEY (species_id)
  REFERENCES species (id);


-- The owners table pg_create_restore_point
CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(255),
  age INTEGER
);

-- Create the species TABLE
CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);