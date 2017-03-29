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
-- Name: directors; Type: TABLE; Schema: public; Owner: tiffany
--

CREATE TABLE directors (
    id integer NOT NULL,
    name text NOT NULL,
    CONSTRAINT valid_name CHECK (((length(name) >= 1) AND ("position"(name, ' '::text) > 0)))
);


ALTER TABLE directors OWNER TO tiffany;

--
-- Name: directors_id_seq; Type: SEQUENCE; Schema: public; Owner: tiffany
--

CREATE SEQUENCE directors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE directors_id_seq OWNER TO tiffany;

--
-- Name: directors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tiffany
--

ALTER SEQUENCE directors_id_seq OWNED BY directors.id;


--
-- Name: films; Type: TABLE; Schema: public; Owner: tiffany
--

CREATE TABLE films (
    title character varying(255) NOT NULL,
    year integer NOT NULL,
    genre character varying(100) NOT NULL,
    duration integer NOT NULL,
    id integer NOT NULL,
    CONSTRAINT title_length CHECK ((length((title)::text) >= 1)),
    CONSTRAINT year_range CHECK (((year >= 1900) AND (year <= 2100)))
);


ALTER TABLE films OWNER TO tiffany;

--
-- Name: films_directors; Type: TABLE; Schema: public; Owner: tiffany
--

CREATE TABLE films_directors (
    id integer NOT NULL,
    film_id integer,
    director_id integer
);


ALTER TABLE films_directors OWNER TO tiffany;

--
-- Name: films_directors_id_seq; Type: SEQUENCE; Schema: public; Owner: tiffany
--

CREATE SEQUENCE films_directors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE films_directors_id_seq OWNER TO tiffany;

--
-- Name: films_directors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tiffany
--

ALTER SEQUENCE films_directors_id_seq OWNED BY films_directors.id;


--
-- Name: films_id_seq; Type: SEQUENCE; Schema: public; Owner: tiffany
--

CREATE SEQUENCE films_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE films_id_seq OWNER TO tiffany;

--
-- Name: films_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tiffany
--

ALTER SEQUENCE films_id_seq OWNED BY films.id;


--
-- Name: directors id; Type: DEFAULT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY directors ALTER COLUMN id SET DEFAULT nextval('directors_id_seq'::regclass);


--
-- Name: films id; Type: DEFAULT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY films ALTER COLUMN id SET DEFAULT nextval('films_id_seq'::regclass);


--
-- Name: films_directors id; Type: DEFAULT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY films_directors ALTER COLUMN id SET DEFAULT nextval('films_directors_id_seq'::regclass);


--
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: tiffany
--

INSERT INTO directors VALUES (1, 'John McTiernan');
INSERT INTO directors VALUES (2, 'Michael Curtiz');
INSERT INTO directors VALUES (3, 'Francis Ford Coppola');
INSERT INTO directors VALUES (4, 'Michael Anderson');
INSERT INTO directors VALUES (5, 'Tomas Alfredson');
INSERT INTO directors VALUES (6, 'Mike Nichols');
INSERT INTO directors VALUES (7, 'Sidney Lumet');
INSERT INTO directors VALUES (8, 'Penelope Spheeris');
INSERT INTO directors VALUES (9, 'Joel Coen');
INSERT INTO directors VALUES (10, 'Ethan Coen');
INSERT INTO directors VALUES (11, 'Frank Miller');
INSERT INTO directors VALUES (12, 'Robert Rodriguez');


--
-- Name: directors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tiffany
--

SELECT pg_catalog.setval('directors_id_seq', 12, true);


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: tiffany
--

INSERT INTO films VALUES ('Die Hard', 1988, 'action', 132, 1);
INSERT INTO films VALUES ('Casablanca', 1942, 'drama', 102, 2);
INSERT INTO films VALUES ('The Conversation', 1974, 'thriller', 113, 3);
INSERT INTO films VALUES ('1984', 1956, 'scifi', 90, 4);
INSERT INTO films VALUES ('Tinker Tailor Soldier Spy', 2011, 'espionage', 127, 5);
INSERT INTO films VALUES ('The Birdcage', 1996, 'comedy', 118, 6);
INSERT INTO films VALUES ('The Godfather', 1972, 'crime', 175, 7);
INSERT INTO films VALUES ('12 Angry Men', 1957, 'drama', 96, 8);
INSERT INTO films VALUES ('Wayne''s World', 1992, 'comedy', 95, 9);
INSERT INTO films VALUES ('Let the Right One In', 2008, 'horror', 114, 10);
INSERT INTO films VALUES ('Fargo', 1996, 'comedy', 98, 11);
INSERT INTO films VALUES ('No Country for Old Men', 2007, 'western', 122, 12);
INSERT INTO films VALUES ('Sin City', 2005, 'crime', 124, 13);
INSERT INTO films VALUES ('Spy Kids', 2001, 'scifi', 88, 14);


--
-- Data for Name: films_directors; Type: TABLE DATA; Schema: public; Owner: tiffany
--

INSERT INTO films_directors VALUES (1, 1, 1);
INSERT INTO films_directors VALUES (2, 2, 2);
INSERT INTO films_directors VALUES (3, 3, 3);
INSERT INTO films_directors VALUES (4, 4, 4);
INSERT INTO films_directors VALUES (5, 5, 5);
INSERT INTO films_directors VALUES (6, 6, 6);
INSERT INTO films_directors VALUES (10, 7, 3);
INSERT INTO films_directors VALUES (11, 8, 7);
INSERT INTO films_directors VALUES (12, 9, 8);
INSERT INTO films_directors VALUES (13, 10, 4);
INSERT INTO films_directors VALUES (14, 11, 9);
INSERT INTO films_directors VALUES (15, 12, 9);
INSERT INTO films_directors VALUES (16, 12, 10);
INSERT INTO films_directors VALUES (17, 13, 11);
INSERT INTO films_directors VALUES (18, 13, 12);
INSERT INTO films_directors VALUES (19, 14, 12);


--
-- Name: films_directors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tiffany
--

SELECT pg_catalog.setval('films_directors_id_seq', 19, true);


--
-- Name: films_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tiffany
--

SELECT pg_catalog.setval('films_id_seq', 14, true);


--
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (id);


--
-- Name: films_directors films_directors_pkey; Type: CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY films_directors
    ADD CONSTRAINT films_directors_pkey PRIMARY KEY (id);


--
-- Name: films films_pkey; Type: CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY films
    ADD CONSTRAINT films_pkey PRIMARY KEY (id);


--
-- Name: films title_unique; Type: CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY films
    ADD CONSTRAINT title_unique UNIQUE (title);


--
-- Name: films_directors films_directors_director_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY films_directors
    ADD CONSTRAINT films_directors_director_id_fkey FOREIGN KEY (director_id) REFERENCES directors(id);


--
-- Name: films_directors films_directors_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY films_directors
    ADD CONSTRAINT films_directors_film_id_fkey FOREIGN KEY (film_id) REFERENCES films(id);


--
-- PostgreSQL database dump complete
--

