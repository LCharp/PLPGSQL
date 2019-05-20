--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.3
-- Dumped by pg_dump version 9.3.3
-- Started on 2018-06-03 02:28:46

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 185 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2025 (class 0 OID 0)
-- Dependencies: 185
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 170 (class 1259 OID 116104)
-- Name: pkm_apprendre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pkm_apprendre (
    num_capacite integer NOT NULL,
    num_espece integer NOT NULL
);


ALTER TABLE public.pkm_apprendre OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 116107)
-- Name: pkm_attraper; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pkm_attraper (
    num_pokemon integer NOT NULL,
    num_dresseur integer,
    date_capture date,
    heure_capture time without time zone
);


ALTER TABLE public.pkm_attraper OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 116110)
-- Name: pkm_capacite; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pkm_capacite (
    num_capacite integer NOT NULL,
    nom_capacite character varying(50),
    degats real,
    precicion real,
    num_type integer
);


ALTER TABLE public.pkm_capacite OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 116113)
-- Name: pkm_capacite_num_capacite_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pkm_capacite_num_capacite_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pkm_capacite_num_capacite_seq OWNER TO postgres;

--
-- TOC entry 2026 (class 0 OID 0)
-- Dependencies: 173
-- Name: pkm_capacite_num_capacite_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pkm_capacite_num_capacite_seq OWNED BY pkm_capacite.num_capacite;


--
-- TOC entry 174 (class 1259 OID 116115)
-- Name: pkm_connaitre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pkm_connaitre (
    num_capacite integer NOT NULL,
    num_pokemon integer NOT NULL
);


ALTER TABLE public.pkm_connaitre OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 116118)
-- Name: pkm_dresseur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pkm_dresseur (
    num_dresseur integer NOT NULL,
    surnom character varying(30),
    niveau integer
);


ALTER TABLE public.pkm_dresseur OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 116121)
-- Name: pkm_dresseur_num_dresseur_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pkm_dresseur_num_dresseur_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pkm_dresseur_num_dresseur_seq OWNER TO postgres;

--
-- TOC entry 2027 (class 0 OID 0)
-- Dependencies: 176
-- Name: pkm_dresseur_num_dresseur_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pkm_dresseur_num_dresseur_seq OWNED BY pkm_dresseur.num_dresseur;


--
-- TOC entry 177 (class 1259 OID 116123)
-- Name: pkm_espece; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pkm_espece (
    num_espece integer NOT NULL,
    nom_espece character varying(50),
    taille real,
    poids real,
    photo character varying(20)
);


ALTER TABLE public.pkm_espece OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 116126)
-- Name: pkm_espece_num_espece_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pkm_espece_num_espece_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pkm_espece_num_espece_seq OWNER TO postgres;

--
-- TOC entry 2028 (class 0 OID 0)
-- Dependencies: 178
-- Name: pkm_espece_num_espece_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pkm_espece_num_espece_seq OWNED BY pkm_espece.num_espece;


--
-- TOC entry 179 (class 1259 OID 116128)
-- Name: pkm_pokemon; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pkm_pokemon (
    num_pokemon integer NOT NULL,
    id_pokemon character varying(20),
    surnom character varying(50),
    num_espece integer,
    num_sexe integer,
    date_naissance date
);


ALTER TABLE public.pkm_pokemon OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 116131)
-- Name: pkm_pokemon_num_pokemon_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pkm_pokemon_num_pokemon_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pkm_pokemon_num_pokemon_seq OWNER TO postgres;

--
-- TOC entry 2029 (class 0 OID 0)
-- Dependencies: 180
-- Name: pkm_pokemon_num_pokemon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pkm_pokemon_num_pokemon_seq OWNED BY pkm_pokemon.num_pokemon;


--
-- TOC entry 181 (class 1259 OID 116133)
-- Name: pkm_sexe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pkm_sexe (
    num_sexe integer NOT NULL,
    lib_sexe character varying(30)
);


ALTER TABLE public.pkm_sexe OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 116136)
-- Name: pkm_sexe_num_sexe_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pkm_sexe_num_sexe_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pkm_sexe_num_sexe_seq OWNER TO postgres;

--
-- TOC entry 2030 (class 0 OID 0)
-- Dependencies: 182
-- Name: pkm_sexe_num_sexe_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pkm_sexe_num_sexe_seq OWNED BY pkm_sexe.num_sexe;


--
-- TOC entry 183 (class 1259 OID 116138)
-- Name: pkm_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pkm_type (
    num_type integer NOT NULL,
    nom_type character varying(30)
);


ALTER TABLE public.pkm_type OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 116141)
-- Name: pkm_type_num_type_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pkm_type_num_type_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pkm_type_num_type_seq OWNER TO postgres;

--
-- TOC entry 2031 (class 0 OID 0)
-- Dependencies: 184
-- Name: pkm_type_num_type_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pkm_type_num_type_seq OWNED BY pkm_type.num_type;


--
-- TOC entry 1865 (class 2604 OID 116143)
-- Name: num_capacite; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pkm_capacite ALTER COLUMN num_capacite SET DEFAULT nextval('pkm_capacite_num_capacite_seq'::regclass);


--
-- TOC entry 1866 (class 2604 OID 116144)
-- Name: num_dresseur; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pkm_dresseur ALTER COLUMN num_dresseur SET DEFAULT nextval('pkm_dresseur_num_dresseur_seq'::regclass);


--
-- TOC entry 1867 (class 2604 OID 116145)
-- Name: num_espece; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pkm_espece ALTER COLUMN num_espece SET DEFAULT nextval('pkm_espece_num_espece_seq'::regclass);


--
-- TOC entry 1868 (class 2604 OID 116146)
-- Name: num_pokemon; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pkm_pokemon ALTER COLUMN num_pokemon SET DEFAULT nextval('pkm_pokemon_num_pokemon_seq'::regclass);


--
-- TOC entry 1869 (class 2604 OID 116147)
-- Name: num_sexe; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pkm_sexe ALTER COLUMN num_sexe SET DEFAULT nextval('pkm_sexe_num_sexe_seq'::regclass);


--
-- TOC entry 1870 (class 2604 OID 116148)
-- Name: num_type; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pkm_type ALTER COLUMN num_type SET DEFAULT nextval('pkm_type_num_type_seq'::regclass);


--
-- TOC entry 2003 (class 0 OID 116104)
-- Dependencies: 170
-- Data for Name: pkm_apprendre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pkm_apprendre VALUES (1, 1);
INSERT INTO pkm_apprendre VALUES (3, 1);
INSERT INTO pkm_apprendre VALUES (4, 1);
INSERT INTO pkm_apprendre VALUES (5, 1);
INSERT INTO pkm_apprendre VALUES (8, 1);
INSERT INTO pkm_apprendre VALUES (1, 2);
INSERT INTO pkm_apprendre VALUES (2, 2);
INSERT INTO pkm_apprendre VALUES (4, 2);
INSERT INTO pkm_apprendre VALUES (5, 2);
INSERT INTO pkm_apprendre VALUES (6, 2);
INSERT INTO pkm_apprendre VALUES (1, 3);
INSERT INTO pkm_apprendre VALUES (2, 3);
INSERT INTO pkm_apprendre VALUES (3, 3);
INSERT INTO pkm_apprendre VALUES (5, 3);
INSERT INTO pkm_apprendre VALUES (7, 3);
INSERT INTO pkm_apprendre VALUES (8, 3);
INSERT INTO pkm_apprendre VALUES (9, 4);
INSERT INTO pkm_apprendre VALUES (10, 4);
INSERT INTO pkm_apprendre VALUES (11, 4);
INSERT INTO pkm_apprendre VALUES (12, 4);
INSERT INTO pkm_apprendre VALUES (13, 4);
INSERT INTO pkm_apprendre VALUES (14, 4);
INSERT INTO pkm_apprendre VALUES (1, 5);
INSERT INTO pkm_apprendre VALUES (2, 5);
INSERT INTO pkm_apprendre VALUES (7, 5);
INSERT INTO pkm_apprendre VALUES (11, 5);
INSERT INTO pkm_apprendre VALUES (12, 5);
INSERT INTO pkm_apprendre VALUES (14, 5);
INSERT INTO pkm_apprendre VALUES (7, 6);
INSERT INTO pkm_apprendre VALUES (8, 6);
INSERT INTO pkm_apprendre VALUES (9, 6);
INSERT INTO pkm_apprendre VALUES (11, 6);
INSERT INTO pkm_apprendre VALUES (12, 6);
INSERT INTO pkm_apprendre VALUES (13, 6);
INSERT INTO pkm_apprendre VALUES (1, 7);
INSERT INTO pkm_apprendre VALUES (2, 7);
INSERT INTO pkm_apprendre VALUES (7, 7);
INSERT INTO pkm_apprendre VALUES (12, 7);
INSERT INTO pkm_apprendre VALUES (16, 7);
INSERT INTO pkm_apprendre VALUES (17, 7);
INSERT INTO pkm_apprendre VALUES (18, 7);
INSERT INTO pkm_apprendre VALUES (19, 7);
INSERT INTO pkm_apprendre VALUES (20, 7);
INSERT INTO pkm_apprendre VALUES (21, 7);


--
-- TOC entry 2004 (class 0 OID 116107)
-- Dependencies: 171
-- Data for Name: pkm_attraper; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pkm_attraper VALUES (1, 1, '2018-02-10', '10:00:00');
INSERT INTO pkm_attraper VALUES (3, 1, '2017-03-21', '11:15:00');
INSERT INTO pkm_attraper VALUES (8, 3, '2017-08-14', '18:12:00');
INSERT INTO pkm_attraper VALUES (15, 3, '2017-03-28', '14:12:00');
INSERT INTO pkm_attraper VALUES (17, 3, '2018-05-22', '16:12:00');
INSERT INTO pkm_attraper VALUES (21, 3, '2017-03-19', '15:21:00');
INSERT INTO pkm_attraper VALUES (14, 1, '2017-10-21', '17:00:00');
INSERT INTO pkm_attraper VALUES (5, 2, '2017-12-24', '23:28:00');


--
-- TOC entry 2005 (class 0 OID 116110)
-- Dependencies: 172
-- Data for Name: pkm_capacite; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pkm_capacite VALUES (1, 'Charge', 40, 100, 18);
INSERT INTO pkm_capacite VALUES (2, 'Rugissement', NULL, 100, 18);
INSERT INTO pkm_capacite VALUES (3, 'Vampigraine', NULL, 90, 1);
INSERT INTO pkm_capacite VALUES (4, 'Fouet Lianes', 45, 100, 1);
INSERT INTO pkm_capacite VALUES (5, 'Poudre Toxik', NULL, 75, 2);
INSERT INTO pkm_capacite VALUES (6, 'Poudre Dodo', NULL, 75, 1);
INSERT INTO pkm_capacite VALUES (7, 'Bélier', 90, 85, 18);
INSERT INTO pkm_capacite VALUES (8, 'Tranch''Herbe', 55, 95, 18);
INSERT INTO pkm_capacite VALUES (9, 'Griffe', 40, 100, 18);
INSERT INTO pkm_capacite VALUES (10, 'Flamèche', 40, 100, 3);
INSERT INTO pkm_capacite VALUES (11, 'Brouillard', NULL, 100, 18);
INSERT INTO pkm_capacite VALUES (12, 'Draco-Rage', NULL, 100, 19);
INSERT INTO pkm_capacite VALUES (13, 'Grimace', NULL, 100, 18);
INSERT INTO pkm_capacite VALUES (14, 'Croc Feu', 65, 95, 3);
INSERT INTO pkm_capacite VALUES (15, 'Mimi-Queue', NULL, 100, 18);
INSERT INTO pkm_capacite VALUES (16, 'Pistolet à O', 40, 100, 4);
INSERT INTO pkm_capacite VALUES (17, 'Repli', NULL, NULL, 4);
INSERT INTO pkm_capacite VALUES (18, 'Ecume', 40, 100, 4);
INSERT INTO pkm_capacite VALUES (19, 'Abri', NULL, NULL, 18);
INSERT INTO pkm_capacite VALUES (20, 'Vibraqua', 60, 100, 4);
INSERT INTO pkm_capacite VALUES (21, 'Mur de Fer', NULL, NULL, 18);


--
-- TOC entry 2032 (class 0 OID 0)
-- Dependencies: 173
-- Name: pkm_capacite_num_capacite_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pkm_capacite_num_capacite_seq', 21, true);


--
-- TOC entry 2007 (class 0 OID 116115)
-- Dependencies: 174
-- Data for Name: pkm_connaitre; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2008 (class 0 OID 116118)
-- Dependencies: 175
-- Data for Name: pkm_dresseur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pkm_dresseur VALUES (1, 'wopi', 2);
INSERT INTO pkm_dresseur VALUES (2, 'Fournier', 1);
INSERT INTO pkm_dresseur VALUES (3, 'Max', 3);


--
-- TOC entry 2033 (class 0 OID 0)
-- Dependencies: 176
-- Name: pkm_dresseur_num_dresseur_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pkm_dresseur_num_dresseur_seq', 3, true);


--
-- TOC entry 2010 (class 0 OID 116123)
-- Dependencies: 177
-- Data for Name: pkm_espece; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pkm_espece VALUES (1, 'Bulbizarre', 0.699999988, 6.9000001, 'bulbizarre.jpg');
INSERT INTO pkm_espece VALUES (6, 'Dracaufeu', 1.70000005, 90.5, 'Dracaufeu.jpg');
INSERT INTO pkm_espece VALUES (7, 'Carapuce', 0.5, 9, 'Carapuce.jpg');
INSERT INTO pkm_espece VALUES (3, 'Florizarre', 2, 100, 'Florizarre.jpg');
INSERT INTO pkm_espece VALUES (2, 'Herbizarre', 1, 13, 'herbizarre.jpg');
INSERT INTO pkm_espece VALUES (5, 'Reptincel', 1.10000002, 19, 'Reptincel.jpg');
INSERT INTO pkm_espece VALUES (4, 'Salamèche', 0.600000024, 8.5, 'Salameche.png');


--
-- TOC entry 2034 (class 0 OID 0)
-- Dependencies: 178
-- Name: pkm_espece_num_espece_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pkm_espece_num_espece_seq', 22, true);


--
-- TOC entry 2012 (class 0 OID 116128)
-- Dependencies: 179
-- Data for Name: pkm_pokemon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pkm_pokemon VALUES (1, '123', 'poke1', 1, 1, '2017-02-12');
INSERT INTO pkm_pokemon VALUES (2, '124', 'poke2', 1, 1, '2017-02-12');
INSERT INTO pkm_pokemon VALUES (3, '125', 'poke3', 1, 1, '2017-02-12');
INSERT INTO pkm_pokemon VALUES (4, '126', 'poke4', 1, 2, '2017-02-13');
INSERT INTO pkm_pokemon VALUES (5, '127', 'poke5', 1, 1, '2017-02-13');
INSERT INTO pkm_pokemon VALUES (6, '128', 'poke6', 1, 2, '2017-02-13');
INSERT INTO pkm_pokemon VALUES (7, '129', 'poke7', 2, 2, '2017-02-13');
INSERT INTO pkm_pokemon VALUES (8, '130', 'poke8', 2, 2, '2017-02-14');
INSERT INTO pkm_pokemon VALUES (9, '131', 'poke9', 2, 1, '2017-02-14');
INSERT INTO pkm_pokemon VALUES (10, '132', 'poke10', 2, 2, '2017-02-14');
INSERT INTO pkm_pokemon VALUES (11, '133', 'poke11', 2, 1, '2017-02-15');
INSERT INTO pkm_pokemon VALUES (12, '134', 'poke11', 3, 1, '2017-02-15');
INSERT INTO pkm_pokemon VALUES (13, '135', 'poke12', 3, 2, '2017-02-15');
INSERT INTO pkm_pokemon VALUES (14, '136', 'poke13', 3, 1, '2017-02-16');
INSERT INTO pkm_pokemon VALUES (15, '137', 'poke14', 5, 1, '2017-02-16');
INSERT INTO pkm_pokemon VALUES (16, '138', 'poke15', 5, 2, '2017-02-16');
INSERT INTO pkm_pokemon VALUES (17, '139', 'poke16', 5, 1, '2017-02-17');
INSERT INTO pkm_pokemon VALUES (18, '140', 'poke17', 6, 2, '2017-02-17');
INSERT INTO pkm_pokemon VALUES (19, '141', 'poke18', 6, 2, '2017-02-17');
INSERT INTO pkm_pokemon VALUES (20, '142', 'poke19', 6, 1, '2017-02-17');
INSERT INTO pkm_pokemon VALUES (21, '143', 'poke20', 7, 2, '2017-02-18');
INSERT INTO pkm_pokemon VALUES (22, '144', 'poke21', 7, 1, '2017-02-18');
INSERT INTO pkm_pokemon VALUES (23, '145', 'poke22', 7, 1, '2017-02-18');


--
-- TOC entry 2035 (class 0 OID 0)
-- Dependencies: 180
-- Name: pkm_pokemon_num_pokemon_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pkm_pokemon_num_pokemon_seq', 28, true);


--
-- TOC entry 2014 (class 0 OID 116133)
-- Dependencies: 181
-- Data for Name: pkm_sexe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pkm_sexe VALUES (1, 'Masculin');
INSERT INTO pkm_sexe VALUES (2, 'Féminin');


--
-- TOC entry 2036 (class 0 OID 0)
-- Dependencies: 182
-- Name: pkm_sexe_num_sexe_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pkm_sexe_num_sexe_seq', 2, true);


--
-- TOC entry 2016 (class 0 OID 116138)
-- Dependencies: 183
-- Data for Name: pkm_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pkm_type VALUES (1, 'Plante');
INSERT INTO pkm_type VALUES (3, 'Feu');
INSERT INTO pkm_type VALUES (4, 'Eau');
INSERT INTO pkm_type VALUES (5, 'Glace');
INSERT INTO pkm_type VALUES (18, 'Normal');
INSERT INTO pkm_type VALUES (2, 'Poison');
INSERT INTO pkm_type VALUES (19, 'Dragon');


--
-- TOC entry 2037 (class 0 OID 0)
-- Dependencies: 184
-- Name: pkm_type_num_type_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pkm_type_num_type_seq', 19, true);


--
-- TOC entry 1872 (class 2606 OID 116150)
-- Name: pkm_apprendre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pkm_apprendre
    ADD CONSTRAINT pkm_apprendre_pkey PRIMARY KEY (num_capacite, num_espece);


--
-- TOC entry 1874 (class 2606 OID 116152)
-- Name: pkm_attraper_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pkm_attraper
    ADD CONSTRAINT pkm_attraper_pkey PRIMARY KEY (num_pokemon);


--
-- TOC entry 1876 (class 2606 OID 116154)
-- Name: pkm_capacite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pkm_capacite
    ADD CONSTRAINT pkm_capacite_pkey PRIMARY KEY (num_capacite);


--
-- TOC entry 1878 (class 2606 OID 116156)
-- Name: pkm_connaitre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pkm_connaitre
    ADD CONSTRAINT pkm_connaitre_pkey PRIMARY KEY (num_capacite, num_pokemon);


--
-- TOC entry 1880 (class 2606 OID 116158)
-- Name: pkm_dresseur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pkm_dresseur
    ADD CONSTRAINT pkm_dresseur_pkey PRIMARY KEY (num_dresseur);


--
-- TOC entry 1882 (class 2606 OID 116160)
-- Name: pkm_espece_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pkm_espece
    ADD CONSTRAINT pkm_espece_pkey PRIMARY KEY (num_espece);


--
-- TOC entry 1884 (class 2606 OID 116162)
-- Name: pkm_pokemon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pkm_pokemon
    ADD CONSTRAINT pkm_pokemon_pkey PRIMARY KEY (num_pokemon);


--
-- TOC entry 1886 (class 2606 OID 116164)
-- Name: pkm_sexe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pkm_sexe
    ADD CONSTRAINT pkm_sexe_pkey PRIMARY KEY (num_sexe);


--
-- TOC entry 1888 (class 2606 OID 116166)
-- Name: pkm_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pkm_type
    ADD CONSTRAINT pkm_type_pkey PRIMARY KEY (num_type);


--
-- TOC entry 1889 (class 2606 OID 116167)
-- Name: pkm_apprendre_num_capacite_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pkm_apprendre
    ADD CONSTRAINT pkm_apprendre_num_capacite_fkey FOREIGN KEY (num_capacite) REFERENCES pkm_capacite(num_capacite);


--
-- TOC entry 1890 (class 2606 OID 116172)
-- Name: pkm_apprendre_num_espece_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pkm_apprendre
    ADD CONSTRAINT pkm_apprendre_num_espece_fkey FOREIGN KEY (num_espece) REFERENCES pkm_espece(num_espece);


--
-- TOC entry 1891 (class 2606 OID 116177)
-- Name: pkm_attraper_num_dresseur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pkm_attraper
    ADD CONSTRAINT pkm_attraper_num_dresseur_fkey FOREIGN KEY (num_dresseur) REFERENCES pkm_dresseur(num_dresseur);


--
-- TOC entry 1892 (class 2606 OID 116182)
-- Name: pkm_attraper_num_pokemon_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pkm_attraper
    ADD CONSTRAINT pkm_attraper_num_pokemon_fkey FOREIGN KEY (num_pokemon) REFERENCES pkm_pokemon(num_pokemon);


--
-- TOC entry 1893 (class 2606 OID 116187)
-- Name: pkm_capacite_num_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pkm_capacite
    ADD CONSTRAINT pkm_capacite_num_type_fkey FOREIGN KEY (num_type) REFERENCES pkm_type(num_type);


--
-- TOC entry 1894 (class 2606 OID 116192)
-- Name: pkm_pokemon_num_espece_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pkm_pokemon
    ADD CONSTRAINT pkm_pokemon_num_espece_fkey FOREIGN KEY (num_espece) REFERENCES pkm_espece(num_espece);


--
-- TOC entry 1895 (class 2606 OID 116197)
-- Name: pkm_pokemon_num_sexe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pkm_pokemon
    ADD CONSTRAINT pkm_pokemon_num_sexe_fkey FOREIGN KEY (num_sexe) REFERENCES pkm_sexe(num_sexe);


--
-- TOC entry 2024 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-06-03 02:28:47

--
-- PostgreSQL database dump complete
--

