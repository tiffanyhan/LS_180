1.

CREATE TABLE bidders (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  initial_price DECIMAL(6,2) NOT NULL CHECK(initial_price BETWEEN 0.01 AND 1000.00),
  sales_price DECIMAL(6,2) CHECK(sales_price BETWEEN 0.01 AND 1000.00)
);

CREATE TABLE bids (
  id SERIAL PRIMARY KEY,
  bidder_id integer NOT NULL REFERENCES bidders(id) ON DELETE CASCADE,
  item_id integer NOT NULL REFERENCES items(id) ON DELETE CASCADE,
  amount DECIMAL(6,2) NOT NULL CHECK(amount BETWEEN 0.01 AND 1000.00)
);

CREATE INDEX ON bids (bidder_id, item_id);

\copy bidders FROM 'bidders.csv' WITH HEADER CSV;
\copy items FROM 'items.csv' WITH HEADER CSV;
\copy bids FROM 'bids.csv' WITH HEADER CSV;

2.

SELECT name AS "Bid on Items" FROM items
WHERE items.id IN (SELECT DISTINCT item_id FROM bids);

3.

SELECT name AS "Not Bid On" FROM items
WHERE items.id NOT IN (SELECT item_id FROM bids);

4.

SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

SELECT DISTINCT bidders.name
FROM bidders
JOIN bids
ON bidders.id = bids.bidder_id;

5.

SELECT name AS "Highest Bid Less Than 100 Dollars" FROM items
WHERE 100.00 > ANY
  (SELECT amount FROM bids WHERE item_id = items.id);

SELECT name AS "Highest Bid Less Than 100 Dollars" FROM items
WHERE 100.00 > ALL
  (SELECT amount FROM bids WHERE item_id = items.id);

6.

SELECT MAX(bid_counts.count) FROM
  (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;

7.

SELECT name,
       (SELECT COUNT(item_id) FROM bids WHERE item_id = items.id)
FROM items;

8.

SELECT id FROM items
WHERE ROW('Painting', 100.00, 250.00) =
  ROW(name, initial_price, sales_price);

9.

EXPLAIN SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

EXPLAIN ANALYZE SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

10.

using a subquery is faster
