1.

psql -d films < films4.sql

2.

INSERT INTO films (title, year, genre, director, duration)
  VALUES ('The Bourne Identity', 2002, 'espionage', 'Doug Liman', 118);
INSERT INTO films (title, year, genre, director, duration)
  VALUES ('Wayne''s World', 1992, 'comedy', 'Penelope Spheeris', 95);

3.

SELECT DISTINCT genre FROM films;

4.

SELECT genre FROM films GROUP BY genre;

5.

SELECT ROUND(AVG(duration)) FROM films;

6.

SELECT genre, ROUND(AVG(duration)) AS average_duration FROM films GROUP BY genre;

7.

SELECT * FROM films WHERE director LIKE 'John %';

8.

SELECT genre, count(films.id) FROM films GROUP BY genre ORDER BY count DESC;

9.

SELECT genre, count(*)
FROM films
GROUP BY genre
ORDER BY count DESC;

10.

SELECT year / 10 * 10 AS decade, genre, string_agg(title, ', ') AS films
  FROM films GROUP BY decade, genre ORDER BY decade, genre;

11.

SELECT genre, sum(duration) AS total_duration
  FROM films GROUP BY genre ORDER BY total_duration ASC;
