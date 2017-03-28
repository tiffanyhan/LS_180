1.

SELECT books.id, books.author, string_agg(categories.name, ', ') AS categories
  FROM books
    INNER JOIN books_categories ON books.id = books_categories.book_id
    INNER JOIN categories ON books_categories.category_id = categories.id
  GROUP BY books.id;

2.

ALTER TABLE books ALTER COLUMN title TYPE text;

INSERT INTO books (title, author) VALUES ('Sally Ride: America''s First Woman in Space', 'Lynn Sherr');
INSERT INTO books_categories VALUES (4, 1);
INSERT INTO books_categories VALUES (4, 5);
INSERT INTO categories (name) VALUES ('Space Exploration');
INSERT INTO books_categories VALUES (4, 7);

INSERT INTO books (title, author) VALUES ('Jane Eyre', 'Charlotte Brontë');
INSERT INTO books_categories VALUES (5, 2);
INSERT INTO books_categories VALUES (5, 4);

INSERT INTO books (title, author) VALUES ('Vij''s: Elegant and Inspired Indian Cuisine', 'Meeru Dhalwala and Vikram Vij');
INSERT INTO categories (name) VALUES ('Cookbook');
INSERT INTO categories (name) VALUES ('South Asia');
INSERT INTO books_categories VALUES (6, 1);
INSERT INTO books_categories VALUES (6, 8);
INSERT INTO books_categories VALUES (6, 9);

3.

ALTER TABLE books_categories ADD UNIQUE (book_id, category_id);

4.

SELECT categories.name, count(books.id) as book_count, string_agg(books.title, ', ') AS book_titles
  FROM books
    INNER JOIN books_categories ON books.id = books_categories.book_id
    INNER JOIN categories ON books_categories.category_id = categories.id
  GROUP BY categories.name ORDER BY categories.name;
