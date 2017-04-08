1.

createdb sequel_multiple_tables

2.

psql -d sequel_multiple_tables < theater_full.sql

3.

require 'sequel'
DB = Sequel.connect("postgres://localhost/sequel_multiple_tables")

4.

DB[:tickets].count

5.

DB[:tickets].distinct(:customer_id).count

6.

DB[:customers].select {
..     (count(tickets__customer_id).distinct / count(customers__id).distinct.cast(Float) * 100).as(:percent)
..   }.left_outer_join(:tickets, customer_id: :id).first
=> {:percent=>16.52}

7.

DB[:events].select { [events__name, count(tickets__id)] }.
.. left_outer_join(:tickets, event_id: :id).
.. group(:events__id).
.. order { count(tickets__id) }.reverse.all

8.

DB[:customers].select do
..   [customers__id, customers__email, count(tickets__event_id).distinct]
.. end.
.. left_outer_join(:tickets, customer_id: :id).
.. group(:customers__id).
.. having { count(tickets__event_id).distinct >= 3 }.all

9.

DB[:tickets].select do
..   [events__name.as(event), events__starts_at, sections__name.as(section), seats__row, seats__number.as(seat)]
.. end.
.. join(:events, id: :event_id).
.. join(:customers, id: :tickets__customer_id).
.. join(:seats, id: :tickets__seat_id).
.. join(:sections, id: :seats__section_id).
.. where(customers__email: "gennaro.rath@mcdermott.co").all