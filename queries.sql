/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth between '2016-01-01' and '2019-12-31';

SELECT name FROM animals WHERE neutered=TRUE and escape_attempts<3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg> 10.5;

SELECT * FROM animals WHERE neutered=TRUE;

SELECT * FROM animals WHERE name!='Gabumon';

SELECT * FROM animals WHERE weight_kg between 10.4 and 17.3;

/*Transaction unspecified species*/
BEGIN;
UPDATE animals SET species= 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

/*Transaction update species to digimon and pokemon*/
BEGIN;
UPDATE animals SET species= 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species= 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

/*Transaction delete all records*/
BEGIN;
DELETE FROM animals;	
ROLLBACK;
SELECT * FROM animals;

/*Transaction delete, savepoint,update, and commit*/
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg= weight_kg*-1; 
ROLLBACK TO SP1;
UPDATE animals SET weight_kg= weight_kg*-1 WHERE weight_kg < 0;
COMMIT;

/*Queries*/
SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts=0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;

SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' and '2000-12-31' GROUP BY species;


/*Queries using JOIN*/
SELECT animals.name, full_name FROM animals INNER JOIN owners ON owners.id = animals.owner_id AND owners.full_name = 'Melody Pond';

SELECT animals.name, species.name FROM animals INNER JOIN species ON species.id = animals.species_id AND species.name = 'Pokemon';

SELECT owners.full_name, animals.name FROM animals RIGHT JOIN owners ON owners.id = animals.owner_id;

SELECT species.id, species.name, COUNT(animals.name) FROM animals INNER JOIN species ON species.id = animals.species_id GROUP BY species.id;

SELECT animals.name, full_name, species.name FROM animals INNER JOIN owners ON owners.id = animals.owner_id AND owners.full_name = 'Jennifer Orwell'
    INNER JOIN species ON species.id = animals.species_id AND species.name = 'Digimon';

SELECT animals.name, owners.full_name FROM animals INNER JOIN owners ON owners.id = animals.owner_id AND owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.name) FROM animals INNER JOIN owners ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT(animals.name) DESC;

/*Queries with visits and specializations table*/
SELECT animals.name, vets.name, visits.date_of_visit FROM animals INNER JOIN visits ON visits.animals_id = animals.id
INNER JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'William Tatcher' ORDER BY visits.date_of_visit DESC;


