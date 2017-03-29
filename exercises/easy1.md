1.

createdb animals

2.

CREATE TABLE birds(
  id serial PRIMARY KEY,
  name character varying(25),
  age integer,
  species character varying(15)
);

3.

INSERT INTO birds (name, age, species) VALUES ('Charlie', 3, 'Finch');
INSERT INTO birds (name, age, species) VALUES ('Allie', 5, 'Owl');
INSERT INTO birds (name, age, species) VALUES ('Jennifer', 3, 'Magpie');
INSERT INTO birds (name, age, species) VALUES ('Jamie', 4, 'Owl');
INSERT INTO birds (name, age, species) VALUES ('Roy', 8, 'Crow');

4.

SELECT * FROM birds;

5.

SELECT * FROM birds WHERE age < 5;

6.

UPDATE birds SET species = 'Raven' WHERE species = 'Crow';

7.

DELETE FROM birds WHERE age=3 AND species='Finch';

8.

ALTER TABLE birds ADD CHECK (age > 0);

9.

DROP TABLE birds;

10.

dropdb animals
