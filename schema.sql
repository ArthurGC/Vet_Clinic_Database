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
)

/*Create species table*/
CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(30),
    PRIMARY KEY (id)
)
