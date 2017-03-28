1.

psql -d films < films7.sql

2.

ALTER TABLE films ADD COLUMN id serial PRIMARY KEY;

3.

CREATE TABLE directors_films (
  id serial PRIMARY KEY,
  director_id integer REFERENCES directors (id),
  film_id integer REFERENCES films (id)
);

4.

INSERT INTO directors_films (film_id, director_id) VALUES (1, 1);
INSERT INTO directors_films (film_id, director_id) VALUES (2, 2);
INSERT INTO directors_films (film_id, director_id) VALUES (3, 3);
INSERT INTO directors_films (film_id, director_id) VALUES (4, 4);
INSERT INTO directors_films (film_id, director_id) VALUES (5, 5);
INSERT INTO directors_films (film_id, director_id) VALUES (6, 6);
INSERT INTO directors_films (film_id, director_id) VALUES (7, 3);
INSERT INTO directors_films (film_id, director_id) VALUES (8, 7);
INSERT INTO directors_films (film_id, director_id) VALUES (9, 8);
INSERT INTO directors_films (film_id, director_id) VALUES (10, 4);

5.

ALTER TABLE films DROP COLUMN director_id;

6.

SELECT films.title, directors.name
  FROM films
    INNER JOIN directors_films ON directors_films.film_id = films.id
    INNER JOIN directors ON directors.id = directors_films.director_id
  ORDER BY films.title ASC;

7.

INSERT INTO films (title, year, genre, duration) VALUES ('Fargo', 1996, 'comedy', 98);
INSERT INTO directors (name) VALUES ('Joel Coen');
INSERT INTO directors (name) VALUES ('Ethan Coen');
INSERT INTO directors_films (director_id, film_id) VALUES (9, 11);

INSERT INTO films (title, year, genre, duration) VALUES ('No Country for Old Men', 2007, 'western', 122);
INSERT INTO directors_films (director_id, film_id) VALUES (9, 12);
INSERT INTO directors_films (director_id, film_id) VALUES (10, 12);

INSERT INTO films (title, year, genre, duration) VALUES ('Sin City', 2005, 'crime', 124);
INSERT INTO directors (name) VALUES ('Frank Miller');
INSERT INTO directors (name) VALUES ('Robert Rodriguez');
INSERT INTO directors_films (director_id, film_id) VALUES (11, 13);
INSERT INTO directors_films (director_id, film_id) VALUES (12, 13);

INSERT INTO films (title, year, genre, duration) VALUES ('Spy Kids', 2001, 'scifi', 88) RETURNING id;
INSERT INTO directors_films (director_id, film_id) VALUES (12, 14);

8.

SELECT directors.name AS director, COUNT(directors_films.film_id) AS films
  FROM directors
    INNER JOIN directors_films ON directors.id = directors_films.director_id
  GROUP BY directors.id
  ORDER BY films DESC, directors.name ASC;
