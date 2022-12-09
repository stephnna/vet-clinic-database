/* Populate database with sample data. */

INSERT INTO animal (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '02-03-2020', 0, TRUE, 10.23);
INSERT INTO animal (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '11-15-2018', 2, TRUE, 8);
INSERT INTO animal (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '07-01-2021', 1, False, 15.04);
INSERT INTO animal (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '05-12-2017',5, True, 11);

/* Insert more animal */
INSERT INTO animal (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '08-02-2020', 0, False, 11);
INSERT INTO animal (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '15-11-2021', 2, True, 5.7);
INSERT INTO animal (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '02-04-1993', 3, False, 12.13);
INSERT INTO animal (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '07-06-2005', 7, True, 20.04);
INSERT INTO animal (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '14-05-2022', 4, True, 22);

-- Third day
insert into owners (full_name,age) values 
('Sam Smith',34),
('Jennifer Orwell',19),
('Bob',45),
('Melody Pond',77),
('Dean Winchester',14),
('Jodie Whittaker',38)
;

insert into species (name) values 
('Pokemon'),
('Digimon')
;
-- update animals table
update animals set species_id='1' where name not like '%mon';
update animals set species_id='2' where name like '%mon';

update animals set owner_id=1  where name='Agumon';
update animals set owner_id=2  where name='Gabumon' or name='Pikachu';
update animals set owner_id=3  where name='devimon' or name='Plantmon';  
update animals set owner_id=4  where name='Charmander' or name='Squirtle' or name='Blossom';
update animals set owner_id=5  where name='Angemon' or name='Boarmon'; 


insert into vets (name,age,date_of_graduation) values 
('William Tatcher',45,'2000-04-23'),
('Maisy Smith',26,'2019-01-17'),
('Stephanie Mendez',64,'1981-05-04'),
('Jack Harkness',38,'2008-06-08');

insert into specializations (vet_id,species_id) values 
(1,1),
(3,1),
(3,2),
(4,2)
;

insert into visits (animal_id,vet_id,date_of_visit)
 values
 (1,1,'2020-04-24'),
 (1,3,'2020-07-22'),
 (2,4,'2021-02-02'),
 (3,2,'2020-01-05'),
 (3,2,'2020-03-08'),
 (3,2,'2020-05-14'),
 (4,3,'2021-05-04'),
 (5,4,'2021-02-24'),
 (6,2,'2019-12-21'),
 (6,1,'2020-08-10'),
 (6,2,'2021-04-07'),
 (7,3,'2019-09-29'),
 (11,4,'2020-10-03'),
 (11,3,'2020-11-04'),
 (8,2,'2019-01-24'),
 (8,2,'2020-02-27'),
 (8,2,'2020-08-03'),
 (12,3,'2020-05-24'),
 (12,1,'2021-11-01'),
 (8,2,'2019-05-15');