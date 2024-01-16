DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE diseases
(
  id SERIAL PRIMARY KEY,
  disease TEXT NOT NULL
);

INSERT INTO diseases
  (disease)
VALUES
  ('COVID'),
  ('Flu'),
  ('Cold');

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  patient_first_name TEXT NOT NULL,
  patient_last_name TEXT NOT NULL,
  disease_id INTEGER REFERENCES diseases(id)
);

INSERT INTO patients
  (patient_first_name, patient_last_name, disease_id)
VALUES
  ('Bluey', 'Heeler', 3),
  ('Bingo', 'Heeler', 3),
  ('Chilli', 'Heeler', 2),
  ('Bandit', 'Heeler', 1);

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  dr_first_name TEXT NOT NULL,
  dr_last_name TEXT NOT NULL,
  school TEXT NOT NULL,
  patient_id INTEGER REFERENCES patients(id)
);

INSERT INTO doctors
  (dr_first_name, dr_last_name, school, patient_id)
VALUES
  ('Lauren', 'Nguyen', 'USC', 1),
  ('Lauren', 'Nguyen', 'USC', 2),
  ('Benjamin', 'Farahnik', 'UC Berkeley', 3),
  ('Anthony', 'Fauci', 'Cornell', 4);

CREATE TABLE medical_center
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  location TEXT NOT NULL,
  doctor_id INTEGER REFERENCES doctors(id)
);

INSERT INTO medical_center
  (name, location, doctor_id)
VALUES
  ('Long Beach Memorial Center', 'Long Beach', 2),
  ('Torrance Memorial Center', 'Torrance', 1),
  ('Lakewood Regional Center', 'Lakewood', 3);
