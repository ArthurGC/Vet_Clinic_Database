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
