1.

a. the file creates a table and inserts data into it
b. the table doesn't already exist, so no need to drop.
   creates the table, inserts each row into it.
c. the first line checks to see if the table already exists,
   and if it does drops it.

2.

SELECT * FROM films;

3.

SELECT * FROM films WHERE length(title) < 12;

4.

ALTER TABLE films ADD COLUMN director varchar(255);
ALTER TABLE films ADD COLUMN duration integer;

5.

UPDATE films SET director = 'John McTiernan', duration = 132 WHERE title = 'Die Hard';
UPDATE films SET director = 'Michael Curtiz', duration = 102 WHERE title = 'Casablanca';
UPDATE films SET director = 'Francis Ford Coppola', duration = 113 WHERE title = 'The Conversation';

6.

INSERT INTO films(title, year, genre, director, duration) VALUES ('1984', 1956, 'scifi', 'Michael Anderson', 90);
INSERT INTO films(title, year, genre, director, duration) VALUES ('Tinker Tailor Soldier Spy', 2011, 'espionage', 'Tomas Alfredson', 127);
INSERT INTO films(title, year, genre, director, duration) VALUES ('The Birdcage', 1996, 'comedy', 'Mike Nichols', 118);

7.

SELECT title, extract(year from current_date) - year AS age FROM films ORDER BY age ASC;

8.

SELECT title, duration FROM films WHERE duration > 120 ORDER BY duration DESC;

9.

SELECT title FROM films ORDER BY duration DESC LIMIT 1;
