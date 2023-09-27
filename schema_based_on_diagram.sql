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

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR(50),
    name VARCHAR(50)
);

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL , 
    generated_at TIMESTAMP,
    payed_at TIMESTAMP, 
    medical_historY_id FOREIGN KEY 
);

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL,
    quantity INTEGER,
    total_price DECIMAL,
    invoice_id FOREIGN KEY,
    treatment_id FOREIGN KEY
);
