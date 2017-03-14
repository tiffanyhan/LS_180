--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.users_books DROP CONSTRAINT users_books_user_id_fkey;
ALTER TABLE ONLY public.users_books DROP CONSTRAINT users_books_book_id_fkey;
ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_user_id_fkey;
ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_book_id_fkey;
ALTER TABLE ONLY public.addresses DROP CONSTRAINT fk_user_id;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.users_books DROP CONSTRAINT users_books_pkey;
ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
ALTER TABLE ONLY public.books DROP CONSTRAINT books_isbn_key;
ALTER TABLE ONLY public.addresses DROP CONSTRAINT addresses_pkey;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.reviews ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.books ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users_books;
DROP TABLE public.users;
DROP SEQUENCE public.reviews_id_seq;
DROP TABLE public.reviews;
DROP SEQUENCE public.books_id_seq;
DROP TABLE public.books;
DROP TABLE public.addresses;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: tiffany
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO tiffany;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: tiffany
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: tiffany
--

CREATE TABLE addresses (
    user_id integer NOT NULL,
    street character varying(30) NOT NULL,
    city character varying(30) NOT NULL,
    state character varying(30) NOT NULL
);


ALTER TABLE addresses OWNER TO tiffany;

--
-- Name: books; Type: TABLE; Schema: public; Owner: tiffany
--

CREATE TABLE books (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    author character varying(100) NOT NULL,
    published_date timestamp without time zone NOT NULL,
    isbn integer
);


ALTER TABLE books OWNER TO tiffany;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: tiffany
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_id_seq OWNER TO tiffany;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tiffany
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: tiffany
--

CREATE TABLE reviews (
    id integer NOT NULL,
    book_id integer NOT NULL,
    user_id integer NOT NULL,
    review_content character varying(255),
    rating integer,
    published_date timestamp without time zone DEFAULT now()
);


ALTER TABLE reviews OWNER TO tiffany;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: tiffany
--

CREATE SEQUENCE reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reviews_id_seq OWNER TO tiffany;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tiffany
--

ALTER SEQUENCE reviews_id_seq OWNED BY reviews.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: tiffany
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(25) NOT NULL,
    enabled boolean DEFAULT true,
    last_login timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE users OWNER TO tiffany;

--
-- Name: users_books; Type: TABLE; Schema: public; Owner: tiffany
--

CREATE TABLE users_books (
    user_id integer NOT NULL,
    book_id integer NOT NULL,
    checkout_date timestamp without time zone,
    return_date timestamp without time zone
);


ALTER TABLE users_books OWNER TO tiffany;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: tiffany
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO tiffany;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tiffany
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY reviews ALTER COLUMN id SET DEFAULT nextval('reviews_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: tiffany
--

INSERT INTO addresses VALUES (1, '1 Market Street', 'San Francisco', 'CA');
INSERT INTO addresses VALUES (2, '2 Elm Street', 'San Francisco', 'CA');


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: tiffany
--

INSERT INTO books VALUES (1, 'My First SQL Book', 'Mary Parker', '2017-03-12 19:29:44.271424', NULL);
INSERT INTO books VALUES (2, 'My Second SQL Book', 'John Mayer', '2017-03-12 19:30:07.966734', NULL);
INSERT INTO books VALUES (3, 'My Third SQL Book', 'Cary Flint', '2017-03-12 19:31:02.273081', NULL);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tiffany
--

SELECT pg_catalog.setval('books_id_seq', 3, true);


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: tiffany
--

INSERT INTO reviews VALUES (1, 1, 1, 'My first review', NULL, '2017-03-12 19:30:02.422738');
INSERT INTO reviews VALUES (2, 2, 1, 'My second review', NULL, '2017-03-12 19:30:15.714918');
INSERT INTO reviews VALUES (3, 2, 2, 'Jane Smiley''s review', NULL, '2017-03-12 19:30:50.321489');


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tiffany
--

SELECT pg_catalog.setval('reviews_id_seq', 3, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: tiffany
--

INSERT INTO users VALUES (1, 'John Smith', true, '2017-03-12 19:29:13.656444');
INSERT INTO users VALUES (2, 'Jane Smiley', true, '2017-03-12 19:30:30.357131');
INSERT INTO users VALUES (3, 'Alice Munro', true, '2017-03-12 19:30:55.93204');


--
-- Data for Name: users_books; Type: TABLE DATA; Schema: public; Owner: tiffany
--

INSERT INTO users_books VALUES (1, 1, '2017-03-12 19:29:45.86011', NULL);
INSERT INTO users_books VALUES (1, 2, '2017-03-12 19:30:08.39524', NULL);
INSERT INTO users_books VALUES (2, 2, '2017-03-12 19:30:44.274019', NULL);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tiffany
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (user_id);


--
-- Name: books books_isbn_key; Type: CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_isbn_key UNIQUE (isbn);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: users_books users_books_pkey; Type: CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY users_books
    ADD CONSTRAINT users_books_pkey PRIMARY KEY (user_id, book_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: addresses fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: reviews reviews_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE;


--
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;


--
-- Name: users_books users_books_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY users_books
    ADD CONSTRAINT users_books_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(id) ON UPDATE CASCADE;


--
-- Name: users_books users_books_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY users_books
    ADD CONSTRAINT users_books_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE;


--
-- PostgreSQL database dump complete
--

