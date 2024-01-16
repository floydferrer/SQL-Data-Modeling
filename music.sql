-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );

CREATE TABLE "albums"(
    "id" SERIAL NOT NULL,
    "album_name" TEXT NOT NULL,
    "artist" INTEGER NOT NULL
);
ALTER TABLE
    "albums" ADD PRIMARY KEY("id");

CREATE TABLE "songs"(
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "duration_in_seconds" INTEGER NOT NULL,
    "release_date" DATE NOT NULL,
    "artist" INTEGER NOT NULL,
    "producer" INTEGER NOT NULL,
    "album" INTEGER NOT NULL
);
ALTER TABLE
    "songs" ADD PRIMARY KEY("id");

CREATE TABLE "producers"(
    "id" SERIAL NOT NULL,
    "producer_name" TEXT NOT NULL
);
ALTER TABLE
    "producers" ADD PRIMARY KEY("id");

CREATE TABLE "artists"(
    "id" SERIAL NOT NULL,
    "artist_name" TEXT[] NOT NULL
);
ALTER TABLE
    "artists" ADD PRIMARY KEY("id");
ALTER TABLE
    "songs" ADD CONSTRAINT "songs_album_foreign" FOREIGN KEY("album") REFERENCES "albums"("album_name");
ALTER TABLE
    "albums" ADD CONSTRAINT "album_artist_foreign" FOREIGN KEY("artist") REFERENCES "artists"("id");
ALTER TABLE
    "songs" ADD CONSTRAINT "songs_producer_foreign" FOREIGN KEY("producer") REFERENCES "producers"("id");
ALTER TABLE
    "songs" ADD CONSTRAINT "songs_artist_foreign" FOREIGN KEY("artist") REFERENCES "artists"("id");

INSERT INTO artists
  (artist_name)
VALUES
  ('{"Hanson"}'),
  ('{"Queen"}'),
  ('{"Mariah Carey", "Boyz II Men"}'),
  ('{"Lady Gaga", "Bradley Cooper"}'),
  ('{"Nickelback"}'),
  ('{"Jay Z", "Alicia Keys"}'),
  ('{"Katy Perry", "Juicy J"}'),
  ('{"Maroon 5", "Christina Aguilera"}'),
  ('{"Avril Lavigne"}'),
  ('{"Destiny''s Child"}');

INSERT INTO producers
  (producer_name)
VALUES
  ('{"Dust Brothers", "Stephen Lironi"}'),
  ('{"Roy Thomas Baker"}'),
  ('{"Walter Afanasieff"}'),
  ('{"Benjamin Rice"}'),
  ('{"Rick Parashar"}'),
  ('{"Al Shux"}'),
  ('{"Max Martin", "Cirkut"}'),
  ('{"Shellback", "Benny Blanco"}'),
  ('{"The Matrix"}'),
  ('{"Darkchild"}');

INSERT INTO albums
  (album_name, artist)
VALUES
  ('Middle of Nowhere', 1),
  ('A Night at the Opera', 2),
  ('Daydream', 3),
  ('A Star Is Born', 4),
  ('Silver Side Up', 5),
  ('The Blueprint 3', 6),
  ('Prism', 7),
  ('Hands All Over', 8),
  ('Let Go', 9),
  ('The Writing''s on the Wall', 10);

INSERT INTO songs
  (title, duration_in_seconds, release_date, artist, producer, album)
VALUES
  ('MMMBop', 238, '04-15-1997', 1, 1, 1),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2, 2, 2),
  ('One Sweet Day', 282, '11-14-1995', 3, 3, 3),
  ('Shallow', 216, '09-27-2018', 4, 4, 4),
  ('How You Remind Me', 223, '08-21-2001', 5, 5, 5),
  ('New York State of Mind', 276, '10-20-2009', 6, 6, 6),
  ('Dark Horse', 215, '12-17-2013', 7, 7, 7),
  ('Moves Like Jagger', 201, '06-21-2011', 8, 8, 8),
  ('Complicated', 244, '05-14-2002', 9, 9, 9),
  ('Say My Name', 240, '11-07-1999', 10, 10, 10);

-- SELECT title, duration_in_seconds, release_date, artists.artist_name AS artist, producers.producer_name AS producer, albums.album_name AS album
-- FROM songs
-- JOIN artists ON songs.artist = artists.id 
-- JOIN producers ON songs.producer = producers.id
-- JOIN albums ON songs.album = albums.id;