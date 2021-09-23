/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

\connect vet_clinic

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(30),
    date_of_birth date,
    escape_attempts INT,
    neutered boolean,
    weight_kg decimal,
    PRIMARY KEY (id)
);
/*Add species column*/
ALTER TABLE animals
    ADD COLUMN species VARCHAR(30);

/*Create owners table*/
CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(30),
    age INT,
    PRIMARY KEY (id)
);

/*Create species table*/
CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(30),
    PRIMARY KEY (id)
);

/*Modify animals table*/
ALTER TABLE animals 
    DROP COLUMN species;
ALTER TABLE animals
    ADD COLUMN species_id INT;
ALTER TABLE animals
    ADD COLUMN owner_id INT;
ALTER TABLE animals 
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id) 
REFERENCES species (id);
ON DELETE CASCADE;

ALTER TABLE animals 
ADD CONSTRAINT fk_owner
FOREIGN KEY (owner_id) 
REFERENCES owners (id);
ON DELETE CASCADE;

/*Create vets table*/
CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(30),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY (id)
);

/*Create nany-to-many relationship tables*/
CREATE TABLE specializations (
	vets_id INT NOT NULL,
	species_id INT NOT NULL,
	FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE CASCADE,
	FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE CASCADE,
	PRIMARY KEY (vets_id, species_id)
);

CREATE TABLE visits (
	vets_id INT NOT NULL,
	animals_id INT NOT NULL,
    date_of_visit DATE,
	FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE CASCADE,
	FOREIGN KEY (animals_id) REFERENCES animals (id) ON DELETE CASCADE,
	PRIMARY KEY (vets_id, animals_id, date_of_visit)
);
