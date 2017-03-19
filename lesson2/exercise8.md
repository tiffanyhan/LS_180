1.

CREATE SEQUENCE counter;

2.

SELECT nextval('counter');

3.

DROP SEQUENCE counter;

4.

CREATE SEQUENCE even_counter INCREMENT BY 2 MINVALUE 2;

5.

regions_id_seq

6.

ALTER TABLE films ADD COLUMN id serial PRIMARY KEY;

7.

ERROR:  duplicate key value violates unique constraint "films_pkey"
DETAIL:  Key (id)=(1) already exists.

8.

ERROR:  multiple primary keys for table "films" are not allowed

9.

ALTER TABLE films DROP CONSTRAINT films_pkey;
