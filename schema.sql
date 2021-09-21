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
    species VARCHAR(30),
    PRIMARY KEY (id)
);
