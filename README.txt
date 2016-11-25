README file for the program 'tournament' written by Iurie Popovici.

Running the program
To successfully run the program the machine needs to have PostgreSQL and Python 2.7 installed. Next the user has to create the database, tables and views(from tournament.sql) by typing the folowing commands in terminal:

> psql
> \i tournament.sql

Quit the psql command line interface:

> \q

Run the tests to verify if the program works properly:

> python tournament_test.py

Read the output to make sure all tests pass.

Files included:
1. tournament.py - a python module for keeping track of players, matches and wins in a game tournament that uses the Swiss system for pairing up players in each round;
2. tournament_test.py - contains unit tests that checks the functions written in 'tournament.py';
3. tournament.sql - contains the database schema for the 'tournament' project
4. README file

