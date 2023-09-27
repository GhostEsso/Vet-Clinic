CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    date_of_birth DATE
);

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at TIMESTAMP, 
    patient_id FOREIGN KEY, 
    status VARCHAR(20)
);

