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


/*Queries that provide answers to the questions from Fourth day tutorials.*/

select animals.name, visits.date_of_visit,vets.name from vets join visits on vets.id=visits.vet_id join animals on animals.id=visits.animal_id where vets.name='William Tatcher' order by visits.date_of_visit desc limit 1;
select count(animals.name),vets.name from vets join visits on vets.id=visits.vet_id join animals on animals.id=visits.animal_id where vets.name='Stephanie Mendez' group by vets.name;
select vets.name ,species.name from vets join specializations on vets.id=specializations.vet_id join species on species.id = specializations.species_id;
select animals.name from vets join visits on vets.id=visits.vet_id join animals on  animals.id=visits.animal_id where vets.name='Stephanie Mendez' and visits.date_of_visit between  '2020-04-1' and '2020-08-30';
select count(animals.name),animals.name from vets join visits on vets.id=visits.vet_id join animals on animals.id=visits.animal_id group by animals.name order by count desc limit 1;
select animals.name, visits.date_of_visit,vets.name from vets join visits on vets.id=visits.vet_id join animals on animals.id=visits.animal_id where vets.name='Maisy Smith' order by visits.date_of_visit desc limit 1;
select count(animals.name),animals.name from vets join visits on vets.id=visits.vet_id join animals on animals.id=visits.animal_id group by animals.name order by count desc limit 1;

select animals.name,animals.date_of_birth,
escape_attempts,
weight_kg,neutered, 
vets.name ,
vets.age,
vets.date_of_graduation,
 visits.date_of_visit 
from vets 
join visits on vets.id=visits.vet_id 
join animals on animals.id=visits.animal_id 
order by visits.date_of_visit desc limit 1;

SELECT
  COUNT(*)
FROM
  visits
  RIGHT JOIN animals ON animals.id = visits.animal_id
  RIGHT JOIN vets ON vets.id = visits.vet_id
  LEFT JOIN specializations ON specializations.vet_id = vets.id
  LEFT JOIN species ON specializations.species_id = species.id
WHERE
  specializations.species_id <> animals.species_id;

  SELECT
  species.name,
  COUNT(*)
FROM
  visits
  RIGHT JOIN animals ON animals.id = visits.animal_id
  RIGHT JOIN vets ON vets.id = visits.vet_id
  RIGHT JOIN species ON animals.species_id = species.id
WHERE
  vets.name = 'Maisy Smith'
GROUP BY
  species.name
ORDER BY
  count DESC
LIMIT
  1;
