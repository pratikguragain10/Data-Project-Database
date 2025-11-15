
-- CREATE USER, DATABASE, AND TABLES

-- CREATE USER

CREATE USER ipluser WITH PASSWORD 'ipl@10';

-- CREATE DATABASE OWNED BY IPLUSER

CREATE DATABASE ipldb
    WITH OWNER = ipluser
    TEMPLATE template0
    ENCODING 'UTF8';

-- CONNECT TO THE DATABASE

\c ipldb;


-- CREATE MATCHES TABLE

CREATE TABLE matches (
    id                INTEGER PRIMARY KEY,
    season            INTEGER,
    city              TEXT,
    date              TEXT,
    team1             TEXT,
    team2             TEXT,
    toss_winner       TEXT,
    toss_decision     TEXT,
    result            TEXT,
    dl_applied        INTEGER,
    winner            TEXT,
    win_by_runs       INTEGER,
    win_by_wickets    INTEGER,
    player_of_match   TEXT,
    venue             TEXT,
    umpire1           TEXT,
    umpire2           TEXT,
    umpire3           TEXT
);

-- CREATE DELIVERIES TABLE

CREATE TABLE deliveries (
    match_id          INTEGER,
    inning            INTEGER,
    batting_team      TEXT,
    bowling_team      TEXT,
    over              INTEGER,
    ball              INTEGER,
    batsman           TEXT,
    non_striker       TEXT,
    bowler            TEXT,
    is_super_over     INTEGER,
    wide_runs         INTEGER,
    bye_runs          INTEGER,
    legbye_runs       INTEGER,
    noball_runs       INTEGER,
    penalty_runs      INTEGER,
    batsman_runs      INTEGER,
    extra_runs        INTEGER,
    total_runs        INTEGER,
    player_dismissed  TEXT,
    dismissal_kind    TEXT,
    fielder           TEXT
);

-- CREATE UMPIRES TABLE

CREATE TABLE umpires (
    umpire    TEXT,
    country TEXT
);
