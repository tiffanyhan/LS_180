2.

SELECT COUNT(*) FROM tickets;

3.

SELECT COUNT(DISTINCT customer_id) FROM tickets;

4.

SELECT COUNT(DISTINCT tickets.customer_id) / COUNT(DISTINCT customers.id)::float * 100 AS percent
  FROM customers
  LEFT OUTER JOIN tickets ON tickets.customer_id = customers.id

5.

SELECT e.name, COUNT(t.id) AS popularity
  FROM events AS e LEFT OUTER JOIN tickets AS t ON t.event_id = e.id
  GROUP BY e.id
  ORDER BY popularity DESC;

6.

SELECT customers.id, customers.email, COUNT(DISTINCT tickets.event_id)
  FROM customers INNER JOIN tickets on tickets.customer_id = customers.id
  GROUP BY customers.id
  HAVING COUNT(DISTINCT tickets.event_id) = 3;

7.

SELECT events.name AS event, events.starts_at, sections.name AS section, seats.row, seats.number AS seat
  FROM tickets
    INNER JOIN events on tickets.event_id = events.id
    INNER JOIN customers ON tickets.customer_id = customers.id
    INNER JOIN seats ON tickets.seat_id = seats.id
    INNER JOIN sections ON seats.section_id = sections.id
WHERE customers.email = 'gennaro.rath@mcdermott.co';
