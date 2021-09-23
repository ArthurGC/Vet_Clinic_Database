/* Populate database with sample data. */

/* Data for first step*/
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Agumon', '2020-02-3', 0, TRUE, 10.23);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Gabumon', '2018-11-15', 2, TRUE, 8);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Pikachu', '2021-01-7', 1, FALSE, 15.04);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Devimon', '2017-05-12', 5, TRUE, 11);

/* Data for second step*/
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Charmander', '2020-02-8', 0, FALSE, -11);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Plantmon', '2022-11-15', 2, TRUE, -5.7);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Squirtle', '1993-04-2', 3, FALSE, -12.13);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Angemon', '2005-06-12', 1, TRUE, -45);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Boarmon', '2005-06-7', 7, TRUE, 20.4);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Blossom', '1998-10-13', 3, TRUE, 17);

/* Data for third step*/
/*Data for owners table*/
INSERT INTO owners (full_name, age)
	VALUES('Sam Smith', 34);
INSERT INTO owners (full_name, age)
	VALUES('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age)
	VALUES('Bob', 45);
INSERT INTO owners (full_name, age)
	VALUES('Melody Pond', 77);
INSERT INTO owners (full_name, age)
	VALUES('Dean Winchester', 14);
INSERT INTO owners (full_name, age)
	VALUES('Jodie Whittaker', 38);
/*Data for species table*/
INSERT INTO species (name)
	VALUES('Pokemon');
INSERT INTO species (name)
	VALUES('Digimon');

/*Modify species_id in animals table*/
UPDATE animals SET species_id= '2' WHERE name LIKE '%mon';
UPDATE animals SET species_id= '1' WHERE species_id IS NULL;

/*Modify owner_id in animals table*/
UPDATE animals SET owner_id = owners.id FROM owners WHERE name = 'Agumon' AND owners.full_name= 'Sam Smith' ;
UPDATE animals SET owner_id = owners.id FROM owners WHERE name IN ('Gabumon','Pikachu') AND owners.full_name= 'Jennifer Orwell';
UPDATE animals SET owner_id = owners.id FROM owners WHERE name IN ('Devimon','Plantmon') AND owners.full_name= 'Bob';
UPDATE animals SET owner_id = owners.id FROM owners WHERE name IN ('Charmander','Squirtle', 'Blossom') AND owners.full_name= 'Melody Pond';
UPDATE animals SET owner_id = owners.id FROM owners WHERE name IN ('Angemon','Boarmon') AND owners.full_name= 'Dean Winchester';

/*Add new data to vets table*/
INSERT INTO vets (name, age, date_of_graduation)
	VALUES('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation)
	VALUES('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation)
	VALUES('Stephanie Mendez', 64, '1981-05-4');
INSERT INTO vets (name, age, date_of_graduation)
	VALUES('Jack Harkness', 38, '2008-06-8');

/*Add specialities vets-species*/
INSERT INTO specializations (vets_id, species_id)
	VALUES(1,1);
INSERT INTO specializations (vets_id, species_id)
	VALUES(3,1);
INSERT INTO specializations (vets_id, species_id)
	VALUES(4,2);

/*Add visits data*/
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(1,1,'2020-05-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(1,3,'2020-07-22');
	
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(2,4,'2021-02-2');

INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(3,2,'2020-01-5');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(3,2,'2020-03-8');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(3,2,'2020-05-14');
	
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(4,3,'2021-05-4');
	
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(5,4,'2021-02-24');
	
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(6,2,'2019-12-21');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(6,1,'2020-08-10');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(6,2,'2021-04-7');
	
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(7,3,'2019-09-29');
	
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(8,4,'2020-10-3');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(8,4,'2020-11-4');

INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(9,2,'2019-01-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(9,2,'2019-05-15');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(9,2,'2020-02-27');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(9,2,'2020-08-3');
	
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(10,3,'2020-05-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(10,1,'2021-01-11');
