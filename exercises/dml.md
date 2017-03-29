1.

CREATE DATABASE workshop;

\c workshop

CREATE TABLE devices (
  id serial PRIMARY KEY,
  name text NOT NULL,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE parts (
  id serial PRIMARY KEY,
  part_number integer UNIQUE NOT NULL,
  device_id integer REFERENCES devices (id)
);

2.

INSERT INTO devices (name) VALUES ('Accelerometer');
INSERT INTO devices (name) VALUES ('Gyroscope');

INSERT INTO parts (part_number, device_id) VALUES (12, 1);
INSERT INTO parts (part_number, device_id) VALUES (14, 1);
INSERT INTO parts (part_number, device_id) VALUES (16, 1);

INSERT INTO parts (part_number, device_id) VALUES (31, 2);
INSERT INTO parts (part_number, device_id) VALUES (33, 2);
INSERT INTO parts (part_number, device_id) VALUES (35, 2);
INSERT INTO parts (part_number, device_id) VALUES (37, 2);
INSERT INTO parts (part_number, device_id) VALUES (39, 2);

INSERT INTO parts (part_number) VALUES (50);
INSERT INTO parts (part_number) VALUES (54);
INSERT INTO parts (part_number) VALUES (58);

3.

SELECT devices.name, parts.part_number FROM devices
INNER JOIN parts ON devices.id = parts.device_id;

4.

SELECT * FROM parts WHERE part_number::text LIKE '3%';

5.

SELECT devices.name AS name, COUNT(parts.device_id) FROM devices
JOIN parts ON devices.id = parts.device_id GROUP BY devices.name;

6.

SELECT devices.name AS name, COUNT(parts.device_id)
FROM devices
JOIN parts ON devices.id = parts.device_id
GROUP BY devices.name
ORDER BY devices.name ASC;

7.

SELECT part_number, device_id FROM parts
WHERE device_id IS NULL;

SELECT part_number, device_id FROM parts
WHERE device_id IS NOT NULL;

8.

SELECT name AS oldest_device
 FROM devices
ORDER BY created_at ASC
LIMIT 1;

9.

UPDATE parts SET device_id = 1
WHERE part_number=37 OR part_number=39;

10.


DELETE FROM parts WHERE device_id = 1;
DELETE FROM devices WHERE name = 'Accelerometer';
