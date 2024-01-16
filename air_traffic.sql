-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  country TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INTEGER REFERENCES airlines NOT NULL,
  from_city INTEGER REFERENCES cities NOT NULL,
  from_country INTEGER REFERENCES countries NOT NULL,
  to_city INTEGER REFERENCES cities NOT NULL,
  to_country INTEGER REFERENCES countries NOT NULL,
  passenger INTEGER REFERENCES passengers NOT NULL
);

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO airlines
  (airline)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO countries
  (country)
VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('Mexico'),
  ('France'),
  ('Morocco'),
  ('UAE'),
  ('China'),
  ('Brazil'),
  ('Chile');

INSERT INTO cities
  (city)
VALUES
  ('Washington DC'),
  ('Seattle'),
  ('Tokyo'),
  ('London'),
  ('Los Angeles'),
  ('Las Vegas'),
  ('Mexico City'),
  ('Paris'),
  ('Casablanca'),
  ('Dubai'),
  ('Beijing'),
  ('New York'),
  ('Charlotte'),
  ('Cedar Rapids'),
  ('Chicago'),
  ('New Orleans'),
  ('San Paolo'),
  ('Santiago');

INSERT INTO flights
  (departure, arrival, airline, from_city, from_country, to_city, to_country, passenger)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 2, 1, 1),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 2, 4, 3, 2),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 1, 6, 1, 3),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 1, 7, 4, 1),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 5, 9, 6, 4),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 7, 11, 8, 2),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 1, 13, 1, 5),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 1, 15, 1, 6),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 1, 16, 1, 5),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 9, 18, 10, 7);

-- SELECT flights.id, airlines.airline,
-- CASE WHEN from_city = fc.id THEN fc.city END AS from_city,
-- CASE WHEN from_country = cf.id THEN cf.country END AS from_country,
-- CASE WHEN to_city = tc.id THEN tc.city END AS to_city,
-- CASE WHEN to_country = ct.id THEN ct.country END AS to_country,
-- departure, arrival, passengers.first_name AS p_first_name, passengers.last_name AS p_last_name
-- FROM flights
-- JOIN airlines ON flights.airline = airlines.id
-- JOIN cities fc ON flights.from_city = fc.id
-- JOIN cities tc ON flights.to_city = tc.id
-- JOIN countries cf ON flights.from_country = cf.id
-- JOIN countries ct ON flights.to_country = ct.id
-- JOIN passengers ON flights.passenger = passengers.id
-- ORDER BY departure;
