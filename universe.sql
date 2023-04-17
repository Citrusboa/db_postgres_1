--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    constellation character varying(40),
    discovery_date numeric(4,0),
    discovered_by character varying(60)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: lifeform; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.lifeform (
    planet_id integer NOT NULL,
    classification character varying(40),
    name character varying(60),
    lifeform_id integer NOT NULL
);


ALTER TABLE public.lifeform OWNER TO freecodecamp;

--
-- Name: lifeform_lifeform_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.lifeform_lifeform_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lifeform_lifeform_id_seq OWNER TO freecodecamp;

--
-- Name: lifeform_lifeform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.lifeform_lifeform_id_seq OWNED BY public.lifeform.lifeform_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    is_habitable boolean,
    planet_id integer NOT NULL,
    diameter_km integer,
    length_one_rev_days numeric(7,1)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    lifeform_exists boolean,
    ave_temp numeric(6,1),
    length_of_day_in_hrs integer,
    num_moons integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_million_years integer,
    description text,
    galaxy_id integer NOT NULL,
    distance_in_light_yrs numeric(6,1)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: lifeform lifeform_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.lifeform ALTER COLUMN lifeform_id SET DEFAULT nextval('public.lifeform_lifeform_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Peekaboo Galaxy', 'Hydra', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Fireworks Galaxy', 'Cygnus and Cepheus', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Eye of Sauron', 'Canes Venatici', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Hoag''s Object', 'Serpens Caput', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Condor Galaxy', 'Pavo', NULL, NULL);


--
-- Data for Name: lifeform; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.lifeform VALUES (1, 'Mammal', 'Human', 1);
INSERT INTO public.lifeform VALUES (1, 'Bird', 'Dove', 2);
INSERT INTO public.lifeform VALUES (1, 'Reptile', 'Snake', 3);
INSERT INTO public.lifeform VALUES (1, 'Fish', 'Tuna', 4);
INSERT INTO public.lifeform VALUES (1, 'Crustacean', 'Crab', 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', NULL, 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, 3, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, 3, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Ganymede', NULL, 4, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Callisto', NULL, 4, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Io', NULL, 4, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Europa', NULL, 4, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Amalthea', NULL, 4, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Himalia', NULL, 4, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Thebe', NULL, 4, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Elara', NULL, 4, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Pasiphae', NULL, 4, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Titan', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Rhea', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Iapetus', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Dione', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Tethys', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Enceladus', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Epimetheus', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Prometheus', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Pandora', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Atlas', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Pan', NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'Tarvos', NULL, 7, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 15.0, 24, 1, 1);
INSERT INTO public.planet VALUES (3, 'Mars', false, NULL, 25, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', false, NULL, 17, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', false, NULL, 16, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', false, NULL, 11, 82, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, NULL, 10, 79, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', false, NULL, 1408, 0, 1);
INSERT INTO public.planet VALUES (5, 'Venus', false, NULL, 5832, 0, 1);
INSERT INTO public.planet VALUES (9, 'Aidro', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (10, 'Venga', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (11, 'Oivo', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (12, 'Zmo', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (13, 'Delcanoma', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (14, 'Aman', NULL, NULL, NULL, NULL, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 'Arcturus', NULL, NULL, 1, 37.0);
INSERT INTO public.star VALUES (5, 'Procyon', NULL, NULL, 1, 11.0);
INSERT INTO public.star VALUES (6, 'Betelgeuse', NULL, NULL, 1, 700.0);
INSERT INTO public.star VALUES (7, 'Altair', NULL, NULL, 1, 16.7);
INSERT INTO public.star VALUES (1, 'The Sun', 4603, NULL, 1, 0.0);
INSERT INTO public.star VALUES (2, 'Sirius', 230, NULL, 1, 8.6);
INSERT INTO public.star VALUES (3, 'Canopus', 26, NULL, 1, 310.0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: lifeform_lifeform_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.lifeform_lifeform_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: lifeform lifeform_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.lifeform
    ADD CONSTRAINT lifeform_pkey PRIMARY KEY (lifeform_id);


--
-- Name: lifeform lifeform_scientific_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.lifeform
    ADD CONSTRAINT lifeform_scientific_name_key UNIQUE (name);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: lifeform lifeform_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.lifeform
    ADD CONSTRAINT lifeform_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

