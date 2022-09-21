CREATE TABLE patients (
id INT PRIMARY KEY NOT NULL,
name VARCHAR(250),
date_of_birth DATE,
);

CREATE TABLE medical_histories (
id INT PRIMARY KEY NOT NULL,
admitted_at DATE,
patient_id   INT,
status   INT
foreign key(patient_id) references patients(id),
);


CREATE TABLE invoices (
id INT PRIMARY KEY NOT NULL,
total_amount DECIMAL,
generated_at   TIMESTAMP,
payed_at     TIMESTAMP,
medical_history_id INT,
foreign key(medical_history_id) references medical_histories(id)
);

CREATE TABLE invoice_items (
id INT PRIMARY KEY NOT NULL,
unit_price DECIMAL,
quantity   INT
total_price DECIMAL,
invoice_id     INT,
treatment_id    INT,
foreign key(invoice_id) references invoices(id),
foreign key(treatment_id) references treatments(id),
);

CREATE TABLE treatments (
id INT PRIMARY KEY NOT NULL,
time VARCHAR(250),
name  VARCHAR(250)
);

CREATE TABLE medicalTreatments (
    medical_histories_id int, 
    treatment_id int,   
    PRIMARY key(medical_histories_id, treatment_id),
    foreign key(medical_histories_id) references medical_histories(id),
    foreign key(treatment_id) references treatments(id)
);
