-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  star TEXT NOT NULL
);

INSERT INTO stars
  (star)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  galaxy TEXT NOT NULL
);

INSERT INTO galaxies
  (galaxy)
VALUES
  ('Milky Way');

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  moon TEXT NOT NULL
);

INSERT INTO moons
  (moon)
VALUES
  ('None'),
  ('The Moon'),
  ('Phobos'),
  ('Deimos'),
  ('Naiad'),
  ('Thalassa'),
  ('Despina'),
  ('Galatea'),
  ('Larissa'),
  ('S/2004 N 1'),
  ('Proteus'),
  ('Triton'),
  ('Nereid'),
  ('Halimede'),
  ('Sao'),
  ('Laomedeia'),
  ('Psamathe'),
  ('Neso');


CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  planet TEXT NOT NULL
);

INSERT INTO planets
  (planet)
VALUES
  ('Earth'),
  ('Mars'),
  ('Venus'),
  ('Neptune'),
  ('Proxima Centauri b'),
  ('Gliese 876 b');

  CREATE TABLE orbits
(
  id SERIAL PRIMARY KEY,
  planet INTEGER REFERENCES planets NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES stars NOT NULL,
  galaxy INTEGER REFERENCES galaxies NOT NULL,
  moon INTEGER REFERENCES moons
);

INSERT INTO orbits
  (planet, orbital_period_in_years, orbits_around, galaxy, moon)
VALUES
  (1, 1.00, 1, 1, 2),
  (2, 1.88, 1, 1, 3),
  (2, 1.88, 1, 1, 4),
  (3, 0.62, 1, 1, 1),
  (4, 164.8, 1, 1, 5),
  (4, 164.8, 1, 1, 6),
  (4, 164.8, 1, 1, 7),
  (4, 164.8, 1, 1, 8),
  (4, 164.8, 1, 1, 9),
  (4, 164.8, 1, 1, 10),
  (4, 164.8, 1, 1, 11),
  (4, 164.8, 1, 1, 12),
  (4, 164.8, 1, 1, 13),
  (4, 164.8, 1, 1, 14),
  (4, 164.8, 1, 1, 15),
  (4, 164.8, 1, 1, 16),
  (4, 164.8, 1, 1, 17),
  (4, 164.8, 1, 1, 18),
  (5, 0.03, 2, 1, 1),
  (6, 0.23, 3, 1, 1);

--View sum of moons by planet
-- SELECT planets.planet AS planet, stars.star AS orbits_around, galaxies.galaxy AS galaxy, COUNT(moons.moon) AS moons
--   FROM orbits
--   JOIN planets ON orbits.planet = planets.id
--   JOIN stars ON orbits.orbits_around = stars.id
--   JOIN galaxies ON orbits.galaxy = galaxies.id
--   JOIN moons ON orbits.moon = moons.id
--   GROUP BY planets.planet, stars.star, galaxies.galaxy
--   ORDER BY planet;