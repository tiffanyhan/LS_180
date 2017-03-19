1.

the result will be null

2.

ALTER TABLE employees ALTER COLUMN department SET DEFAULT 'unassigned';
UPDATE employees SET department = 'unassigned' WHERE department IS NULL;
ALTER TABLE employees ALTER COLUMN department SET NOT NULL;

3.

CREATE TABLE temperatures (
    date date NOT NULL,
    low integer NOT NULL,
    high integer NOT NULL
);

4.

INSERT INTO temperatures VALUES ('2016-03-01', 34, 43);
INSERT INTO temperatures VALUES ('2016-03-02', 32, 44);
INSERT INTO temperatures VALUES ('2016-03-03', 31, 47);
INSERT INTO temperatures VALUES ('2016-03-04', 33, 42);
INSERT INTO temperatures VALUES ('2016-03-05', 39, 46);
INSERT INTO temperatures VALUES ('2016-03-06', 32, 43);
INSERT INTO temperatures VALUES ('2016-03-07', 29, 32);
INSERT INTO temperatures VALUES ('2016-03-08', 23, 31);
INSERT INTO temperatures VALUES ('2016-03-09', 17, 28);

5.

SELECT date, (high + low) / 2 as average
  FROM temperatures
 WHERE date BETWEEN '2016-03-02' AND '2016-03-08';

6.

ALTER TABLE temperatures ADD COLUMN rainfall integer DEFAULT 0

7.

UPDATE temperatures
   SET rainfall = (high + low) / 2 - 35
 WHERE (high + low) / 2 > 35;

8.

ALTER TABLE temperatures ALTER COLUMN rainfall TYPE numeric(6,3);
UPDATE temperatures SET rainfall = rainfall * 0.039;

9.

ALTER TABLE temperatures RENAME TO weather;

10.

\d weather;

  Column  |     Type     |              Modifiers
----------+--------------+--------------------------------------
 date     | date         | not null default ('now'::text)::date
 low      | integer      | not null
 high     | integer      | not null
 rainfall | numeric(5,2) | not null default 0

11.

pg_dump -d sql-course -t weather --inserts > dump.sql
