--Insert data into the animals' table
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23),
       (2, 'Gabumon', '2018-11-15', 2, true, 8),
       (3,'Pikachu', '2021-01-07', 1, false, 15.04),
       (4,'Devimon', '2017-05-12', 5, true, 11);
       
-- insert new data into the animals' table;
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES 
  ('Charmander', '2020-02-08', 0, FALSE, -11),
  ('Plantmon', '2021-11-15', 2, TRUE, -5.7),
  ('Squirtle', '1993-04-02', 3, FALSE, -12.13),
  ('Angemon', '2005-06-12', 1, TRUE, -45),
  ('Boarmon', '2005-06-07', 7, TRUE, 20.4),
  ('Blossom', '1998-10-13', 3, TRUE, 17),
  ('Ditto', '2022-05-14', 4, TRUE, 22);

--Insert the following data into the owners table:
INSERT INTO owners (full_name, age) VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

  -- -- Insert data into the species' table
  INSERT INTO species (name) VALUES
  ('Pokemon'),
  ('Digimon');

  --Modify your inserted animals
UPDATE animals 
SET species_id = (
  SELECT id::integer FROM species 
  WHERE (name LIKE '%mon' AND name = 'Digimon')
     OR (name NOT LIKE '%mon' AND name = 'Pokemon')
  LIMIT 1
);

UPDATE animals
SET owner_id = (
    SELECT id FROM owners WHERE full_name = 
        CASE 
            WHEN name = 'Agumon' THEN 'Sam Smith'
            WHEN name IN ('Gabumon', 'Pikachu') THEN 'Jennifer Orwell'
            WHEN name IN ('Devimon', 'Plantmon') THEN 'Bob'
            WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN 'Melody Pond'
            WHEN name IN ('Angemon', 'Boarmon') THEN 'Dean Winchester'
            ELSE 'Unknown Owner'
        END
    LIMIT 1
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
