--
-- PostgreSQL database cluster dump
--

-- Started on 2023-09-22 23:25:36

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE ditek;
ALTER ROLE ditek WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2023-09-22 23:25:37

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

-- Completed on 2023-09-22 23:25:37

--
-- PostgreSQL database dump complete
--

--
-- Database "create_and_insert" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2023-09-22 23:25:37

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

--
-- TOC entry 3349 (class 1262 OID 24720)
-- Name: create_and_insert; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE create_and_insert WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE create_and_insert OWNER TO postgres;

\connect create_and_insert

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
-- TOC entry 217 (class 1259 OID 24764)
-- Name: akun; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.akun (
    akun_id bigint NOT NULL,
    jenis_akun character varying(50) NOT NULL,
    pin integer NOT NULL,
    saldo integer NOT NULL,
    nasabah_id integer
);


ALTER TABLE public.akun OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24763)
-- Name: akun_akun_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.akun_akun_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.akun_akun_id_seq OWNER TO postgres;

--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 216
-- Name: akun_akun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.akun_akun_id_seq OWNED BY public.akun.akun_id;


--
-- TOC entry 215 (class 1259 OID 24753)
-- Name: nasabah; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nasabah (
    nasabah_id bigint NOT NULL,
    nama character varying(50) NOT NULL,
    jenis_kelamin character varying(25) NOT NULL,
    alamat text NOT NULL,
    no_telpon character varying(15) NOT NULL,
    email character varying(50) NOT NULL
);


ALTER TABLE public.nasabah OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24752)
-- Name: nasabah_nasabah_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nasabah_nasabah_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nasabah_nasabah_id_seq OWNER TO postgres;

--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 214
-- Name: nasabah_nasabah_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nasabah_nasabah_id_seq OWNED BY public.nasabah.nasabah_id;


--
-- TOC entry 219 (class 1259 OID 24778)
-- Name: transaksi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaksi (
    transaksi_id bigint NOT NULL,
    tanggal_transaksi date NOT NULL,
    jenis_transaksi character varying(50) NOT NULL,
    jumlah_transaksi integer,
    akun_id integer
);


ALTER TABLE public.transaksi OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24777)
-- Name: transaksi_transaksi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaksi_transaksi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaksi_transaksi_id_seq OWNER TO postgres;

--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 218
-- Name: transaksi_transaksi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaksi_transaksi_id_seq OWNED BY public.transaksi.transaksi_id;


--
-- TOC entry 3184 (class 2604 OID 24767)
-- Name: akun akun_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.akun ALTER COLUMN akun_id SET DEFAULT nextval('public.akun_akun_id_seq'::regclass);


--
-- TOC entry 3183 (class 2604 OID 24756)
-- Name: nasabah nasabah_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nasabah ALTER COLUMN nasabah_id SET DEFAULT nextval('public.nasabah_nasabah_id_seq'::regclass);


--
-- TOC entry 3185 (class 2604 OID 24781)
-- Name: transaksi transaksi_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksi ALTER COLUMN transaksi_id SET DEFAULT nextval('public.transaksi_transaksi_id_seq'::regclass);


--
-- TOC entry 3341 (class 0 OID 24764)
-- Dependencies: 217
-- Data for Name: akun; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.akun (akun_id, jenis_akun, pin, saldo, nasabah_id) FROM stdin;
1	Tabungan	20102	2500000	1
2	Giro	30203	1500000	2
3	Tabungan	90292	500000	3
5	Tabungan	67282	3000000	5
6	Giro	234323	100000	6
7	Tabungan	89273	5000000	7
8	Giro	123453	7500000	8
9	Tabungan	928839	850000	9
4	Tabungan	129834	1000000	4
\.


--
-- TOC entry 3339 (class 0 OID 24753)
-- Dependencies: 215
-- Data for Name: nasabah; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nasabah (nasabah_id, nama, jenis_kelamin, alamat, no_telpon, email) FROM stdin;
1	Dhimas Rizaldy	Pria	jln.marga no.128 Bandar Lampung	089521937647	dimas@gmail.com
2	Aldi Anggara	Pria	jln.nangka no.89 Bandar Lampung	08928827712	aldi@gmail.com
3	Toni Andara	Pria	jln.merpati no.70 Bandung	08587362771	toni@gmail.com
4	Santi Kartika	Wanita	jln.mawar no.17 Bandar Lampung	08927728812	santi@gmail.com
5	Surya Abidin	Pria	jln.batu bara no.96 Jakarta	087672886882	surya@gmail.com
6	Tama Agustono	Pria	jln.anggur no.67 Batam	08256618828	tama@gmail.com
8	Santi Putri Ayu	Wanita	jln.taman mata air no.56 Bandar Lampung	082771667923	santiputri@gmail.com
9	Wawan Gunawan	Pria	jln.pepaya no.02 Jawa Timur	0837727838343	wawan@gmail.com
7	Tantri Kotak	Wanita	jln.pisang no.89 Batam	088993772993	tantrikotak@gmail.com
\.


--
-- TOC entry 3343 (class 0 OID 24778)
-- Dependencies: 219
-- Data for Name: transaksi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaksi (transaksi_id, tanggal_transaksi, jenis_transaksi, jumlah_transaksi, akun_id) FROM stdin;
1	2023-09-22	Withdraw	150000	1
2	2023-09-22	Transfer	150000	1
3	2023-09-22	Deposit	250000	1
4	2023-09-22	Withdraw	150000	2
6	2023-09-22	Deposit	250000	3
7	2023-09-22	Withdraw	150000	3
8	2023-09-22	Withdraw	150000	4
9	2023-09-22	Deposit	250000	4
10	2023-09-22	Withdraw	150000	5
11	2023-09-22	Withdraw	150000	5
12	2023-09-22	Deposit	250000	6
13	2023-09-22	Withdraw	150000	6
14	2023-09-22	Withdraw	150000	7
15	2023-09-22	Deposit	250000	7
16	2023-09-22	Withdraw	150000	8
17	2023-09-22	Withdraw	150000	8
18	2023-09-22	Deposit	250000	9
19	2023-09-22	Withdraw	150000	9
20	2023-09-22	Withdraw	150000	5
21	2023-09-22	Deposit	250000	6
22	2023-09-22	Withdraw	150000	7
23	2023-09-22	Withdraw	150000	3
24	2023-09-22	Deposit	250000	5
5	2023-09-22	Transfer	150000	2
\.


--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 216
-- Name: akun_akun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.akun_akun_id_seq', 1, false);


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 214
-- Name: nasabah_nasabah_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nasabah_nasabah_id_seq', 1, false);


--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 218
-- Name: transaksi_transaksi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaksi_transaksi_id_seq', 1, false);


--
-- TOC entry 3191 (class 2606 OID 24790)
-- Name: akun akun_pin_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.akun
    ADD CONSTRAINT akun_pin_key UNIQUE (pin);


--
-- TOC entry 3193 (class 2606 OID 24769)
-- Name: akun akun_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.akun
    ADD CONSTRAINT akun_pkey PRIMARY KEY (akun_id);


--
-- TOC entry 3187 (class 2606 OID 24762)
-- Name: nasabah nasabah_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nasabah
    ADD CONSTRAINT nasabah_email_key UNIQUE (email);


--
-- TOC entry 3189 (class 2606 OID 24760)
-- Name: nasabah nasabah_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nasabah
    ADD CONSTRAINT nasabah_pkey PRIMARY KEY (nasabah_id);


--
-- TOC entry 3195 (class 2606 OID 24783)
-- Name: transaksi transaksi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT transaksi_pkey PRIMARY KEY (transaksi_id);


-- Completed on 2023-09-22 23:25:37

--
-- PostgreSQL database dump complete
--

-- Completed on 2023-09-22 23:25:37

--
-- PostgreSQL database cluster dump complete
--

