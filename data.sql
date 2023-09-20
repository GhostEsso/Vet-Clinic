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

