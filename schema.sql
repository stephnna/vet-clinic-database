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

-- third day

create table owners(
ID INT GENERATED ALWAYS AS IDENTITY,
full_name VARCHAR(100),
age INT,
PRIMARY key(ID)
);

create table species(
ID INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(100),
PRIMARY key(ID)
);

alter table animals drop column species; -- drop column species from table animals
alter table animals add column species_id INT ;
alter table animals add constraint constraint_fk foreign key (species_id) references species(ID) on delete cascade; -- add column species_id to table animals
alter table animals add column owner_id INT ;
alter table animals add constraint constraint_ownerid foreign key (owner_id) references owners(ID) on delete cascade; -- add column owner_id to table animals


-- Forth day
create table vets(
ID INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(100),
age INT,
date_of_graduation DATE,
PRIMARY key(ID)
);

create table specialization(
    species_id int ,
    vet_id int,
    PRIMARY key(species_id,vet_id),
    foreign key(species_id) references species(id),
    foreign key(vet_id) references vets(id)
);

create table visits(
    animal_id int,
    vet_id int,
    date_of_visit DATE,
    PRIMARY key(animal_id,vet_id,date_of_visit),
    foreign key(animal_id) references animals(id),
    foreign key(vet_id) references vets(id)
);