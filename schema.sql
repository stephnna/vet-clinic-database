/* Database schema to keep the structure of entire database. */

CREATE TABLE animal (
id INT PRIMARY KEY NOT NULL,
name VARCHAR(250),
date_of_birth DATE,
excape_attempts INT,
neutered BOOLEAN,
weight_kg DECIMAL,
);

 ALTER TABLE animal
ADD COLUMN species VARCHAR(250);
