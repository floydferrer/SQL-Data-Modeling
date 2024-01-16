DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  region TEXT NOT NULL
);

INSERT INTO regions
  (region)
VALUES
  ('San Francisco'),
  ('Atlanta'),
  ('Los Angeles'),
  ('Seattle');

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  preferred_region INTEGER REFERENCES regions(id)
);

INSERT INTO users
  (name, preferred_region)
VALUES
  ('Sans', 3),
  ('Papyrus', 3),
  ('Toby', 2),
  ('Ralsei', 4),
  ('Alphys', 1);

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO categories
  (name)
VALUES
  ('Adventure'),
  ('Comedy'),
  ('Science');

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  post_text TEXT NOT NULL,
  author INTEGER REFERENCES users(id) NOT NULL,
  category INTEGER REFERENCES categories(id) NOT NULL,
  location INTEGER REFERENCES regions(id) NOT NULL
);

INSERT INTO posts
  (title, post_text, author, category, location)
VALUES
  ('Traveltale', 'Hello .... The End?', 1, 1, 3),
  ('The Great Papyrus', 'NYEH HEH HEH', 2, 1, 3),
  ('Dog Man', 'Arf arf arf', 3, 2, 3),
  ('Magic Lessons', 'Step 1...', 4, 3, 4),
  ('Lab Experiments', 'Test 1...', 5, 3, 1);