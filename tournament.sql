-- Table definitions for the tournament project.

-- Dropping the existing DATABASE will help avoid possible errors:
DROP DATABASE IF EXISTS tournament;

CREATE DATABASE tournament;

-- Now we have to connect to the newly created database:
\c tournament;

-- Create tables and views inside the 'tournament' database:
-- This table shows the ids and names of players
CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT
    );

-- Shows the winner and loser ids for each match
CREATE TABLE each_match (
    winner_id INTEGER references players,
    loser_id INTEGER references players,
    PRIMARY KEY(winner_id, loser_id)
    );

-- Shows how many wins each player has
CREATE VIEW wins AS
    SELECT players.id, count(each_match.winner_id)
    AS wins
    FROM players
    LEFT JOIN each_match
    ON players.id=each_match.winner_id
    GROUP BY players.id
    ORDER BY wins
    DESC;

-- Shows how many matches each player played
CREATE VIEW matches AS
    SELECT players.id, count(each_match.*)
    AS matches
    FROM players
    LEFT JOIN each_match
    ON players.id=each_match.winner_id
    OR players.id=each_match.loser_id
    GROUP BY players.id
    ORDER BY players.id;

-- Shows the list of players and their wins and matches
CREATE VIEW player_standings AS
    SELECT players.id, players.name,
    wins.wins, matches.matches
    FROM players
    JOIN wins
    ON players.id=wins.id
    JOIN matches
    ON wins.id=matches.id
    ORDER BY wins.wins
    DESC, players.id
    ASC;


