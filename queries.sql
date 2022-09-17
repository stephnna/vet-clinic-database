/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animal WHERE name LIKE '%mon%';
SELECT * FROM animal WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT * FROM animal WHERE neutered=true AND escape_attempts<3;
SELECT name, escape_attempts FROM animal WHERE weight_kg>10.5;
SELECT date_of_birth FROM animal WHERE name='Agumon' OR name='Pikachu';
SELECT * FROM animal WHERE neutered=true;
SELECT * FROM animal WHERE name!= 'Gabumon';
SELECT * FROM animal WHERE weight_kg >= 10.4 AND weight_kg <= 17.4;


/* Second day project */
-- first transaction
update animal
set species = 'unspecified';
rollback;

-- Second transaction
begin;
update animal set species='digimon' where name like '%mon';
update animal set species='pokemon' where name not like '%mon';
COMMIT;

  
-- third transaction
 begin;
 delete from animals; -- delete all rows from table
 rollback; -- rollback all deleted rows

-- forth transaction
begin;
delete from animals where date_of_birth> '2022-01-01';
savepoint del1;
update animals set weight_kg= weight_kg*-1;
rollback to del1;
update animals set weight_kg= weight_kg*-1 where weight_kg<0;
commit;

-- grouping query
select count(*) from animals;
select count(escape_attempts) from animals where escape_attempts=0;
select avg(weight_kg) from animals;
select neutered , sum(escape_attempts) from animals group by neutered;
select species, max(weight_kg),min(weight_kg) from animals group by species;
select species , avg(escape_attempts) from animals  where date_of_birth between '1990-01-01' and '2000-01-01' group by species;

/*Queries that provide answers to the questions from third day tutorials.*/
select full_name, name from owners join animals on animals.owner_id= owners.id where full_name='Melody Pond';
select animals.name from animals join species on animals.species_id= species.id where species.name='Pokemon';
select full_name, count(name) from owners left join animals on animals.owner_id= owners.id; 
 select species.name, count(animal.name) from species join animal on animal.species_id = species.id group by species.name;
select animals.name from owners join animals on animals.owner_id= owners.id where owners.full_name='Jennifer Orwell' and animals.species_id=2;
select animals.name from owners join animals on animals.owner_id= owners.id where owners.full_name='Dean Winchester' and animals.escape_attempts=0;
select owners.full_name, count(animal.name) from owners join animal on animal.owner_id = owners.id group by owners.full_name;
