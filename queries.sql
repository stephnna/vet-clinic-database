/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animal WHERE name LIKE '%mon%';
SELECT * FROM animal WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT * FROM animal WHERE neutered=true AND escape_attempts<3;
SELECT name, escape_attempts FROM animal WHERE weight_kg>10.5;
SELECT date_of_birth FROM animal WHERE name='Agumon' OR name='Pikachu';
SELECT * FROM animal WHERE neutered=true;
SELECT * FROM animal WHERE name!= 'Gabumon';
SELECT * FROM animal WHERE weight_kg >= 10.4 AND weight_kg <= 17.4;



