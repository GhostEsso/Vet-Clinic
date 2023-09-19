-- Active: 1695058512420@@127.0.0.1@5432@postgres
/*Queries that provide answers to the questions from all projects.*/

-- Find all animals whose name ends in "mon".
SELECT * FROM animals WHERE name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019.
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

-- List name and escape attempts of animals that weigh more than 10.5kg.
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

-- Find all animals that are neutered.
SELECT * FROM animals WHERE neutered = true;

-- Find all animals not named Gabumon.
SELECT * FROM animals WHERE name <> 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (inclusive).
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Transaction 1: Update column "species" to "unspecified"
BEGIN;
UPDATE animals SET species = 'unspecifed';
SELECT * FROM animals; -- verification
ROLLBACK; -- Cancel transaction

-- Transaction 2: Update of the "species" column for certain animals
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals; -- verification
COMMIT; -- commit transaction_timestamp

-- Transaction 3: Delete all records
BEGIN;
DELETE FROM animals;
SELECT * FROM animals; -- Verification
ROLLBACK; --Cancel transaction_timestamp

-- Transaction 4: Remove animals born after January 1, 2022
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals; -- Verification
COMMIT; -- Commit transaction

-- Analytical queries
SELECT COUNT(*) AS total_animals FROM animals; -- How many animals are there?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0; -- Animals that have never attempted to escape
SELECT AVG(weight_kg) AS average_weight FROM animals; -- Average weight of animals
SELECT neutered, COUNT(*) FROM animals GROUP BY neutered; -- Who escapes the most, castrated animals or not?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species; -- Minimum and maximum weight of each type of animal
SELECT AVG(escape_attempts) AS avg_escape FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'; -- Average number of escape attempts by type of animal born between 1990 and 2000

