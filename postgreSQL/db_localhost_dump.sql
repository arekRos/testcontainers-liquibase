--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6
-- Dumped by pg_dump version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS db;
--
-- Name: db; Type: DATABASE; Schema: -; Owner: test_user
--

CREATE DATABASE db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE db OWNER TO test_user;

\connect db

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: test_user
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO test_user;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: test_user
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO test_user;

--
-- Name: offers; Type: TABLE; Schema: public; Owner: test_user
--

CREATE TABLE public.offers (
    id bigint NOT NULL,
    offer_name character varying(255) NOT NULL
);


ALTER TABLE public.offers OWNER TO test_user;

--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: test_user
--

CREATE SEQUENCE public.offers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.offers_id_seq OWNER TO test_user;

--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_user
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: test_user
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    offer_id bigint NOT NULL,
    product_name character varying(255) NOT NULL,
    product_price numeric(19,2) NOT NULL
);


ALTER TABLE public.products OWNER TO test_user;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: test_user
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO test_user;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_user
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: products_offer_id_seq; Type: SEQUENCE; Schema: public; Owner: test_user
--

CREATE SEQUENCE public.products_offer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_offer_id_seq OWNER TO test_user;

--
-- Name: products_offer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_user
--

ALTER SEQUENCE public.products_offer_id_seq OWNED BY public.products.offer_id;


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: products offer_id; Type: DEFAULT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public.products ALTER COLUMN offer_id SET DEFAULT nextval('public.products_offer_id_seq'::regclass);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: test_user
--

INSERT INTO public.databasechangelog VALUES ('01-create-offer-and-product-schema', 'Arkadiusz Rosloniec', 'classpath:/db/changelog/db.changelog-master.yaml', '2023-01-27 11:45:39.150618', 1, 'EXECUTED', '8:732184539184691c373e82b42ed383a4', 'sqlFile', '', NULL, '4.17.2', NULL, NULL, '4816339121');
INSERT INTO public.databasechangelog VALUES ('02-alter-offers-with-uqnique-constraint', 'Arkadiusz Rosloniec', 'classpath:/db/changelog/db.changelog-master.yaml', '2023-01-27 11:45:39.158448', 2, 'EXECUTED', '8:1a2e17f9a925c1e0e8602a33181ddec7', 'sqlFile', '', NULL, '4.17.2', NULL, NULL, '4816339121');


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: test_user
--

INSERT INTO public.databasechangeloglock VALUES (1, false, NULL, NULL);


--
-- Data for Name: offers; Type: TABLE DATA; Schema: public; Owner: test_user
--



--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: test_user
--



--
-- Name: offers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test_user
--

SELECT pg_catalog.setval('public.offers_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test_user
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: products_offer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test_user
--

SELECT pg_catalog.setval('public.products_offer_id_seq', 1, false);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: offers offer_name_unique; Type: CONSTRAINT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offer_name_unique UNIQUE (offer_name);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products products_offer_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: test_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_offer_id_fk FOREIGN KEY (offer_id) REFERENCES public.offers(id);


--
-- PostgreSQL database dump complete
--

