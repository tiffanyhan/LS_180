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
-- Name: customers; Type: TABLE; Schema: public; Owner: tiffany
--

CREATE TABLE customers (
    id integer NOT NULL,
    name text NOT NULL,
    payment_token character(8) NOT NULL,
    CONSTRAINT customers_payment_token_check CHECK ((payment_token ~ '^[A-Z]{8}$'::text))
);


ALTER TABLE customers OWNER TO tiffany;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: tiffany
--

CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customers_id_seq OWNER TO tiffany;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tiffany
--

ALTER SEQUENCE customers_id_seq OWNED BY customers.id;


--
-- Name: customers_services; Type: TABLE; Schema: public; Owner: tiffany
--

CREATE TABLE customers_services (
    id integer NOT NULL,
    customer_id integer,
    service_id integer
);


ALTER TABLE customers_services OWNER TO tiffany;

--
-- Name: customers_services_id_seq; Type: SEQUENCE; Schema: public; Owner: tiffany
--

CREATE SEQUENCE customers_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customers_services_id_seq OWNER TO tiffany;

--
-- Name: customers_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tiffany
--

ALTER SEQUENCE customers_services_id_seq OWNED BY customers_services.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: tiffany
--

CREATE TABLE services (
    id integer NOT NULL,
    description text NOT NULL,
    price numeric(10,2) NOT NULL,
    CONSTRAINT services_price_check CHECK ((price >= 0.0))
);


ALTER TABLE services OWNER TO tiffany;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: tiffany
--

CREATE SEQUENCE services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE services_id_seq OWNER TO tiffany;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tiffany
--

ALTER SEQUENCE services_id_seq OWNED BY services.id;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- Name: customers_services id; Type: DEFAULT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY customers_services ALTER COLUMN id SET DEFAULT nextval('customers_services_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY services ALTER COLUMN id SET DEFAULT nextval('services_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: tiffany
--

INSERT INTO customers VALUES (1, 'Pat Johnson', 'XHGOAHEQ');
INSERT INTO customers VALUES (2, 'Nancy Monreal', 'JKWQPJKL');
INSERT INTO customers VALUES (3, 'Lynn Blake', 'KLZXWEEE');
INSERT INTO customers VALUES (4, 'Chen Ke-Hua', 'KWETYCVX');
INSERT INTO customers VALUES (5, 'Scott Lakso', 'UUEAPQPS');
INSERT INTO customers VALUES (6, 'Jim Pornot', 'XKJEYAZA');
INSERT INTO customers VALUES (8, 'John Doe', 'EYODHLCN');


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tiffany
--

SELECT pg_catalog.setval('customers_id_seq', 8, true);


--
-- Data for Name: customers_services; Type: TABLE DATA; Schema: public; Owner: tiffany
--

INSERT INTO customers_services VALUES (1, 1, 1);
INSERT INTO customers_services VALUES (2, 1, 2);
INSERT INTO customers_services VALUES (3, 1, 3);
INSERT INTO customers_services VALUES (4, 3, 1);
INSERT INTO customers_services VALUES (5, 3, 2);
INSERT INTO customers_services VALUES (6, 3, 3);
INSERT INTO customers_services VALUES (7, 3, 4);
INSERT INTO customers_services VALUES (8, 3, 5);
INSERT INTO customers_services VALUES (9, 4, 1);
INSERT INTO customers_services VALUES (10, 4, 4);
INSERT INTO customers_services VALUES (11, 5, 1);
INSERT INTO customers_services VALUES (12, 5, 2);
INSERT INTO customers_services VALUES (13, 5, 6);
INSERT INTO customers_services VALUES (14, 6, 1);
INSERT INTO customers_services VALUES (15, 6, 6);
INSERT INTO customers_services VALUES (16, 6, 7);
INSERT INTO customers_services VALUES (20, 8, 1);
INSERT INTO customers_services VALUES (21, 8, 2);
INSERT INTO customers_services VALUES (22, 8, 3);


--
-- Name: customers_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tiffany
--

SELECT pg_catalog.setval('customers_services_id_seq', 22, true);


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: tiffany
--

INSERT INTO services VALUES (1, 'Unix Hosting', 5.95);
INSERT INTO services VALUES (2, 'DNS', 4.95);
INSERT INTO services VALUES (3, 'Whois Registration', 1.95);
INSERT INTO services VALUES (4, 'High Bandwidth', 15.00);
INSERT INTO services VALUES (5, 'Business Support', 250.00);
INSERT INTO services VALUES (6, 'Dedicated Hosting', 50.00);
INSERT INTO services VALUES (7, 'Bulk Email', 250.00);
INSERT INTO services VALUES (8, 'One-to-one Training', 999.00);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tiffany
--

SELECT pg_catalog.setval('services_id_seq', 8, true);


--
-- Name: customers customers_payment_token_key; Type: CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_payment_token_key UNIQUE (payment_token);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: customers_services customers_services_pkey; Type: CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY customers_services
    ADD CONSTRAINT customers_services_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: customers_services customers_services_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY customers_services
    ADD CONSTRAINT customers_services_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE;


--
-- Name: customers_services customers_services_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tiffany
--

ALTER TABLE ONLY customers_services
    ADD CONSTRAINT customers_services_service_id_fkey FOREIGN KEY (service_id) REFERENCES services(id);


--
-- PostgreSQL database dump complete
--

