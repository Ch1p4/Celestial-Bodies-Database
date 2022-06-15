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
-- Name: celestial_body; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_body (
    type character varying NOT NULL,
    aprox_age_in_bil_of_years integer NOT NULL,
    celestial_body_id integer NOT NULL,
    name character varying
);


ALTER TABLE public.celestial_body OWNER TO freecodecamp;

--
-- Name: celestial_body_age_celestial_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_body_age_celestial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_body_age_celestial_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_body_age_celestial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_body_age_celestial_id_seq OWNED BY public.celestial_body.celestial_body_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    constellation character varying NOT NULL,
    distance_from_earth_in_kpc numeric,
    type character varying
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
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    random_fact text NOT NULL,
    average_orbital_speed_in_km_per_sec numeric NOT NULL
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
    name character varying NOT NULL,
    star_id integer NOT NULL,
    is_bigger_than_earth boolean NOT NULL,
    known_satellites integer NOT NULL
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
    name character varying NOT NULL,
    aprox_age_in_bil_of_years numeric,
    galaxy_id integer NOT NULL,
    is_bigger_than_sun boolean NOT NULL
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
-- Name: celestial_body celestial_body_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body ALTER COLUMN celestial_body_id SET DEFAULT nextval('public.celestial_body_age_celestial_id_seq'::regclass);


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
-- Data for Name: celestial_body; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_body VALUES ('Star', 5, 1, 'Sun');
INSERT INTO public.celestial_body VALUES ('Planet', 5, 2, 'Earth');
INSERT INTO public.celestial_body VALUES ('Moon', 5, 3, 'Europa');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', 7.86, 'Barred spiral galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda', 752, 'Barred spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 'Cigar', 'Ursa Major', 3500, 'Stardust galaxy');
INSERT INTO public.galaxy VALUES (4, 'Tadpole', 'Draco', 122640, 'Disrupted barred spiral galaxy');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Canes Venatici', 9500, 'Spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Sculptor', 150000, 'Lenticular and ring galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'According to recent research, scientists suggest that the Moon´s influence on the Earth may contribute to maintaining Earth´s magnetic field.', 1.022);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Phobos is one of the least reflective bodies in the Solar System.', 2.138);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Deimos regularly passes in front of the Sun as seen from Mars.', 1.3513);
INSERT INTO public.moon VALUES (4, 'Metis', 5, 'Metis is the innermost of Jupiter´s four small inner moons.', 31.501);
INSERT INTO public.moon VALUES (5, 'Adrastea', 5, 'Adrastea is one of the few moons in the Solar System known to orbit its planet in less than the length of that planet´s day.', 31.378);
INSERT INTO public.moon VALUES (6, 'Amalthea', 5, 'The surface of Amalthea is very red.', 26.57);
INSERT INTO public.moon VALUES (7, 'Thebe', 5, 'The surface of Thebe is dark and appears to be reddish in color.', 23.92);
INSERT INTO public.moon VALUES (8, 'Io', 5, 'With over 400 active volcanoes, Io is the most geologically active object in the Solar System.', 17.334);
INSERT INTO public.moon VALUES (9, 'Europa', 5, 'Europa has the smoothest surface of any known solid object in the Solar System.', 13.743);
INSERT INTO public.moon VALUES (10, 'Ganymede', 5, 'Ganymede is composed of approximately equal amounts of silicate rock and water.', 10.880);
INSERT INTO public.moon VALUES (11, 'Callisto', 5, 'The ancient surface of Callisto is one of the most heavily cratered in the Solar System.', 8.204);
INSERT INTO public.moon VALUES (12, 'Mimas', 6, 'Mimas is the smallest astronomical body that is known to still be rounded in shape because of self-gravitation.', 14.28);
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, 'Enceladus is a relatively small satellite composed of ice and rock.', 0.239);
INSERT INTO public.moon VALUES (14, 'Tethys', 6, 'The extremely water-ice-rich composition of Tethys remains unexplained.', 11.35);
INSERT INTO public.moon VALUES (15, 'Dione', 6, 'Dione´s leading hemisphere is heavily cratered and is uniformly bright..', 0.51);
INSERT INTO public.moon VALUES (16, 'Rhea', 6, 'Rhea is consistent with a homogeneous body in hydrostatic equilibrium rotating at Rhea´s angular velocity.', 8.48);
INSERT INTO public.moon VALUES (17, 'Titan', 6, 'The atmosphere of Titan is largely nitrogen.', 5.57);
INSERT INTO public.moon VALUES (18, 'Iapetus', 6, 'The difference in colouring between the two Iapetian hemispheres is striking.', 3.26);
INSERT INTO public.moon VALUES (19, 'Miranda', 7, 'Miranda is one of the smallest closely observed objects in the Solar System that might be in hydrostatic equilibrium (spherical under its own gravity).', 6.66);
INSERT INTO public.moon VALUES (20, 'Ariel', 7, 'Ariel is the most reflective of Uranus´s moons.', 5.51);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, true, 80);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, true, 83);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, true, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, true, 14);
INSERT INTO public.planet VALUES (9, 'Proxima d', 2, false, 0);
INSERT INTO public.planet VALUES (10, 'Proxima b', 2, true, 0);
INSERT INTO public.planet VALUES (11, 'Proxima c', 2, true, 0);
INSERT INTO public.planet VALUES (12, 'Pluto', 1, false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4.6, 1, false);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.85, 1, false);
INSERT INTO public.star VALUES (3, 'Sirius', 0.242, 1, true);
INSERT INTO public.star VALUES (4, 'Alpheratz', 0.060, 2, true);
INSERT INTO public.star VALUES (5, 'Delta Andromedae', 3.2, 2, true);
INSERT INTO public.star VALUES (6, 'Almach', 0.0065, 2, true);


--
-- Name: celestial_body_age_celestial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_body_age_celestial_id_seq', 3, true);


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
-- Name: celestial_body celestial_body_age_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body
    ADD CONSTRAINT celestial_body_age_pkey PRIMARY KEY (celestial_body_id);


--
-- Name: celestial_body celestial_body_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body
    ADD CONSTRAINT celestial_body_name_key UNIQUE (name);


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
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

