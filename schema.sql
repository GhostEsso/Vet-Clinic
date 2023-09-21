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
CREATE TABLE visits (
    animal_id INTEGER REFERENCES animals(id),
    vet_id INTEGER REFERENCES vets(id),
    visit_date DATE,
    PRIMARY KEY (animal_id, vet_id, visit_date)
);

-- Insert data for vets
INSERT INTO vets (name, age, date_of_graduation)
VALUES
  ('William Tatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');

-- Insert data for specializations
INSERT INTO specializations (vets_id, species_id)
VALUES
  (1, 1), -- William Tatcher specialized in Pokemon
  (3, 1), -- Stephanie Mendez specialized in Pokemon
  (3, 2), -- Stephanie Mendez specialized in Digimon
  (4, 2); -- Jack Harkness specialized in Digimon  

-- Insert data for visits(Assuming visit-date is in the format 'YYYY-MM-DD')
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES
  (1, 1, '2020-05-24'), -- Agumon visited William Tatcher on May 24th, 2020
  (1, 3, '2020-07-22'), -- Agumon visited Stephanie Mendez on Jul 22th, 2020
  (2, 4, '2021-02-02'), -- Gabumon visited Jack Harkness on Feb 2nd, 2021
  (3, 2, '2020-01-05'), -- Pikachu visited Maisy Smith on Jan 5th, 2020
  (3, 2, '2020-03-08'), -- Pikachu visited Maisy Smith on Mar 8th, 2020
  (3, 2, '2020-05-14'), -- Pikachu visited Maisy SMith on May 14th, 2020
  (4, 3, '2021-05-04'), -- Devimon visited Stephanie Mendez on May 4th, 2021
  (5, 4, '2021-02-24'), -- Charmander visited Jack Harkness on Feb 24th, 2021
  (6, 2, '2019-12-21'), -- Plantmon visited Maisy Smith on Dec 21st, 2019
  (6, 1, '2020-08-10'), -- Plantmon visited William Tatcher on Aug 10th, 2020
  (6, 2, '2021-04-07'), -- Plantmon visited Maisy Smith on Apr 7th, 2021
  (7, 3, '2019-09-29'), -- Squirtle visited Stephanie Mendez on Sep 29th, 2019
  (8, 4, '2020-10-03'), -- Angemon visited Jack Harkness on Oct 3rd, 2020
  (8, 4, '2020-11-04'), -- Angemon visited Jack Harkness on Nov 4th, 2020
  (9, 2, '2019-01-24'), -- Boarmon visited Maisy Smith on Jan 24th, 2019
  (9, 2, '2019-05-15'), -- Boarmon visited Maisy Smith on Mai 15th, 2019
  (9, 2, '2020-02-27'), -- BVMSO Feb 27th, 2020
  (9, 2, '2020-08-03'), -- Boarmon visited Maisy Smith on Feb 27th, 2020
  (10, 3, '2020-05-24'), -- Blossom visited SM on May 24th, 2020
  (10, 1, '2021-01-11'); -- BlVWTO Jan 11th, 2021

