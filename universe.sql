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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    brightest_star character varying(100),
    number_of_stars integer DEFAULT 0 NOT NULL,
    area_in_square_degrees numeric DEFAULT 0 NOT NULL,
    discovered_by text DEFAULT 'Ancient Astronomers'::text NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    distance_from_earth numeric DEFAULT 1000000.52 NOT NULL,
    age_in_millions_of_years integer DEFAULT 1000000 NOT NULL,
    planet_types integer DEFAULT 5 NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    habitable boolean DEFAULT false NOT NULL,
    discovered_by name DEFAULT 'Galileo'::name NOT NULL
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
    planet_id integer,
    name character varying(100) NOT NULL,
    distance_from_earth numeric DEFAULT 1000000.52 NOT NULL,
    age_in_millions_of_years integer DEFAULT 1000000 NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    habitable boolean DEFAULT false NOT NULL,
    discovered_by text DEFAULT 'Galileo'::text NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(100) NOT NULL,
    distance_from_earth numeric DEFAULT 1000000.52 NOT NULL,
    age_in_millions_of_years integer DEFAULT 1000000 NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    habitable boolean DEFAULT false NOT NULL,
    discovered_by text DEFAULT 'Galileo'::text NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(100) NOT NULL,
    distance_from_earth numeric DEFAULT 1000000.52 NOT NULL,
    age_in_millions_of_years integer DEFAULT 1000000 NOT NULL,
    planet_types integer DEFAULT 5 NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    habitable boolean DEFAULT false NOT NULL,
    discovered_by text DEFAULT 'Galileo'::text NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Rigel', 81, 594, 'Ancient Astronomers');
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'Alioth', 93, 1280, 'Ancient Astronomers');
INSERT INTO public.constellation VALUES (3, 'Cassiopeia', 'Schedar', 53, 598, 'Ancient Astronomers');
INSERT INTO public.constellation VALUES (4, 'Scorpius', 'Antares', 47, 497, 'Ancient Astronomers');
INSERT INTO public.constellation VALUES (5, 'Lyra', 'Vega', 25, 286, 'Ancient Astronomers');
INSERT INTO public.constellation VALUES (6, 'Taurus', 'Aldebaran', 47, 797, 'Ancient Astronomers');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 13600, 8, true, true, 'Galileo');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000, 10000, 5, false, false, 'Edwin Hubble');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000, 10000, 3, false, false, 'Charles Messier');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 23000000, 500, 2, false, false, 'Charles Messier');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 29000000, 1000, 4, false, false, 'Pierre Méchain');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 21000000, 1000, 6, false, false, 'Pierre Méchain');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Moon', 0.0000158, 4500, false, false, 'Ancient Astronomers');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 5, 'Io', 0.0000826, 4500, false, false, 'Galileo Galilei');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 5, 'Europa', 0.0000826, 4500, false, false, 'Galileo Galilei');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 5, 'Ganymede', 0.0000826, 4500, false, false, 'Galileo Galilei');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 5, 'Callisto', 0.0000826, 4500, false, false, 'Galileo Galilei');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 6, 'Titan', 0.000151, 4500, false, false, 'Christiaan Huygens');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 6, 'Rhea', 0.000151, 4500, false, false, 'Giovanni Domenico Cassini');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 6, 'Iapetus', 0.000151, 4500, false, false, 'Giovanni Domenico Cassini');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 6, 'Dione', 0.000151, 4500, false, false, 'Giovanni Domenico Cassini');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 6, 'Tethys', 0.000151, 4500, false, false, 'Giovanni Domenico Cassini');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 6, 'Enceladus', 0.000151, 4500, false, false, 'William Herschel');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 7, 'Miranda', 0.000306, 4500, false, false, 'Gerard Kuiper');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 7, 'Ariel', 0.000306, 4500, false, false, 'William Lassell');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 7, 'Umbriel', 0.000306, 4500, false, false, 'William Lassell');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 7, 'Titania', 0.000306, 4500, false, false, 'William Herschel');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 7, 'Oberon', 0.000306, 4500, false, false, 'William Herschel');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 8, 'Triton', 0.000454, 4500, false, false, 'William Lassell');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 8, 'Nereid', 0.000454, 4500, false, false, 'Gerard Kuiper');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 8, 'Proteus', 0.000454, 4500, false, false, 'Voyager 2');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 8, 'Larissa', 0.000454, 4500, false, false, 'Harold Reitsema');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Mercury', 0.0000158, 4600, false, false, 'Ancient Astronomers');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 1, 'Venus', 0.0000272, 4600, false, false, 'Ancient Astronomers');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 1, 'Earth', 0.0000158, 4600, true, true, 'Ancient Astronomers');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 1, 'Mars', 0.0000241, 4600, false, false, 'Ancient Astronomers');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 1, 'Jupiter', 0.0000826, 4600, false, false, 'Ancient Astronomers');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 1, 'Saturn', 0.000151, 4600, false, false, 'Ancient Astronomers');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 1, 'Uranus', 0.000306, 4600, false, false, 'William Herschel');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 1, 'Neptune', 0.000454, 4600, false, false, 'Urbain Le Verrier');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 2, 'Proxima b', 4.24, 4500, false, false, 'Anglada-Escudé et al.');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 3, 'Sirius b', 8.6, 300, false, false, 'Walter Adams');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 4, 'Betelgeuse b', 642.5, 10000, false, false, 'Hypothetical');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 5, 'Rigel b', 860, 8000, false, false, 'Hypothetical');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Sun', 0, 4600, 8, true, true, 'Ancient Astronomers');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 1, 'Proxima Centauri', 4.24, 4500, 1, false, false, 'Robert Innes');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 2, 'Sirius', 8.6, 300, 0, false, false, 'Ancient Astronomers');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 2, 'Betelgeuse', 642.5, 10000, 0, false, false, 'Ancient Astronomers');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 3, 'Rigel', 860, 8000, 0, false, false, 'Ancient Astronomers');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 4, 'Vega', 25, 455, 0, false, false, 'Ancient Astronomers');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


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
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

