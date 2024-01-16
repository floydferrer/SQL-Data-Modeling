DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  team TEXT UNIQUE NOT NULL
);

INSERT INTO teams
  (team)
VALUES
  ('Lakers'),
  ('Celtics'),
  ('Heat'),
  ('Knicks');

CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  team_name INTEGER REFERENCES teams(id) NULL
);

INSERT INTO players
  (name, team_name)
VALUES
  ('Kobe Bryant', 1),
  ('Larry Bird', 2),
  ('Dwyane Wade', 3),
  ('Julius Randle', 4);

CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO referees
    (name)
VALUES
  ('Ref 1'),
  ('Ref 2');

CREATE TABLE seasons
(
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

INSERT INTO seasons
  (start_date, end_date)
VALUES
  ('2022-10-16', '2023-06-04');


CREATE TABLE matches
(
  id SERIAL PRIMARY KEY,
  team_1 TEXT REFERENCES teams(team) NOT NULL,
  team_2 TEXT REFERENCES teams(team) NOT NULL,
  match_date TEXT NOT NULL,
  referee INTEGER REFERENCES referees(id) NOT NULL
);

INSERT INTO matches
  (team_1, team_2, match_date, referee)
VALUES
    ('Lakers', 'Celtics', '1/1/23', 1),
    ('Heat', 'Knicks', '1/1/23', 2),
    ('Lakers', 'Heat', '1/2/23', 1),
    ('Celtics', 'Knicks', '1/2/23', 2),
    ('Knicks', 'Lakers', '1/3/23', 1),
    ('Heat', 'Celtics', '1/3/23', 2);

CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  player INTEGER REFERENCES players(id) NOT NULL,
  team TEXT REFERENCES teams(team) NOT NULL,
  goal_time TEXT NOT NULL,
  match INTEGER REFERENCES matches(id)
);

INSERT INTO goals
  (player, team, goal_time, match)
VALUES
  (1, 'Lakers', '3:36', 1),
  (1, 'Lakers', '5:50', 1),
  (1, 'Lakers', '9:10', 1),
  (1, 'Lakers', '7:12', 3),
  (1, 'Lakers', '8:12', 3),
  (1, 'Lakers', '8:17', 5),
  (1, 'Lakers', '9:05', 5),
  (2, 'Celtics', '5:47', 1),
  (2, 'Celtics', '6:40', 4),
  (2, 'Celtics', '10:30', 4),
  (2, 'Celtics', '11:40', 6),
  (3, 'Heat', '1:23', 2),
  (3, 'Heat', '2:23', 3),
  (3, 'Heat', '3:53', 6),
  (3, 'Heat', '4:23', 6),
  (4, 'Knicks', '4:44', 4),
  (4, 'Knicks', '9:44', 5);

CREATE TABLE results
(
  id SERIAL PRIMARY KEY,
  match INTEGER REFERENCES matches(id),
  team TEXT REFERENCES teams(team) NOT NULL,
  result TEXT NOT NULL
);

INSERT INTO results
    (match, team, result)
VALUES
    (1, 'Lakers', 'W'),
    (1, 'Celtics', 'L'),
    (2, 'Heat', 'W'),
    (2, 'Knicks', 'L'),
    (3, 'Lakers', 'W'),
    (3, 'Heat', 'L'),
    (4, 'Celtics', 'W'),
    (4, 'Knicks', 'L'),
    (5, 'Lakers', 'W'),
    (5, 'Knicks', 'L'),
    (6, 'Heat', 'W'),
    (6, 'Celtics', 'L');


