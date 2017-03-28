1.

INSERT INTO calls ("when", duration, contact_id) VALUES ('2016-01-18 14:47:00', 632, 6);

2.

SELECT calls.when, calls.duration, contacts.first_name
  FROM calls JOIN contacts ON calls.contact_id = contacts.id
  WHERE contacts.first_name != 'William' AND contacts.last_name != 'Swift';

3.

INSERT INTO contacts
  (first_name, last_name, number)
  VALUES
  ('Merve', 'Elk', 6343511126),
  ('Sawa', 'Fyodorov', 6125594874);

INSERT INTO calls
  ("when", duration, contact_id)
  VALUES
  ('2016-01-17 11:52:00', 175, 27),
  ('2016-01-18 21:22:00', 79, 28);

4.

ALTER TABLE contacts ADD CONSTRAINT number_unique UNIQUE (number);

5.

ERROR:  duplicate key value violates unique constraint "uniq_number"
DETAIL:  Key (number)=(6343511126) already exists.

6.

it's a reserved keyword in postgres

7.

