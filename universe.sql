--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: celestial_event; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_event (
    celestial_event_id integer NOT NULL,
    name character varying(255) NOT NULL,
    date_occurred timestamp without time zone NOT NULL,
    galaxy_id integer,
    description text
);


ALTER TABLE public.celestial_event OWNER TO freecodecamp;

--
-- Name: celestial_event_celestial_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_event_celestial_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_event_celestial_event_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_event_celestial_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_event_celestial_event_id_seq OWNED BY public.celestial_event.celestial_event_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(100) NOT NULL,
    num_stars bigint NOT NULL,
    is_active boolean NOT NULL,
    description text
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    radius integer NOT NULL,
    is_habitable boolean NOT NULL,
    surface_features text
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    diameter integer NOT NULL,
    has_life boolean,
    atmosphere_composition text
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    mass numeric(10,3) NOT NULL,
    is_main_sequence boolean NOT NULL,
    spectral_type character varying(50)
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
-- Name: celestial_event celestial_event_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event ALTER COLUMN celestial_event_id SET DEFAULT nextval('public.celestial_event_celestial_event_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: celestial_event; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_event VALUES (1, 'Supernova 1987A', '1987-02-23 00:00:00', 6, 'A supernova observed in the Large Magellanic Cloud');
INSERT INTO public.celestial_event VALUES (2, 'Milky Way Collision Prediction', '5000-01-01 00:00:00', 2, 'Predicted collision between Milky Way and Andromeda');
INSERT INTO public.celestial_event VALUES (3, 'Whirlpool Galaxy Event', '2000-06-12 00:00:00', 4, 'Observed spiral wave disturbance');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 200000000000, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 100000000000, true, 'Nearest large galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 40000000000, true, 'Third-largest in the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 30000000000, true, 'Famous for its beauty');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 8000000000, true, 'Unique halo structure');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 3000000000, false, 'A satellite galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737, false, 'Craters, Maria');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11, false, 'Irregular shape, Craters');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6, false, 'Irregular shape, Dust');
INSERT INTO public.moon VALUES (4, 'Europa', 4, 1560, false, 'Ice, Potential oceans');
INSERT INTO public.moon VALUES (5, 'Titan', 5, 2575, true, 'Lakes of methane');
INSERT INTO public.moon VALUES (6, 'Enceladus', 5, 252, false, 'Cryovolcanoes');
INSERT INTO public.moon VALUES (7, 'Callisto', 4, 2410, false, 'Heavily cratered');
INSERT INTO public.moon VALUES (8, 'Io', 4, 1821, false, 'Volcanic activity');
INSERT INTO public.moon VALUES (9, 'Ganymede', 4, 2634, false, 'Largest moon in the Solar System');
INSERT INTO public.moon VALUES (10, 'Triton', 7, 1353, false, 'Retrograde orbit');
INSERT INTO public.moon VALUES (11, 'Oberon', 6, 761, false, 'Craters, Ice');
INSERT INTO public.moon VALUES (12, 'Miranda', 6, 236, false, 'Cliffs, Ridges');
INSERT INTO public.moon VALUES (13, 'Charon', 8, 606, false, 'Locked with Pluto');
INSERT INTO public.moon VALUES (14, 'Nix', 8, 49, false, 'Irregular orbit');
INSERT INTO public.moon VALUES (15, 'Hydra', 8, 43, false, 'Irregular orbit');
INSERT INTO public.moon VALUES (16, 'Kepler-22b I', 9, 800, false, 'Unknown');
INSERT INTO public.moon VALUES (17, 'Kepler-22b II', 9, 1200, false, 'Unknown');
INSERT INTO public.moon VALUES (18, 'Gliese 581g I', 10, 600, false, 'Unknown');
INSERT INTO public.moon VALUES (19, 'HD 209458 b I', 11, 500, false, 'Unknown');
INSERT INTO public.moon VALUES (20, '55 Cancri e I', 12, 400, false, 'Unknown');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 12742, true, 'Nitrogen, Oxygen');
INSERT INTO public.planet VALUES (2, 'Mars', 1, 6779, false, 'Carbon Dioxide, Nitrogen');
INSERT INTO public.planet VALUES (3, 'Venus', 1, 12104, false, 'Carbon Dioxide, Sulfur Dioxide');
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, 139820, false, 'Hydrogen, Helium');
INSERT INTO public.planet VALUES (5, 'Saturn', 1, 116460, false, 'Hydrogen, Helium');
INSERT INTO public.planet VALUES (6, 'Uranus', 1, 50724, false, 'Hydrogen, Helium, Methane');
INSERT INTO public.planet VALUES (7, 'Neptune', 1, 49244, false, 'Hydrogen, Helium, Methane');
INSERT INTO public.planet VALUES (8, 'Kepler-22b', 2, 24560, false, 'Water vapor');
INSERT INTO public.planet VALUES (9, 'Kepler-16b', 2, 120000, false, 'Methane, Helium');
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 3, 22000, false, 'Unknown');
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 4, 140000, false, 'Hydrogen, Carbon Monoxide');
INSERT INTO public.planet VALUES (12, '55 Cancri e', 5, 22000, false, 'Carbon Dioxide');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.989, true, 'G2V');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 2.063, true, 'A1V');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 19.360, false, 'M1-2Ia-Iab');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 0.123, true, 'M5.5V');
INSERT INTO public.star VALUES (5, 'Vega', 1, 2.135, true, 'A0V');
INSERT INTO public.star VALUES (6, 'Rigel', 2, 21.000, false, 'B8Ia');


--
-- Name: celestial_event_celestial_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_event_celestial_event_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: celestial_event celestial_event_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT celestial_event_name_key UNIQUE (name);


--
-- Name: celestial_event celestial_event_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT celestial_event_pkey PRIMARY KEY (celestial_event_id);


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
-- Name: celestial_event celestial_event_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT celestial_event_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

