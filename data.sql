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
INSERT INTO visits(animal_id,vet_id ,date_of_visits) VALUES
(1,1,'2020-05-24'),
(1,3,'2020-07-22'), 
(2,4,'2021-02-02'),
(3,2,'2020-01-05'), 
(3,2,'2020-03-08'), 
(3,2,'2020-05-14'),
(4,3,'2021-05-04'), 
(5,4,'2021-02-24'), 
(6,2,'2019-12-21'),
(6,1,'2020-08-10'), 
(6,2,'2021-04-07'), 
(7,3,'2019-09-29'),
(8,4,'2020-10-03'), 
(8,4,'2020-11-04'), 
(9,2,'2019-01-24'),
(9,2,'2019-05-15'), 
(9,2,'2020-02-27'), 
(9,2,'2020-08-03'),
(10,3,'2020-05-24'), 
(10,1,'2021-01-11');



-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visits) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

INSERT INTO Denom
      SELECT * FROM visits
      WHERE vet_id = 2;
