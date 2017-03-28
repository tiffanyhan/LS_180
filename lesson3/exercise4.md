2.

INSERT INTO products
(name)
VALUES
('small bolt'),
('large bolt');

INSERT INTO orders
  (product_id, quantity)
  VALUES
  (1, 10),
  (1, 25),
  (2, 15);

3.

SELECT quantity, name FROM orders INNER JOIN products ON orders.product_id = products.id;

4.

INSERT INTO orders (quantity) VALUES (42);

5.

ALTER TABLE orders ALTER COLUMN product_id SET NOT NULL;

6.

DELETE FROM orders
WHERE product_id ISNULL;

7.

CREATE TABLE reviews (
  id serial PRIMARY KEY,
  body text NOT NULL,
  product_id integer REFERENCES products (id)
);

8.

INSERT INTO reviews
  (body, product_id)
  VALUES
  ('a little small', 1),
  ('very round!', 1),
  ('could have been smaller', 2);

9.

no
