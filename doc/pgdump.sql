--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: bonus; Type: TABLE; Schema: public; Owner: standup75; Tablespace: 
--

CREATE TABLE bonus (
    id integer NOT NULL,
    slug character varying(255),
    name character varying(255),
    family character varying(255),
    set integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.bonus OWNER TO standup75;

--
-- Name: bonus_id_seq; Type: SEQUENCE; Schema: public; Owner: standup75
--

CREATE SEQUENCE bonus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bonus_id_seq OWNER TO standup75;

--
-- Name: bonus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: standup75
--

ALTER SEQUENCE bonus_id_seq OWNED BY bonus.id;


--
-- Name: checkpoints; Type: TABLE; Schema: public; Owner: standup75; Tablespace: 
--

CREATE TABLE checkpoints (
    id integer NOT NULL,
    x integer,
    y integer,
    cp_index integer,
    world_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    level_id integer,
    link_to_world_id integer,
    kind integer DEFAULT 0
);


ALTER TABLE public.checkpoints OWNER TO standup75;

--
-- Name: checkpoints_id_seq; Type: SEQUENCE; Schema: public; Owner: standup75
--

CREATE SEQUENCE checkpoints_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checkpoints_id_seq OWNER TO standup75;

--
-- Name: checkpoints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: standup75
--

ALTER SEQUENCE checkpoints_id_seq OWNED BY checkpoints.id;


--
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: standup75; Tablespace: 
--

CREATE TABLE feedbacks (
    id integer NOT NULL,
    content text,
    user_id integer,
    user_agent character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.feedbacks OWNER TO standup75;

--
-- Name: feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: standup75
--

CREATE SEQUENCE feedbacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feedbacks_id_seq OWNER TO standup75;

--
-- Name: feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: standup75
--

ALTER SEQUENCE feedbacks_id_seq OWNED BY feedbacks.id;


--
-- Name: game_data; Type: TABLE; Schema: public; Owner: standup75; Tablespace: 
--

CREATE TABLE game_data (
    id integer NOT NULL,
    level_id integer,
    user_id integer,
    star_count integer,
    "time" integer,
    status integer,
    user_agent character varying(255),
    uuid character varying(255)
);


ALTER TABLE public.game_data OWNER TO standup75;

--
-- Name: game_data_id_seq; Type: SEQUENCE; Schema: public; Owner: standup75
--

CREATE SEQUENCE game_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_data_id_seq OWNER TO standup75;

--
-- Name: game_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: standup75
--

ALTER SEQUENCE game_data_id_seq OWNED BY game_data.id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: standup75; Tablespace: 
--

CREATE TABLE games (
    id integer NOT NULL,
    slug character varying(255),
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    sizing_mode character varying(255),
    width integer,
    height integer
);


ALTER TABLE public.games OWNER TO standup75;

--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: standup75
--

CREATE SEQUENCE games_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_id_seq OWNER TO standup75;

--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: standup75
--

ALTER SEQUENCE games_id_seq OWNED BY games.id;


--
-- Name: level_bonus; Type: TABLE; Schema: public; Owner: standup75; Tablespace: 
--

CREATE TABLE level_bonus (
    id integer NOT NULL,
    level_id integer,
    bonu_id integer,
    x integer,
    y integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.level_bonus OWNER TO standup75;

--
-- Name: level_bonus_id_seq; Type: SEQUENCE; Schema: public; Owner: standup75
--

CREATE SEQUENCE level_bonus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.level_bonus_id_seq OWNER TO standup75;

--
-- Name: level_bonus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: standup75
--

ALTER SEQUENCE level_bonus_id_seq OWNED BY level_bonus.id;


--
-- Name: level_sprites; Type: TABLE; Schema: public; Owner: standup75; Tablespace: 
--

CREATE TABLE level_sprites (
    id integer NOT NULL,
    level_id integer,
    sprite_id integer,
    x integer,
    y integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.level_sprites OWNER TO standup75;

--
-- Name: level_sprites_id_seq; Type: SEQUENCE; Schema: public; Owner: standup75
--

CREATE SEQUENCE level_sprites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.level_sprites_id_seq OWNER TO standup75;

--
-- Name: level_sprites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: standup75
--

ALTER SEQUENCE level_sprites_id_seq OWNED BY level_sprites.id;


--
-- Name: level_tiles; Type: TABLE; Schema: public; Owner: standup75; Tablespace: 
--

CREATE TABLE level_tiles (
    id integer NOT NULL,
    level_id integer,
    x integer,
    y integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.level_tiles OWNER TO standup75;

--
-- Name: level_tiles_id_seq; Type: SEQUENCE; Schema: public; Owner: standup75
--

CREATE SEQUENCE level_tiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.level_tiles_id_seq OWNER TO standup75;

--
-- Name: level_tiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: standup75
--

ALTER SEQUENCE level_tiles_id_seq OWNED BY level_tiles.id;


--
-- Name: levels; Type: TABLE; Schema: public; Owner: standup75; Tablespace: 
--

CREATE TABLE levels (
    id integer NOT NULL,
    slug character varying(255),
    name character varying(255),
    tile_count_x integer DEFAULT 20,
    tile_count_y integer DEFAULT 20,
    world_id integer,
    set integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    level_index integer,
    speed integer DEFAULT 100
);


ALTER TABLE public.levels OWNER TO standup75;

--
-- Name: levels_id_seq; Type: SEQUENCE; Schema: public; Owner: standup75
--

CREATE SEQUENCE levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.levels_id_seq OWNER TO standup75;

--
-- Name: levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: standup75
--

ALTER SEQUENCE levels_id_seq OWNED BY levels.id;


--
-- Name: options; Type: TABLE; Schema: public; Owner: standup75; Tablespace: 
--

CREATE TABLE options (
    id integer NOT NULL,
    sprite_id integer,
    label character varying(255),
    content character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    bonu_id integer,
    level_id integer
);


ALTER TABLE public.options OWNER TO standup75;

--
-- Name: options_id_seq; Type: SEQUENCE; Schema: public; Owner: standup75
--

CREATE SEQUENCE options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.options_id_seq OWNER TO standup75;

--
-- Name: options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: standup75
--

ALTER SEQUENCE options_id_seq OWNED BY options.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: standup75; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    slug character varying(255),
    name character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO standup75;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: standup75
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO standup75;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: standup75
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: standup75; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO standup75;

--
-- Name: sprites; Type: TABLE; Schema: public; Owner: standup75; Tablespace: 
--

CREATE TABLE sprites (
    id integer NOT NULL,
    slug character varying(255),
    name character varying(255),
    family character varying(255),
    set integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    helping_sprite_id integer
);


ALTER TABLE public.sprites OWNER TO standup75;

--
-- Name: sprites_id_seq; Type: SEQUENCE; Schema: public; Owner: standup75
--

CREATE SEQUENCE sprites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sprites_id_seq OWNER TO standup75;

--
-- Name: sprites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: standup75
--

ALTER SEQUENCE sprites_id_seq OWNED BY sprites.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: standup75; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    slug character varying(255),
    password_digest character varying(255),
    high_score integer,
    high_level integer,
    role_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    game_progress character varying(255),
    highscore integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO standup75;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: standup75
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO standup75;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: standup75
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: worlds; Type: TABLE; Schema: public; Owner: standup75; Tablespace: 
--

CREATE TABLE worlds (
    id integer NOT NULL,
    slug character varying(255),
    name character varying(255),
    game_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    grid_width integer DEFAULT 20,
    grid_height integer DEFAULT 20,
    world_index integer,
    background_color character varying(255),
    hint character varying(255)
);


ALTER TABLE public.worlds OWNER TO standup75;

--
-- Name: worlds_id_seq; Type: SEQUENCE; Schema: public; Owner: standup75
--

CREATE SEQUENCE worlds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.worlds_id_seq OWNER TO standup75;

--
-- Name: worlds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: standup75
--

ALTER SEQUENCE worlds_id_seq OWNED BY worlds.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: standup75
--

ALTER TABLE ONLY bonus ALTER COLUMN id SET DEFAULT nextval('bonus_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: standup75
--

ALTER TABLE ONLY checkpoints ALTER COLUMN id SET DEFAULT nextval('checkpoints_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: standup75
--

ALTER TABLE ONLY feedbacks ALTER COLUMN id SET DEFAULT nextval('feedbacks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: standup75
--

ALTER TABLE ONLY game_data ALTER COLUMN id SET DEFAULT nextval('game_data_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: standup75
--

ALTER TABLE ONLY games ALTER COLUMN id SET DEFAULT nextval('games_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: standup75
--

ALTER TABLE ONLY level_bonus ALTER COLUMN id SET DEFAULT nextval('level_bonus_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: standup75
--

ALTER TABLE ONLY level_sprites ALTER COLUMN id SET DEFAULT nextval('level_sprites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: standup75
--

ALTER TABLE ONLY level_tiles ALTER COLUMN id SET DEFAULT nextval('level_tiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: standup75
--

ALTER TABLE ONLY levels ALTER COLUMN id SET DEFAULT nextval('levels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: standup75
--

ALTER TABLE ONLY options ALTER COLUMN id SET DEFAULT nextval('options_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: standup75
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: standup75
--

ALTER TABLE ONLY sprites ALTER COLUMN id SET DEFAULT nextval('sprites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: standup75
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: standup75
--

ALTER TABLE ONLY worlds ALTER COLUMN id SET DEFAULT nextval('worlds_id_seq'::regclass);


--
-- Data for Name: bonus; Type: TABLE DATA; Schema: public; Owner: standup75
--

COPY bonus (id, slug, name, family, set, created_at, updated_at) FROM stdin;
8	speed	Speed	Speed	0	2012-12-15 19:59:42.764802	2012-12-15 19:59:42.764802
9	pill	Pill	Pill	0	2012-12-15 19:59:42.937812	2013-01-01 20:35:25.181973
11	star	Star	Star	0	2012-12-15 19:59:43.240829	2012-12-15 19:59:43.240829
12	death	Death	Death	0	2012-12-21 22:07:41.074747	2013-01-01 20:35:52.525537
13	cherry	Cherry	Fruits	1	2013-01-19 21:00:36.4009	2013-01-19 21:00:36.4009
14	strawberry	Strawberry	Fruits	1	2013-01-19 23:37:24.724439	2013-01-19 23:39:05.743216
15	orange	Orange	Fruits	1	2013-01-19 23:43:35.894668	2013-01-19 23:44:27.32861
16	pretzel	Pretzel	Fruits	1	2013-01-19 23:44:39.789323	2013-01-19 23:45:07.312897
17	apple	Apple	Fruits	1	2013-01-19 23:45:45.518082	2013-01-19 23:45:45.518082
18	pear	Pear	Fruits	1	2013-01-19 23:46:27.240469	2013-01-19 23:46:27.240469
19	banana	Banana	Fruits	1	2013-01-19 23:46:57.824218	2013-01-19 23:46:57.824218
20	stopngo	Stopngo	Stopngo	0	2013-03-07 01:39:48.740291	2013-03-07 01:41:03.224551
21	red-star	Red Star	RedStar	0	2013-03-30 23:14:59.22346	2013-03-30 23:15:14.565305
22	learning-star	Learning Star	LearningStar	0	2013-04-01 03:36:53.154327	2013-04-01 03:37:17.546663
23	fire	Fire	Fire	0	2013-04-06 15:56:07.316253	2013-04-06 15:56:07.316253
24	life	Life	Life	0	2013-04-13 14:57:17.402768	2013-04-13 14:57:17.402768
\.


--
-- Name: bonus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: standup75
--

SELECT pg_catalog.setval('bonus_id_seq', 1, false);


--
-- Data for Name: checkpoints; Type: TABLE DATA; Schema: public; Owner: standup75
--

COPY checkpoints (id, x, y, cp_index, world_id, created_at, updated_at, level_id, link_to_world_id, kind) FROM stdin;
1544	11	38	0	5	2013-05-25 00:41:01.980169	2013-05-25 00:41:01.980169	\N	2	4
1545	14	35	1	5	2013-05-25 00:41:01.986414	2013-05-25 00:41:01.986414	53	\N	0
1546	18	31	2	5	2013-05-25 00:41:01.993534	2013-05-25 00:41:01.993534	51	\N	0
1547	21	28	3	5	2013-05-25 00:41:01.999755	2013-05-25 00:41:01.999755	52	\N	0
1548	25	26	4	5	2013-05-25 00:41:02.006737	2013-05-25 00:41:02.006737	38	\N	0
1549	29	25	5	5	2013-05-25 00:41:02.012789	2013-05-25 00:41:02.012789	18	\N	0
1550	26	22	6	5	2013-05-25 00:41:02.018468	2013-05-25 00:41:02.018468	25	\N	0
1551	21	22	7	5	2013-05-25 00:41:02.024249	2013-05-25 00:41:02.024249	39	\N	0
1552	18	20	8	5	2013-05-25 00:41:02.02701	2013-05-25 00:41:02.02701	49	\N	2
1553	13	22	9	5	2013-05-25 00:41:02.034055	2013-05-25 00:41:02.034055	40	\N	0
1554	9	21	10	5	2013-05-25 00:41:02.040972	2013-05-25 00:41:02.040972	35	\N	0
1555	7	18	11	5	2013-05-25 00:41:02.047524	2013-05-25 00:41:02.047524	36	\N	0
1556	6	14	12	5	2013-05-25 00:41:02.054681	2013-05-25 00:41:02.054681	37	\N	0
1557	7	11	13	5	2013-05-25 00:41:02.06149	2013-05-25 00:41:02.06149	47	\N	0
1558	9	8	14	5	2013-05-25 00:41:02.067937	2013-05-25 00:41:02.067937	48	\N	0
1559	12	6	15	5	2013-05-25 00:41:02.07432	2013-05-25 00:41:02.07432	54	\N	0
1560	15	4	16	5	2013-05-25 00:41:02.080772	2013-05-25 00:41:02.080772	55	\N	0
1561	16	1	17	5	2013-05-25 00:41:02.08338	2013-05-25 00:41:02.08338	\N	2	5
1807	1	30	0	10	2013-06-22 22:05:44.752882	2013-06-22 22:05:44.752882	\N	\N	4
1808	4	28	1	10	2013-06-22 22:05:44.759741	2013-06-22 22:05:44.759741	56	\N	0
1809	6	26	2	10	2013-06-22 22:05:44.768557	2013-06-22 22:05:44.768557	57	\N	0
1810	9	24	3	10	2013-06-22 22:05:44.775694	2013-06-22 22:05:44.775694	58	\N	0
1811	12	22	4	10	2013-06-22 22:05:44.782443	2013-06-22 22:05:44.782443	59	\N	0
1812	13	19	5	10	2013-06-22 22:05:44.789895	2013-06-22 22:05:44.789895	61	\N	0
1813	13	16	6	10	2013-06-22 22:05:44.79702	2013-06-22 22:05:44.79702	50	\N	0
1814	16	15	7	10	2013-06-22 22:05:44.803901	2013-06-22 22:05:44.803901	63	\N	0
1815	19	14	8	10	2013-06-22 22:05:44.810453	2013-06-22 22:05:44.810453	62	\N	0
1816	22	13	9	10	2013-06-22 22:05:44.817131	2013-06-22 22:05:44.817131	64	\N	0
1817	25	13	10	10	2013-06-22 22:05:44.823573	2013-06-22 22:05:44.823573	65	\N	0
1818	27	12	11	10	2013-06-22 22:05:44.83013	2013-06-22 22:05:44.83013	66	\N	0
1819	24	11	12	10	2013-06-22 22:05:44.83687	2013-06-22 22:05:44.83687	69	\N	0
1820	21	10	13	10	2013-06-22 22:05:44.843906	2013-06-22 22:05:44.843906	68	\N	0
1821	15	12	14	10	2013-06-22 22:05:44.846625	2013-06-22 22:05:44.846625	70	\N	2
1822	19	8	15	10	2013-06-22 22:05:44.852851	2013-06-22 22:05:44.852851	67	\N	0
1823	21	6	16	10	2013-06-22 22:05:44.856698	2013-06-22 22:05:44.856698	\N	\N	5
2202	38	11	0	3	2013-06-29 22:18:00.67151	2013-06-29 22:18:00.67151	\N	\N	4
2203	31	18	1	3	2013-06-29 22:18:00.679369	2013-06-29 22:18:00.679369	75	\N	0
2204	24	27	2	3	2013-06-29 22:18:00.685726	2013-06-29 22:18:00.685726	77	\N	0
2205	18	23	3	3	2013-06-29 22:18:00.693541	2013-06-29 22:18:00.693541	76	\N	0
2206	16	15	4	3	2013-06-29 22:18:00.700929	2013-06-29 22:18:00.700929	78	\N	0
2207	11	18	5	3	2013-06-29 22:18:00.708754	2013-06-29 22:18:00.708754	22	\N	0
2208	5	10	6	3	2013-06-29 22:18:00.715675	2013-06-29 22:18:00.715675	79	\N	0
2209	4	24	7	3	2013-06-29 22:18:00.724949	2013-06-29 22:18:00.724949	80	\N	0
2210	4	30	8	3	2013-06-29 22:18:00.731842	2013-06-29 22:18:00.731842	85	\N	0
2211	9	31	9	3	2013-06-29 22:18:00.739594	2013-06-29 22:18:00.739594	82	\N	0
2212	13	31	10	3	2013-06-29 22:18:00.743553	2013-06-29 22:18:00.743553	90	\N	2
2213	17	30	11	3	2013-06-29 22:18:00.750331	2013-06-29 22:18:00.750331	84	\N	0
2214	22	32	12	3	2013-06-29 22:18:00.758379	2013-06-29 22:18:00.758379	81	\N	0
2215	27	38	13	3	2013-06-29 22:18:00.762056	2013-06-29 22:18:00.762056	\N	\N	5
2353	3	39	0	6	2013-07-08 22:39:02.843736	2013-07-08 22:39:02.843736	\N	\N	4
2354	3	33	1	6	2013-07-08 22:39:02.850821	2013-07-08 22:39:02.850821	92	\N	0
2355	6	25	2	6	2013-07-08 22:39:02.856828	2013-07-08 22:39:02.856828	93	\N	0
2356	9	19	3	6	2013-07-08 22:39:02.863249	2013-07-08 22:39:02.863249	94	\N	0
2357	13	16	4	6	2013-07-08 22:39:02.869402	2013-07-08 22:39:02.869402	95	\N	0
2358	18	17	5	6	2013-07-08 22:39:02.875444	2013-07-08 22:39:02.875444	96	\N	0
2359	23	18	6	6	2013-07-08 22:39:02.881899	2013-07-08 22:39:02.881899	101	\N	0
2360	27	19	7	6	2013-07-08 22:39:02.888094	2013-07-08 22:39:02.888094	100	\N	0
2361	27	22	8	6	2013-07-08 22:39:02.893907	2013-07-08 22:39:02.893907	99	\N	0
2362	31	27	9	6	2013-07-08 22:39:02.899303	2013-07-08 22:39:02.899303	97	\N	0
2363	35	27	10	6	2013-07-08 22:39:02.90221	2013-07-08 22:39:02.90221	102	\N	2
2364	31	33	11	6	2013-07-08 22:39:02.907618	2013-07-08 22:39:02.907618	98	\N	0
2365	29	38	12	6	2013-07-08 22:39:02.910146	2013-07-08 22:39:02.910146	\N	\N	5
2458	2	11	0	2	2013-07-08 22:59:57.294859	2013-07-08 22:59:57.294859	\N	\N	3
2459	4	9	1	2	2013-07-08 22:59:57.299084	2013-07-08 22:59:57.299084	24	\N	2
2460	5	11	2	2	2013-07-08 22:59:57.306074	2013-07-08 22:59:57.306074	13	\N	0
2461	8	12	3	2	2013-07-08 22:59:57.312013	2013-07-08 22:59:57.312013	28	\N	0
2462	11	12	4	2	2013-07-08 22:59:57.317835	2013-07-08 22:59:57.317835	33	\N	0
2463	13	11	5	2	2013-07-08 22:59:57.32485	2013-07-08 22:59:57.32485	14	\N	0
2464	15	10	6	2	2013-07-08 22:59:57.330654	2013-07-08 22:59:57.330654	15	\N	0
2465	16	8	7	2	2013-07-08 22:59:57.336199	2013-07-08 22:59:57.336199	17	\N	0
2466	18	7	8	2	2013-07-08 22:59:57.343464	2013-07-08 22:59:57.343464	29	\N	0
2467	20	7	9	2	2013-07-08 22:59:57.346691	2013-07-08 22:59:57.346691	\N	5	1
2468	21	9	10	2	2013-07-08 22:59:57.353111	2013-07-08 22:59:57.353111	32	\N	0
2469	19	10	11	2	2013-07-08 22:59:57.358798	2013-07-08 22:59:57.358798	16	\N	0
2470	17	12	12	2	2013-07-08 22:59:57.3646	2013-07-08 22:59:57.3646	21	\N	0
2471	15	13	13	2	2013-07-08 22:59:57.370512	2013-07-08 22:59:57.370512	19	\N	0
2472	14	16	14	2	2013-07-08 22:59:57.376972	2013-07-08 22:59:57.376972	45	\N	0
2473	16	18	15	2	2013-07-08 22:59:57.379784	2013-07-08 22:59:57.379784	\N	10	1
2474	15	21	16	2	2013-07-08 22:59:57.386225	2013-07-08 22:59:57.386225	23	\N	0
2475	12	22	17	2	2013-07-08 22:59:57.392303	2013-07-08 22:59:57.392303	72	\N	0
2476	9	21	18	2	2013-07-08 22:59:57.39835	2013-07-08 22:59:57.39835	73	\N	0
2477	6	21	19	2	2013-07-08 22:59:57.404528	2013-07-08 22:59:57.404528	74	\N	0
2478	3	21	20	2	2013-07-08 22:59:57.407069	2013-07-08 22:59:57.407069	\N	3	1
2479	7	23	21	2	2013-07-08 22:59:57.413581	2013-07-08 22:59:57.413581	71	\N	0
2480	9	25	22	2	2013-07-08 22:59:57.419693	2013-07-08 22:59:57.419693	86	\N	0
2481	9	28	23	2	2013-07-08 22:59:57.425737	2013-07-08 22:59:57.425737	88	\N	0
2482	9	31	24	2	2013-07-08 22:59:57.431827	2013-07-08 22:59:57.431827	34	\N	0
2483	9	34	25	2	2013-07-08 22:59:57.438383	2013-07-08 22:59:57.438383	30	\N	0
2484	11	34	26	2	2013-07-08 22:59:57.440962	2013-07-08 22:59:57.440962	\N	6	1
2485	13	33	27	2	2013-07-08 22:59:57.447513	2013-07-08 22:59:57.447513	89	\N	0
2486	15	32	28	2	2013-07-08 22:59:57.454295	2013-07-08 22:59:57.454295	91	\N	0
2487	17	33	29	2	2013-07-08 22:59:57.461379	2013-07-08 22:59:57.461379	103	\N	0
2488	18	36	30	2	2013-07-08 22:59:57.465065	2013-07-08 22:59:57.465065	\N	\N	0
2489	19	37	31	2	2013-07-08 22:59:57.467805	2013-07-08 22:59:57.467805	\N	9	1
2490	20	36	32	2	2013-07-08 22:59:57.470752	2013-07-08 22:59:57.470752	\N	\N	0
2491	22	35	33	2	2013-07-08 22:59:57.473592	2013-07-08 22:59:57.473592	\N	\N	0
2492	20	33	34	2	2013-07-08 22:59:57.476319	2013-07-08 22:59:57.476319	\N	\N	0
2493	22	32	35	2	2013-07-08 22:59:57.479346	2013-07-08 22:59:57.479346	\N	\N	0
2494	24	31	36	2	2013-07-08 22:59:57.48214	2013-07-08 22:59:57.48214	\N	\N	0
2495	23	28	37	2	2013-07-08 22:59:57.484742	2013-07-08 22:59:57.484742	\N	\N	0
2496	24	26	38	2	2013-07-08 22:59:57.487793	2013-07-08 22:59:57.487793	\N	7	1
2497	26	27	39	2	2013-07-08 22:59:57.490469	2013-07-08 22:59:57.490469	\N	\N	0
2498	28	28	40	2	2013-07-08 22:59:57.493692	2013-07-08 22:59:57.493692	\N	\N	0
2499	29	25	41	2	2013-07-08 22:59:57.496527	2013-07-08 22:59:57.496527	\N	\N	0
2500	31	24	42	2	2013-07-08 22:59:57.499554	2013-07-08 22:59:57.499554	\N	\N	0
2501	32	22	43	2	2013-07-08 22:59:57.503115	2013-07-08 22:59:57.503115	\N	\N	0
2502	35	21	44	2	2013-07-08 22:59:57.505804	2013-07-08 22:59:57.505804	\N	\N	0
2503	33	20	45	2	2013-07-08 22:59:57.50943	2013-07-08 22:59:57.50943	\N	8	1
\.


--
-- Name: checkpoints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: standup75
--

SELECT pg_catalog.setval('checkpoints_id_seq', 1, false);


--
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: standup75
--

COPY feedbacks (id, content, user_id, user_agent, created_at, updated_at) FROM stdin;
\.


--
-- Name: feedbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: standup75
--

SELECT pg_catalog.setval('feedbacks_id_seq', 1, false);


--
-- Data for Name: game_data; Type: TABLE DATA; Schema: public; Owner: standup75
--

COPY game_data (id, level_id, user_id, star_count, "time", status, user_agent, uuid) FROM stdin;
14	13	2	0	17224	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
15	28	2	0	8816	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
16	28	2	0	26592	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
17	33	2	3	24764	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
18	14	2	3	328120	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
19	15	2	0	16334	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
20	15	2	0	68832	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
21	15	2	0	10682	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
22	15	2	0	12074	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
23	15	2	3	34096	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
24	17	2	2	36138	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
25	17	2	0	29803	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
26	17	2	0	51111	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
27	17	2	0	30868	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
28	17	2	3	127885	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
29	17	2	0	9483	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
30	29	2	0	12963	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
31	29	2	3	39452	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
32	53	2	3	51687	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
33	51	2	0	51716	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
34	33	10	3	29215	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
35	14	10	2	23607	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
36	15	10	3	27612	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
37	17	10	0	11247	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
38	14	10	3	53114	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
39	29	10	0	13444	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
40	29	10	3	53631	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
41	53	10	0	8638	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
42	53	10	3	65817	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
43	51	10	0	22256	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
44	32	10	0	16617	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
45	32	10	0	5192	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
46	32	10	0	92877	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
47	32	10	0	30510	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
48	32	10	0	21663	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
49	32	10	0	4654	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
50	32	10	0	4656	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
51	32	10	0	15863	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
52	17	10	0	32454	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
53	28	10	0	10307	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
54	28	10	0	8487	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
55	51	10	0	24975	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
56	51	10	0	13322	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
57	51	10	0	10892	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
58	51	10	0	9430	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
59	29	10	0	8373	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
60	32	10	0	5130	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
61	32	10	0	5128	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
62	29	10	0	9673	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
63	32	10	0	5110	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
64	29	10	0	10860	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
65	29	10	0	13202	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
66	51	10	0	53657	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
67	51	10	0	8612	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
68	32	10	0	93818	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
69	32	10	0	5129	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
70	32	10	0	5127	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
71	32	10	0	9396	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
72	32	10	0	5123	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
73	32	10	0	7907	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
74	32	10	0	8533	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
75	32	10	0	13551	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
76	32	10	0	11942	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
77	32	10	0	8361	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
78	32	10	0	50285	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
79	13	10	0	16618	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
80	32	10	0	24492	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
81	32	10	0	69128	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
82	32	10	3	105791	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
83	16	10	0	23501	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
84	16	10	0	26300	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
85	16	10	3	65227	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
86	21	10	0	19099	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
87	21	10	3	56659	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
88	19	10	3	48236	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
89	45	10	3	24630	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
90	56	10	0	41575	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
91	56	10	0	19427	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
92	56	10	0	17352	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
93	56	10	3	41830	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
94	57	10	0	9455	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
95	23	10	0	4999	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
96	57	10	0	10860	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
97	57	10	0	7494	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
98	57	10	0	19087	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
99	57	10	0	12252	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
100	57	10	2	69904	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
101	58	10	0	94402	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
102	58	10	0	29156	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
103	58	10	0	23258	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
104	23	10	0	14902	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:22.0) Gecko/20100101 Firefox/22.0	\N
105	23	10	3	64544	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36 OPR/15.0.1147.138	\N
106	57	10	3	55945	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
107	58	10	0	35068	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
108	58	10	0	36534	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
109	58	10	0	14182	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
110	58	10	0	8412	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
111	29	10	0	9385	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
112	29	10	0	9436	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
113	16	10	0	9300	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
114	16	10	0	9247	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
115	32	10	0	4645	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
116	32	10	0	4393	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
117	32	10	0	4913	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
118	32	10	0	4927	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
119	32	10	0	4921	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
120	32	10	0	39469	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
121	58	\N	0	11359	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
122	58	\N	0	46919	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
123	14	\N	0	7835	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
124	14	\N	0	8335	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
125	14	\N	0	11408	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
126	51	\N	0	36063	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
127	51	\N	0	11928	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
128	51	\N	0	39260	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
129	51	\N	0	11032	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
130	13	10	0	28630	1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
131	16	10	0	8514	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
132	15	10	0	5664	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
133	15	10	0	6046	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
134	15	10	0	12186	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
135	15	10	0	9049	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
136	15	10	0	9070	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
137	15	10	0	9680	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
138	32	10	0	5373	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
139	32	10	0	9941	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
140	32	10	0	7538	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
141	32	10	0	749797	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	\N
142	15	10	0	0	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
143	15	10	0	0	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
144	15	10	0	1	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
145	15	10	0	6715	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
146	15	10	0	6659	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
147	15	10	0	10205	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
148	15	10	0	7130	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
149	15	10	0	5793	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
150	15	10	0	5396	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
151	15	10	0	4660	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
152	15	10	0	4435	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
153	15	10	0	134816	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
154	15	10	0	4860	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
155	15	10	0	0	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
156	15	10	0	0	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
157	15	10	0	0	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
158	15	10	0	0	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
159	15	10	0	0	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
160	15	10	0	0	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
161	15	10	0	1	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
162	15	10	0	1	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
163	15	10	0	0	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
164	15	10	0	1	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
165	15	10	0	0	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
166	15	10	0	0	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
167	15	10	0	0	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
168	15	10	0	0	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
169	15	10	0	1	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
170	15	10	0	1	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
171	15	10	0	0	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
172	17	10	0	1	0	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36	f6788456-c97d-a3fb-47ec-7e73a2a2b3bd
\.


--
-- Name: game_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: standup75
--

SELECT pg_catalog.setval('game_data_id_seq', 172, true);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: standup75
--

COPY games (id, slug, name, created_at, updated_at, sizing_mode, width, height) FROM stdin;
4	draft	draft	2012-12-15 19:59:39.50493	2014-03-13 22:07:51.107151	fit	1026	720
\.


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: standup75
--

SELECT pg_catalog.setval('games_id_seq', 1, false);


--
-- Data for Name: level_bonus; Type: TABLE DATA; Schema: public; Owner: standup75
--

COPY level_bonus (id, level_id, bonu_id, x, y, created_at, updated_at) FROM stdin;
565	24	15	26	1	2013-02-24 23:44:15.55742	2013-02-24 23:44:15.55742
566	24	13	1	2	2013-02-24 23:44:15.55842	2013-02-24 23:44:15.55842
567	24	17	1	8	2013-02-24 23:44:15.665426	2013-02-24 23:44:15.665426
568	24	19	34	10	2013-02-24 23:44:15.759431	2013-02-24 23:44:15.759431
569	24	14	34	15	2013-02-24 23:44:15.929441	2013-02-24 23:44:15.929441
570	24	18	1	20	2013-02-24 23:44:16.009445	2013-02-24 23:44:16.009445
571	24	16	22	20	2013-02-24 23:44:16.018446	2013-02-24 23:44:16.018446
810	17	11	17	6	2013-04-11 02:27:24.991847	2013-04-11 02:27:24.991847
811	17	11	2	19	2013-04-11 02:27:25.017937	2013-04-11 02:27:25.017937
812	17	11	33	19	2013-04-11 02:27:25.020562	2013-04-11 02:27:25.020562
813	17	12	2	21	2013-04-11 02:27:25.023179	2013-04-11 02:27:25.023179
814	17	12	33	21	2013-04-11 02:27:25.043923	2013-04-11 02:27:25.043923
961	14	11	7	6	2013-04-13 00:06:06.488755	2013-04-13 00:06:06.488755
962	14	12	15	6	2013-04-13 00:06:06.492425	2013-04-13 00:06:06.492425
963	14	11	27	6	2013-04-13 00:06:06.495696	2013-04-13 00:06:06.495696
964	14	12	3	17	2013-04-13 00:06:06.561582	2013-04-13 00:06:06.561582
965	14	12	15	17	2013-04-13 00:06:06.562281	2013-04-13 00:06:06.562281
966	14	11	31	17	2013-04-13 00:06:06.568751	2013-04-13 00:06:06.568751
1039	36	11	4	4	2013-05-04 19:27:02.4688	2013-05-04 19:27:02.4688
1040	36	11	11	4	2013-05-04 19:27:02.469501	2013-05-04 19:27:02.469501
1041	36	11	29	10	2013-05-04 19:27:02.517522	2013-05-04 19:27:02.517522
1128	40	11	29	4	2013-05-05 14:53:10.285059	2013-05-05 14:53:10.285059
1129	40	12	11	11	2013-05-05 14:53:10.387865	2013-05-05 14:53:10.387865
1130	40	12	11	12	2013-05-05 14:53:10.394685	2013-05-05 14:53:10.394685
1131	40	12	11	13	2013-05-05 14:53:10.400479	2013-05-05 14:53:10.400479
1132	40	12	11	14	2013-05-05 14:53:10.402076	2013-05-05 14:53:10.402076
1133	40	11	5	15	2013-05-05 14:53:10.403601	2013-05-05 14:53:10.403601
1134	40	12	11	15	2013-05-05 14:53:10.405145	2013-05-05 14:53:10.405145
1135	40	11	29	15	2013-05-05 14:53:10.406737	2013-05-05 14:53:10.406737
1136	40	12	11	16	2013-05-05 14:53:10.40826	2013-05-05 14:53:10.40826
1137	40	12	11	17	2013-05-05 14:53:10.409558	2013-05-05 14:53:10.409558
1138	40	12	11	18	2013-05-05 14:53:10.410825	2013-05-05 14:53:10.410825
1139	40	12	11	20	2013-05-05 14:53:10.412084	2013-05-05 14:53:10.412084
1140	40	12	11	21	2013-05-05 14:53:10.413358	2013-05-05 14:53:10.413358
1296	39	12	13	3	2013-05-09 23:53:43.00026	2013-05-09 23:53:43.00026
1297	39	12	1	4	2013-05-09 23:53:43.027911	2013-05-09 23:53:43.027911
1298	39	12	25	7	2013-05-09 23:53:43.035775	2013-05-09 23:53:43.035775
1299	39	11	10	9	2013-05-09 23:53:43.037318	2013-05-09 23:53:43.037318
1300	39	11	30	9	2013-05-09 23:53:43.038688	2013-05-09 23:53:43.038688
1301	39	12	16	12	2013-05-09 23:53:43.04079	2013-05-09 23:53:43.04079
1302	39	11	21	13	2013-05-09 23:53:43.041708	2013-05-09 23:53:43.041708
1303	39	12	7	17	2013-05-09 23:53:43.042651	2013-05-09 23:53:43.042651
1304	15	12	18	6	2013-05-09 23:54:21.925544	2013-05-09 23:54:21.925544
1305	15	12	15	8	2013-05-09 23:54:21.927053	2013-05-09 23:54:21.927053
1306	15	11	18	8	2013-05-09 23:54:21.927697	2013-05-09 23:54:21.927697
1307	15	12	21	8	2013-05-09 23:54:21.928345	2013-05-09 23:54:21.928345
1308	15	11	18	13	2013-05-09 23:54:21.96143	2013-05-09 23:54:21.96143
1309	15	8	33	15	2013-05-09 23:54:21.973959	2013-05-09 23:54:21.973959
1310	15	11	18	18	2013-05-09 23:54:21.995649	2013-05-09 23:54:21.995649
1311	29	12	15	8	2013-05-09 23:55:08.624312	2013-05-09 23:55:08.624312
1312	29	12	20	8	2013-05-09 23:55:08.624999	2013-05-09 23:55:08.624999
1313	29	11	17	11	2013-05-09 23:55:08.636318	2013-05-09 23:55:08.636318
1314	29	12	15	14	2013-05-09 23:55:08.646825	2013-05-09 23:55:08.646825
1315	29	12	20	14	2013-05-09 23:55:08.647534	2013-05-09 23:55:08.647534
1316	29	11	6	19	2013-05-09 23:55:08.681587	2013-05-09 23:55:08.681587
1317	29	11	29	19	2013-05-09 23:55:08.685516	2013-05-09 23:55:08.685516
1318	19	12	12	11	2013-05-09 23:55:54.460952	2013-05-09 23:55:54.460952
1319	19	11	17	11	2013-05-09 23:55:54.461783	2013-05-09 23:55:54.461783
1320	19	12	23	11	2013-05-09 23:55:54.462457	2013-05-09 23:55:54.462457
1321	19	12	13	18	2013-05-09 23:55:54.527471	2013-05-09 23:55:54.527471
1322	19	12	22	18	2013-05-09 23:55:54.528186	2013-05-09 23:55:54.528186
1323	19	11	3	19	2013-05-09 23:55:54.528918	2013-05-09 23:55:54.528918
1324	19	11	33	19	2013-05-09 23:55:54.542161	2013-05-09 23:55:54.542161
1328	32	12	24	1	2013-05-10 02:36:49.126625	2013-05-10 02:36:49.126625
1329	32	11	26	1	2013-05-10 02:36:49.12759	2013-05-10 02:36:49.12759
1330	32	12	28	1	2013-05-10 02:36:49.128311	2013-05-10 02:36:49.128311
1331	32	11	30	1	2013-05-10 02:36:49.128948	2013-05-10 02:36:49.128948
1332	32	12	32	1	2013-05-10 02:36:49.129606	2013-05-10 02:36:49.129606
1333	32	12	19	4	2013-05-10 02:36:49.144154	2013-05-10 02:36:49.144154
1334	32	11	7	6	2013-05-10 02:36:49.156369	2013-05-10 02:36:49.156369
1335	32	12	26	7	2013-05-10 02:36:49.162453	2013-05-10 02:36:49.162453
1336	32	12	20	19	2013-05-10 02:36:49.223605	2013-05-10 02:36:49.223605
1337	32	12	30	19	2013-05-10 02:36:49.226985	2013-05-10 02:36:49.226985
1422	18	11	2	14	2013-05-19 00:22:35.356302	2013-05-19 00:22:35.356302
1423	18	11	11	14	2013-05-19 00:22:35.358868	2013-05-19 00:22:35.358868
1424	18	11	27	14	2013-05-19 00:22:35.362204	2013-05-19 00:22:35.362204
1425	18	12	4	17	2013-05-19 00:22:35.37325	2013-05-19 00:22:35.37325
1426	18	12	2	19	2013-05-19 00:22:35.385681	2013-05-19 00:22:35.385681
1427	18	12	10	19	2013-05-19 00:22:35.388783	2013-05-19 00:22:35.388783
1428	18	12	17	19	2013-05-19 00:22:35.389532	2013-05-19 00:22:35.389532
1429	18	12	26	20	2013-05-19 00:22:35.404037	2013-05-19 00:22:35.404037
1625	28	12	8	11	2013-05-19 21:08:48.303875	2013-05-19 21:08:48.303875
1626	28	12	24	14	2013-05-19 21:08:48.318627	2013-05-19 21:08:48.318627
1627	38	11	25	2	2013-05-23 02:51:52.32616	2013-05-23 02:51:52.32616
1628	38	11	4	4	2013-05-23 02:51:52.333236	2013-05-23 02:51:52.333236
1629	38	11	20	15	2013-05-23 02:51:52.504337	2013-05-23 02:51:52.504337
1662	49	15	6	2	2013-05-23 03:35:49.275999	2013-05-23 03:35:49.275999
1663	49	14	29	2	2013-05-23 03:35:49.277057	2013-05-23 03:35:49.277057
1664	49	17	6	10	2013-05-23 03:35:49.398646	2013-05-23 03:35:49.398646
1665	49	18	29	10	2013-05-23 03:35:49.400549	2013-05-23 03:35:49.400549
1666	49	16	6	19	2013-05-23 03:35:49.462388	2013-05-23 03:35:49.462388
1667	49	13	29	19	2013-05-23 03:35:49.46352	2013-05-23 03:35:49.46352
1668	49	19	30	19	2013-05-23 03:35:49.464597	2013-05-23 03:35:49.464597
1821	53	11	6	13	2013-05-25 00:43:53.237947	2013-05-25 00:43:53.237947
1822	53	11	28	13	2013-05-25 00:43:53.239001	2013-05-25 00:43:53.239001
1823	53	11	18	17	2013-05-25 00:43:53.239936	2013-05-25 00:43:53.239936
1824	51	11	16	3	2013-05-25 00:44:09.082462	2013-05-25 00:44:09.082462
1825	51	12	26	9	2013-05-25 00:44:09.110033	2013-05-25 00:44:09.110033
1826	51	11	13	10	2013-05-25 00:44:09.110878	2013-05-25 00:44:09.110878
1827	51	12	18	16	2013-05-25 00:44:09.133084	2013-05-25 00:44:09.133084
1828	51	11	7	18	2013-05-25 00:44:09.134275	2013-05-25 00:44:09.134275
1863	52	11	15	4	2013-05-25 00:52:46.753357	2013-05-25 00:52:46.753357
1864	52	11	22	4	2013-05-25 00:52:46.755738	2013-05-25 00:52:46.755738
1865	52	12	17	7	2013-05-25 00:52:46.760871	2013-05-25 00:52:46.760871
1866	52	12	20	7	2013-05-25 00:52:46.762979	2013-05-25 00:52:46.762979
1867	52	12	16	8	2013-05-25 00:52:46.763749	2013-05-25 00:52:46.763749
1868	52	12	21	8	2013-05-25 00:52:46.767433	2013-05-25 00:52:46.767433
1869	52	12	10	9	2013-05-25 00:52:46.76832	2013-05-25 00:52:46.76832
1870	52	12	26	9	2013-05-25 00:52:46.781897	2013-05-25 00:52:46.781897
1871	52	12	4	10	2013-05-25 00:52:46.782838	2013-05-25 00:52:46.782838
1872	52	12	13	10	2013-05-25 00:52:46.791018	2013-05-25 00:52:46.791018
1873	52	12	23	10	2013-05-25 00:52:46.791862	2013-05-25 00:52:46.791862
1874	52	12	31	10	2013-05-25 00:52:46.798737	2013-05-25 00:52:46.798737
1875	52	12	4	11	2013-05-25 00:52:46.801849	2013-05-25 00:52:46.801849
1876	52	11	18	11	2013-05-25 00:52:46.807005	2013-05-25 00:52:46.807005
1877	52	12	31	11	2013-05-25 00:52:46.809671	2013-05-25 00:52:46.809671
1878	52	12	4	12	2013-05-25 00:52:46.813136	2013-05-25 00:52:46.813136
1879	52	12	31	12	2013-05-25 00:52:46.81762	2013-05-25 00:52:46.81762
1979	25	11	3	9	2013-05-26 04:37:22.888499	2013-05-26 04:37:22.888499
1980	25	11	17	9	2013-05-26 04:37:22.892956	2013-05-26 04:37:22.892956
1981	25	11	30	19	2013-05-26 04:37:22.949229	2013-05-26 04:37:22.949229
1987	35	11	25	2	2013-05-26 04:50:54.60633	2013-05-26 04:50:54.60633
1988	35	11	4	4	2013-05-26 04:50:54.610966	2013-05-26 04:50:54.610966
1989	35	12	0	11	2013-05-26 04:50:54.639964	2013-05-26 04:50:54.639964
1990	35	12	3	11	2013-05-26 04:50:54.640736	2013-05-26 04:50:54.640736
1991	35	11	20	12	2013-05-26 04:50:54.649371	2013-05-26 04:50:54.649371
1995	37	11	8	8	2013-05-26 05:07:08.769787	2013-05-26 05:07:08.769787
1996	37	11	17	8	2013-05-26 05:07:08.770637	2013-05-26 05:07:08.770637
1997	37	11	26	8	2013-05-26 05:07:08.771366	2013-05-26 05:07:08.771366
1998	47	11	17	7	2013-05-26 18:48:50.10728	2013-05-26 18:48:50.10728
1999	47	12	8	9	2013-05-26 18:48:50.1082	2013-05-26 18:48:50.1082
2000	47	12	26	9	2013-05-26 18:48:50.109036	2013-05-26 18:48:50.109036
2001	47	11	8	11	2013-05-26 18:48:50.109823	2013-05-26 18:48:50.109823
2002	47	11	26	11	2013-05-26 18:48:50.112551	2013-05-26 18:48:50.112551
2003	48	12	8	1	2013-05-27 06:09:46.024257	2013-05-27 06:09:46.024257
2004	48	12	23	2	2013-05-27 06:09:46.035402	2013-05-27 06:09:46.035402
2005	48	12	27	2	2013-05-27 06:09:46.03627	2013-05-27 06:09:46.03627
2006	48	12	0	4	2013-05-27 06:09:46.053205	2013-05-27 06:09:46.053205
2007	48	12	32	6	2013-05-27 06:09:46.075258	2013-05-27 06:09:46.075258
2008	48	12	35	6	2013-05-27 06:09:46.076074	2013-05-27 06:09:46.076074
2009	48	11	26	7	2013-05-27 06:09:46.081452	2013-05-27 06:09:46.081452
2010	48	12	16	11	2013-05-27 06:09:46.119896	2013-05-27 06:09:46.119896
2011	48	11	9	17	2013-05-27 06:09:46.12664	2013-05-27 06:09:46.12664
2012	48	11	26	17	2013-05-27 06:09:46.127543	2013-05-27 06:09:46.127543
2013	54	12	25	0	2013-05-27 06:47:06.161848	2013-05-27 06:47:06.161848
2014	54	12	8	1	2013-05-27 06:47:06.165932	2013-05-27 06:47:06.165932
2015	54	12	23	2	2013-05-27 06:47:06.175673	2013-05-27 06:47:06.175673
2016	54	12	27	2	2013-05-27 06:47:06.176498	2013-05-27 06:47:06.176498
2017	54	12	0	4	2013-05-27 06:47:06.197252	2013-05-27 06:47:06.197252
2018	54	12	15	4	2013-05-27 06:47:06.198188	2013-05-27 06:47:06.198188
2019	54	12	32	6	2013-05-27 06:47:06.21609	2013-05-27 06:47:06.21609
2020	54	12	35	6	2013-05-27 06:47:06.216877	2013-05-27 06:47:06.216877
2021	54	11	26	7	2013-05-27 06:47:06.220716	2013-05-27 06:47:06.220716
2022	54	11	27	11	2013-05-27 06:47:06.322302	2013-05-27 06:47:06.322302
2023	54	12	0	12	2013-05-27 06:47:06.323238	2013-05-27 06:47:06.323238
2024	54	12	3	12	2013-05-27 06:47:06.324044	2013-05-27 06:47:06.324044
2025	54	11	8	13	2013-05-27 06:47:06.331594	2013-05-27 06:47:06.331594
2026	54	12	9	18	2013-05-27 06:47:06.378882	2013-05-27 06:47:06.378882
2027	54	12	6	21	2013-05-27 06:47:06.384344	2013-05-27 06:47:06.384344
2028	54	12	12	21	2013-05-27 06:47:06.385231	2013-05-27 06:47:06.385231
2035	55	11	12	4	2013-05-27 14:48:13.053571	2013-05-27 14:48:13.053571
2036	55	11	15	8	2013-05-27 14:48:13.108221	2013-05-27 14:48:13.108221
2037	55	11	3	18	2013-05-27 14:48:13.2116	2013-05-27 14:48:13.2116
2038	16	12	26	3	2013-05-28 01:13:32.336524	2013-05-28 01:13:32.336524
2039	16	12	31	3	2013-05-28 01:13:32.337273	2013-05-28 01:13:32.337273
2040	16	12	18	6	2013-05-28 01:13:32.346745	2013-05-28 01:13:32.346745
2041	16	11	6	11	2013-05-28 01:13:32.43016	2013-05-28 01:13:32.43016
2042	16	12	17	14	2013-05-28 01:13:32.460031	2013-05-28 01:13:32.460031
2043	16	12	3	16	2013-05-28 01:13:32.551791	2013-05-28 01:13:32.551791
2044	16	12	28	16	2013-05-28 01:13:32.554376	2013-05-28 01:13:32.554376
2045	16	11	6	19	2013-05-28 01:13:32.561924	2013-05-28 01:13:32.561924
2046	16	11	29	19	2013-05-28 01:13:32.566432	2013-05-28 01:13:32.566432
2047	21	12	26	0	2013-05-28 01:20:01.214591	2013-05-28 01:20:01.214591
2048	21	11	10	1	2013-05-28 01:20:01.215493	2013-05-28 01:20:01.215493
2049	21	12	11	7	2013-05-28 01:20:01.231628	2013-05-28 01:20:01.231628
2050	21	12	16	7	2013-05-28 01:20:01.232461	2013-05-28 01:20:01.232461
2051	21	12	35	9	2013-05-28 01:20:01.237776	2013-05-28 01:20:01.237776
2052	21	12	13	11	2013-05-28 01:20:01.257807	2013-05-28 01:20:01.257807
2053	21	11	21	14	2013-05-28 01:20:01.272063	2013-05-28 01:20:01.272063
2054	21	12	0	16	2013-05-28 01:20:01.273067	2013-05-28 01:20:01.273067
2055	21	11	17	18	2013-05-28 01:20:01.276434	2013-05-28 01:20:01.276434
2056	21	12	17	21	2013-05-28 01:20:01.278689	2013-05-28 01:20:01.278689
2072	56	11	9	4	2013-06-10 03:35:32.264217	2013-06-10 03:35:32.264217
2073	56	11	26	4	2013-06-10 03:35:32.265528	2013-06-10 03:35:32.265528
2074	56	11	26	16	2013-06-10 03:35:32.294616	2013-06-10 03:35:32.294616
2093	58	11	16	3	2013-06-10 04:03:23.892316	2013-06-10 04:03:23.892316
2094	58	12	16	8	2013-06-10 04:03:23.922023	2013-06-10 04:03:23.922023
2095	58	11	16	10	2013-06-10 04:03:23.975401	2013-06-10 04:03:23.975401
2096	58	12	16	13	2013-06-10 04:03:24.040332	2013-06-10 04:03:24.040332
2097	58	11	16	18	2013-06-10 04:03:24.161602	2013-06-10 04:03:24.161602
2106	59	11	17	7	2013-06-10 04:18:58.880318	2013-06-10 04:18:58.880318
2107	59	11	17	10	2013-06-10 04:18:58.926166	2013-06-10 04:18:58.926166
2108	59	11	17	15	2013-06-10 04:18:58.935049	2013-06-10 04:18:58.935049
2115	57	11	29	12	2013-06-16 04:43:30.402434	2013-06-16 04:43:30.402434
2116	57	11	7	19	2013-06-16 04:43:30.409298	2013-06-16 04:43:30.409298
2117	57	11	25	19	2013-06-16 04:43:30.410011	2013-06-16 04:43:30.410011
2133	45	9	4	0	2013-06-21 21:36:22.290858	2013-06-21 21:36:22.290858
2134	45	8	0	2	2013-06-21 21:36:22.293905	2013-06-21 21:36:22.293905
2135	45	11	17	6	2013-06-21 21:36:22.296554	2013-06-21 21:36:22.296554
2136	45	11	17	11	2013-06-21 21:36:22.307509	2013-06-21 21:36:22.307509
2137	45	11	17	16	2013-06-21 21:36:22.320122	2013-06-21 21:36:22.320122
2138	45	8	30	16	2013-06-21 21:36:22.320953	2013-06-21 21:36:22.320953
2139	45	9	26	19	2013-06-21 21:36:22.324248	2013-06-21 21:36:22.324248
2173	62	12	2	8	2013-06-21 22:35:37.508953	2013-06-21 22:35:37.508953
2174	62	12	33	8	2013-06-21 22:35:37.509874	2013-06-21 22:35:37.509874
2175	62	11	3	16	2013-06-21 22:35:37.546405	2013-06-21 22:35:37.546405
2176	62	11	17	16	2013-06-21 22:35:37.551886	2013-06-21 22:35:37.551886
2177	62	11	32	16	2013-06-21 22:35:37.556814	2013-06-21 22:35:37.556814
2213	50	11	29	2	2013-06-22 00:00:07.660299	2013-06-22 00:00:07.660299
2214	50	11	32	2	2013-06-22 00:00:07.663576	2013-06-22 00:00:07.663576
2215	50	11	35	2	2013-06-22 00:00:07.667276	2013-06-22 00:00:07.667276
2229	65	11	18	7	2013-06-22 19:03:55.807192	2013-06-22 19:03:55.807192
2230	65	11	14	16	2013-06-22 19:03:55.847098	2013-06-22 19:03:55.847098
2231	65	11	33	20	2013-06-22 19:03:55.941437	2013-06-22 19:03:55.941437
2238	66	11	26	4	2013-06-22 19:17:12.110191	2013-06-22 19:17:12.110191
2239	66	11	28	11	2013-06-22 19:17:12.184011	2013-06-22 19:17:12.184011
2240	66	11	31	20	2013-06-22 19:17:12.305592	2013-06-22 19:17:12.305592
2253	69	11	21	4	2013-06-22 20:31:03.577817	2013-06-22 20:31:03.577817
2254	69	11	6	14	2013-06-22 20:31:03.610746	2013-06-22 20:31:03.610746
2255	69	11	26	16	2013-06-22 20:31:03.622456	2013-06-22 20:31:03.622456
2265	67	11	2	19	2013-06-22 20:33:53.751949	2013-06-22 20:33:53.751949
2266	67	11	1	20	2013-06-22 20:33:53.752914	2013-06-22 20:33:53.752914
2267	67	11	0	21	2013-06-22 20:33:53.754182	2013-06-22 20:33:53.754182
2271	68	11	21	9	2013-06-22 21:26:40.199632	2013-06-22 21:26:40.199632
2272	68	11	5	10	2013-06-22 21:26:40.244375	2013-06-22 21:26:40.244375
2273	68	11	28	14	2013-06-22 21:26:40.2545	2013-06-22 21:26:40.2545
2316	70	17	1	1	2013-06-22 21:56:56.458696	2013-06-22 21:56:56.458696
2317	70	18	29	5	2013-06-22 21:56:56.503183	2013-06-22 21:56:56.503183
2318	70	16	6	10	2013-06-22 21:56:56.566374	2013-06-22 21:56:56.566374
2319	70	19	17	10	2013-06-22 21:56:56.574418	2013-06-22 21:56:56.574418
2320	70	13	29	10	2013-06-22 21:56:56.5779	2013-06-22 21:56:56.5779
2321	70	15	3	18	2013-06-22 21:56:56.671999	2013-06-22 21:56:56.671999
2322	70	14	33	18	2013-06-22 21:56:56.677552	2013-06-22 21:56:56.677552
2327	64	8	2	3	2013-06-22 22:48:11.622722	2013-06-22 22:48:11.622722
2328	64	11	9	7	2013-06-22 22:48:11.75265	2013-06-22 22:48:11.75265
2329	64	11	9	17	2013-06-22 22:48:11.896133	2013-06-22 22:48:11.896133
2330	64	11	29	17	2013-06-22 22:48:11.898225	2013-06-22 22:48:11.898225
2370	23	11	11	4	2013-06-23 19:44:44.604221	2013-06-23 19:44:44.604221
2371	23	11	26	4	2013-06-23 19:44:44.606203	2013-06-23 19:44:44.606203
2372	23	11	16	15	2013-06-23 19:44:44.756543	2013-06-23 19:44:44.756543
2385	73	11	20	11	2013-06-24 04:00:28.694897	2013-06-24 04:00:28.694897
2386	73	11	18	12	2013-06-24 04:00:28.704382	2013-06-24 04:00:28.704382
2387	73	11	22	12	2013-06-24 04:00:28.705143	2013-06-24 04:00:28.705143
2404	71	11	35	1	2013-06-24 16:48:57.2424	2013-06-24 16:48:57.2424
2405	71	11	35	9	2013-06-24 16:48:57.355406	2013-06-24 16:48:57.355406
2406	71	11	35	17	2013-06-24 16:48:57.460901	2013-06-24 16:48:57.460901
2407	71	12	0	19	2013-06-24 16:48:57.461745	2013-06-24 16:48:57.461745
2492	74	11	17	9	2013-06-27 20:19:16.197869	2013-06-27 20:19:16.197869
2493	74	11	18	9	2013-06-27 20:19:16.198664	2013-06-27 20:19:16.198664
2494	74	11	19	9	2013-06-27 20:19:16.199364	2013-06-27 20:19:16.199364
2495	74	8	1	20	2013-06-27 20:19:16.201652	2013-06-27 20:19:16.201652
2496	74	8	34	20	2013-06-27 20:19:16.202475	2013-06-27 20:19:16.202475
2506	72	11	9	12	2013-06-28 01:06:40.63405	2013-06-28 01:06:40.63405
2507	72	11	11	12	2013-06-28 01:06:40.634868	2013-06-28 01:06:40.634868
2508	72	11	13	12	2013-06-28 01:06:40.635622	2013-06-28 01:06:40.635622
2589	75	11	3	2	2013-06-28 15:38:50.02569	2013-06-28 15:38:50.02569
2590	75	11	32	2	2013-06-28 15:38:50.027024	2013-06-28 15:38:50.027024
2591	75	12	14	7	2013-06-28 15:38:50.028345	2013-06-28 15:38:50.028345
2592	75	12	21	7	2013-06-28 15:38:50.029388	2013-06-28 15:38:50.029388
2593	75	12	14	8	2013-06-28 15:38:50.030486	2013-06-28 15:38:50.030486
2594	75	12	21	8	2013-06-28 15:38:50.031709	2013-06-28 15:38:50.031709
2595	75	12	14	9	2013-06-28 15:38:50.035169	2013-06-28 15:38:50.035169
2596	75	8	17	9	2013-06-28 15:38:50.036265	2013-06-28 15:38:50.036265
2597	75	12	21	9	2013-06-28 15:38:50.037251	2013-06-28 15:38:50.037251
2598	75	12	14	10	2013-06-28 15:38:50.041884	2013-06-28 15:38:50.041884
2599	75	12	21	10	2013-06-28 15:38:50.042808	2013-06-28 15:38:50.042808
2600	75	12	14	11	2013-06-28 15:38:50.048889	2013-06-28 15:38:50.048889
2601	75	12	21	11	2013-06-28 15:38:50.049723	2013-06-28 15:38:50.049723
2602	75	12	14	12	2013-06-28 15:38:50.056087	2013-06-28 15:38:50.056087
2603	75	12	21	12	2013-06-28 15:38:50.057045	2013-06-28 15:38:50.057045
2604	75	11	17	19	2013-06-28 15:38:50.091411	2013-06-28 15:38:50.091411
2661	78	11	15	2	2013-06-28 16:15:00.760969	2013-06-28 16:15:00.760969
2662	78	12	12	5	2013-06-28 16:15:00.762143	2013-06-28 16:15:00.762143
2663	78	12	15	5	2013-06-28 16:15:00.763258	2013-06-28 16:15:00.763258
2664	78	12	12	8	2013-06-28 16:15:00.855045	2013-06-28 16:15:00.855045
2665	78	12	15	8	2013-06-28 16:15:00.855837	2013-06-28 16:15:00.855837
2666	78	11	32	18	2013-06-28 16:15:00.922385	2013-06-28 16:15:00.922385
2667	78	11	3	19	2013-06-28 16:15:00.923261	2013-06-28 16:15:00.923261
2668	77	8	3	3	2013-06-28 17:08:44.040395	2013-06-28 17:08:44.040395
2669	77	11	2	11	2013-06-28 17:08:44.085299	2013-06-28 17:08:44.085299
2670	77	11	17	11	2013-06-28 17:08:44.08607	2013-06-28 17:08:44.08607
2671	77	11	33	11	2013-06-28 17:08:44.086836	2013-06-28 17:08:44.086836
2727	80	11	8	4	2013-06-28 20:06:44.397541	2013-06-28 20:06:44.397541
2728	80	11	18	4	2013-06-28 20:06:44.398373	2013-06-28 20:06:44.398373
2729	80	11	28	4	2013-06-28 20:06:44.399252	2013-06-28 20:06:44.399252
2855	22	11	17	6	2013-06-28 23:05:14.008217	2013-06-28 23:05:14.008217
2856	22	11	18	12	2013-06-28 23:05:14.022842	2013-06-28 23:05:14.022842
2857	22	11	17	17	2013-06-28 23:05:14.0274	2013-06-28 23:05:14.0274
2862	79	12	12	4	2013-06-28 23:25:39.980599	2013-06-28 23:25:39.980599
2863	79	11	12	5	2013-06-28 23:25:39.994044	2013-06-28 23:25:39.994044
2864	79	11	12	15	2013-06-28 23:25:40.300736	2013-06-28 23:25:40.300736
2865	79	11	28	15	2013-06-28 23:25:40.303218	2013-06-28 23:25:40.303218
2866	84	9	5	2	2013-06-29 00:13:43.027459	2013-06-29 00:13:43.027459
2867	84	8	5	8	2013-06-29 00:13:43.031903	2013-06-29 00:13:43.031903
2868	84	8	32	12	2013-06-29 00:13:43.070103	2013-06-29 00:13:43.070103
2869	84	11	5	13	2013-06-29 00:13:43.07274	2013-06-29 00:13:43.07274
2870	84	11	17	13	2013-06-29 00:13:43.075086	2013-06-29 00:13:43.075086
2871	84	11	30	13	2013-06-29 00:13:43.077606	2013-06-29 00:13:43.077606
2872	84	9	32	18	2013-06-29 00:13:43.083816	2013-06-29 00:13:43.083816
2877	81	11	33	6	2013-06-29 00:32:06.020896	2013-06-29 00:32:06.020896
2878	81	11	30	12	2013-06-29 00:32:06.180786	2013-06-29 00:32:06.180786
2879	81	11	19	14	2013-06-29 00:32:06.228273	2013-06-29 00:32:06.228273
2880	81	8	1	15	2013-06-29 00:32:06.250591	2013-06-29 00:32:06.250591
2928	30	11	17	3	2013-06-29 20:02:42.38317	2013-06-29 20:02:42.38317
2929	30	11	17	14	2013-06-29 20:02:42.496612	2013-06-29 20:02:42.496612
2930	30	11	26	20	2013-06-29 20:02:42.604016	2013-06-29 20:02:42.604016
2931	34	11	29	5	2013-06-29 20:03:00.631727	2013-06-29 20:03:00.631727
2932	34	12	0	8	2013-06-29 20:03:00.653206	2013-06-29 20:03:00.653206
2933	34	12	14	8	2013-06-29 20:03:00.655266	2013-06-29 20:03:00.655266
2934	34	11	30	16	2013-06-29 20:03:00.717487	2013-06-29 20:03:00.717487
2935	34	11	4	19	2013-06-29 20:03:00.734797	2013-06-29 20:03:00.734797
2936	34	8	12	20	2013-06-29 20:03:00.740501	2013-06-29 20:03:00.740501
2958	89	11	5	21	2013-06-29 20:25:33.340545	2013-06-29 20:25:33.340545
2959	89	11	18	21	2013-06-29 20:25:33.342523	2013-06-29 20:25:33.342523
2960	89	11	30	21	2013-06-29 20:25:33.343255	2013-06-29 20:25:33.343255
2982	90	18	2	10	2013-06-29 22:02:26.38977	2013-06-29 22:02:26.38977
2983	90	15	31	10	2013-06-29 22:02:26.396862	2013-06-29 22:02:26.396862
2984	90	17	6	13	2013-06-29 22:02:26.405031	2013-06-29 22:02:26.405031
2985	90	13	25	13	2013-06-29 22:02:26.407751	2013-06-29 22:02:26.407751
2986	90	14	30	16	2013-06-29 22:02:26.41451	2013-06-29 22:02:26.41451
2987	90	19	31	16	2013-06-29 22:02:26.41529	2013-06-29 22:02:26.41529
2988	90	16	32	16	2013-06-29 22:02:26.416071	2013-06-29 22:02:26.416071
2989	85	12	27	3	2013-06-29 22:16:43.550434	2013-06-29 22:16:43.550434
2990	85	11	27	5	2013-06-29 22:16:43.553646	2013-06-29 22:16:43.553646
2991	85	11	5	18	2013-06-29 22:16:43.617586	2013-06-29 22:16:43.617586
2992	85	11	15	21	2013-06-29 22:16:43.635163	2013-06-29 22:16:43.635163
2999	63	11	9	6	2013-06-29 23:10:45.395162	2013-06-29 23:10:45.395162
3000	63	11	17	11	2013-06-29 23:10:45.398966	2013-06-29 23:10:45.398966
3001	63	11	25	17	2013-06-29 23:10:45.403491	2013-06-29 23:10:45.403491
3027	91	11	17	15	2013-06-30 21:01:24.604271	2013-06-30 21:01:24.604271
3028	91	11	9	19	2013-06-30 21:01:24.614035	2013-06-30 21:01:24.614035
3029	91	11	25	19	2013-06-30 21:01:24.614894	2013-06-30 21:01:24.614894
3101	61	12	17	2	2013-07-05 18:13:16.17698	2013-07-05 18:13:16.17698
3102	61	12	17	7	2013-07-05 18:13:16.178489	2013-07-05 18:13:16.178489
3103	61	12	17	13	2013-07-05 18:13:16.197083	2013-07-05 18:13:16.197083
3104	61	11	3	16	2013-07-05 18:13:16.208522	2013-07-05 18:13:16.208522
3105	61	11	17	16	2013-07-05 18:13:16.211554	2013-07-05 18:13:16.211554
3106	61	11	32	16	2013-07-05 18:13:16.214313	2013-07-05 18:13:16.214313
3107	76	11	32	10	2013-07-05 21:10:24.234158	2013-07-05 21:10:24.234158
3108	76	11	13	19	2013-07-05 21:10:24.31613	2013-07-05 21:10:24.31613
3109	76	11	22	19	2013-07-05 21:10:24.316923	2013-07-05 21:10:24.316923
3582	101	11	35	1	2013-07-06 06:57:42.604079	2013-07-06 06:57:42.604079
3583	101	11	34	20	2013-07-06 06:57:42.857046	2013-07-06 06:57:42.857046
3584	101	11	0	21	2013-07-06 06:57:42.85782	2013-07-06 06:57:42.85782
3588	82	11	29	11	2013-07-06 20:02:29.102622	2013-07-06 20:02:29.102622
3589	82	11	4	15	2013-07-06 20:02:29.104534	2013-07-06 20:02:29.104534
3590	82	11	23	15	2013-07-06 20:02:29.107056	2013-07-06 20:02:29.107056
3594	86	11	24	7	2013-07-06 20:44:06.191167	2013-07-06 20:44:06.191167
3595	86	11	4	18	2013-07-06 20:44:06.301183	2013-07-06 20:44:06.301183
3596	86	11	32	18	2013-07-06 20:44:06.302638	2013-07-06 20:44:06.302638
3600	33	22	4	13	2013-07-06 21:10:03.993757	2013-07-06 21:10:03.993757
3601	33	22	16	13	2013-07-06 21:10:03.99638	2013-07-06 21:10:03.99638
3602	33	22	28	18	2013-07-06 21:10:04.025079	2013-07-06 21:10:04.025079
3603	88	11	15	11	2013-07-06 22:30:42.138783	2013-07-06 22:30:42.138783
3604	88	11	20	11	2013-07-06 22:30:42.140363	2013-07-06 22:30:42.140363
3605	88	11	7	19	2013-07-06 22:30:42.170536	2013-07-06 22:30:42.170536
3612	94	11	2	4	2013-07-07 04:24:29.945485	2013-07-07 04:24:29.945485
3613	94	11	2	11	2013-07-07 04:24:29.987375	2013-07-07 04:24:29.987375
3614	94	11	2	19	2013-07-07 04:24:30.049514	2013-07-07 04:24:30.049514
3615	95	11	15	6	2013-07-07 04:32:56.229635	2013-07-07 04:32:56.229635
3616	95	11	22	10	2013-07-07 04:32:56.247827	2013-07-07 04:32:56.247827
3617	95	11	29	14	2013-07-07 04:32:56.270799	2013-07-07 04:32:56.270799
3618	95	12	35	21	2013-07-07 04:32:56.274266	2013-07-07 04:32:56.274266
3619	96	11	11	10	2013-07-07 04:46:57.795037	2013-07-07 04:46:57.795037
3620	96	11	25	10	2013-07-07 04:46:57.801097	2013-07-07 04:46:57.801097
3621	96	11	15	17	2013-07-07 04:46:57.824623	2013-07-07 04:46:57.824623
3622	97	11	12	7	2013-07-07 21:36:30.881398	2013-07-07 21:36:30.881398
3623	97	11	21	7	2013-07-07 21:36:30.884532	2013-07-07 21:36:30.884532
3624	97	11	18	19	2013-07-07 21:36:30.89292	2013-07-07 21:36:30.89292
3660	98	11	22	1	2013-07-08 21:32:20.881659	2013-07-08 21:32:20.881659
3661	98	9	28	3	2013-07-08 21:32:20.925182	2013-07-08 21:32:20.925182
3662	98	11	8	12	2013-07-08 21:32:21.140934	2013-07-08 21:32:21.140934
3663	98	11	1	19	2013-07-08 21:32:21.278528	2013-07-08 21:32:21.278528
3664	92	11	34	1	2013-07-08 21:34:17.193023	2013-07-08 21:34:17.193023
3665	92	11	6	18	2013-07-08 21:34:17.348385	2013-07-08 21:34:17.348385
3666	92	11	26	18	2013-07-08 21:34:17.353482	2013-07-08 21:34:17.353482
3667	93	12	24	3	2013-07-08 21:37:58.025414	2013-07-08 21:37:58.025414
3668	93	11	32	8	2013-07-08 21:37:58.054822	2013-07-08 21:37:58.054822
3669	93	11	19	15	2013-07-08 21:37:58.108616	2013-07-08 21:37:58.108616
3670	93	11	3	19	2013-07-08 21:37:58.143837	2013-07-08 21:37:58.143837
3671	100	11	33	1	2013-07-08 21:40:47.282742	2013-07-08 21:40:47.282742
3672	100	12	12	3	2013-07-08 21:40:47.293935	2013-07-08 21:40:47.293935
3673	100	12	18	3	2013-07-08 21:40:47.296585	2013-07-08 21:40:47.296585
3674	100	12	2	4	2013-07-08 21:40:47.300441	2013-07-08 21:40:47.300441
3675	100	12	6	4	2013-07-08 21:40:47.301455	2013-07-08 21:40:47.301455
3676	100	12	21	4	2013-07-08 21:40:47.307436	2013-07-08 21:40:47.307436
3677	100	12	10	5	2013-07-08 21:40:47.31334	2013-07-08 21:40:47.31334
3678	100	12	4	6	2013-07-08 21:40:47.322945	2013-07-08 21:40:47.322945
3679	100	12	23	6	2013-07-08 21:40:47.333427	2013-07-08 21:40:47.333427
3680	100	12	16	7	2013-07-08 21:40:47.341833	2013-07-08 21:40:47.341833
3681	100	12	5	8	2013-07-08 21:40:47.350645	2013-07-08 21:40:47.350645
3682	100	12	12	8	2013-07-08 21:40:47.354534	2013-07-08 21:40:47.354534
3683	100	11	14	8	2013-07-08 21:40:47.355415	2013-07-08 21:40:47.355415
3684	100	12	21	9	2013-07-08 21:40:47.375056	2013-07-08 21:40:47.375056
3685	100	12	11	10	2013-07-08 21:40:47.387108	2013-07-08 21:40:47.387108
3686	100	12	4	11	2013-07-08 21:40:47.398474	2013-07-08 21:40:47.398474
3687	100	12	21	11	2013-07-08 21:40:47.405207	2013-07-08 21:40:47.405207
3688	100	12	8	12	2013-07-08 21:40:47.4142	2013-07-08 21:40:47.4142
3689	100	12	27	12	2013-07-08 21:40:47.422041	2013-07-08 21:40:47.422041
3690	100	12	5	13	2013-07-08 21:40:47.426287	2013-07-08 21:40:47.426287
3691	100	12	12	13	2013-07-08 21:40:47.427082	2013-07-08 21:40:47.427082
3692	100	12	19	13	2013-07-08 21:40:47.429516	2013-07-08 21:40:47.429516
3693	100	8	30	13	2013-07-08 21:40:47.431919	2013-07-08 21:40:47.431919
3694	100	12	9	14	2013-07-08 21:40:47.435237	2013-07-08 21:40:47.435237
3695	100	12	18	15	2013-07-08 21:40:47.459679	2013-07-08 21:40:47.459679
3696	100	12	26	15	2013-07-08 21:40:47.463613	2013-07-08 21:40:47.463613
3697	100	12	23	16	2013-07-08 21:40:47.468146	2013-07-08 21:40:47.468146
3698	100	12	20	17	2013-07-08 21:40:47.476651	2013-07-08 21:40:47.476651
3699	100	11	1	20	2013-07-08 21:40:47.492639	2013-07-08 21:40:47.492639
3700	99	12	23	1	2013-07-08 21:43:22.403122	2013-07-08 21:43:22.403122
3701	99	12	9	2	2013-07-08 21:43:22.410188	2013-07-08 21:43:22.410188
3702	99	12	18	5	2013-07-08 21:43:22.436283	2013-07-08 21:43:22.436283
3703	99	12	14	6	2013-07-08 21:43:22.444733	2013-07-08 21:43:22.444733
3704	99	12	9	8	2013-07-08 21:43:22.467099	2013-07-08 21:43:22.467099
3705	99	12	23	9	2013-07-08 21:43:22.482315	2013-07-08 21:43:22.482315
3706	99	12	18	13	2013-07-08 21:43:22.521805	2013-07-08 21:43:22.521805
3707	99	12	9	14	2013-07-08 21:43:22.528916	2013-07-08 21:43:22.528916
3708	99	11	34	14	2013-07-08 21:43:22.538657	2013-07-08 21:43:22.538657
3709	99	12	5	16	2013-07-08 21:43:22.549702	2013-07-08 21:43:22.549702
3710	99	12	23	17	2013-07-08 21:43:22.563397	2013-07-08 21:43:22.563397
3711	99	11	34	17	2013-07-08 21:43:22.56742	2013-07-08 21:43:22.56742
3712	99	11	34	20	2013-07-08 21:43:22.621015	2013-07-08 21:43:22.621015
3713	99	12	18	21	2013-07-08 21:43:22.625302	2013-07-08 21:43:22.625302
3763	102	14	29	4	2013-07-08 21:58:01.820756	2013-07-08 21:58:01.820756
3764	102	16	11	9	2013-07-08 21:58:01.856174	2013-07-08 21:58:01.856174
3765	102	17	6	13	2013-07-08 21:58:01.883606	2013-07-08 21:58:01.883606
3766	102	13	25	13	2013-07-08 21:58:01.890786	2013-07-08 21:58:01.890786
3767	102	15	32	18	2013-07-08 21:58:01.932225	2013-07-08 21:58:01.932225
3768	102	18	8	19	2013-07-08 21:58:01.934708	2013-07-08 21:58:01.934708
3769	102	19	32	20	2013-07-08 21:58:01.941098	2013-07-08 21:58:01.941098
\.


--
-- Name: level_bonus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: standup75
--

SELECT pg_catalog.setval('level_bonus_id_seq', 1, false);


--
-- Data for Name: level_sprites; Type: TABLE DATA; Schema: public; Owner: standup75
--

COPY level_sprites (id, level_id, sprite_id, x, y, created_at, updated_at) FROM stdin;
1015	24	25	20	5	2013-02-24 23:44:15.629424	2013-02-24 23:44:15.629424
1667	17	11	19	10	2013-04-11 02:27:24.999043	2013-04-11 02:27:24.999043
1668	17	17	35	10	2013-04-11 02:27:24.999762	2013-04-11 02:27:24.999762
1669	17	8	3	12	2013-04-11 02:27:25.002557	2013-04-11 02:27:25.002557
1670	17	8	29	12	2013-04-11 02:27:25.005113	2013-04-11 02:27:25.005113
1850	14	8	31	5	2013-04-13 00:06:06.484292	2013-04-13 00:06:06.484292
1851	14	17	24	13	2013-04-13 00:06:06.547057	2013-04-13 00:06:06.547057
2072	36	13	7	3	2013-05-04 19:27:02.464627	2013-05-04 19:27:02.464627
2073	36	10	8	3	2013-05-04 19:27:02.465327	2013-05-04 19:27:02.465327
2074	36	10	9	3	2013-05-04 19:27:02.465992	2013-05-04 19:27:02.465992
2075	36	10	10	3	2013-05-04 19:27:02.466674	2013-05-04 19:27:02.466674
2076	36	13	30	9	2013-05-04 19:27:02.513047	2013-05-04 19:27:02.513047
2077	36	10	31	9	2013-05-04 19:27:02.513726	2013-05-04 19:27:02.513726
2078	36	10	32	9	2013-05-04 19:27:02.514447	2013-05-04 19:27:02.514447
2079	36	8	17	15	2013-05-04 19:27:02.520442	2013-05-04 19:27:02.520442
2080	36	31	16	20	2013-05-04 19:27:02.526321	2013-05-04 19:27:02.526321
2081	36	11	17	20	2013-05-04 19:27:02.527064	2013-05-04 19:27:02.527064
2082	36	17	18	20	2013-05-04 19:27:02.527736	2013-05-04 19:27:02.527736
2083	36	32	19	20	2013-05-04 19:27:02.528402	2013-05-04 19:27:02.528402
2183	13	8	20	7	2013-05-04 21:01:28.642745	2013-05-04 21:01:28.642745
2273	40	8	12	4	2013-05-05 14:53:10.283613	2013-05-05 14:53:10.283613
2274	40	30	18	4	2013-05-05 14:53:10.284286	2013-05-05 14:53:10.284286
2275	40	31	16	7	2013-05-05 14:53:10.289595	2013-05-05 14:53:10.289595
2276	40	32	17	7	2013-05-05 14:53:10.290251	2013-05-05 14:53:10.290251
2277	40	31	35	7	2013-05-05 14:53:10.29092	2013-05-05 14:53:10.29092
2278	40	32	35	8	2013-05-05 14:53:10.300079	2013-05-05 14:53:10.300079
2279	40	10	9	9	2013-05-05 14:53:10.305855	2013-05-05 14:53:10.305855
2280	40	13	10	9	2013-05-05 14:53:10.306549	2013-05-05 14:53:10.306549
2281	40	10	11	9	2013-05-05 14:53:10.307168	2013-05-05 14:53:10.307168
2282	40	10	12	9	2013-05-05 14:53:10.307848	2013-05-05 14:53:10.307848
2283	40	13	26	9	2013-05-05 14:53:10.370207	2013-05-05 14:53:10.370207
2284	40	10	27	9	2013-05-05 14:53:10.370985	2013-05-05 14:53:10.370985
2285	40	10	28	9	2013-05-05 14:53:10.37166	2013-05-05 14:53:10.37166
2895	39	13	2	2	2013-05-09 23:53:42.990095	2013-05-09 23:53:42.990095
2896	39	10	3	2	2013-05-09 23:53:42.990936	2013-05-09 23:53:42.990936
2897	39	10	4	2	2013-05-09 23:53:42.99167	2013-05-09 23:53:42.99167
2898	39	10	5	2	2013-05-09 23:53:42.992402	2013-05-09 23:53:42.992402
2899	39	13	30	2	2013-05-09 23:53:42.996339	2013-05-09 23:53:42.996339
2900	39	10	31	2	2013-05-09 23:53:42.996997	2013-05-09 23:53:42.996997
2901	39	10	32	2	2013-05-09 23:53:42.997628	2013-05-09 23:53:42.997628
2902	39	10	33	2	2013-05-09 23:53:42.998252	2013-05-09 23:53:42.998252
2903	39	13	20	4	2013-05-09 23:53:43.029439	2013-05-09 23:53:43.029439
2904	39	10	21	4	2013-05-09 23:53:43.030178	2013-05-09 23:53:43.030178
2905	39	10	22	4	2013-05-09 23:53:43.030835	2013-05-09 23:53:43.030835
2906	15	17	25	0	2013-05-09 23:54:21.897897	2013-05-09 23:54:21.897897
2907	15	11	0	8	2013-05-09 23:54:21.926363	2013-05-09 23:54:21.926363
2908	15	17	0	13	2013-05-09 23:54:21.956463	2013-05-09 23:54:21.956463
2909	15	11	0	14	2013-05-09 23:54:21.964183	2013-05-09 23:54:21.964183
2910	15	8	18	14	2013-05-09 23:54:21.969219	2013-05-09 23:54:21.969219
2911	29	17	5	6	2013-05-09 23:55:08.597059	2013-05-09 23:55:08.597059
2912	29	8	3	11	2013-05-09 23:55:08.635402	2013-05-09 23:55:08.635402
2913	29	11	17	16	2013-05-09 23:55:08.674378	2013-05-09 23:55:08.674378
2914	29	8	3	19	2013-05-09 23:55:08.680752	2013-05-09 23:55:08.680752
2915	29	8	27	19	2013-05-09 23:55:08.684748	2013-05-09 23:55:08.684748
2916	19	30	7	1	2013-05-09 23:55:54.328452	2013-05-09 23:55:54.328452
2917	19	30	27	1	2013-05-09 23:55:54.334005	2013-05-09 23:55:54.334005
2918	19	13	12	4	2013-05-09 23:55:54.367906	2013-05-09 23:55:54.367906
2919	19	10	13	4	2013-05-09 23:55:54.368592	2013-05-09 23:55:54.368592
2920	19	13	22	4	2013-05-09 23:55:54.374668	2013-05-09 23:55:54.374668
2921	19	10	23	4	2013-05-09 23:55:54.375367	2013-05-09 23:55:54.375367
2922	19	8	8	8	2013-05-09 23:55:54.415399	2013-05-09 23:55:54.415399
2923	19	8	26	8	2013-05-09 23:55:54.416093	2013-05-09 23:55:54.416093
2924	19	32	6	10	2013-05-09 23:55:54.448204	2013-05-09 23:55:54.448204
2925	19	31	7	10	2013-05-09 23:55:54.449137	2013-05-09 23:55:54.449137
2926	19	32	8	10	2013-05-09 23:55:54.449978	2013-05-09 23:55:54.449978
2927	19	31	9	10	2013-05-09 23:55:54.45079	2013-05-09 23:55:54.45079
2928	19	32	26	10	2013-05-09 23:55:54.451608	2013-05-09 23:55:54.451608
2929	19	31	27	10	2013-05-09 23:55:54.45252	2013-05-09 23:55:54.45252
2930	19	32	28	10	2013-05-09 23:55:54.453365	2013-05-09 23:55:54.453365
2931	19	31	29	10	2013-05-09 23:55:54.454236	2013-05-09 23:55:54.454236
2955	32	17	14	0	2013-05-10 02:36:49.119487	2013-05-10 02:36:49.119487
2956	32	32	15	0	2013-05-10 02:36:49.120511	2013-05-10 02:36:49.120511
2957	32	17	16	0	2013-05-10 02:36:49.121166	2013-05-10 02:36:49.121166
2958	32	32	17	0	2013-05-10 02:36:49.121814	2013-05-10 02:36:49.121814
2959	32	13	5	2	2013-05-10 02:36:49.130334	2013-05-10 02:36:49.130334
2960	32	10	6	2	2013-05-10 02:36:49.130986	2013-05-10 02:36:49.130986
2961	32	10	7	2	2013-05-10 02:36:49.131622	2013-05-10 02:36:49.131622
2962	32	10	8	2	2013-05-10 02:36:49.132274	2013-05-10 02:36:49.132274
2963	32	11	0	5	2013-05-10 02:36:49.151861	2013-05-10 02:36:49.151861
2964	32	31	0	6	2013-05-10 02:36:49.155628	2013-05-10 02:36:49.155628
2965	32	11	0	7	2013-05-10 02:36:49.160472	2013-05-10 02:36:49.160472
2966	32	11	35	7	2013-05-10 02:36:49.164907	2013-05-10 02:36:49.164907
2967	32	31	0	8	2013-05-10 02:36:49.165731	2013-05-10 02:36:49.165731
2968	32	17	29	8	2013-05-10 02:36:49.169185	2013-05-10 02:36:49.169185
2969	32	31	35	8	2013-05-10 02:36:49.17268	2013-05-10 02:36:49.17268
2970	32	32	29	9	2013-05-10 02:36:49.17673	2013-05-10 02:36:49.17673
2971	32	11	35	9	2013-05-10 02:36:49.179901	2013-05-10 02:36:49.179901
2972	32	17	29	10	2013-05-10 02:36:49.18332	2013-05-10 02:36:49.18332
2973	32	31	35	10	2013-05-10 02:36:49.185959	2013-05-10 02:36:49.185959
2974	32	32	29	11	2013-05-10 02:36:49.189111	2013-05-10 02:36:49.189111
2975	32	30	8	13	2013-05-10 02:36:49.196195	2013-05-10 02:36:49.196195
2976	32	30	9	13	2013-05-10 02:36:49.196855	2013-05-10 02:36:49.196855
3479	46	35	2	2	2013-05-18 22:23:20.969129	2013-05-18 22:23:20.969129
3480	46	35	3	2	2013-05-18 22:23:20.970118	2013-05-18 22:23:20.970118
3481	46	35	4	2	2013-05-18 22:23:20.970833	2013-05-18 22:23:20.970833
3482	46	35	5	2	2013-05-18 22:23:20.97189	2013-05-18 22:23:20.97189
3483	46	35	6	2	2013-05-18 22:23:20.972813	2013-05-18 22:23:20.972813
3484	46	35	7	2	2013-05-18 22:23:20.973782	2013-05-18 22:23:20.973782
3485	46	35	8	2	2013-05-18 22:23:20.974805	2013-05-18 22:23:20.974805
3486	46	35	9	2	2013-05-18 22:23:20.975773	2013-05-18 22:23:20.975773
3487	46	35	10	2	2013-05-18 22:23:20.976804	2013-05-18 22:23:20.976804
3488	46	35	11	2	2013-05-18 22:23:20.977824	2013-05-18 22:23:20.977824
3489	46	35	2	3	2013-05-18 22:23:20.9788	2013-05-18 22:23:20.9788
3490	46	35	3	3	2013-05-18 22:23:20.979807	2013-05-18 22:23:20.979807
3491	46	35	4	3	2013-05-18 22:23:20.980712	2013-05-18 22:23:20.980712
3492	46	35	5	3	2013-05-18 22:23:20.981461	2013-05-18 22:23:20.981461
3493	46	35	6	3	2013-05-18 22:23:20.98216	2013-05-18 22:23:20.98216
3494	46	35	7	3	2013-05-18 22:23:20.982901	2013-05-18 22:23:20.982901
3495	46	35	8	3	2013-05-18 22:23:20.983643	2013-05-18 22:23:20.983643
3496	46	35	9	3	2013-05-18 22:23:20.984441	2013-05-18 22:23:20.984441
3497	46	35	10	3	2013-05-18 22:23:20.985226	2013-05-18 22:23:20.985226
3498	46	35	11	3	2013-05-18 22:23:20.985965	2013-05-18 22:23:20.985965
3499	46	35	2	4	2013-05-18 22:23:20.986745	2013-05-18 22:23:20.986745
3500	46	35	3	4	2013-05-18 22:23:20.987478	2013-05-18 22:23:20.987478
3501	46	35	4	4	2013-05-18 22:23:20.988317	2013-05-18 22:23:20.988317
3502	46	35	5	4	2013-05-18 22:23:20.989219	2013-05-18 22:23:20.989219
3503	46	35	6	4	2013-05-18 22:23:20.990082	2013-05-18 22:23:20.990082
3504	46	35	7	4	2013-05-18 22:23:20.990908	2013-05-18 22:23:20.990908
3505	46	35	8	4	2013-05-18 22:23:20.991767	2013-05-18 22:23:20.991767
3506	46	35	9	4	2013-05-18 22:23:20.99269	2013-05-18 22:23:20.99269
3507	46	35	15	4	2013-05-18 22:23:20.993539	2013-05-18 22:23:20.993539
3508	46	35	16	4	2013-05-18 22:23:20.994436	2013-05-18 22:23:20.994436
3509	46	35	17	4	2013-05-18 22:23:20.995318	2013-05-18 22:23:20.995318
3510	46	35	18	4	2013-05-18 22:23:20.996351	2013-05-18 22:23:20.996351
3511	46	35	19	4	2013-05-18 22:23:20.997274	2013-05-18 22:23:20.997274
3512	46	35	20	4	2013-05-18 22:23:20.998201	2013-05-18 22:23:20.998201
3513	46	35	5	5	2013-05-18 22:23:20.999141	2013-05-18 22:23:20.999141
3514	46	35	6	5	2013-05-18 22:23:21.000244	2013-05-18 22:23:21.000244
3515	46	35	7	5	2013-05-18 22:23:21.001262	2013-05-18 22:23:21.001262
3516	46	35	16	5	2013-05-18 22:23:21.002304	2013-05-18 22:23:21.002304
3517	46	35	17	5	2013-05-18 22:23:21.003288	2013-05-18 22:23:21.003288
3518	46	35	18	5	2013-05-18 22:23:21.004211	2013-05-18 22:23:21.004211
3519	46	35	19	5	2013-05-18 22:23:21.005209	2013-05-18 22:23:21.005209
3520	46	35	20	5	2013-05-18 22:23:21.006185	2013-05-18 22:23:21.006185
3521	46	35	3	6	2013-05-18 22:23:21.007173	2013-05-18 22:23:21.007173
3522	46	35	4	6	2013-05-18 22:23:21.008192	2013-05-18 22:23:21.008192
3523	46	35	5	6	2013-05-18 22:23:21.009163	2013-05-18 22:23:21.009163
3524	46	35	6	6	2013-05-18 22:23:21.010071	2013-05-18 22:23:21.010071
3525	46	35	7	6	2013-05-18 22:23:21.010955	2013-05-18 22:23:21.010955
3526	46	35	8	6	2013-05-18 22:23:21.01179	2013-05-18 22:23:21.01179
3527	46	35	9	6	2013-05-18 22:23:21.012711	2013-05-18 22:23:21.012711
3528	46	35	10	6	2013-05-18 22:23:21.013623	2013-05-18 22:23:21.013623
3529	46	35	17	6	2013-05-18 22:23:21.014502	2013-05-18 22:23:21.014502
3530	46	35	18	6	2013-05-18 22:23:21.015415	2013-05-18 22:23:21.015415
3531	46	35	19	6	2013-05-18 22:23:21.016289	2013-05-18 22:23:21.016289
3532	46	35	20	6	2013-05-18 22:23:21.017126	2013-05-18 22:23:21.017126
3533	46	35	26	6	2013-05-18 22:23:21.063801	2013-05-18 22:23:21.063801
3534	46	35	27	6	2013-05-18 22:23:21.064856	2013-05-18 22:23:21.064856
3535	46	35	28	6	2013-05-18 22:23:21.065845	2013-05-18 22:23:21.065845
3536	46	35	29	6	2013-05-18 22:23:21.066888	2013-05-18 22:23:21.066888
3537	46	35	30	6	2013-05-18 22:23:21.067783	2013-05-18 22:23:21.067783
3538	46	35	8	7	2013-05-18 22:23:21.068712	2013-05-18 22:23:21.068712
3539	46	35	9	7	2013-05-18 22:23:21.069803	2013-05-18 22:23:21.069803
3540	46	35	10	7	2013-05-18 22:23:21.070752	2013-05-18 22:23:21.070752
3541	46	35	11	7	2013-05-18 22:23:21.07148	2013-05-18 22:23:21.07148
3542	46	35	12	7	2013-05-18 22:23:21.072526	2013-05-18 22:23:21.072526
3543	46	35	13	7	2013-05-18 22:23:21.073459	2013-05-18 22:23:21.073459
3544	46	35	17	7	2013-05-18 22:23:21.074287	2013-05-18 22:23:21.074287
3545	46	35	18	7	2013-05-18 22:23:21.07522	2013-05-18 22:23:21.07522
3546	46	35	19	7	2013-05-18 22:23:21.076212	2013-05-18 22:23:21.076212
3547	46	35	20	7	2013-05-18 22:23:21.077256	2013-05-18 22:23:21.077256
3548	46	35	27	7	2013-05-18 22:23:21.078303	2013-05-18 22:23:21.078303
3549	46	35	28	7	2013-05-18 22:23:21.079568	2013-05-18 22:23:21.079568
3550	46	35	29	7	2013-05-18 22:23:21.080778	2013-05-18 22:23:21.080778
3551	46	35	30	7	2013-05-18 22:23:21.081641	2013-05-18 22:23:21.081641
3552	46	35	3	8	2013-05-18 22:23:21.082444	2013-05-18 22:23:21.082444
3553	46	35	4	8	2013-05-18 22:23:21.083591	2013-05-18 22:23:21.083591
3554	46	35	5	8	2013-05-18 22:23:21.084618	2013-05-18 22:23:21.084618
3555	46	35	6	8	2013-05-18 22:23:21.085397	2013-05-18 22:23:21.085397
3556	46	35	7	8	2013-05-18 22:23:21.086184	2013-05-18 22:23:21.086184
3557	46	35	8	8	2013-05-18 22:23:21.086993	2013-05-18 22:23:21.086993
3558	46	35	9	8	2013-05-18 22:23:21.087941	2013-05-18 22:23:21.087941
3559	46	35	17	8	2013-05-18 22:23:21.088915	2013-05-18 22:23:21.088915
3560	46	35	18	8	2013-05-18 22:23:21.089788	2013-05-18 22:23:21.089788
3561	46	35	19	8	2013-05-18 22:23:21.090598	2013-05-18 22:23:21.090598
3562	46	35	20	8	2013-05-18 22:23:21.091344	2013-05-18 22:23:21.091344
3563	46	35	29	8	2013-05-18 22:23:21.092427	2013-05-18 22:23:21.092427
3564	46	35	30	8	2013-05-18 22:23:21.093302	2013-05-18 22:23:21.093302
3565	46	35	6	9	2013-05-18 22:23:21.09408	2013-05-18 22:23:21.09408
3566	46	35	7	9	2013-05-18 22:23:21.094824	2013-05-18 22:23:21.094824
3567	46	35	8	9	2013-05-18 22:23:21.095555	2013-05-18 22:23:21.095555
3568	46	35	9	9	2013-05-18 22:23:21.096315	2013-05-18 22:23:21.096315
3569	46	35	10	9	2013-05-18 22:23:21.097039	2013-05-18 22:23:21.097039
3570	46	35	11	9	2013-05-18 22:23:21.097793	2013-05-18 22:23:21.097793
3571	46	35	12	9	2013-05-18 22:23:21.098531	2013-05-18 22:23:21.098531
3572	46	33	18	9	2013-05-18 22:23:21.099306	2013-05-18 22:23:21.099306
3573	46	35	29	9	2013-05-18 22:23:21.100024	2013-05-18 22:23:21.100024
3574	46	35	30	9	2013-05-18 22:23:21.100729	2013-05-18 22:23:21.100729
3575	46	35	8	10	2013-05-18 22:23:21.101558	2013-05-18 22:23:21.101558
3576	46	35	9	10	2013-05-18 22:23:21.102338	2013-05-18 22:23:21.102338
3577	46	35	10	10	2013-05-18 22:23:21.103108	2013-05-18 22:23:21.103108
3578	46	35	11	10	2013-05-18 22:23:21.103873	2013-05-18 22:23:21.103873
3579	46	35	29	10	2013-05-18 22:23:21.104864	2013-05-18 22:23:21.104864
3580	46	35	30	10	2013-05-18 22:23:21.1057	2013-05-18 22:23:21.1057
3581	46	35	9	11	2013-05-18 22:23:21.106604	2013-05-18 22:23:21.106604
3582	46	35	10	11	2013-05-18 22:23:21.107548	2013-05-18 22:23:21.107548
3583	46	35	11	11	2013-05-18 22:23:21.108361	2013-05-18 22:23:21.108361
3584	46	35	12	11	2013-05-18 22:23:21.109265	2013-05-18 22:23:21.109265
3585	46	35	13	11	2013-05-18 22:23:21.110056	2013-05-18 22:23:21.110056
3586	46	35	28	11	2013-05-18 22:23:21.110859	2013-05-18 22:23:21.110859
3587	46	35	29	11	2013-05-18 22:23:21.111596	2013-05-18 22:23:21.111596
3588	46	35	30	11	2013-05-18 22:23:21.112322	2013-05-18 22:23:21.112322
3589	46	35	10	12	2013-05-18 22:23:21.113062	2013-05-18 22:23:21.113062
3590	46	35	11	12	2013-05-18 22:23:21.11377	2013-05-18 22:23:21.11377
3591	46	35	12	12	2013-05-18 22:23:21.11456	2013-05-18 22:23:21.11456
3592	46	35	13	12	2013-05-18 22:23:21.115307	2013-05-18 22:23:21.115307
3593	46	35	28	12	2013-05-18 22:23:21.116032	2013-05-18 22:23:21.116032
3594	46	35	29	12	2013-05-18 22:23:21.116756	2013-05-18 22:23:21.116756
3595	46	35	30	12	2013-05-18 22:23:21.117451	2013-05-18 22:23:21.117451
3596	46	35	11	13	2013-05-18 22:23:21.118187	2013-05-18 22:23:21.118187
3597	46	35	12	13	2013-05-18 22:23:21.118924	2013-05-18 22:23:21.118924
3598	46	35	13	13	2013-05-18 22:23:21.119642	2013-05-18 22:23:21.119642
3599	46	35	26	13	2013-05-18 22:23:21.120352	2013-05-18 22:23:21.120352
3600	46	35	27	13	2013-05-18 22:23:21.121412	2013-05-18 22:23:21.121412
3601	46	35	28	13	2013-05-18 22:23:21.122555	2013-05-18 22:23:21.122555
3602	46	35	29	13	2013-05-18 22:23:21.123417	2013-05-18 22:23:21.123417
3603	46	33	13	14	2013-05-18 22:23:21.124214	2013-05-18 22:23:21.124214
3604	46	35	25	14	2013-05-18 22:23:21.124972	2013-05-18 22:23:21.124972
3605	46	35	26	14	2013-05-18 22:23:21.125833	2013-05-18 22:23:21.125833
3606	46	35	27	14	2013-05-18 22:23:21.126563	2013-05-18 22:23:21.126563
3607	46	35	28	14	2013-05-18 22:23:21.127301	2013-05-18 22:23:21.127301
3608	46	35	29	14	2013-05-18 22:23:21.128012	2013-05-18 22:23:21.128012
3609	46	35	25	15	2013-05-18 22:23:21.128793	2013-05-18 22:23:21.128793
3610	46	35	26	15	2013-05-18 22:23:21.129528	2013-05-18 22:23:21.129528
3611	46	35	27	15	2013-05-18 22:23:21.130226	2013-05-18 22:23:21.130226
3612	46	35	28	15	2013-05-18 22:23:21.130922	2013-05-18 22:23:21.130922
3613	46	35	26	16	2013-05-18 22:23:21.131666	2013-05-18 22:23:21.131666
3614	46	35	27	16	2013-05-18 22:23:21.132408	2013-05-18 22:23:21.132408
3615	46	35	26	17	2013-05-18 22:23:21.133146	2013-05-18 22:23:21.133146
3616	46	35	27	17	2013-05-18 22:23:21.133907	2013-05-18 22:23:21.133907
3617	46	35	28	17	2013-05-18 22:23:21.134863	2013-05-18 22:23:21.134863
3618	46	35	27	18	2013-05-18 22:23:21.135695	2013-05-18 22:23:21.135695
3619	46	35	28	18	2013-05-18 22:23:21.136444	2013-05-18 22:23:21.136444
3620	46	35	28	19	2013-05-18 22:23:21.137313	2013-05-18 22:23:21.137313
3621	46	33	28	20	2013-05-18 22:23:21.138105	2013-05-18 22:23:21.138105
3770	18	17	14	0	2013-05-19 00:22:35.287264	2013-05-19 00:22:35.287264
3771	18	17	16	0	2013-05-19 00:22:35.288859	2013-05-19 00:22:35.288859
3772	18	17	18	0	2013-05-19 00:22:35.289783	2013-05-19 00:22:35.289783
3773	18	17	20	0	2013-05-19 00:22:35.290642	2013-05-19 00:22:35.290642
3774	18	17	22	0	2013-05-19 00:22:35.291512	2013-05-19 00:22:35.291512
3775	18	13	27	0	2013-05-19 00:22:35.292347	2013-05-19 00:22:35.292347
3776	18	10	28	0	2013-05-19 00:22:35.293155	2013-05-19 00:22:35.293155
3777	18	10	29	0	2013-05-19 00:22:35.293996	2013-05-19 00:22:35.293996
3778	18	10	30	0	2013-05-19 00:22:35.294796	2013-05-19 00:22:35.294796
3779	18	11	0	3	2013-05-19 00:22:35.301437	2013-05-19 00:22:35.301437
3780	18	11	2	3	2013-05-19 00:22:35.3029	2013-05-19 00:22:35.3029
3781	18	11	4	3	2013-05-19 00:22:35.30402	2013-05-19 00:22:35.30402
3782	18	11	5	4	2013-05-19 00:22:35.309597	2013-05-19 00:22:35.309597
3783	18	11	4	6	2013-05-19 00:22:35.315136	2013-05-19 00:22:35.315136
3784	18	11	22	11	2013-05-19 00:22:35.334824	2013-05-19 00:22:35.334824
3785	18	17	23	11	2013-05-19 00:22:35.33587	2013-05-19 00:22:35.33587
3786	18	17	21	12	2013-05-19 00:22:35.346143	2013-05-19 00:22:35.346143
3787	18	11	21	13	2013-05-19 00:22:35.35308	2013-05-19 00:22:35.35308
3788	18	17	21	14	2013-05-19 00:22:35.359804	2013-05-19 00:22:35.359804
3789	18	11	21	15	2013-05-19 00:22:35.365282	2013-05-19 00:22:35.365282
3790	18	11	9	21	2013-05-19 00:22:35.410757	2013-05-19 00:22:35.410757
3791	18	17	11	21	2013-05-19 00:22:35.411616	2013-05-19 00:22:35.411616
3792	18	11	13	21	2013-05-19 00:22:35.412393	2013-05-19 00:22:35.412393
3793	18	17	15	21	2013-05-19 00:22:35.413208	2013-05-19 00:22:35.413208
3794	18	11	17	21	2013-05-19 00:22:35.414077	2013-05-19 00:22:35.414077
3795	18	11	27	21	2013-05-19 00:22:35.420372	2013-05-19 00:22:35.420372
3796	18	17	29	21	2013-05-19 00:22:35.421341	2013-05-19 00:22:35.421341
3797	18	11	31	21	2013-05-19 00:22:35.422162	2013-05-19 00:22:35.422162
3798	18	17	33	21	2013-05-19 00:22:35.422992	2013-05-19 00:22:35.422992
4121	28	8	14	12	2013-05-19 21:08:48.310663	2013-05-19 21:08:48.310663
4122	38	11	21	1	2013-05-23 02:51:52.321113	2013-05-23 02:51:52.321113
4123	38	17	22	1	2013-05-23 02:51:52.321925	2013-05-23 02:51:52.321925
4124	38	30	3	4	2013-05-23 02:51:52.332161	2013-05-23 02:51:52.332161
4125	38	13	10	9	2013-05-23 02:51:52.369134	2013-05-23 02:51:52.369134
4126	38	10	11	9	2013-05-23 02:51:52.369865	2013-05-23 02:51:52.369865
4127	38	13	26	9	2013-05-23 02:51:52.480034	2013-05-23 02:51:52.480034
4128	38	10	27	9	2013-05-23 02:51:52.48112	2013-05-23 02:51:52.48112
4129	38	10	28	9	2013-05-23 02:51:52.482073	2013-05-23 02:51:52.482073
4130	38	8	19	15	2013-05-23 02:51:52.503517	2013-05-23 02:51:52.503517
4131	38	31	14	18	2013-05-23 02:51:52.505258	2013-05-23 02:51:52.505258
4132	38	32	15	18	2013-05-23 02:51:52.505951	2013-05-23 02:51:52.505951
4158	49	25	16	10	2013-05-23 03:35:49.399637	2013-05-23 03:35:49.399637
4589	53	13	14	4	2013-05-25 00:43:53.226874	2013-05-25 00:43:53.226874
4590	53	10	15	4	2013-05-25 00:43:53.227697	2013-05-25 00:43:53.227697
4591	53	10	17	4	2013-05-25 00:43:53.228392	2013-05-25 00:43:53.228392
4592	53	10	18	4	2013-05-25 00:43:53.229091	2013-05-25 00:43:53.229091
4593	51	13	14	0	2013-05-25 00:44:09.079556	2013-05-25 00:44:09.079556
4594	51	10	15	0	2013-05-25 00:44:09.080624	2013-05-25 00:44:09.080624
4595	51	10	17	0	2013-05-25 00:44:09.081443	2013-05-25 00:44:09.081443
4596	51	13	12	7	2013-05-25 00:44:09.103657	2013-05-25 00:44:09.103657
4597	51	10	13	7	2013-05-25 00:44:09.104625	2013-05-25 00:44:09.104625
4598	51	10	14	7	2013-05-25 00:44:09.105375	2013-05-25 00:44:09.105375
4599	51	10	16	7	2013-05-25 00:44:09.106066	2013-05-25 00:44:09.106066
4600	51	13	6	14	2013-05-25 00:44:09.126084	2013-05-25 00:44:09.126084
4601	51	10	7	14	2013-05-25 00:44:09.126901	2013-05-25 00:44:09.126901
4602	51	10	8	14	2013-05-25 00:44:09.12768	2013-05-25 00:44:09.12768
4603	51	10	10	14	2013-05-25 00:44:09.128387	2013-05-25 00:44:09.128387
4604	51	10	11	14	2013-05-25 00:44:09.129126	2013-05-25 00:44:09.129126
4622	52	8	6	4	2013-05-25 00:52:46.751751	2013-05-25 00:52:46.751751
4623	52	8	7	4	2013-05-25 00:52:46.752496	2013-05-25 00:52:46.752496
4624	52	8	26	4	2013-05-25 00:52:46.756515	2013-05-25 00:52:46.756515
4625	52	8	27	4	2013-05-25 00:52:46.757233	2013-05-25 00:52:46.757233
4626	52	13	12	11	2013-05-25 00:52:46.80431	2013-05-25 00:52:46.80431
4627	52	10	13	11	2013-05-25 00:52:46.805063	2013-05-25 00:52:46.805063
4628	52	10	14	11	2013-05-25 00:52:46.806046	2013-05-25 00:52:46.806046
5029	25	31	12	0	2013-05-26 04:37:22.849618	2013-05-26 04:37:22.849618
5030	25	13	14	0	2013-05-26 04:37:22.850387	2013-05-26 04:37:22.850387
5031	25	10	15	0	2013-05-26 04:37:22.851117	2013-05-26 04:37:22.851117
5032	25	10	16	0	2013-05-26 04:37:22.851856	2013-05-26 04:37:22.851856
5033	25	10	17	0	2013-05-26 04:37:22.85257	2013-05-26 04:37:22.85257
5034	25	31	19	0	2013-05-26 04:37:22.853281	2013-05-26 04:37:22.853281
5035	25	31	26	0	2013-05-26 04:37:22.854007	2013-05-26 04:37:22.854007
5036	25	31	33	0	2013-05-26 04:37:22.854713	2013-05-26 04:37:22.854713
5037	25	31	10	4	2013-05-26 04:37:22.86832	2013-05-26 04:37:22.86832
5038	25	13	29	5	2013-05-26 04:37:22.874009	2013-05-26 04:37:22.874009
5039	25	10	30	5	2013-05-26 04:37:22.874714	2013-05-26 04:37:22.874714
5040	25	31	35	5	2013-05-26 04:37:22.875446	2013-05-26 04:37:22.875446
5041	25	31	13	10	2013-05-26 04:37:22.898498	2013-05-26 04:37:22.898498
5042	25	8	3	11	2013-05-26 04:37:22.900889	2013-05-26 04:37:22.900889
5043	25	13	29	11	2013-05-26 04:37:22.906803	2013-05-26 04:37:22.906803
5044	25	10	30	11	2013-05-26 04:37:22.907692	2013-05-26 04:37:22.907692
5045	25	10	31	11	2013-05-26 04:37:22.909075	2013-05-26 04:37:22.909075
5046	25	31	35	12	2013-05-26 04:37:22.918039	2013-05-26 04:37:22.918039
5047	25	31	35	19	2013-05-26 04:37:22.950041	2013-05-26 04:37:22.950041
5048	25	31	11	21	2013-05-26 04:37:22.950812	2013-05-26 04:37:22.950812
5049	25	31	18	21	2013-05-26 04:37:22.951503	2013-05-26 04:37:22.951503
5050	25	31	24	21	2013-05-26 04:37:22.952187	2013-05-26 04:37:22.952187
5051	25	31	31	21	2013-05-26 04:37:22.952873	2013-05-26 04:37:22.952873
5066	35	11	21	1	2013-05-26 04:50:54.601908	2013-05-26 04:50:54.601908
5067	35	17	22	1	2013-05-26 04:50:54.60269	2013-05-26 04:50:54.60269
5068	35	30	3	4	2013-05-26 04:50:54.610018	2013-05-26 04:50:54.610018
5069	35	13	15	4	2013-05-26 04:50:54.614651	2013-05-26 04:50:54.614651
5070	35	10	18	4	2013-05-26 04:50:54.615367	2013-05-26 04:50:54.615367
5071	35	10	24	4	2013-05-26 04:50:54.616064	2013-05-26 04:50:54.616064
5072	35	10	30	4	2013-05-26 04:50:54.616781	2013-05-26 04:50:54.616781
5073	35	32	28	10	2013-05-26 04:50:54.639076	2013-05-26 04:50:54.639076
5074	35	31	28	11	2013-05-26 04:50:54.646327	2013-05-26 04:50:54.646327
5075	35	17	14	12	2013-05-26 04:50:54.647098	2013-05-26 04:50:54.647098
5076	35	11	15	12	2013-05-26 04:50:54.647809	2013-05-26 04:50:54.647809
5077	35	8	19	12	2013-05-26 04:50:54.64857	2013-05-26 04:50:54.64857
5078	35	11	28	12	2013-05-26 04:50:54.651688	2013-05-26 04:50:54.651688
5079	35	17	28	13	2013-05-26 04:50:54.655807	2013-05-26 04:50:54.655807
5089	37	13	7	3	2013-05-26 05:07:08.762103	2013-05-26 05:07:08.762103
5090	37	10	8	3	2013-05-26 05:07:08.762835	2013-05-26 05:07:08.762835
5091	37	10	9	3	2013-05-26 05:07:08.763607	2013-05-26 05:07:08.763607
5092	37	10	10	3	2013-05-26 05:07:08.764325	2013-05-26 05:07:08.764325
5093	37	30	17	4	2013-05-26 05:07:08.765085	2013-05-26 05:07:08.765085
5094	37	30	17	6	2013-05-26 05:07:08.765869	2013-05-26 05:07:08.765869
5095	37	31	16	14	2013-05-26 05:07:08.816993	2013-05-26 05:07:08.816993
5096	37	32	19	14	2013-05-26 05:07:08.81967	2013-05-26 05:07:08.81967
5097	47	13	7	2	2013-05-26 18:48:50.091825	2013-05-26 18:48:50.091825
5098	47	34	8	2	2013-05-26 18:48:50.092569	2013-05-26 18:48:50.092569
5099	47	34	9	2	2013-05-26 18:48:50.093283	2013-05-26 18:48:50.093283
5100	47	31	16	2	2013-05-26 18:48:50.094022	2013-05-26 18:48:50.094022
5101	47	32	19	2	2013-05-26 18:48:50.097024	2013-05-26 18:48:50.097024
5102	47	13	25	2	2013-05-26 18:48:50.098396	2013-05-26 18:48:50.098396
5103	47	34	26	2	2013-05-26 18:48:50.09925	2013-05-26 18:48:50.09925
5104	47	34	27	2	2013-05-26 18:48:50.100139	2013-05-26 18:48:50.100139
5105	47	11	16	3	2013-05-26 18:48:50.100991	2013-05-26 18:48:50.100991
5106	47	17	19	3	2013-05-26 18:48:50.103757	2013-05-26 18:48:50.103757
5107	47	8	17	6	2013-05-26 18:48:50.106307	2013-05-26 18:48:50.106307
5108	47	11	17	11	2013-05-26 18:48:50.110575	2013-05-26 18:48:50.110575
5109	47	17	18	11	2013-05-26 18:48:50.111375	2013-05-26 18:48:50.111375
5110	47	31	15	14	2013-05-26 18:48:50.119234	2013-05-26 18:48:50.119234
5111	47	32	19	14	2013-05-26 18:48:50.122317	2013-05-26 18:48:50.122317
5112	48	17	24	0	2013-05-27 06:09:46.021793	2013-05-27 06:09:46.021793
5113	48	32	26	0	2013-05-27 06:09:46.022612	2013-05-27 06:09:46.022612
5114	48	17	33	0	2013-05-27 06:09:46.023399	2013-05-27 06:09:46.023399
5115	48	13	5	2	2013-05-27 06:09:46.029299	2013-05-27 06:09:46.029299
5116	48	34	7	2	2013-05-27 06:09:46.029996	2013-05-27 06:09:46.029996
5117	48	32	35	3	2013-05-27 06:09:46.052347	2013-05-27 06:09:46.052347
5118	48	17	35	4	2013-05-27 06:09:46.063876	2013-05-27 06:09:46.063876
5119	48	32	0	5	2013-05-27 06:09:46.064694	2013-05-27 06:09:46.064694
5120	48	8	25	7	2013-05-27 06:09:46.080021	2013-05-27 06:09:46.080021
5121	48	13	13	12	2013-05-27 06:09:46.120887	2013-05-27 06:09:46.120887
5122	48	34	14	12	2013-05-27 06:09:46.121756	2013-05-27 06:09:46.121756
5123	48	34	15	12	2013-05-27 06:09:46.12255	2013-05-27 06:09:46.12255
5124	48	17	0	13	2013-05-27 06:09:46.123325	2013-05-27 06:09:46.123325
5125	48	32	35	13	2013-05-27 06:09:46.124206	2013-05-27 06:09:46.124206
5126	48	32	0	14	2013-05-27 06:09:46.124963	2013-05-27 06:09:46.124963
5127	48	17	35	14	2013-05-27 06:09:46.125728	2013-05-27 06:09:46.125728
5128	48	11	1	21	2013-05-27 06:09:46.128936	2013-05-27 06:09:46.128936
5129	48	31	2	21	2013-05-27 06:09:46.130032	2013-05-27 06:09:46.130032
5130	48	11	15	21	2013-05-27 06:09:46.130936	2013-05-27 06:09:46.130936
5131	48	31	16	21	2013-05-27 06:09:46.13181	2013-05-27 06:09:46.13181
5132	48	11	29	21	2013-05-27 06:09:46.132841	2013-05-27 06:09:46.132841
5133	48	31	30	21	2013-05-27 06:09:46.133928	2013-05-27 06:09:46.133928
5134	54	17	24	0	2013-05-27 06:47:06.160841	2013-05-27 06:47:06.160841
5135	54	32	26	0	2013-05-27 06:47:06.162904	2013-05-27 06:47:06.162904
5136	54	17	33	0	2013-05-27 06:47:06.164612	2013-05-27 06:47:06.164612
5137	54	32	35	3	2013-05-27 06:47:06.195747	2013-05-27 06:47:06.195747
5138	54	17	35	4	2013-05-27 06:47:06.208648	2013-05-27 06:47:06.208648
5139	54	32	0	5	2013-05-27 06:47:06.209491	2013-05-27 06:47:06.209491
5140	54	11	15	7	2013-05-27 06:47:06.21767	2013-05-27 06:47:06.21767
5141	54	8	25	7	2013-05-27 06:47:06.219945	2013-05-27 06:47:06.219945
5142	54	31	15	8	2013-05-27 06:47:06.222873	2013-05-27 06:47:06.222873
5143	54	11	8	9	2013-05-27 06:47:06.229601	2013-05-27 06:47:06.229601
5144	54	31	9	9	2013-05-27 06:47:06.230346	2013-05-27 06:47:06.230346
5145	54	13	23	11	2013-05-27 06:47:06.320755	2013-05-27 06:47:06.320755
5146	54	34	24	11	2013-05-27 06:47:06.321495	2013-05-27 06:47:06.321495
5147	54	17	0	13	2013-05-27 06:47:06.328477	2013-05-27 06:47:06.328477
5148	54	8	7	13	2013-05-27 06:47:06.33078	2013-05-27 06:47:06.33078
5149	54	13	23	13	2013-05-27 06:47:06.333814	2013-05-27 06:47:06.333814
5150	54	34	24	13	2013-05-27 06:47:06.334515	2013-05-27 06:47:06.334515
5151	54	32	35	13	2013-05-27 06:47:06.335272	2013-05-27 06:47:06.335272
5152	54	32	0	14	2013-05-27 06:47:06.335969	2013-05-27 06:47:06.335969
5153	54	32	18	14	2013-05-27 06:47:06.338272	2013-05-27 06:47:06.338272
5154	54	17	35	14	2013-05-27 06:47:06.340401	2013-05-27 06:47:06.340401
5155	54	17	18	15	2013-05-27 06:47:06.342618	2013-05-27 06:47:06.342618
5156	54	13	23	15	2013-05-27 06:47:06.344733	2013-05-27 06:47:06.344733
5157	54	34	24	15	2013-05-27 06:47:06.345445	2013-05-27 06:47:06.345445
5158	54	13	23	17	2013-05-27 06:47:06.376833	2013-05-27 06:47:06.376833
5159	54	34	24	17	2013-05-27 06:47:06.377797	2013-05-27 06:47:06.377797
5160	54	11	10	18	2013-05-27 06:47:06.379917	2013-05-27 06:47:06.379917
5161	54	31	11	18	2013-05-27 06:47:06.380787	2013-05-27 06:47:06.380787
5162	54	11	1	21	2013-05-27 06:47:06.382642	2013-05-27 06:47:06.382642
5163	54	31	2	21	2013-05-27 06:47:06.383448	2013-05-27 06:47:06.383448
5164	54	11	15	21	2013-05-27 06:47:06.386111	2013-05-27 06:47:06.386111
5165	54	31	16	21	2013-05-27 06:47:06.386913	2013-05-27 06:47:06.386913
5166	54	11	29	21	2013-05-27 06:47:06.387749	2013-05-27 06:47:06.387749
5167	54	31	30	21	2013-05-27 06:47:06.388786	2013-05-27 06:47:06.388786
5258	55	13	13	0	2013-05-27 14:48:13.000217	2013-05-27 14:48:13.000217
5259	55	10	14	0	2013-05-27 14:48:13.001352	2013-05-27 14:48:13.001352
5260	55	32	18	0	2013-05-27 14:48:13.002079	2013-05-27 14:48:13.002079
5261	55	17	18	1	2013-05-27 14:48:13.015339	2013-05-27 14:48:13.015339
5262	55	11	20	2	2013-05-27 14:48:13.028951	2013-05-27 14:48:13.028951
5263	55	32	20	3	2013-05-27 14:48:13.039817	2013-05-27 14:48:13.039817
5264	55	13	13	4	2013-05-27 14:48:13.054399	2013-05-27 14:48:13.054399
5265	55	10	14	4	2013-05-27 14:48:13.055145	2013-05-27 14:48:13.055145
5266	55	11	22	4	2013-05-27 14:48:13.055994	2013-05-27 14:48:13.055994
5267	55	17	22	5	2013-05-27 14:48:13.067596	2013-05-27 14:48:13.067596
5268	55	11	24	6	2013-05-27 14:48:13.080794	2013-05-27 14:48:13.080794
5269	55	32	24	7	2013-05-27 14:48:13.092023	2013-05-27 14:48:13.092023
5270	55	13	13	8	2013-05-27 14:48:13.105678	2013-05-27 14:48:13.105678
5271	55	10	14	8	2013-05-27 14:48:13.107011	2013-05-27 14:48:13.107011
5272	55	11	26	8	2013-05-27 14:48:13.109336	2013-05-27 14:48:13.109336
5273	55	32	8	9	2013-05-27 14:48:13.123331	2013-05-27 14:48:13.123331
5274	55	17	26	9	2013-05-27 14:48:13.124508	2013-05-27 14:48:13.124508
5275	55	11	28	10	2013-05-27 14:48:13.136254	2013-05-27 14:48:13.136254
5276	55	32	10	11	2013-05-27 14:48:13.147232	2013-05-27 14:48:13.147232
5277	55	32	28	11	2013-05-27 14:48:13.148041	2013-05-27 14:48:13.148041
5278	55	13	18	12	2013-05-27 14:48:13.162649	2013-05-27 14:48:13.162649
5279	55	10	19	12	2013-05-27 14:48:13.163544	2013-05-27 14:48:13.163544
5280	55	10	20	12	2013-05-27 14:48:13.164416	2013-05-27 14:48:13.164416
5281	55	10	21	12	2013-05-27 14:48:13.165291	2013-05-27 14:48:13.165291
5282	55	11	30	12	2013-05-27 14:48:13.166114	2013-05-27 14:48:13.166114
5283	55	32	12	13	2013-05-27 14:48:13.175041	2013-05-27 14:48:13.175041
5284	55	17	30	13	2013-05-27 14:48:13.175907	2013-05-27 14:48:13.175907
5285	55	11	32	14	2013-05-27 14:48:13.184385	2013-05-27 14:48:13.184385
5286	55	31	0	15	2013-05-27 14:48:13.187505	2013-05-27 14:48:13.187505
5287	55	32	32	15	2013-05-27 14:48:13.192163	2013-05-27 14:48:13.192163
5288	55	11	0	16	2013-05-27 14:48:13.195833	2013-05-27 14:48:13.195833
5289	55	11	34	16	2013-05-27 14:48:13.202826	2013-05-27 14:48:13.202826
5290	55	17	34	17	2013-05-27 14:48:13.208686	2013-05-27 14:48:13.208686
5291	55	31	0	18	2013-05-27 14:48:13.21058	2013-05-27 14:48:13.21058
5292	55	32	34	18	2013-05-27 14:48:13.216725	2013-05-27 14:48:13.216725
5293	55	11	0	19	2013-05-27 14:48:13.218381	2013-05-27 14:48:13.218381
5294	55	31	1	21	2013-05-27 14:48:13.222069	2013-05-27 14:48:13.222069
5295	55	11	2	21	2013-05-27 14:48:13.223096	2013-05-27 14:48:13.223096
5296	55	31	7	21	2013-05-27 14:48:13.223993	2013-05-27 14:48:13.223993
5297	55	11	8	21	2013-05-27 14:48:13.224791	2013-05-27 14:48:13.224791
5298	55	31	17	21	2013-05-27 14:48:13.225692	2013-05-27 14:48:13.225692
5299	55	11	18	21	2013-05-27 14:48:13.226677	2013-05-27 14:48:13.226677
5300	55	17	30	21	2013-05-27 14:48:13.227775	2013-05-27 14:48:13.227775
5301	16	11	11	0	2013-05-28 01:13:32.32433	2013-05-28 01:13:32.32433
5302	16	17	0	4	2013-05-28 01:13:32.338346	2013-05-28 01:13:32.338346
5303	16	11	15	4	2013-05-28 01:13:32.339399	2013-05-28 01:13:32.339399
5304	16	17	5	6	2013-05-28 01:13:32.34591	2013-05-28 01:13:32.34591
5305	16	8	3	11	2013-05-28 01:13:32.429034	2013-05-28 01:13:32.429034
5306	16	8	28	11	2013-05-28 01:13:32.431686	2013-05-28 01:13:32.431686
5307	16	11	7	13	2013-05-28 01:13:32.439195	2013-05-28 01:13:32.439195
5308	16	31	8	13	2013-05-28 01:13:32.439908	2013-05-28 01:13:32.439908
5309	16	32	9	13	2013-05-28 01:13:32.440605	2013-05-28 01:13:32.440605
5310	16	17	10	13	2013-05-28 01:13:32.441277	2013-05-28 01:13:32.441277
5311	16	32	29	13	2013-05-28 01:13:32.447605	2013-05-28 01:13:32.447605
5312	16	31	30	13	2013-05-28 01:13:32.448337	2013-05-28 01:13:32.448337
5313	16	32	17	16	2013-05-28 01:13:32.552678	2013-05-28 01:13:32.552678
5314	16	31	18	16	2013-05-28 01:13:32.553509	2013-05-28 01:13:32.553509
5315	16	8	3	19	2013-05-28 01:13:32.561082	2013-05-28 01:13:32.561082
5316	16	8	27	19	2013-05-28 01:13:32.565522	2013-05-28 01:13:32.565522
5317	21	32	21	0	2013-05-28 01:20:01.212672	2013-05-28 01:20:01.212672
5318	21	31	22	0	2013-05-28 01:20:01.213606	2013-05-28 01:20:01.213606
5319	21	30	4	4	2013-05-28 01:20:01.22294	2013-05-28 01:20:01.22294
5320	21	30	7	4	2013-05-28 01:20:01.223758	2013-05-28 01:20:01.223758
5321	21	17	35	10	2013-05-28 01:20:01.24744	2013-05-28 01:20:01.24744
5322	21	11	35	11	2013-05-28 01:20:01.258718	2013-05-28 01:20:01.258718
5323	21	17	35	12	2013-05-28 01:20:01.269547	2013-05-28 01:20:01.269547
5324	21	11	35	13	2013-05-28 01:20:01.270691	2013-05-28 01:20:01.270691
5325	21	8	8	16	2013-05-28 01:20:01.273965	2013-05-28 01:20:01.273965
5326	21	8	13	16	2013-05-28 01:20:01.274804	2013-05-28 01:20:01.274804
5327	21	31	35	17	2013-05-28 01:20:01.275625	2013-05-28 01:20:01.275625
5328	21	32	35	18	2013-05-28 01:20:01.277277	2013-05-28 01:20:01.277277
5329	21	32	23	21	2013-05-28 01:20:01.280634	2013-05-28 01:20:01.280634
5330	21	31	24	21	2013-05-28 01:20:01.281866	2013-05-28 01:20:01.281866
5642	56	29	12	0	2013-06-10 03:35:32.259607	2013-06-10 03:35:32.259607
5643	56	36	17	7	2013-06-10 03:35:32.266481	2013-06-10 03:35:32.266481
5644	56	36	19	9	2013-06-10 03:35:32.267302	2013-06-10 03:35:32.267302
5645	56	29	6	12	2013-06-10 03:35:32.268256	2013-06-10 03:35:32.268256
5646	56	29	13	12	2013-06-10 03:35:32.269116	2013-06-10 03:35:32.269116
5647	56	29	9	13	2013-06-10 03:35:32.275351	2013-06-10 03:35:32.275351
5648	56	29	8	14	2013-06-10 03:35:32.286634	2013-06-10 03:35:32.286634
5649	56	37	5	18	2013-06-10 03:35:32.296813	2013-06-10 03:35:32.296813
5650	56	37	6	18	2013-06-10 03:35:32.297575	2013-06-10 03:35:32.297575
5720	58	29	16	0	2013-06-10 04:03:23.891091	2013-06-10 04:03:23.891091
5721	58	36	16	6	2013-06-10 04:03:23.893332	2013-06-10 04:03:23.893332
5722	58	29	28	6	2013-06-10 04:03:23.894143	2013-06-10 04:03:23.894143
5723	58	29	11	10	2013-06-10 04:03:23.97425	2013-06-10 04:03:23.97425
5724	58	29	21	11	2013-06-10 04:03:23.998391	2013-06-10 04:03:23.998391
5725	58	29	4	15	2013-06-10 04:03:24.129899	2013-06-10 04:03:24.129899
5726	58	36	16	16	2013-06-10 04:03:24.141309	2013-06-10 04:03:24.141309
5727	58	29	3	19	2013-06-10 04:03:24.166335	2013-06-10 04:03:24.166335
5728	58	29	32	19	2013-06-10 04:03:24.167201	2013-06-10 04:03:24.167201
5729	58	29	29	20	2013-06-10 04:03:24.171607	2013-06-10 04:03:24.171607
5730	58	11	12	21	2013-06-10 04:03:24.18023	2013-06-10 04:03:24.18023
5731	58	31	13	21	2013-06-10 04:03:24.181146	2013-06-10 04:03:24.181146
5732	58	39	14	21	2013-06-10 04:03:24.182039	2013-06-10 04:03:24.182039
5733	58	17	15	21	2013-06-10 04:03:24.182913	2013-06-10 04:03:24.182913
5734	58	32	16	21	2013-06-10 04:03:24.183886	2013-06-10 04:03:24.183886
5735	58	38	17	21	2013-06-10 04:03:24.184815	2013-06-10 04:03:24.184815
5736	58	11	18	21	2013-06-10 04:03:24.185769	2013-06-10 04:03:24.185769
5737	58	31	19	21	2013-06-10 04:03:24.1869	2013-06-10 04:03:24.1869
5738	58	39	20	21	2013-06-10 04:03:24.187907	2013-06-10 04:03:24.187907
5739	58	17	21	21	2013-06-10 04:03:24.188725	2013-06-10 04:03:24.188725
5740	58	32	22	21	2013-06-10 04:03:24.189619	2013-06-10 04:03:24.189619
5741	58	38	23	21	2013-06-10 04:03:24.190475	2013-06-10 04:03:24.190475
5793	59	29	16	0	2013-06-10 04:18:58.867709	2013-06-10 04:18:58.867709
5794	59	29	0	4	2013-06-10 04:18:58.869223	2013-06-10 04:18:58.869223
5795	59	29	35	4	2013-06-10 04:18:58.870341	2013-06-10 04:18:58.870341
5796	59	17	0	5	2013-06-10 04:18:58.871262	2013-06-10 04:18:58.871262
5797	59	38	35	5	2013-06-10 04:18:58.872252	2013-06-10 04:18:58.872252
5798	59	32	0	6	2013-06-10 04:18:58.873348	2013-06-10 04:18:58.873348
5799	59	32	35	6	2013-06-10 04:18:58.874587	2013-06-10 04:18:58.874587
5800	59	39	0	7	2013-06-10 04:18:58.875673	2013-06-10 04:18:58.875673
5801	59	11	1	7	2013-06-10 04:18:58.876575	2013-06-10 04:18:58.876575
5802	59	31	2	7	2013-06-10 04:18:58.877595	2013-06-10 04:18:58.877595
5803	59	38	3	7	2013-06-10 04:18:58.878442	2013-06-10 04:18:58.878442
5804	59	29	4	7	2013-06-10 04:18:58.879241	2013-06-10 04:18:58.879241
5805	59	29	31	7	2013-06-10 04:18:58.881266	2013-06-10 04:18:58.881266
5806	59	11	32	7	2013-06-10 04:18:58.882093	2013-06-10 04:18:58.882093
5807	59	31	33	7	2013-06-10 04:18:58.882992	2013-06-10 04:18:58.882992
5808	59	39	34	7	2013-06-10 04:18:58.88396	2013-06-10 04:18:58.88396
5809	59	17	35	7	2013-06-10 04:18:58.884968	2013-06-10 04:18:58.884968
5810	59	13	13	9	2013-06-10 04:18:58.906216	2013-06-10 04:18:58.906216
5811	59	10	14	9	2013-06-10 04:18:58.907038	2013-06-10 04:18:58.907038
5812	59	10	15	9	2013-06-10 04:18:58.90789	2013-06-10 04:18:58.90789
5813	59	10	16	9	2013-06-10 04:18:58.908683	2013-06-10 04:18:58.908683
5814	59	29	0	15	2013-06-10 04:18:58.934007	2013-06-10 04:18:58.934007
5815	59	29	35	15	2013-06-10 04:18:58.936402	2013-06-10 04:18:58.936402
5816	59	29	17	21	2013-06-10 04:18:58.937951	2013-06-10 04:18:58.937951
5889	57	29	4	0	2013-06-16 04:43:30.368693	2013-06-16 04:43:30.368693
5890	57	38	25	0	2013-06-16 04:43:30.373284	2013-06-16 04:43:30.373284
5891	57	39	26	0	2013-06-16 04:43:30.373976	2013-06-16 04:43:30.373976
5892	57	11	27	0	2013-06-16 04:43:30.374653	2013-06-16 04:43:30.374653
5893	57	32	28	0	2013-06-16 04:43:30.375322	2013-06-16 04:43:30.375322
5894	57	31	29	0	2013-06-16 04:43:30.375987	2013-06-16 04:43:30.375987
5895	57	13	15	1	2013-06-16 04:43:30.379927	2013-06-16 04:43:30.379927
5896	57	10	16	1	2013-06-16 04:43:30.380615	2013-06-16 04:43:30.380615
5897	57	10	17	1	2013-06-16 04:43:30.381339	2013-06-16 04:43:30.381339
5898	57	17	22	1	2013-06-16 04:43:30.383442	2013-06-16 04:43:30.383442
5899	57	13	26	1	2013-06-16 04:43:30.384163	2013-06-16 04:43:30.384163
5900	57	10	27	1	2013-06-16 04:43:30.384826	2013-06-16 04:43:30.384826
5901	57	10	28	1	2013-06-16 04:43:30.385492	2013-06-16 04:43:30.385492
5902	57	29	35	4	2013-06-16 04:43:30.392914	2013-06-16 04:43:30.392914
5903	57	29	0	5	2013-06-16 04:43:30.393617	2013-06-16 04:43:30.393617
5904	57	29	35	12	2013-06-16 04:43:30.4032	2013-06-16 04:43:30.4032
5905	57	29	0	16	2013-06-16 04:43:30.404171	2013-06-16 04:43:30.404171
5906	57	36	6	18	2013-06-16 04:43:30.406534	2013-06-16 04:43:30.406534
5907	57	37	7	18	2013-06-16 04:43:30.407215	2013-06-16 04:43:30.407215
5908	57	29	7	21	2013-06-16 04:43:30.414124	2013-06-16 04:43:30.414124
5909	57	29	23	21	2013-06-16 04:43:30.416762	2013-06-16 04:43:30.416762
5910	57	38	25	21	2013-06-16 04:43:30.417487	2013-06-16 04:43:30.417487
5911	57	39	26	21	2013-06-16 04:43:30.418173	2013-06-16 04:43:30.418173
5912	57	11	27	21	2013-06-16 04:43:30.418942	2013-06-16 04:43:30.418942
5913	57	17	28	21	2013-06-16 04:43:30.419748	2013-06-16 04:43:30.419748
5914	57	31	29	21	2013-06-16 04:43:30.420469	2013-06-16 04:43:30.420469
5915	57	32	30	21	2013-06-16 04:43:30.421302	2013-06-16 04:43:30.421302
5916	57	29	35	21	2013-06-16 04:43:30.422205	2013-06-16 04:43:30.422205
5991	45	31	34	0	2013-06-21 21:36:22.292041	2013-06-21 21:36:22.292041
5992	45	32	35	0	2013-06-21 21:36:22.292826	2013-06-21 21:36:22.292826
5993	45	31	0	4	2013-06-21 21:36:22.294856	2013-06-21 21:36:22.294856
5994	45	32	0	5	2013-06-21 21:36:22.295652	2013-06-21 21:36:22.295652
5995	45	31	35	9	2013-06-21 21:36:22.297633	2013-06-21 21:36:22.297633
5996	45	8	10	10	2013-06-21 21:36:22.298441	2013-06-21 21:36:22.298441
5997	45	8	11	10	2013-06-21 21:36:22.299227	2013-06-21 21:36:22.299227
5998	45	8	12	10	2013-06-21 21:36:22.299985	2013-06-21 21:36:22.299985
5999	45	8	13	10	2013-06-21 21:36:22.300711	2013-06-21 21:36:22.300711
6000	45	8	14	10	2013-06-21 21:36:22.301602	2013-06-21 21:36:22.301602
6001	45	8	15	10	2013-06-21 21:36:22.302732	2013-06-21 21:36:22.302732
6002	45	8	16	10	2013-06-21 21:36:22.303515	2013-06-21 21:36:22.303515
6003	45	8	17	10	2013-06-21 21:36:22.304214	2013-06-21 21:36:22.304214
6004	45	8	18	10	2013-06-21 21:36:22.305051	2013-06-21 21:36:22.305051
6005	45	8	19	10	2013-06-21 21:36:22.305818	2013-06-21 21:36:22.305818
6006	45	32	35	10	2013-06-21 21:36:22.306621	2013-06-21 21:36:22.306621
6007	45	30	13	13	2013-06-21 21:36:22.308502	2013-06-21 21:36:22.308502
6008	45	30	14	13	2013-06-21 21:36:22.30928	2013-06-21 21:36:22.30928
6009	45	30	15	13	2013-06-21 21:36:22.310137	2013-06-21 21:36:22.310137
6010	45	30	16	13	2013-06-21 21:36:22.311153	2013-06-21 21:36:22.311153
6011	45	30	17	13	2013-06-21 21:36:22.312131	2013-06-21 21:36:22.312131
6012	45	30	18	13	2013-06-21 21:36:22.313093	2013-06-21 21:36:22.313093
6013	45	30	19	13	2013-06-21 21:36:22.314596	2013-06-21 21:36:22.314596
6014	45	30	20	13	2013-06-21 21:36:22.316198	2013-06-21 21:36:22.316198
6015	45	30	21	13	2013-06-21 21:36:22.317369	2013-06-21 21:36:22.317369
6016	45	30	22	13	2013-06-21 21:36:22.318137	2013-06-21 21:36:22.318137
6017	45	31	0	16	2013-06-21 21:36:22.319062	2013-06-21 21:36:22.319062
6018	45	31	35	16	2013-06-21 21:36:22.321725	2013-06-21 21:36:22.321725
6019	45	32	0	17	2013-06-21 21:36:22.322532	2013-06-21 21:36:22.322532
6020	45	32	35	17	2013-06-21 21:36:22.323282	2013-06-21 21:36:22.323282
6164	62	36	16	5	2013-06-21 22:35:37.501484	2013-06-21 22:35:37.501484
6165	62	36	17	5	2013-06-21 22:35:37.502518	2013-06-21 22:35:37.502518
6166	62	36	18	5	2013-06-21 22:35:37.503238	2013-06-21 22:35:37.503238
6167	62	29	9	10	2013-06-21 22:35:37.512184	2013-06-21 22:35:37.512184
6168	62	29	23	10	2013-06-21 22:35:37.512918	2013-06-21 22:35:37.512918
6169	62	29	12	12	2013-06-21 22:35:37.521685	2013-06-21 22:35:37.521685
6170	62	29	26	12	2013-06-21 22:35:37.525459	2013-06-21 22:35:37.525459
6171	62	29	0	16	2013-06-21 22:35:37.54553	2013-06-21 22:35:37.54553
6172	62	29	7	16	2013-06-21 22:35:37.547205	2013-06-21 22:35:37.547205
6173	62	29	12	16	2013-06-21 22:35:37.551115	2013-06-21 22:35:37.551115
6174	62	29	21	16	2013-06-21 22:35:37.552615	2013-06-21 22:35:37.552615
6175	62	29	26	16	2013-06-21 22:35:37.556073	2013-06-21 22:35:37.556073
6176	62	29	35	16	2013-06-21 22:35:37.557607	2013-06-21 22:35:37.557607
6177	62	29	4	21	2013-06-21 22:35:37.589767	2013-06-21 22:35:37.589767
6178	62	40	5	21	2013-06-21 22:35:37.5916	2013-06-21 22:35:37.5916
6179	62	29	17	21	2013-06-21 22:35:37.596633	2013-06-21 22:35:37.596633
6180	62	40	18	21	2013-06-21 22:35:37.597371	2013-06-21 22:35:37.597371
6181	62	29	31	21	2013-06-21 22:35:37.600903	2013-06-21 22:35:37.600903
6182	62	40	32	21	2013-06-21 22:35:37.601664	2013-06-21 22:35:37.601664
6300	50	29	29	4	2013-06-22 00:00:07.69518	2013-06-22 00:00:07.69518
6301	50	39	23	5	2013-06-22 00:00:07.705879	2013-06-22 00:00:07.705879
6302	50	38	23	6	2013-06-22 00:00:07.720337	2013-06-22 00:00:07.720337
6303	50	32	23	7	2013-06-22 00:00:07.734284	2013-06-22 00:00:07.734284
6304	50	29	32	7	2013-06-22 00:00:07.739819	2013-06-22 00:00:07.739819
6305	50	31	23	8	2013-06-22 00:00:07.742953	2013-06-22 00:00:07.742953
6306	50	38	0	11	2013-06-22 00:00:07.762571	2013-06-22 00:00:07.762571
6307	50	39	0	12	2013-06-22 00:00:07.767041	2013-06-22 00:00:07.767041
6308	50	31	0	13	2013-06-22 00:00:07.771862	2013-06-22 00:00:07.771862
6309	50	32	0	14	2013-06-22 00:00:07.777214	2013-06-22 00:00:07.777214
6310	50	36	14	14	2013-06-22 00:00:07.778161	2013-06-22 00:00:07.778161
6311	50	37	16	16	2013-06-22 00:00:07.78739	2013-06-22 00:00:07.78739
6312	50	40	18	21	2013-06-22 00:00:07.789438	2013-06-22 00:00:07.789438
6313	50	29	24	21	2013-06-22 00:00:07.790406	2013-06-22 00:00:07.790406
6409	65	13	14	2	2013-06-22 19:03:55.803181	2013-06-22 19:03:55.803181
6410	65	34	15	2	2013-06-22 19:03:55.804501	2013-06-22 19:03:55.804501
6411	65	34	16	2	2013-06-22 19:03:55.805681	2013-06-22 19:03:55.805681
6412	65	29	35	9	2013-06-22 19:03:55.808398	2013-06-22 19:03:55.808398
6413	65	29	28	13	2013-06-22 19:03:55.80943	2013-06-22 19:03:55.80943
6414	65	40	29	13	2013-06-22 19:03:55.810292	2013-06-22 19:03:55.810292
6415	65	29	6	17	2013-06-22 19:03:55.895332	2013-06-22 19:03:55.895332
6416	65	29	23	17	2013-06-22 19:03:55.896874	2013-06-22 19:03:55.896874
6417	65	29	32	18	2013-06-22 19:03:55.91882	2013-06-22 19:03:55.91882
6418	65	29	30	19	2013-06-22 19:03:55.930887	2013-06-22 19:03:55.930887
6419	65	29	13	21	2013-06-22 19:03:55.949655	2013-06-22 19:03:55.949655
6420	65	29	33	21	2013-06-22 19:03:55.955813	2013-06-22 19:03:55.955813
6513	66	29	16	0	2013-06-22 19:17:12.096693	2013-06-22 19:17:12.096693
6514	66	29	29	0	2013-06-22 19:17:12.098949	2013-06-22 19:17:12.098949
6515	66	37	20	3	2013-06-22 19:17:12.106694	2013-06-22 19:17:12.106694
6516	66	37	21	3	2013-06-22 19:17:12.107613	2013-06-22 19:17:12.107613
6517	66	29	13	6	2013-06-22 19:17:12.115438	2013-06-22 19:17:12.115438
6518	66	29	22	6	2013-06-22 19:17:12.116232	2013-06-22 19:17:12.116232
6519	66	29	32	6	2013-06-22 19:17:12.117018	2013-06-22 19:17:12.117018
6520	66	30	3	7	2013-06-22 19:17:12.117847	2013-06-22 19:17:12.117847
6521	66	30	4	7	2013-06-22 19:17:12.119248	2013-06-22 19:17:12.119248
6522	66	29	29	7	2013-06-22 19:17:12.136652	2013-06-22 19:17:12.136652
6523	66	29	15	8	2013-06-22 19:17:12.151019	2013-06-22 19:17:12.151019
6524	66	29	28	8	2013-06-22 19:17:12.164435	2013-06-22 19:17:12.164435
6525	66	29	11	9	2013-06-22 19:17:12.170259	2013-06-22 19:17:12.170259
6526	66	29	23	9	2013-06-22 19:17:12.173298	2013-06-22 19:17:12.173298
6527	66	29	33	9	2013-06-22 19:17:12.174362	2013-06-22 19:17:12.174362
6528	66	29	16	10	2013-06-22 19:17:12.175678	2013-06-22 19:17:12.175678
6529	66	29	6	12	2013-06-22 19:17:12.18745	2013-06-22 19:17:12.18745
6530	66	29	13	12	2013-06-22 19:17:12.188581	2013-06-22 19:17:12.188581
6531	66	36	24	12	2013-06-22 19:17:12.192839	2013-06-22 19:17:12.192839
6532	66	29	9	13	2013-06-22 19:17:12.202588	2013-06-22 19:17:12.202588
6533	66	29	8	14	2013-06-22 19:17:12.249915	2013-06-22 19:17:12.249915
6534	66	36	23	14	2013-06-22 19:17:12.259194	2013-06-22 19:17:12.259194
6535	66	29	4	15	2013-06-22 19:17:12.260159	2013-06-22 19:17:12.260159
6536	66	29	11	15	2013-06-22 19:17:12.26099	2013-06-22 19:17:12.26099
6537	66	29	13	17	2013-06-22 19:17:12.265414	2013-06-22 19:17:12.265414
6538	66	8	5	18	2013-06-22 19:17:12.284704	2013-06-22 19:17:12.284704
6539	66	8	6	18	2013-06-22 19:17:12.285608	2013-06-22 19:17:12.285608
6864	69	29	8	0	2013-06-22 20:31:03.572221	2013-06-22 20:31:03.572221
6865	69	29	21	0	2013-06-22 20:31:03.576006	2013-06-22 20:31:03.576006
6866	69	36	17	5	2013-06-22 20:31:03.579303	2013-06-22 20:31:03.579303
6867	69	36	18	5	2013-06-22 20:31:03.580847	2013-06-22 20:31:03.580847
6868	69	29	35	5	2013-06-22 20:31:03.582093	2013-06-22 20:31:03.582093
6869	69	29	0	7	2013-06-22 20:31:03.583191	2013-06-22 20:31:03.583191
6870	69	29	16	9	2013-06-22 20:31:03.587351	2013-06-22 20:31:03.587351
6871	69	13	23	10	2013-06-22 20:31:03.59562	2013-06-22 20:31:03.59562
6872	69	10	24	10	2013-06-22 20:31:03.597163	2013-06-22 20:31:03.597163
6873	69	10	25	10	2013-06-22 20:31:03.598579	2013-06-22 20:31:03.598579
6874	69	29	17	12	2013-06-22 20:31:03.60666	2013-06-22 20:31:03.60666
6875	69	29	14	14	2013-06-22 20:31:03.611879	2013-06-22 20:31:03.611879
6876	69	29	0	15	2013-06-22 20:31:03.614506	2013-06-22 20:31:03.614506
6877	69	29	35	15	2013-06-22 20:31:03.617897	2013-06-22 20:31:03.617897
6878	69	29	17	18	2013-06-22 20:31:03.628622	2013-06-22 20:31:03.628622
6879	69	40	5	21	2013-06-22 20:31:03.635986	2013-06-22 20:31:03.635986
6880	69	29	10	21	2013-06-22 20:31:03.637377	2013-06-22 20:31:03.637377
6881	69	29	24	21	2013-06-22 20:31:03.640291	2013-06-22 20:31:03.640291
6960	67	29	0	5	2013-06-22 20:33:53.581354	2013-06-22 20:33:53.581354
6961	67	37	16	8	2013-06-22 20:33:53.618062	2013-06-22 20:33:53.618062
6962	67	37	17	8	2013-06-22 20:33:53.618916	2013-06-22 20:33:53.618916
6963	67	37	18	8	2013-06-22 20:33:53.619898	2013-06-22 20:33:53.619898
6964	67	37	19	8	2013-06-22 20:33:53.620954	2013-06-22 20:33:53.620954
6965	67	37	20	8	2013-06-22 20:33:53.62217	2013-06-22 20:33:53.62217
6966	67	37	21	8	2013-06-22 20:33:53.623791	2013-06-22 20:33:53.623791
6967	67	37	16	9	2013-06-22 20:33:53.631734	2013-06-22 20:33:53.631734
6968	67	37	17	9	2013-06-22 20:33:53.632819	2013-06-22 20:33:53.632819
6969	67	37	18	9	2013-06-22 20:33:53.633639	2013-06-22 20:33:53.633639
6970	67	37	19	9	2013-06-22 20:33:53.634541	2013-06-22 20:33:53.634541
6971	67	37	20	9	2013-06-22 20:33:53.635359	2013-06-22 20:33:53.635359
6972	67	37	21	9	2013-06-22 20:33:53.636155	2013-06-22 20:33:53.636155
6973	67	29	8	14	2013-06-22 20:33:53.664335	2013-06-22 20:33:53.664335
6974	67	29	28	14	2013-06-22 20:33:53.675033	2013-06-22 20:33:53.675033
6975	67	29	15	15	2013-06-22 20:33:53.683372	2013-06-22 20:33:53.683372
6976	67	29	21	15	2013-06-22 20:33:53.68426	2013-06-22 20:33:53.68426
6977	67	29	17	16	2013-06-22 20:33:53.702278	2013-06-22 20:33:53.702278
6978	67	29	19	16	2013-06-22 20:33:53.70323	2013-06-22 20:33:53.70323
6979	67	29	35	16	2013-06-22 20:33:53.748012	2013-06-22 20:33:53.748012
6980	67	29	14	17	2013-06-22 20:33:53.749176	2013-06-22 20:33:53.749176
6981	67	29	23	17	2013-06-22 20:33:53.750078	2013-06-22 20:33:53.750078
6982	67	29	0	18	2013-06-22 20:33:53.750961	2013-06-22 20:33:53.750961
6983	67	29	9	21	2013-06-22 20:33:53.755304	2013-06-22 20:33:53.755304
6984	67	40	17	21	2013-06-22 20:33:53.756311	2013-06-22 20:33:53.756311
6985	67	29	28	21	2013-06-22 20:33:53.758873	2013-06-22 20:33:53.758873
7008	68	36	17	3	2013-06-22 21:26:40.091626	2013-06-22 21:26:40.091626
7009	68	36	18	3	2013-06-22 21:26:40.092532	2013-06-22 21:26:40.092532
7010	68	36	19	3	2013-06-22 21:26:40.093591	2013-06-22 21:26:40.093591
7011	68	29	10	6	2013-06-22 21:26:40.105402	2013-06-22 21:26:40.105402
7012	68	29	27	6	2013-06-22 21:26:40.106321	2013-06-22 21:26:40.106321
7013	68	13	8	10	2013-06-22 21:26:40.245573	2013-06-22 21:26:40.245573
7014	68	34	10	10	2013-06-22 21:26:40.246751	2013-06-22 21:26:40.246751
7015	68	34	11	10	2013-06-22 21:26:40.24802	2013-06-22 21:26:40.24802
7016	68	34	12	10	2013-06-22 21:26:40.249015	2013-06-22 21:26:40.249015
7017	68	29	25	10	2013-06-22 21:26:40.251669	2013-06-22 21:26:40.251669
7018	68	29	0	15	2013-06-22 21:26:40.256259	2013-06-22 21:26:40.256259
7019	68	37	28	15	2013-06-22 21:26:40.258319	2013-06-22 21:26:40.258319
7020	68	29	35	15	2013-06-22 21:26:40.260068	2013-06-22 21:26:40.260068
7021	68	40	7	21	2013-06-22 21:26:40.264986	2013-06-22 21:26:40.264986
7022	68	29	8	21	2013-06-22 21:26:40.265883	2013-06-22 21:26:40.265883
7023	68	29	25	21	2013-06-22 21:26:40.26936	2013-06-22 21:26:40.26936
7030	70	25	11	10	2013-06-22 21:56:56.572697	2013-06-22 21:56:56.572697
7052	64	29	4	0	2013-06-22 22:48:11.55025	2013-06-22 22:48:11.55025
7053	64	29	14	0	2013-06-22 22:48:11.553544	2013-06-22 22:48:11.553544
7054	64	29	18	7	2013-06-22 22:48:11.754609	2013-06-22 22:48:11.754609
7055	64	29	0	11	2013-06-22 22:48:11.848443	2013-06-22 22:48:11.848443
7056	64	29	26	13	2013-06-22 22:48:11.891767	2013-06-22 22:48:11.891767
7057	64	36	10	14	2013-06-22 22:48:11.894003	2013-06-22 22:48:11.894003
7058	64	29	35	18	2013-06-22 22:48:11.900019	2013-06-22 22:48:11.900019
7059	64	40	18	21	2013-06-22 22:48:11.901651	2013-06-22 22:48:11.901651
7060	64	29	20	21	2013-06-22 22:48:11.902949	2013-06-22 22:48:11.902949
7335	23	8	7	4	2013-06-23 19:44:44.603181	2013-06-23 19:44:44.603181
7336	23	8	17	4	2013-06-23 19:44:44.605053	2013-06-23 19:44:44.605053
7337	23	8	27	4	2013-06-23 19:44:44.606992	2013-06-23 19:44:44.606992
7338	23	11	1	8	2013-06-23 19:44:44.607955	2013-06-23 19:44:44.607955
7339	23	17	2	8	2013-06-23 19:44:44.608792	2013-06-23 19:44:44.608792
7340	23	11	3	8	2013-06-23 19:44:44.60957	2013-06-23 19:44:44.60957
7341	23	17	4	8	2013-06-23 19:44:44.610327	2013-06-23 19:44:44.610327
7342	23	11	5	8	2013-06-23 19:44:44.611076	2013-06-23 19:44:44.611076
7343	23	17	6	8	2013-06-23 19:44:44.611781	2013-06-23 19:44:44.611781
7344	23	11	7	8	2013-06-23 19:44:44.612557	2013-06-23 19:44:44.612557
7345	23	17	8	8	2013-06-23 19:44:44.61336	2013-06-23 19:44:44.61336
7346	23	11	9	8	2013-06-23 19:44:44.614092	2013-06-23 19:44:44.614092
7347	23	17	10	8	2013-06-23 19:44:44.614829	2013-06-23 19:44:44.614829
7348	23	11	11	8	2013-06-23 19:44:44.615597	2013-06-23 19:44:44.615597
7349	23	17	12	8	2013-06-23 19:44:44.616329	2013-06-23 19:44:44.616329
7350	23	11	13	8	2013-06-23 19:44:44.617308	2013-06-23 19:44:44.617308
7351	23	17	14	8	2013-06-23 19:44:44.618655	2013-06-23 19:44:44.618655
7352	23	11	15	8	2013-06-23 19:44:44.61966	2013-06-23 19:44:44.61966
7353	23	17	16	8	2013-06-23 19:44:44.620628	2013-06-23 19:44:44.620628
7354	23	11	17	8	2013-06-23 19:44:44.621474	2013-06-23 19:44:44.621474
7355	23	17	18	8	2013-06-23 19:44:44.622237	2013-06-23 19:44:44.622237
7356	23	11	19	8	2013-06-23 19:44:44.623017	2013-06-23 19:44:44.623017
7357	23	17	20	8	2013-06-23 19:44:44.623761	2013-06-23 19:44:44.623761
7358	23	11	21	8	2013-06-23 19:44:44.624482	2013-06-23 19:44:44.624482
7359	23	17	22	8	2013-06-23 19:44:44.625249	2013-06-23 19:44:44.625249
7360	23	11	23	8	2013-06-23 19:44:44.626034	2013-06-23 19:44:44.626034
7361	23	17	24	8	2013-06-23 19:44:44.626778	2013-06-23 19:44:44.626778
7362	23	17	16	10	2013-06-23 19:44:44.662741	2013-06-23 19:44:44.662741
7363	23	11	17	10	2013-06-23 19:44:44.66356	2013-06-23 19:44:44.66356
7364	23	17	18	10	2013-06-23 19:44:44.664742	2013-06-23 19:44:44.664742
7365	23	11	19	10	2013-06-23 19:44:44.665606	2013-06-23 19:44:44.665606
7366	23	17	20	10	2013-06-23 19:44:44.666366	2013-06-23 19:44:44.666366
7367	23	11	21	10	2013-06-23 19:44:44.667121	2013-06-23 19:44:44.667121
7368	23	17	22	10	2013-06-23 19:44:44.667866	2013-06-23 19:44:44.667866
7369	23	11	23	10	2013-06-23 19:44:44.668598	2013-06-23 19:44:44.668598
7370	23	17	24	10	2013-06-23 19:44:44.669601	2013-06-23 19:44:44.669601
7566	73	29	15	1	2013-06-24 04:00:28.58257	2013-06-24 04:00:28.58257
7567	73	29	19	2	2013-06-24 04:00:28.591216	2013-06-24 04:00:28.591216
7568	73	37	6	3	2013-06-24 04:00:28.593635	2013-06-24 04:00:28.593635
7569	73	37	7	3	2013-06-24 04:00:28.594702	2013-06-24 04:00:28.594702
7570	73	37	8	3	2013-06-24 04:00:28.595724	2013-06-24 04:00:28.595724
7571	73	29	16	3	2013-06-24 04:00:28.596653	2013-06-24 04:00:28.596653
7572	73	37	29	3	2013-06-24 04:00:28.599961	2013-06-24 04:00:28.599961
7573	73	37	30	3	2013-06-24 04:00:28.600726	2013-06-24 04:00:28.600726
7574	73	37	31	3	2013-06-24 04:00:28.601462	2013-06-24 04:00:28.601462
7575	73	29	21	4	2013-06-24 04:00:28.609326	2013-06-24 04:00:28.609326
7576	73	29	22	5	2013-06-24 04:00:28.619353	2013-06-24 04:00:28.619353
7577	73	29	12	6	2013-06-24 04:00:28.624777	2013-06-24 04:00:28.624777
7578	73	29	18	6	2013-06-24 04:00:28.627409	2013-06-24 04:00:28.627409
7579	73	29	25	6	2013-06-24 04:00:28.629771	2013-06-24 04:00:28.629771
7580	73	29	19	7	2013-06-24 04:00:28.63547	2013-06-24 04:00:28.63547
7581	73	29	15	8	2013-06-24 04:00:28.642053	2013-06-24 04:00:28.642053
7582	73	29	16	8	2013-06-24 04:00:28.64283	2013-06-24 04:00:28.64283
7583	73	29	7	9	2013-06-24 04:00:28.652477	2013-06-24 04:00:28.652477
7584	73	29	20	10	2013-06-24 04:00:28.674026	2013-06-24 04:00:28.674026
7585	73	29	8	12	2013-06-24 04:00:28.703531	2013-06-24 04:00:28.703531
7586	73	29	18	13	2013-06-24 04:00:28.710711	2013-06-24 04:00:28.710711
7587	73	29	25	14	2013-06-24 04:00:28.728062	2013-06-24 04:00:28.728062
7588	73	29	26	15	2013-06-24 04:00:28.743508	2013-06-24 04:00:28.743508
7589	73	29	29	15	2013-06-24 04:00:28.74588	2013-06-24 04:00:28.74588
7590	73	29	18	16	2013-06-24 04:00:28.74993	2013-06-24 04:00:28.74993
7591	73	29	10	17	2013-06-24 04:00:28.752138	2013-06-24 04:00:28.752138
7592	73	29	18	17	2013-06-24 04:00:28.754353	2013-06-24 04:00:28.754353
7593	73	29	14	18	2013-06-24 04:00:28.757972	2013-06-24 04:00:28.757972
7594	73	37	2	19	2013-06-24 04:00:28.7701	2013-06-24 04:00:28.7701
7595	73	37	3	19	2013-06-24 04:00:28.770909	2013-06-24 04:00:28.770909
7596	73	37	4	19	2013-06-24 04:00:28.771661	2013-06-24 04:00:28.771661
7597	73	29	13	19	2013-06-24 04:00:28.773876	2013-06-24 04:00:28.773876
7598	73	37	31	19	2013-06-24 04:00:28.785828	2013-06-24 04:00:28.785828
7599	73	37	32	19	2013-06-24 04:00:28.78661	2013-06-24 04:00:28.78661
7600	73	37	33	19	2013-06-24 04:00:28.787387	2013-06-24 04:00:28.787387
7601	73	29	20	20	2013-06-24 04:00:28.790274	2013-06-24 04:00:28.790274
7614	71	40	6	21	2013-06-24 16:48:57.490072	2013-06-24 16:48:57.490072
7615	71	40	18	21	2013-06-24 16:48:57.490869	2013-06-24 16:48:57.490869
7616	71	40	29	21	2013-06-24 16:48:57.491672	2013-06-24 16:48:57.491672
7727	74	40	18	0	2013-06-27 20:19:16.193501	2013-06-27 20:19:16.193501
7728	74	8	13	9	2013-06-27 20:19:16.195284	2013-06-27 20:19:16.195284
7729	74	8	14	9	2013-06-27 20:19:16.1961	2013-06-27 20:19:16.1961
7730	74	8	15	9	2013-06-27 20:19:16.196817	2013-06-27 20:19:16.196817
7731	74	40	35	9	2013-06-27 20:19:16.200249	2013-06-27 20:19:16.200249
7732	74	40	15	21	2013-06-27 20:19:16.2035	2013-06-27 20:19:16.2035
7820	72	36	15	1	2013-06-28 01:06:40.486728	2013-06-28 01:06:40.486728
7821	72	36	16	1	2013-06-28 01:06:40.487838	2013-06-28 01:06:40.487838
7822	72	37	14	5	2013-06-28 01:06:40.520261	2013-06-28 01:06:40.520261
7823	72	37	15	5	2013-06-28 01:06:40.521142	2013-06-28 01:06:40.521142
7824	72	37	16	5	2013-06-28 01:06:40.521954	2013-06-28 01:06:40.521954
7825	72	29	12	6	2013-06-28 01:06:40.523808	2013-06-28 01:06:40.523808
7826	72	29	31	8	2013-06-28 01:06:40.59936	2013-06-28 01:06:40.59936
7827	72	36	33	8	2013-06-28 01:06:40.601563	2013-06-28 01:06:40.601563
7828	72	29	35	8	2013-06-28 01:06:40.602401	2013-06-28 01:06:40.602401
7829	72	29	14	9	2013-06-28 01:06:40.603963	2013-06-28 01:06:40.603963
7830	72	37	15	9	2013-06-28 01:06:40.604987	2013-06-28 01:06:40.604987
7831	72	37	16	9	2013-06-28 01:06:40.60611	2013-06-28 01:06:40.60611
7832	72	29	27	11	2013-06-28 01:06:40.629008	2013-06-28 01:06:40.629008
7833	72	29	16	12	2013-06-28 01:06:40.636443	2013-06-28 01:06:40.636443
7834	72	29	0	13	2013-06-28 01:06:40.638801	2013-06-28 01:06:40.638801
7835	72	29	4	13	2013-06-28 01:06:40.640311	2013-06-28 01:06:40.640311
7836	72	40	15	13	2013-06-28 01:06:40.642115	2013-06-28 01:06:40.642115
7837	72	29	17	15	2013-06-28 01:06:40.664955	2013-06-28 01:06:40.664955
7838	72	37	15	16	2013-06-28 01:06:40.668491	2013-06-28 01:06:40.668491
7839	72	36	15	20	2013-06-28 01:06:40.695304	2013-06-28 01:06:40.695304
7840	72	36	16	20	2013-06-28 01:06:40.696307	2013-06-28 01:06:40.696307
7841	72	29	19	21	2013-06-28 01:06:40.697178	2013-06-28 01:06:40.697178
7875	75	9	16	14	2013-06-28 15:38:50.068265	2013-06-28 15:38:50.068265
7876	75	9	17	14	2013-06-28 15:38:50.069259	2013-06-28 15:38:50.069259
7877	75	9	18	14	2013-06-28 15:38:50.070054	2013-06-28 15:38:50.070054
7878	75	9	19	14	2013-06-28 15:38:50.07096	2013-06-28 15:38:50.07096
7967	78	13	13	0	2013-06-28 16:15:00.757751	2013-06-28 16:15:00.757751
7968	78	10	14	0	2013-06-28 16:15:00.758962	2013-06-28 16:15:00.758962
7969	78	10	15	0	2013-06-28 16:15:00.759922	2013-06-28 16:15:00.759922
7970	78	23	20	12	2013-06-28 16:15:00.868413	2013-06-28 16:15:00.868413
7971	78	23	35	12	2013-06-28 16:15:00.86944	2013-06-28 16:15:00.86944
7972	78	23	25	13	2013-06-28 16:15:00.875123	2013-06-28 16:15:00.875123
7973	78	9	3	14	2013-06-28 16:15:00.886551	2013-06-28 16:15:00.886551
7974	78	9	13	14	2013-06-28 16:15:00.887395	2013-06-28 16:15:00.887395
7975	78	23	27	15	2013-06-28 16:15:00.906854	2013-06-28 16:15:00.906854
7976	78	23	17	16	2013-06-28 16:15:00.910114	2013-06-28 16:15:00.910114
7977	78	40	26	21	2013-06-28 16:15:00.936445	2013-06-28 16:15:00.936445
7983	77	9	15	6	2013-06-28 17:08:44.081912	2013-06-28 17:08:44.081912
7984	77	9	16	6	2013-06-28 17:08:44.083465	2013-06-28 17:08:44.083465
7985	77	9	17	6	2013-06-28 17:08:44.084214	2013-06-28 17:08:44.084214
7986	77	23	14	13	2013-06-28 17:08:44.088101	2013-06-28 17:08:44.088101
8229	80	9	15	3	2013-06-28 20:06:44.394839	2013-06-28 20:06:44.394839
8230	80	9	16	3	2013-06-28 20:06:44.395865	2013-06-28 20:06:44.395865
8231	80	9	17	3	2013-06-28 20:06:44.396659	2013-06-28 20:06:44.396659
8232	80	29	7	6	2013-06-28 20:06:44.400287	2013-06-28 20:06:44.400287
8233	80	23	18	6	2013-06-28 20:06:44.401062	2013-06-28 20:06:44.401062
8234	80	23	28	6	2013-06-28 20:06:44.401834	2013-06-28 20:06:44.401834
8235	80	29	6	9	2013-06-28 20:06:44.411307	2013-06-28 20:06:44.411307
8236	80	29	9	9	2013-06-28 20:06:44.413521	2013-06-28 20:06:44.413521
8237	80	29	5	12	2013-06-28 20:06:44.428626	2013-06-28 20:06:44.428626
8238	80	29	10	12	2013-06-28 20:06:44.432386	2013-06-28 20:06:44.432386
8239	80	29	16	14	2013-06-28 20:06:44.447095	2013-06-28 20:06:44.447095
8240	80	29	4	15	2013-06-28 20:06:44.45075	2013-06-28 20:06:44.45075
8241	80	29	11	15	2013-06-28 20:06:44.456968	2013-06-28 20:06:44.456968
8242	80	29	19	17	2013-06-28 20:06:44.476659	2013-06-28 20:06:44.476659
8243	80	29	26	17	2013-06-28 20:06:44.477416	2013-06-28 20:06:44.477416
8244	80	29	29	17	2013-06-28 20:06:44.479701	2013-06-28 20:06:44.479701
8245	80	29	35	17	2013-06-28 20:06:44.480717	2013-06-28 20:06:44.480717
8246	80	29	3	18	2013-06-28 20:06:44.481462	2013-06-28 20:06:44.481462
8247	80	29	12	18	2013-06-28 20:06:44.488259	2013-06-28 20:06:44.488259
8248	80	40	22	21	2013-06-28 20:06:44.52235	2013-06-28 20:06:44.52235
8249	80	40	32	21	2013-06-28 20:06:44.525118	2013-06-28 20:06:44.525118
8906	22	23	23	0	2013-06-28 23:05:13.964282	2013-06-28 23:05:13.964282
8907	22	23	35	4	2013-06-28 23:05:13.99067	2013-06-28 23:05:13.99067
8908	22	23	0	11	2013-06-28 23:05:14.012425	2013-06-28 23:05:14.012425
8909	22	36	7	11	2013-06-28 23:05:14.015171	2013-06-28 23:05:14.015171
8910	22	36	15	11	2013-06-28 23:05:14.017651	2013-06-28 23:05:14.017651
8911	22	36	26	11	2013-06-28 23:05:14.019976	2013-06-28 23:05:14.019976
8912	22	23	18	21	2013-06-28 23:05:14.031233	2013-06-28 23:05:14.031233
8935	79	29	5	0	2013-06-28 23:25:39.929309	2013-06-28 23:25:39.929309
8936	79	23	21	0	2013-06-28 23:25:39.940562	2013-06-28 23:25:39.940562
8937	79	29	12	1	2013-06-28 23:25:39.946518	2013-06-28 23:25:39.946518
8938	79	29	16	1	2013-06-28 23:25:39.955545	2013-06-28 23:25:39.955545
8939	79	29	35	3	2013-06-28 23:25:39.975583	2013-06-28 23:25:39.975583
8940	79	9	5	4	2013-06-28 23:25:39.977731	2013-06-28 23:25:39.977731
8941	79	29	14	4	2013-06-28 23:25:39.984743	2013-06-28 23:25:39.984743
8942	79	9	22	4	2013-06-28 23:25:39.987271	2013-06-28 23:25:39.987271
8943	79	9	23	4	2013-06-28 23:25:39.989395	2013-06-28 23:25:39.989395
8944	79	9	24	4	2013-06-28 23:25:39.9915	2013-06-28 23:25:39.9915
8945	79	29	14	5	2013-06-28 23:25:39.997603	2013-06-28 23:25:39.997603
8946	79	23	0	6	2013-06-28 23:25:40.001054	2013-06-28 23:25:40.001054
8947	79	29	5	7	2013-06-28 23:25:40.012622	2013-06-28 23:25:40.012622
8948	79	29	12	7	2013-06-28 23:25:40.015191	2013-06-28 23:25:40.015191
8949	79	29	16	7	2013-06-28 23:25:40.118794	2013-06-28 23:25:40.118794
8950	79	29	21	7	2013-06-28 23:25:40.121047	2013-06-28 23:25:40.121047
8951	79	13	12	10	2013-06-28 23:25:40.278452	2013-06-28 23:25:40.278452
8952	79	10	13	10	2013-06-28 23:25:40.280954	2013-06-28 23:25:40.280954
8953	79	10	14	10	2013-06-28 23:25:40.283296	2013-06-28 23:25:40.283296
8954	79	23	0	15	2013-06-28 23:25:40.297854	2013-06-28 23:25:40.297854
8955	79	40	18	21	2013-06-28 23:25:40.316983	2013-06-28 23:25:40.316983
8956	79	29	19	21	2013-06-28 23:25:40.319484	2013-06-28 23:25:40.319484
8965	84	9	13	11	2013-06-29 00:13:43.035355	2013-06-29 00:13:43.035355
8966	84	9	14	11	2013-06-29 00:13:43.037598	2013-06-29 00:13:43.037598
8967	84	9	15	11	2013-06-29 00:13:43.0406	2013-06-29 00:13:43.0406
8968	84	9	16	11	2013-06-29 00:13:43.042974	2013-06-29 00:13:43.042974
8969	84	9	17	11	2013-06-29 00:13:43.045341	2013-06-29 00:13:43.045341
8970	84	9	18	11	2013-06-29 00:13:43.047662	2013-06-29 00:13:43.047662
8971	84	9	19	11	2013-06-29 00:13:43.049918	2013-06-29 00:13:43.049918
8972	84	9	20	11	2013-06-29 00:13:43.052168	2013-06-29 00:13:43.052168
8973	84	9	21	11	2013-06-29 00:13:43.054717	2013-06-29 00:13:43.054717
8974	84	9	22	11	2013-06-29 00:13:43.05716	2013-06-29 00:13:43.05716
8975	84	9	15	12	2013-06-29 00:13:43.059813	2013-06-29 00:13:43.059813
8976	84	9	16	12	2013-06-29 00:13:43.062125	2013-06-29 00:13:43.062125
8977	84	9	17	12	2013-06-29 00:13:43.064484	2013-06-29 00:13:43.064484
8978	84	9	18	12	2013-06-29 00:13:43.066918	2013-06-29 00:13:43.066918
8979	84	29	35	15	2013-06-29 00:13:43.080422	2013-06-29 00:13:43.080422
8980	84	40	11	21	2013-06-29 00:13:43.088097	2013-06-29 00:13:43.088097
8981	84	40	17	21	2013-06-29 00:13:43.092029	2013-06-29 00:13:43.092029
8982	84	40	22	21	2013-06-29 00:13:43.094509	2013-06-29 00:13:43.094509
8983	84	29	25	21	2013-06-29 00:13:43.096726	2013-06-29 00:13:43.096726
9021	81	23	16	0	2013-06-29 00:32:05.849293	2013-06-29 00:32:05.849293
9022	81	9	28	1	2013-06-29 00:32:05.867592	2013-06-29 00:32:05.867592
9023	81	9	4	3	2013-06-29 00:32:05.884567	2013-06-29 00:32:05.884567
9024	81	29	5	5	2013-06-29 00:32:05.981501	2013-06-29 00:32:05.981501
9025	81	29	2	8	2013-06-29 00:32:06.050913	2013-06-29 00:32:06.050913
9026	81	29	10	8	2013-06-29 00:32:06.058074	2013-06-29 00:32:06.058074
9027	81	29	7	9	2013-06-29 00:32:06.085416	2013-06-29 00:32:06.085416
9028	81	9	18	10	2013-06-29 00:32:06.129002	2013-06-29 00:32:06.129002
9029	81	9	19	10	2013-06-29 00:32:06.131247	2013-06-29 00:32:06.131247
9030	81	9	20	10	2013-06-29 00:32:06.133599	2013-06-29 00:32:06.133599
9031	81	29	9	11	2013-06-29 00:32:06.149176	2013-06-29 00:32:06.149176
9032	81	29	35	12	2013-06-29 00:32:06.182938	2013-06-29 00:32:06.182938
9033	81	29	24	14	2013-06-29 00:32:06.232467	2013-06-29 00:32:06.232467
9034	81	29	28	14	2013-06-29 00:32:06.243159	2013-06-29 00:32:06.243159
9035	81	29	33	14	2013-06-29 00:32:06.247281	2013-06-29 00:32:06.247281
9036	81	9	2	15	2013-06-29 00:32:06.254698	2013-06-29 00:32:06.254698
9037	81	29	30	15	2013-06-29 00:32:06.275934	2013-06-29 00:32:06.275934
9038	81	23	6	16	2013-06-29 00:32:06.28738	2013-06-29 00:32:06.28738
9039	81	29	22	16	2013-06-29 00:32:06.295273	2013-06-29 00:32:06.295273
9040	81	29	31	16	2013-06-29 00:32:06.308642	2013-06-29 00:32:06.308642
9041	81	29	19	17	2013-06-29 00:32:06.455158	2013-06-29 00:32:06.455158
9042	81	29	28	17	2013-06-29 00:32:06.470187	2013-06-29 00:32:06.470187
9043	81	29	34	17	2013-06-29 00:32:06.472743	2013-06-29 00:32:06.472743
9044	81	29	20	18	2013-06-29 00:32:06.51519	2013-06-29 00:32:06.51519
9045	81	29	6	19	2013-06-29 00:32:06.530328	2013-06-29 00:32:06.530328
9046	81	29	22	19	2013-06-29 00:32:06.532892	2013-06-29 00:32:06.532892
9047	81	29	27	19	2013-06-29 00:32:06.539953	2013-06-29 00:32:06.539953
9048	81	9	29	19	2013-06-29 00:32:06.542171	2013-06-29 00:32:06.542171
9049	81	29	35	19	2013-06-29 00:32:06.544444	2013-06-29 00:32:06.544444
9050	81	29	0	20	2013-06-29 00:32:06.546595	2013-06-29 00:32:06.546595
9051	81	9	9	20	2013-06-29 00:32:06.548695	2013-06-29 00:32:06.548695
9052	81	29	24	20	2013-06-29 00:32:06.550819	2013-06-29 00:32:06.550819
9053	81	40	6	21	2013-06-29 00:32:06.557432	2013-06-29 00:32:06.557432
9054	81	29	7	21	2013-06-29 00:32:06.559757	2013-06-29 00:32:06.559757
9055	81	40	30	21	2013-06-29 00:32:06.566257	2013-06-29 00:32:06.566257
9056	81	29	31	21	2013-06-29 00:32:06.568296	2013-06-29 00:32:06.568296
9244	30	8	7	3	2013-06-29 20:02:42.382002	2013-06-29 20:02:42.382002
9245	30	8	27	3	2013-06-29 20:02:42.38409	2013-06-29 20:02:42.38409
9246	30	23	21	6	2013-06-29 20:02:42.38503	2013-06-29 20:02:42.38503
9247	30	23	15	8	2013-06-29 20:02:42.423607	2013-06-29 20:02:42.423607
9248	30	23	17	8	2013-06-29 20:02:42.424576	2013-06-29 20:02:42.424576
9249	30	23	3	11	2013-06-29 20:02:42.495209	2013-06-29 20:02:42.495209
9250	30	32	3	15	2013-06-29 20:02:42.49789	2013-06-29 20:02:42.49789
9251	30	31	4	15	2013-06-29 20:02:42.499276	2013-06-29 20:02:42.499276
9252	30	8	13	15	2013-06-29 20:02:42.500496	2013-06-29 20:02:42.500496
9253	30	32	29	15	2013-06-29 20:02:42.501533	2013-06-29 20:02:42.501533
9254	30	31	30	15	2013-06-29 20:02:42.502369	2013-06-29 20:02:42.502369
9255	30	23	25	17	2013-06-29 20:02:42.52356	2013-06-29 20:02:42.52356
9256	30	23	15	20	2013-06-29 20:02:42.603101	2013-06-29 20:02:42.603101
9257	30	40	21	21	2013-06-29 20:02:42.622368	2013-06-29 20:02:42.622368
9258	34	29	16	1	2013-06-29 20:03:00.615275	2013-06-29 20:03:00.615275
9259	34	30	26	2	2013-06-29 20:03:00.620714	2013-06-29 20:03:00.620714
9260	34	29	14	4	2013-06-29 20:03:00.625091	2013-06-29 20:03:00.625091
9261	34	29	18	4	2013-06-29 20:03:00.628419	2013-06-29 20:03:00.628419
9262	34	29	7	8	2013-06-29 20:03:00.654188	2013-06-29 20:03:00.654188
9263	34	11	20	9	2013-06-29 20:03:00.673324	2013-06-29 20:03:00.673324
9264	34	29	23	9	2013-06-29 20:03:00.674085	2013-06-29 20:03:00.674085
9265	34	29	5	11	2013-06-29 20:03:00.676563	2013-06-29 20:03:00.676563
9266	34	29	8	11	2013-06-29 20:03:00.679772	2013-06-29 20:03:00.679772
9267	34	11	10	12	2013-06-29 20:03:00.682268	2013-06-29 20:03:00.682268
9268	34	37	27	13	2013-06-29 20:03:00.691496	2013-06-29 20:03:00.691496
9269	34	9	28	13	2013-06-29 20:03:00.692245	2013-06-29 20:03:00.692245
9270	34	9	29	13	2013-06-29 20:03:00.692958	2013-06-29 20:03:00.692958
9271	34	17	35	14	2013-06-29 20:03:00.702409	2013-06-29 20:03:00.702409
9272	34	30	4	17	2013-06-29 20:03:00.718441	2013-06-29 20:03:00.718441
9273	34	9	5	17	2013-06-29 20:03:00.719226	2013-06-29 20:03:00.719226
9274	34	17	26	21	2013-06-29 20:03:00.751667	2013-06-29 20:03:00.751667
9275	34	40	27	21	2013-06-29 20:03:00.752412	2013-06-29 20:03:00.752412
9433	89	13	25	3	2013-06-29 20:25:33.179499	2013-06-29 20:25:33.179499
9434	89	10	27	3	2013-06-29 20:25:33.180292	2013-06-29 20:25:33.180292
9435	89	10	28	3	2013-06-29 20:25:33.181016	2013-06-29 20:25:33.181016
9436	89	29	6	4	2013-06-29 20:25:33.181789	2013-06-29 20:25:33.181789
9437	89	13	13	6	2013-06-29 20:25:33.199456	2013-06-29 20:25:33.199456
9438	89	10	14	6	2013-06-29 20:25:33.200221	2013-06-29 20:25:33.200221
9439	89	10	15	6	2013-06-29 20:25:33.2011	2013-06-29 20:25:33.2011
9440	89	29	5	8	2013-06-29 20:25:33.208867	2013-06-29 20:25:33.208867
9441	89	40	24	8	2013-06-29 20:25:33.214129	2013-06-29 20:25:33.214129
9442	89	29	16	10	2013-06-29 20:25:33.231039	2013-06-29 20:25:33.231039
9443	89	29	2	11	2013-06-29 20:25:33.236261	2013-06-29 20:25:33.236261
9444	89	29	26	11	2013-06-29 20:25:33.240261	2013-06-29 20:25:33.240261
9445	89	29	35	11	2013-06-29 20:25:33.243398	2013-06-29 20:25:33.243398
9446	89	29	12	12	2013-06-29 20:25:33.245867	2013-06-29 20:25:33.245867
9447	89	13	7	13	2013-06-29 20:25:33.252663	2013-06-29 20:25:33.252663
9448	89	10	8	13	2013-06-29 20:25:33.283636	2013-06-29 20:25:33.283636
9449	89	29	24	13	2013-06-29 20:25:33.292853	2013-06-29 20:25:33.292853
9450	89	40	25	13	2013-06-29 20:25:33.293687	2013-06-29 20:25:33.293687
9451	89	29	9	15	2013-06-29 20:25:33.306874	2013-06-29 20:25:33.306874
9452	89	13	13	15	2013-06-29 20:25:33.308558	2013-06-29 20:25:33.308558
9453	89	10	14	15	2013-06-29 20:25:33.309296	2013-06-29 20:25:33.309296
9454	89	29	17	17	2013-06-29 20:25:33.322357	2013-06-29 20:25:33.322357
9455	89	29	21	17	2013-06-29 20:25:33.324533	2013-06-29 20:25:33.324533
9456	89	13	25	17	2013-06-29 20:25:33.326997	2013-06-29 20:25:33.326997
9457	89	10	26	17	2013-06-29 20:25:33.327989	2013-06-29 20:25:33.327989
9458	89	29	27	17	2013-06-29 20:25:33.32904	2013-06-29 20:25:33.32904
9459	89	23	16	21	2013-06-29 20:25:33.341703	2013-06-29 20:25:33.341703
9463	90	25	15	1	2013-06-29 22:02:26.313083	2013-06-29 22:02:26.313083
9464	85	13	20	0	2013-06-29 22:16:43.535877	2013-06-29 22:16:43.535877
9465	85	10	21	0	2013-06-29 22:16:43.536836	2013-06-29 22:16:43.536836
9466	85	13	31	0	2013-06-29 22:16:43.539953	2013-06-29 22:16:43.539953
9467	85	34	32	0	2013-06-29 22:16:43.540816	2013-06-29 22:16:43.540816
9468	85	29	22	8	2013-06-29 22:16:43.555099	2013-06-29 22:16:43.555099
9469	85	9	4	9	2013-06-29 22:16:43.556003	2013-06-29 22:16:43.556003
9470	85	29	14	9	2013-06-29 22:16:43.5569	2013-06-29 22:16:43.5569
9471	85	29	17	11	2013-06-29 22:16:43.593462	2013-06-29 22:16:43.593462
9472	85	29	27	11	2013-06-29 22:16:43.595292	2013-06-29 22:16:43.595292
9473	85	37	3	12	2013-06-29 22:16:43.59604	2013-06-29 22:16:43.59604
9474	85	40	13	14	2013-06-29 22:16:43.596921	2013-06-29 22:16:43.596921
9475	85	29	14	14	2013-06-29 22:16:43.597683	2013-06-29 22:16:43.597683
9476	85	36	28	15	2013-06-29 22:16:43.60399	2013-06-29 22:16:43.60399
9477	85	23	10	17	2013-06-29 22:16:43.610679	2013-06-29 22:16:43.610679
9478	85	23	18	17	2013-06-29 22:16:43.616447	2013-06-29 22:16:43.616447
9495	63	29	8	0	2013-06-29 23:10:45.3864	2013-06-29 23:10:45.3864
9496	63	40	19	0	2013-06-29 23:10:45.390123	2013-06-29 23:10:45.390123
9497	63	29	26	0	2013-06-29 23:10:45.391031	2013-06-29 23:10:45.391031
9498	63	37	27	6	2013-06-29 23:10:45.396059	2013-06-29 23:10:45.396059
9499	63	37	19	9	2013-06-29 23:10:45.397215	2013-06-29 23:10:45.397215
9500	63	30	11	10	2013-06-29 23:10:45.398059	2013-06-29 23:10:45.398059
9501	63	30	15	13	2013-06-29 23:10:45.400279	2013-06-29 23:10:45.400279
9502	63	30	24	13	2013-06-29 23:10:45.401369	2013-06-29 23:10:45.401369
9503	63	37	8	15	2013-06-29 23:10:45.402429	2013-06-29 23:10:45.402429
9504	63	29	9	21	2013-06-29 23:10:45.407729	2013-06-29 23:10:45.407729
9505	63	40	19	21	2013-06-29 23:10:45.408554	2013-06-29 23:10:45.408554
9506	63	29	28	21	2013-06-29 23:10:45.41152	2013-06-29 23:10:45.41152
9774	91	8	5	4	2013-06-30 21:01:24.584531	2013-06-30 21:01:24.584531
9775	91	8	20	4	2013-06-30 21:01:24.58541	2013-06-30 21:01:24.58541
9776	91	36	29	5	2013-06-30 21:01:24.586262	2013-06-30 21:01:24.586262
9777	91	8	9	6	2013-06-30 21:01:24.587231	2013-06-30 21:01:24.587231
9778	91	36	20	7	2013-06-30 21:01:24.588076	2013-06-30 21:01:24.588076
9779	91	30	5	8	2013-06-30 21:01:24.588867	2013-06-30 21:01:24.588867
9780	91	30	18	8	2013-06-30 21:01:24.589713	2013-06-30 21:01:24.589713
9781	91	23	0	9	2013-06-30 21:01:24.590794	2013-06-30 21:01:24.590794
9782	91	37	29	9	2013-06-30 21:01:24.591947	2013-06-30 21:01:24.591947
9783	91	23	35	9	2013-06-30 21:01:24.592923	2013-06-30 21:01:24.592923
9784	91	9	14	10	2013-06-30 21:01:24.593787	2013-06-30 21:01:24.593787
9785	91	9	18	10	2013-06-30 21:01:24.594838	2013-06-30 21:01:24.594838
9786	91	9	22	10	2013-06-30 21:01:24.595684	2013-06-30 21:01:24.595684
9787	91	9	26	10	2013-06-30 21:01:24.596422	2013-06-30 21:01:24.596422
9788	91	37	33	11	2013-06-30 21:01:24.597204	2013-06-30 21:01:24.597204
9789	91	9	5	12	2013-06-30 21:01:24.597996	2013-06-30 21:01:24.597996
9790	91	9	13	12	2013-06-30 21:01:24.598787	2013-06-30 21:01:24.598787
9791	91	8	1	13	2013-06-30 21:01:24.59959	2013-06-30 21:01:24.59959
9792	91	8	22	13	2013-06-30 21:01:24.600385	2013-06-30 21:01:24.600385
9793	91	37	17	14	2013-06-30 21:01:24.601222	2013-06-30 21:01:24.601222
9794	91	37	29	14	2013-06-30 21:01:24.602094	2013-06-30 21:01:24.602094
9795	91	36	5	15	2013-06-30 21:01:24.602896	2013-06-30 21:01:24.602896
9796	91	9	5	16	2013-06-30 21:01:24.605397	2013-06-30 21:01:24.605397
9797	91	9	29	16	2013-06-30 21:01:24.606344	2013-06-30 21:01:24.606344
9798	91	8	17	17	2013-06-30 21:01:24.607302	2013-06-30 21:01:24.607302
9799	91	40	13	21	2013-06-30 21:01:24.617347	2013-06-30 21:01:24.617347
9800	91	40	18	21	2013-06-30 21:01:24.618204	2013-06-30 21:01:24.618204
10174	61	13	17	1	2013-07-05 18:13:16.172037	2013-07-05 18:13:16.172037
10175	61	10	18	1	2013-07-05 18:13:16.174235	2013-07-05 18:13:16.174235
10176	61	10	19	1	2013-07-05 18:13:16.175419	2013-07-05 18:13:16.175419
10177	61	29	9	10	2013-07-05 18:13:16.179493	2013-07-05 18:13:16.179493
10178	61	29	26	10	2013-07-05 18:13:16.180281	2013-07-05 18:13:16.180281
10179	61	29	11	14	2013-07-05 18:13:16.202656	2013-07-05 18:13:16.202656
10180	61	29	23	14	2013-07-05 18:13:16.203507	2013-07-05 18:13:16.203507
10181	61	29	8	16	2013-07-05 18:13:16.209398	2013-07-05 18:13:16.209398
10182	61	29	26	16	2013-07-05 18:13:16.213581	2013-07-05 18:13:16.213581
10183	61	40	16	21	2013-07-05 18:13:16.22843	2013-07-05 18:13:16.22843
10184	61	29	17	21	2013-07-05 18:13:16.229212	2013-07-05 18:13:16.229212
10185	76	9	10	8	2013-07-05 21:10:24.23108	2013-07-05 21:10:24.23108
10186	76	9	11	8	2013-07-05 21:10:24.23215	2013-07-05 21:10:24.23215
10187	76	23	30	8	2013-07-05 21:10:24.233024	2013-07-05 21:10:24.233024
10188	76	23	4	13	2013-07-05 21:10:24.235334	2013-07-05 21:10:24.235334
10189	76	23	30	13	2013-07-05 21:10:24.236214	2013-07-05 21:10:24.236214
10190	76	40	16	21	2013-07-05 21:10:24.342977	2013-07-05 21:10:24.342977
12606	101	40	25	1	2013-07-06 06:57:42.603205	2013-07-06 06:57:42.603205
12607	101	29	24	5	2013-07-06 06:57:42.658696	2013-07-06 06:57:42.658696
12608	101	29	11	8	2013-07-06 06:57:42.695225	2013-07-06 06:57:42.695225
12609	101	29	16	8	2013-07-06 06:57:42.699916	2013-07-06 06:57:42.699916
12610	101	29	24	8	2013-07-06 06:57:42.700998	2013-07-06 06:57:42.700998
12611	101	29	21	9	2013-07-06 06:57:42.710865	2013-07-06 06:57:42.710865
12612	101	9	10	11	2013-07-06 06:57:42.730429	2013-07-06 06:57:42.730429
12613	101	9	26	11	2013-07-06 06:57:42.738845	2013-07-06 06:57:42.738845
12614	101	9	34	11	2013-07-06 06:57:42.742531	2013-07-06 06:57:42.742531
12615	101	29	14	12	2013-07-06 06:57:42.746372	2013-07-06 06:57:42.746372
12616	101	29	12	13	2013-07-06 06:57:42.757201	2013-07-06 06:57:42.757201
12617	101	29	19	13	2013-07-06 06:57:42.757994	2013-07-06 06:57:42.757994
12618	101	29	24	13	2013-07-06 06:57:42.761785	2013-07-06 06:57:42.761785
12619	101	29	12	16	2013-07-06 06:57:42.796447	2013-07-06 06:57:42.796447
12620	101	43	8	21	2013-07-06 06:57:42.858759	2013-07-06 06:57:42.858759
12634	60	13	21	3	2013-07-06 19:26:11.311433	2013-07-06 19:26:11.311433
12635	60	10	22	3	2013-07-06 19:26:11.31218	2013-07-06 19:26:11.31218
12636	60	10	23	3	2013-07-06 19:26:11.312891	2013-07-06 19:26:11.312891
12637	60	13	31	3	2013-07-06 19:26:11.315342	2013-07-06 19:26:11.315342
12638	60	34	32	3	2013-07-06 19:26:11.316276	2013-07-06 19:26:11.316276
12639	60	34	33	3	2013-07-06 19:26:11.317019	2013-07-06 19:26:11.317019
12640	82	23	35	14	2013-07-06 20:02:29.103666	2013-07-06 20:02:29.103666
12641	82	9	16	15	2013-07-06 20:02:29.105375	2013-07-06 20:02:29.105375
12642	82	9	17	15	2013-07-06 20:02:29.106158	2013-07-06 20:02:29.106158
12643	82	40	9	21	2013-07-06 20:02:29.109845	2013-07-06 20:02:29.109845
12644	82	23	27	21	2013-07-06 20:02:29.110583	2013-07-06 20:02:29.110583
12661	86	39	6	0	2013-07-06 20:44:06.161809	2013-07-06 20:44:06.161809
12662	86	39	9	0	2013-07-06 20:44:06.164036	2013-07-06 20:44:06.164036
12663	86	39	9	2	2013-07-06 20:44:06.17111	2013-07-06 20:44:06.17111
12664	86	23	11	3	2013-07-06 20:44:06.174455	2013-07-06 20:44:06.174455
12665	86	39	12	3	2013-07-06 20:44:06.175361	2013-07-06 20:44:06.175361
12666	86	9	3	4	2013-07-06 20:44:06.176961	2013-07-06 20:44:06.176961
12667	86	23	11	4	2013-07-06 20:44:06.178105	2013-07-06 20:44:06.178105
12668	86	9	27	5	2013-07-06 20:44:06.182285	2013-07-06 20:44:06.182285
12669	86	9	28	5	2013-07-06 20:44:06.183223	2013-07-06 20:44:06.183223
12670	86	9	29	5	2013-07-06 20:44:06.184717	2013-07-06 20:44:06.184717
12671	86	23	23	7	2013-07-06 20:44:06.190313	2013-07-06 20:44:06.190313
12672	86	29	26	10	2013-07-06 20:44:06.229686	2013-07-06 20:44:06.229686
12673	86	23	32	12	2013-07-06 20:44:06.2473	2013-07-06 20:44:06.2473
12674	86	29	17	15	2013-07-06 20:44:06.295468	2013-07-06 20:44:06.295468
12675	86	29	24	15	2013-07-06 20:44:06.298475	2013-07-06 20:44:06.298475
12676	86	9	15	17	2013-07-06 20:44:06.299901	2013-07-06 20:44:06.299901
12677	86	40	16	21	2013-07-06 20:44:06.303903	2013-07-06 20:44:06.303903
12679	33	8	20	7	2013-07-06 21:10:03.970831	2013-07-06 21:10:03.970831
12680	88	29	15	7	2013-07-06 22:30:42.1191	2013-07-06 22:30:42.1191
12681	88	29	20	7	2013-07-06 22:30:42.123786	2013-07-06 22:30:42.123786
12682	88	23	17	10	2013-07-06 22:30:42.13378	2013-07-06 22:30:42.13378
12683	88	23	17	11	2013-07-06 22:30:42.139586	2013-07-06 22:30:42.139586
12684	88	9	26	13	2013-07-06 22:30:42.149317	2013-07-06 22:30:42.149317
12685	88	9	27	13	2013-07-06 22:30:42.150053	2013-07-06 22:30:42.150053
12686	88	9	28	13	2013-07-06 22:30:42.150756	2013-07-06 22:30:42.150756
12687	88	29	15	15	2013-07-06 22:30:42.154423	2013-07-06 22:30:42.154423
12688	88	29	20	15	2013-07-06 22:30:42.158551	2013-07-06 22:30:42.158551
12689	88	36	6	16	2013-07-06 22:30:42.159461	2013-07-06 22:30:42.159461
12690	88	36	7	16	2013-07-06 22:30:42.160179	2013-07-06 22:30:42.160179
12691	88	40	25	21	2013-07-06 22:30:42.181192	2013-07-06 22:30:42.181192
12727	94	37	5	2	2013-07-07 04:24:29.936743	2013-07-07 04:24:29.936743
12728	94	37	6	2	2013-07-07 04:24:29.937664	2013-07-07 04:24:29.937664
12729	94	29	5	6	2013-07-07 04:24:29.954017	2013-07-07 04:24:29.954017
12730	94	29	23	6	2013-07-07 04:24:29.957414	2013-07-07 04:24:29.957414
12731	94	29	26	6	2013-07-07 04:24:29.960538	2013-07-07 04:24:29.960538
12732	94	23	10	8	2013-07-07 04:24:29.979383	2013-07-07 04:24:29.979383
12733	94	29	5	9	2013-07-07 04:24:29.981697	2013-07-07 04:24:29.981697
12734	94	9	6	11	2013-07-07 04:24:29.988488	2013-07-07 04:24:29.988488
12735	94	9	7	11	2013-07-07 04:24:29.98965	2013-07-07 04:24:29.98965
12736	94	29	26	12	2013-07-07 04:24:29.99685	2013-07-07 04:24:29.99685
12737	94	23	25	14	2013-07-07 04:24:30.026105	2013-07-07 04:24:30.026105
12738	94	19	8	19	2013-07-07 04:24:30.050379	2013-07-07 04:24:30.050379
12739	94	19	9	19	2013-07-07 04:24:30.051595	2013-07-07 04:24:30.051595
12740	94	43	11	21	2013-07-07 04:24:30.053638	2013-07-07 04:24:30.053638
12741	95	38	30	0	2013-07-07 04:32:56.213145	2013-07-07 04:32:56.213145
12742	95	29	2	1	2013-07-07 04:32:56.214244	2013-07-07 04:32:56.214244
12743	95	23	4	3	2013-07-07 04:32:56.218949	2013-07-07 04:32:56.218949
12744	95	29	2	5	2013-07-07 04:32:56.220004	2013-07-07 04:32:56.220004
12745	95	23	11	7	2013-07-07 04:32:56.231474	2013-07-07 04:32:56.231474
12746	95	39	35	8	2013-07-07 04:32:56.232456	2013-07-07 04:32:56.232456
12747	95	29	7	9	2013-07-07 04:32:56.233296	2013-07-07 04:32:56.233296
12748	95	19	20	9	2013-07-07 04:32:56.234116	2013-07-07 04:32:56.234116
12749	95	36	23	10	2013-07-07 04:32:56.248679	2013-07-07 04:32:56.248679
12750	95	23	18	11	2013-07-07 04:32:56.250346	2013-07-07 04:32:56.250346
12751	95	29	35	11	2013-07-07 04:32:56.25113	2013-07-07 04:32:56.25113
12752	95	29	10	13	2013-07-07 04:32:56.251927	2013-07-07 04:32:56.251927
12753	95	23	25	15	2013-07-07 04:32:56.272399	2013-07-07 04:32:56.272399
12754	95	43	18	21	2013-07-07 04:32:56.273478	2013-07-07 04:32:56.273478
12755	96	13	8	1	2013-07-07 04:46:57.771387	2013-07-07 04:46:57.771387
12756	96	10	9	1	2013-07-07 04:46:57.772249	2013-07-07 04:46:57.772249
12757	96	10	10	1	2013-07-07 04:46:57.772989	2013-07-07 04:46:57.772989
12758	96	13	26	1	2013-07-07 04:46:57.774552	2013-07-07 04:46:57.774552
12759	96	10	27	1	2013-07-07 04:46:57.775377	2013-07-07 04:46:57.775377
12760	96	10	28	1	2013-07-07 04:46:57.77614	2013-07-07 04:46:57.77614
12761	96	29	18	7	2013-07-07 04:46:57.782197	2013-07-07 04:46:57.782197
12762	96	43	19	7	2013-07-07 04:46:57.783167	2013-07-07 04:46:57.783167
12763	96	29	14	11	2013-07-07 04:46:57.802135	2013-07-07 04:46:57.802135
12764	96	29	22	11	2013-07-07 04:46:57.808289	2013-07-07 04:46:57.808289
12765	96	29	16	14	2013-07-07 04:46:57.819777	2013-07-07 04:46:57.819777
12766	96	29	20	14	2013-07-07 04:46:57.822084	2013-07-07 04:46:57.822084
12767	96	29	17	18	2013-07-07 04:46:57.826329	2013-07-07 04:46:57.826329
12768	96	29	19	18	2013-07-07 04:46:57.827796	2013-07-07 04:46:57.827796
12769	97	13	3	1	2013-07-07 21:36:30.853414	2013-07-07 21:36:30.853414
12770	97	10	4	1	2013-07-07 21:36:30.854454	2013-07-07 21:36:30.854454
12771	97	10	5	1	2013-07-07 21:36:30.855347	2013-07-07 21:36:30.855347
12772	97	43	18	7	2013-07-07 21:36:30.883727	2013-07-07 21:36:30.883727
12773	97	29	18	8	2013-07-07 21:36:30.886923	2013-07-07 21:36:30.886923
12774	97	19	17	14	2013-07-07 21:36:30.890939	2013-07-07 21:36:30.890939
12775	97	19	18	14	2013-07-07 21:36:30.891705	2013-07-07 21:36:30.891705
12776	97	40	15	21	2013-07-07 21:36:30.894083	2013-07-07 21:36:30.894083
12777	97	29	16	21	2013-07-07 21:36:30.894906	2013-07-07 21:36:30.894906
13363	98	29	0	0	2013-07-08 21:32:20.843759	2013-07-08 21:32:20.843759
13364	98	29	4	0	2013-07-08 21:32:20.845124	2013-07-08 21:32:20.845124
13365	98	29	1	1	2013-07-08 21:32:20.871334	2013-07-08 21:32:20.871334
13366	98	29	14	1	2013-07-08 21:32:20.878079	2013-07-08 21:32:20.878079
13367	98	29	21	1	2013-07-08 21:32:20.880618	2013-07-08 21:32:20.880618
13368	98	29	24	1	2013-07-08 21:32:20.882548	2013-07-08 21:32:20.882548
13369	98	29	31	1	2013-07-08 21:32:20.883299	2013-07-08 21:32:20.883299
13370	98	29	3	2	2013-07-08 21:32:20.886429	2013-07-08 21:32:20.886429
13371	98	29	5	2	2013-07-08 21:32:20.887214	2013-07-08 21:32:20.887214
13372	98	29	11	2	2013-07-08 21:32:20.893127	2013-07-08 21:32:20.893127
13373	98	29	15	2	2013-07-08 21:32:20.894073	2013-07-08 21:32:20.894073
13374	98	29	27	2	2013-07-08 21:32:20.901377	2013-07-08 21:32:20.901377
13375	98	29	33	2	2013-07-08 21:32:20.902163	2013-07-08 21:32:20.902163
13376	98	29	35	2	2013-07-08 21:32:20.902915	2013-07-08 21:32:20.902915
13377	98	29	3	3	2013-07-08 21:32:20.906942	2013-07-08 21:32:20.906942
13378	98	29	11	3	2013-07-08 21:32:20.914322	2013-07-08 21:32:20.914322
13379	98	29	13	3	2013-07-08 21:32:20.915094	2013-07-08 21:32:20.915094
13380	98	29	18	3	2013-07-08 21:32:20.918342	2013-07-08 21:32:20.918342
13381	98	29	24	3	2013-07-08 21:32:20.923452	2013-07-08 21:32:20.923452
13382	98	29	25	3	2013-07-08 21:32:20.924268	2013-07-08 21:32:20.924268
13383	98	29	31	3	2013-07-08 21:32:20.925988	2013-07-08 21:32:20.925988
13384	98	29	5	4	2013-07-08 21:32:20.935099	2013-07-08 21:32:20.935099
13385	98	29	12	4	2013-07-08 21:32:20.941867	2013-07-08 21:32:20.941867
13386	98	29	14	4	2013-07-08 21:32:20.942848	2013-07-08 21:32:20.942848
13387	98	29	27	4	2013-07-08 21:32:20.951552	2013-07-08 21:32:20.951552
13388	98	29	4	5	2013-07-08 21:32:20.958715	2013-07-08 21:32:20.958715
13389	98	29	12	5	2013-07-08 21:32:20.964287	2013-07-08 21:32:20.964287
13390	98	29	23	5	2013-07-08 21:32:20.969487	2013-07-08 21:32:20.969487
13391	98	29	29	5	2013-07-08 21:32:20.974181	2013-07-08 21:32:20.974181
13392	98	29	32	5	2013-07-08 21:32:20.975709	2013-07-08 21:32:20.975709
13393	98	29	25	6	2013-07-08 21:32:20.99298	2013-07-08 21:32:20.99298
13394	98	29	29	6	2013-07-08 21:32:20.996384	2013-07-08 21:32:20.996384
13395	98	29	32	6	2013-07-08 21:32:20.997184	2013-07-08 21:32:20.997184
13396	98	29	6	7	2013-07-08 21:32:21.003034	2013-07-08 21:32:21.003034
13397	98	29	7	7	2013-07-08 21:32:21.003744	2013-07-08 21:32:21.003744
13398	98	29	13	7	2013-07-08 21:32:21.009279	2013-07-08 21:32:21.009279
13399	98	29	14	7	2013-07-08 21:32:21.010254	2013-07-08 21:32:21.010254
13400	98	29	17	7	2013-07-08 21:32:21.012615	2013-07-08 21:32:21.012615
13401	98	29	19	7	2013-07-08 21:32:21.01355	2013-07-08 21:32:21.01355
13402	98	29	5	8	2013-07-08 21:32:21.025704	2013-07-08 21:32:21.025704
13403	98	29	8	8	2013-07-08 21:32:21.026464	2013-07-08 21:32:21.026464
13404	98	29	9	8	2013-07-08 21:32:21.027571	2013-07-08 21:32:21.027571
13405	98	29	19	8	2013-07-08 21:32:21.032431	2013-07-08 21:32:21.032431
13406	98	29	25	8	2013-07-08 21:32:21.035707	2013-07-08 21:32:21.035707
13407	98	29	30	8	2013-07-08 21:32:21.039963	2013-07-08 21:32:21.039963
13408	98	29	33	8	2013-07-08 21:32:21.040817	2013-07-08 21:32:21.040817
13409	98	29	11	9	2013-07-08 21:32:21.048316	2013-07-08 21:32:21.048316
13410	98	29	31	9	2013-07-08 21:32:21.057416	2013-07-08 21:32:21.057416
13411	98	29	33	9	2013-07-08 21:32:21.058316	2013-07-08 21:32:21.058316
13412	98	29	7	10	2013-07-08 21:32:21.065706	2013-07-08 21:32:21.065706
13413	98	29	9	10	2013-07-08 21:32:21.066521	2013-07-08 21:32:21.066521
13414	98	29	12	11	2013-07-08 21:32:21.122767	2013-07-08 21:32:21.122767
13415	98	29	13	11	2013-07-08 21:32:21.123602	2013-07-08 21:32:21.123602
13416	98	29	18	11	2013-07-08 21:32:21.125915	2013-07-08 21:32:21.125915
13417	98	29	20	11	2013-07-08 21:32:21.12673	2013-07-08 21:32:21.12673
13418	98	29	23	11	2013-07-08 21:32:21.129608	2013-07-08 21:32:21.129608
13419	98	29	32	11	2013-07-08 21:32:21.136852	2013-07-08 21:32:21.136852
13420	98	29	34	11	2013-07-08 21:32:21.137599	2013-07-08 21:32:21.137599
13421	98	29	6	12	2013-07-08 21:32:21.139974	2013-07-08 21:32:21.139974
13422	98	29	20	12	2013-07-08 21:32:21.148598	2013-07-08 21:32:21.148598
13423	98	29	23	12	2013-07-08 21:32:21.150995	2013-07-08 21:32:21.150995
13424	98	29	34	12	2013-07-08 21:32:21.158322	2013-07-08 21:32:21.158322
13425	98	29	5	13	2013-07-08 21:32:21.160722	2013-07-08 21:32:21.160722
13426	98	29	20	13	2013-07-08 21:32:21.168125	2013-07-08 21:32:21.168125
13427	98	29	30	13	2013-07-08 21:32:21.179168	2013-07-08 21:32:21.179168
13428	98	29	17	14	2013-07-08 21:32:21.201822	2013-07-08 21:32:21.201822
13429	98	29	31	14	2013-07-08 21:32:21.212399	2013-07-08 21:32:21.212399
13430	98	29	1	15	2013-07-08 21:32:21.216182	2013-07-08 21:32:21.216182
13431	98	29	14	15	2013-07-08 21:32:21.229406	2013-07-08 21:32:21.229406
13432	98	29	18	15	2013-07-08 21:32:21.230372	2013-07-08 21:32:21.230372
13433	98	29	6	16	2013-07-08 21:32:21.250597	2013-07-08 21:32:21.250597
13434	98	29	10	16	2013-07-08 21:32:21.252138	2013-07-08 21:32:21.252138
13435	98	29	15	16	2013-07-08 21:32:21.253174	2013-07-08 21:32:21.253174
13436	98	29	25	16	2013-07-08 21:32:21.260585	2013-07-08 21:32:21.260585
13437	98	29	26	16	2013-07-08 21:32:21.261416	2013-07-08 21:32:21.261416
13438	98	29	1	17	2013-07-08 21:32:21.271585	2013-07-08 21:32:21.271585
13439	98	29	4	17	2013-07-08 21:32:21.272395	2013-07-08 21:32:21.272395
13440	98	43	18	17	2013-07-08 21:32:21.273182	2013-07-08 21:32:21.273182
13441	98	29	19	17	2013-07-08 21:32:21.27394	2013-07-08 21:32:21.27394
13442	98	29	31	17	2013-07-08 21:32:21.274683	2013-07-08 21:32:21.274683
13443	98	29	2	18	2013-07-08 21:32:21.27649	2013-07-08 21:32:21.27649
13444	98	36	16	19	2013-07-08 21:32:21.280558	2013-07-08 21:32:21.280558
13445	98	36	22	19	2013-07-08 21:32:21.281346	2013-07-08 21:32:21.281346
13446	98	29	1	20	2013-07-08 21:32:21.282949	2013-07-08 21:32:21.282949
13447	98	29	3	20	2013-07-08 21:32:21.284564	2013-07-08 21:32:21.284564
13448	98	29	1	21	2013-07-08 21:32:21.286184	2013-07-08 21:32:21.286184
13449	98	43	12	21	2013-07-08 21:32:21.288132	2013-07-08 21:32:21.288132
13450	98	29	19	21	2013-07-08 21:32:21.288952	2013-07-08 21:32:21.288952
13451	92	9	16	0	2013-07-08 21:34:17.189069	2013-07-08 21:34:17.189069
13452	92	9	17	0	2013-07-08 21:34:17.189938	2013-07-08 21:34:17.189938
13453	92	9	18	0	2013-07-08 21:34:17.190658	2013-07-08 21:34:17.190658
13454	92	23	21	4	2013-07-08 21:34:17.221365	2013-07-08 21:34:17.221365
13455	92	23	23	4	2013-07-08 21:34:17.222236	2013-07-08 21:34:17.222236
13456	92	29	34	6	2013-07-08 21:34:17.24142	2013-07-08 21:34:17.24142
13457	92	29	2	8	2013-07-08 21:34:17.253065	2013-07-08 21:34:17.253065
13458	92	29	32	9	2013-07-08 21:34:17.269571	2013-07-08 21:34:17.269571
13459	92	29	35	9	2013-07-08 21:34:17.271995	2013-07-08 21:34:17.271995
13460	92	29	0	10	2013-07-08 21:34:17.272757	2013-07-08 21:34:17.272757
13461	92	29	3	10	2013-07-08 21:34:17.27498	2013-07-08 21:34:17.27498
13462	92	29	5	10	2013-07-08 21:34:17.275715	2013-07-08 21:34:17.275715
13463	92	29	28	10	2013-07-08 21:34:17.28036	2013-07-08 21:34:17.28036
13464	92	29	0	12	2013-07-08 21:34:17.297097	2013-07-08 21:34:17.297097
13465	92	29	3	12	2013-07-08 21:34:17.297931	2013-07-08 21:34:17.297931
13466	92	29	9	12	2013-07-08 21:34:17.30018	2013-07-08 21:34:17.30018
13467	92	29	31	12	2013-07-08 21:34:17.309002	2013-07-08 21:34:17.309002
13468	92	29	35	12	2013-07-08 21:34:17.309841	2013-07-08 21:34:17.309841
13469	92	29	12	13	2013-07-08 21:34:17.312137	2013-07-08 21:34:17.312137
13470	92	29	26	13	2013-07-08 21:34:17.312891	2013-07-08 21:34:17.312891
13471	92	29	17	14	2013-07-08 21:34:17.323307	2013-07-08 21:34:17.323307
13472	92	29	22	15	2013-07-08 21:34:17.327928	2013-07-08 21:34:17.327928
13473	92	30	8	18	2013-07-08 21:34:17.349641	2013-07-08 21:34:17.349641
13474	92	30	27	18	2013-07-08 21:34:17.354302	2013-07-08 21:34:17.354302
13475	92	43	7	21	2013-07-08 21:34:17.361541	2013-07-08 21:34:17.361541
13476	92	29	10	21	2013-07-08 21:34:17.362547	2013-07-08 21:34:17.362547
13477	92	43	27	21	2013-07-08 21:34:17.399058	2013-07-08 21:34:17.399058
13478	92	29	30	21	2013-07-08 21:34:17.40026	2013-07-08 21:34:17.40026
13479	93	29	20	0	2013-07-08 21:37:58.014721	2013-07-08 21:37:58.014721
13480	93	29	27	3	2013-07-08 21:37:58.026334	2013-07-08 21:37:58.026334
13481	93	29	24	8	2013-07-08 21:37:58.051121	2013-07-08 21:37:58.051121
13482	93	19	11	9	2013-07-08 21:37:58.059706	2013-07-08 21:37:58.059706
13483	93	19	12	9	2013-07-08 21:37:58.060534	2013-07-08 21:37:58.060534
13484	93	23	30	15	2013-07-08 21:37:58.109488	2013-07-08 21:37:58.109488
13485	93	43	17	21	2013-07-08 21:37:58.153064	2013-07-08 21:37:58.153064
13486	93	29	23	21	2013-07-08 21:37:58.154148	2013-07-08 21:37:58.154148
13487	100	21	4	1	2013-07-08 21:40:47.261938	2013-07-08 21:40:47.261938
13488	100	22	12	2	2013-07-08 21:40:47.286423	2013-07-08 21:40:47.286423
13489	100	22	1	3	2013-07-08 21:40:47.289475	2013-07-08 21:40:47.289475
13490	100	22	6	3	2013-07-08 21:40:47.290282	2013-07-08 21:40:47.290282
13491	100	22	14	4	2013-07-08 21:40:47.305076	2013-07-08 21:40:47.305076
13492	100	21	19	5	2013-07-08 21:40:47.317781	2013-07-08 21:40:47.317781
13493	100	21	24	5	2013-07-08 21:40:47.318885	2013-07-08 21:40:47.318885
13494	100	43	22	6	2013-07-08 21:40:47.332558	2013-07-08 21:40:47.332558
13495	100	21	3	7	2013-07-08 21:40:47.3378	2013-07-08 21:40:47.3378
13496	100	22	23	8	2013-07-08 21:40:47.358172	2013-07-08 21:40:47.358172
13497	100	22	6	9	2013-07-08 21:40:47.364261	2013-07-08 21:40:47.364261
13498	100	19	33	10	2013-07-08 21:40:47.396122	2013-07-08 21:40:47.396122
13499	100	21	7	12	2013-07-08 21:40:47.413118	2013-07-08 21:40:47.413118
13500	100	21	15	12	2013-07-08 21:40:47.415231	2013-07-08 21:40:47.415231
13501	100	22	26	12	2013-07-08 21:40:47.421095	2013-07-08 21:40:47.421095
13502	100	22	12	14	2013-07-08 21:40:47.436229	2013-07-08 21:40:47.436229
13503	100	22	17	14	2013-07-08 21:40:47.439192	2013-07-08 21:40:47.439192
13504	100	21	24	16	2013-07-08 21:40:47.469223	2013-07-08 21:40:47.469223
13505	100	19	33	16	2013-07-08 21:40:47.472185	2013-07-08 21:40:47.472185
13506	100	21	19	17	2013-07-08 21:40:47.475842	2013-07-08 21:40:47.475842
13507	100	19	4	18	2013-07-08 21:40:47.479116	2013-07-08 21:40:47.479116
13508	99	43	15	0	2013-07-08 21:43:22.396776	2013-07-08 21:43:22.396776
13509	99	29	31	0	2013-07-08 21:43:22.400271	2013-07-08 21:43:22.400271
13510	99	9	16	3	2013-07-08 21:43:22.418809	2013-07-08 21:43:22.418809
13511	99	29	5	8	2013-07-08 21:43:22.46229	2013-07-08 21:43:22.46229
13512	99	9	28	8	2013-07-08 21:43:22.472565	2013-07-08 21:43:22.472565
13513	99	23	33	8	2013-07-08 21:43:22.475708	2013-07-08 21:43:22.475708
13514	99	23	35	8	2013-07-08 21:43:22.476494	2013-07-08 21:43:22.476494
13515	99	29	27	9	2013-07-08 21:43:22.487101	2013-07-08 21:43:22.487101
13516	99	29	14	14	2013-07-08 21:43:22.529992	2013-07-08 21:43:22.529992
13517	99	19	6	18	2013-07-08 21:43:22.568491	2013-07-08 21:43:22.568491
13518	99	19	25	18	2013-07-08 21:43:22.57184	2013-07-08 21:43:22.57184
13519	99	29	25	19	2013-07-08 21:43:22.610474	2013-07-08 21:43:22.610474
13520	99	29	7	21	2013-07-08 21:43:22.622041	2013-07-08 21:43:22.622041
13521	99	43	22	21	2013-07-08 21:43:22.626232	2013-07-08 21:43:22.626232
13529	102	25	16	1	2013-07-08 21:58:01.792656	2013-07-08 21:58:01.792656
\.


--
-- Name: level_sprites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: standup75
--

SELECT pg_catalog.setval('level_sprites_id_seq', 1, false);


--
-- Data for Name: level_tiles; Type: TABLE DATA; Schema: public; Owner: standup75
--

COPY level_tiles (id, level_id, x, y, created_at, updated_at) FROM stdin;
1	2	6	0	2012-12-15 18:29:24.076706	2012-12-15 18:29:24.076706
2	2	7	0	2012-12-15 18:29:24.14971	2012-12-15 18:29:24.14971
3	2	8	0	2012-12-15 18:29:24.15271	2012-12-15 18:29:24.15271
4	2	9	0	2012-12-15 18:29:24.155711	2012-12-15 18:29:24.155711
5	2	10	0	2012-12-15 18:29:24.159711	2012-12-15 18:29:24.159711
6	3	15	0	2012-12-15 19:56:15.133042	2012-12-15 19:56:15.133042
7	3	16	0	2012-12-15 19:56:15.136042	2012-12-15 19:56:15.136042
8	3	17	0	2012-12-15 19:56:15.139043	2012-12-15 19:56:15.139043
9	3	18	0	2012-12-15 19:56:15.140043	2012-12-15 19:56:15.140043
10	3	19	0	2012-12-15 19:56:15.143043	2012-12-15 19:56:15.143043
11	3	20	0	2012-12-15 19:56:15.144043	2012-12-15 19:56:15.144043
12980	24	0	0	2013-02-24 23:44:15.533418	2013-02-24 23:44:15.533418
12981	24	1	0	2013-02-24 23:44:15.534418	2013-02-24 23:44:15.534418
12982	24	2	0	2013-02-24 23:44:15.535418	2013-02-24 23:44:15.535418
12983	24	16	0	2013-02-24 23:44:15.539419	2013-02-24 23:44:15.539419
12984	24	17	0	2013-02-24 23:44:15.540419	2013-02-24 23:44:15.540419
12985	24	18	0	2013-02-24 23:44:15.542419	2013-02-24 23:44:15.542419
12986	24	22	0	2013-02-24 23:44:15.543419	2013-02-24 23:44:15.543419
12987	24	23	0	2013-02-24 23:44:15.544419	2013-02-24 23:44:15.544419
12988	24	24	0	2013-02-24 23:44:15.545419	2013-02-24 23:44:15.545419
12989	24	33	0	2013-02-24 23:44:15.547419	2013-02-24 23:44:15.547419
12990	24	34	0	2013-02-24 23:44:15.548419	2013-02-24 23:44:15.548419
12991	24	35	0	2013-02-24 23:44:15.549419	2013-02-24 23:44:15.549419
12992	24	16	1	2013-02-24 23:44:15.550419	2013-02-24 23:44:15.550419
12993	24	17	1	2013-02-24 23:44:15.551419	2013-02-24 23:44:15.551419
12994	24	18	1	2013-02-24 23:44:15.552419	2013-02-24 23:44:15.552419
12995	24	22	1	2013-02-24 23:44:15.553419	2013-02-24 23:44:15.553419
12996	24	23	1	2013-02-24 23:44:15.554419	2013-02-24 23:44:15.554419
12997	24	24	1	2013-02-24 23:44:15.55642	2013-02-24 23:44:15.55642
12998	24	16	2	2013-02-24 23:44:15.56042	2013-02-24 23:44:15.56042
12999	24	17	2	2013-02-24 23:44:15.56142	2013-02-24 23:44:15.56142
13000	24	18	2	2013-02-24 23:44:15.56242	2013-02-24 23:44:15.56242
13001	24	22	2	2013-02-24 23:44:15.56342	2013-02-24 23:44:15.56342
13002	24	23	2	2013-02-24 23:44:15.56442	2013-02-24 23:44:15.56442
13003	24	24	2	2013-02-24 23:44:15.56542	2013-02-24 23:44:15.56542
13004	24	3	3	2013-02-24 23:44:15.56642	2013-02-24 23:44:15.56642
13005	24	4	3	2013-02-24 23:44:15.56842	2013-02-24 23:44:15.56842
13006	24	5	3	2013-02-24 23:44:15.56942	2013-02-24 23:44:15.56942
13007	24	6	3	2013-02-24 23:44:15.57042	2013-02-24 23:44:15.57042
13008	24	7	3	2013-02-24 23:44:15.57142	2013-02-24 23:44:15.57142
13009	24	8	3	2013-02-24 23:44:15.57242	2013-02-24 23:44:15.57242
13010	24	9	3	2013-02-24 23:44:15.574421	2013-02-24 23:44:15.574421
13011	24	10	3	2013-02-24 23:44:15.575421	2013-02-24 23:44:15.575421
13012	24	11	3	2013-02-24 23:44:15.576421	2013-02-24 23:44:15.576421
13013	24	12	3	2013-02-24 23:44:15.577421	2013-02-24 23:44:15.577421
13014	24	16	3	2013-02-24 23:44:15.579421	2013-02-24 23:44:15.579421
13015	24	17	3	2013-02-24 23:44:15.581421	2013-02-24 23:44:15.581421
13016	24	18	3	2013-02-24 23:44:15.582421	2013-02-24 23:44:15.582421
13017	24	22	3	2013-02-24 23:44:15.584421	2013-02-24 23:44:15.584421
13018	24	23	3	2013-02-24 23:44:15.585421	2013-02-24 23:44:15.585421
13019	24	24	3	2013-02-24 23:44:15.586421	2013-02-24 23:44:15.586421
13020	24	25	3	2013-02-24 23:44:15.587421	2013-02-24 23:44:15.587421
13021	24	26	3	2013-02-24 23:44:15.588421	2013-02-24 23:44:15.588421
13022	24	27	3	2013-02-24 23:44:15.589421	2013-02-24 23:44:15.589421
13023	24	28	3	2013-02-24 23:44:15.591422	2013-02-24 23:44:15.591422
13024	24	29	3	2013-02-24 23:44:15.592422	2013-02-24 23:44:15.592422
13025	24	30	3	2013-02-24 23:44:15.594422	2013-02-24 23:44:15.594422
13026	24	31	3	2013-02-24 23:44:15.595422	2013-02-24 23:44:15.595422
13027	24	32	3	2013-02-24 23:44:15.596422	2013-02-24 23:44:15.596422
13028	24	0	4	2013-02-24 23:44:15.597422	2013-02-24 23:44:15.597422
13029	24	1	4	2013-02-24 23:44:15.599422	2013-02-24 23:44:15.599422
13030	24	2	4	2013-02-24 23:44:15.600422	2013-02-24 23:44:15.600422
13031	24	3	4	2013-02-24 23:44:15.601422	2013-02-24 23:44:15.601422
13032	24	4	4	2013-02-24 23:44:15.602422	2013-02-24 23:44:15.602422
13033	24	5	4	2013-02-24 23:44:15.603422	2013-02-24 23:44:15.603422
13034	24	6	4	2013-02-24 23:44:15.604422	2013-02-24 23:44:15.604422
13035	24	7	4	2013-02-24 23:44:15.605422	2013-02-24 23:44:15.605422
13036	24	8	4	2013-02-24 23:44:15.606422	2013-02-24 23:44:15.606422
13037	24	9	4	2013-02-24 23:44:15.608422	2013-02-24 23:44:15.608422
13038	24	10	4	2013-02-24 23:44:15.609423	2013-02-24 23:44:15.609423
13039	24	11	4	2013-02-24 23:44:15.610423	2013-02-24 23:44:15.610423
13040	24	12	4	2013-02-24 23:44:15.611423	2013-02-24 23:44:15.611423
13041	24	0	5	2013-02-24 23:44:15.613423	2013-02-24 23:44:15.613423
13042	24	1	5	2013-02-24 23:44:15.614423	2013-02-24 23:44:15.614423
13043	24	2	5	2013-02-24 23:44:15.615423	2013-02-24 23:44:15.615423
13044	24	3	5	2013-02-24 23:44:15.616423	2013-02-24 23:44:15.616423
13045	24	4	5	2013-02-24 23:44:15.617423	2013-02-24 23:44:15.617423
13046	24	5	5	2013-02-24 23:44:15.618423	2013-02-24 23:44:15.618423
13047	24	6	5	2013-02-24 23:44:15.620423	2013-02-24 23:44:15.620423
13048	24	7	5	2013-02-24 23:44:15.621423	2013-02-24 23:44:15.621423
13049	24	8	5	2013-02-24 23:44:15.623423	2013-02-24 23:44:15.623423
13050	24	9	5	2013-02-24 23:44:15.624423	2013-02-24 23:44:15.624423
13051	24	10	5	2013-02-24 23:44:15.625423	2013-02-24 23:44:15.625423
13052	24	11	5	2013-02-24 23:44:15.626424	2013-02-24 23:44:15.626424
13053	24	12	5	2013-02-24 23:44:15.627424	2013-02-24 23:44:15.627424
13054	24	0	6	2013-02-24 23:44:15.630424	2013-02-24 23:44:15.630424
13055	24	1	6	2013-02-24 23:44:15.631424	2013-02-24 23:44:15.631424
13056	24	2	6	2013-02-24 23:44:15.632424	2013-02-24 23:44:15.632424
13057	24	3	6	2013-02-24 23:44:15.634424	2013-02-24 23:44:15.634424
13058	24	4	6	2013-02-24 23:44:15.635424	2013-02-24 23:44:15.635424
13059	24	5	6	2013-02-24 23:44:15.636424	2013-02-24 23:44:15.636424
13060	24	6	6	2013-02-24 23:44:15.637424	2013-02-24 23:44:15.637424
13061	24	7	6	2013-02-24 23:44:15.638424	2013-02-24 23:44:15.638424
13062	24	8	6	2013-02-24 23:44:15.639424	2013-02-24 23:44:15.639424
13063	24	9	6	2013-02-24 23:44:15.641424	2013-02-24 23:44:15.641424
13064	24	10	6	2013-02-24 23:44:15.642424	2013-02-24 23:44:15.642424
13065	24	11	6	2013-02-24 23:44:15.643424	2013-02-24 23:44:15.643424
13066	24	12	6	2013-02-24 23:44:15.644425	2013-02-24 23:44:15.644425
13067	24	16	7	2013-02-24 23:44:15.645425	2013-02-24 23:44:15.645425
13068	24	17	7	2013-02-24 23:44:15.646425	2013-02-24 23:44:15.646425
13069	24	18	7	2013-02-24 23:44:15.647425	2013-02-24 23:44:15.647425
13070	24	22	7	2013-02-24 23:44:15.648425	2013-02-24 23:44:15.648425
13071	24	23	7	2013-02-24 23:44:15.649425	2013-02-24 23:44:15.649425
13072	24	24	7	2013-02-24 23:44:15.650425	2013-02-24 23:44:15.650425
13073	24	25	7	2013-02-24 23:44:15.652425	2013-02-24 23:44:15.652425
13074	24	26	7	2013-02-24 23:44:15.653425	2013-02-24 23:44:15.653425
13075	24	27	7	2013-02-24 23:44:15.654425	2013-02-24 23:44:15.654425
13076	24	28	7	2013-02-24 23:44:15.655425	2013-02-24 23:44:15.655425
13077	24	29	7	2013-02-24 23:44:15.657425	2013-02-24 23:44:15.657425
13078	24	30	7	2013-02-24 23:44:15.658425	2013-02-24 23:44:15.658425
13079	24	31	7	2013-02-24 23:44:15.659425	2013-02-24 23:44:15.659425
13080	24	32	7	2013-02-24 23:44:15.660425	2013-02-24 23:44:15.660425
13081	24	33	7	2013-02-24 23:44:15.662426	2013-02-24 23:44:15.662426
13082	24	34	7	2013-02-24 23:44:15.663426	2013-02-24 23:44:15.663426
13083	24	35	7	2013-02-24 23:44:15.664426	2013-02-24 23:44:15.664426
13084	24	16	8	2013-02-24 23:44:15.667426	2013-02-24 23:44:15.667426
13085	24	17	8	2013-02-24 23:44:15.668426	2013-02-24 23:44:15.668426
13086	24	18	8	2013-02-24 23:44:15.669426	2013-02-24 23:44:15.669426
13087	24	22	8	2013-02-24 23:44:15.670426	2013-02-24 23:44:15.670426
13088	24	23	8	2013-02-24 23:44:15.710428	2013-02-24 23:44:15.710428
13089	24	24	8	2013-02-24 23:44:15.711428	2013-02-24 23:44:15.711428
13090	24	25	8	2013-02-24 23:44:15.712428	2013-02-24 23:44:15.712428
13091	24	26	8	2013-02-24 23:44:15.713428	2013-02-24 23:44:15.713428
13092	24	27	8	2013-02-24 23:44:15.715429	2013-02-24 23:44:15.715429
13093	24	28	8	2013-02-24 23:44:15.716429	2013-02-24 23:44:15.716429
13094	24	29	8	2013-02-24 23:44:15.718429	2013-02-24 23:44:15.718429
13095	24	30	8	2013-02-24 23:44:15.720429	2013-02-24 23:44:15.720429
13096	24	31	8	2013-02-24 23:44:15.722429	2013-02-24 23:44:15.722429
13097	24	32	8	2013-02-24 23:44:15.723429	2013-02-24 23:44:15.723429
13098	24	33	8	2013-02-24 23:44:15.724429	2013-02-24 23:44:15.724429
13099	24	34	8	2013-02-24 23:44:15.725429	2013-02-24 23:44:15.725429
13100	24	35	8	2013-02-24 23:44:15.726429	2013-02-24 23:44:15.726429
13101	24	16	9	2013-02-24 23:44:15.728429	2013-02-24 23:44:15.728429
13102	24	17	9	2013-02-24 23:44:15.729429	2013-02-24 23:44:15.729429
13103	24	18	9	2013-02-24 23:44:15.730429	2013-02-24 23:44:15.730429
13104	24	0	10	2013-02-24 23:44:15.73243	2013-02-24 23:44:15.73243
13105	24	1	10	2013-02-24 23:44:15.73443	2013-02-24 23:44:15.73443
13106	24	2	10	2013-02-24 23:44:15.73543	2013-02-24 23:44:15.73543
13107	24	3	10	2013-02-24 23:44:15.73743	2013-02-24 23:44:15.73743
13108	24	4	10	2013-02-24 23:44:15.73843	2013-02-24 23:44:15.73843
13109	24	5	10	2013-02-24 23:44:15.73943	2013-02-24 23:44:15.73943
13110	24	6	10	2013-02-24 23:44:15.74043	2013-02-24 23:44:15.74043
13111	24	7	10	2013-02-24 23:44:15.74143	2013-02-24 23:44:15.74143
13112	24	8	10	2013-02-24 23:44:15.74243	2013-02-24 23:44:15.74243
13113	24	9	10	2013-02-24 23:44:15.74443	2013-02-24 23:44:15.74443
13114	24	10	10	2013-02-24 23:44:15.74543	2013-02-24 23:44:15.74543
13115	24	11	10	2013-02-24 23:44:15.74743	2013-02-24 23:44:15.74743
13116	24	12	10	2013-02-24 23:44:15.749431	2013-02-24 23:44:15.749431
13117	24	13	10	2013-02-24 23:44:15.750431	2013-02-24 23:44:15.750431
13118	24	14	10	2013-02-24 23:44:15.752431	2013-02-24 23:44:15.752431
13119	24	15	10	2013-02-24 23:44:15.753431	2013-02-24 23:44:15.753431
13120	24	16	10	2013-02-24 23:44:15.754431	2013-02-24 23:44:15.754431
13121	24	17	10	2013-02-24 23:44:15.756431	2013-02-24 23:44:15.756431
13122	24	18	10	2013-02-24 23:44:15.758431	2013-02-24 23:44:15.758431
13123	24	0	11	2013-02-24 23:44:15.760431	2013-02-24 23:44:15.760431
13124	24	1	11	2013-02-24 23:44:15.762431	2013-02-24 23:44:15.762431
13125	24	2	11	2013-02-24 23:44:15.763431	2013-02-24 23:44:15.763431
13126	24	3	11	2013-02-24 23:44:15.765431	2013-02-24 23:44:15.765431
13127	24	4	11	2013-02-24 23:44:15.766432	2013-02-24 23:44:15.766432
13128	24	5	11	2013-02-24 23:44:15.768432	2013-02-24 23:44:15.768432
13129	24	6	11	2013-02-24 23:44:15.770432	2013-02-24 23:44:15.770432
13130	24	7	11	2013-02-24 23:44:15.771432	2013-02-24 23:44:15.771432
13131	24	8	11	2013-02-24 23:44:15.772432	2013-02-24 23:44:15.772432
13132	24	9	11	2013-02-24 23:44:15.773432	2013-02-24 23:44:15.773432
13133	24	10	11	2013-02-24 23:44:15.774432	2013-02-24 23:44:15.774432
13134	24	11	11	2013-02-24 23:44:15.776432	2013-02-24 23:44:15.776432
13135	24	12	11	2013-02-24 23:44:15.777432	2013-02-24 23:44:15.777432
13136	24	13	11	2013-02-24 23:44:15.778432	2013-02-24 23:44:15.778432
13137	24	14	11	2013-02-24 23:44:15.779432	2013-02-24 23:44:15.779432
13138	24	15	11	2013-02-24 23:44:15.781432	2013-02-24 23:44:15.781432
13139	24	16	11	2013-02-24 23:44:15.782432	2013-02-24 23:44:15.782432
13140	24	17	11	2013-02-24 23:44:15.784433	2013-02-24 23:44:15.784433
13141	24	18	11	2013-02-24 23:44:15.848436	2013-02-24 23:44:15.848436
13142	24	0	12	2013-02-24 23:44:15.850436	2013-02-24 23:44:15.850436
13143	24	1	12	2013-02-24 23:44:15.851436	2013-02-24 23:44:15.851436
13144	24	2	12	2013-02-24 23:44:15.852436	2013-02-24 23:44:15.852436
13145	24	3	12	2013-02-24 23:44:15.853436	2013-02-24 23:44:15.853436
13146	24	4	12	2013-02-24 23:44:15.855437	2013-02-24 23:44:15.855437
13147	24	5	12	2013-02-24 23:44:15.856437	2013-02-24 23:44:15.856437
13148	24	6	12	2013-02-24 23:44:15.857437	2013-02-24 23:44:15.857437
13149	24	7	12	2013-02-24 23:44:15.858437	2013-02-24 23:44:15.858437
13150	24	8	12	2013-02-24 23:44:15.859437	2013-02-24 23:44:15.859437
13151	24	9	12	2013-02-24 23:44:15.860437	2013-02-24 23:44:15.860437
13152	24	10	12	2013-02-24 23:44:15.862437	2013-02-24 23:44:15.862437
13153	24	11	12	2013-02-24 23:44:15.863437	2013-02-24 23:44:15.863437
13154	24	12	12	2013-02-24 23:44:15.865437	2013-02-24 23:44:15.865437
13155	24	13	12	2013-02-24 23:44:15.866437	2013-02-24 23:44:15.866437
13156	24	14	12	2013-02-24 23:44:15.867437	2013-02-24 23:44:15.867437
13157	24	15	12	2013-02-24 23:44:15.868437	2013-02-24 23:44:15.868437
13158	24	16	12	2013-02-24 23:44:15.870437	2013-02-24 23:44:15.870437
13159	24	17	12	2013-02-24 23:44:15.872438	2013-02-24 23:44:15.872438
13160	24	18	12	2013-02-24 23:44:15.873438	2013-02-24 23:44:15.873438
13161	24	22	12	2013-02-24 23:44:15.874438	2013-02-24 23:44:15.874438
13162	24	23	12	2013-02-24 23:44:15.876438	2013-02-24 23:44:15.876438
13163	24	24	12	2013-02-24 23:44:15.877438	2013-02-24 23:44:15.877438
13164	24	25	12	2013-02-24 23:44:15.879438	2013-02-24 23:44:15.879438
13165	24	26	12	2013-02-24 23:44:15.880438	2013-02-24 23:44:15.880438
13166	24	27	12	2013-02-24 23:44:15.881438	2013-02-24 23:44:15.881438
13167	24	28	12	2013-02-24 23:44:15.883438	2013-02-24 23:44:15.883438
13168	24	29	12	2013-02-24 23:44:15.885438	2013-02-24 23:44:15.885438
13169	24	30	12	2013-02-24 23:44:15.886438	2013-02-24 23:44:15.886438
13170	24	31	12	2013-02-24 23:44:15.887438	2013-02-24 23:44:15.887438
13171	24	32	12	2013-02-24 23:44:15.889439	2013-02-24 23:44:15.889439
13172	24	33	12	2013-02-24 23:44:15.890439	2013-02-24 23:44:15.890439
13173	24	34	12	2013-02-24 23:44:15.891439	2013-02-24 23:44:15.891439
13174	24	35	12	2013-02-24 23:44:15.892439	2013-02-24 23:44:15.892439
13175	24	0	13	2013-02-24 23:44:15.893439	2013-02-24 23:44:15.893439
13176	24	1	13	2013-02-24 23:44:15.894439	2013-02-24 23:44:15.894439
13177	24	2	13	2013-02-24 23:44:15.896439	2013-02-24 23:44:15.896439
13178	24	22	13	2013-02-24 23:44:15.898439	2013-02-24 23:44:15.898439
13179	24	23	13	2013-02-24 23:44:15.899439	2013-02-24 23:44:15.899439
13180	24	24	13	2013-02-24 23:44:15.900439	2013-02-24 23:44:15.900439
13181	24	25	13	2013-02-24 23:44:15.901439	2013-02-24 23:44:15.901439
13182	24	26	13	2013-02-24 23:44:15.902439	2013-02-24 23:44:15.902439
13183	24	27	13	2013-02-24 23:44:15.903439	2013-02-24 23:44:15.903439
13184	24	28	13	2013-02-24 23:44:15.904439	2013-02-24 23:44:15.904439
13185	24	29	13	2013-02-24 23:44:15.90644	2013-02-24 23:44:15.90644
13186	24	30	13	2013-02-24 23:44:15.90744	2013-02-24 23:44:15.90744
13187	24	31	13	2013-02-24 23:44:15.90844	2013-02-24 23:44:15.90844
13188	24	32	13	2013-02-24 23:44:15.90944	2013-02-24 23:44:15.90944
13189	24	33	13	2013-02-24 23:44:15.91044	2013-02-24 23:44:15.91044
13190	24	34	13	2013-02-24 23:44:15.91144	2013-02-24 23:44:15.91144
13191	24	35	13	2013-02-24 23:44:15.91344	2013-02-24 23:44:15.91344
13192	24	0	14	2013-02-24 23:44:15.91444	2013-02-24 23:44:15.91444
13193	24	1	14	2013-02-24 23:44:15.91544	2013-02-24 23:44:15.91544
13194	24	2	14	2013-02-24 23:44:15.91744	2013-02-24 23:44:15.91744
13195	24	30	14	2013-02-24 23:44:15.91844	2013-02-24 23:44:15.91844
13196	24	31	14	2013-02-24 23:44:15.91944	2013-02-24 23:44:15.91944
13197	24	32	14	2013-02-24 23:44:15.92044	2013-02-24 23:44:15.92044
13198	24	0	15	2013-02-24 23:44:15.92144	2013-02-24 23:44:15.92144
13199	24	1	15	2013-02-24 23:44:15.92344	2013-02-24 23:44:15.92344
13200	24	2	15	2013-02-24 23:44:15.924441	2013-02-24 23:44:15.924441
13201	24	30	15	2013-02-24 23:44:15.925441	2013-02-24 23:44:15.925441
13202	24	31	15	2013-02-24 23:44:15.926441	2013-02-24 23:44:15.926441
13203	24	32	15	2013-02-24 23:44:15.928441	2013-02-24 23:44:15.928441
13204	24	6	16	2013-02-24 23:44:15.931441	2013-02-24 23:44:15.931441
13205	24	7	16	2013-02-24 23:44:15.932441	2013-02-24 23:44:15.932441
13206	24	8	16	2013-02-24 23:44:15.933441	2013-02-24 23:44:15.933441
13207	24	12	16	2013-02-24 23:44:15.934441	2013-02-24 23:44:15.934441
13208	24	13	16	2013-02-24 23:44:15.936441	2013-02-24 23:44:15.936441
13209	24	14	16	2013-02-24 23:44:15.937441	2013-02-24 23:44:15.937441
13210	24	15	16	2013-02-24 23:44:15.938441	2013-02-24 23:44:15.938441
13211	24	16	16	2013-02-24 23:44:15.939441	2013-02-24 23:44:15.939441
13212	24	17	16	2013-02-24 23:44:15.940441	2013-02-24 23:44:15.940441
13213	24	18	16	2013-02-24 23:44:15.941442	2013-02-24 23:44:15.941442
13214	24	30	16	2013-02-24 23:44:15.942442	2013-02-24 23:44:15.942442
13215	24	31	16	2013-02-24 23:44:15.943442	2013-02-24 23:44:15.943442
13216	24	32	16	2013-02-24 23:44:15.945442	2013-02-24 23:44:15.945442
13217	24	6	17	2013-02-24 23:44:15.946442	2013-02-24 23:44:15.946442
13218	24	7	17	2013-02-24 23:44:15.947442	2013-02-24 23:44:15.947442
13219	24	8	17	2013-02-24 23:44:15.948442	2013-02-24 23:44:15.948442
13220	24	12	17	2013-02-24 23:44:15.950442	2013-02-24 23:44:15.950442
13221	24	13	17	2013-02-24 23:44:15.951442	2013-02-24 23:44:15.951442
13222	24	14	17	2013-02-24 23:44:15.952442	2013-02-24 23:44:15.952442
13223	24	15	17	2013-02-24 23:44:15.953442	2013-02-24 23:44:15.953442
13224	24	16	17	2013-02-24 23:44:15.954442	2013-02-24 23:44:15.954442
13225	24	17	17	2013-02-24 23:44:15.955442	2013-02-24 23:44:15.955442
13226	24	18	17	2013-02-24 23:44:15.956442	2013-02-24 23:44:15.956442
13227	24	19	17	2013-02-24 23:44:15.958442	2013-02-24 23:44:15.958442
13228	24	20	17	2013-02-24 23:44:15.959443	2013-02-24 23:44:15.959443
13229	24	21	17	2013-02-24 23:44:15.960443	2013-02-24 23:44:15.960443
13230	24	22	17	2013-02-24 23:44:15.962443	2013-02-24 23:44:15.962443
13231	24	23	17	2013-02-24 23:44:15.963443	2013-02-24 23:44:15.963443
13232	24	24	17	2013-02-24 23:44:15.964443	2013-02-24 23:44:15.964443
13233	24	25	17	2013-02-24 23:44:15.965443	2013-02-24 23:44:15.965443
13234	24	26	17	2013-02-24 23:44:15.966443	2013-02-24 23:44:15.966443
13235	24	30	17	2013-02-24 23:44:15.967443	2013-02-24 23:44:15.967443
13236	24	31	17	2013-02-24 23:44:15.969443	2013-02-24 23:44:15.969443
13237	24	32	17	2013-02-24 23:44:15.970443	2013-02-24 23:44:15.970443
13238	24	6	18	2013-02-24 23:44:15.971443	2013-02-24 23:44:15.971443
13239	24	7	18	2013-02-24 23:44:15.972443	2013-02-24 23:44:15.972443
13240	24	8	18	2013-02-24 23:44:15.973443	2013-02-24 23:44:15.973443
13241	24	12	18	2013-02-24 23:44:15.975443	2013-02-24 23:44:15.975443
13242	24	13	18	2013-02-24 23:44:15.976444	2013-02-24 23:44:15.976444
13243	24	14	18	2013-02-24 23:44:15.977444	2013-02-24 23:44:15.977444
13244	24	15	18	2013-02-24 23:44:15.978444	2013-02-24 23:44:15.978444
13245	24	16	18	2013-02-24 23:44:15.980444	2013-02-24 23:44:15.980444
13246	24	17	18	2013-02-24 23:44:15.981444	2013-02-24 23:44:15.981444
13247	24	18	18	2013-02-24 23:44:15.982444	2013-02-24 23:44:15.982444
13248	24	19	18	2013-02-24 23:44:15.983444	2013-02-24 23:44:15.983444
13249	24	20	18	2013-02-24 23:44:15.984444	2013-02-24 23:44:15.984444
13250	24	21	18	2013-02-24 23:44:15.986444	2013-02-24 23:44:15.986444
13251	24	22	18	2013-02-24 23:44:15.987444	2013-02-24 23:44:15.987444
13252	24	23	18	2013-02-24 23:44:15.989444	2013-02-24 23:44:15.989444
13253	24	24	18	2013-02-24 23:44:15.991444	2013-02-24 23:44:15.991444
13254	24	25	18	2013-02-24 23:44:15.992444	2013-02-24 23:44:15.992444
13255	24	26	18	2013-02-24 23:44:15.993444	2013-02-24 23:44:15.993444
13256	24	30	18	2013-02-24 23:44:15.995445	2013-02-24 23:44:15.995445
13257	24	31	18	2013-02-24 23:44:15.996445	2013-02-24 23:44:15.996445
13258	24	32	18	2013-02-24 23:44:15.997445	2013-02-24 23:44:15.997445
13259	24	3	19	2013-02-24 23:44:15.998445	2013-02-24 23:44:15.998445
13260	24	4	19	2013-02-24 23:44:15.999445	2013-02-24 23:44:15.999445
13261	24	5	19	2013-02-24 23:44:16.000445	2013-02-24 23:44:16.000445
13262	24	6	19	2013-02-24 23:44:16.002445	2013-02-24 23:44:16.002445
13263	24	7	19	2013-02-24 23:44:16.003445	2013-02-24 23:44:16.003445
13264	24	8	19	2013-02-24 23:44:16.004445	2013-02-24 23:44:16.004445
13265	24	24	19	2013-02-24 23:44:16.005445	2013-02-24 23:44:16.005445
13266	24	25	19	2013-02-24 23:44:16.006445	2013-02-24 23:44:16.006445
13267	24	26	19	2013-02-24 23:44:16.007445	2013-02-24 23:44:16.007445
13268	24	3	20	2013-02-24 23:44:16.010445	2013-02-24 23:44:16.010445
13269	24	4	20	2013-02-24 23:44:16.011446	2013-02-24 23:44:16.011446
13270	24	5	20	2013-02-24 23:44:16.012446	2013-02-24 23:44:16.012446
13271	24	6	20	2013-02-24 23:44:16.014446	2013-02-24 23:44:16.014446
13272	24	7	20	2013-02-24 23:44:16.015446	2013-02-24 23:44:16.015446
13273	24	8	20	2013-02-24 23:44:16.016446	2013-02-24 23:44:16.016446
13274	24	24	20	2013-02-24 23:44:16.019446	2013-02-24 23:44:16.019446
13275	24	25	20	2013-02-24 23:44:16.020446	2013-02-24 23:44:16.020446
13276	24	26	20	2013-02-24 23:44:16.021446	2013-02-24 23:44:16.021446
13277	24	3	21	2013-02-24 23:44:16.023446	2013-02-24 23:44:16.023446
13278	24	4	21	2013-02-24 23:44:16.024446	2013-02-24 23:44:16.024446
13279	24	5	21	2013-02-24 23:44:16.025446	2013-02-24 23:44:16.025446
13280	24	6	21	2013-02-24 23:44:16.026446	2013-02-24 23:44:16.026446
13281	24	7	21	2013-02-24 23:44:16.027446	2013-02-24 23:44:16.027446
13282	24	8	21	2013-02-24 23:44:16.028446	2013-02-24 23:44:16.028446
13283	24	24	21	2013-02-24 23:44:16.029447	2013-02-24 23:44:16.029447
13284	24	25	21	2013-02-24 23:44:16.030447	2013-02-24 23:44:16.030447
13285	24	26	21	2013-02-24 23:44:16.032447	2013-02-24 23:44:16.032447
18853	17	16	8	2013-04-11 02:27:24.992881	2013-04-11 02:27:24.992881
18854	17	17	8	2013-04-11 02:27:24.99376	2013-04-11 02:27:24.99376
18855	17	18	8	2013-04-11 02:27:24.99449	2013-04-11 02:27:24.99449
18856	17	16	9	2013-04-11 02:27:24.995245	2013-04-11 02:27:24.995245
18857	17	17	9	2013-04-11 02:27:24.995863	2013-04-11 02:27:24.995863
18858	17	18	9	2013-04-11 02:27:24.996463	2013-04-11 02:27:24.996463
18859	17	16	10	2013-04-11 02:27:24.997112	2013-04-11 02:27:24.997112
18860	17	17	10	2013-04-11 02:27:24.997708	2013-04-11 02:27:24.997708
18861	17	18	10	2013-04-11 02:27:24.998303	2013-04-11 02:27:24.998303
18862	17	16	11	2013-04-11 02:27:25.000456	2013-04-11 02:27:25.000456
18863	17	17	11	2013-04-11 02:27:25.001219	2013-04-11 02:27:25.001219
18864	17	18	11	2013-04-11 02:27:25.001863	2013-04-11 02:27:25.001863
18865	17	16	12	2013-04-11 02:27:25.003257	2013-04-11 02:27:25.003257
18866	17	17	12	2013-04-11 02:27:25.003862	2013-04-11 02:27:25.003862
18867	17	18	12	2013-04-11 02:27:25.004452	2013-04-11 02:27:25.004452
18868	17	16	13	2013-04-11 02:27:25.005777	2013-04-11 02:27:25.005777
18869	17	17	13	2013-04-11 02:27:25.006376	2013-04-11 02:27:25.006376
18870	17	18	13	2013-04-11 02:27:25.006965	2013-04-11 02:27:25.006965
18871	17	16	14	2013-04-11 02:27:25.007724	2013-04-11 02:27:25.007724
18872	17	17	14	2013-04-11 02:27:25.008401	2013-04-11 02:27:25.008401
18873	17	18	14	2013-04-11 02:27:25.009026	2013-04-11 02:27:25.009026
18874	17	16	15	2013-04-11 02:27:25.009863	2013-04-11 02:27:25.009863
18875	17	17	15	2013-04-11 02:27:25.010586	2013-04-11 02:27:25.010586
18876	17	18	15	2013-04-11 02:27:25.011295	2013-04-11 02:27:25.011295
18877	17	16	16	2013-04-11 02:27:25.011977	2013-04-11 02:27:25.011977
18878	17	17	16	2013-04-11 02:27:25.012612	2013-04-11 02:27:25.012612
18879	17	18	16	2013-04-11 02:27:25.013229	2013-04-11 02:27:25.013229
18880	17	16	17	2013-04-11 02:27:25.013962	2013-04-11 02:27:25.013962
18881	17	17	17	2013-04-11 02:27:25.014677	2013-04-11 02:27:25.014677
18882	17	18	17	2013-04-11 02:27:25.015292	2013-04-11 02:27:25.015292
18883	17	16	18	2013-04-11 02:27:25.015946	2013-04-11 02:27:25.015946
18884	17	17	18	2013-04-11 02:27:25.016545	2013-04-11 02:27:25.016545
18885	17	18	18	2013-04-11 02:27:25.017139	2013-04-11 02:27:25.017139
18886	17	16	19	2013-04-11 02:27:25.018656	2013-04-11 02:27:25.018656
18887	17	17	19	2013-04-11 02:27:25.019298	2013-04-11 02:27:25.019298
18888	17	18	19	2013-04-11 02:27:25.019896	2013-04-11 02:27:25.019896
18889	17	16	20	2013-04-11 02:27:25.021232	2013-04-11 02:27:25.021232
18890	17	17	20	2013-04-11 02:27:25.021853	2013-04-11 02:27:25.021853
18891	17	18	20	2013-04-11 02:27:25.022501	2013-04-11 02:27:25.022501
18892	17	3	21	2013-04-11 02:27:25.023822	2013-04-11 02:27:25.023822
18893	17	4	21	2013-04-11 02:27:25.024419	2013-04-11 02:27:25.024419
18894	17	5	21	2013-04-11 02:27:25.025012	2013-04-11 02:27:25.025012
18895	17	6	21	2013-04-11 02:27:25.025602	2013-04-11 02:27:25.025602
18896	17	7	21	2013-04-11 02:27:25.026338	2013-04-11 02:27:25.026338
18897	17	8	21	2013-04-11 02:27:25.027021	2013-04-11 02:27:25.027021
18898	17	9	21	2013-04-11 02:27:25.027702	2013-04-11 02:27:25.027702
18899	17	10	21	2013-04-11 02:27:25.028344	2013-04-11 02:27:25.028344
18900	17	11	21	2013-04-11 02:27:25.029036	2013-04-11 02:27:25.029036
18901	17	12	21	2013-04-11 02:27:25.029646	2013-04-11 02:27:25.029646
18902	17	13	21	2013-04-11 02:27:25.030383	2013-04-11 02:27:25.030383
18903	17	14	21	2013-04-11 02:27:25.031063	2013-04-11 02:27:25.031063
18904	17	15	21	2013-04-11 02:27:25.031701	2013-04-11 02:27:25.031701
18905	17	16	21	2013-04-11 02:27:25.032296	2013-04-11 02:27:25.032296
18906	17	17	21	2013-04-11 02:27:25.032893	2013-04-11 02:27:25.032893
18907	17	18	21	2013-04-11 02:27:25.033481	2013-04-11 02:27:25.033481
18908	17	19	21	2013-04-11 02:27:25.034071	2013-04-11 02:27:25.034071
18909	17	20	21	2013-04-11 02:27:25.034763	2013-04-11 02:27:25.034763
18910	17	21	21	2013-04-11 02:27:25.035728	2013-04-11 02:27:25.035728
18911	17	22	21	2013-04-11 02:27:25.036462	2013-04-11 02:27:25.036462
18912	17	23	21	2013-04-11 02:27:25.037087	2013-04-11 02:27:25.037087
18913	17	24	21	2013-04-11 02:27:25.037688	2013-04-11 02:27:25.037688
18914	17	25	21	2013-04-11 02:27:25.038301	2013-04-11 02:27:25.038301
18915	17	26	21	2013-04-11 02:27:25.038931	2013-04-11 02:27:25.038931
18916	17	27	21	2013-04-11 02:27:25.039635	2013-04-11 02:27:25.039635
18917	17	28	21	2013-04-11 02:27:25.040451	2013-04-11 02:27:25.040451
18918	17	29	21	2013-04-11 02:27:25.041201	2013-04-11 02:27:25.041201
18919	17	30	21	2013-04-11 02:27:25.041938	2013-04-11 02:27:25.041938
18920	17	31	21	2013-04-11 02:27:25.042549	2013-04-11 02:27:25.042549
18921	17	32	21	2013-04-11 02:27:25.043148	2013-04-11 02:27:25.043148
21837	14	19	0	2013-04-13 00:06:06.40048	2013-04-13 00:06:06.40048
21838	14	20	0	2013-04-13 00:06:06.401493	2013-04-13 00:06:06.401493
21839	14	21	0	2013-04-13 00:06:06.402108	2013-04-13 00:06:06.402108
21840	14	22	0	2013-04-13 00:06:06.402717	2013-04-13 00:06:06.402717
21841	14	23	0	2013-04-13 00:06:06.403318	2013-04-13 00:06:06.403318
21842	14	24	0	2013-04-13 00:06:06.403914	2013-04-13 00:06:06.403914
21843	14	25	0	2013-04-13 00:06:06.404621	2013-04-13 00:06:06.404621
21844	14	26	0	2013-04-13 00:06:06.405241	2013-04-13 00:06:06.405241
21845	14	27	0	2013-04-13 00:06:06.405916	2013-04-13 00:06:06.405916
21846	14	28	0	2013-04-13 00:06:06.406511	2013-04-13 00:06:06.406511
21847	14	29	0	2013-04-13 00:06:06.407103	2013-04-13 00:06:06.407103
21848	14	30	0	2013-04-13 00:06:06.407691	2013-04-13 00:06:06.407691
21849	14	31	0	2013-04-13 00:06:06.408371	2013-04-13 00:06:06.408371
21850	14	32	0	2013-04-13 00:06:06.408967	2013-04-13 00:06:06.408967
21851	14	33	0	2013-04-13 00:06:06.409916	2013-04-13 00:06:06.409916
21852	14	34	0	2013-04-13 00:06:06.411001	2013-04-13 00:06:06.411001
21853	14	35	0	2013-04-13 00:06:06.411662	2013-04-13 00:06:06.411662
21854	14	19	1	2013-04-13 00:06:06.412295	2013-04-13 00:06:06.412295
21855	14	20	1	2013-04-13 00:06:06.41298	2013-04-13 00:06:06.41298
21856	14	21	1	2013-04-13 00:06:06.413584	2013-04-13 00:06:06.413584
21857	14	22	1	2013-04-13 00:06:06.414245	2013-04-13 00:06:06.414245
21858	14	23	1	2013-04-13 00:06:06.414845	2013-04-13 00:06:06.414845
21859	14	24	1	2013-04-13 00:06:06.415579	2013-04-13 00:06:06.415579
21860	14	25	1	2013-04-13 00:06:06.416181	2013-04-13 00:06:06.416181
21861	14	26	1	2013-04-13 00:06:06.416769	2013-04-13 00:06:06.416769
21862	14	27	1	2013-04-13 00:06:06.417431	2013-04-13 00:06:06.417431
21863	14	28	1	2013-04-13 00:06:06.418027	2013-04-13 00:06:06.418027
21864	14	29	1	2013-04-13 00:06:06.418622	2013-04-13 00:06:06.418622
21865	14	30	1	2013-04-13 00:06:06.419296	2013-04-13 00:06:06.419296
21866	14	31	1	2013-04-13 00:06:06.419906	2013-04-13 00:06:06.419906
21867	14	32	1	2013-04-13 00:06:06.420544	2013-04-13 00:06:06.420544
21868	14	33	1	2013-04-13 00:06:06.421154	2013-04-13 00:06:06.421154
21869	14	34	1	2013-04-13 00:06:06.421888	2013-04-13 00:06:06.421888
21870	14	35	1	2013-04-13 00:06:06.422683	2013-04-13 00:06:06.422683
21871	14	0	2	2013-04-13 00:06:06.423298	2013-04-13 00:06:06.423298
21872	14	1	2	2013-04-13 00:06:06.423893	2013-04-13 00:06:06.423893
21873	14	2	2	2013-04-13 00:06:06.424561	2013-04-13 00:06:06.424561
21874	14	3	2	2013-04-13 00:06:06.42519	2013-04-13 00:06:06.42519
21875	14	4	2	2013-04-13 00:06:06.42578	2013-04-13 00:06:06.42578
21876	14	5	2	2013-04-13 00:06:06.426375	2013-04-13 00:06:06.426375
21877	14	6	2	2013-04-13 00:06:06.426973	2013-04-13 00:06:06.426973
21878	14	7	2	2013-04-13 00:06:06.427568	2013-04-13 00:06:06.427568
21879	14	8	2	2013-04-13 00:06:06.428238	2013-04-13 00:06:06.428238
21880	14	9	2	2013-04-13 00:06:06.428836	2013-04-13 00:06:06.428836
21881	14	10	2	2013-04-13 00:06:06.429426	2013-04-13 00:06:06.429426
21882	14	11	2	2013-04-13 00:06:06.43002	2013-04-13 00:06:06.43002
21883	14	19	2	2013-04-13 00:06:06.43069	2013-04-13 00:06:06.43069
21884	14	20	2	2013-04-13 00:06:06.444632	2013-04-13 00:06:06.444632
21885	14	21	2	2013-04-13 00:06:06.44601	2013-04-13 00:06:06.44601
21886	14	22	2	2013-04-13 00:06:06.447259	2013-04-13 00:06:06.447259
21887	14	23	2	2013-04-13 00:06:06.448292	2013-04-13 00:06:06.448292
21888	14	24	2	2013-04-13 00:06:06.449322	2013-04-13 00:06:06.449322
21889	14	25	2	2013-04-13 00:06:06.450359	2013-04-13 00:06:06.450359
21890	14	26	2	2013-04-13 00:06:06.451421	2013-04-13 00:06:06.451421
21891	14	27	2	2013-04-13 00:06:06.452692	2013-04-13 00:06:06.452692
21892	14	28	2	2013-04-13 00:06:06.453752	2013-04-13 00:06:06.453752
21893	14	29	2	2013-04-13 00:06:06.45462	2013-04-13 00:06:06.45462
21894	14	30	2	2013-04-13 00:06:06.455543	2013-04-13 00:06:06.455543
21895	14	31	2	2013-04-13 00:06:06.45629	2013-04-13 00:06:06.45629
21896	14	32	2	2013-04-13 00:06:06.456957	2013-04-13 00:06:06.456957
21897	14	33	2	2013-04-13 00:06:06.457718	2013-04-13 00:06:06.457718
21898	14	34	2	2013-04-13 00:06:06.45857	2013-04-13 00:06:06.45857
21899	14	35	2	2013-04-13 00:06:06.459375	2013-04-13 00:06:06.459375
21900	14	0	3	2013-04-13 00:06:06.460004	2013-04-13 00:06:06.460004
21901	14	1	3	2013-04-13 00:06:06.460602	2013-04-13 00:06:06.460602
21902	14	2	3	2013-04-13 00:06:06.461194	2013-04-13 00:06:06.461194
21903	14	3	3	2013-04-13 00:06:06.461815	2013-04-13 00:06:06.461815
21904	14	4	3	2013-04-13 00:06:06.462402	2013-04-13 00:06:06.462402
21905	14	9	3	2013-04-13 00:06:06.463148	2013-04-13 00:06:06.463148
21906	14	10	3	2013-04-13 00:06:06.46431	2013-04-13 00:06:06.46431
21907	14	11	3	2013-04-13 00:06:06.465229	2013-04-13 00:06:06.465229
21908	14	19	3	2013-04-13 00:06:06.465902	2013-04-13 00:06:06.465902
21909	14	20	3	2013-04-13 00:06:06.466537	2013-04-13 00:06:06.466537
21910	14	21	3	2013-04-13 00:06:06.467168	2013-04-13 00:06:06.467168
21911	14	22	3	2013-04-13 00:06:06.467796	2013-04-13 00:06:06.467796
21912	14	0	4	2013-04-13 00:06:06.468424	2013-04-13 00:06:06.468424
21913	14	1	4	2013-04-13 00:06:06.469029	2013-04-13 00:06:06.469029
21914	14	2	4	2013-04-13 00:06:06.469618	2013-04-13 00:06:06.469618
21915	14	3	4	2013-04-13 00:06:06.470207	2013-04-13 00:06:06.470207
21916	14	4	4	2013-04-13 00:06:06.470801	2013-04-13 00:06:06.470801
21917	14	9	4	2013-04-13 00:06:06.471397	2013-04-13 00:06:06.471397
21918	14	10	4	2013-04-13 00:06:06.472139	2013-04-13 00:06:06.472139
21919	14	11	4	2013-04-13 00:06:06.473162	2013-04-13 00:06:06.473162
21920	14	19	4	2013-04-13 00:06:06.474147	2013-04-13 00:06:06.474147
21921	14	20	4	2013-04-13 00:06:06.47489	2013-04-13 00:06:06.47489
21922	14	21	4	2013-04-13 00:06:06.475516	2013-04-13 00:06:06.475516
21923	14	22	4	2013-04-13 00:06:06.47618	2013-04-13 00:06:06.47618
21924	14	0	5	2013-04-13 00:06:06.476788	2013-04-13 00:06:06.476788
21925	14	1	5	2013-04-13 00:06:06.47738	2013-04-13 00:06:06.47738
21926	14	2	5	2013-04-13 00:06:06.478009	2013-04-13 00:06:06.478009
21927	14	3	5	2013-04-13 00:06:06.478683	2013-04-13 00:06:06.478683
21928	14	4	5	2013-04-13 00:06:06.479292	2013-04-13 00:06:06.479292
21929	14	9	5	2013-04-13 00:06:06.47988	2013-04-13 00:06:06.47988
21930	14	10	5	2013-04-13 00:06:06.480496	2013-04-13 00:06:06.480496
21931	14	11	5	2013-04-13 00:06:06.481091	2013-04-13 00:06:06.481091
21932	14	19	5	2013-04-13 00:06:06.481699	2013-04-13 00:06:06.481699
21933	14	20	5	2013-04-13 00:06:06.482324	2013-04-13 00:06:06.482324
21934	14	21	5	2013-04-13 00:06:06.482912	2013-04-13 00:06:06.482912
21935	14	22	5	2013-04-13 00:06:06.483513	2013-04-13 00:06:06.483513
21936	14	0	6	2013-04-13 00:06:06.485028	2013-04-13 00:06:06.485028
21937	14	1	6	2013-04-13 00:06:06.485635	2013-04-13 00:06:06.485635
21938	14	2	6	2013-04-13 00:06:06.486219	2013-04-13 00:06:06.486219
21939	14	3	6	2013-04-13 00:06:06.48695	2013-04-13 00:06:06.48695
21940	14	4	6	2013-04-13 00:06:06.487646	2013-04-13 00:06:06.487646
21941	14	9	6	2013-04-13 00:06:06.490112	2013-04-13 00:06:06.490112
21942	14	10	6	2013-04-13 00:06:06.49093	2013-04-13 00:06:06.49093
21943	14	11	6	2013-04-13 00:06:06.49163	2013-04-13 00:06:06.49163
21944	14	19	6	2013-04-13 00:06:06.493181	2013-04-13 00:06:06.493181
21945	14	20	6	2013-04-13 00:06:06.493785	2013-04-13 00:06:06.493785
21946	14	21	6	2013-04-13 00:06:06.494411	2013-04-13 00:06:06.494411
21947	14	22	6	2013-04-13 00:06:06.495	2013-04-13 00:06:06.495
21948	14	0	7	2013-04-13 00:06:06.496351	2013-04-13 00:06:06.496351
21949	14	1	7	2013-04-13 00:06:06.496939	2013-04-13 00:06:06.496939
21950	14	2	7	2013-04-13 00:06:06.497522	2013-04-13 00:06:06.497522
21951	14	3	7	2013-04-13 00:06:06.49815	2013-04-13 00:06:06.49815
21952	14	4	7	2013-04-13 00:06:06.500832	2013-04-13 00:06:06.500832
21953	14	9	7	2013-04-13 00:06:06.501663	2013-04-13 00:06:06.501663
21954	14	10	7	2013-04-13 00:06:06.502275	2013-04-13 00:06:06.502275
21955	14	11	7	2013-04-13 00:06:06.502875	2013-04-13 00:06:06.502875
21956	14	6	8	2013-04-13 00:06:06.50351	2013-04-13 00:06:06.50351
21957	14	7	8	2013-04-13 00:06:06.504111	2013-04-13 00:06:06.504111
21958	14	8	8	2013-04-13 00:06:06.504823	2013-04-13 00:06:06.504823
21959	14	9	8	2013-04-13 00:06:06.505484	2013-04-13 00:06:06.505484
21960	14	10	8	2013-04-13 00:06:06.506085	2013-04-13 00:06:06.506085
21961	14	11	8	2013-04-13 00:06:06.506682	2013-04-13 00:06:06.506682
21962	14	6	9	2013-04-13 00:06:06.507314	2013-04-13 00:06:06.507314
21963	14	7	9	2013-04-13 00:06:06.50791	2013-04-13 00:06:06.50791
21964	14	8	9	2013-04-13 00:06:06.508548	2013-04-13 00:06:06.508548
21965	14	9	9	2013-04-13 00:06:06.509159	2013-04-13 00:06:06.509159
21966	14	10	9	2013-04-13 00:06:06.509787	2013-04-13 00:06:06.509787
21967	14	11	9	2013-04-13 00:06:06.510404	2013-04-13 00:06:06.510404
21968	14	6	10	2013-04-13 00:06:06.511128	2013-04-13 00:06:06.511128
21969	14	7	10	2013-04-13 00:06:06.511827	2013-04-13 00:06:06.511827
21970	14	8	10	2013-04-13 00:06:06.512565	2013-04-13 00:06:06.512565
21971	14	9	10	2013-04-13 00:06:06.513224	2013-04-13 00:06:06.513224
21972	14	10	10	2013-04-13 00:06:06.513877	2013-04-13 00:06:06.513877
21973	14	11	10	2013-04-13 00:06:06.514518	2013-04-13 00:06:06.514518
21974	14	6	11	2013-04-13 00:06:06.515202	2013-04-13 00:06:06.515202
21975	14	7	11	2013-04-13 00:06:06.515859	2013-04-13 00:06:06.515859
21976	14	8	11	2013-04-13 00:06:06.516505	2013-04-13 00:06:06.516505
21977	14	9	11	2013-04-13 00:06:06.517143	2013-04-13 00:06:06.517143
21978	14	10	11	2013-04-13 00:06:06.517785	2013-04-13 00:06:06.517785
21979	14	11	11	2013-04-13 00:06:06.518498	2013-04-13 00:06:06.518498
21980	14	6	12	2013-04-13 00:06:06.519555	2013-04-13 00:06:06.519555
21981	14	7	12	2013-04-13 00:06:06.520227	2013-04-13 00:06:06.520227
21982	14	8	12	2013-04-13 00:06:06.537708	2013-04-13 00:06:06.537708
21983	14	9	12	2013-04-13 00:06:06.539021	2013-04-13 00:06:06.539021
21984	14	10	12	2013-04-13 00:06:06.539898	2013-04-13 00:06:06.539898
21985	14	11	12	2013-04-13 00:06:06.540823	2013-04-13 00:06:06.540823
21986	14	6	13	2013-04-13 00:06:06.541663	2013-04-13 00:06:06.541663
21987	14	7	13	2013-04-13 00:06:06.542394	2013-04-13 00:06:06.542394
21988	14	8	13	2013-04-13 00:06:06.543291	2013-04-13 00:06:06.543291
21989	14	9	13	2013-04-13 00:06:06.544378	2013-04-13 00:06:06.544378
21990	14	10	13	2013-04-13 00:06:06.545244	2013-04-13 00:06:06.545244
21991	14	11	13	2013-04-13 00:06:06.546085	2013-04-13 00:06:06.546085
21992	14	6	14	2013-04-13 00:06:06.54795	2013-04-13 00:06:06.54795
21993	14	7	14	2013-04-13 00:06:06.548708	2013-04-13 00:06:06.548708
21994	14	8	14	2013-04-13 00:06:06.549503	2013-04-13 00:06:06.549503
21995	14	9	14	2013-04-13 00:06:06.552527	2013-04-13 00:06:06.552527
21996	14	10	14	2013-04-13 00:06:06.553892	2013-04-13 00:06:06.553892
21997	14	11	14	2013-04-13 00:06:06.554779	2013-04-13 00:06:06.554779
21998	14	23	14	2013-04-13 00:06:06.55565	2013-04-13 00:06:06.55565
21999	14	24	14	2013-04-13 00:06:06.556323	2013-04-13 00:06:06.556323
22000	14	25	14	2013-04-13 00:06:06.556981	2013-04-13 00:06:06.556981
22001	14	23	15	2013-04-13 00:06:06.557681	2013-04-13 00:06:06.557681
22002	14	24	15	2013-04-13 00:06:06.558338	2013-04-13 00:06:06.558338
22003	14	25	15	2013-04-13 00:06:06.559004	2013-04-13 00:06:06.559004
22004	14	23	16	2013-04-13 00:06:06.559628	2013-04-13 00:06:06.559628
22005	14	24	16	2013-04-13 00:06:06.560245	2013-04-13 00:06:06.560245
22006	14	25	16	2013-04-13 00:06:06.560835	2013-04-13 00:06:06.560835
22007	14	23	17	2013-04-13 00:06:06.566618	2013-04-13 00:06:06.566618
22008	14	24	17	2013-04-13 00:06:06.567452	2013-04-13 00:06:06.567452
22009	14	25	17	2013-04-13 00:06:06.568067	2013-04-13 00:06:06.568067
22010	14	23	18	2013-04-13 00:06:06.569437	2013-04-13 00:06:06.569437
22011	14	24	18	2013-04-13 00:06:06.570038	2013-04-13 00:06:06.570038
22012	14	25	18	2013-04-13 00:06:06.570627	2013-04-13 00:06:06.570627
22013	14	23	19	2013-04-13 00:06:06.571435	2013-04-13 00:06:06.571435
22014	14	24	19	2013-04-13 00:06:06.572173	2013-04-13 00:06:06.572173
22015	14	25	19	2013-04-13 00:06:06.572776	2013-04-13 00:06:06.572776
22016	14	20	20	2013-04-13 00:06:06.573402	2013-04-13 00:06:06.573402
22017	14	21	20	2013-04-13 00:06:06.573988	2013-04-13 00:06:06.573988
22018	14	22	20	2013-04-13 00:06:06.574732	2013-04-13 00:06:06.574732
22019	14	23	20	2013-04-13 00:06:06.575319	2013-04-13 00:06:06.575319
22020	14	24	20	2013-04-13 00:06:06.576048	2013-04-13 00:06:06.576048
22021	14	25	20	2013-04-13 00:06:06.577153	2013-04-13 00:06:06.577153
22022	14	26	20	2013-04-13 00:06:06.578031	2013-04-13 00:06:06.578031
22023	14	27	20	2013-04-13 00:06:06.578797	2013-04-13 00:06:06.578797
22024	14	28	20	2013-04-13 00:06:06.579535	2013-04-13 00:06:06.579535
22025	14	20	21	2013-04-13 00:06:06.58022	2013-04-13 00:06:06.58022
22026	14	21	21	2013-04-13 00:06:06.580887	2013-04-13 00:06:06.580887
22027	14	22	21	2013-04-13 00:06:06.581544	2013-04-13 00:06:06.581544
22028	14	23	21	2013-04-13 00:06:06.582143	2013-04-13 00:06:06.582143
22029	14	24	21	2013-04-13 00:06:06.582731	2013-04-13 00:06:06.582731
22030	14	25	21	2013-04-13 00:06:06.583327	2013-04-13 00:06:06.583327
22031	14	26	21	2013-04-13 00:06:06.584035	2013-04-13 00:06:06.584035
22032	14	27	21	2013-04-13 00:06:06.584642	2013-04-13 00:06:06.584642
22033	14	28	21	2013-04-13 00:06:06.585232	2013-04-13 00:06:06.585232
23609	36	16	0	2013-05-04 19:27:02.460165	2013-05-04 19:27:02.460165
23610	36	17	0	2013-05-04 19:27:02.461119	2013-05-04 19:27:02.461119
23611	36	16	1	2013-05-04 19:27:02.461824	2013-05-04 19:27:02.461824
23612	36	17	1	2013-05-04 19:27:02.462501	2013-05-04 19:27:02.462501
23613	36	16	2	2013-05-04 19:27:02.46321	2013-05-04 19:27:02.46321
23614	36	17	2	2013-05-04 19:27:02.463841	2013-05-04 19:27:02.463841
23615	36	16	3	2013-05-04 19:27:02.467362	2013-05-04 19:27:02.467362
23616	36	17	3	2013-05-04 19:27:02.468015	2013-05-04 19:27:02.468015
23617	36	16	4	2013-05-04 19:27:02.470167	2013-05-04 19:27:02.470167
23618	36	17	4	2013-05-04 19:27:02.497554	2013-05-04 19:27:02.497554
23619	36	16	5	2013-05-04 19:27:02.498458	2013-05-04 19:27:02.498458
23620	36	17	5	2013-05-04 19:27:02.499167	2013-05-04 19:27:02.499167
23621	36	16	6	2013-05-04 19:27:02.499901	2013-05-04 19:27:02.499901
23622	36	17	6	2013-05-04 19:27:02.500559	2013-05-04 19:27:02.500559
23623	36	16	7	2013-05-04 19:27:02.501316	2013-05-04 19:27:02.501316
23624	36	17	7	2013-05-04 19:27:02.501991	2013-05-04 19:27:02.501991
23625	36	23	7	2013-05-04 19:27:02.502615	2013-05-04 19:27:02.502615
23626	36	24	7	2013-05-04 19:27:02.503275	2013-05-04 19:27:02.503275
23627	36	16	8	2013-05-04 19:27:02.503975	2013-05-04 19:27:02.503975
23628	36	17	8	2013-05-04 19:27:02.504586	2013-05-04 19:27:02.504586
23629	36	23	8	2013-05-04 19:27:02.505248	2013-05-04 19:27:02.505248
23630	36	24	8	2013-05-04 19:27:02.505922	2013-05-04 19:27:02.505922
23631	36	16	9	2013-05-04 19:27:02.506664	2013-05-04 19:27:02.506664
23632	36	17	9	2013-05-04 19:27:02.50752	2013-05-04 19:27:02.50752
23633	36	18	9	2013-05-04 19:27:02.50822	2013-05-04 19:27:02.50822
23634	36	19	9	2013-05-04 19:27:02.508911	2013-05-04 19:27:02.508911
23635	36	20	9	2013-05-04 19:27:02.50959	2013-05-04 19:27:02.50959
23636	36	21	9	2013-05-04 19:27:02.510254	2013-05-04 19:27:02.510254
23637	36	22	9	2013-05-04 19:27:02.510944	2013-05-04 19:27:02.510944
23638	36	23	9	2013-05-04 19:27:02.511556	2013-05-04 19:27:02.511556
23639	36	24	9	2013-05-04 19:27:02.512217	2013-05-04 19:27:02.512217
23640	36	22	10	2013-05-04 19:27:02.515287	2013-05-04 19:27:02.515287
23641	36	23	10	2013-05-04 19:27:02.516079	2013-05-04 19:27:02.516079
23642	36	24	10	2013-05-04 19:27:02.516783	2013-05-04 19:27:02.516783
23643	36	22	11	2013-05-04 19:27:02.518245	2013-05-04 19:27:02.518245
23644	36	23	11	2013-05-04 19:27:02.518915	2013-05-04 19:27:02.518915
23645	36	24	11	2013-05-04 19:27:02.519566	2013-05-04 19:27:02.519566
23646	36	12	19	2013-05-04 19:27:02.521343	2013-05-04 19:27:02.521343
23647	36	13	19	2013-05-04 19:27:02.522063	2013-05-04 19:27:02.522063
23648	36	22	19	2013-05-04 19:27:02.522925	2013-05-04 19:27:02.522925
23649	36	23	19	2013-05-04 19:27:02.523763	2013-05-04 19:27:02.523763
23650	36	12	20	2013-05-04 19:27:02.524794	2013-05-04 19:27:02.524794
23651	36	13	20	2013-05-04 19:27:02.525582	2013-05-04 19:27:02.525582
23652	36	22	20	2013-05-04 19:27:02.529114	2013-05-04 19:27:02.529114
23653	36	23	20	2013-05-04 19:27:02.529777	2013-05-04 19:27:02.529777
23654	36	12	21	2013-05-04 19:27:02.530467	2013-05-04 19:27:02.530467
23655	36	13	21	2013-05-04 19:27:02.531134	2013-05-04 19:27:02.531134
23656	36	14	21	2013-05-04 19:27:02.531874	2013-05-04 19:27:02.531874
23657	36	15	21	2013-05-04 19:27:02.532662	2013-05-04 19:27:02.532662
23658	36	16	21	2013-05-04 19:27:02.533436	2013-05-04 19:27:02.533436
23659	36	17	21	2013-05-04 19:27:02.534143	2013-05-04 19:27:02.534143
23660	36	18	21	2013-05-04 19:27:02.534791	2013-05-04 19:27:02.534791
23661	36	19	21	2013-05-04 19:27:02.535432	2013-05-04 19:27:02.535432
23662	36	20	21	2013-05-04 19:27:02.536109	2013-05-04 19:27:02.536109
23663	36	21	21	2013-05-04 19:27:02.536735	2013-05-04 19:27:02.536735
23664	36	22	21	2013-05-04 19:27:02.537361	2013-05-04 19:27:02.537361
23665	36	23	21	2013-05-04 19:27:02.538053	2013-05-04 19:27:02.538053
24432	13	16	0	2013-05-04 21:01:28.628473	2013-05-04 21:01:28.628473
24433	13	17	0	2013-05-04 21:01:28.630172	2013-05-04 21:01:28.630172
24434	13	16	1	2013-05-04 21:01:28.631073	2013-05-04 21:01:28.631073
24435	13	17	1	2013-05-04 21:01:28.631793	2013-05-04 21:01:28.631793
24436	13	16	2	2013-05-04 21:01:28.632605	2013-05-04 21:01:28.632605
24437	13	17	2	2013-05-04 21:01:28.633282	2013-05-04 21:01:28.633282
24438	13	16	3	2013-05-04 21:01:28.634036	2013-05-04 21:01:28.634036
24439	13	17	3	2013-05-04 21:01:28.634791	2013-05-04 21:01:28.634791
24440	13	16	4	2013-05-04 21:01:28.635643	2013-05-04 21:01:28.635643
24441	13	17	4	2013-05-04 21:01:28.636329	2013-05-04 21:01:28.636329
24442	13	16	5	2013-05-04 21:01:28.637059	2013-05-04 21:01:28.637059
24443	13	17	5	2013-05-04 21:01:28.63781	2013-05-04 21:01:28.63781
24444	13	16	6	2013-05-04 21:01:28.638964	2013-05-04 21:01:28.638964
24445	13	17	6	2013-05-04 21:01:28.639851	2013-05-04 21:01:28.639851
24446	13	16	7	2013-05-04 21:01:28.640973	2013-05-04 21:01:28.640973
24447	13	17	7	2013-05-04 21:01:28.641874	2013-05-04 21:01:28.641874
24448	13	23	7	2013-05-04 21:01:28.643519	2013-05-04 21:01:28.643519
24449	13	24	7	2013-05-04 21:01:28.644293	2013-05-04 21:01:28.644293
24450	13	16	8	2013-05-04 21:01:28.645035	2013-05-04 21:01:28.645035
24451	13	17	8	2013-05-04 21:01:28.645714	2013-05-04 21:01:28.645714
24452	13	23	8	2013-05-04 21:01:28.646376	2013-05-04 21:01:28.646376
24453	13	24	8	2013-05-04 21:01:28.647567	2013-05-04 21:01:28.647567
24454	13	16	9	2013-05-04 21:01:28.648828	2013-05-04 21:01:28.648828
24455	13	17	9	2013-05-04 21:01:28.649577	2013-05-04 21:01:28.649577
24456	13	18	9	2013-05-04 21:01:28.650453	2013-05-04 21:01:28.650453
24457	13	19	9	2013-05-04 21:01:28.651236	2013-05-04 21:01:28.651236
24458	13	20	9	2013-05-04 21:01:28.651988	2013-05-04 21:01:28.651988
24459	13	21	9	2013-05-04 21:01:28.65283	2013-05-04 21:01:28.65283
24460	13	22	9	2013-05-04 21:01:28.653619	2013-05-04 21:01:28.653619
24461	13	23	9	2013-05-04 21:01:28.654347	2013-05-04 21:01:28.654347
24462	13	24	9	2013-05-04 21:01:28.655283	2013-05-04 21:01:28.655283
24463	13	22	10	2013-05-04 21:01:28.656194	2013-05-04 21:01:28.656194
24464	13	23	10	2013-05-04 21:01:28.656931	2013-05-04 21:01:28.656931
24465	13	24	10	2013-05-04 21:01:28.657619	2013-05-04 21:01:28.657619
24466	13	8	11	2013-05-04 21:01:28.658306	2013-05-04 21:01:28.658306
24467	13	9	11	2013-05-04 21:01:28.659087	2013-05-04 21:01:28.659087
24468	13	22	11	2013-05-04 21:01:28.6598	2013-05-04 21:01:28.6598
24469	13	23	11	2013-05-04 21:01:28.660519	2013-05-04 21:01:28.660519
24470	13	24	11	2013-05-04 21:01:28.661206	2013-05-04 21:01:28.661206
24471	13	8	12	2013-05-04 21:01:28.662109	2013-05-04 21:01:28.662109
24472	13	9	12	2013-05-04 21:01:28.663057	2013-05-04 21:01:28.663057
24473	13	22	12	2013-05-04 21:01:28.664177	2013-05-04 21:01:28.664177
24474	13	23	12	2013-05-04 21:01:28.665061	2013-05-04 21:01:28.665061
24475	13	24	12	2013-05-04 21:01:28.665771	2013-05-04 21:01:28.665771
24476	13	8	13	2013-05-04 21:01:28.66646	2013-05-04 21:01:28.66646
24477	13	9	13	2013-05-04 21:01:28.667149	2013-05-04 21:01:28.667149
24478	13	22	13	2013-05-04 21:01:28.667956	2013-05-04 21:01:28.667956
24479	13	23	13	2013-05-04 21:01:28.668643	2013-05-04 21:01:28.668643
24480	13	24	13	2013-05-04 21:01:28.669304	2013-05-04 21:01:28.669304
24481	13	8	14	2013-05-04 21:01:28.670016	2013-05-04 21:01:28.670016
24482	13	9	14	2013-05-04 21:01:28.67093	2013-05-04 21:01:28.67093
24483	13	8	15	2013-05-04 21:01:28.672178	2013-05-04 21:01:28.672178
24484	13	9	15	2013-05-04 21:01:28.672982	2013-05-04 21:01:28.672982
24485	13	10	15	2013-05-04 21:01:28.673911	2013-05-04 21:01:28.673911
24486	13	11	15	2013-05-04 21:01:28.674706	2013-05-04 21:01:28.674706
24487	13	12	15	2013-05-04 21:01:28.675429	2013-05-04 21:01:28.675429
24488	13	13	15	2013-05-04 21:01:28.676202	2013-05-04 21:01:28.676202
24489	13	14	15	2013-05-04 21:01:28.677078	2013-05-04 21:01:28.677078
24490	13	15	15	2013-05-04 21:01:28.678097	2013-05-04 21:01:28.678097
24491	13	14	16	2013-05-04 21:01:28.679473	2013-05-04 21:01:28.679473
24492	13	15	16	2013-05-04 21:01:28.680276	2013-05-04 21:01:28.680276
24493	13	14	17	2013-05-04 21:01:28.681235	2013-05-04 21:01:28.681235
24494	13	15	17	2013-05-04 21:01:28.682026	2013-05-04 21:01:28.682026
24495	13	14	18	2013-05-04 21:01:28.682914	2013-05-04 21:01:28.682914
24496	13	15	18	2013-05-04 21:01:28.683713	2013-05-04 21:01:28.683713
24497	13	14	19	2013-05-04 21:01:28.68442	2013-05-04 21:01:28.68442
24498	13	15	19	2013-05-04 21:01:28.685361	2013-05-04 21:01:28.685361
24499	13	14	20	2013-05-04 21:01:28.68626	2013-05-04 21:01:28.68626
24500	13	15	20	2013-05-04 21:01:28.686985	2013-05-04 21:01:28.686985
24501	13	14	21	2013-05-04 21:01:28.687803	2013-05-04 21:01:28.687803
24502	13	15	21	2013-05-04 21:01:28.688949	2013-05-04 21:01:28.688949
25097	40	10	0	2013-05-05 14:53:10.274486	2013-05-05 14:53:10.274486
25098	40	11	0	2013-05-05 14:53:10.275303	2013-05-05 14:53:10.275303
25099	40	12	0	2013-05-05 14:53:10.275927	2013-05-05 14:53:10.275927
25100	40	13	0	2013-05-05 14:53:10.276534	2013-05-05 14:53:10.276534
25101	40	14	0	2013-05-05 14:53:10.27714	2013-05-05 14:53:10.27714
25102	40	15	0	2013-05-05 14:53:10.277758	2013-05-05 14:53:10.277758
25103	40	16	0	2013-05-05 14:53:10.278384	2013-05-05 14:53:10.278384
25104	40	17	0	2013-05-05 14:53:10.278997	2013-05-05 14:53:10.278997
25105	40	18	0	2013-05-05 14:53:10.279603	2013-05-05 14:53:10.279603
25106	40	19	0	2013-05-05 14:53:10.280198	2013-05-05 14:53:10.280198
25107	40	20	0	2013-05-05 14:53:10.280913	2013-05-05 14:53:10.280913
25108	40	21	0	2013-05-05 14:53:10.281528	2013-05-05 14:53:10.281528
25109	40	22	0	2013-05-05 14:53:10.282128	2013-05-05 14:53:10.282128
25110	40	23	0	2013-05-05 14:53:10.282723	2013-05-05 14:53:10.282723
25111	40	9	7	2013-05-05 14:53:10.285858	2013-05-05 14:53:10.285858
25112	40	10	7	2013-05-05 14:53:10.286479	2013-05-05 14:53:10.286479
25113	40	11	7	2013-05-05 14:53:10.287112	2013-05-05 14:53:10.287112
25114	40	12	7	2013-05-05 14:53:10.287713	2013-05-05 14:53:10.287713
25115	40	13	7	2013-05-05 14:53:10.288327	2013-05-05 14:53:10.288327
25116	40	14	7	2013-05-05 14:53:10.288925	2013-05-05 14:53:10.288925
25117	40	6	8	2013-05-05 14:53:10.291569	2013-05-05 14:53:10.291569
25118	40	7	8	2013-05-05 14:53:10.292175	2013-05-05 14:53:10.292175
25119	40	8	8	2013-05-05 14:53:10.292773	2013-05-05 14:53:10.292773
25120	40	9	8	2013-05-05 14:53:10.293402	2013-05-05 14:53:10.293402
25121	40	13	8	2013-05-05 14:53:10.29403	2013-05-05 14:53:10.29403
25122	40	14	8	2013-05-05 14:53:10.294628	2013-05-05 14:53:10.294628
25123	40	15	8	2013-05-05 14:53:10.295285	2013-05-05 14:53:10.295285
25124	40	16	8	2013-05-05 14:53:10.295987	2013-05-05 14:53:10.295987
25125	40	17	8	2013-05-05 14:53:10.296873	2013-05-05 14:53:10.296873
25126	40	18	8	2013-05-05 14:53:10.297476	2013-05-05 14:53:10.297476
25127	40	19	8	2013-05-05 14:53:10.298068	2013-05-05 14:53:10.298068
25128	40	20	8	2013-05-05 14:53:10.298658	2013-05-05 14:53:10.298658
25129	40	21	8	2013-05-05 14:53:10.299361	2013-05-05 14:53:10.299361
25130	40	0	9	2013-05-05 14:53:10.300749	2013-05-05 14:53:10.300749
25131	40	1	9	2013-05-05 14:53:10.301351	2013-05-05 14:53:10.301351
25132	40	2	9	2013-05-05 14:53:10.301938	2013-05-05 14:53:10.301938
25133	40	3	9	2013-05-05 14:53:10.302517	2013-05-05 14:53:10.302517
25134	40	4	9	2013-05-05 14:53:10.303232	2013-05-05 14:53:10.303232
25135	40	5	9	2013-05-05 14:53:10.303879	2013-05-05 14:53:10.303879
25136	40	6	9	2013-05-05 14:53:10.304461	2013-05-05 14:53:10.304461
25137	40	7	9	2013-05-05 14:53:10.305043	2013-05-05 14:53:10.305043
25138	40	13	9	2013-05-05 14:53:10.308503	2013-05-05 14:53:10.308503
25139	40	14	9	2013-05-05 14:53:10.309111	2013-05-05 14:53:10.309111
25140	40	15	9	2013-05-05 14:53:10.309696	2013-05-05 14:53:10.309696
25141	40	16	9	2013-05-05 14:53:10.310278	2013-05-05 14:53:10.310278
25142	40	17	9	2013-05-05 14:53:10.310867	2013-05-05 14:53:10.310867
25143	40	18	9	2013-05-05 14:53:10.311453	2013-05-05 14:53:10.311453
25144	40	19	9	2013-05-05 14:53:10.312033	2013-05-05 14:53:10.312033
25145	40	20	9	2013-05-05 14:53:10.312616	2013-05-05 14:53:10.312616
25146	40	21	9	2013-05-05 14:53:10.313195	2013-05-05 14:53:10.313195
25147	40	4	10	2013-05-05 14:53:10.372379	2013-05-05 14:53:10.372379
25148	40	5	10	2013-05-05 14:53:10.373009	2013-05-05 14:53:10.373009
25149	40	6	10	2013-05-05 14:53:10.373626	2013-05-05 14:53:10.373626
25150	40	7	10	2013-05-05 14:53:10.374737	2013-05-05 14:53:10.374737
25151	40	13	10	2013-05-05 14:53:10.375518	2013-05-05 14:53:10.375518
25152	40	14	10	2013-05-05 14:53:10.376173	2013-05-05 14:53:10.376173
25153	40	15	10	2013-05-05 14:53:10.376822	2013-05-05 14:53:10.376822
25154	40	16	10	2013-05-05 14:53:10.377537	2013-05-05 14:53:10.377537
25155	40	17	10	2013-05-05 14:53:10.378265	2013-05-05 14:53:10.378265
25156	40	18	10	2013-05-05 14:53:10.378938	2013-05-05 14:53:10.378938
25157	40	19	10	2013-05-05 14:53:10.379773	2013-05-05 14:53:10.379773
25158	40	20	10	2013-05-05 14:53:10.380424	2013-05-05 14:53:10.380424
25159	40	21	10	2013-05-05 14:53:10.381071	2013-05-05 14:53:10.381071
25160	40	4	11	2013-05-05 14:53:10.382607	2013-05-05 14:53:10.382607
25161	40	5	11	2013-05-05 14:53:10.38384	2013-05-05 14:53:10.38384
25162	40	6	11	2013-05-05 14:53:10.384961	2013-05-05 14:53:10.384961
25163	40	7	11	2013-05-05 14:53:10.386262	2013-05-05 14:53:10.386262
25164	40	18	11	2013-05-05 14:53:10.389394	2013-05-05 14:53:10.389394
25165	40	19	11	2013-05-05 14:53:10.390649	2013-05-05 14:53:10.390649
25166	40	20	11	2013-05-05 14:53:10.39194	2013-05-05 14:53:10.39194
25167	40	21	11	2013-05-05 14:53:10.393294	2013-05-05 14:53:10.393294
25168	40	18	12	2013-05-05 14:53:10.395889	2013-05-05 14:53:10.395889
25169	40	19	12	2013-05-05 14:53:10.396988	2013-05-05 14:53:10.396988
25170	40	20	12	2013-05-05 14:53:10.398112	2013-05-05 14:53:10.398112
25171	40	21	12	2013-05-05 14:53:10.399236	2013-05-05 14:53:10.399236
29917	39	7	0	2013-05-09 23:53:42.96618	2013-05-09 23:53:42.96618
29918	39	9	0	2013-05-09 23:53:42.967008	2013-05-09 23:53:42.967008
29919	39	10	0	2013-05-09 23:53:42.96766	2013-05-09 23:53:42.96766
29920	39	11	0	2013-05-09 23:53:42.968269	2013-05-09 23:53:42.968269
29921	39	12	0	2013-05-09 23:53:42.968999	2013-05-09 23:53:42.968999
29922	39	13	0	2013-05-09 23:53:42.969748	2013-05-09 23:53:42.969748
29923	39	14	0	2013-05-09 23:53:42.97035	2013-05-09 23:53:42.97035
29924	39	15	0	2013-05-09 23:53:42.970948	2013-05-09 23:53:42.970948
29925	39	16	0	2013-05-09 23:53:42.971663	2013-05-09 23:53:42.971663
29926	39	17	0	2013-05-09 23:53:42.972302	2013-05-09 23:53:42.972302
29927	39	18	0	2013-05-09 23:53:42.972896	2013-05-09 23:53:42.972896
29928	39	19	0	2013-05-09 23:53:42.973487	2013-05-09 23:53:42.973487
29929	39	20	0	2013-05-09 23:53:42.974334	2013-05-09 23:53:42.974334
29930	39	21	0	2013-05-09 23:53:42.97498	2013-05-09 23:53:42.97498
29931	39	22	0	2013-05-09 23:53:42.975577	2013-05-09 23:53:42.975577
29932	39	23	0	2013-05-09 23:53:42.976227	2013-05-09 23:53:42.976227
29933	39	24	0	2013-05-09 23:53:42.976824	2013-05-09 23:53:42.976824
29934	39	25	0	2013-05-09 23:53:42.977495	2013-05-09 23:53:42.977495
29935	39	0	1	2013-05-09 23:53:42.978184	2013-05-09 23:53:42.978184
29936	39	1	1	2013-05-09 23:53:42.978819	2013-05-09 23:53:42.978819
29937	39	7	1	2013-05-09 23:53:42.979422	2013-05-09 23:53:42.979422
29938	39	10	1	2013-05-09 23:53:42.98002	2013-05-09 23:53:42.98002
29939	39	11	1	2013-05-09 23:53:42.980611	2013-05-09 23:53:42.980611
29940	39	12	1	2013-05-09 23:53:42.981196	2013-05-09 23:53:42.981196
29941	39	13	1	2013-05-09 23:53:42.981777	2013-05-09 23:53:42.981777
29942	39	16	1	2013-05-09 23:53:42.982387	2013-05-09 23:53:42.982387
29943	39	17	1	2013-05-09 23:53:42.982971	2013-05-09 23:53:42.982971
29944	39	18	1	2013-05-09 23:53:42.983552	2013-05-09 23:53:42.983552
29945	39	19	1	2013-05-09 23:53:42.984217	2013-05-09 23:53:42.984217
29946	39	20	1	2013-05-09 23:53:42.984816	2013-05-09 23:53:42.984816
29947	39	21	1	2013-05-09 23:53:42.985412	2013-05-09 23:53:42.985412
29948	39	22	1	2013-05-09 23:53:42.986017	2013-05-09 23:53:42.986017
29949	39	23	1	2013-05-09 23:53:42.986614	2013-05-09 23:53:42.986614
29950	39	24	1	2013-05-09 23:53:42.987235	2013-05-09 23:53:42.987235
29951	39	25	1	2013-05-09 23:53:42.987839	2013-05-09 23:53:42.987839
29952	39	0	2	2013-05-09 23:53:42.988445	2013-05-09 23:53:42.988445
29953	39	1	2	2013-05-09 23:53:42.989259	2013-05-09 23:53:42.989259
29954	39	10	2	2013-05-09 23:53:42.993293	2013-05-09 23:53:42.993293
29955	39	13	2	2013-05-09 23:53:42.99409	2013-05-09 23:53:42.99409
29956	39	16	2	2013-05-09 23:53:42.994857	2013-05-09 23:53:42.994857
29957	39	25	2	2013-05-09 23:53:42.995584	2013-05-09 23:53:42.995584
29958	39	1	3	2013-05-09 23:53:42.998909	2013-05-09 23:53:42.998909
29959	39	10	3	2013-05-09 23:53:42.999522	2013-05-09 23:53:42.999522
29960	39	16	3	2013-05-09 23:53:43.00098	2013-05-09 23:53:43.00098
29961	39	25	3	2013-05-09 23:53:43.001587	2013-05-09 23:53:43.001587
29962	39	16	4	2013-05-09 23:53:43.02868	2013-05-09 23:53:43.02868
29963	39	25	4	2013-05-09 23:53:43.031664	2013-05-09 23:53:43.031664
29964	39	16	5	2013-05-09 23:53:43.032352	2013-05-09 23:53:43.032352
29965	39	25	5	2013-05-09 23:53:43.033047	2013-05-09 23:53:43.033047
29966	39	16	6	2013-05-09 23:53:43.033715	2013-05-09 23:53:43.033715
29967	39	25	6	2013-05-09 23:53:43.034342	2013-05-09 23:53:43.034342
29968	39	16	7	2013-05-09 23:53:43.035046	2013-05-09 23:53:43.035046
29969	39	16	8	2013-05-09 23:53:43.036576	2013-05-09 23:53:43.036576
29970	39	16	9	2013-05-09 23:53:43.037979	2013-05-09 23:53:43.037979
29971	39	16	10	2013-05-09 23:53:43.039391	2013-05-09 23:53:43.039391
29972	39	16	11	2013-05-09 23:53:43.040063	2013-05-09 23:53:43.040063
29973	39	7	18	2013-05-09 23:53:43.043377	2013-05-09 23:53:43.043377
29974	39	7	19	2013-05-09 23:53:43.0441	2013-05-09 23:53:43.0441
29975	39	7	20	2013-05-09 23:53:43.044778	2013-05-09 23:53:43.044778
29976	39	7	21	2013-05-09 23:53:43.045471	2013-05-09 23:53:43.045471
29977	15	13	0	2013-05-09 23:54:21.890937	2013-05-09 23:54:21.890937
29978	15	14	0	2013-05-09 23:54:21.891762	2013-05-09 23:54:21.891762
29979	15	15	0	2013-05-09 23:54:21.892415	2013-05-09 23:54:21.892415
29980	15	16	0	2013-05-09 23:54:21.893018	2013-05-09 23:54:21.893018
29981	15	17	0	2013-05-09 23:54:21.89361	2013-05-09 23:54:21.89361
29982	15	18	0	2013-05-09 23:54:21.894203	2013-05-09 23:54:21.894203
29983	15	19	0	2013-05-09 23:54:21.894821	2013-05-09 23:54:21.894821
29984	15	20	0	2013-05-09 23:54:21.895412	2013-05-09 23:54:21.895412
29985	15	21	0	2013-05-09 23:54:21.896	2013-05-09 23:54:21.896
29986	15	22	0	2013-05-09 23:54:21.896592	2013-05-09 23:54:21.896592
29987	15	23	0	2013-05-09 23:54:21.897176	2013-05-09 23:54:21.897176
29988	15	13	1	2013-05-09 23:54:21.898612	2013-05-09 23:54:21.898612
29989	15	14	1	2013-05-09 23:54:21.899218	2013-05-09 23:54:21.899218
29990	15	15	1	2013-05-09 23:54:21.899876	2013-05-09 23:54:21.899876
29991	15	16	1	2013-05-09 23:54:21.900563	2013-05-09 23:54:21.900563
29992	15	17	1	2013-05-09 23:54:21.901294	2013-05-09 23:54:21.901294
29993	15	18	1	2013-05-09 23:54:21.901909	2013-05-09 23:54:21.901909
29994	15	19	1	2013-05-09 23:54:21.902565	2013-05-09 23:54:21.902565
29995	15	20	1	2013-05-09 23:54:21.903158	2013-05-09 23:54:21.903158
29996	15	21	1	2013-05-09 23:54:21.903748	2013-05-09 23:54:21.903748
29997	15	22	1	2013-05-09 23:54:21.904335	2013-05-09 23:54:21.904335
29998	15	23	1	2013-05-09 23:54:21.904918	2013-05-09 23:54:21.904918
29999	15	13	2	2013-05-09 23:54:21.905531	2013-05-09 23:54:21.905531
30000	15	14	2	2013-05-09 23:54:21.906114	2013-05-09 23:54:21.906114
30001	15	15	2	2013-05-09 23:54:21.906828	2013-05-09 23:54:21.906828
30002	15	16	2	2013-05-09 23:54:21.907439	2013-05-09 23:54:21.907439
30003	15	17	2	2013-05-09 23:54:21.908029	2013-05-09 23:54:21.908029
30004	15	18	2	2013-05-09 23:54:21.908632	2013-05-09 23:54:21.908632
30005	15	19	2	2013-05-09 23:54:21.909323	2013-05-09 23:54:21.909323
30006	15	20	2	2013-05-09 23:54:21.909928	2013-05-09 23:54:21.909928
30007	15	21	2	2013-05-09 23:54:21.910623	2013-05-09 23:54:21.910623
30008	15	22	2	2013-05-09 23:54:21.911221	2013-05-09 23:54:21.911221
30009	15	23	2	2013-05-09 23:54:21.911809	2013-05-09 23:54:21.911809
30010	15	13	3	2013-05-09 23:54:21.912423	2013-05-09 23:54:21.912423
30011	15	14	3	2013-05-09 23:54:21.913073	2013-05-09 23:54:21.913073
30012	15	15	3	2013-05-09 23:54:21.913674	2013-05-09 23:54:21.913674
30013	15	16	3	2013-05-09 23:54:21.91426	2013-05-09 23:54:21.91426
30014	15	17	3	2013-05-09 23:54:21.914838	2013-05-09 23:54:21.914838
30015	15	18	3	2013-05-09 23:54:21.915416	2013-05-09 23:54:21.915416
30016	15	19	3	2013-05-09 23:54:21.916011	2013-05-09 23:54:21.916011
30017	15	20	3	2013-05-09 23:54:21.916591	2013-05-09 23:54:21.916591
30018	15	21	3	2013-05-09 23:54:21.917188	2013-05-09 23:54:21.917188
30019	15	22	3	2013-05-09 23:54:21.917779	2013-05-09 23:54:21.917779
30020	15	23	3	2013-05-09 23:54:21.918358	2013-05-09 23:54:21.918358
30021	15	13	4	2013-05-09 23:54:21.918966	2013-05-09 23:54:21.918966
30022	15	14	4	2013-05-09 23:54:21.919548	2013-05-09 23:54:21.919548
30023	15	15	4	2013-05-09 23:54:21.920124	2013-05-09 23:54:21.920124
30024	15	16	4	2013-05-09 23:54:21.920698	2013-05-09 23:54:21.920698
30025	15	17	4	2013-05-09 23:54:21.921277	2013-05-09 23:54:21.921277
30026	15	18	4	2013-05-09 23:54:21.921849	2013-05-09 23:54:21.921849
30027	15	19	4	2013-05-09 23:54:21.922435	2013-05-09 23:54:21.922435
30028	15	20	4	2013-05-09 23:54:21.923008	2013-05-09 23:54:21.923008
30029	15	21	4	2013-05-09 23:54:21.923581	2013-05-09 23:54:21.923581
30030	15	22	4	2013-05-09 23:54:21.924158	2013-05-09 23:54:21.924158
30031	15	23	4	2013-05-09 23:54:21.924743	2013-05-09 23:54:21.924743
30032	15	0	9	2013-05-09 23:54:21.929284	2013-05-09 23:54:21.929284
30033	15	1	9	2013-05-09 23:54:21.930045	2013-05-09 23:54:21.930045
30034	15	2	9	2013-05-09 23:54:21.93084	2013-05-09 23:54:21.93084
30035	15	3	9	2013-05-09 23:54:21.931462	2013-05-09 23:54:21.931462
30036	15	4	9	2013-05-09 23:54:21.932046	2013-05-09 23:54:21.932046
30037	15	5	9	2013-05-09 23:54:21.932624	2013-05-09 23:54:21.932624
30038	15	6	9	2013-05-09 23:54:21.933209	2013-05-09 23:54:21.933209
30039	15	7	9	2013-05-09 23:54:21.933826	2013-05-09 23:54:21.933826
30040	15	30	9	2013-05-09 23:54:21.934487	2013-05-09 23:54:21.934487
30041	15	31	9	2013-05-09 23:54:21.935096	2013-05-09 23:54:21.935096
30042	15	32	9	2013-05-09 23:54:21.935677	2013-05-09 23:54:21.935677
30043	15	0	10	2013-05-09 23:54:21.936263	2013-05-09 23:54:21.936263
30044	15	1	10	2013-05-09 23:54:21.936921	2013-05-09 23:54:21.936921
30045	15	2	10	2013-05-09 23:54:21.937574	2013-05-09 23:54:21.937574
30046	15	3	10	2013-05-09 23:54:21.938163	2013-05-09 23:54:21.938163
30047	15	4	10	2013-05-09 23:54:21.938771	2013-05-09 23:54:21.938771
30048	15	5	10	2013-05-09 23:54:21.939353	2013-05-09 23:54:21.939353
30049	15	6	10	2013-05-09 23:54:21.939925	2013-05-09 23:54:21.939925
30050	15	7	10	2013-05-09 23:54:21.940546	2013-05-09 23:54:21.940546
30051	15	30	10	2013-05-09 23:54:21.941229	2013-05-09 23:54:21.941229
30052	15	31	10	2013-05-09 23:54:21.941932	2013-05-09 23:54:21.941932
30053	15	32	10	2013-05-09 23:54:21.942631	2013-05-09 23:54:21.942631
30054	15	4	11	2013-05-09 23:54:21.943566	2013-05-09 23:54:21.943566
30055	15	5	11	2013-05-09 23:54:21.944251	2013-05-09 23:54:21.944251
30056	15	6	11	2013-05-09 23:54:21.944835	2013-05-09 23:54:21.944835
30057	15	7	11	2013-05-09 23:54:21.945412	2013-05-09 23:54:21.945412
30058	15	30	11	2013-05-09 23:54:21.946221	2013-05-09 23:54:21.946221
30059	15	31	11	2013-05-09 23:54:21.946916	2013-05-09 23:54:21.946916
30060	15	32	11	2013-05-09 23:54:21.947676	2013-05-09 23:54:21.947676
30061	15	4	12	2013-05-09 23:54:21.948413	2013-05-09 23:54:21.948413
30062	15	5	12	2013-05-09 23:54:21.949004	2013-05-09 23:54:21.949004
30063	15	6	12	2013-05-09 23:54:21.949592	2013-05-09 23:54:21.949592
30064	15	7	12	2013-05-09 23:54:21.950175	2013-05-09 23:54:21.950175
30065	15	8	12	2013-05-09 23:54:21.950757	2013-05-09 23:54:21.950757
30066	15	9	12	2013-05-09 23:54:21.951333	2013-05-09 23:54:21.951333
30067	15	10	12	2013-05-09 23:54:21.951953	2013-05-09 23:54:21.951953
30068	15	27	12	2013-05-09 23:54:21.952569	2013-05-09 23:54:21.952569
30069	15	28	12	2013-05-09 23:54:21.953171	2013-05-09 23:54:21.953171
30070	15	29	12	2013-05-09 23:54:21.953751	2013-05-09 23:54:21.953751
30071	15	30	12	2013-05-09 23:54:21.954334	2013-05-09 23:54:21.954334
30072	15	31	12	2013-05-09 23:54:21.954977	2013-05-09 23:54:21.954977
30073	15	32	12	2013-05-09 23:54:21.955684	2013-05-09 23:54:21.955684
30074	15	4	13	2013-05-09 23:54:21.957151	2013-05-09 23:54:21.957151
30075	15	5	13	2013-05-09 23:54:21.95775	2013-05-09 23:54:21.95775
30076	15	6	13	2013-05-09 23:54:21.95834	2013-05-09 23:54:21.95834
30077	15	7	13	2013-05-09 23:54:21.95892	2013-05-09 23:54:21.95892
30078	15	8	13	2013-05-09 23:54:21.959507	2013-05-09 23:54:21.959507
30079	15	9	13	2013-05-09 23:54:21.960135	2013-05-09 23:54:21.960135
30080	15	10	13	2013-05-09 23:54:21.960722	2013-05-09 23:54:21.960722
30081	15	27	13	2013-05-09 23:54:21.962117	2013-05-09 23:54:21.962117
30082	15	28	13	2013-05-09 23:54:21.962735	2013-05-09 23:54:21.962735
30083	15	29	13	2013-05-09 23:54:21.963403	2013-05-09 23:54:21.963403
30084	15	4	14	2013-05-09 23:54:21.964904	2013-05-09 23:54:21.964904
30085	15	5	14	2013-05-09 23:54:21.965512	2013-05-09 23:54:21.965512
30086	15	6	14	2013-05-09 23:54:21.966092	2013-05-09 23:54:21.966092
30087	15	7	14	2013-05-09 23:54:21.966716	2013-05-09 23:54:21.966716
30088	15	8	14	2013-05-09 23:54:21.967327	2013-05-09 23:54:21.967327
30089	15	9	14	2013-05-09 23:54:21.967927	2013-05-09 23:54:21.967927
30090	15	10	14	2013-05-09 23:54:21.968546	2013-05-09 23:54:21.968546
30091	15	27	14	2013-05-09 23:54:21.969882	2013-05-09 23:54:21.969882
30092	15	28	14	2013-05-09 23:54:21.970506	2013-05-09 23:54:21.970506
30093	15	29	14	2013-05-09 23:54:21.971241	2013-05-09 23:54:21.971241
30094	15	27	15	2013-05-09 23:54:21.971979	2013-05-09 23:54:21.971979
30095	15	28	15	2013-05-09 23:54:21.972632	2013-05-09 23:54:21.972632
30096	15	29	15	2013-05-09 23:54:21.973258	2013-05-09 23:54:21.973258
30097	15	27	16	2013-05-09 23:54:21.974644	2013-05-09 23:54:21.974644
30098	15	28	16	2013-05-09 23:54:21.975261	2013-05-09 23:54:21.975261
30099	15	29	16	2013-05-09 23:54:21.975838	2013-05-09 23:54:21.975838
30100	15	0	17	2013-05-09 23:54:21.97642	2013-05-09 23:54:21.97642
30101	15	1	17	2013-05-09 23:54:21.97701	2013-05-09 23:54:21.97701
30102	15	2	17	2013-05-09 23:54:21.977625	2013-05-09 23:54:21.977625
30103	15	3	17	2013-05-09 23:54:21.978241	2013-05-09 23:54:21.978241
30104	15	4	17	2013-05-09 23:54:21.978819	2013-05-09 23:54:21.978819
30105	15	5	17	2013-05-09 23:54:21.979402	2013-05-09 23:54:21.979402
30106	15	6	17	2013-05-09 23:54:21.979976	2013-05-09 23:54:21.979976
30107	15	7	17	2013-05-09 23:54:21.980571	2013-05-09 23:54:21.980571
30108	15	8	17	2013-05-09 23:54:21.981151	2013-05-09 23:54:21.981151
30109	15	9	17	2013-05-09 23:54:21.981756	2013-05-09 23:54:21.981756
30110	15	10	17	2013-05-09 23:54:21.982335	2013-05-09 23:54:21.982335
30111	15	27	17	2013-05-09 23:54:21.982933	2013-05-09 23:54:21.982933
30112	15	28	17	2013-05-09 23:54:21.983506	2013-05-09 23:54:21.983506
30113	15	29	17	2013-05-09 23:54:21.984085	2013-05-09 23:54:21.984085
30114	15	30	17	2013-05-09 23:54:21.984661	2013-05-09 23:54:21.984661
30115	15	31	17	2013-05-09 23:54:21.985265	2013-05-09 23:54:21.985265
30116	15	32	17	2013-05-09 23:54:21.985846	2013-05-09 23:54:21.985846
30117	15	33	17	2013-05-09 23:54:21.986425	2013-05-09 23:54:21.986425
30118	15	34	17	2013-05-09 23:54:21.986999	2013-05-09 23:54:21.986999
30119	15	35	17	2013-05-09 23:54:21.987575	2013-05-09 23:54:21.987575
30120	15	0	18	2013-05-09 23:54:21.988156	2013-05-09 23:54:21.988156
30121	15	1	18	2013-05-09 23:54:21.988733	2013-05-09 23:54:21.988733
30122	15	2	18	2013-05-09 23:54:21.989328	2013-05-09 23:54:21.989328
30123	15	3	18	2013-05-09 23:54:21.990046	2013-05-09 23:54:21.990046
30124	15	4	18	2013-05-09 23:54:21.990759	2013-05-09 23:54:21.990759
30125	15	5	18	2013-05-09 23:54:21.991562	2013-05-09 23:54:21.991562
30126	15	6	18	2013-05-09 23:54:21.99246	2013-05-09 23:54:21.99246
30127	15	7	18	2013-05-09 23:54:21.993084	2013-05-09 23:54:21.993084
30128	15	8	18	2013-05-09 23:54:21.993683	2013-05-09 23:54:21.993683
30129	15	9	18	2013-05-09 23:54:21.994318	2013-05-09 23:54:21.994318
30130	15	10	18	2013-05-09 23:54:21.994914	2013-05-09 23:54:21.994914
30131	15	27	18	2013-05-09 23:54:21.996339	2013-05-09 23:54:21.996339
30132	15	28	18	2013-05-09 23:54:21.996956	2013-05-09 23:54:21.996956
30133	15	29	18	2013-05-09 23:54:21.997551	2013-05-09 23:54:21.997551
30134	15	30	18	2013-05-09 23:54:21.998151	2013-05-09 23:54:21.998151
30135	15	31	18	2013-05-09 23:54:21.998775	2013-05-09 23:54:21.998775
30136	15	32	18	2013-05-09 23:54:21.999502	2013-05-09 23:54:21.999502
30137	15	33	18	2013-05-09 23:54:22.000187	2013-05-09 23:54:22.000187
30138	15	34	18	2013-05-09 23:54:22.000796	2013-05-09 23:54:22.000796
30139	15	35	18	2013-05-09 23:54:22.00139	2013-05-09 23:54:22.00139
30140	15	0	19	2013-05-09 23:54:22.001984	2013-05-09 23:54:22.001984
30141	15	1	19	2013-05-09 23:54:22.002581	2013-05-09 23:54:22.002581
30142	15	2	19	2013-05-09 23:54:22.00321	2013-05-09 23:54:22.00321
30143	15	3	19	2013-05-09 23:54:22.003841	2013-05-09 23:54:22.003841
30144	15	4	19	2013-05-09 23:54:22.004443	2013-05-09 23:54:22.004443
30145	15	5	19	2013-05-09 23:54:22.005039	2013-05-09 23:54:22.005039
30146	15	6	19	2013-05-09 23:54:22.005642	2013-05-09 23:54:22.005642
30147	15	7	19	2013-05-09 23:54:22.006237	2013-05-09 23:54:22.006237
30148	15	8	19	2013-05-09 23:54:22.006831	2013-05-09 23:54:22.006831
30149	15	9	19	2013-05-09 23:54:22.007432	2013-05-09 23:54:22.007432
30150	15	10	19	2013-05-09 23:54:22.008042	2013-05-09 23:54:22.008042
30151	15	27	19	2013-05-09 23:54:22.008666	2013-05-09 23:54:22.008666
30152	15	28	19	2013-05-09 23:54:22.009266	2013-05-09 23:54:22.009266
30153	15	29	19	2013-05-09 23:54:22.009997	2013-05-09 23:54:22.009997
30154	15	30	19	2013-05-09 23:54:22.010813	2013-05-09 23:54:22.010813
30155	15	31	19	2013-05-09 23:54:22.011589	2013-05-09 23:54:22.011589
30156	15	32	19	2013-05-09 23:54:22.012328	2013-05-09 23:54:22.012328
30157	15	33	19	2013-05-09 23:54:22.013066	2013-05-09 23:54:22.013066
30158	15	34	19	2013-05-09 23:54:22.013745	2013-05-09 23:54:22.013745
30159	15	35	19	2013-05-09 23:54:22.014387	2013-05-09 23:54:22.014387
30160	29	16	0	2013-05-09 23:55:08.58126	2013-05-09 23:55:08.58126
30161	29	17	0	2013-05-09 23:55:08.582114	2013-05-09 23:55:08.582114
30162	29	18	0	2013-05-09 23:55:08.582812	2013-05-09 23:55:08.582812
30163	29	19	0	2013-05-09 23:55:08.583414	2013-05-09 23:55:08.583414
30164	29	16	1	2013-05-09 23:55:08.584052	2013-05-09 23:55:08.584052
30165	29	17	1	2013-05-09 23:55:08.584646	2013-05-09 23:55:08.584646
30166	29	18	1	2013-05-09 23:55:08.585274	2013-05-09 23:55:08.585274
30167	29	19	1	2013-05-09 23:55:08.586047	2013-05-09 23:55:08.586047
30168	29	16	2	2013-05-09 23:55:08.58684	2013-05-09 23:55:08.58684
30169	29	17	2	2013-05-09 23:55:08.58755	2013-05-09 23:55:08.58755
30170	29	18	2	2013-05-09 23:55:08.588179	2013-05-09 23:55:08.588179
30171	29	19	2	2013-05-09 23:55:08.588785	2013-05-09 23:55:08.588785
30172	29	16	3	2013-05-09 23:55:08.589424	2013-05-09 23:55:08.589424
30173	29	17	3	2013-05-09 23:55:08.590017	2013-05-09 23:55:08.590017
30174	29	18	3	2013-05-09 23:55:08.590611	2013-05-09 23:55:08.590611
30175	29	19	3	2013-05-09 23:55:08.591278	2013-05-09 23:55:08.591278
30176	29	16	4	2013-05-09 23:55:08.591916	2013-05-09 23:55:08.591916
30177	29	17	4	2013-05-09 23:55:08.592526	2013-05-09 23:55:08.592526
30178	29	18	4	2013-05-09 23:55:08.593119	2013-05-09 23:55:08.593119
30179	29	19	4	2013-05-09 23:55:08.59371	2013-05-09 23:55:08.59371
30180	29	16	5	2013-05-09 23:55:08.594446	2013-05-09 23:55:08.594446
30181	29	17	5	2013-05-09 23:55:08.595043	2013-05-09 23:55:08.595043
30182	29	18	5	2013-05-09 23:55:08.595632	2013-05-09 23:55:08.595632
30183	29	19	5	2013-05-09 23:55:08.596217	2013-05-09 23:55:08.596217
30184	29	0	7	2013-05-09 23:55:08.597873	2013-05-09 23:55:08.597873
30185	29	1	7	2013-05-09 23:55:08.598561	2013-05-09 23:55:08.598561
30186	29	2	7	2013-05-09 23:55:08.59916	2013-05-09 23:55:08.59916
30187	29	3	7	2013-05-09 23:55:08.599753	2013-05-09 23:55:08.599753
30188	29	4	7	2013-05-09 23:55:08.600358	2013-05-09 23:55:08.600358
30189	29	5	7	2013-05-09 23:55:08.600947	2013-05-09 23:55:08.600947
30190	29	6	7	2013-05-09 23:55:08.601578	2013-05-09 23:55:08.601578
30191	29	7	7	2013-05-09 23:55:08.60222	2013-05-09 23:55:08.60222
30192	29	8	7	2013-05-09 23:55:08.602843	2013-05-09 23:55:08.602843
30193	29	9	7	2013-05-09 23:55:08.603428	2013-05-09 23:55:08.603428
30194	29	10	7	2013-05-09 23:55:08.604012	2013-05-09 23:55:08.604012
30195	29	11	7	2013-05-09 23:55:08.6046	2013-05-09 23:55:08.6046
30196	29	12	7	2013-05-09 23:55:08.605181	2013-05-09 23:55:08.605181
30197	29	13	7	2013-05-09 23:55:08.605798	2013-05-09 23:55:08.605798
30198	29	22	7	2013-05-09 23:55:08.606397	2013-05-09 23:55:08.606397
30199	29	23	7	2013-05-09 23:55:08.606986	2013-05-09 23:55:08.606986
30200	29	24	7	2013-05-09 23:55:08.607572	2013-05-09 23:55:08.607572
30201	29	25	7	2013-05-09 23:55:08.60816	2013-05-09 23:55:08.60816
30202	29	26	7	2013-05-09 23:55:08.608744	2013-05-09 23:55:08.608744
30203	29	27	7	2013-05-09 23:55:08.60938	2013-05-09 23:55:08.60938
30204	29	28	7	2013-05-09 23:55:08.609967	2013-05-09 23:55:08.609967
30205	29	29	7	2013-05-09 23:55:08.610576	2013-05-09 23:55:08.610576
30206	29	30	7	2013-05-09 23:55:08.611203	2013-05-09 23:55:08.611203
30207	29	31	7	2013-05-09 23:55:08.611796	2013-05-09 23:55:08.611796
30208	29	32	7	2013-05-09 23:55:08.612387	2013-05-09 23:55:08.612387
30209	29	33	7	2013-05-09 23:55:08.61298	2013-05-09 23:55:08.61298
30210	29	34	7	2013-05-09 23:55:08.6137	2013-05-09 23:55:08.6137
30211	29	35	7	2013-05-09 23:55:08.614441	2013-05-09 23:55:08.614441
30212	29	0	8	2013-05-09 23:55:08.615116	2013-05-09 23:55:08.615116
30213	29	1	8	2013-05-09 23:55:08.61596	2013-05-09 23:55:08.61596
30214	29	2	8	2013-05-09 23:55:08.616668	2013-05-09 23:55:08.616668
30215	29	3	8	2013-05-09 23:55:08.617406	2013-05-09 23:55:08.617406
30216	29	4	8	2013-05-09 23:55:08.618079	2013-05-09 23:55:08.618079
30217	29	5	8	2013-05-09 23:55:08.618693	2013-05-09 23:55:08.618693
30218	29	6	8	2013-05-09 23:55:08.619301	2013-05-09 23:55:08.619301
30219	29	7	8	2013-05-09 23:55:08.61989	2013-05-09 23:55:08.61989
30220	29	8	8	2013-05-09 23:55:08.620495	2013-05-09 23:55:08.620495
30221	29	9	8	2013-05-09 23:55:08.621082	2013-05-09 23:55:08.621082
30222	29	10	8	2013-05-09 23:55:08.621767	2013-05-09 23:55:08.621767
30223	29	11	8	2013-05-09 23:55:08.622406	2013-05-09 23:55:08.622406
30224	29	12	8	2013-05-09 23:55:08.622993	2013-05-09 23:55:08.622993
30225	29	13	8	2013-05-09 23:55:08.623579	2013-05-09 23:55:08.623579
30226	29	22	8	2013-05-09 23:55:08.625651	2013-05-09 23:55:08.625651
30227	29	23	8	2013-05-09 23:55:08.626257	2013-05-09 23:55:08.626257
30228	29	24	8	2013-05-09 23:55:08.626874	2013-05-09 23:55:08.626874
30229	29	25	8	2013-05-09 23:55:08.627464	2013-05-09 23:55:08.627464
30230	29	26	8	2013-05-09 23:55:08.628057	2013-05-09 23:55:08.628057
30231	29	27	8	2013-05-09 23:55:08.628636	2013-05-09 23:55:08.628636
30232	29	28	8	2013-05-09 23:55:08.629369	2013-05-09 23:55:08.629369
30233	29	29	8	2013-05-09 23:55:08.63009	2013-05-09 23:55:08.63009
30234	29	30	8	2013-05-09 23:55:08.630724	2013-05-09 23:55:08.630724
30235	29	31	8	2013-05-09 23:55:08.631555	2013-05-09 23:55:08.631555
30236	29	32	8	2013-05-09 23:55:08.632169	2013-05-09 23:55:08.632169
30237	29	33	8	2013-05-09 23:55:08.632879	2013-05-09 23:55:08.632879
30238	29	34	8	2013-05-09 23:55:08.633618	2013-05-09 23:55:08.633618
30239	29	35	8	2013-05-09 23:55:08.634421	2013-05-09 23:55:08.634421
30240	29	0	14	2013-05-09 23:55:08.637361	2013-05-09 23:55:08.637361
30241	29	1	14	2013-05-09 23:55:08.638133	2013-05-09 23:55:08.638133
30242	29	2	14	2013-05-09 23:55:08.638736	2013-05-09 23:55:08.638736
30243	29	3	14	2013-05-09 23:55:08.639342	2013-05-09 23:55:08.639342
30244	29	4	14	2013-05-09 23:55:08.640054	2013-05-09 23:55:08.640054
30245	29	5	14	2013-05-09 23:55:08.640743	2013-05-09 23:55:08.640743
30246	29	6	14	2013-05-09 23:55:08.641338	2013-05-09 23:55:08.641338
30247	29	7	14	2013-05-09 23:55:08.641929	2013-05-09 23:55:08.641929
30248	29	8	14	2013-05-09 23:55:08.642574	2013-05-09 23:55:08.642574
30249	29	9	14	2013-05-09 23:55:08.643179	2013-05-09 23:55:08.643179
30250	29	10	14	2013-05-09 23:55:08.643782	2013-05-09 23:55:08.643782
30251	29	11	14	2013-05-09 23:55:08.644518	2013-05-09 23:55:08.644518
30252	29	12	14	2013-05-09 23:55:08.645412	2013-05-09 23:55:08.645412
30253	29	13	14	2013-05-09 23:55:08.646136	2013-05-09 23:55:08.646136
30254	29	22	14	2013-05-09 23:55:08.648181	2013-05-09 23:55:08.648181
30255	29	23	14	2013-05-09 23:55:08.648784	2013-05-09 23:55:08.648784
30256	29	24	14	2013-05-09 23:55:08.649377	2013-05-09 23:55:08.649377
30257	29	25	14	2013-05-09 23:55:08.649985	2013-05-09 23:55:08.649985
30258	29	26	14	2013-05-09 23:55:08.650649	2013-05-09 23:55:08.650649
30259	29	27	14	2013-05-09 23:55:08.651329	2013-05-09 23:55:08.651329
30260	29	28	14	2013-05-09 23:55:08.652071	2013-05-09 23:55:08.652071
30261	29	29	14	2013-05-09 23:55:08.652698	2013-05-09 23:55:08.652698
30262	29	30	14	2013-05-09 23:55:08.653346	2013-05-09 23:55:08.653346
30263	29	31	14	2013-05-09 23:55:08.654004	2013-05-09 23:55:08.654004
30264	29	32	14	2013-05-09 23:55:08.654629	2013-05-09 23:55:08.654629
30265	29	33	14	2013-05-09 23:55:08.655214	2013-05-09 23:55:08.655214
30266	29	34	14	2013-05-09 23:55:08.655818	2013-05-09 23:55:08.655818
30267	29	35	14	2013-05-09 23:55:08.656437	2013-05-09 23:55:08.656437
30268	29	0	15	2013-05-09 23:55:08.657032	2013-05-09 23:55:08.657032
30269	29	1	15	2013-05-09 23:55:08.657616	2013-05-09 23:55:08.657616
30270	29	2	15	2013-05-09 23:55:08.658202	2013-05-09 23:55:08.658202
30271	29	3	15	2013-05-09 23:55:08.658832	2013-05-09 23:55:08.658832
30272	29	4	15	2013-05-09 23:55:08.659476	2013-05-09 23:55:08.659476
30273	29	5	15	2013-05-09 23:55:08.660088	2013-05-09 23:55:08.660088
30274	29	6	15	2013-05-09 23:55:08.660787	2013-05-09 23:55:08.660787
30275	29	7	15	2013-05-09 23:55:08.66145	2013-05-09 23:55:08.66145
30276	29	8	15	2013-05-09 23:55:08.662089	2013-05-09 23:55:08.662089
30277	29	9	15	2013-05-09 23:55:08.662774	2013-05-09 23:55:08.662774
30278	29	10	15	2013-05-09 23:55:08.663366	2013-05-09 23:55:08.663366
30279	29	11	15	2013-05-09 23:55:08.663954	2013-05-09 23:55:08.663954
30280	29	12	15	2013-05-09 23:55:08.664535	2013-05-09 23:55:08.664535
30281	29	13	15	2013-05-09 23:55:08.665122	2013-05-09 23:55:08.665122
30282	29	22	15	2013-05-09 23:55:08.665714	2013-05-09 23:55:08.665714
30283	29	23	15	2013-05-09 23:55:08.666297	2013-05-09 23:55:08.666297
30284	29	24	15	2013-05-09 23:55:08.666959	2013-05-09 23:55:08.666959
30285	29	25	15	2013-05-09 23:55:08.667553	2013-05-09 23:55:08.667553
30286	29	26	15	2013-05-09 23:55:08.668162	2013-05-09 23:55:08.668162
30287	29	27	15	2013-05-09 23:55:08.668749	2013-05-09 23:55:08.668749
30288	29	28	15	2013-05-09 23:55:08.669371	2013-05-09 23:55:08.669371
30289	29	29	15	2013-05-09 23:55:08.670052	2013-05-09 23:55:08.670052
30290	29	30	15	2013-05-09 23:55:08.670641	2013-05-09 23:55:08.670641
30291	29	31	15	2013-05-09 23:55:08.671227	2013-05-09 23:55:08.671227
30292	29	32	15	2013-05-09 23:55:08.671807	2013-05-09 23:55:08.671807
30293	29	33	15	2013-05-09 23:55:08.67239	2013-05-09 23:55:08.67239
30294	29	34	15	2013-05-09 23:55:08.673047	2013-05-09 23:55:08.673047
30295	29	35	15	2013-05-09 23:55:08.673646	2013-05-09 23:55:08.673646
30296	29	16	17	2013-05-09 23:55:08.67509	2013-05-09 23:55:08.67509
30297	29	17	17	2013-05-09 23:55:08.675802	2013-05-09 23:55:08.675802
30298	29	18	17	2013-05-09 23:55:08.676542	2013-05-09 23:55:08.676542
30299	29	19	17	2013-05-09 23:55:08.677323	2013-05-09 23:55:08.677323
30300	29	16	18	2013-05-09 23:55:08.678083	2013-05-09 23:55:08.678083
30301	29	17	18	2013-05-09 23:55:08.678677	2013-05-09 23:55:08.678677
30302	29	18	18	2013-05-09 23:55:08.679395	2013-05-09 23:55:08.679395
30303	29	19	18	2013-05-09 23:55:08.680057	2013-05-09 23:55:08.680057
30304	29	16	19	2013-05-09 23:55:08.68231	2013-05-09 23:55:08.68231
30305	29	17	19	2013-05-09 23:55:08.68291	2013-05-09 23:55:08.68291
30306	29	18	19	2013-05-09 23:55:08.683498	2013-05-09 23:55:08.683498
30307	29	19	19	2013-05-09 23:55:08.68408	2013-05-09 23:55:08.68408
30308	29	16	20	2013-05-09 23:55:08.686472	2013-05-09 23:55:08.686472
30309	29	17	20	2013-05-09 23:55:08.687167	2013-05-09 23:55:08.687167
30310	29	18	20	2013-05-09 23:55:08.687758	2013-05-09 23:55:08.687758
30311	29	19	20	2013-05-09 23:55:08.688344	2013-05-09 23:55:08.688344
30312	29	16	21	2013-05-09 23:55:08.688969	2013-05-09 23:55:08.688969
30313	29	17	21	2013-05-09 23:55:08.689549	2013-05-09 23:55:08.689549
30314	29	18	21	2013-05-09 23:55:08.690159	2013-05-09 23:55:08.690159
30315	29	19	21	2013-05-09 23:55:08.69087	2013-05-09 23:55:08.69087
30316	19	14	0	2013-05-09 23:55:54.323186	2013-05-09 23:55:54.323186
30317	19	15	0	2013-05-09 23:55:54.324095	2013-05-09 23:55:54.324095
30318	19	16	0	2013-05-09 23:55:54.324721	2013-05-09 23:55:54.324721
30319	19	17	0	2013-05-09 23:55:54.325325	2013-05-09 23:55:54.325325
30320	19	18	0	2013-05-09 23:55:54.325924	2013-05-09 23:55:54.325924
30321	19	19	0	2013-05-09 23:55:54.32652	2013-05-09 23:55:54.32652
30322	19	20	0	2013-05-09 23:55:54.327113	2013-05-09 23:55:54.327113
30323	19	21	0	2013-05-09 23:55:54.327703	2013-05-09 23:55:54.327703
30324	19	14	1	2013-05-09 23:55:54.329142	2013-05-09 23:55:54.329142
30325	19	15	1	2013-05-09 23:55:54.329751	2013-05-09 23:55:54.329751
30326	19	16	1	2013-05-09 23:55:54.330376	2013-05-09 23:55:54.330376
30327	19	17	1	2013-05-09 23:55:54.33097	2013-05-09 23:55:54.33097
30328	19	18	1	2013-05-09 23:55:54.33156	2013-05-09 23:55:54.33156
30329	19	19	1	2013-05-09 23:55:54.332155	2013-05-09 23:55:54.332155
30330	19	20	1	2013-05-09 23:55:54.332747	2013-05-09 23:55:54.332747
30331	19	21	1	2013-05-09 23:55:54.333338	2013-05-09 23:55:54.333338
30332	19	14	2	2013-05-09 23:55:54.334692	2013-05-09 23:55:54.334692
30333	19	15	2	2013-05-09 23:55:54.335367	2013-05-09 23:55:54.335367
30334	19	16	2	2013-05-09 23:55:54.336062	2013-05-09 23:55:54.336062
30335	19	17	2	2013-05-09 23:55:54.336774	2013-05-09 23:55:54.336774
30336	19	18	2	2013-05-09 23:55:54.33751	2013-05-09 23:55:54.33751
30337	19	19	2	2013-05-09 23:55:54.338248	2013-05-09 23:55:54.338248
30338	19	20	2	2013-05-09 23:55:54.338953	2013-05-09 23:55:54.338953
30339	19	21	2	2013-05-09 23:55:54.339601	2013-05-09 23:55:54.339601
30340	19	0	3	2013-05-09 23:55:54.340249	2013-05-09 23:55:54.340249
30341	19	1	3	2013-05-09 23:55:54.340874	2013-05-09 23:55:54.340874
30342	19	2	3	2013-05-09 23:55:54.341562	2013-05-09 23:55:54.341562
30343	19	3	3	2013-05-09 23:55:54.342212	2013-05-09 23:55:54.342212
30344	19	4	3	2013-05-09 23:55:54.342806	2013-05-09 23:55:54.342806
30345	19	5	3	2013-05-09 23:55:54.343395	2013-05-09 23:55:54.343395
30346	19	6	3	2013-05-09 23:55:54.34399	2013-05-09 23:55:54.34399
30347	19	7	3	2013-05-09 23:55:54.344659	2013-05-09 23:55:54.344659
30348	19	8	3	2013-05-09 23:55:54.345268	2013-05-09 23:55:54.345268
30349	19	9	3	2013-05-09 23:55:54.345858	2013-05-09 23:55:54.345858
30350	19	10	3	2013-05-09 23:55:54.346447	2013-05-09 23:55:54.346447
30351	19	11	3	2013-05-09 23:55:54.347054	2013-05-09 23:55:54.347054
30352	19	14	3	2013-05-09 23:55:54.34765	2013-05-09 23:55:54.34765
30353	19	15	3	2013-05-09 23:55:54.348235	2013-05-09 23:55:54.348235
30354	19	16	3	2013-05-09 23:55:54.348849	2013-05-09 23:55:54.348849
30355	19	17	3	2013-05-09 23:55:54.349508	2013-05-09 23:55:54.349508
30356	19	18	3	2013-05-09 23:55:54.35013	2013-05-09 23:55:54.35013
30357	19	19	3	2013-05-09 23:55:54.35073	2013-05-09 23:55:54.35073
30358	19	20	3	2013-05-09 23:55:54.351348	2013-05-09 23:55:54.351348
30359	19	21	3	2013-05-09 23:55:54.351933	2013-05-09 23:55:54.351933
30360	19	24	3	2013-05-09 23:55:54.352523	2013-05-09 23:55:54.352523
30361	19	25	3	2013-05-09 23:55:54.353119	2013-05-09 23:55:54.353119
30362	19	26	3	2013-05-09 23:55:54.353702	2013-05-09 23:55:54.353702
30363	19	27	3	2013-05-09 23:55:54.354503	2013-05-09 23:55:54.354503
30364	19	28	3	2013-05-09 23:55:54.355148	2013-05-09 23:55:54.355148
30365	19	29	3	2013-05-09 23:55:54.355763	2013-05-09 23:55:54.355763
30366	19	30	3	2013-05-09 23:55:54.356528	2013-05-09 23:55:54.356528
30367	19	31	3	2013-05-09 23:55:54.357214	2013-05-09 23:55:54.357214
30368	19	32	3	2013-05-09 23:55:54.357866	2013-05-09 23:55:54.357866
30369	19	33	3	2013-05-09 23:55:54.358466	2013-05-09 23:55:54.358466
30370	19	34	3	2013-05-09 23:55:54.35913	2013-05-09 23:55:54.35913
30371	19	35	3	2013-05-09 23:55:54.359812	2013-05-09 23:55:54.359812
30372	19	0	4	2013-05-09 23:55:54.360437	2013-05-09 23:55:54.360437
30373	19	1	4	2013-05-09 23:55:54.361025	2013-05-09 23:55:54.361025
30374	19	2	4	2013-05-09 23:55:54.361609	2013-05-09 23:55:54.361609
30375	19	3	4	2013-05-09 23:55:54.362196	2013-05-09 23:55:54.362196
30376	19	4	4	2013-05-09 23:55:54.362826	2013-05-09 23:55:54.362826
30377	19	5	4	2013-05-09 23:55:54.363477	2013-05-09 23:55:54.363477
30378	19	6	4	2013-05-09 23:55:54.364071	2013-05-09 23:55:54.364071
30379	19	7	4	2013-05-09 23:55:54.364686	2013-05-09 23:55:54.364686
30380	19	8	4	2013-05-09 23:55:54.365303	2013-05-09 23:55:54.365303
30381	19	9	4	2013-05-09 23:55:54.365965	2013-05-09 23:55:54.365965
30382	19	10	4	2013-05-09 23:55:54.3666	2013-05-09 23:55:54.3666
30383	19	11	4	2013-05-09 23:55:54.367183	2013-05-09 23:55:54.367183
30384	19	14	4	2013-05-09 23:55:54.369382	2013-05-09 23:55:54.369382
30385	19	15	4	2013-05-09 23:55:54.370016	2013-05-09 23:55:54.370016
30386	19	16	4	2013-05-09 23:55:54.370689	2013-05-09 23:55:54.370689
30387	19	17	4	2013-05-09 23:55:54.371364	2013-05-09 23:55:54.371364
30388	19	18	4	2013-05-09 23:55:54.372044	2013-05-09 23:55:54.372044
30389	19	19	4	2013-05-09 23:55:54.372701	2013-05-09 23:55:54.372701
30390	19	20	4	2013-05-09 23:55:54.373346	2013-05-09 23:55:54.373346
30391	19	21	4	2013-05-09 23:55:54.373989	2013-05-09 23:55:54.373989
30392	19	24	4	2013-05-09 23:55:54.376004	2013-05-09 23:55:54.376004
30393	19	25	4	2013-05-09 23:55:54.376603	2013-05-09 23:55:54.376603
30394	19	26	4	2013-05-09 23:55:54.377187	2013-05-09 23:55:54.377187
30395	19	27	4	2013-05-09 23:55:54.377804	2013-05-09 23:55:54.377804
30396	19	28	4	2013-05-09 23:55:54.378391	2013-05-09 23:55:54.378391
30397	19	29	4	2013-05-09 23:55:54.378974	2013-05-09 23:55:54.378974
30398	19	30	4	2013-05-09 23:55:54.379557	2013-05-09 23:55:54.379557
30399	19	31	4	2013-05-09 23:55:54.380145	2013-05-09 23:55:54.380145
30400	19	32	4	2013-05-09 23:55:54.380728	2013-05-09 23:55:54.380728
30401	19	33	4	2013-05-09 23:55:54.381373	2013-05-09 23:55:54.381373
30402	19	34	4	2013-05-09 23:55:54.381998	2013-05-09 23:55:54.381998
30403	19	35	4	2013-05-09 23:55:54.382729	2013-05-09 23:55:54.382729
30404	19	0	5	2013-05-09 23:55:54.383337	2013-05-09 23:55:54.383337
30405	19	1	5	2013-05-09 23:55:54.383944	2013-05-09 23:55:54.383944
30406	19	2	5	2013-05-09 23:55:54.384532	2013-05-09 23:55:54.384532
30407	19	3	5	2013-05-09 23:55:54.385132	2013-05-09 23:55:54.385132
30408	19	4	5	2013-05-09 23:55:54.385812	2013-05-09 23:55:54.385812
30409	19	5	5	2013-05-09 23:55:54.386414	2013-05-09 23:55:54.386414
30410	19	6	5	2013-05-09 23:55:54.387122	2013-05-09 23:55:54.387122
30411	19	7	5	2013-05-09 23:55:54.38771	2013-05-09 23:55:54.38771
30412	19	8	5	2013-05-09 23:55:54.388301	2013-05-09 23:55:54.388301
30413	19	9	5	2013-05-09 23:55:54.388878	2013-05-09 23:55:54.388878
30414	19	10	5	2013-05-09 23:55:54.389535	2013-05-09 23:55:54.389535
30415	19	11	5	2013-05-09 23:55:54.390167	2013-05-09 23:55:54.390167
30416	19	14	5	2013-05-09 23:55:54.390776	2013-05-09 23:55:54.390776
30417	19	15	5	2013-05-09 23:55:54.391351	2013-05-09 23:55:54.391351
30418	19	16	5	2013-05-09 23:55:54.391932	2013-05-09 23:55:54.391932
30419	19	17	5	2013-05-09 23:55:54.392514	2013-05-09 23:55:54.392514
30420	19	18	5	2013-05-09 23:55:54.393117	2013-05-09 23:55:54.393117
30421	19	19	5	2013-05-09 23:55:54.393697	2013-05-09 23:55:54.393697
30422	19	20	5	2013-05-09 23:55:54.394275	2013-05-09 23:55:54.394275
30423	19	21	5	2013-05-09 23:55:54.39485	2013-05-09 23:55:54.39485
30424	19	24	5	2013-05-09 23:55:54.39543	2013-05-09 23:55:54.39543
30425	19	25	5	2013-05-09 23:55:54.396007	2013-05-09 23:55:54.396007
30426	19	26	5	2013-05-09 23:55:54.396582	2013-05-09 23:55:54.396582
30427	19	27	5	2013-05-09 23:55:54.397168	2013-05-09 23:55:54.397168
30428	19	28	5	2013-05-09 23:55:54.397821	2013-05-09 23:55:54.397821
30429	19	29	5	2013-05-09 23:55:54.398402	2013-05-09 23:55:54.398402
30430	19	30	5	2013-05-09 23:55:54.398982	2013-05-09 23:55:54.398982
30431	19	31	5	2013-05-09 23:55:54.399559	2013-05-09 23:55:54.399559
30432	19	32	5	2013-05-09 23:55:54.400139	2013-05-09 23:55:54.400139
30433	19	33	5	2013-05-09 23:55:54.40079	2013-05-09 23:55:54.40079
30434	19	34	5	2013-05-09 23:55:54.401534	2013-05-09 23:55:54.401534
30435	19	35	5	2013-05-09 23:55:54.402222	2013-05-09 23:55:54.402222
30436	19	0	6	2013-05-09 23:55:54.40287	2013-05-09 23:55:54.40287
30437	19	1	6	2013-05-09 23:55:54.403451	2013-05-09 23:55:54.403451
30438	19	2	6	2013-05-09 23:55:54.404068	2013-05-09 23:55:54.404068
30439	19	3	6	2013-05-09 23:55:54.404758	2013-05-09 23:55:54.404758
30440	19	32	6	2013-05-09 23:55:54.405451	2013-05-09 23:55:54.405451
30441	19	33	6	2013-05-09 23:55:54.40606	2013-05-09 23:55:54.40606
30442	19	34	6	2013-05-09 23:55:54.406673	2013-05-09 23:55:54.406673
30443	19	35	6	2013-05-09 23:55:54.40726	2013-05-09 23:55:54.40726
30444	19	0	7	2013-05-09 23:55:54.407898	2013-05-09 23:55:54.407898
30445	19	1	7	2013-05-09 23:55:54.4085	2013-05-09 23:55:54.4085
30446	19	2	7	2013-05-09 23:55:54.409107	2013-05-09 23:55:54.409107
30447	19	3	7	2013-05-09 23:55:54.409722	2013-05-09 23:55:54.409722
30448	19	32	7	2013-05-09 23:55:54.410375	2013-05-09 23:55:54.410375
30449	19	33	7	2013-05-09 23:55:54.410981	2013-05-09 23:55:54.410981
30450	19	34	7	2013-05-09 23:55:54.411565	2013-05-09 23:55:54.411565
30451	19	35	7	2013-05-09 23:55:54.412148	2013-05-09 23:55:54.412148
30452	19	0	8	2013-05-09 23:55:54.412732	2013-05-09 23:55:54.412732
30453	19	1	8	2013-05-09 23:55:54.413374	2013-05-09 23:55:54.413374
30454	19	2	8	2013-05-09 23:55:54.414012	2013-05-09 23:55:54.414012
30455	19	3	8	2013-05-09 23:55:54.414679	2013-05-09 23:55:54.414679
30456	19	32	8	2013-05-09 23:55:54.444098	2013-05-09 23:55:54.444098
30457	19	33	8	2013-05-09 23:55:54.445154	2013-05-09 23:55:54.445154
30458	19	34	8	2013-05-09 23:55:54.446194	2013-05-09 23:55:54.446194
30459	19	35	8	2013-05-09 23:55:54.447147	2013-05-09 23:55:54.447147
30460	19	4	11	2013-05-09 23:55:54.455073	2013-05-09 23:55:54.455073
30461	19	5	11	2013-05-09 23:55:54.455828	2013-05-09 23:55:54.455828
30462	19	6	11	2013-05-09 23:55:54.456565	2013-05-09 23:55:54.456565
30463	19	7	11	2013-05-09 23:55:54.457468	2013-05-09 23:55:54.457468
30464	19	8	11	2013-05-09 23:55:54.458233	2013-05-09 23:55:54.458233
30465	19	9	11	2013-05-09 23:55:54.45888	2013-05-09 23:55:54.45888
30466	19	10	11	2013-05-09 23:55:54.459501	2013-05-09 23:55:54.459501
30467	19	11	11	2013-05-09 23:55:54.460123	2013-05-09 23:55:54.460123
30468	19	24	11	2013-05-09 23:55:54.463131	2013-05-09 23:55:54.463131
30469	19	25	11	2013-05-09 23:55:54.463754	2013-05-09 23:55:54.463754
30470	19	26	11	2013-05-09 23:55:54.46437	2013-05-09 23:55:54.46437
30471	19	27	11	2013-05-09 23:55:54.465125	2013-05-09 23:55:54.465125
30472	19	28	11	2013-05-09 23:55:54.465769	2013-05-09 23:55:54.465769
30473	19	29	11	2013-05-09 23:55:54.466397	2013-05-09 23:55:54.466397
30474	19	30	11	2013-05-09 23:55:54.467013	2013-05-09 23:55:54.467013
30475	19	31	11	2013-05-09 23:55:54.467642	2013-05-09 23:55:54.467642
30476	19	4	12	2013-05-09 23:55:54.468345	2013-05-09 23:55:54.468345
30477	19	5	12	2013-05-09 23:55:54.469164	2013-05-09 23:55:54.469164
30478	19	6	12	2013-05-09 23:55:54.470052	2013-05-09 23:55:54.470052
30479	19	7	12	2013-05-09 23:55:54.470728	2013-05-09 23:55:54.470728
30480	19	8	12	2013-05-09 23:55:54.47133	2013-05-09 23:55:54.47133
30481	19	9	12	2013-05-09 23:55:54.471994	2013-05-09 23:55:54.471994
30482	19	10	12	2013-05-09 23:55:54.472681	2013-05-09 23:55:54.472681
30483	19	11	12	2013-05-09 23:55:54.473437	2013-05-09 23:55:54.473437
30484	19	24	12	2013-05-09 23:55:54.474518	2013-05-09 23:55:54.474518
30485	19	25	12	2013-05-09 23:55:54.475246	2013-05-09 23:55:54.475246
30486	19	26	12	2013-05-09 23:55:54.475868	2013-05-09 23:55:54.475868
30487	19	27	12	2013-05-09 23:55:54.47656	2013-05-09 23:55:54.47656
30488	19	28	12	2013-05-09 23:55:54.477245	2013-05-09 23:55:54.477245
30489	19	29	12	2013-05-09 23:55:54.478003	2013-05-09 23:55:54.478003
30490	19	30	12	2013-05-09 23:55:54.478679	2013-05-09 23:55:54.478679
30491	19	31	12	2013-05-09 23:55:54.479345	2013-05-09 23:55:54.479345
30492	19	4	13	2013-05-09 23:55:54.479982	2013-05-09 23:55:54.479982
30493	19	5	13	2013-05-09 23:55:54.480603	2013-05-09 23:55:54.480603
30494	19	6	13	2013-05-09 23:55:54.481453	2013-05-09 23:55:54.481453
30495	19	7	13	2013-05-09 23:55:54.48242	2013-05-09 23:55:54.48242
30496	19	8	13	2013-05-09 23:55:54.483226	2013-05-09 23:55:54.483226
30497	19	9	13	2013-05-09 23:55:54.483898	2013-05-09 23:55:54.483898
30498	19	10	13	2013-05-09 23:55:54.484665	2013-05-09 23:55:54.484665
30499	19	11	13	2013-05-09 23:55:54.485389	2013-05-09 23:55:54.485389
30500	19	24	13	2013-05-09 23:55:54.4861	2013-05-09 23:55:54.4861
30501	19	25	13	2013-05-09 23:55:54.486708	2013-05-09 23:55:54.486708
30502	19	26	13	2013-05-09 23:55:54.487335	2013-05-09 23:55:54.487335
30503	19	27	13	2013-05-09 23:55:54.488091	2013-05-09 23:55:54.488091
30504	19	28	13	2013-05-09 23:55:54.488725	2013-05-09 23:55:54.488725
30505	19	29	13	2013-05-09 23:55:54.489332	2013-05-09 23:55:54.489332
30506	19	30	13	2013-05-09 23:55:54.489957	2013-05-09 23:55:54.489957
30507	19	31	13	2013-05-09 23:55:54.490584	2013-05-09 23:55:54.490584
30508	19	32	13	2013-05-09 23:55:54.491466	2013-05-09 23:55:54.491466
30509	19	33	13	2013-05-09 23:55:54.492229	2013-05-09 23:55:54.492229
30510	19	34	13	2013-05-09 23:55:54.492957	2013-05-09 23:55:54.492957
30511	19	35	13	2013-05-09 23:55:54.493696	2013-05-09 23:55:54.493696
30512	19	0	14	2013-05-09 23:55:54.494354	2013-05-09 23:55:54.494354
30513	19	1	14	2013-05-09 23:55:54.494983	2013-05-09 23:55:54.494983
30514	19	2	14	2013-05-09 23:55:54.495584	2013-05-09 23:55:54.495584
30515	19	3	14	2013-05-09 23:55:54.496205	2013-05-09 23:55:54.496205
30516	19	4	14	2013-05-09 23:55:54.496807	2013-05-09 23:55:54.496807
30517	19	5	14	2013-05-09 23:55:54.497473	2013-05-09 23:55:54.497473
30518	19	6	14	2013-05-09 23:55:54.498112	2013-05-09 23:55:54.498112
30519	19	7	14	2013-05-09 23:55:54.49881	2013-05-09 23:55:54.49881
30520	19	28	14	2013-05-09 23:55:54.499724	2013-05-09 23:55:54.499724
30521	19	29	14	2013-05-09 23:55:54.500439	2013-05-09 23:55:54.500439
30522	19	30	14	2013-05-09 23:55:54.501213	2013-05-09 23:55:54.501213
30523	19	31	14	2013-05-09 23:55:54.502012	2013-05-09 23:55:54.502012
30524	19	32	14	2013-05-09 23:55:54.502697	2013-05-09 23:55:54.502697
30525	19	33	14	2013-05-09 23:55:54.503305	2013-05-09 23:55:54.503305
30526	19	34	14	2013-05-09 23:55:54.503933	2013-05-09 23:55:54.503933
30527	19	35	14	2013-05-09 23:55:54.504548	2013-05-09 23:55:54.504548
30528	19	0	15	2013-05-09 23:55:54.505169	2013-05-09 23:55:54.505169
30529	19	1	15	2013-05-09 23:55:54.505814	2013-05-09 23:55:54.505814
30530	19	2	15	2013-05-09 23:55:54.506487	2013-05-09 23:55:54.506487
30531	19	3	15	2013-05-09 23:55:54.507088	2013-05-09 23:55:54.507088
30532	19	4	15	2013-05-09 23:55:54.507709	2013-05-09 23:55:54.507709
30533	19	5	15	2013-05-09 23:55:54.508327	2013-05-09 23:55:54.508327
30534	19	6	15	2013-05-09 23:55:54.508926	2013-05-09 23:55:54.508926
30535	19	7	15	2013-05-09 23:55:54.509658	2013-05-09 23:55:54.509658
30536	19	28	15	2013-05-09 23:55:54.510352	2013-05-09 23:55:54.510352
30537	19	29	15	2013-05-09 23:55:54.511015	2013-05-09 23:55:54.511015
30538	19	30	15	2013-05-09 23:55:54.511755	2013-05-09 23:55:54.511755
30539	19	31	15	2013-05-09 23:55:54.51241	2013-05-09 23:55:54.51241
30540	19	32	15	2013-05-09 23:55:54.513053	2013-05-09 23:55:54.513053
30541	19	33	15	2013-05-09 23:55:54.513658	2013-05-09 23:55:54.513658
30542	19	34	15	2013-05-09 23:55:54.514587	2013-05-09 23:55:54.514587
30543	19	35	15	2013-05-09 23:55:54.51558	2013-05-09 23:55:54.51558
30544	19	0	16	2013-05-09 23:55:54.516329	2013-05-09 23:55:54.516329
30545	19	1	16	2013-05-09 23:55:54.517328	2013-05-09 23:55:54.517328
30546	19	2	16	2013-05-09 23:55:54.518069	2013-05-09 23:55:54.518069
30547	19	3	16	2013-05-09 23:55:54.518688	2013-05-09 23:55:54.518688
30548	19	4	16	2013-05-09 23:55:54.519318	2013-05-09 23:55:54.519318
30549	19	5	16	2013-05-09 23:55:54.519947	2013-05-09 23:55:54.519947
30550	19	6	16	2013-05-09 23:55:54.520606	2013-05-09 23:55:54.520606
30551	19	7	16	2013-05-09 23:55:54.521344	2013-05-09 23:55:54.521344
30552	19	28	16	2013-05-09 23:55:54.522118	2013-05-09 23:55:54.522118
30553	19	29	16	2013-05-09 23:55:54.522791	2013-05-09 23:55:54.522791
30554	19	30	16	2013-05-09 23:55:54.523395	2013-05-09 23:55:54.523395
30555	19	31	16	2013-05-09 23:55:54.524029	2013-05-09 23:55:54.524029
30556	19	32	16	2013-05-09 23:55:54.524661	2013-05-09 23:55:54.524661
30557	19	33	16	2013-05-09 23:55:54.525305	2013-05-09 23:55:54.525305
30558	19	34	16	2013-05-09 23:55:54.526021	2013-05-09 23:55:54.526021
30559	19	35	16	2013-05-09 23:55:54.526652	2013-05-09 23:55:54.526652
30560	19	10	19	2013-05-09 23:55:54.529665	2013-05-09 23:55:54.529665
30561	19	11	19	2013-05-09 23:55:54.530356	2013-05-09 23:55:54.530356
30562	19	12	19	2013-05-09 23:55:54.530987	2013-05-09 23:55:54.530987
30563	19	13	19	2013-05-09 23:55:54.531644	2013-05-09 23:55:54.531644
30564	19	14	19	2013-05-09 23:55:54.53267	2013-05-09 23:55:54.53267
30565	19	15	19	2013-05-09 23:55:54.533657	2013-05-09 23:55:54.533657
30566	19	16	19	2013-05-09 23:55:54.534453	2013-05-09 23:55:54.534453
30567	19	17	19	2013-05-09 23:55:54.535215	2013-05-09 23:55:54.535215
30568	19	18	19	2013-05-09 23:55:54.536055	2013-05-09 23:55:54.536055
30569	19	19	19	2013-05-09 23:55:54.536819	2013-05-09 23:55:54.536819
30570	19	20	19	2013-05-09 23:55:54.537595	2013-05-09 23:55:54.537595
30571	19	21	19	2013-05-09 23:55:54.53837	2013-05-09 23:55:54.53837
30572	19	22	19	2013-05-09 23:55:54.539149	2013-05-09 23:55:54.539149
30573	19	23	19	2013-05-09 23:55:54.539911	2013-05-09 23:55:54.539911
30574	19	24	19	2013-05-09 23:55:54.540585	2013-05-09 23:55:54.540585
30575	19	25	19	2013-05-09 23:55:54.541266	2013-05-09 23:55:54.541266
30576	19	10	20	2013-05-09 23:55:54.542898	2013-05-09 23:55:54.542898
30577	19	11	20	2013-05-09 23:55:54.543573	2013-05-09 23:55:54.543573
30578	19	12	20	2013-05-09 23:55:54.544223	2013-05-09 23:55:54.544223
30579	19	13	20	2013-05-09 23:55:54.544859	2013-05-09 23:55:54.544859
30580	19	14	20	2013-05-09 23:55:54.545489	2013-05-09 23:55:54.545489
30581	19	15	20	2013-05-09 23:55:54.546089	2013-05-09 23:55:54.546089
30582	19	16	20	2013-05-09 23:55:54.546756	2013-05-09 23:55:54.546756
30583	19	17	20	2013-05-09 23:55:54.547404	2013-05-09 23:55:54.547404
30584	19	18	20	2013-05-09 23:55:54.548181	2013-05-09 23:55:54.548181
30585	19	19	20	2013-05-09 23:55:54.54901	2013-05-09 23:55:54.54901
30586	19	20	20	2013-05-09 23:55:54.549747	2013-05-09 23:55:54.549747
30587	19	21	20	2013-05-09 23:55:54.550558	2013-05-09 23:55:54.550558
30588	19	22	20	2013-05-09 23:55:54.551369	2013-05-09 23:55:54.551369
30589	19	23	20	2013-05-09 23:55:54.552137	2013-05-09 23:55:54.552137
30590	19	24	20	2013-05-09 23:55:54.552784	2013-05-09 23:55:54.552784
30591	19	25	20	2013-05-09 23:55:54.553429	2013-05-09 23:55:54.553429
30592	19	10	21	2013-05-09 23:55:54.554213	2013-05-09 23:55:54.554213
30593	19	11	21	2013-05-09 23:55:54.555089	2013-05-09 23:55:54.555089
30594	19	12	21	2013-05-09 23:55:54.555842	2013-05-09 23:55:54.555842
30595	19	13	21	2013-05-09 23:55:54.556579	2013-05-09 23:55:54.556579
30596	19	14	21	2013-05-09 23:55:54.557229	2013-05-09 23:55:54.557229
30597	19	15	21	2013-05-09 23:55:54.557986	2013-05-09 23:55:54.557986
30598	19	16	21	2013-05-09 23:55:54.558637	2013-05-09 23:55:54.558637
30599	19	17	21	2013-05-09 23:55:54.559283	2013-05-09 23:55:54.559283
30600	19	18	21	2013-05-09 23:55:54.559936	2013-05-09 23:55:54.559936
30601	19	19	21	2013-05-09 23:55:54.560573	2013-05-09 23:55:54.560573
30602	19	20	21	2013-05-09 23:55:54.561164	2013-05-09 23:55:54.561164
30603	19	21	21	2013-05-09 23:55:54.561757	2013-05-09 23:55:54.561757
30604	19	22	21	2013-05-09 23:55:54.562367	2013-05-09 23:55:54.562367
30605	19	23	21	2013-05-09 23:55:54.562972	2013-05-09 23:55:54.562972
30606	19	24	21	2013-05-09 23:55:54.563557	2013-05-09 23:55:54.563557
30607	19	25	21	2013-05-09 23:55:54.564153	2013-05-09 23:55:54.564153
30724	32	19	0	2013-05-10 02:36:49.122515	2013-05-10 02:36:49.122515
30725	32	20	0	2013-05-10 02:36:49.123194	2013-05-10 02:36:49.123194
30726	32	21	0	2013-05-10 02:36:49.123797	2013-05-10 02:36:49.123797
30727	32	19	1	2013-05-10 02:36:49.124463	2013-05-10 02:36:49.124463
30728	32	20	1	2013-05-10 02:36:49.12509	2013-05-10 02:36:49.12509
30729	32	21	1	2013-05-10 02:36:49.125793	2013-05-10 02:36:49.125793
30730	32	19	2	2013-05-10 02:36:49.133045	2013-05-10 02:36:49.133045
30731	32	20	2	2013-05-10 02:36:49.133797	2013-05-10 02:36:49.133797
30732	32	21	2	2013-05-10 02:36:49.134478	2013-05-10 02:36:49.134478
30733	32	19	3	2013-05-10 02:36:49.135248	2013-05-10 02:36:49.135248
30734	32	20	3	2013-05-10 02:36:49.135909	2013-05-10 02:36:49.135909
30735	32	21	3	2013-05-10 02:36:49.136528	2013-05-10 02:36:49.136528
30736	32	22	3	2013-05-10 02:36:49.137156	2013-05-10 02:36:49.137156
30737	32	23	3	2013-05-10 02:36:49.137756	2013-05-10 02:36:49.137756
30738	32	24	3	2013-05-10 02:36:49.138357	2013-05-10 02:36:49.138357
30739	32	25	3	2013-05-10 02:36:49.138987	2013-05-10 02:36:49.138987
30740	32	26	3	2013-05-10 02:36:49.139656	2013-05-10 02:36:49.139656
30741	32	27	3	2013-05-10 02:36:49.140402	2013-05-10 02:36:49.140402
30742	32	28	3	2013-05-10 02:36:49.141051	2013-05-10 02:36:49.141051
30743	32	29	3	2013-05-10 02:36:49.141654	2013-05-10 02:36:49.141654
30744	32	30	3	2013-05-10 02:36:49.142247	2013-05-10 02:36:49.142247
30745	32	31	3	2013-05-10 02:36:49.142837	2013-05-10 02:36:49.142837
30746	32	32	3	2013-05-10 02:36:49.143432	2013-05-10 02:36:49.143432
30747	32	22	4	2013-05-10 02:36:49.144828	2013-05-10 02:36:49.144828
30748	32	23	4	2013-05-10 02:36:49.145475	2013-05-10 02:36:49.145475
30749	32	24	4	2013-05-10 02:36:49.146082	2013-05-10 02:36:49.146082
30750	32	25	4	2013-05-10 02:36:49.146683	2013-05-10 02:36:49.146683
30751	32	26	4	2013-05-10 02:36:49.147277	2013-05-10 02:36:49.147277
30752	32	27	4	2013-05-10 02:36:49.147887	2013-05-10 02:36:49.147887
30753	32	28	4	2013-05-10 02:36:49.148495	2013-05-10 02:36:49.148495
30754	32	29	4	2013-05-10 02:36:49.149085	2013-05-10 02:36:49.149085
30755	32	30	4	2013-05-10 02:36:49.149708	2013-05-10 02:36:49.149708
30756	32	31	4	2013-05-10 02:36:49.150397	2013-05-10 02:36:49.150397
30757	32	32	4	2013-05-10 02:36:49.151092	2013-05-10 02:36:49.151092
30758	32	22	5	2013-05-10 02:36:49.152555	2013-05-10 02:36:49.152555
30759	32	23	5	2013-05-10 02:36:49.153169	2013-05-10 02:36:49.153169
30760	32	30	5	2013-05-10 02:36:49.153766	2013-05-10 02:36:49.153766
30761	32	31	5	2013-05-10 02:36:49.154356	2013-05-10 02:36:49.154356
30762	32	32	5	2013-05-10 02:36:49.154945	2013-05-10 02:36:49.154945
30763	32	22	6	2013-05-10 02:36:49.157177	2013-05-10 02:36:49.157177
30764	32	23	6	2013-05-10 02:36:49.15781	2013-05-10 02:36:49.15781
30765	32	30	6	2013-05-10 02:36:49.158428	2013-05-10 02:36:49.158428
30766	32	31	6	2013-05-10 02:36:49.159166	2013-05-10 02:36:49.159166
30767	32	32	6	2013-05-10 02:36:49.159792	2013-05-10 02:36:49.159792
30768	32	21	7	2013-05-10 02:36:49.161135	2013-05-10 02:36:49.161135
30769	32	22	7	2013-05-10 02:36:49.161786	2013-05-10 02:36:49.161786
30770	32	30	7	2013-05-10 02:36:49.163096	2013-05-10 02:36:49.163096
30771	32	31	7	2013-05-10 02:36:49.163688	2013-05-10 02:36:49.163688
30772	32	32	7	2013-05-10 02:36:49.164271	2013-05-10 02:36:49.164271
30773	32	21	8	2013-05-10 02:36:49.166423	2013-05-10 02:36:49.166423
30774	32	22	8	2013-05-10 02:36:49.167027	2013-05-10 02:36:49.167027
30775	32	25	8	2013-05-10 02:36:49.167625	2013-05-10 02:36:49.167625
30776	32	26	8	2013-05-10 02:36:49.168216	2013-05-10 02:36:49.168216
30777	32	30	8	2013-05-10 02:36:49.170068	2013-05-10 02:36:49.170068
30778	32	31	8	2013-05-10 02:36:49.170928	2013-05-10 02:36:49.170928
30779	32	32	8	2013-05-10 02:36:49.171768	2013-05-10 02:36:49.171768
30780	32	21	9	2013-05-10 02:36:49.173507	2013-05-10 02:36:49.173507
30781	32	22	9	2013-05-10 02:36:49.174257	2013-05-10 02:36:49.174257
30782	32	25	9	2013-05-10 02:36:49.174997	2013-05-10 02:36:49.174997
30783	32	26	9	2013-05-10 02:36:49.175726	2013-05-10 02:36:49.175726
30784	32	30	9	2013-05-10 02:36:49.177634	2013-05-10 02:36:49.177634
30785	32	31	9	2013-05-10 02:36:49.1784	2013-05-10 02:36:49.1784
30786	32	32	9	2013-05-10 02:36:49.179137	2013-05-10 02:36:49.179137
30787	32	21	10	2013-05-10 02:36:49.180624	2013-05-10 02:36:49.180624
30788	32	22	10	2013-05-10 02:36:49.181289	2013-05-10 02:36:49.181289
30789	32	25	10	2013-05-10 02:36:49.181948	2013-05-10 02:36:49.181948
30790	32	26	10	2013-05-10 02:36:49.1826	2013-05-10 02:36:49.1826
30791	32	30	10	2013-05-10 02:36:49.184053	2013-05-10 02:36:49.184053
30792	32	31	10	2013-05-10 02:36:49.184716	2013-05-10 02:36:49.184716
30793	32	32	10	2013-05-10 02:36:49.185308	2013-05-10 02:36:49.185308
30794	32	21	11	2013-05-10 02:36:49.186637	2013-05-10 02:36:49.186637
30795	32	22	11	2013-05-10 02:36:49.187258	2013-05-10 02:36:49.187258
30796	32	25	11	2013-05-10 02:36:49.187864	2013-05-10 02:36:49.187864
30797	32	26	11	2013-05-10 02:36:49.188456	2013-05-10 02:36:49.188456
30798	32	30	11	2013-05-10 02:36:49.189752	2013-05-10 02:36:49.189752
30799	32	31	11	2013-05-10 02:36:49.190348	2013-05-10 02:36:49.190348
30800	32	32	11	2013-05-10 02:36:49.190935	2013-05-10 02:36:49.190935
30801	32	21	12	2013-05-10 02:36:49.19165	2013-05-10 02:36:49.19165
30802	32	22	12	2013-05-10 02:36:49.192356	2013-05-10 02:36:49.192356
30803	32	25	12	2013-05-10 02:36:49.192963	2013-05-10 02:36:49.192963
30804	32	26	12	2013-05-10 02:36:49.193572	2013-05-10 02:36:49.193572
30805	32	30	12	2013-05-10 02:36:49.194281	2013-05-10 02:36:49.194281
30806	32	31	12	2013-05-10 02:36:49.194922	2013-05-10 02:36:49.194922
30807	32	32	12	2013-05-10 02:36:49.195509	2013-05-10 02:36:49.195509
30808	32	21	13	2013-05-10 02:36:49.197544	2013-05-10 02:36:49.197544
30809	32	22	13	2013-05-10 02:36:49.198161	2013-05-10 02:36:49.198161
30810	32	25	13	2013-05-10 02:36:49.198789	2013-05-10 02:36:49.198789
30811	32	26	13	2013-05-10 02:36:49.199458	2013-05-10 02:36:49.199458
30812	32	30	13	2013-05-10 02:36:49.200068	2013-05-10 02:36:49.200068
30813	32	31	13	2013-05-10 02:36:49.200658	2013-05-10 02:36:49.200658
30814	32	32	13	2013-05-10 02:36:49.201246	2013-05-10 02:36:49.201246
30815	32	21	14	2013-05-10 02:36:49.201906	2013-05-10 02:36:49.201906
30816	32	22	14	2013-05-10 02:36:49.202499	2013-05-10 02:36:49.202499
30817	32	25	14	2013-05-10 02:36:49.203086	2013-05-10 02:36:49.203086
30818	32	26	14	2013-05-10 02:36:49.203672	2013-05-10 02:36:49.203672
30819	32	30	14	2013-05-10 02:36:49.204265	2013-05-10 02:36:49.204265
30820	32	31	14	2013-05-10 02:36:49.20485	2013-05-10 02:36:49.20485
30821	32	32	14	2013-05-10 02:36:49.205483	2013-05-10 02:36:49.205483
30822	32	21	15	2013-05-10 02:36:49.2062	2013-05-10 02:36:49.2062
30823	32	22	15	2013-05-10 02:36:49.206887	2013-05-10 02:36:49.206887
30824	32	25	15	2013-05-10 02:36:49.207555	2013-05-10 02:36:49.207555
30825	32	26	15	2013-05-10 02:36:49.208149	2013-05-10 02:36:49.208149
30826	32	30	15	2013-05-10 02:36:49.208746	2013-05-10 02:36:49.208746
30827	32	31	15	2013-05-10 02:36:49.209365	2013-05-10 02:36:49.209365
30828	32	32	15	2013-05-10 02:36:49.209966	2013-05-10 02:36:49.209966
30829	32	21	16	2013-05-10 02:36:49.21066	2013-05-10 02:36:49.21066
30830	32	22	16	2013-05-10 02:36:49.211277	2013-05-10 02:36:49.211277
30831	32	25	16	2013-05-10 02:36:49.211899	2013-05-10 02:36:49.211899
30832	32	26	16	2013-05-10 02:36:49.212489	2013-05-10 02:36:49.212489
30833	32	30	16	2013-05-10 02:36:49.21308	2013-05-10 02:36:49.21308
30834	32	31	16	2013-05-10 02:36:49.213708	2013-05-10 02:36:49.213708
30835	32	32	16	2013-05-10 02:36:49.214297	2013-05-10 02:36:49.214297
30836	32	21	17	2013-05-10 02:36:49.214927	2013-05-10 02:36:49.214927
30837	32	22	17	2013-05-10 02:36:49.215572	2013-05-10 02:36:49.215572
30838	32	25	17	2013-05-10 02:36:49.216176	2013-05-10 02:36:49.216176
30839	32	26	17	2013-05-10 02:36:49.216796	2013-05-10 02:36:49.216796
30840	32	30	17	2013-05-10 02:36:49.217388	2013-05-10 02:36:49.217388
30841	32	31	17	2013-05-10 02:36:49.217973	2013-05-10 02:36:49.217973
30842	32	32	17	2013-05-10 02:36:49.218594	2013-05-10 02:36:49.218594
30843	32	21	18	2013-05-10 02:36:49.219209	2013-05-10 02:36:49.219209
30844	32	22	18	2013-05-10 02:36:49.219793	2013-05-10 02:36:49.219793
30845	32	25	18	2013-05-10 02:36:49.22038	2013-05-10 02:36:49.22038
30846	32	26	18	2013-05-10 02:36:49.22096	2013-05-10 02:36:49.22096
30847	32	30	18	2013-05-10 02:36:49.221551	2013-05-10 02:36:49.221551
30848	32	31	18	2013-05-10 02:36:49.222133	2013-05-10 02:36:49.222133
30849	32	32	18	2013-05-10 02:36:49.222772	2013-05-10 02:36:49.222772
30850	32	21	19	2013-05-10 02:36:49.224328	2013-05-10 02:36:49.224328
30851	32	22	19	2013-05-10 02:36:49.224969	2013-05-10 02:36:49.224969
30852	32	25	19	2013-05-10 02:36:49.225562	2013-05-10 02:36:49.225562
30853	32	26	19	2013-05-10 02:36:49.22621	2013-05-10 02:36:49.22621
30854	32	25	20	2013-05-10 02:36:49.227838	2013-05-10 02:36:49.227838
30855	32	26	20	2013-05-10 02:36:49.228574	2013-05-10 02:36:49.228574
30856	32	25	21	2013-05-10 02:36:49.229336	2013-05-10 02:36:49.229336
30857	32	26	21	2013-05-10 02:36:49.230004	2013-05-10 02:36:49.230004
31713	18	11	0	2013-05-19 00:22:35.282839	2013-05-19 00:22:35.282839
31714	18	12	0	2013-05-19 00:22:35.284444	2013-05-19 00:22:35.284444
31715	18	13	0	2013-05-19 00:22:35.285577	2013-05-19 00:22:35.285577
31716	18	11	1	2013-05-19 00:22:35.295796	2013-05-19 00:22:35.295796
31717	18	12	1	2013-05-19 00:22:35.29667	2013-05-19 00:22:35.29667
31718	18	13	1	2013-05-19 00:22:35.297658	2013-05-19 00:22:35.297658
31719	18	11	2	2013-05-19 00:22:35.298557	2013-05-19 00:22:35.298557
31720	18	12	2	2013-05-19 00:22:35.299349	2013-05-19 00:22:35.299349
31721	18	13	2	2013-05-19 00:22:35.300208	2013-05-19 00:22:35.300208
31722	18	0	4	2013-05-19 00:22:35.305062	2013-05-19 00:22:35.305062
31723	18	1	4	2013-05-19 00:22:35.305976	2013-05-19 00:22:35.305976
31724	18	2	4	2013-05-19 00:22:35.306813	2013-05-19 00:22:35.306813
31725	18	3	4	2013-05-19 00:22:35.30761	2013-05-19 00:22:35.30761
31726	18	4	4	2013-05-19 00:22:35.308445	2013-05-19 00:22:35.308445
31727	18	0	5	2013-05-19 00:22:35.310655	2013-05-19 00:22:35.310655
31728	18	1	5	2013-05-19 00:22:35.311507	2013-05-19 00:22:35.311507
31729	18	2	5	2013-05-19 00:22:35.312384	2013-05-19 00:22:35.312384
31730	18	3	5	2013-05-19 00:22:35.313245	2013-05-19 00:22:35.313245
31731	18	4	5	2013-05-19 00:22:35.314125	2013-05-19 00:22:35.314125
31732	18	26	7	2013-05-19 00:22:35.316059	2013-05-19 00:22:35.316059
31733	18	27	7	2013-05-19 00:22:35.316985	2013-05-19 00:22:35.316985
31734	18	26	8	2013-05-19 00:22:35.317944	2013-05-19 00:22:35.317944
31735	18	27	8	2013-05-19 00:22:35.318736	2013-05-19 00:22:35.318736
31736	18	9	9	2013-05-19 00:22:35.319748	2013-05-19 00:22:35.319748
31737	18	10	9	2013-05-19 00:22:35.321011	2013-05-19 00:22:35.321011
31738	18	26	9	2013-05-19 00:22:35.32214	2013-05-19 00:22:35.32214
31739	18	27	9	2013-05-19 00:22:35.322953	2013-05-19 00:22:35.322953
31740	18	9	10	2013-05-19 00:22:35.323784	2013-05-19 00:22:35.323784
31741	18	10	10	2013-05-19 00:22:35.325246	2013-05-19 00:22:35.325246
31742	18	24	10	2013-05-19 00:22:35.326276	2013-05-19 00:22:35.326276
31743	18	25	10	2013-05-19 00:22:35.327159	2013-05-19 00:22:35.327159
31744	18	26	10	2013-05-19 00:22:35.328136	2013-05-19 00:22:35.328136
31745	18	27	10	2013-05-19 00:22:35.329232	2013-05-19 00:22:35.329232
31746	18	9	11	2013-05-19 00:22:35.330411	2013-05-19 00:22:35.330411
31747	18	10	11	2013-05-19 00:22:35.331407	2013-05-19 00:22:35.331407
31748	18	11	11	2013-05-19 00:22:35.332328	2013-05-19 00:22:35.332328
31749	18	12	11	2013-05-19 00:22:35.333266	2013-05-19 00:22:35.333266
31750	18	24	11	2013-05-19 00:22:35.337175	2013-05-19 00:22:35.337175
31751	18	25	11	2013-05-19 00:22:35.33816	2013-05-19 00:22:35.33816
31752	18	26	11	2013-05-19 00:22:35.339073	2013-05-19 00:22:35.339073
31753	18	27	11	2013-05-19 00:22:35.339951	2013-05-19 00:22:35.339951
31754	18	7	12	2013-05-19 00:22:35.341152	2013-05-19 00:22:35.341152
31755	18	8	12	2013-05-19 00:22:35.34205	2013-05-19 00:22:35.34205
31756	18	9	12	2013-05-19 00:22:35.342845	2013-05-19 00:22:35.342845
31757	18	10	12	2013-05-19 00:22:35.343595	2013-05-19 00:22:35.343595
31758	18	11	12	2013-05-19 00:22:35.344425	2013-05-19 00:22:35.344425
31759	18	12	12	2013-05-19 00:22:35.345203	2013-05-19 00:22:35.345203
31760	18	22	12	2013-05-19 00:22:35.347235	2013-05-19 00:22:35.347235
31761	18	23	12	2013-05-19 00:22:35.348069	2013-05-19 00:22:35.348069
31762	18	24	12	2013-05-19 00:22:35.348872	2013-05-19 00:22:35.348872
31763	18	25	12	2013-05-19 00:22:35.349646	2013-05-19 00:22:35.349646
31764	18	26	12	2013-05-19 00:22:35.350494	2013-05-19 00:22:35.350494
31765	18	27	12	2013-05-19 00:22:35.35141	2013-05-19 00:22:35.35141
31766	18	7	13	2013-05-19 00:22:35.352218	2013-05-19 00:22:35.352218
31767	18	22	13	2013-05-19 00:22:35.353957	2013-05-19 00:22:35.353957
31768	18	23	13	2013-05-19 00:22:35.354786	2013-05-19 00:22:35.354786
31769	18	7	14	2013-05-19 00:22:35.357913	2013-05-19 00:22:35.357913
31770	18	22	14	2013-05-19 00:22:35.360632	2013-05-19 00:22:35.360632
31771	18	23	14	2013-05-19 00:22:35.361378	2013-05-19 00:22:35.361378
31772	18	7	15	2013-05-19 00:22:35.363027	2013-05-19 00:22:35.363027
31773	18	8	15	2013-05-19 00:22:35.363773	2013-05-19 00:22:35.363773
31774	18	9	15	2013-05-19 00:22:35.364466	2013-05-19 00:22:35.364466
31775	18	22	15	2013-05-19 00:22:35.36606	2013-05-19 00:22:35.36606
31776	18	23	15	2013-05-19 00:22:35.366883	2013-05-19 00:22:35.366883
31777	18	24	15	2013-05-19 00:22:35.367793	2013-05-19 00:22:35.367793
31778	18	25	15	2013-05-19 00:22:35.368679	2013-05-19 00:22:35.368679
31779	18	7	16	2013-05-19 00:22:35.369485	2013-05-19 00:22:35.369485
31780	18	8	16	2013-05-19 00:22:35.370242	2013-05-19 00:22:35.370242
31781	18	9	16	2013-05-19 00:22:35.370967	2013-05-19 00:22:35.370967
31782	18	24	16	2013-05-19 00:22:35.371707	2013-05-19 00:22:35.371707
31783	18	25	16	2013-05-19 00:22:35.372414	2013-05-19 00:22:35.372414
31784	18	7	17	2013-05-19 00:22:35.37404	2013-05-19 00:22:35.37404
31785	18	8	17	2013-05-19 00:22:35.374756	2013-05-19 00:22:35.374756
31786	18	9	17	2013-05-19 00:22:35.37543	2013-05-19 00:22:35.37543
31787	18	24	17	2013-05-19 00:22:35.376224	2013-05-19 00:22:35.376224
31788	18	25	17	2013-05-19 00:22:35.377041	2013-05-19 00:22:35.377041
31789	18	5	18	2013-05-19 00:22:35.377867	2013-05-19 00:22:35.377867
31790	18	6	18	2013-05-19 00:22:35.37862	2013-05-19 00:22:35.37862
31791	18	7	18	2013-05-19 00:22:35.37933	2013-05-19 00:22:35.37933
31792	18	8	18	2013-05-19 00:22:35.380061	2013-05-19 00:22:35.380061
31793	18	9	18	2013-05-19 00:22:35.380826	2013-05-19 00:22:35.380826
31794	18	21	18	2013-05-19 00:22:35.38156	2013-05-19 00:22:35.38156
31795	18	22	18	2013-05-19 00:22:35.382259	2013-05-19 00:22:35.382259
31796	18	23	18	2013-05-19 00:22:35.382963	2013-05-19 00:22:35.382963
31797	18	24	18	2013-05-19 00:22:35.383682	2013-05-19 00:22:35.383682
31798	18	25	18	2013-05-19 00:22:35.384719	2013-05-19 00:22:35.384719
31799	18	5	19	2013-05-19 00:22:35.386479	2013-05-19 00:22:35.386479
31800	18	6	19	2013-05-19 00:22:35.38723	2013-05-19 00:22:35.38723
31801	18	7	19	2013-05-19 00:22:35.387971	2013-05-19 00:22:35.387971
31802	18	21	19	2013-05-19 00:22:35.390341	2013-05-19 00:22:35.390341
31803	18	22	19	2013-05-19 00:22:35.391472	2013-05-19 00:22:35.391472
31804	18	23	19	2013-05-19 00:22:35.392354	2013-05-19 00:22:35.392354
31805	18	24	19	2013-05-19 00:22:35.393116	2013-05-19 00:22:35.393116
31806	18	25	19	2013-05-19 00:22:35.393833	2013-05-19 00:22:35.393833
31807	18	3	20	2013-05-19 00:22:35.394596	2013-05-19 00:22:35.394596
31808	18	4	20	2013-05-19 00:22:35.39535	2013-05-19 00:22:35.39535
31809	18	5	20	2013-05-19 00:22:35.3962	2013-05-19 00:22:35.3962
31810	18	6	20	2013-05-19 00:22:35.39705	2013-05-19 00:22:35.39705
31811	18	7	20	2013-05-19 00:22:35.397987	2013-05-19 00:22:35.397987
31812	18	18	20	2013-05-19 00:22:35.399012	2013-05-19 00:22:35.399012
31813	18	19	20	2013-05-19 00:22:35.399949	2013-05-19 00:22:35.399949
31814	18	20	20	2013-05-19 00:22:35.40093	2013-05-19 00:22:35.40093
31815	18	21	20	2013-05-19 00:22:35.401799	2013-05-19 00:22:35.401799
31816	18	22	20	2013-05-19 00:22:35.402754	2013-05-19 00:22:35.402754
31817	18	3	21	2013-05-19 00:22:35.405363	2013-05-19 00:22:35.405363
31818	18	4	21	2013-05-19 00:22:35.406488	2013-05-19 00:22:35.406488
31819	18	5	21	2013-05-19 00:22:35.407679	2013-05-19 00:22:35.407679
31820	18	6	21	2013-05-19 00:22:35.408718	2013-05-19 00:22:35.408718
31821	18	7	21	2013-05-19 00:22:35.409744	2013-05-19 00:22:35.409744
31822	18	18	21	2013-05-19 00:22:35.414915	2013-05-19 00:22:35.414915
31823	18	19	21	2013-05-19 00:22:35.415973	2013-05-19 00:22:35.415973
31824	18	20	21	2013-05-19 00:22:35.417409	2013-05-19 00:22:35.417409
31825	18	21	21	2013-05-19 00:22:35.418494	2013-05-19 00:22:35.418494
31826	18	22	21	2013-05-19 00:22:35.419395	2013-05-19 00:22:35.419395
33531	28	16	0	2013-05-19 21:08:48.255695	2013-05-19 21:08:48.255695
33532	28	17	0	2013-05-19 21:08:48.257319	2013-05-19 21:08:48.257319
33533	28	16	1	2013-05-19 21:08:48.258931	2013-05-19 21:08:48.258931
33534	28	17	1	2013-05-19 21:08:48.260387	2013-05-19 21:08:48.260387
33535	28	16	2	2013-05-19 21:08:48.261962	2013-05-19 21:08:48.261962
33536	28	17	2	2013-05-19 21:08:48.263425	2013-05-19 21:08:48.263425
33537	28	16	3	2013-05-19 21:08:48.264923	2013-05-19 21:08:48.264923
33538	28	17	3	2013-05-19 21:08:48.266391	2013-05-19 21:08:48.266391
33539	28	16	4	2013-05-19 21:08:48.267975	2013-05-19 21:08:48.267975
33540	28	17	4	2013-05-19 21:08:48.269399	2013-05-19 21:08:48.269399
33541	28	16	5	2013-05-19 21:08:48.270942	2013-05-19 21:08:48.270942
33542	28	17	5	2013-05-19 21:08:48.272447	2013-05-19 21:08:48.272447
33543	28	16	6	2013-05-19 21:08:48.273932	2013-05-19 21:08:48.273932
33544	28	17	6	2013-05-19 21:08:48.275307	2013-05-19 21:08:48.275307
33545	28	16	7	2013-05-19 21:08:48.276934	2013-05-19 21:08:48.276934
33546	28	17	7	2013-05-19 21:08:48.27847	2013-05-19 21:08:48.27847
33547	28	24	7	2013-05-19 21:08:48.279984	2013-05-19 21:08:48.279984
33548	28	25	7	2013-05-19 21:08:48.281443	2013-05-19 21:08:48.281443
33549	28	16	8	2013-05-19 21:08:48.282965	2013-05-19 21:08:48.282965
33550	28	17	8	2013-05-19 21:08:48.284462	2013-05-19 21:08:48.284462
33551	28	24	8	2013-05-19 21:08:48.286251	2013-05-19 21:08:48.286251
33552	28	25	8	2013-05-19 21:08:48.287973	2013-05-19 21:08:48.287973
33553	28	16	9	2013-05-19 21:08:48.289603	2013-05-19 21:08:48.289603
33554	28	17	9	2013-05-19 21:08:48.291018	2013-05-19 21:08:48.291018
33555	28	18	9	2013-05-19 21:08:48.292407	2013-05-19 21:08:48.292407
33556	28	19	9	2013-05-19 21:08:48.293897	2013-05-19 21:08:48.293897
33557	28	20	9	2013-05-19 21:08:48.295317	2013-05-19 21:08:48.295317
33558	28	21	9	2013-05-19 21:08:48.296796	2013-05-19 21:08:48.296796
33559	28	22	9	2013-05-19 21:08:48.297821	2013-05-19 21:08:48.297821
33560	28	23	9	2013-05-19 21:08:48.298776	2013-05-19 21:08:48.298776
33561	28	24	9	2013-05-19 21:08:48.299645	2013-05-19 21:08:48.299645
33562	28	25	9	2013-05-19 21:08:48.300582	2013-05-19 21:08:48.300582
33563	28	24	10	2013-05-19 21:08:48.301641	2013-05-19 21:08:48.301641
33564	28	25	10	2013-05-19 21:08:48.302717	2013-05-19 21:08:48.302717
33565	28	24	11	2013-05-19 21:08:48.30524	2013-05-19 21:08:48.30524
33566	28	25	11	2013-05-19 21:08:48.306796	2013-05-19 21:08:48.306796
33567	28	8	12	2013-05-19 21:08:48.308318	2013-05-19 21:08:48.308318
33568	28	9	12	2013-05-19 21:08:48.30952	2013-05-19 21:08:48.30952
33569	28	24	12	2013-05-19 21:08:48.311714	2013-05-19 21:08:48.311714
33570	28	25	12	2013-05-19 21:08:48.312599	2013-05-19 21:08:48.312599
33571	28	8	13	2013-05-19 21:08:48.313633	2013-05-19 21:08:48.313633
33572	28	9	13	2013-05-19 21:08:48.315088	2013-05-19 21:08:48.315088
33573	28	8	14	2013-05-19 21:08:48.316585	2013-05-19 21:08:48.316585
33574	28	9	14	2013-05-19 21:08:48.31764	2013-05-19 21:08:48.31764
33575	28	8	15	2013-05-19 21:08:48.319572	2013-05-19 21:08:48.319572
33576	28	9	15	2013-05-19 21:08:48.320398	2013-05-19 21:08:48.320398
33577	28	10	15	2013-05-19 21:08:48.321193	2013-05-19 21:08:48.321193
33578	28	11	15	2013-05-19 21:08:48.321979	2013-05-19 21:08:48.321979
33579	28	12	15	2013-05-19 21:08:48.322816	2013-05-19 21:08:48.322816
33580	28	13	15	2013-05-19 21:08:48.323844	2013-05-19 21:08:48.323844
33581	28	14	15	2013-05-19 21:08:48.32489	2013-05-19 21:08:48.32489
33582	28	15	15	2013-05-19 21:08:48.326033	2013-05-19 21:08:48.326033
33583	28	14	16	2013-05-19 21:08:48.327779	2013-05-19 21:08:48.327779
33584	28	15	16	2013-05-19 21:08:48.329393	2013-05-19 21:08:48.329393
33585	28	14	17	2013-05-19 21:08:48.331094	2013-05-19 21:08:48.331094
33586	28	15	17	2013-05-19 21:08:48.332866	2013-05-19 21:08:48.332866
33587	28	14	18	2013-05-19 21:08:48.334577	2013-05-19 21:08:48.334577
33588	28	15	18	2013-05-19 21:08:48.336152	2013-05-19 21:08:48.336152
33589	28	14	19	2013-05-19 21:08:48.337817	2013-05-19 21:08:48.337817
33590	28	15	19	2013-05-19 21:08:48.339361	2013-05-19 21:08:48.339361
33591	28	14	20	2013-05-19 21:08:48.340816	2013-05-19 21:08:48.340816
33592	28	15	20	2013-05-19 21:08:48.342109	2013-05-19 21:08:48.342109
33593	28	14	21	2013-05-19 21:08:48.343572	2013-05-19 21:08:48.343572
33594	28	15	21	2013-05-19 21:08:48.344899	2013-05-19 21:08:48.344899
33595	38	10	0	2013-05-23 02:51:52.30751	2013-05-23 02:51:52.30751
33596	38	11	0	2013-05-23 02:51:52.30893	2013-05-23 02:51:52.30893
33597	38	12	0	2013-05-23 02:51:52.309719	2013-05-23 02:51:52.309719
33598	38	13	0	2013-05-23 02:51:52.310439	2013-05-23 02:51:52.310439
33599	38	14	0	2013-05-23 02:51:52.311117	2013-05-23 02:51:52.311117
33600	38	15	0	2013-05-23 02:51:52.311907	2013-05-23 02:51:52.311907
33601	38	16	0	2013-05-23 02:51:52.312653	2013-05-23 02:51:52.312653
33602	38	17	0	2013-05-23 02:51:52.313321	2013-05-23 02:51:52.313321
33603	38	18	0	2013-05-23 02:51:52.313986	2013-05-23 02:51:52.313986
33604	38	19	0	2013-05-23 02:51:52.314648	2013-05-23 02:51:52.314648
33605	38	20	0	2013-05-23 02:51:52.31531	2013-05-23 02:51:52.31531
33606	38	21	0	2013-05-23 02:51:52.315972	2013-05-23 02:51:52.315972
33607	38	22	0	2013-05-23 02:51:52.31665	2013-05-23 02:51:52.31665
33608	38	23	0	2013-05-23 02:51:52.317311	2013-05-23 02:51:52.317311
33609	38	10	1	2013-05-23 02:51:52.318023	2013-05-23 02:51:52.318023
33610	38	11	1	2013-05-23 02:51:52.318864	2013-05-23 02:51:52.318864
33611	38	12	1	2013-05-23 02:51:52.319572	2013-05-23 02:51:52.319572
33612	38	13	1	2013-05-23 02:51:52.320236	2013-05-23 02:51:52.320236
33613	38	10	2	2013-05-23 02:51:52.322676	2013-05-23 02:51:52.322676
33614	38	11	2	2013-05-23 02:51:52.323356	2013-05-23 02:51:52.323356
33615	38	12	2	2013-05-23 02:51:52.324032	2013-05-23 02:51:52.324032
33616	38	13	2	2013-05-23 02:51:52.324997	2013-05-23 02:51:52.324997
33617	38	8	3	2013-05-23 02:51:52.327314	2013-05-23 02:51:52.327314
33618	38	9	3	2013-05-23 02:51:52.328327	2013-05-23 02:51:52.328327
33619	38	10	3	2013-05-23 02:51:52.329666	2013-05-23 02:51:52.329666
33620	38	11	3	2013-05-23 02:51:52.33104	2013-05-23 02:51:52.33104
33621	38	8	4	2013-05-23 02:51:52.334158	2013-05-23 02:51:52.334158
33622	38	9	4	2013-05-23 02:51:52.334976	2013-05-23 02:51:52.334976
33623	38	10	4	2013-05-23 02:51:52.335693	2013-05-23 02:51:52.335693
33624	38	11	4	2013-05-23 02:51:52.336399	2013-05-23 02:51:52.336399
33625	38	8	5	2013-05-23 02:51:52.337177	2013-05-23 02:51:52.337177
33626	38	9	5	2013-05-23 02:51:52.337884	2013-05-23 02:51:52.337884
33627	38	10	5	2013-05-23 02:51:52.338587	2013-05-23 02:51:52.338587
33628	38	11	5	2013-05-23 02:51:52.339291	2013-05-23 02:51:52.339291
33629	38	6	6	2013-05-23 02:51:52.340036	2013-05-23 02:51:52.340036
33630	38	7	6	2013-05-23 02:51:52.340833	2013-05-23 02:51:52.340833
33631	38	8	6	2013-05-23 02:51:52.34166	2013-05-23 02:51:52.34166
33632	38	9	6	2013-05-23 02:51:52.342718	2013-05-23 02:51:52.342718
33633	38	10	6	2013-05-23 02:51:52.344075	2013-05-23 02:51:52.344075
33634	38	11	6	2013-05-23 02:51:52.345218	2013-05-23 02:51:52.345218
33635	38	12	6	2013-05-23 02:51:52.346119	2013-05-23 02:51:52.346119
33636	38	13	6	2013-05-23 02:51:52.347046	2013-05-23 02:51:52.347046
33637	38	14	6	2013-05-23 02:51:52.347787	2013-05-23 02:51:52.347787
33638	38	6	7	2013-05-23 02:51:52.348571	2013-05-23 02:51:52.348571
33639	38	7	7	2013-05-23 02:51:52.349281	2013-05-23 02:51:52.349281
33640	38	8	7	2013-05-23 02:51:52.350106	2013-05-23 02:51:52.350106
33641	38	9	7	2013-05-23 02:51:52.350926	2013-05-23 02:51:52.350926
33642	38	10	7	2013-05-23 02:51:52.351844	2013-05-23 02:51:52.351844
33643	38	11	7	2013-05-23 02:51:52.352702	2013-05-23 02:51:52.352702
33644	38	12	7	2013-05-23 02:51:52.353557	2013-05-23 02:51:52.353557
33645	38	13	7	2013-05-23 02:51:52.354261	2013-05-23 02:51:52.354261
33646	38	14	7	2013-05-23 02:51:52.354931	2013-05-23 02:51:52.354931
33647	38	6	8	2013-05-23 02:51:52.355634	2013-05-23 02:51:52.355634
33648	38	7	8	2013-05-23 02:51:52.356325	2013-05-23 02:51:52.356325
33649	38	8	8	2013-05-23 02:51:52.35698	2013-05-23 02:51:52.35698
33650	38	9	8	2013-05-23 02:51:52.35776	2013-05-23 02:51:52.35776
33651	38	13	8	2013-05-23 02:51:52.358663	2013-05-23 02:51:52.358663
33652	38	14	8	2013-05-23 02:51:52.359764	2013-05-23 02:51:52.359764
33653	38	15	8	2013-05-23 02:51:52.360687	2013-05-23 02:51:52.360687
33654	38	16	8	2013-05-23 02:51:52.361432	2013-05-23 02:51:52.361432
33655	38	17	8	2013-05-23 02:51:52.362204	2013-05-23 02:51:52.362204
33656	38	18	8	2013-05-23 02:51:52.362899	2013-05-23 02:51:52.362899
33657	38	19	8	2013-05-23 02:51:52.363668	2013-05-23 02:51:52.363668
33658	38	20	8	2013-05-23 02:51:52.364574	2013-05-23 02:51:52.364574
33659	38	21	8	2013-05-23 02:51:52.365421	2013-05-23 02:51:52.365421
33660	38	4	9	2013-05-23 02:51:52.366258	2013-05-23 02:51:52.366258
33661	38	5	9	2013-05-23 02:51:52.366967	2013-05-23 02:51:52.366967
33662	38	6	9	2013-05-23 02:51:52.36764	2013-05-23 02:51:52.36764
33663	38	7	9	2013-05-23 02:51:52.368339	2013-05-23 02:51:52.368339
33664	38	13	9	2013-05-23 02:51:52.370596	2013-05-23 02:51:52.370596
33665	38	14	9	2013-05-23 02:51:52.371273	2013-05-23 02:51:52.371273
33666	38	15	9	2013-05-23 02:51:52.372209	2013-05-23 02:51:52.372209
33667	38	16	9	2013-05-23 02:51:52.372895	2013-05-23 02:51:52.372895
33668	38	17	9	2013-05-23 02:51:52.373552	2013-05-23 02:51:52.373552
33669	38	18	9	2013-05-23 02:51:52.374205	2013-05-23 02:51:52.374205
33670	38	19	9	2013-05-23 02:51:52.375116	2013-05-23 02:51:52.375116
33671	38	20	9	2013-05-23 02:51:52.3761	2013-05-23 02:51:52.3761
33672	38	21	9	2013-05-23 02:51:52.478624	2013-05-23 02:51:52.478624
33673	38	4	10	2013-05-23 02:51:52.482975	2013-05-23 02:51:52.482975
33674	38	5	10	2013-05-23 02:51:52.484108	2013-05-23 02:51:52.484108
33675	38	6	10	2013-05-23 02:51:52.48576	2013-05-23 02:51:52.48576
33676	38	7	10	2013-05-23 02:51:52.487172	2013-05-23 02:51:52.487172
33677	38	13	10	2013-05-23 02:51:52.488114	2013-05-23 02:51:52.488114
33678	38	14	10	2013-05-23 02:51:52.488941	2013-05-23 02:51:52.488941
33679	38	15	10	2013-05-23 02:51:52.489749	2013-05-23 02:51:52.489749
33680	38	16	10	2013-05-23 02:51:52.490633	2013-05-23 02:51:52.490633
33681	38	17	10	2013-05-23 02:51:52.491403	2013-05-23 02:51:52.491403
33682	38	18	10	2013-05-23 02:51:52.492115	2013-05-23 02:51:52.492115
33683	38	19	10	2013-05-23 02:51:52.492846	2013-05-23 02:51:52.492846
33684	38	20	10	2013-05-23 02:51:52.493574	2013-05-23 02:51:52.493574
33685	38	21	10	2013-05-23 02:51:52.494309	2013-05-23 02:51:52.494309
33686	38	4	11	2013-05-23 02:51:52.495092	2013-05-23 02:51:52.495092
33687	38	5	11	2013-05-23 02:51:52.495915	2013-05-23 02:51:52.495915
33688	38	6	11	2013-05-23 02:51:52.496616	2013-05-23 02:51:52.496616
33689	38	7	11	2013-05-23 02:51:52.497263	2013-05-23 02:51:52.497263
33690	38	18	11	2013-05-23 02:51:52.497977	2013-05-23 02:51:52.497977
33691	38	19	11	2013-05-23 02:51:52.498662	2013-05-23 02:51:52.498662
33692	38	20	11	2013-05-23 02:51:52.49931	2013-05-23 02:51:52.49931
33693	38	21	11	2013-05-23 02:51:52.499953	2013-05-23 02:51:52.499953
33694	38	18	12	2013-05-23 02:51:52.500674	2013-05-23 02:51:52.500674
33695	38	19	12	2013-05-23 02:51:52.501319	2013-05-23 02:51:52.501319
33696	38	20	12	2013-05-23 02:51:52.501962	2013-05-23 02:51:52.501962
33697	38	21	12	2013-05-23 02:51:52.502603	2013-05-23 02:51:52.502603
33698	38	14	19	2013-05-23 02:51:52.50673	2013-05-23 02:51:52.50673
33699	38	15	19	2013-05-23 02:51:52.507453	2013-05-23 02:51:52.507453
33700	38	14	20	2013-05-23 02:51:52.50816	2013-05-23 02:51:52.50816
33701	38	15	20	2013-05-23 02:51:52.508809	2013-05-23 02:51:52.508809
33702	38	14	21	2013-05-23 02:51:52.509501	2013-05-23 02:51:52.509501
33703	38	15	21	2013-05-23 02:51:52.510145	2013-05-23 02:51:52.510145
34132	49	0	5	2013-05-23 03:35:49.278083	2013-05-23 03:35:49.278083
34133	49	1	5	2013-05-23 03:35:49.279219	2013-05-23 03:35:49.279219
34134	49	2	5	2013-05-23 03:35:49.280061	2013-05-23 03:35:49.280061
34135	49	3	5	2013-05-23 03:35:49.337391	2013-05-23 03:35:49.337391
34136	49	4	5	2013-05-23 03:35:49.339338	2013-05-23 03:35:49.339338
34137	49	5	5	2013-05-23 03:35:49.340825	2013-05-23 03:35:49.340825
34138	49	6	5	2013-05-23 03:35:49.342246	2013-05-23 03:35:49.342246
34139	49	7	5	2013-05-23 03:35:49.343514	2013-05-23 03:35:49.343514
34140	49	8	5	2013-05-23 03:35:49.344535	2013-05-23 03:35:49.344535
34141	49	9	5	2013-05-23 03:35:49.345928	2013-05-23 03:35:49.345928
34142	49	10	5	2013-05-23 03:35:49.347162	2013-05-23 03:35:49.347162
34143	49	11	5	2013-05-23 03:35:49.348618	2013-05-23 03:35:49.348618
34144	49	12	5	2013-05-23 03:35:49.35006	2013-05-23 03:35:49.35006
34145	49	23	5	2013-05-23 03:35:49.35157	2013-05-23 03:35:49.35157
34146	49	24	5	2013-05-23 03:35:49.352903	2013-05-23 03:35:49.352903
34147	49	25	5	2013-05-23 03:35:49.35398	2013-05-23 03:35:49.35398
34148	49	26	5	2013-05-23 03:35:49.354786	2013-05-23 03:35:49.354786
34149	49	27	5	2013-05-23 03:35:49.355667	2013-05-23 03:35:49.355667
34150	49	28	5	2013-05-23 03:35:49.356479	2013-05-23 03:35:49.356479
34151	49	29	5	2013-05-23 03:35:49.357598	2013-05-23 03:35:49.357598
34152	49	30	5	2013-05-23 03:35:49.358894	2013-05-23 03:35:49.358894
34153	49	31	5	2013-05-23 03:35:49.360051	2013-05-23 03:35:49.360051
34154	49	32	5	2013-05-23 03:35:49.361081	2013-05-23 03:35:49.361081
34155	49	33	5	2013-05-23 03:35:49.362037	2013-05-23 03:35:49.362037
34156	49	34	5	2013-05-23 03:35:49.362949	2013-05-23 03:35:49.362949
34157	49	35	5	2013-05-23 03:35:49.363869	2013-05-23 03:35:49.363869
34158	49	12	6	2013-05-23 03:35:49.364821	2013-05-23 03:35:49.364821
34159	49	23	6	2013-05-23 03:35:49.366006	2013-05-23 03:35:49.366006
34160	49	12	7	2013-05-23 03:35:49.366946	2013-05-23 03:35:49.366946
34161	49	23	7	2013-05-23 03:35:49.367737	2013-05-23 03:35:49.367737
34162	49	0	8	2013-05-23 03:35:49.369196	2013-05-23 03:35:49.369196
34163	49	1	8	2013-05-23 03:35:49.370365	2013-05-23 03:35:49.370365
34164	49	2	8	2013-05-23 03:35:49.371534	2013-05-23 03:35:49.371534
34165	49	3	8	2013-05-23 03:35:49.373067	2013-05-23 03:35:49.373067
34166	49	4	8	2013-05-23 03:35:49.374761	2013-05-23 03:35:49.374761
34167	49	5	8	2013-05-23 03:35:49.376199	2013-05-23 03:35:49.376199
34168	49	6	8	2013-05-23 03:35:49.377541	2013-05-23 03:35:49.377541
34169	49	7	8	2013-05-23 03:35:49.378891	2013-05-23 03:35:49.378891
34170	49	8	8	2013-05-23 03:35:49.379968	2013-05-23 03:35:49.379968
34171	49	9	8	2013-05-23 03:35:49.381411	2013-05-23 03:35:49.381411
34172	49	10	8	2013-05-23 03:35:49.38273	2013-05-23 03:35:49.38273
34173	49	11	8	2013-05-23 03:35:49.384074	2013-05-23 03:35:49.384074
34174	49	12	8	2013-05-23 03:35:49.385411	2013-05-23 03:35:49.385411
34175	49	23	8	2013-05-23 03:35:49.386671	2013-05-23 03:35:49.386671
34176	49	24	8	2013-05-23 03:35:49.387785	2013-05-23 03:35:49.387785
34177	49	25	8	2013-05-23 03:35:49.388771	2013-05-23 03:35:49.388771
34178	49	26	8	2013-05-23 03:35:49.389826	2013-05-23 03:35:49.389826
34179	49	27	8	2013-05-23 03:35:49.390814	2013-05-23 03:35:49.390814
34180	49	28	8	2013-05-23 03:35:49.391715	2013-05-23 03:35:49.391715
34181	49	29	8	2013-05-23 03:35:49.392559	2013-05-23 03:35:49.392559
34182	49	30	8	2013-05-23 03:35:49.393372	2013-05-23 03:35:49.393372
34183	49	31	8	2013-05-23 03:35:49.394268	2013-05-23 03:35:49.394268
34184	49	32	8	2013-05-23 03:35:49.395335	2013-05-23 03:35:49.395335
34185	49	33	8	2013-05-23 03:35:49.396201	2013-05-23 03:35:49.396201
34186	49	34	8	2013-05-23 03:35:49.397	2013-05-23 03:35:49.397
34187	49	35	8	2013-05-23 03:35:49.397737	2013-05-23 03:35:49.397737
34188	49	0	13	2013-05-23 03:35:49.401636	2013-05-23 03:35:49.401636
34189	49	1	13	2013-05-23 03:35:49.403045	2013-05-23 03:35:49.403045
34190	49	2	13	2013-05-23 03:35:49.404234	2013-05-23 03:35:49.404234
34191	49	3	13	2013-05-23 03:35:49.405294	2013-05-23 03:35:49.405294
34192	49	4	13	2013-05-23 03:35:49.406452	2013-05-23 03:35:49.406452
34193	49	5	13	2013-05-23 03:35:49.407451	2013-05-23 03:35:49.407451
34194	49	6	13	2013-05-23 03:35:49.409419	2013-05-23 03:35:49.409419
34195	49	7	13	2013-05-23 03:35:49.411008	2013-05-23 03:35:49.411008
34196	49	8	13	2013-05-23 03:35:49.412292	2013-05-23 03:35:49.412292
34197	49	9	13	2013-05-23 03:35:49.413499	2013-05-23 03:35:49.413499
34198	49	10	13	2013-05-23 03:35:49.414586	2013-05-23 03:35:49.414586
34199	49	11	13	2013-05-23 03:35:49.415736	2013-05-23 03:35:49.415736
34200	49	12	13	2013-05-23 03:35:49.416827	2013-05-23 03:35:49.416827
34201	49	23	13	2013-05-23 03:35:49.417654	2013-05-23 03:35:49.417654
34202	49	24	13	2013-05-23 03:35:49.418426	2013-05-23 03:35:49.418426
34203	49	25	13	2013-05-23 03:35:49.419175	2013-05-23 03:35:49.419175
34204	49	26	13	2013-05-23 03:35:49.420183	2013-05-23 03:35:49.420183
34205	49	27	13	2013-05-23 03:35:49.420922	2013-05-23 03:35:49.420922
34206	49	28	13	2013-05-23 03:35:49.421647	2013-05-23 03:35:49.421647
34207	49	29	13	2013-05-23 03:35:49.422399	2013-05-23 03:35:49.422399
34208	49	30	13	2013-05-23 03:35:49.42311	2013-05-23 03:35:49.42311
34209	49	31	13	2013-05-23 03:35:49.423812	2013-05-23 03:35:49.423812
34210	49	32	13	2013-05-23 03:35:49.424848	2013-05-23 03:35:49.424848
34211	49	33	13	2013-05-23 03:35:49.425666	2013-05-23 03:35:49.425666
34212	49	34	13	2013-05-23 03:35:49.426865	2013-05-23 03:35:49.426865
34213	49	35	13	2013-05-23 03:35:49.428119	2013-05-23 03:35:49.428119
34214	49	12	14	2013-05-23 03:35:49.43061	2013-05-23 03:35:49.43061
34215	49	23	14	2013-05-23 03:35:49.432349	2013-05-23 03:35:49.432349
34216	49	12	15	2013-05-23 03:35:49.434037	2013-05-23 03:35:49.434037
34217	49	23	15	2013-05-23 03:35:49.4355	2013-05-23 03:35:49.4355
34218	49	0	16	2013-05-23 03:35:49.436678	2013-05-23 03:35:49.436678
34219	49	1	16	2013-05-23 03:35:49.43752	2013-05-23 03:35:49.43752
34220	49	2	16	2013-05-23 03:35:49.43834	2013-05-23 03:35:49.43834
34221	49	3	16	2013-05-23 03:35:49.439112	2013-05-23 03:35:49.439112
34222	49	4	16	2013-05-23 03:35:49.43988	2013-05-23 03:35:49.43988
34223	49	5	16	2013-05-23 03:35:49.440644	2013-05-23 03:35:49.440644
34224	49	6	16	2013-05-23 03:35:49.441669	2013-05-23 03:35:49.441669
34225	49	7	16	2013-05-23 03:35:49.442452	2013-05-23 03:35:49.442452
34226	49	8	16	2013-05-23 03:35:49.443617	2013-05-23 03:35:49.443617
34227	49	9	16	2013-05-23 03:35:49.444898	2013-05-23 03:35:49.444898
34228	49	10	16	2013-05-23 03:35:49.446801	2013-05-23 03:35:49.446801
34229	49	11	16	2013-05-23 03:35:49.448128	2013-05-23 03:35:49.448128
34230	49	12	16	2013-05-23 03:35:49.449277	2013-05-23 03:35:49.449277
34231	49	23	16	2013-05-23 03:35:49.450387	2013-05-23 03:35:49.450387
34232	49	24	16	2013-05-23 03:35:49.451477	2013-05-23 03:35:49.451477
34233	49	25	16	2013-05-23 03:35:49.452468	2013-05-23 03:35:49.452468
34234	49	26	16	2013-05-23 03:35:49.453384	2013-05-23 03:35:49.453384
34235	49	27	16	2013-05-23 03:35:49.454597	2013-05-23 03:35:49.454597
34236	49	28	16	2013-05-23 03:35:49.455489	2013-05-23 03:35:49.455489
34237	49	29	16	2013-05-23 03:35:49.456335	2013-05-23 03:35:49.456335
34238	49	30	16	2013-05-23 03:35:49.457126	2013-05-23 03:35:49.457126
34239	49	31	16	2013-05-23 03:35:49.458032	2013-05-23 03:35:49.458032
34240	49	32	16	2013-05-23 03:35:49.458897	2013-05-23 03:35:49.458897
34241	49	33	16	2013-05-23 03:35:49.459745	2013-05-23 03:35:49.459745
34242	49	34	16	2013-05-23 03:35:49.460577	2013-05-23 03:35:49.460577
34243	49	35	16	2013-05-23 03:35:49.461301	2013-05-23 03:35:49.461301
36338	53	5	0	2013-05-25 00:43:53.212548	2013-05-25 00:43:53.212548
36339	53	6	0	2013-05-25 00:43:53.214126	2013-05-25 00:43:53.214126
36340	53	28	0	2013-05-25 00:43:53.215463	2013-05-25 00:43:53.215463
36341	53	29	0	2013-05-25 00:43:53.216189	2013-05-25 00:43:53.216189
36342	53	5	1	2013-05-25 00:43:53.216865	2013-05-25 00:43:53.216865
36343	53	6	1	2013-05-25 00:43:53.217519	2013-05-25 00:43:53.217519
36344	53	28	1	2013-05-25 00:43:53.218199	2013-05-25 00:43:53.218199
36345	53	29	1	2013-05-25 00:43:53.21885	2013-05-25 00:43:53.21885
36346	53	5	2	2013-05-25 00:43:53.21969	2013-05-25 00:43:53.21969
36347	53	6	2	2013-05-25 00:43:53.220391	2013-05-25 00:43:53.220391
36348	53	28	2	2013-05-25 00:43:53.22112	2013-05-25 00:43:53.22112
36349	53	29	2	2013-05-25 00:43:53.2218	2013-05-25 00:43:53.2218
36350	53	5	3	2013-05-25 00:43:53.222473	2013-05-25 00:43:53.222473
36351	53	6	3	2013-05-25 00:43:53.223129	2013-05-25 00:43:53.223129
36352	53	28	3	2013-05-25 00:43:53.223808	2013-05-25 00:43:53.223808
36353	53	29	3	2013-05-25 00:43:53.224462	2013-05-25 00:43:53.224462
36354	53	5	4	2013-05-25 00:43:53.225122	2013-05-25 00:43:53.225122
36355	53	6	4	2013-05-25 00:43:53.225772	2013-05-25 00:43:53.225772
36356	53	28	4	2013-05-25 00:43:53.22989	2013-05-25 00:43:53.22989
36357	53	29	4	2013-05-25 00:43:53.230654	2013-05-25 00:43:53.230654
36358	53	5	5	2013-05-25 00:43:53.231348	2013-05-25 00:43:53.231348
36359	53	6	5	2013-05-25 00:43:53.232017	2013-05-25 00:43:53.232017
36360	53	28	5	2013-05-25 00:43:53.232794	2013-05-25 00:43:53.232794
36361	53	29	5	2013-05-25 00:43:53.233518	2013-05-25 00:43:53.233518
36362	53	5	6	2013-05-25 00:43:53.234205	2013-05-25 00:43:53.234205
36363	53	6	6	2013-05-25 00:43:53.234915	2013-05-25 00:43:53.234915
36364	53	28	6	2013-05-25 00:43:53.235594	2013-05-25 00:43:53.235594
36365	53	29	6	2013-05-25 00:43:53.236643	2013-05-25 00:43:53.236643
36366	51	0	6	2013-05-25 00:44:09.08342	2013-05-25 00:44:09.08342
36367	51	1	6	2013-05-25 00:44:09.084133	2013-05-25 00:44:09.084133
36368	51	2	6	2013-05-25 00:44:09.08479	2013-05-25 00:44:09.08479
36369	51	3	6	2013-05-25 00:44:09.085552	2013-05-25 00:44:09.085552
36370	51	4	6	2013-05-25 00:44:09.086444	2013-05-25 00:44:09.086444
36371	51	5	6	2013-05-25 00:44:09.087421	2013-05-25 00:44:09.087421
36372	51	6	6	2013-05-25 00:44:09.0883	2013-05-25 00:44:09.0883
36373	51	7	6	2013-05-25 00:44:09.089	2013-05-25 00:44:09.089
36374	51	8	6	2013-05-25 00:44:09.08972	2013-05-25 00:44:09.08972
36375	51	9	6	2013-05-25 00:44:09.090467	2013-05-25 00:44:09.090467
36376	51	10	6	2013-05-25 00:44:09.091277	2013-05-25 00:44:09.091277
36377	51	11	6	2013-05-25 00:44:09.092008	2013-05-25 00:44:09.092008
36378	51	12	6	2013-05-25 00:44:09.092666	2013-05-25 00:44:09.092666
36379	51	13	6	2013-05-25 00:44:09.093411	2013-05-25 00:44:09.093411
36380	51	14	6	2013-05-25 00:44:09.094107	2013-05-25 00:44:09.094107
36381	51	15	6	2013-05-25 00:44:09.094791	2013-05-25 00:44:09.094791
36382	51	16	6	2013-05-25 00:44:09.095475	2013-05-25 00:44:09.095475
36383	51	17	6	2013-05-25 00:44:09.096169	2013-05-25 00:44:09.096169
36384	51	18	6	2013-05-25 00:44:09.096846	2013-05-25 00:44:09.096846
36385	51	19	6	2013-05-25 00:44:09.097522	2013-05-25 00:44:09.097522
36386	51	20	6	2013-05-25 00:44:09.098202	2013-05-25 00:44:09.098202
36387	51	21	6	2013-05-25 00:44:09.098896	2013-05-25 00:44:09.098896
36388	51	22	6	2013-05-25 00:44:09.099608	2013-05-25 00:44:09.099608
36389	51	23	6	2013-05-25 00:44:09.10054	2013-05-25 00:44:09.10054
36390	51	24	6	2013-05-25 00:44:09.10139	2013-05-25 00:44:09.10139
36391	51	25	6	2013-05-25 00:44:09.102133	2013-05-25 00:44:09.102133
36392	51	26	6	2013-05-25 00:44:09.102822	2013-05-25 00:44:09.102822
36393	51	25	7	2013-05-25 00:44:09.106794	2013-05-25 00:44:09.106794
36394	51	26	7	2013-05-25 00:44:09.107476	2013-05-25 00:44:09.107476
36395	51	25	8	2013-05-25 00:44:09.10818	2013-05-25 00:44:09.10818
36396	51	26	8	2013-05-25 00:44:09.109029	2013-05-25 00:44:09.109029
36397	51	0	13	2013-05-25 00:44:09.111845	2013-05-25 00:44:09.111845
36398	51	1	13	2013-05-25 00:44:09.112671	2013-05-25 00:44:09.112671
36399	51	2	13	2013-05-25 00:44:09.113419	2013-05-25 00:44:09.113419
36400	51	3	13	2013-05-25 00:44:09.114084	2013-05-25 00:44:09.114084
36401	51	4	13	2013-05-25 00:44:09.114739	2013-05-25 00:44:09.114739
36402	51	5	13	2013-05-25 00:44:09.115451	2013-05-25 00:44:09.115451
36403	51	6	13	2013-05-25 00:44:09.116169	2013-05-25 00:44:09.116169
36404	51	7	13	2013-05-25 00:44:09.1172	2013-05-25 00:44:09.1172
36405	51	8	13	2013-05-25 00:44:09.11801	2013-05-25 00:44:09.11801
36406	51	9	13	2013-05-25 00:44:09.118687	2013-05-25 00:44:09.118687
36407	51	10	13	2013-05-25 00:44:09.119396	2013-05-25 00:44:09.119396
36408	51	11	13	2013-05-25 00:44:09.120078	2013-05-25 00:44:09.120078
36409	51	12	13	2013-05-25 00:44:09.121126	2013-05-25 00:44:09.121126
36410	51	13	13	2013-05-25 00:44:09.121842	2013-05-25 00:44:09.121842
36411	51	14	13	2013-05-25 00:44:09.122528	2013-05-25 00:44:09.122528
36412	51	15	13	2013-05-25 00:44:09.123202	2013-05-25 00:44:09.123202
36413	51	16	13	2013-05-25 00:44:09.123873	2013-05-25 00:44:09.123873
36414	51	17	13	2013-05-25 00:44:09.12453	2013-05-25 00:44:09.12453
36415	51	18	13	2013-05-25 00:44:09.125239	2013-05-25 00:44:09.125239
36416	51	17	14	2013-05-25 00:44:09.129855	2013-05-25 00:44:09.129855
36417	51	18	14	2013-05-25 00:44:09.130581	2013-05-25 00:44:09.130581
36418	51	17	15	2013-05-25 00:44:09.131421	2013-05-25 00:44:09.131421
36419	51	18	15	2013-05-25 00:44:09.132105	2013-05-25 00:44:09.132105
36548	52	18	0	2013-05-25 00:52:46.745346	2013-05-25 00:52:46.745346
36549	52	19	0	2013-05-25 00:52:46.746372	2013-05-25 00:52:46.746372
36550	52	18	1	2013-05-25 00:52:46.747136	2013-05-25 00:52:46.747136
36551	52	19	1	2013-05-25 00:52:46.747832	2013-05-25 00:52:46.747832
36552	52	18	2	2013-05-25 00:52:46.748697	2013-05-25 00:52:46.748697
36553	52	19	2	2013-05-25 00:52:46.749443	2013-05-25 00:52:46.749443
36554	52	18	3	2013-05-25 00:52:46.750205	2013-05-25 00:52:46.750205
36555	52	19	3	2013-05-25 00:52:46.750923	2013-05-25 00:52:46.750923
36556	52	18	4	2013-05-25 00:52:46.754181	2013-05-25 00:52:46.754181
36557	52	19	4	2013-05-25 00:52:46.754888	2013-05-25 00:52:46.754888
36558	52	18	5	2013-05-25 00:52:46.757973	2013-05-25 00:52:46.757973
36559	52	19	5	2013-05-25 00:52:46.758684	2013-05-25 00:52:46.758684
36560	52	18	6	2013-05-25 00:52:46.75941	2013-05-25 00:52:46.75941
36561	52	19	6	2013-05-25 00:52:46.760074	2013-05-25 00:52:46.760074
36562	52	18	7	2013-05-25 00:52:46.76159	2013-05-25 00:52:46.76159
36563	52	19	7	2013-05-25 00:52:46.762259	2013-05-25 00:52:46.762259
36564	52	17	8	2013-05-25 00:52:46.764526	2013-05-25 00:52:46.764526
36565	52	18	8	2013-05-25 00:52:46.765234	2013-05-25 00:52:46.765234
36566	52	19	8	2013-05-25 00:52:46.765897	2013-05-25 00:52:46.765897
36567	52	20	8	2013-05-25 00:52:46.766558	2013-05-25 00:52:46.766558
36568	52	11	9	2013-05-25 00:52:46.769168	2013-05-25 00:52:46.769168
36569	52	12	9	2013-05-25 00:52:46.769914	2013-05-25 00:52:46.769914
36570	52	13	9	2013-05-25 00:52:46.77066	2013-05-25 00:52:46.77066
36571	52	14	9	2013-05-25 00:52:46.77136	2013-05-25 00:52:46.77136
36572	52	15	9	2013-05-25 00:52:46.772078	2013-05-25 00:52:46.772078
36573	52	16	9	2013-05-25 00:52:46.77284	2013-05-25 00:52:46.77284
36574	52	17	9	2013-05-25 00:52:46.773536	2013-05-25 00:52:46.773536
36575	52	18	9	2013-05-25 00:52:46.774257	2013-05-25 00:52:46.774257
36576	52	19	9	2013-05-25 00:52:46.774949	2013-05-25 00:52:46.774949
36577	52	20	9	2013-05-25 00:52:46.77582	2013-05-25 00:52:46.77582
36578	52	21	9	2013-05-25 00:52:46.776787	2013-05-25 00:52:46.776787
36579	52	22	9	2013-05-25 00:52:46.777762	2013-05-25 00:52:46.777762
36580	52	23	9	2013-05-25 00:52:46.778895	2013-05-25 00:52:46.778895
36581	52	24	9	2013-05-25 00:52:46.779837	2013-05-25 00:52:46.779837
36582	52	25	9	2013-05-25 00:52:46.780876	2013-05-25 00:52:46.780876
36583	52	5	10	2013-05-25 00:52:46.783729	2013-05-25 00:52:46.783729
36584	52	6	10	2013-05-25 00:52:46.78463	2013-05-25 00:52:46.78463
36585	52	7	10	2013-05-25 00:52:46.78551	2013-05-25 00:52:46.78551
36586	52	8	10	2013-05-25 00:52:46.786323	2013-05-25 00:52:46.786323
36587	52	9	10	2013-05-25 00:52:46.78727	2013-05-25 00:52:46.78727
36588	52	10	10	2013-05-25 00:52:46.78825	2013-05-25 00:52:46.78825
36589	52	11	10	2013-05-25 00:52:46.789272	2013-05-25 00:52:46.789272
36590	52	12	10	2013-05-25 00:52:46.790119	2013-05-25 00:52:46.790119
36591	52	24	10	2013-05-25 00:52:46.792661	2013-05-25 00:52:46.792661
36592	52	25	10	2013-05-25 00:52:46.793382	2013-05-25 00:52:46.793382
36593	52	26	10	2013-05-25 00:52:46.794101	2013-05-25 00:52:46.794101
36594	52	27	10	2013-05-25 00:52:46.794898	2013-05-25 00:52:46.794898
36595	52	28	10	2013-05-25 00:52:46.795906	2013-05-25 00:52:46.795906
36596	52	29	10	2013-05-25 00:52:46.796949	2013-05-25 00:52:46.796949
36597	52	30	10	2013-05-25 00:52:46.797828	2013-05-25 00:52:46.797828
36598	52	0	11	2013-05-25 00:52:46.799581	2013-05-25 00:52:46.799581
36599	52	1	11	2013-05-25 00:52:46.80033	2013-05-25 00:52:46.80033
36600	52	2	11	2013-05-25 00:52:46.801062	2013-05-25 00:52:46.801062
36601	52	5	11	2013-05-25 00:52:46.802728	2013-05-25 00:52:46.802728
36602	52	6	11	2013-05-25 00:52:46.803457	2013-05-25 00:52:46.803457
36603	52	29	11	2013-05-25 00:52:46.807925	2013-05-25 00:52:46.807925
36604	52	30	11	2013-05-25 00:52:46.808813	2013-05-25 00:52:46.808813
36605	52	33	11	2013-05-25 00:52:46.810472	2013-05-25 00:52:46.810472
36606	52	34	11	2013-05-25 00:52:46.8115	2013-05-25 00:52:46.8115
36607	52	35	11	2013-05-25 00:52:46.812344	2013-05-25 00:52:46.812344
36608	52	5	12	2013-05-25 00:52:46.814191	2013-05-25 00:52:46.814191
36609	52	6	12	2013-05-25 00:52:46.815039	2013-05-25 00:52:46.815039
36610	52	29	12	2013-05-25 00:52:46.815971	2013-05-25 00:52:46.815971
36611	52	30	12	2013-05-25 00:52:46.816782	2013-05-25 00:52:46.816782
38662	25	6	0	2013-05-26 04:37:22.84516	2013-05-26 04:37:22.84516
38663	25	7	0	2013-05-26 04:37:22.84612	2013-05-26 04:37:22.84612
38664	25	8	0	2013-05-26 04:37:22.847188	2013-05-26 04:37:22.847188
38665	25	9	0	2013-05-26 04:37:22.848055	2013-05-26 04:37:22.848055
38666	25	10	0	2013-05-26 04:37:22.848785	2013-05-26 04:37:22.848785
38667	25	6	1	2013-05-26 04:37:22.855445	2013-05-26 04:37:22.855445
38668	25	7	1	2013-05-26 04:37:22.856128	2013-05-26 04:37:22.856128
38669	25	8	1	2013-05-26 04:37:22.856792	2013-05-26 04:37:22.856792
38670	25	9	1	2013-05-26 04:37:22.857446	2013-05-26 04:37:22.857446
38671	25	10	1	2013-05-26 04:37:22.858158	2013-05-26 04:37:22.858158
38672	25	6	2	2013-05-26 04:37:22.858882	2013-05-26 04:37:22.858882
38673	25	7	2	2013-05-26 04:37:22.859532	2013-05-26 04:37:22.859532
38674	25	8	2	2013-05-26 04:37:22.860177	2013-05-26 04:37:22.860177
38675	25	9	2	2013-05-26 04:37:22.86083	2013-05-26 04:37:22.86083
38676	25	10	2	2013-05-26 04:37:22.861505	2013-05-26 04:37:22.861505
38677	25	6	3	2013-05-26 04:37:22.862195	2013-05-26 04:37:22.862195
38678	25	7	3	2013-05-26 04:37:22.862839	2013-05-26 04:37:22.862839
38679	25	8	3	2013-05-26 04:37:22.863515	2013-05-26 04:37:22.863515
38680	25	25	3	2013-05-26 04:37:22.864208	2013-05-26 04:37:22.864208
38681	25	26	3	2013-05-26 04:37:22.864853	2013-05-26 04:37:22.864853
38682	25	6	4	2013-05-26 04:37:22.86575	2013-05-26 04:37:22.86575
38683	25	7	4	2013-05-26 04:37:22.866661	2013-05-26 04:37:22.866661
38684	25	8	4	2013-05-26 04:37:22.867545	2013-05-26 04:37:22.867545
38685	25	25	4	2013-05-26 04:37:22.869091	2013-05-26 04:37:22.869091
38686	25	26	4	2013-05-26 04:37:22.869759	2013-05-26 04:37:22.869759
38687	25	8	5	2013-05-26 04:37:22.870464	2013-05-26 04:37:22.870464
38688	25	9	5	2013-05-26 04:37:22.871113	2013-05-26 04:37:22.871113
38689	25	10	5	2013-05-26 04:37:22.87185	2013-05-26 04:37:22.87185
38690	25	25	5	2013-05-26 04:37:22.872596	2013-05-26 04:37:22.872596
38691	25	26	5	2013-05-26 04:37:22.873261	2013-05-26 04:37:22.873261
38692	25	8	6	2013-05-26 04:37:22.876243	2013-05-26 04:37:22.876243
38693	25	9	6	2013-05-26 04:37:22.877017	2013-05-26 04:37:22.877017
38694	25	10	6	2013-05-26 04:37:22.877758	2013-05-26 04:37:22.877758
38695	25	25	6	2013-05-26 04:37:22.878481	2013-05-26 04:37:22.878481
38696	25	26	6	2013-05-26 04:37:22.87915	2013-05-26 04:37:22.87915
38697	25	8	7	2013-05-26 04:37:22.87987	2013-05-26 04:37:22.87987
38698	25	9	7	2013-05-26 04:37:22.880524	2013-05-26 04:37:22.880524
38699	25	10	7	2013-05-26 04:37:22.881181	2013-05-26 04:37:22.881181
38700	25	25	7	2013-05-26 04:37:22.881878	2013-05-26 04:37:22.881878
38701	25	26	7	2013-05-26 04:37:22.882557	2013-05-26 04:37:22.882557
38702	25	8	8	2013-05-26 04:37:22.883308	2013-05-26 04:37:22.883308
38703	25	9	8	2013-05-26 04:37:22.884064	2013-05-26 04:37:22.884064
38704	25	10	8	2013-05-26 04:37:22.88481	2013-05-26 04:37:22.88481
38705	25	11	8	2013-05-26 04:37:22.885524	2013-05-26 04:37:22.885524
38706	25	12	8	2013-05-26 04:37:22.886199	2013-05-26 04:37:22.886199
38707	25	25	8	2013-05-26 04:37:22.886919	2013-05-26 04:37:22.886919
38708	25	26	8	2013-05-26 04:37:22.887579	2013-05-26 04:37:22.887579
38709	25	8	9	2013-05-26 04:37:22.889393	2013-05-26 04:37:22.889393
38710	25	9	9	2013-05-26 04:37:22.890128	2013-05-26 04:37:22.890128
38711	25	10	9	2013-05-26 04:37:22.890829	2013-05-26 04:37:22.890829
38712	25	11	9	2013-05-26 04:37:22.891516	2013-05-26 04:37:22.891516
38713	25	12	9	2013-05-26 04:37:22.892184	2013-05-26 04:37:22.892184
38714	25	25	9	2013-05-26 04:37:22.893694	2013-05-26 04:37:22.893694
38715	25	26	9	2013-05-26 04:37:22.894397	2013-05-26 04:37:22.894397
38716	25	8	10	2013-05-26 04:37:22.895078	2013-05-26 04:37:22.895078
38717	25	9	10	2013-05-26 04:37:22.895781	2013-05-26 04:37:22.895781
38718	25	10	10	2013-05-26 04:37:22.896438	2013-05-26 04:37:22.896438
38719	25	11	10	2013-05-26 04:37:22.897085	2013-05-26 04:37:22.897085
38720	25	12	10	2013-05-26 04:37:22.897732	2013-05-26 04:37:22.897732
38721	25	25	10	2013-05-26 04:37:22.899219	2013-05-26 04:37:22.899219
38722	25	26	10	2013-05-26 04:37:22.900032	2013-05-26 04:37:22.900032
38723	25	8	11	2013-05-26 04:37:22.901711	2013-05-26 04:37:22.901711
38724	25	9	11	2013-05-26 04:37:22.902413	2013-05-26 04:37:22.902413
38725	25	10	11	2013-05-26 04:37:22.903107	2013-05-26 04:37:22.903107
38726	25	11	11	2013-05-26 04:37:22.9038	2013-05-26 04:37:22.9038
38727	25	12	11	2013-05-26 04:37:22.904548	2013-05-26 04:37:22.904548
38728	25	25	11	2013-05-26 04:37:22.905336	2013-05-26 04:37:22.905336
38729	25	26	11	2013-05-26 04:37:22.90602	2013-05-26 04:37:22.90602
38730	25	8	12	2013-05-26 04:37:22.910477	2013-05-26 04:37:22.910477
38731	25	9	12	2013-05-26 04:37:22.911624	2013-05-26 04:37:22.911624
38732	25	10	12	2013-05-26 04:37:22.912677	2013-05-26 04:37:22.912677
38733	25	11	12	2013-05-26 04:37:22.913839	2013-05-26 04:37:22.913839
38734	25	12	12	2013-05-26 04:37:22.914893	2013-05-26 04:37:22.914893
38735	25	25	12	2013-05-26 04:37:22.915921	2013-05-26 04:37:22.915921
38736	25	26	12	2013-05-26 04:37:22.916935	2013-05-26 04:37:22.916935
38737	25	8	13	2013-05-26 04:37:22.918983	2013-05-26 04:37:22.918983
38738	25	9	13	2013-05-26 04:37:22.919856	2013-05-26 04:37:22.919856
38739	25	10	13	2013-05-26 04:37:22.920637	2013-05-26 04:37:22.920637
38740	25	11	13	2013-05-26 04:37:22.92149	2013-05-26 04:37:22.92149
38741	25	12	13	2013-05-26 04:37:22.922276	2013-05-26 04:37:22.922276
38742	25	25	13	2013-05-26 04:37:22.923091	2013-05-26 04:37:22.923091
38743	25	26	13	2013-05-26 04:37:22.923803	2013-05-26 04:37:22.923803
38744	25	10	14	2013-05-26 04:37:22.92452	2013-05-26 04:37:22.92452
38745	25	11	14	2013-05-26 04:37:22.925206	2013-05-26 04:37:22.925206
38746	25	12	14	2013-05-26 04:37:22.92588	2013-05-26 04:37:22.92588
38747	25	25	14	2013-05-26 04:37:22.926633	2013-05-26 04:37:22.926633
38748	25	26	14	2013-05-26 04:37:22.927386	2013-05-26 04:37:22.927386
38749	25	10	15	2013-05-26 04:37:22.928206	2013-05-26 04:37:22.928206
38750	25	11	15	2013-05-26 04:37:22.928903	2013-05-26 04:37:22.928903
38751	25	12	15	2013-05-26 04:37:22.929587	2013-05-26 04:37:22.929587
38752	25	13	15	2013-05-26 04:37:22.930259	2013-05-26 04:37:22.930259
38753	25	14	15	2013-05-26 04:37:22.930925	2013-05-26 04:37:22.930925
38754	25	25	15	2013-05-26 04:37:22.9316	2013-05-26 04:37:22.9316
38755	25	26	15	2013-05-26 04:37:22.932324	2013-05-26 04:37:22.932324
38756	25	10	16	2013-05-26 04:37:22.933029	2013-05-26 04:37:22.933029
38757	25	11	16	2013-05-26 04:37:22.933741	2013-05-26 04:37:22.933741
38758	25	12	16	2013-05-26 04:37:22.934494	2013-05-26 04:37:22.934494
38759	25	13	16	2013-05-26 04:37:22.935188	2013-05-26 04:37:22.935188
38760	25	14	16	2013-05-26 04:37:22.935851	2013-05-26 04:37:22.935851
38761	25	25	16	2013-05-26 04:37:22.936522	2013-05-26 04:37:22.936522
38762	25	26	16	2013-05-26 04:37:22.937175	2013-05-26 04:37:22.937175
38763	25	10	17	2013-05-26 04:37:22.937859	2013-05-26 04:37:22.937859
38764	25	11	17	2013-05-26 04:37:22.938529	2013-05-26 04:37:22.938529
38765	25	12	17	2013-05-26 04:37:22.939216	2013-05-26 04:37:22.939216
38766	25	13	17	2013-05-26 04:37:22.939862	2013-05-26 04:37:22.939862
38767	25	14	17	2013-05-26 04:37:22.940507	2013-05-26 04:37:22.940507
38768	25	15	17	2013-05-26 04:37:22.941194	2013-05-26 04:37:22.941194
38769	25	16	17	2013-05-26 04:37:22.941846	2013-05-26 04:37:22.941846
38770	25	17	17	2013-05-26 04:37:22.942506	2013-05-26 04:37:22.942506
38771	25	18	17	2013-05-26 04:37:22.943185	2013-05-26 04:37:22.943185
38772	25	19	17	2013-05-26 04:37:22.943825	2013-05-26 04:37:22.943825
38773	25	20	17	2013-05-26 04:37:22.944468	2013-05-26 04:37:22.944468
38774	25	21	17	2013-05-26 04:37:22.945107	2013-05-26 04:37:22.945107
38775	25	22	17	2013-05-26 04:37:22.945746	2013-05-26 04:37:22.945746
38776	25	23	17	2013-05-26 04:37:22.946385	2013-05-26 04:37:22.946385
38777	25	24	17	2013-05-26 04:37:22.94705	2013-05-26 04:37:22.94705
38778	25	25	17	2013-05-26 04:37:22.947712	2013-05-26 04:37:22.947712
38779	25	26	17	2013-05-26 04:37:22.948351	2013-05-26 04:37:22.948351
38872	35	10	0	2013-05-26 04:50:54.588517	2013-05-26 04:50:54.588517
38873	35	11	0	2013-05-26 04:50:54.589506	2013-05-26 04:50:54.589506
38874	35	12	0	2013-05-26 04:50:54.590262	2013-05-26 04:50:54.590262
38875	35	13	0	2013-05-26 04:50:54.590967	2013-05-26 04:50:54.590967
38876	35	14	0	2013-05-26 04:50:54.591658	2013-05-26 04:50:54.591658
38877	35	15	0	2013-05-26 04:50:54.592394	2013-05-26 04:50:54.592394
38878	35	16	0	2013-05-26 04:50:54.593103	2013-05-26 04:50:54.593103
38879	35	17	0	2013-05-26 04:50:54.59385	2013-05-26 04:50:54.59385
38880	35	18	0	2013-05-26 04:50:54.594607	2013-05-26 04:50:54.594607
38881	35	19	0	2013-05-26 04:50:54.595333	2013-05-26 04:50:54.595333
38882	35	20	0	2013-05-26 04:50:54.596003	2013-05-26 04:50:54.596003
38883	35	21	0	2013-05-26 04:50:54.596699	2013-05-26 04:50:54.596699
38884	35	22	0	2013-05-26 04:50:54.597402	2013-05-26 04:50:54.597402
38885	35	23	0	2013-05-26 04:50:54.598091	2013-05-26 04:50:54.598091
38886	35	10	1	2013-05-26 04:50:54.598779	2013-05-26 04:50:54.598779
38887	35	11	1	2013-05-26 04:50:54.599438	2013-05-26 04:50:54.599438
38888	35	12	1	2013-05-26 04:50:54.600106	2013-05-26 04:50:54.600106
38889	35	13	1	2013-05-26 04:50:54.600854	2013-05-26 04:50:54.600854
38890	35	10	2	2013-05-26 04:50:54.603483	2013-05-26 04:50:54.603483
38891	35	11	2	2013-05-26 04:50:54.604187	2013-05-26 04:50:54.604187
38892	35	12	2	2013-05-26 04:50:54.604867	2013-05-26 04:50:54.604867
38893	35	13	2	2013-05-26 04:50:54.605527	2013-05-26 04:50:54.605527
38894	35	8	3	2013-05-26 04:50:54.607087	2013-05-26 04:50:54.607087
38895	35	9	3	2013-05-26 04:50:54.607751	2013-05-26 04:50:54.607751
38896	35	10	3	2013-05-26 04:50:54.608402	2013-05-26 04:50:54.608402
38897	35	11	3	2013-05-26 04:50:54.609047	2013-05-26 04:50:54.609047
38898	35	8	4	2013-05-26 04:50:54.611832	2013-05-26 04:50:54.611832
38899	35	9	4	2013-05-26 04:50:54.612544	2013-05-26 04:50:54.612544
38900	35	10	4	2013-05-26 04:50:54.613219	2013-05-26 04:50:54.613219
38901	35	11	4	2013-05-26 04:50:54.613882	2013-05-26 04:50:54.613882
38902	35	8	5	2013-05-26 04:50:54.617619	2013-05-26 04:50:54.617619
38903	35	9	5	2013-05-26 04:50:54.618327	2013-05-26 04:50:54.618327
38904	35	10	5	2013-05-26 04:50:54.619	2013-05-26 04:50:54.619
38905	35	11	5	2013-05-26 04:50:54.619658	2013-05-26 04:50:54.619658
38906	35	6	6	2013-05-26 04:50:54.620405	2013-05-26 04:50:54.620405
38907	35	7	6	2013-05-26 04:50:54.621063	2013-05-26 04:50:54.621063
38908	35	8	6	2013-05-26 04:50:54.62176	2013-05-26 04:50:54.62176
38909	35	9	6	2013-05-26 04:50:54.622425	2013-05-26 04:50:54.622425
38910	35	6	7	2013-05-26 04:50:54.623135	2013-05-26 04:50:54.623135
38911	35	7	7	2013-05-26 04:50:54.62385	2013-05-26 04:50:54.62385
38912	35	8	7	2013-05-26 04:50:54.624616	2013-05-26 04:50:54.624616
38913	35	9	7	2013-05-26 04:50:54.625359	2013-05-26 04:50:54.625359
38914	35	6	8	2013-05-26 04:50:54.626084	2013-05-26 04:50:54.626084
38915	35	7	8	2013-05-26 04:50:54.626758	2013-05-26 04:50:54.626758
38916	35	8	8	2013-05-26 04:50:54.627467	2013-05-26 04:50:54.627467
38917	35	9	8	2013-05-26 04:50:54.628123	2013-05-26 04:50:54.628123
38918	35	26	8	2013-05-26 04:50:54.628803	2013-05-26 04:50:54.628803
38919	35	27	8	2013-05-26 04:50:54.629458	2013-05-26 04:50:54.629458
38920	35	4	9	2013-05-26 04:50:54.630187	2013-05-26 04:50:54.630187
38921	35	5	9	2013-05-26 04:50:54.630844	2013-05-26 04:50:54.630844
38922	35	6	9	2013-05-26 04:50:54.631498	2013-05-26 04:50:54.631498
38923	35	7	9	2013-05-26 04:50:54.632145	2013-05-26 04:50:54.632145
38924	35	26	9	2013-05-26 04:50:54.632857	2013-05-26 04:50:54.632857
38925	35	27	9	2013-05-26 04:50:54.633614	2013-05-26 04:50:54.633614
38926	35	4	10	2013-05-26 04:50:54.634508	2013-05-26 04:50:54.634508
38927	35	5	10	2013-05-26 04:50:54.635337	2013-05-26 04:50:54.635337
38928	35	6	10	2013-05-26 04:50:54.636142	2013-05-26 04:50:54.636142
38929	35	7	10	2013-05-26 04:50:54.636844	2013-05-26 04:50:54.636844
38930	35	26	10	2013-05-26 04:50:54.63757	2013-05-26 04:50:54.63757
38931	35	27	10	2013-05-26 04:50:54.638288	2013-05-26 04:50:54.638288
38932	35	4	11	2013-05-26 04:50:54.641555	2013-05-26 04:50:54.641555
38933	35	5	11	2013-05-26 04:50:54.64262	2013-05-26 04:50:54.64262
38934	35	6	11	2013-05-26 04:50:54.643401	2013-05-26 04:50:54.643401
38935	35	7	11	2013-05-26 04:50:54.644113	2013-05-26 04:50:54.644113
38936	35	26	11	2013-05-26 04:50:54.644836	2013-05-26 04:50:54.644836
38937	35	27	11	2013-05-26 04:50:54.645546	2013-05-26 04:50:54.645546
38938	35	26	12	2013-05-26 04:50:54.650158	2013-05-26 04:50:54.650158
38939	35	27	12	2013-05-26 04:50:54.650873	2013-05-26 04:50:54.650873
38940	35	14	13	2013-05-26 04:50:54.652647	2013-05-26 04:50:54.652647
38941	35	15	13	2013-05-26 04:50:54.653635	2013-05-26 04:50:54.653635
38942	35	26	13	2013-05-26 04:50:54.654364	2013-05-26 04:50:54.654364
38943	35	27	13	2013-05-26 04:50:54.655061	2013-05-26 04:50:54.655061
38944	35	14	14	2013-05-26 04:50:54.656589	2013-05-26 04:50:54.656589
38945	35	15	14	2013-05-26 04:50:54.657272	2013-05-26 04:50:54.657272
38946	35	26	14	2013-05-26 04:50:54.658125	2013-05-26 04:50:54.658125
38947	35	27	14	2013-05-26 04:50:54.658946	2013-05-26 04:50:54.658946
38948	35	14	15	2013-05-26 04:50:54.659748	2013-05-26 04:50:54.659748
38949	35	15	15	2013-05-26 04:50:54.660447	2013-05-26 04:50:54.660447
38950	35	26	15	2013-05-26 04:50:54.661146	2013-05-26 04:50:54.661146
38951	35	27	15	2013-05-26 04:50:54.661856	2013-05-26 04:50:54.661856
38952	35	14	16	2013-05-26 04:50:54.662603	2013-05-26 04:50:54.662603
38953	35	15	16	2013-05-26 04:50:54.663268	2013-05-26 04:50:54.663268
38954	35	26	16	2013-05-26 04:50:54.664322	2013-05-26 04:50:54.664322
38955	35	27	16	2013-05-26 04:50:54.66563	2013-05-26 04:50:54.66563
38956	35	14	17	2013-05-26 04:50:54.666953	2013-05-26 04:50:54.666953
38957	35	15	17	2013-05-26 04:50:54.668297	2013-05-26 04:50:54.668297
38958	35	26	17	2013-05-26 04:50:54.669629	2013-05-26 04:50:54.669629
38959	35	27	17	2013-05-26 04:50:54.670743	2013-05-26 04:50:54.670743
38960	35	14	18	2013-05-26 04:50:54.671846	2013-05-26 04:50:54.671846
38961	35	15	18	2013-05-26 04:50:54.672866	2013-05-26 04:50:54.672866
38962	35	26	18	2013-05-26 04:50:54.673936	2013-05-26 04:50:54.673936
38963	35	27	18	2013-05-26 04:50:54.674841	2013-05-26 04:50:54.674841
38964	35	14	19	2013-05-26 04:50:54.675757	2013-05-26 04:50:54.675757
38965	35	15	19	2013-05-26 04:50:54.676673	2013-05-26 04:50:54.676673
38966	35	26	19	2013-05-26 04:50:54.677477	2013-05-26 04:50:54.677477
38967	35	27	19	2013-05-26 04:50:54.678194	2013-05-26 04:50:54.678194
38968	35	14	20	2013-05-26 04:50:54.678928	2013-05-26 04:50:54.678928
38969	35	15	20	2013-05-26 04:50:54.679621	2013-05-26 04:50:54.679621
38970	35	26	20	2013-05-26 04:50:54.680322	2013-05-26 04:50:54.680322
38971	35	27	20	2013-05-26 04:50:54.681002	2013-05-26 04:50:54.681002
38972	35	14	21	2013-05-26 04:50:54.681711	2013-05-26 04:50:54.681711
38973	35	15	21	2013-05-26 04:50:54.682403	2013-05-26 04:50:54.682403
38974	35	26	21	2013-05-26 04:50:54.683088	2013-05-26 04:50:54.683088
38975	35	27	21	2013-05-26 04:50:54.683974	2013-05-26 04:50:54.683974
39114	37	16	0	2013-05-26 05:07:08.753361	2013-05-26 05:07:08.753361
39115	37	17	0	2013-05-26 05:07:08.75427	2013-05-26 05:07:08.75427
39116	37	18	0	2013-05-26 05:07:08.754988	2013-05-26 05:07:08.754988
39117	37	19	0	2013-05-26 05:07:08.755711	2013-05-26 05:07:08.755711
39118	37	16	1	2013-05-26 05:07:08.75643	2013-05-26 05:07:08.75643
39119	37	17	1	2013-05-26 05:07:08.757083	2013-05-26 05:07:08.757083
39120	37	18	1	2013-05-26 05:07:08.757808	2013-05-26 05:07:08.757808
39121	37	19	1	2013-05-26 05:07:08.758524	2013-05-26 05:07:08.758524
39122	37	16	2	2013-05-26 05:07:08.759288	2013-05-26 05:07:08.759288
39123	37	17	2	2013-05-26 05:07:08.759957	2013-05-26 05:07:08.759957
39124	37	18	2	2013-05-26 05:07:08.760619	2013-05-26 05:07:08.760619
39125	37	19	2	2013-05-26 05:07:08.761264	2013-05-26 05:07:08.761264
39126	37	0	8	2013-05-26 05:07:08.766651	2013-05-26 05:07:08.766651
39127	37	1	8	2013-05-26 05:07:08.767396	2013-05-26 05:07:08.767396
39128	37	2	8	2013-05-26 05:07:08.768464	2013-05-26 05:07:08.768464
39129	37	33	8	2013-05-26 05:07:08.772089	2013-05-26 05:07:08.772089
39130	37	34	8	2013-05-26 05:07:08.772769	2013-05-26 05:07:08.772769
39131	37	35	8	2013-05-26 05:07:08.773419	2013-05-26 05:07:08.773419
39132	37	0	9	2013-05-26 05:07:08.774099	2013-05-26 05:07:08.774099
39133	37	1	9	2013-05-26 05:07:08.774745	2013-05-26 05:07:08.774745
39134	37	2	9	2013-05-26 05:07:08.775383	2013-05-26 05:07:08.775383
39135	37	33	9	2013-05-26 05:07:08.77608	2013-05-26 05:07:08.77608
39136	37	34	9	2013-05-26 05:07:08.776774	2013-05-26 05:07:08.776774
39137	37	35	9	2013-05-26 05:07:08.777526	2013-05-26 05:07:08.777526
39138	37	0	10	2013-05-26 05:07:08.77831	2013-05-26 05:07:08.77831
39139	37	1	10	2013-05-26 05:07:08.779048	2013-05-26 05:07:08.779048
39140	37	2	10	2013-05-26 05:07:08.779733	2013-05-26 05:07:08.779733
39141	37	10	10	2013-05-26 05:07:08.780409	2013-05-26 05:07:08.780409
39142	37	11	10	2013-05-26 05:07:08.781207	2013-05-26 05:07:08.781207
39143	37	12	10	2013-05-26 05:07:08.781906	2013-05-26 05:07:08.781906
39144	37	13	10	2013-05-26 05:07:08.782614	2013-05-26 05:07:08.782614
39145	37	17	10	2013-05-26 05:07:08.783316	2013-05-26 05:07:08.783316
39146	37	18	10	2013-05-26 05:07:08.784009	2013-05-26 05:07:08.784009
39147	37	22	10	2013-05-26 05:07:08.784705	2013-05-26 05:07:08.784705
39148	37	23	10	2013-05-26 05:07:08.785436	2013-05-26 05:07:08.785436
39149	37	24	10	2013-05-26 05:07:08.78621	2013-05-26 05:07:08.78621
39150	37	25	10	2013-05-26 05:07:08.787013	2013-05-26 05:07:08.787013
39151	37	33	10	2013-05-26 05:07:08.787809	2013-05-26 05:07:08.787809
39152	37	34	10	2013-05-26 05:07:08.788532	2013-05-26 05:07:08.788532
39153	37	35	10	2013-05-26 05:07:08.789211	2013-05-26 05:07:08.789211
39154	37	0	11	2013-05-26 05:07:08.789903	2013-05-26 05:07:08.789903
39155	37	1	11	2013-05-26 05:07:08.790578	2013-05-26 05:07:08.790578
39156	37	2	11	2013-05-26 05:07:08.791225	2013-05-26 05:07:08.791225
39157	37	10	11	2013-05-26 05:07:08.791882	2013-05-26 05:07:08.791882
39158	37	11	11	2013-05-26 05:07:08.792529	2013-05-26 05:07:08.792529
39159	37	12	11	2013-05-26 05:07:08.793172	2013-05-26 05:07:08.793172
39160	37	13	11	2013-05-26 05:07:08.793813	2013-05-26 05:07:08.793813
39161	37	17	11	2013-05-26 05:07:08.794454	2013-05-26 05:07:08.794454
39162	37	18	11	2013-05-26 05:07:08.795095	2013-05-26 05:07:08.795095
39163	37	22	11	2013-05-26 05:07:08.795734	2013-05-26 05:07:08.795734
39164	37	23	11	2013-05-26 05:07:08.796417	2013-05-26 05:07:08.796417
39165	37	24	11	2013-05-26 05:07:08.797122	2013-05-26 05:07:08.797122
39166	37	25	11	2013-05-26 05:07:08.797955	2013-05-26 05:07:08.797955
39167	37	33	11	2013-05-26 05:07:08.798785	2013-05-26 05:07:08.798785
39168	37	34	11	2013-05-26 05:07:08.7996	2013-05-26 05:07:08.7996
39169	37	35	11	2013-05-26 05:07:08.800454	2013-05-26 05:07:08.800454
39170	37	10	12	2013-05-26 05:07:08.801287	2013-05-26 05:07:08.801287
39171	37	11	12	2013-05-26 05:07:08.802285	2013-05-26 05:07:08.802285
39172	37	12	12	2013-05-26 05:07:08.803238	2013-05-26 05:07:08.803238
39173	37	13	12	2013-05-26 05:07:08.804076	2013-05-26 05:07:08.804076
39174	37	17	12	2013-05-26 05:07:08.80481	2013-05-26 05:07:08.80481
39175	37	18	12	2013-05-26 05:07:08.805589	2013-05-26 05:07:08.805589
39176	37	22	12	2013-05-26 05:07:08.806381	2013-05-26 05:07:08.806381
39177	37	23	12	2013-05-26 05:07:08.807099	2013-05-26 05:07:08.807099
39178	37	24	12	2013-05-26 05:07:08.80784	2013-05-26 05:07:08.80784
39179	37	25	12	2013-05-26 05:07:08.808819	2013-05-26 05:07:08.808819
39180	37	12	13	2013-05-26 05:07:08.809656	2013-05-26 05:07:08.809656
39181	37	13	13	2013-05-26 05:07:08.810426	2013-05-26 05:07:08.810426
39182	37	17	13	2013-05-26 05:07:08.811358	2013-05-26 05:07:08.811358
39183	37	18	13	2013-05-26 05:07:08.812245	2013-05-26 05:07:08.812245
39184	37	22	13	2013-05-26 05:07:08.813113	2013-05-26 05:07:08.813113
39185	37	23	13	2013-05-26 05:07:08.813913	2013-05-26 05:07:08.813913
39186	37	12	14	2013-05-26 05:07:08.815104	2013-05-26 05:07:08.815104
39187	37	13	14	2013-05-26 05:07:08.815968	2013-05-26 05:07:08.815968
39188	37	17	14	2013-05-26 05:07:08.817982	2013-05-26 05:07:08.817982
39189	37	18	14	2013-05-26 05:07:08.818874	2013-05-26 05:07:08.818874
39190	37	22	14	2013-05-26 05:07:08.820446	2013-05-26 05:07:08.820446
39191	37	23	14	2013-05-26 05:07:08.821168	2013-05-26 05:07:08.821168
39192	37	12	15	2013-05-26 05:07:08.821892	2013-05-26 05:07:08.821892
39193	37	13	15	2013-05-26 05:07:08.82257	2013-05-26 05:07:08.82257
39194	37	14	15	2013-05-26 05:07:08.823273	2013-05-26 05:07:08.823273
39195	37	15	15	2013-05-26 05:07:08.823947	2013-05-26 05:07:08.823947
39196	37	16	15	2013-05-26 05:07:08.824613	2013-05-26 05:07:08.824613
39197	37	17	15	2013-05-26 05:07:08.825273	2013-05-26 05:07:08.825273
39198	37	18	15	2013-05-26 05:07:08.82593	2013-05-26 05:07:08.82593
39199	37	19	15	2013-05-26 05:07:08.826624	2013-05-26 05:07:08.826624
39200	37	20	15	2013-05-26 05:07:08.827367	2013-05-26 05:07:08.827367
39201	37	21	15	2013-05-26 05:07:08.828242	2013-05-26 05:07:08.828242
39202	37	22	15	2013-05-26 05:07:08.829072	2013-05-26 05:07:08.829072
39203	37	23	15	2013-05-26 05:07:08.829856	2013-05-26 05:07:08.829856
39204	37	12	16	2013-05-26 05:07:08.830679	2013-05-26 05:07:08.830679
39205	37	13	16	2013-05-26 05:07:08.831461	2013-05-26 05:07:08.831461
39206	37	14	16	2013-05-26 05:07:08.832273	2013-05-26 05:07:08.832273
39207	37	15	16	2013-05-26 05:07:08.833017	2013-05-26 05:07:08.833017
39208	37	16	16	2013-05-26 05:07:08.833745	2013-05-26 05:07:08.833745
39209	37	17	16	2013-05-26 05:07:08.834461	2013-05-26 05:07:08.834461
39210	37	18	16	2013-05-26 05:07:08.835179	2013-05-26 05:07:08.835179
39211	37	19	16	2013-05-26 05:07:08.835875	2013-05-26 05:07:08.835875
39212	37	20	16	2013-05-26 05:07:08.836538	2013-05-26 05:07:08.836538
39213	37	21	16	2013-05-26 05:07:08.83723	2013-05-26 05:07:08.83723
39214	37	22	16	2013-05-26 05:07:08.837892	2013-05-26 05:07:08.837892
39215	37	23	16	2013-05-26 05:07:08.838556	2013-05-26 05:07:08.838556
39216	37	12	17	2013-05-26 05:07:08.839288	2013-05-26 05:07:08.839288
39217	37	13	17	2013-05-26 05:07:08.839941	2013-05-26 05:07:08.839941
39218	37	14	17	2013-05-26 05:07:08.840658	2013-05-26 05:07:08.840658
39219	37	15	17	2013-05-26 05:07:08.841312	2013-05-26 05:07:08.841312
39220	37	16	17	2013-05-26 05:07:08.841976	2013-05-26 05:07:08.841976
39221	37	17	17	2013-05-26 05:07:08.842622	2013-05-26 05:07:08.842622
39222	37	18	17	2013-05-26 05:07:08.843265	2013-05-26 05:07:08.843265
39223	37	19	17	2013-05-26 05:07:08.843914	2013-05-26 05:07:08.843914
39224	37	20	17	2013-05-26 05:07:08.844561	2013-05-26 05:07:08.844561
39225	37	21	17	2013-05-26 05:07:08.845206	2013-05-26 05:07:08.845206
39226	37	22	17	2013-05-26 05:07:08.845849	2013-05-26 05:07:08.845849
39227	37	23	17	2013-05-26 05:07:08.846522	2013-05-26 05:07:08.846522
39228	37	12	18	2013-05-26 05:07:08.847578	2013-05-26 05:07:08.847578
39229	37	13	18	2013-05-26 05:07:08.848577	2013-05-26 05:07:08.848577
39230	37	14	18	2013-05-26 05:07:08.849511	2013-05-26 05:07:08.849511
39231	37	15	18	2013-05-26 05:07:08.850335	2013-05-26 05:07:08.850335
39232	37	16	18	2013-05-26 05:07:08.851094	2013-05-26 05:07:08.851094
39233	37	17	18	2013-05-26 05:07:08.851934	2013-05-26 05:07:08.851934
39234	37	18	18	2013-05-26 05:07:08.852722	2013-05-26 05:07:08.852722
39235	37	19	18	2013-05-26 05:07:08.853524	2013-05-26 05:07:08.853524
39236	37	20	18	2013-05-26 05:07:08.8543	2013-05-26 05:07:08.8543
39237	37	21	18	2013-05-26 05:07:08.855066	2013-05-26 05:07:08.855066
39238	37	22	18	2013-05-26 05:07:08.855859	2013-05-26 05:07:08.855859
39239	37	23	18	2013-05-26 05:07:08.856669	2013-05-26 05:07:08.856669
39240	37	12	19	2013-05-26 05:07:08.857514	2013-05-26 05:07:08.857514
39241	37	13	19	2013-05-26 05:07:08.858331	2013-05-26 05:07:08.858331
39242	37	14	19	2013-05-26 05:07:08.859089	2013-05-26 05:07:08.859089
39243	37	15	19	2013-05-26 05:07:08.859859	2013-05-26 05:07:08.859859
39244	37	16	19	2013-05-26 05:07:08.860622	2013-05-26 05:07:08.860622
39245	37	17	19	2013-05-26 05:07:08.861342	2013-05-26 05:07:08.861342
39246	37	18	19	2013-05-26 05:07:08.862164	2013-05-26 05:07:08.862164
39247	37	19	19	2013-05-26 05:07:08.862887	2013-05-26 05:07:08.862887
39248	37	20	19	2013-05-26 05:07:08.863736	2013-05-26 05:07:08.863736
39249	37	21	19	2013-05-26 05:07:08.864569	2013-05-26 05:07:08.864569
39250	37	22	19	2013-05-26 05:07:08.865433	2013-05-26 05:07:08.865433
39251	37	23	19	2013-05-26 05:07:08.866172	2013-05-26 05:07:08.866172
39252	37	12	20	2013-05-26 05:07:08.866942	2013-05-26 05:07:08.866942
39253	37	13	20	2013-05-26 05:07:08.867664	2013-05-26 05:07:08.867664
39254	37	14	20	2013-05-26 05:07:08.868489	2013-05-26 05:07:08.868489
39255	37	15	20	2013-05-26 05:07:08.869218	2013-05-26 05:07:08.869218
39256	37	16	20	2013-05-26 05:07:08.869945	2013-05-26 05:07:08.869945
39257	37	17	20	2013-05-26 05:07:08.870664	2013-05-26 05:07:08.870664
39258	37	18	20	2013-05-26 05:07:08.871443	2013-05-26 05:07:08.871443
39259	37	19	20	2013-05-26 05:07:08.872145	2013-05-26 05:07:08.872145
39260	37	20	20	2013-05-26 05:07:08.872824	2013-05-26 05:07:08.872824
39261	37	21	20	2013-05-26 05:07:08.873532	2013-05-26 05:07:08.873532
39262	37	22	20	2013-05-26 05:07:08.874244	2013-05-26 05:07:08.874244
39263	37	23	20	2013-05-26 05:07:08.874908	2013-05-26 05:07:08.874908
39264	37	12	21	2013-05-26 05:07:08.875627	2013-05-26 05:07:08.875627
39265	37	13	21	2013-05-26 05:07:08.876293	2013-05-26 05:07:08.876293
39266	37	14	21	2013-05-26 05:07:08.876954	2013-05-26 05:07:08.876954
39267	37	15	21	2013-05-26 05:07:08.877906	2013-05-26 05:07:08.877906
39268	37	16	21	2013-05-26 05:07:08.878859	2013-05-26 05:07:08.878859
39269	37	17	21	2013-05-26 05:07:08.880046	2013-05-26 05:07:08.880046
39270	37	18	21	2013-05-26 05:07:08.880949	2013-05-26 05:07:08.880949
39271	37	19	21	2013-05-26 05:07:08.881781	2013-05-26 05:07:08.881781
39272	37	20	21	2013-05-26 05:07:08.882592	2013-05-26 05:07:08.882592
39273	37	21	21	2013-05-26 05:07:08.883396	2013-05-26 05:07:08.883396
39274	37	22	21	2013-05-26 05:07:08.884186	2013-05-26 05:07:08.884186
39275	37	23	21	2013-05-26 05:07:08.884967	2013-05-26 05:07:08.884967
39276	47	17	0	2013-05-26 18:48:50.088495	2013-05-26 18:48:50.088495
39277	47	18	0	2013-05-26 18:48:50.0896	2013-05-26 18:48:50.0896
39278	47	17	1	2013-05-26 18:48:50.090332	2013-05-26 18:48:50.090332
39279	47	18	1	2013-05-26 18:48:50.091015	2013-05-26 18:48:50.091015
39280	47	17	2	2013-05-26 18:48:50.094733	2013-05-26 18:48:50.094733
39281	47	18	2	2013-05-26 18:48:50.095649	2013-05-26 18:48:50.095649
39282	47	17	3	2013-05-26 18:48:50.101842	2013-05-26 18:48:50.101842
39283	47	18	3	2013-05-26 18:48:50.102896	2013-05-26 18:48:50.102896
39284	47	17	4	2013-05-26 18:48:50.10467	2013-05-26 18:48:50.10467
39285	47	18	4	2013-05-26 18:48:50.105449	2013-05-26 18:48:50.105449
39286	47	16	12	2013-05-26 18:48:50.113459	2013-05-26 18:48:50.113459
39287	47	17	12	2013-05-26 18:48:50.114216	2013-05-26 18:48:50.114216
39288	47	18	12	2013-05-26 18:48:50.114918	2013-05-26 18:48:50.114918
39289	47	16	13	2013-05-26 18:48:50.115752	2013-05-26 18:48:50.115752
39290	47	17	13	2013-05-26 18:48:50.116603	2013-05-26 18:48:50.116603
39291	47	18	13	2013-05-26 18:48:50.117841	2013-05-26 18:48:50.117841
39292	47	16	14	2013-05-26 18:48:50.120142	2013-05-26 18:48:50.120142
39293	47	17	14	2013-05-26 18:48:50.120888	2013-05-26 18:48:50.120888
39294	47	18	14	2013-05-26 18:48:50.121577	2013-05-26 18:48:50.121577
39295	47	9	15	2013-05-26 18:48:50.12315	2013-05-26 18:48:50.12315
39296	47	10	15	2013-05-26 18:48:50.123837	2013-05-26 18:48:50.123837
39297	47	11	15	2013-05-26 18:48:50.124503	2013-05-26 18:48:50.124503
39298	47	12	15	2013-05-26 18:48:50.125164	2013-05-26 18:48:50.125164
39299	47	13	15	2013-05-26 18:48:50.12582	2013-05-26 18:48:50.12582
39300	47	14	15	2013-05-26 18:48:50.126526	2013-05-26 18:48:50.126526
39301	47	15	15	2013-05-26 18:48:50.127362	2013-05-26 18:48:50.127362
39302	47	16	15	2013-05-26 18:48:50.128112	2013-05-26 18:48:50.128112
39303	47	17	15	2013-05-26 18:48:50.128856	2013-05-26 18:48:50.128856
39304	47	18	15	2013-05-26 18:48:50.12971	2013-05-26 18:48:50.12971
39305	47	19	15	2013-05-26 18:48:50.130494	2013-05-26 18:48:50.130494
39306	47	20	15	2013-05-26 18:48:50.131255	2013-05-26 18:48:50.131255
39307	47	21	15	2013-05-26 18:48:50.132057	2013-05-26 18:48:50.132057
39308	47	22	15	2013-05-26 18:48:50.132784	2013-05-26 18:48:50.132784
39309	47	23	15	2013-05-26 18:48:50.13347	2013-05-26 18:48:50.13347
39310	47	24	15	2013-05-26 18:48:50.134352	2013-05-26 18:48:50.134352
39311	47	25	15	2013-05-26 18:48:50.135178	2013-05-26 18:48:50.135178
39312	47	9	16	2013-05-26 18:48:50.136003	2013-05-26 18:48:50.136003
39313	47	10	16	2013-05-26 18:48:50.136749	2013-05-26 18:48:50.136749
39314	47	11	16	2013-05-26 18:48:50.137485	2013-05-26 18:48:50.137485
39315	47	12	16	2013-05-26 18:48:50.138176	2013-05-26 18:48:50.138176
39316	47	13	16	2013-05-26 18:48:50.13885	2013-05-26 18:48:50.13885
39317	47	14	16	2013-05-26 18:48:50.139532	2013-05-26 18:48:50.139532
39318	47	15	16	2013-05-26 18:48:50.140254	2013-05-26 18:48:50.140254
39319	47	16	16	2013-05-26 18:48:50.141228	2013-05-26 18:48:50.141228
39320	47	17	16	2013-05-26 18:48:50.142036	2013-05-26 18:48:50.142036
39321	47	18	16	2013-05-26 18:48:50.142866	2013-05-26 18:48:50.142866
39322	47	19	16	2013-05-26 18:48:50.143633	2013-05-26 18:48:50.143633
39323	47	20	16	2013-05-26 18:48:50.144374	2013-05-26 18:48:50.144374
39324	47	21	16	2013-05-26 18:48:50.14535	2013-05-26 18:48:50.14535
39325	47	22	16	2013-05-26 18:48:50.146598	2013-05-26 18:48:50.146598
39326	47	23	16	2013-05-26 18:48:50.147531	2013-05-26 18:48:50.147531
39327	47	24	16	2013-05-26 18:48:50.148379	2013-05-26 18:48:50.148379
39328	47	25	16	2013-05-26 18:48:50.149301	2013-05-26 18:48:50.149301
39329	47	17	17	2013-05-26 18:48:50.150235	2013-05-26 18:48:50.150235
39330	47	17	18	2013-05-26 18:48:50.151606	2013-05-26 18:48:50.151606
39331	47	17	19	2013-05-26 18:48:50.152982	2013-05-26 18:48:50.152982
39332	47	17	20	2013-05-26 18:48:50.154103	2013-05-26 18:48:50.154103
39333	47	17	21	2013-05-26 18:48:50.155094	2013-05-26 18:48:50.155094
39334	48	16	0	2013-05-27 06:09:46.020072	2013-05-27 06:09:46.020072
39335	48	17	0	2013-05-27 06:09:46.021008	2013-05-27 06:09:46.021008
39336	48	16	1	2013-05-27 06:09:46.025046	2013-05-27 06:09:46.025046
39337	48	17	1	2013-05-27 06:09:46.025806	2013-05-27 06:09:46.025806
39338	48	0	2	2013-05-27 06:09:46.026492	2013-05-27 06:09:46.026492
39339	48	1	2	2013-05-27 06:09:46.02718	2013-05-27 06:09:46.02718
39340	48	2	2	2013-05-27 06:09:46.02783	2013-05-27 06:09:46.02783
39341	48	3	2	2013-05-27 06:09:46.028492	2013-05-27 06:09:46.028492
39342	48	12	2	2013-05-27 06:09:46.030687	2013-05-27 06:09:46.030687
39343	48	13	2	2013-05-27 06:09:46.031343	2013-05-27 06:09:46.031343
39344	48	14	2	2013-05-27 06:09:46.032085	2013-05-27 06:09:46.032085
39345	48	15	2	2013-05-27 06:09:46.032752	2013-05-27 06:09:46.032752
39346	48	16	2	2013-05-27 06:09:46.033424	2013-05-27 06:09:46.033424
39347	48	17	2	2013-05-27 06:09:46.034099	2013-05-27 06:09:46.034099
39348	48	0	3	2013-05-27 06:09:46.036988	2013-05-27 06:09:46.036988
39349	48	1	3	2013-05-27 06:09:46.037731	2013-05-27 06:09:46.037731
39350	48	2	3	2013-05-27 06:09:46.038479	2013-05-27 06:09:46.038479
39351	48	3	3	2013-05-27 06:09:46.039148	2013-05-27 06:09:46.039148
39352	48	12	3	2013-05-27 06:09:46.039822	2013-05-27 06:09:46.039822
39353	48	13	3	2013-05-27 06:09:46.040569	2013-05-27 06:09:46.040569
39354	48	14	3	2013-05-27 06:09:46.041301	2013-05-27 06:09:46.041301
39355	48	15	3	2013-05-27 06:09:46.041992	2013-05-27 06:09:46.041992
39356	48	16	3	2013-05-27 06:09:46.042649	2013-05-27 06:09:46.042649
39357	48	17	3	2013-05-27 06:09:46.043349	2013-05-27 06:09:46.043349
39358	48	21	3	2013-05-27 06:09:46.044314	2013-05-27 06:09:46.044314
39359	48	22	3	2013-05-27 06:09:46.045093	2013-05-27 06:09:46.045093
39360	48	23	3	2013-05-27 06:09:46.045782	2013-05-27 06:09:46.045782
39361	48	24	3	2013-05-27 06:09:46.046464	2013-05-27 06:09:46.046464
39362	48	25	3	2013-05-27 06:09:46.047208	2013-05-27 06:09:46.047208
39363	48	26	3	2013-05-27 06:09:46.047985	2013-05-27 06:09:46.047985
39364	48	27	3	2013-05-27 06:09:46.048694	2013-05-27 06:09:46.048694
39365	48	28	3	2013-05-27 06:09:46.049392	2013-05-27 06:09:46.049392
39366	48	29	3	2013-05-27 06:09:46.050223	2013-05-27 06:09:46.050223
39367	48	30	3	2013-05-27 06:09:46.050903	2013-05-27 06:09:46.050903
39368	48	31	3	2013-05-27 06:09:46.051546	2013-05-27 06:09:46.051546
39369	48	16	4	2013-05-27 06:09:46.054028	2013-05-27 06:09:46.054028
39370	48	17	4	2013-05-27 06:09:46.054818	2013-05-27 06:09:46.054818
39371	48	21	4	2013-05-27 06:09:46.055672	2013-05-27 06:09:46.055672
39372	48	22	4	2013-05-27 06:09:46.056456	2013-05-27 06:09:46.056456
39373	48	23	4	2013-05-27 06:09:46.057155	2013-05-27 06:09:46.057155
39374	48	24	4	2013-05-27 06:09:46.057806	2013-05-27 06:09:46.057806
39375	48	25	4	2013-05-27 06:09:46.058545	2013-05-27 06:09:46.058545
39376	48	26	4	2013-05-27 06:09:46.05925	2013-05-27 06:09:46.05925
39377	48	27	4	2013-05-27 06:09:46.059894	2013-05-27 06:09:46.059894
39378	48	28	4	2013-05-27 06:09:46.060705	2013-05-27 06:09:46.060705
39379	48	29	4	2013-05-27 06:09:46.061586	2013-05-27 06:09:46.061586
39380	48	30	4	2013-05-27 06:09:46.062409	2013-05-27 06:09:46.062409
39381	48	31	4	2013-05-27 06:09:46.063114	2013-05-27 06:09:46.063114
39382	48	16	5	2013-05-27 06:09:46.065479	2013-05-27 06:09:46.065479
39383	48	17	5	2013-05-27 06:09:46.066257	2013-05-27 06:09:46.066257
39384	48	21	5	2013-05-27 06:09:46.067085	2013-05-27 06:09:46.067085
39385	48	22	5	2013-05-27 06:09:46.068017	2013-05-27 06:09:46.068017
39386	48	30	5	2013-05-27 06:09:46.068857	2013-05-27 06:09:46.068857
39387	48	31	5	2013-05-27 06:09:46.069729	2013-05-27 06:09:46.069729
39388	48	16	6	2013-05-27 06:09:46.07054	2013-05-27 06:09:46.07054
39389	48	17	6	2013-05-27 06:09:46.07125	2013-05-27 06:09:46.07125
39390	48	21	6	2013-05-27 06:09:46.07194	2013-05-27 06:09:46.07194
39391	48	22	6	2013-05-27 06:09:46.072627	2013-05-27 06:09:46.072627
39392	48	30	6	2013-05-27 06:09:46.073359	2013-05-27 06:09:46.073359
39393	48	31	6	2013-05-27 06:09:46.074319	2013-05-27 06:09:46.074319
39394	48	16	7	2013-05-27 06:09:46.077078	2013-05-27 06:09:46.077078
39395	48	17	7	2013-05-27 06:09:46.078448	2013-05-27 06:09:46.078448
39396	48	30	7	2013-05-27 06:09:46.08275	2013-05-27 06:09:46.08275
39397	48	31	7	2013-05-27 06:09:46.08382	2013-05-27 06:09:46.08382
39398	48	16	8	2013-05-27 06:09:46.084934	2013-05-27 06:09:46.084934
39399	48	17	8	2013-05-27 06:09:46.086046	2013-05-27 06:09:46.086046
39400	48	30	8	2013-05-27 06:09:46.087083	2013-05-27 06:09:46.087083
39401	48	31	8	2013-05-27 06:09:46.087944	2013-05-27 06:09:46.087944
39402	48	16	9	2013-05-27 06:09:46.088928	2013-05-27 06:09:46.088928
39403	48	17	9	2013-05-27 06:09:46.08981	2013-05-27 06:09:46.08981
39404	48	18	9	2013-05-27 06:09:46.090665	2013-05-27 06:09:46.090665
39405	48	19	9	2013-05-27 06:09:46.091488	2013-05-27 06:09:46.091488
39406	48	20	9	2013-05-27 06:09:46.092332	2013-05-27 06:09:46.092332
39407	48	21	9	2013-05-27 06:09:46.093079	2013-05-27 06:09:46.093079
39408	48	22	9	2013-05-27 06:09:46.093808	2013-05-27 06:09:46.093808
39409	48	23	9	2013-05-27 06:09:46.095125	2013-05-27 06:09:46.095125
39410	48	24	9	2013-05-27 06:09:46.096755	2013-05-27 06:09:46.096755
39411	48	25	9	2013-05-27 06:09:46.09818	2013-05-27 06:09:46.09818
39412	48	26	9	2013-05-27 06:09:46.099491	2013-05-27 06:09:46.099491
39413	48	27	9	2013-05-27 06:09:46.100773	2013-05-27 06:09:46.100773
39414	48	28	9	2013-05-27 06:09:46.101707	2013-05-27 06:09:46.101707
39415	48	29	9	2013-05-27 06:09:46.102542	2013-05-27 06:09:46.102542
39416	48	30	9	2013-05-27 06:09:46.10346	2013-05-27 06:09:46.10346
39417	48	31	9	2013-05-27 06:09:46.10452	2013-05-27 06:09:46.10452
39418	48	16	10	2013-05-27 06:09:46.105387	2013-05-27 06:09:46.105387
39419	48	17	10	2013-05-27 06:09:46.106265	2013-05-27 06:09:46.106265
39420	48	18	10	2013-05-27 06:09:46.107134	2013-05-27 06:09:46.107134
39421	48	19	10	2013-05-27 06:09:46.107885	2013-05-27 06:09:46.107885
39422	48	20	10	2013-05-27 06:09:46.108665	2013-05-27 06:09:46.108665
39423	48	21	10	2013-05-27 06:09:46.109615	2013-05-27 06:09:46.109615
39424	48	22	10	2013-05-27 06:09:46.110426	2013-05-27 06:09:46.110426
39425	48	23	10	2013-05-27 06:09:46.11126	2013-05-27 06:09:46.11126
39426	48	24	10	2013-05-27 06:09:46.1123	2013-05-27 06:09:46.1123
39427	48	25	10	2013-05-27 06:09:46.11367	2013-05-27 06:09:46.11367
39428	48	26	10	2013-05-27 06:09:46.114669	2013-05-27 06:09:46.114669
39429	48	27	10	2013-05-27 06:09:46.115511	2013-05-27 06:09:46.115511
39430	48	28	10	2013-05-27 06:09:46.116289	2013-05-27 06:09:46.116289
39431	48	29	10	2013-05-27 06:09:46.117065	2013-05-27 06:09:46.117065
39432	48	30	10	2013-05-27 06:09:46.117949	2013-05-27 06:09:46.117949
39433	48	31	10	2013-05-27 06:09:46.118925	2013-05-27 06:09:46.118925
39434	54	16	0	2013-05-27 06:47:06.158949	2013-05-27 06:47:06.158949
39435	54	17	0	2013-05-27 06:47:06.159897	2013-05-27 06:47:06.159897
39436	54	16	1	2013-05-27 06:47:06.166972	2013-05-27 06:47:06.166972
39437	54	17	1	2013-05-27 06:47:06.167801	2013-05-27 06:47:06.167801
39438	54	0	2	2013-05-27 06:47:06.168588	2013-05-27 06:47:06.168588
39439	54	1	2	2013-05-27 06:47:06.169289	2013-05-27 06:47:06.169289
39440	54	2	2	2013-05-27 06:47:06.170019	2013-05-27 06:47:06.170019
39441	54	3	2	2013-05-27 06:47:06.170709	2013-05-27 06:47:06.170709
39442	54	12	2	2013-05-27 06:47:06.171406	2013-05-27 06:47:06.171406
39443	54	13	2	2013-05-27 06:47:06.172084	2013-05-27 06:47:06.172084
39444	54	14	2	2013-05-27 06:47:06.172779	2013-05-27 06:47:06.172779
39445	54	15	2	2013-05-27 06:47:06.17345	2013-05-27 06:47:06.17345
39446	54	16	2	2013-05-27 06:47:06.174137	2013-05-27 06:47:06.174137
39447	54	17	2	2013-05-27 06:47:06.174896	2013-05-27 06:47:06.174896
39448	54	0	3	2013-05-27 06:47:06.177225	2013-05-27 06:47:06.177225
39449	54	1	3	2013-05-27 06:47:06.178254	2013-05-27 06:47:06.178254
39450	54	2	3	2013-05-27 06:47:06.179192	2013-05-27 06:47:06.179192
39451	54	3	3	2013-05-27 06:47:06.180272	2013-05-27 06:47:06.180272
39452	54	12	3	2013-05-27 06:47:06.181109	2013-05-27 06:47:06.181109
39453	54	13	3	2013-05-27 06:47:06.181879	2013-05-27 06:47:06.181879
39454	54	14	3	2013-05-27 06:47:06.182625	2013-05-27 06:47:06.182625
39455	54	15	3	2013-05-27 06:47:06.18336	2013-05-27 06:47:06.18336
39456	54	16	3	2013-05-27 06:47:06.184112	2013-05-27 06:47:06.184112
39457	54	17	3	2013-05-27 06:47:06.184827	2013-05-27 06:47:06.184827
39458	54	21	3	2013-05-27 06:47:06.185563	2013-05-27 06:47:06.185563
39459	54	22	3	2013-05-27 06:47:06.186276	2013-05-27 06:47:06.186276
39460	54	23	3	2013-05-27 06:47:06.187274	2013-05-27 06:47:06.187274
39461	54	24	3	2013-05-27 06:47:06.188169	2013-05-27 06:47:06.188169
39462	54	25	3	2013-05-27 06:47:06.188963	2013-05-27 06:47:06.188963
39463	54	26	3	2013-05-27 06:47:06.189773	2013-05-27 06:47:06.189773
39464	54	27	3	2013-05-27 06:47:06.190711	2013-05-27 06:47:06.190711
39465	54	28	3	2013-05-27 06:47:06.191582	2013-05-27 06:47:06.191582
39466	54	29	3	2013-05-27 06:47:06.19238	2013-05-27 06:47:06.19238
39467	54	30	3	2013-05-27 06:47:06.193206	2013-05-27 06:47:06.193206
39468	54	31	3	2013-05-27 06:47:06.194349	2013-05-27 06:47:06.194349
39469	54	16	4	2013-05-27 06:47:06.199033	2013-05-27 06:47:06.199033
39470	54	17	4	2013-05-27 06:47:06.199799	2013-05-27 06:47:06.199799
39471	54	21	4	2013-05-27 06:47:06.200563	2013-05-27 06:47:06.200563
39472	54	22	4	2013-05-27 06:47:06.201279	2013-05-27 06:47:06.201279
39473	54	23	4	2013-05-27 06:47:06.201984	2013-05-27 06:47:06.201984
39474	54	24	4	2013-05-27 06:47:06.202676	2013-05-27 06:47:06.202676
39475	54	25	4	2013-05-27 06:47:06.203369	2013-05-27 06:47:06.203369
39476	54	26	4	2013-05-27 06:47:06.204053	2013-05-27 06:47:06.204053
39477	54	27	4	2013-05-27 06:47:06.20477	2013-05-27 06:47:06.20477
39478	54	28	4	2013-05-27 06:47:06.205525	2013-05-27 06:47:06.205525
39479	54	29	4	2013-05-27 06:47:06.206289	2013-05-27 06:47:06.206289
39480	54	30	4	2013-05-27 06:47:06.206995	2013-05-27 06:47:06.206995
39481	54	31	4	2013-05-27 06:47:06.207677	2013-05-27 06:47:06.207677
39482	54	16	5	2013-05-27 06:47:06.21038	2013-05-27 06:47:06.21038
39483	54	17	5	2013-05-27 06:47:06.211136	2013-05-27 06:47:06.211136
39484	54	30	5	2013-05-27 06:47:06.211854	2013-05-27 06:47:06.211854
39485	54	31	5	2013-05-27 06:47:06.212576	2013-05-27 06:47:06.212576
39486	54	16	6	2013-05-27 06:47:06.21329	2013-05-27 06:47:06.21329
39487	54	17	6	2013-05-27 06:47:06.213964	2013-05-27 06:47:06.213964
39488	54	30	6	2013-05-27 06:47:06.214645	2013-05-27 06:47:06.214645
39489	54	31	6	2013-05-27 06:47:06.215308	2013-05-27 06:47:06.215308
39490	54	16	7	2013-05-27 06:47:06.218419	2013-05-27 06:47:06.218419
39491	54	17	7	2013-05-27 06:47:06.219197	2013-05-27 06:47:06.219197
39492	54	30	7	2013-05-27 06:47:06.221467	2013-05-27 06:47:06.221467
39493	54	31	7	2013-05-27 06:47:06.22213	2013-05-27 06:47:06.22213
39494	54	16	8	2013-05-27 06:47:06.223571	2013-05-27 06:47:06.223571
39495	54	17	8	2013-05-27 06:47:06.224263	2013-05-27 06:47:06.224263
39496	54	18	8	2013-05-27 06:47:06.224905	2013-05-27 06:47:06.224905
39497	54	19	8	2013-05-27 06:47:06.225585	2013-05-27 06:47:06.225585
39498	54	20	8	2013-05-27 06:47:06.226227	2013-05-27 06:47:06.226227
39499	54	21	8	2013-05-27 06:47:06.226871	2013-05-27 06:47:06.226871
39500	54	22	8	2013-05-27 06:47:06.227516	2013-05-27 06:47:06.227516
39501	54	30	8	2013-05-27 06:47:06.228205	2013-05-27 06:47:06.228205
39502	54	31	8	2013-05-27 06:47:06.228867	2013-05-27 06:47:06.228867
39503	54	21	9	2013-05-27 06:47:06.231052	2013-05-27 06:47:06.231052
39504	54	22	9	2013-05-27 06:47:06.231751	2013-05-27 06:47:06.231751
39505	54	23	9	2013-05-27 06:47:06.232415	2013-05-27 06:47:06.232415
39506	54	24	9	2013-05-27 06:47:06.23306	2013-05-27 06:47:06.23306
39507	54	25	9	2013-05-27 06:47:06.233706	2013-05-27 06:47:06.233706
39508	54	26	9	2013-05-27 06:47:06.234362	2013-05-27 06:47:06.234362
39509	54	27	9	2013-05-27 06:47:06.235084	2013-05-27 06:47:06.235084
39510	54	28	9	2013-05-27 06:47:06.235877	2013-05-27 06:47:06.235877
39511	54	29	9	2013-05-27 06:47:06.236595	2013-05-27 06:47:06.236595
39512	54	30	9	2013-05-27 06:47:06.23727	2013-05-27 06:47:06.23727
39513	54	31	9	2013-05-27 06:47:06.237945	2013-05-27 06:47:06.237945
39514	54	4	10	2013-05-27 06:47:06.238661	2013-05-27 06:47:06.238661
39515	54	5	10	2013-05-27 06:47:06.239366	2013-05-27 06:47:06.239366
39516	54	6	10	2013-05-27 06:47:06.240027	2013-05-27 06:47:06.240027
39517	54	7	10	2013-05-27 06:47:06.240728	2013-05-27 06:47:06.240728
39518	54	8	10	2013-05-27 06:47:06.241394	2013-05-27 06:47:06.241394
39519	54	9	10	2013-05-27 06:47:06.242061	2013-05-27 06:47:06.242061
39520	54	10	10	2013-05-27 06:47:06.242708	2013-05-27 06:47:06.242708
39521	54	11	10	2013-05-27 06:47:06.243356	2013-05-27 06:47:06.243356
39522	54	12	10	2013-05-27 06:47:06.244	2013-05-27 06:47:06.244
39523	54	13	10	2013-05-27 06:47:06.244685	2013-05-27 06:47:06.244685
39524	54	14	10	2013-05-27 06:47:06.245354	2013-05-27 06:47:06.245354
39525	54	15	10	2013-05-27 06:47:06.300801	2013-05-27 06:47:06.300801
39526	54	16	10	2013-05-27 06:47:06.301721	2013-05-27 06:47:06.301721
39527	54	21	10	2013-05-27 06:47:06.302395	2013-05-27 06:47:06.302395
39528	54	22	10	2013-05-27 06:47:06.30309	2013-05-27 06:47:06.30309
39529	54	23	10	2013-05-27 06:47:06.303831	2013-05-27 06:47:06.303831
39530	54	24	10	2013-05-27 06:47:06.304502	2013-05-27 06:47:06.304502
39531	54	25	10	2013-05-27 06:47:06.305203	2013-05-27 06:47:06.305203
39532	54	26	10	2013-05-27 06:47:06.305875	2013-05-27 06:47:06.305875
39533	54	27	10	2013-05-27 06:47:06.30656	2013-05-27 06:47:06.30656
39534	54	28	10	2013-05-27 06:47:06.307231	2013-05-27 06:47:06.307231
39535	54	29	10	2013-05-27 06:47:06.307925	2013-05-27 06:47:06.307925
39536	54	30	10	2013-05-27 06:47:06.308591	2013-05-27 06:47:06.308591
39537	54	31	10	2013-05-27 06:47:06.309334	2013-05-27 06:47:06.309334
39538	54	4	11	2013-05-27 06:47:06.310189	2013-05-27 06:47:06.310189
39539	54	5	11	2013-05-27 06:47:06.310888	2013-05-27 06:47:06.310888
39540	54	6	11	2013-05-27 06:47:06.31161	2013-05-27 06:47:06.31161
39541	54	7	11	2013-05-27 06:47:06.312311	2013-05-27 06:47:06.312311
39542	54	8	11	2013-05-27 06:47:06.313073	2013-05-27 06:47:06.313073
39543	54	9	11	2013-05-27 06:47:06.313785	2013-05-27 06:47:06.313785
39544	54	10	11	2013-05-27 06:47:06.314489	2013-05-27 06:47:06.314489
39545	54	11	11	2013-05-27 06:47:06.315191	2013-05-27 06:47:06.315191
39546	54	12	11	2013-05-27 06:47:06.315862	2013-05-27 06:47:06.315862
39547	54	13	11	2013-05-27 06:47:06.316562	2013-05-27 06:47:06.316562
39548	54	14	11	2013-05-27 06:47:06.317262	2013-05-27 06:47:06.317262
39549	54	15	11	2013-05-27 06:47:06.317932	2013-05-27 06:47:06.317932
39550	54	16	11	2013-05-27 06:47:06.318601	2013-05-27 06:47:06.318601
39551	54	21	11	2013-05-27 06:47:06.319285	2013-05-27 06:47:06.319285
39552	54	22	11	2013-05-27 06:47:06.319955	2013-05-27 06:47:06.319955
39553	54	4	12	2013-05-27 06:47:06.32508	2013-05-27 06:47:06.32508
39554	54	5	12	2013-05-27 06:47:06.326228	2013-05-27 06:47:06.326228
39555	54	21	12	2013-05-27 06:47:06.326989	2013-05-27 06:47:06.326989
39556	54	22	12	2013-05-27 06:47:06.327684	2013-05-27 06:47:06.327684
39557	54	4	13	2013-05-27 06:47:06.329339	2013-05-27 06:47:06.329339
39558	54	5	13	2013-05-27 06:47:06.330041	2013-05-27 06:47:06.330041
39559	54	21	13	2013-05-27 06:47:06.332353	2013-05-27 06:47:06.332353
39560	54	22	13	2013-05-27 06:47:06.33307	2013-05-27 06:47:06.33307
39561	54	4	14	2013-05-27 06:47:06.33668	2013-05-27 06:47:06.33668
39562	54	5	14	2013-05-27 06:47:06.337478	2013-05-27 06:47:06.337478
39563	54	21	14	2013-05-27 06:47:06.338979	2013-05-27 06:47:06.338979
39564	54	22	14	2013-05-27 06:47:06.339644	2013-05-27 06:47:06.339644
39565	54	4	15	2013-05-27 06:47:06.341197	2013-05-27 06:47:06.341197
39566	54	5	15	2013-05-27 06:47:06.34189	2013-05-27 06:47:06.34189
39567	54	21	15	2013-05-27 06:47:06.343324	2013-05-27 06:47:06.343324
39568	54	22	15	2013-05-27 06:47:06.344016	2013-05-27 06:47:06.344016
39569	54	4	16	2013-05-27 06:47:06.346166	2013-05-27 06:47:06.346166
39570	54	5	16	2013-05-27 06:47:06.346869	2013-05-27 06:47:06.346869
39571	54	6	16	2013-05-27 06:47:06.347553	2013-05-27 06:47:06.347553
39572	54	7	16	2013-05-27 06:47:06.348204	2013-05-27 06:47:06.348204
39573	54	8	16	2013-05-27 06:47:06.348849	2013-05-27 06:47:06.348849
39574	54	9	16	2013-05-27 06:47:06.349492	2013-05-27 06:47:06.349492
39575	54	10	16	2013-05-27 06:47:06.350149	2013-05-27 06:47:06.350149
39576	54	11	16	2013-05-27 06:47:06.350793	2013-05-27 06:47:06.350793
39577	54	12	16	2013-05-27 06:47:06.351437	2013-05-27 06:47:06.351437
39578	54	13	16	2013-05-27 06:47:06.352258	2013-05-27 06:47:06.352258
39579	54	14	16	2013-05-27 06:47:06.35304	2013-05-27 06:47:06.35304
39580	54	15	16	2013-05-27 06:47:06.35428	2013-05-27 06:47:06.35428
39581	54	16	16	2013-05-27 06:47:06.35585	2013-05-27 06:47:06.35585
39582	54	17	16	2013-05-27 06:47:06.357202	2013-05-27 06:47:06.357202
39583	54	18	16	2013-05-27 06:47:06.35849	2013-05-27 06:47:06.35849
39584	54	19	16	2013-05-27 06:47:06.35936	2013-05-27 06:47:06.35936
39585	54	20	16	2013-05-27 06:47:06.360148	2013-05-27 06:47:06.360148
39586	54	21	16	2013-05-27 06:47:06.360824	2013-05-27 06:47:06.360824
39587	54	22	16	2013-05-27 06:47:06.361498	2013-05-27 06:47:06.361498
39588	54	4	17	2013-05-27 06:47:06.362214	2013-05-27 06:47:06.362214
39589	54	5	17	2013-05-27 06:47:06.362909	2013-05-27 06:47:06.362909
39590	54	6	17	2013-05-27 06:47:06.363873	2013-05-27 06:47:06.363873
39591	54	7	17	2013-05-27 06:47:06.364709	2013-05-27 06:47:06.364709
39592	54	8	17	2013-05-27 06:47:06.365448	2013-05-27 06:47:06.365448
39593	54	9	17	2013-05-27 06:47:06.366141	2013-05-27 06:47:06.366141
39594	54	10	17	2013-05-27 06:47:06.366824	2013-05-27 06:47:06.366824
39595	54	11	17	2013-05-27 06:47:06.367499	2013-05-27 06:47:06.367499
39596	54	12	17	2013-05-27 06:47:06.368198	2013-05-27 06:47:06.368198
39597	54	13	17	2013-05-27 06:47:06.368888	2013-05-27 06:47:06.368888
39598	54	14	17	2013-05-27 06:47:06.369596	2013-05-27 06:47:06.369596
39599	54	15	17	2013-05-27 06:47:06.370271	2013-05-27 06:47:06.370271
39600	54	16	17	2013-05-27 06:47:06.371005	2013-05-27 06:47:06.371005
39601	54	17	17	2013-05-27 06:47:06.371781	2013-05-27 06:47:06.371781
39602	54	18	17	2013-05-27 06:47:06.372726	2013-05-27 06:47:06.372726
39603	54	19	17	2013-05-27 06:47:06.373563	2013-05-27 06:47:06.373563
39604	54	20	17	2013-05-27 06:47:06.374339	2013-05-27 06:47:06.374339
39605	54	21	17	2013-05-27 06:47:06.37509	2013-05-27 06:47:06.37509
39606	54	22	17	2013-05-27 06:47:06.375851	2013-05-27 06:47:06.375851
39607	54	22	18	2013-05-27 06:47:06.381677	2013-05-27 06:47:06.381677
40082	55	19	0	2013-05-27 14:48:13.002958	2013-05-27 14:48:13.002958
40083	55	20	0	2013-05-27 14:48:13.003682	2013-05-27 14:48:13.003682
40084	55	21	0	2013-05-27 14:48:13.004356	2013-05-27 14:48:13.004356
40085	55	22	0	2013-05-27 14:48:13.005026	2013-05-27 14:48:13.005026
40086	55	23	0	2013-05-27 14:48:13.00569	2013-05-27 14:48:13.00569
40087	55	24	0	2013-05-27 14:48:13.006372	2013-05-27 14:48:13.006372
40088	55	25	0	2013-05-27 14:48:13.007036	2013-05-27 14:48:13.007036
40089	55	26	0	2013-05-27 14:48:13.007696	2013-05-27 14:48:13.007696
40090	55	27	0	2013-05-27 14:48:13.008374	2013-05-27 14:48:13.008374
40091	55	28	0	2013-05-27 14:48:13.00907	2013-05-27 14:48:13.00907
40092	55	29	0	2013-05-27 14:48:13.009791	2013-05-27 14:48:13.009791
40093	55	30	0	2013-05-27 14:48:13.010455	2013-05-27 14:48:13.010455
40094	55	31	0	2013-05-27 14:48:13.011175	2013-05-27 14:48:13.011175
40095	55	32	0	2013-05-27 14:48:13.012042	2013-05-27 14:48:13.012042
40096	55	33	0	2013-05-27 14:48:13.012956	2013-05-27 14:48:13.012956
40097	55	34	0	2013-05-27 14:48:13.013746	2013-05-27 14:48:13.013746
40098	55	35	0	2013-05-27 14:48:13.014491	2013-05-27 14:48:13.014491
40099	55	19	1	2013-05-27 14:48:13.016098	2013-05-27 14:48:13.016098
40100	55	20	1	2013-05-27 14:48:13.016854	2013-05-27 14:48:13.016854
40101	55	21	1	2013-05-27 14:48:13.017672	2013-05-27 14:48:13.017672
40102	55	22	1	2013-05-27 14:48:13.018436	2013-05-27 14:48:13.018436
40103	55	23	1	2013-05-27 14:48:13.019138	2013-05-27 14:48:13.019138
40104	55	24	1	2013-05-27 14:48:13.020093	2013-05-27 14:48:13.020093
40105	55	25	1	2013-05-27 14:48:13.020841	2013-05-27 14:48:13.020841
40106	55	26	1	2013-05-27 14:48:13.021531	2013-05-27 14:48:13.021531
40107	55	27	1	2013-05-27 14:48:13.022288	2013-05-27 14:48:13.022288
40108	55	28	1	2013-05-27 14:48:13.022959	2013-05-27 14:48:13.022959
40109	55	29	1	2013-05-27 14:48:13.023737	2013-05-27 14:48:13.023737
40110	55	30	1	2013-05-27 14:48:13.024454	2013-05-27 14:48:13.024454
40111	55	31	1	2013-05-27 14:48:13.025168	2013-05-27 14:48:13.025168
40112	55	32	1	2013-05-27 14:48:13.025893	2013-05-27 14:48:13.025893
40113	55	33	1	2013-05-27 14:48:13.026581	2013-05-27 14:48:13.026581
40114	55	34	1	2013-05-27 14:48:13.027313	2013-05-27 14:48:13.027313
40115	55	35	1	2013-05-27 14:48:13.028114	2013-05-27 14:48:13.028114
40116	55	21	2	2013-05-27 14:48:13.029685	2013-05-27 14:48:13.029685
40117	55	22	2	2013-05-27 14:48:13.030349	2013-05-27 14:48:13.030349
40118	55	23	2	2013-05-27 14:48:13.031007	2013-05-27 14:48:13.031007
40119	55	24	2	2013-05-27 14:48:13.031679	2013-05-27 14:48:13.031679
40120	55	25	2	2013-05-27 14:48:13.032384	2013-05-27 14:48:13.032384
40121	55	26	2	2013-05-27 14:48:13.033091	2013-05-27 14:48:13.033091
40122	55	27	2	2013-05-27 14:48:13.033742	2013-05-27 14:48:13.033742
40123	55	28	2	2013-05-27 14:48:13.03439	2013-05-27 14:48:13.03439
40124	55	29	2	2013-05-27 14:48:13.03504	2013-05-27 14:48:13.03504
40125	55	30	2	2013-05-27 14:48:13.035684	2013-05-27 14:48:13.035684
40126	55	31	2	2013-05-27 14:48:13.036339	2013-05-27 14:48:13.036339
40127	55	32	2	2013-05-27 14:48:13.036982	2013-05-27 14:48:13.036982
40128	55	33	2	2013-05-27 14:48:13.037699	2013-05-27 14:48:13.037699
40129	55	34	2	2013-05-27 14:48:13.038352	2013-05-27 14:48:13.038352
40130	55	35	2	2013-05-27 14:48:13.039019	2013-05-27 14:48:13.039019
40131	55	21	3	2013-05-27 14:48:13.040537	2013-05-27 14:48:13.040537
40132	55	22	3	2013-05-27 14:48:13.041199	2013-05-27 14:48:13.041199
40133	55	23	3	2013-05-27 14:48:13.041848	2013-05-27 14:48:13.041848
40134	55	24	3	2013-05-27 14:48:13.042506	2013-05-27 14:48:13.042506
40135	55	25	3	2013-05-27 14:48:13.043154	2013-05-27 14:48:13.043154
40136	55	26	3	2013-05-27 14:48:13.043853	2013-05-27 14:48:13.043853
40137	55	27	3	2013-05-27 14:48:13.044614	2013-05-27 14:48:13.044614
40138	55	28	3	2013-05-27 14:48:13.045296	2013-05-27 14:48:13.045296
40139	55	29	3	2013-05-27 14:48:13.045945	2013-05-27 14:48:13.045945
40140	55	30	3	2013-05-27 14:48:13.046645	2013-05-27 14:48:13.046645
40141	55	31	3	2013-05-27 14:48:13.047397	2013-05-27 14:48:13.047397
40142	55	32	3	2013-05-27 14:48:13.048112	2013-05-27 14:48:13.048112
40143	55	33	3	2013-05-27 14:48:13.048763	2013-05-27 14:48:13.048763
40144	55	34	3	2013-05-27 14:48:13.049404	2013-05-27 14:48:13.049404
40145	55	35	3	2013-05-27 14:48:13.05007	2013-05-27 14:48:13.05007
40146	55	0	4	2013-05-27 14:48:13.050781	2013-05-27 14:48:13.050781
40147	55	1	4	2013-05-27 14:48:13.051475	2013-05-27 14:48:13.051475
40148	55	2	4	2013-05-27 14:48:13.052122	2013-05-27 14:48:13.052122
40149	55	3	4	2013-05-27 14:48:13.052768	2013-05-27 14:48:13.052768
40150	55	23	4	2013-05-27 14:48:13.056917	2013-05-27 14:48:13.056917
40151	55	24	4	2013-05-27 14:48:13.057682	2013-05-27 14:48:13.057682
40152	55	25	4	2013-05-27 14:48:13.058401	2013-05-27 14:48:13.058401
40153	55	26	4	2013-05-27 14:48:13.059082	2013-05-27 14:48:13.059082
40154	55	27	4	2013-05-27 14:48:13.05975	2013-05-27 14:48:13.05975
40155	55	28	4	2013-05-27 14:48:13.060422	2013-05-27 14:48:13.060422
40156	55	29	4	2013-05-27 14:48:13.061125	2013-05-27 14:48:13.061125
40157	55	30	4	2013-05-27 14:48:13.061788	2013-05-27 14:48:13.061788
40158	55	31	4	2013-05-27 14:48:13.062508	2013-05-27 14:48:13.062508
40159	55	32	4	2013-05-27 14:48:13.063252	2013-05-27 14:48:13.063252
40160	55	33	4	2013-05-27 14:48:13.064053	2013-05-27 14:48:13.064053
40161	55	34	4	2013-05-27 14:48:13.064746	2013-05-27 14:48:13.064746
40162	55	35	4	2013-05-27 14:48:13.065452	2013-05-27 14:48:13.065452
40163	55	1	5	2013-05-27 14:48:13.066141	2013-05-27 14:48:13.066141
40164	55	3	5	2013-05-27 14:48:13.066817	2013-05-27 14:48:13.066817
40165	55	23	5	2013-05-27 14:48:13.068349	2013-05-27 14:48:13.068349
40166	55	24	5	2013-05-27 14:48:13.069021	2013-05-27 14:48:13.069021
40167	55	25	5	2013-05-27 14:48:13.069674	2013-05-27 14:48:13.069674
40168	55	26	5	2013-05-27 14:48:13.070405	2013-05-27 14:48:13.070405
40169	55	27	5	2013-05-27 14:48:13.071096	2013-05-27 14:48:13.071096
40170	55	28	5	2013-05-27 14:48:13.071913	2013-05-27 14:48:13.071913
40171	55	29	5	2013-05-27 14:48:13.072622	2013-05-27 14:48:13.072622
40172	55	30	5	2013-05-27 14:48:13.07389	2013-05-27 14:48:13.07389
40173	55	31	5	2013-05-27 14:48:13.075113	2013-05-27 14:48:13.075113
40174	55	32	5	2013-05-27 14:48:13.075971	2013-05-27 14:48:13.075971
40175	55	33	5	2013-05-27 14:48:13.076791	2013-05-27 14:48:13.076791
40176	55	34	5	2013-05-27 14:48:13.077538	2013-05-27 14:48:13.077538
40177	55	35	5	2013-05-27 14:48:13.078319	2013-05-27 14:48:13.078319
40178	55	1	6	2013-05-27 14:48:13.079075	2013-05-27 14:48:13.079075
40179	55	3	6	2013-05-27 14:48:13.0799	2013-05-27 14:48:13.0799
40180	55	25	6	2013-05-27 14:48:13.081645	2013-05-27 14:48:13.081645
40181	55	26	6	2013-05-27 14:48:13.082352	2013-05-27 14:48:13.082352
40182	55	27	6	2013-05-27 14:48:13.083036	2013-05-27 14:48:13.083036
40183	55	28	6	2013-05-27 14:48:13.083715	2013-05-27 14:48:13.083715
40184	55	29	6	2013-05-27 14:48:13.084386	2013-05-27 14:48:13.084386
40185	55	30	6	2013-05-27 14:48:13.085186	2013-05-27 14:48:13.085186
40186	55	31	6	2013-05-27 14:48:13.085866	2013-05-27 14:48:13.085866
40187	55	32	6	2013-05-27 14:48:13.086539	2013-05-27 14:48:13.086539
40188	55	33	6	2013-05-27 14:48:13.087248	2013-05-27 14:48:13.087248
40189	55	34	6	2013-05-27 14:48:13.087923	2013-05-27 14:48:13.087923
40190	55	35	6	2013-05-27 14:48:13.088675	2013-05-27 14:48:13.088675
40191	55	1	7	2013-05-27 14:48:13.089366	2013-05-27 14:48:13.089366
40192	55	3	7	2013-05-27 14:48:13.090584	2013-05-27 14:48:13.090584
40193	55	25	7	2013-05-27 14:48:13.093017	2013-05-27 14:48:13.093017
40194	55	26	7	2013-05-27 14:48:13.093865	2013-05-27 14:48:13.093865
40195	55	27	7	2013-05-27 14:48:13.094681	2013-05-27 14:48:13.094681
40196	55	28	7	2013-05-27 14:48:13.095515	2013-05-27 14:48:13.095515
40197	55	29	7	2013-05-27 14:48:13.096344	2013-05-27 14:48:13.096344
40198	55	30	7	2013-05-27 14:48:13.097138	2013-05-27 14:48:13.097138
40199	55	31	7	2013-05-27 14:48:13.097858	2013-05-27 14:48:13.097858
40200	55	32	7	2013-05-27 14:48:13.098572	2013-05-27 14:48:13.098572
40201	55	33	7	2013-05-27 14:48:13.099271	2013-05-27 14:48:13.099271
40202	55	34	7	2013-05-27 14:48:13.099974	2013-05-27 14:48:13.099974
40203	55	35	7	2013-05-27 14:48:13.100682	2013-05-27 14:48:13.100682
40204	55	1	8	2013-05-27 14:48:13.101442	2013-05-27 14:48:13.101442
40205	55	3	8	2013-05-27 14:48:13.102127	2013-05-27 14:48:13.102127
40206	55	4	8	2013-05-27 14:48:13.102806	2013-05-27 14:48:13.102806
40207	55	5	8	2013-05-27 14:48:13.103491	2013-05-27 14:48:13.103491
40208	55	6	8	2013-05-27 14:48:13.104163	2013-05-27 14:48:13.104163
40209	55	7	8	2013-05-27 14:48:13.104853	2013-05-27 14:48:13.104853
40210	55	27	8	2013-05-27 14:48:13.110373	2013-05-27 14:48:13.110373
40211	55	28	8	2013-05-27 14:48:13.111269	2013-05-27 14:48:13.111269
40212	55	29	8	2013-05-27 14:48:13.112076	2013-05-27 14:48:13.112076
40213	55	30	8	2013-05-27 14:48:13.112839	2013-05-27 14:48:13.112839
40214	55	31	8	2013-05-27 14:48:13.113627	2013-05-27 14:48:13.113627
40215	55	32	8	2013-05-27 14:48:13.114397	2013-05-27 14:48:13.114397
40216	55	33	8	2013-05-27 14:48:13.115224	2013-05-27 14:48:13.115224
40217	55	34	8	2013-05-27 14:48:13.116072	2013-05-27 14:48:13.116072
40218	55	35	8	2013-05-27 14:48:13.116858	2013-05-27 14:48:13.116858
40219	55	1	9	2013-05-27 14:48:13.117591	2013-05-27 14:48:13.117591
40220	55	3	9	2013-05-27 14:48:13.119028	2013-05-27 14:48:13.119028
40221	55	5	9	2013-05-27 14:48:13.120355	2013-05-27 14:48:13.120355
40222	55	7	9	2013-05-27 14:48:13.121743	2013-05-27 14:48:13.121743
40223	55	27	9	2013-05-27 14:48:13.125536	2013-05-27 14:48:13.125536
40224	55	28	9	2013-05-27 14:48:13.126663	2013-05-27 14:48:13.126663
40225	55	29	9	2013-05-27 14:48:13.127584	2013-05-27 14:48:13.127584
40226	55	30	9	2013-05-27 14:48:13.12842	2013-05-27 14:48:13.12842
40227	55	31	9	2013-05-27 14:48:13.129365	2013-05-27 14:48:13.129365
40228	55	32	9	2013-05-27 14:48:13.130236	2013-05-27 14:48:13.130236
40229	55	33	9	2013-05-27 14:48:13.13105	2013-05-27 14:48:13.13105
40230	55	34	9	2013-05-27 14:48:13.131782	2013-05-27 14:48:13.131782
40231	55	35	9	2013-05-27 14:48:13.132496	2013-05-27 14:48:13.132496
40232	55	1	10	2013-05-27 14:48:13.13322	2013-05-27 14:48:13.13322
40233	55	3	10	2013-05-27 14:48:13.13396	2013-05-27 14:48:13.13396
40234	55	5	10	2013-05-27 14:48:13.134749	2013-05-27 14:48:13.134749
40235	55	7	10	2013-05-27 14:48:13.135448	2013-05-27 14:48:13.135448
40236	55	29	10	2013-05-27 14:48:13.137015	2013-05-27 14:48:13.137015
40237	55	30	10	2013-05-27 14:48:13.137702	2013-05-27 14:48:13.137702
40238	55	31	10	2013-05-27 14:48:13.138365	2013-05-27 14:48:13.138365
40239	55	32	10	2013-05-27 14:48:13.13921	2013-05-27 14:48:13.13921
40240	55	33	10	2013-05-27 14:48:13.140576	2013-05-27 14:48:13.140576
40241	55	34	10	2013-05-27 14:48:13.141759	2013-05-27 14:48:13.141759
40242	55	35	10	2013-05-27 14:48:13.142833	2013-05-27 14:48:13.142833
40243	55	1	11	2013-05-27 14:48:13.14373	2013-05-27 14:48:13.14373
40244	55	3	11	2013-05-27 14:48:13.144595	2013-05-27 14:48:13.144595
40245	55	5	11	2013-05-27 14:48:13.145599	2013-05-27 14:48:13.145599
40246	55	7	11	2013-05-27 14:48:13.146391	2013-05-27 14:48:13.146391
40247	55	29	11	2013-05-27 14:48:13.148799	2013-05-27 14:48:13.148799
40248	55	30	11	2013-05-27 14:48:13.149508	2013-05-27 14:48:13.149508
40249	55	31	11	2013-05-27 14:48:13.150608	2013-05-27 14:48:13.150608
40250	55	32	11	2013-05-27 14:48:13.151589	2013-05-27 14:48:13.151589
40251	55	33	11	2013-05-27 14:48:13.152549	2013-05-27 14:48:13.152549
40252	55	34	11	2013-05-27 14:48:13.153509	2013-05-27 14:48:13.153509
40253	55	35	11	2013-05-27 14:48:13.154412	2013-05-27 14:48:13.154412
40254	55	1	12	2013-05-27 14:48:13.155254	2013-05-27 14:48:13.155254
40255	55	3	12	2013-05-27 14:48:13.156121	2013-05-27 14:48:13.156121
40256	55	5	12	2013-05-27 14:48:13.157069	2013-05-27 14:48:13.157069
40257	55	7	12	2013-05-27 14:48:13.158016	2013-05-27 14:48:13.158016
40258	55	8	12	2013-05-27 14:48:13.159036	2013-05-27 14:48:13.159036
40259	55	9	12	2013-05-27 14:48:13.159975	2013-05-27 14:48:13.159975
40260	55	10	12	2013-05-27 14:48:13.160909	2013-05-27 14:48:13.160909
40261	55	11	12	2013-05-27 14:48:13.161729	2013-05-27 14:48:13.161729
40262	55	31	12	2013-05-27 14:48:13.16702	2013-05-27 14:48:13.16702
40263	55	32	12	2013-05-27 14:48:13.167796	2013-05-27 14:48:13.167796
40264	55	33	12	2013-05-27 14:48:13.16859	2013-05-27 14:48:13.16859
40265	55	34	12	2013-05-27 14:48:13.169604	2013-05-27 14:48:13.169604
40266	55	35	12	2013-05-27 14:48:13.170729	2013-05-27 14:48:13.170729
40267	55	5	13	2013-05-27 14:48:13.17154	2013-05-27 14:48:13.17154
40268	55	7	13	2013-05-27 14:48:13.172386	2013-05-27 14:48:13.172386
40269	55	9	13	2013-05-27 14:48:13.173278	2013-05-27 14:48:13.173278
40270	55	11	13	2013-05-27 14:48:13.174098	2013-05-27 14:48:13.174098
40271	55	31	13	2013-05-27 14:48:13.176776	2013-05-27 14:48:13.176776
40272	55	32	13	2013-05-27 14:48:13.177995	2013-05-27 14:48:13.177995
40273	55	33	13	2013-05-27 14:48:13.178823	2013-05-27 14:48:13.178823
40274	55	34	13	2013-05-27 14:48:13.179595	2013-05-27 14:48:13.179595
40275	55	35	13	2013-05-27 14:48:13.180332	2013-05-27 14:48:13.180332
40276	55	5	14	2013-05-27 14:48:13.181074	2013-05-27 14:48:13.181074
40277	55	7	14	2013-05-27 14:48:13.181785	2013-05-27 14:48:13.181785
40278	55	9	14	2013-05-27 14:48:13.182595	2013-05-27 14:48:13.182595
40279	55	11	14	2013-05-27 14:48:13.183433	2013-05-27 14:48:13.183433
40280	55	33	14	2013-05-27 14:48:13.185161	2013-05-27 14:48:13.185161
40281	55	34	14	2013-05-27 14:48:13.185989	2013-05-27 14:48:13.185989
40282	55	35	14	2013-05-27 14:48:13.186749	2013-05-27 14:48:13.186749
40283	55	5	15	2013-05-27 14:48:13.188297	2013-05-27 14:48:13.188297
40284	55	7	15	2013-05-27 14:48:13.1891	2013-05-27 14:48:13.1891
40285	55	9	15	2013-05-27 14:48:13.189974	2013-05-27 14:48:13.189974
40286	55	11	15	2013-05-27 14:48:13.191189	2013-05-27 14:48:13.191189
40287	55	33	15	2013-05-27 14:48:13.193088	2013-05-27 14:48:13.193088
40288	55	34	15	2013-05-27 14:48:13.194017	2013-05-27 14:48:13.194017
40289	55	35	15	2013-05-27 14:48:13.194981	2013-05-27 14:48:13.194981
40290	55	5	16	2013-05-27 14:48:13.19664	2013-05-27 14:48:13.19664
40291	55	7	16	2013-05-27 14:48:13.197371	2013-05-27 14:48:13.197371
40292	55	9	16	2013-05-27 14:48:13.198076	2013-05-27 14:48:13.198076
40293	55	11	16	2013-05-27 14:48:13.198968	2013-05-27 14:48:13.198968
40294	55	12	16	2013-05-27 14:48:13.199787	2013-05-27 14:48:13.199787
40295	55	13	16	2013-05-27 14:48:13.200532	2013-05-27 14:48:13.200532
40296	55	14	16	2013-05-27 14:48:13.201268	2013-05-27 14:48:13.201268
40297	55	15	16	2013-05-27 14:48:13.201945	2013-05-27 14:48:13.201945
40298	55	35	16	2013-05-27 14:48:13.203577	2013-05-27 14:48:13.203577
40299	55	9	17	2013-05-27 14:48:13.204351	2013-05-27 14:48:13.204351
40300	55	11	17	2013-05-27 14:48:13.205112	2013-05-27 14:48:13.205112
40301	55	13	17	2013-05-27 14:48:13.205788	2013-05-27 14:48:13.205788
40302	55	14	17	2013-05-27 14:48:13.206793	2013-05-27 14:48:13.206793
40303	55	15	17	2013-05-27 14:48:13.207691	2013-05-27 14:48:13.207691
40304	55	35	17	2013-05-27 14:48:13.209638	2013-05-27 14:48:13.209638
40305	55	9	18	2013-05-27 14:48:13.212483	2013-05-27 14:48:13.212483
40306	55	11	18	2013-05-27 14:48:13.21328	2013-05-27 14:48:13.21328
40307	55	13	18	2013-05-27 14:48:13.214065	2013-05-27 14:48:13.214065
40308	55	14	18	2013-05-27 14:48:13.214955	2013-05-27 14:48:13.214955
40309	55	15	18	2013-05-27 14:48:13.215772	2013-05-27 14:48:13.215772
40310	55	35	18	2013-05-27 14:48:13.217507	2013-05-27 14:48:13.217507
40311	55	13	19	2013-05-27 14:48:13.219287	2013-05-27 14:48:13.219287
40312	55	14	19	2013-05-27 14:48:13.220313	2013-05-27 14:48:13.220313
40313	55	15	19	2013-05-27 14:48:13.221133	2013-05-27 14:48:13.221133
40314	16	16	0	2013-05-28 01:13:32.32534	2013-05-28 01:13:32.32534
40315	16	17	0	2013-05-28 01:13:32.326095	2013-05-28 01:13:32.326095
40316	16	18	0	2013-05-28 01:13:32.326793	2013-05-28 01:13:32.326793
40317	16	19	0	2013-05-28 01:13:32.327448	2013-05-28 01:13:32.327448
40318	16	16	1	2013-05-28 01:13:32.328185	2013-05-28 01:13:32.328185
40319	16	17	1	2013-05-28 01:13:32.328834	2013-05-28 01:13:32.328834
40320	16	18	1	2013-05-28 01:13:32.329513	2013-05-28 01:13:32.329513
40321	16	19	1	2013-05-28 01:13:32.330196	2013-05-28 01:13:32.330196
40322	16	16	2	2013-05-28 01:13:32.330889	2013-05-28 01:13:32.330889
40323	16	17	2	2013-05-28 01:13:32.331718	2013-05-28 01:13:32.331718
40324	16	18	2	2013-05-28 01:13:32.332395	2013-05-28 01:13:32.332395
40325	16	19	2	2013-05-28 01:13:32.333038	2013-05-28 01:13:32.333038
40326	16	16	3	2013-05-28 01:13:32.333742	2013-05-28 01:13:32.333742
40327	16	17	3	2013-05-28 01:13:32.334459	2013-05-28 01:13:32.334459
40328	16	18	3	2013-05-28 01:13:32.335105	2013-05-28 01:13:32.335105
40329	16	19	3	2013-05-28 01:13:32.335746	2013-05-28 01:13:32.335746
40330	16	16	4	2013-05-28 01:13:32.340337	2013-05-28 01:13:32.340337
40331	16	17	4	2013-05-28 01:13:32.341063	2013-05-28 01:13:32.341063
40332	16	18	4	2013-05-28 01:13:32.341718	2013-05-28 01:13:32.341718
40333	16	19	4	2013-05-28 01:13:32.342371	2013-05-28 01:13:32.342371
40334	16	16	5	2013-05-28 01:13:32.343065	2013-05-28 01:13:32.343065
40335	16	17	5	2013-05-28 01:13:32.343715	2013-05-28 01:13:32.343715
40336	16	18	5	2013-05-28 01:13:32.344491	2013-05-28 01:13:32.344491
40337	16	19	5	2013-05-28 01:13:32.345155	2013-05-28 01:13:32.345155
40338	16	0	7	2013-05-28 01:13:32.347508	2013-05-28 01:13:32.347508
40339	16	1	7	2013-05-28 01:13:32.348196	2013-05-28 01:13:32.348196
40340	16	2	7	2013-05-28 01:13:32.349237	2013-05-28 01:13:32.349237
40341	16	3	7	2013-05-28 01:13:32.349973	2013-05-28 01:13:32.349973
40342	16	4	7	2013-05-28 01:13:32.35063	2013-05-28 01:13:32.35063
40343	16	5	7	2013-05-28 01:13:32.351284	2013-05-28 01:13:32.351284
40344	16	6	7	2013-05-28 01:13:32.351933	2013-05-28 01:13:32.351933
40345	16	7	7	2013-05-28 01:13:32.352601	2013-05-28 01:13:32.352601
40346	16	8	7	2013-05-28 01:13:32.353252	2013-05-28 01:13:32.353252
40347	16	9	7	2013-05-28 01:13:32.35392	2013-05-28 01:13:32.35392
40348	16	10	7	2013-05-28 01:13:32.354666	2013-05-28 01:13:32.354666
40349	16	11	7	2013-05-28 01:13:32.355403	2013-05-28 01:13:32.355403
40350	16	12	7	2013-05-28 01:13:32.35614	2013-05-28 01:13:32.35614
40351	16	13	7	2013-05-28 01:13:32.356796	2013-05-28 01:13:32.356796
40352	16	22	7	2013-05-28 01:13:32.357459	2013-05-28 01:13:32.357459
40353	16	23	7	2013-05-28 01:13:32.378398	2013-05-28 01:13:32.378398
40354	16	24	7	2013-05-28 01:13:32.380356	2013-05-28 01:13:32.380356
40355	16	25	7	2013-05-28 01:13:32.381995	2013-05-28 01:13:32.381995
40356	16	26	7	2013-05-28 01:13:32.383345	2013-05-28 01:13:32.383345
40357	16	27	7	2013-05-28 01:13:32.384836	2013-05-28 01:13:32.384836
40358	16	28	7	2013-05-28 01:13:32.386152	2013-05-28 01:13:32.386152
40359	16	29	7	2013-05-28 01:13:32.387445	2013-05-28 01:13:32.387445
40360	16	30	7	2013-05-28 01:13:32.388716	2013-05-28 01:13:32.388716
40361	16	31	7	2013-05-28 01:13:32.389933	2013-05-28 01:13:32.389933
40362	16	32	7	2013-05-28 01:13:32.391028	2013-05-28 01:13:32.391028
40363	16	33	7	2013-05-28 01:13:32.392122	2013-05-28 01:13:32.392122
40364	16	34	7	2013-05-28 01:13:32.392818	2013-05-28 01:13:32.392818
40365	16	35	7	2013-05-28 01:13:32.393565	2013-05-28 01:13:32.393565
40366	16	0	8	2013-05-28 01:13:32.394265	2013-05-28 01:13:32.394265
40367	16	1	8	2013-05-28 01:13:32.394946	2013-05-28 01:13:32.394946
40368	16	2	8	2013-05-28 01:13:32.395606	2013-05-28 01:13:32.395606
40369	16	3	8	2013-05-28 01:13:32.396253	2013-05-28 01:13:32.396253
40370	16	4	8	2013-05-28 01:13:32.396993	2013-05-28 01:13:32.396993
40371	16	5	8	2013-05-28 01:13:32.397687	2013-05-28 01:13:32.397687
40372	16	6	8	2013-05-28 01:13:32.398332	2013-05-28 01:13:32.398332
40373	16	7	8	2013-05-28 01:13:32.39899	2013-05-28 01:13:32.39899
40374	16	8	8	2013-05-28 01:13:32.39963	2013-05-28 01:13:32.39963
40375	16	9	8	2013-05-28 01:13:32.400397	2013-05-28 01:13:32.400397
40376	16	10	8	2013-05-28 01:13:32.401045	2013-05-28 01:13:32.401045
40377	16	11	8	2013-05-28 01:13:32.401725	2013-05-28 01:13:32.401725
40378	16	12	8	2013-05-28 01:13:32.402367	2013-05-28 01:13:32.402367
40379	16	13	8	2013-05-28 01:13:32.40303	2013-05-28 01:13:32.40303
40380	16	22	8	2013-05-28 01:13:32.404342	2013-05-28 01:13:32.404342
40381	16	23	8	2013-05-28 01:13:32.405772	2013-05-28 01:13:32.405772
40382	16	24	8	2013-05-28 01:13:32.407356	2013-05-28 01:13:32.407356
40383	16	25	8	2013-05-28 01:13:32.408781	2013-05-28 01:13:32.408781
40384	16	26	8	2013-05-28 01:13:32.409542	2013-05-28 01:13:32.409542
40385	16	27	8	2013-05-28 01:13:32.410286	2013-05-28 01:13:32.410286
40386	16	28	8	2013-05-28 01:13:32.411035	2013-05-28 01:13:32.411035
40387	16	29	8	2013-05-28 01:13:32.411807	2013-05-28 01:13:32.411807
40388	16	30	8	2013-05-28 01:13:32.41251	2013-05-28 01:13:32.41251
40389	16	31	8	2013-05-28 01:13:32.413298	2013-05-28 01:13:32.413298
40390	16	32	8	2013-05-28 01:13:32.414046	2013-05-28 01:13:32.414046
40391	16	33	8	2013-05-28 01:13:32.414713	2013-05-28 01:13:32.414713
40392	16	34	8	2013-05-28 01:13:32.415432	2013-05-28 01:13:32.415432
40393	16	35	8	2013-05-28 01:13:32.416096	2013-05-28 01:13:32.416096
40394	16	11	9	2013-05-28 01:13:32.416813	2013-05-28 01:13:32.416813
40395	16	12	9	2013-05-28 01:13:32.417514	2013-05-28 01:13:32.417514
40396	16	13	9	2013-05-28 01:13:32.418168	2013-05-28 01:13:32.418168
40397	16	14	9	2013-05-28 01:13:32.41883	2013-05-28 01:13:32.41883
40398	16	15	9	2013-05-28 01:13:32.419576	2013-05-28 01:13:32.419576
40399	16	16	9	2013-05-28 01:13:32.42029	2013-05-28 01:13:32.42029
40400	16	17	9	2013-05-28 01:13:32.421158	2013-05-28 01:13:32.421158
40401	16	18	9	2013-05-28 01:13:32.422085	2013-05-28 01:13:32.422085
40402	16	11	10	2013-05-28 01:13:32.42294	2013-05-28 01:13:32.42294
40403	16	12	10	2013-05-28 01:13:32.423738	2013-05-28 01:13:32.423738
40404	16	13	10	2013-05-28 01:13:32.424461	2013-05-28 01:13:32.424461
40405	16	14	10	2013-05-28 01:13:32.425211	2013-05-28 01:13:32.425211
40406	16	15	10	2013-05-28 01:13:32.42602	2013-05-28 01:13:32.42602
40407	16	16	10	2013-05-28 01:13:32.426745	2013-05-28 01:13:32.426745
40408	16	17	10	2013-05-28 01:13:32.427533	2013-05-28 01:13:32.427533
40409	16	18	10	2013-05-28 01:13:32.428235	2013-05-28 01:13:32.428235
40410	16	17	12	2013-05-28 01:13:32.432771	2013-05-28 01:13:32.432771
40411	16	18	12	2013-05-28 01:13:32.433518	2013-05-28 01:13:32.433518
40412	16	19	12	2013-05-28 01:13:32.434538	2013-05-28 01:13:32.434538
40413	16	20	12	2013-05-28 01:13:32.435336	2013-05-28 01:13:32.435336
40414	16	21	12	2013-05-28 01:13:32.436067	2013-05-28 01:13:32.436067
40415	16	22	12	2013-05-28 01:13:32.436783	2013-05-28 01:13:32.436783
40416	16	23	12	2013-05-28 01:13:32.437545	2013-05-28 01:13:32.437545
40417	16	24	12	2013-05-28 01:13:32.438201	2013-05-28 01:13:32.438201
40418	16	17	13	2013-05-28 01:13:32.442002	2013-05-28 01:13:32.442002
40419	16	18	13	2013-05-28 01:13:32.442667	2013-05-28 01:13:32.442667
40420	16	19	13	2013-05-28 01:13:32.443403	2013-05-28 01:13:32.443403
40421	16	20	13	2013-05-28 01:13:32.444082	2013-05-28 01:13:32.444082
40422	16	21	13	2013-05-28 01:13:32.444734	2013-05-28 01:13:32.444734
40423	16	22	13	2013-05-28 01:13:32.445377	2013-05-28 01:13:32.445377
40424	16	23	13	2013-05-28 01:13:32.446212	2013-05-28 01:13:32.446212
40425	16	24	13	2013-05-28 01:13:32.446868	2013-05-28 01:13:32.446868
40426	16	0	14	2013-05-28 01:13:32.449029	2013-05-28 01:13:32.449029
40427	16	1	14	2013-05-28 01:13:32.449727	2013-05-28 01:13:32.449727
40428	16	2	14	2013-05-28 01:13:32.45068	2013-05-28 01:13:32.45068
40429	16	3	14	2013-05-28 01:13:32.451501	2013-05-28 01:13:32.451501
40430	16	4	14	2013-05-28 01:13:32.452204	2013-05-28 01:13:32.452204
40431	16	5	14	2013-05-28 01:13:32.452934	2013-05-28 01:13:32.452934
40432	16	6	14	2013-05-28 01:13:32.45368	2013-05-28 01:13:32.45368
40433	16	7	14	2013-05-28 01:13:32.454628	2013-05-28 01:13:32.454628
40434	16	8	14	2013-05-28 01:13:32.455481	2013-05-28 01:13:32.455481
40435	16	9	14	2013-05-28 01:13:32.456283	2013-05-28 01:13:32.456283
40436	16	10	14	2013-05-28 01:13:32.456954	2013-05-28 01:13:32.456954
40437	16	11	14	2013-05-28 01:13:32.457786	2013-05-28 01:13:32.457786
40438	16	12	14	2013-05-28 01:13:32.458454	2013-05-28 01:13:32.458454
40439	16	13	14	2013-05-28 01:13:32.459121	2013-05-28 01:13:32.459121
40440	16	22	14	2013-05-28 01:13:32.460775	2013-05-28 01:13:32.460775
40441	16	23	14	2013-05-28 01:13:32.461434	2013-05-28 01:13:32.461434
40442	16	24	14	2013-05-28 01:13:32.462077	2013-05-28 01:13:32.462077
40443	16	25	14	2013-05-28 01:13:32.462752	2013-05-28 01:13:32.462752
40444	16	26	14	2013-05-28 01:13:32.463624	2013-05-28 01:13:32.463624
40445	16	27	14	2013-05-28 01:13:32.46443	2013-05-28 01:13:32.46443
40446	16	28	14	2013-05-28 01:13:32.465107	2013-05-28 01:13:32.465107
40447	16	29	14	2013-05-28 01:13:32.524504	2013-05-28 01:13:32.524504
40448	16	30	14	2013-05-28 01:13:32.525253	2013-05-28 01:13:32.525253
40449	16	31	14	2013-05-28 01:13:32.525931	2013-05-28 01:13:32.525931
40450	16	32	14	2013-05-28 01:13:32.526611	2013-05-28 01:13:32.526611
40451	16	33	14	2013-05-28 01:13:32.527288	2013-05-28 01:13:32.527288
40452	16	34	14	2013-05-28 01:13:32.527959	2013-05-28 01:13:32.527959
40453	16	35	14	2013-05-28 01:13:32.528629	2013-05-28 01:13:32.528629
40454	16	0	15	2013-05-28 01:13:32.52932	2013-05-28 01:13:32.52932
40455	16	1	15	2013-05-28 01:13:32.530252	2013-05-28 01:13:32.530252
40456	16	2	15	2013-05-28 01:13:32.531082	2013-05-28 01:13:32.531082
40457	16	3	15	2013-05-28 01:13:32.531919	2013-05-28 01:13:32.531919
40458	16	4	15	2013-05-28 01:13:32.53264	2013-05-28 01:13:32.53264
40459	16	5	15	2013-05-28 01:13:32.533529	2013-05-28 01:13:32.533529
40460	16	6	15	2013-05-28 01:13:32.534271	2013-05-28 01:13:32.534271
40461	16	7	15	2013-05-28 01:13:32.534946	2013-05-28 01:13:32.534946
40462	16	8	15	2013-05-28 01:13:32.535622	2013-05-28 01:13:32.535622
40463	16	9	15	2013-05-28 01:13:32.536288	2013-05-28 01:13:32.536288
40464	16	10	15	2013-05-28 01:13:32.536952	2013-05-28 01:13:32.536952
40465	16	11	15	2013-05-28 01:13:32.537623	2013-05-28 01:13:32.537623
40466	16	12	15	2013-05-28 01:13:32.538286	2013-05-28 01:13:32.538286
40467	16	13	15	2013-05-28 01:13:32.538953	2013-05-28 01:13:32.538953
40468	16	22	15	2013-05-28 01:13:32.53994	2013-05-28 01:13:32.53994
40469	16	23	15	2013-05-28 01:13:32.540669	2013-05-28 01:13:32.540669
40470	16	24	15	2013-05-28 01:13:32.541354	2013-05-28 01:13:32.541354
40471	16	25	15	2013-05-28 01:13:32.542055	2013-05-28 01:13:32.542055
40472	16	26	15	2013-05-28 01:13:32.542793	2013-05-28 01:13:32.542793
40473	16	27	15	2013-05-28 01:13:32.543494	2013-05-28 01:13:32.543494
40474	16	28	15	2013-05-28 01:13:32.544166	2013-05-28 01:13:32.544166
40475	16	29	15	2013-05-28 01:13:32.544836	2013-05-28 01:13:32.544836
40476	16	30	15	2013-05-28 01:13:32.545495	2013-05-28 01:13:32.545495
40477	16	31	15	2013-05-28 01:13:32.546383	2013-05-28 01:13:32.546383
40478	16	32	15	2013-05-28 01:13:32.547374	2013-05-28 01:13:32.547374
40479	16	33	15	2013-05-28 01:13:32.548759	2013-05-28 01:13:32.548759
40480	16	34	15	2013-05-28 01:13:32.550138	2013-05-28 01:13:32.550138
40481	16	35	15	2013-05-28 01:13:32.550976	2013-05-28 01:13:32.550976
40482	16	16	17	2013-05-28 01:13:32.555332	2013-05-28 01:13:32.555332
40483	16	17	17	2013-05-28 01:13:32.556244	2013-05-28 01:13:32.556244
40484	16	18	17	2013-05-28 01:13:32.556915	2013-05-28 01:13:32.556915
40485	16	19	17	2013-05-28 01:13:32.557594	2013-05-28 01:13:32.557594
40486	16	16	18	2013-05-28 01:13:32.558298	2013-05-28 01:13:32.558298
40487	16	17	18	2013-05-28 01:13:32.558952	2013-05-28 01:13:32.558952
40488	16	18	18	2013-05-28 01:13:32.559651	2013-05-28 01:13:32.559651
40489	16	19	18	2013-05-28 01:13:32.560309	2013-05-28 01:13:32.560309
40490	16	16	19	2013-05-28 01:13:32.562688	2013-05-28 01:13:32.562688
40491	16	17	19	2013-05-28 01:13:32.563437	2013-05-28 01:13:32.563437
40492	16	18	19	2013-05-28 01:13:32.564118	2013-05-28 01:13:32.564118
40493	16	19	19	2013-05-28 01:13:32.564767	2013-05-28 01:13:32.564767
40494	16	16	20	2013-05-28 01:13:32.567298	2013-05-28 01:13:32.567298
40495	16	17	20	2013-05-28 01:13:32.568015	2013-05-28 01:13:32.568015
40496	16	18	20	2013-05-28 01:13:32.568709	2013-05-28 01:13:32.568709
40497	16	19	20	2013-05-28 01:13:32.569409	2013-05-28 01:13:32.569409
40498	16	16	21	2013-05-28 01:13:32.570154	2013-05-28 01:13:32.570154
40499	16	17	21	2013-05-28 01:13:32.57086	2013-05-28 01:13:32.57086
40500	16	18	21	2013-05-28 01:13:32.571556	2013-05-28 01:13:32.571556
40501	16	19	21	2013-05-28 01:13:32.572209	2013-05-28 01:13:32.572209
40502	21	15	0	2013-05-28 01:20:01.209611	2013-05-28 01:20:01.209611
40503	21	16	0	2013-05-28 01:20:01.210666	2013-05-28 01:20:01.210666
40504	21	17	0	2013-05-28 01:20:01.211567	2013-05-28 01:20:01.211567
40505	21	15	1	2013-05-28 01:20:01.216319	2013-05-28 01:20:01.216319
40506	21	16	1	2013-05-28 01:20:01.217075	2013-05-28 01:20:01.217075
40507	21	17	1	2013-05-28 01:20:01.217806	2013-05-28 01:20:01.217806
40508	21	15	2	2013-05-28 01:20:01.218581	2013-05-28 01:20:01.218581
40509	21	16	2	2013-05-28 01:20:01.219294	2013-05-28 01:20:01.219294
40510	21	17	2	2013-05-28 01:20:01.220072	2013-05-28 01:20:01.220072
40511	21	15	3	2013-05-28 01:20:01.220814	2013-05-28 01:20:01.220814
40512	21	16	3	2013-05-28 01:20:01.22147	2013-05-28 01:20:01.22147
40513	21	17	3	2013-05-28 01:20:01.222125	2013-05-28 01:20:01.222125
40514	21	15	4	2013-05-28 01:20:01.22488	2013-05-28 01:20:01.22488
40515	21	16	4	2013-05-28 01:20:01.225725	2013-05-28 01:20:01.225725
40516	21	17	4	2013-05-28 01:20:01.226492	2013-05-28 01:20:01.226492
40517	21	15	5	2013-05-28 01:20:01.227218	2013-05-28 01:20:01.227218
40518	21	16	5	2013-05-28 01:20:01.22791	2013-05-28 01:20:01.22791
40519	21	17	5	2013-05-28 01:20:01.228707	2013-05-28 01:20:01.228707
40520	21	15	6	2013-05-28 01:20:01.229438	2013-05-28 01:20:01.229438
40521	21	16	6	2013-05-28 01:20:01.230111	2013-05-28 01:20:01.230111
40522	21	17	6	2013-05-28 01:20:01.23078	2013-05-28 01:20:01.23078
40523	21	10	8	2013-05-28 01:20:01.233333	2013-05-28 01:20:01.233333
40524	21	11	8	2013-05-28 01:20:01.234031	2013-05-28 01:20:01.234031
40525	21	12	8	2013-05-28 01:20:01.234721	2013-05-28 01:20:01.234721
40526	21	10	9	2013-05-28 01:20:01.235428	2013-05-28 01:20:01.235428
40527	21	11	9	2013-05-28 01:20:01.236083	2013-05-28 01:20:01.236083
40528	21	12	9	2013-05-28 01:20:01.236873	2013-05-28 01:20:01.236873
40529	21	0	10	2013-05-28 01:20:01.238609	2013-05-28 01:20:01.238609
40530	21	1	10	2013-05-28 01:20:01.23931	2013-05-28 01:20:01.23931
40531	21	2	10	2013-05-28 01:20:01.239984	2013-05-28 01:20:01.239984
40532	21	3	10	2013-05-28 01:20:01.240651	2013-05-28 01:20:01.240651
40533	21	4	10	2013-05-28 01:20:01.241313	2013-05-28 01:20:01.241313
40534	21	5	10	2013-05-28 01:20:01.241974	2013-05-28 01:20:01.241974
40535	21	6	10	2013-05-28 01:20:01.242636	2013-05-28 01:20:01.242636
40536	21	7	10	2013-05-28 01:20:01.243298	2013-05-28 01:20:01.243298
40537	21	8	10	2013-05-28 01:20:01.243955	2013-05-28 01:20:01.243955
40538	21	9	10	2013-05-28 01:20:01.24461	2013-05-28 01:20:01.24461
40539	21	10	10	2013-05-28 01:20:01.245282	2013-05-28 01:20:01.245282
40540	21	11	10	2013-05-28 01:20:01.245938	2013-05-28 01:20:01.245938
40541	21	12	10	2013-05-28 01:20:01.246591	2013-05-28 01:20:01.246591
40542	21	0	11	2013-05-28 01:20:01.248204	2013-05-28 01:20:01.248204
40543	21	1	11	2013-05-28 01:20:01.248907	2013-05-28 01:20:01.248907
40544	21	2	11	2013-05-28 01:20:01.249579	2013-05-28 01:20:01.249579
40545	21	3	11	2013-05-28 01:20:01.250257	2013-05-28 01:20:01.250257
40546	21	4	11	2013-05-28 01:20:01.250913	2013-05-28 01:20:01.250913
40547	21	5	11	2013-05-28 01:20:01.251578	2013-05-28 01:20:01.251578
40548	21	6	11	2013-05-28 01:20:01.252254	2013-05-28 01:20:01.252254
40549	21	7	11	2013-05-28 01:20:01.252902	2013-05-28 01:20:01.252902
40550	21	8	11	2013-05-28 01:20:01.25355	2013-05-28 01:20:01.25355
40551	21	9	11	2013-05-28 01:20:01.254504	2013-05-28 01:20:01.254504
40552	21	10	11	2013-05-28 01:20:01.255344	2013-05-28 01:20:01.255344
40553	21	11	11	2013-05-28 01:20:01.256157	2013-05-28 01:20:01.256157
40554	21	12	11	2013-05-28 01:20:01.256946	2013-05-28 01:20:01.256946
40555	21	0	12	2013-05-28 01:20:01.259538	2013-05-28 01:20:01.259538
40556	21	1	12	2013-05-28 01:20:01.260348	2013-05-28 01:20:01.260348
40557	21	2	12	2013-05-28 01:20:01.261349	2013-05-28 01:20:01.261349
40558	21	3	12	2013-05-28 01:20:01.262224	2013-05-28 01:20:01.262224
40559	21	4	12	2013-05-28 01:20:01.263028	2013-05-28 01:20:01.263028
40560	21	5	12	2013-05-28 01:20:01.26379	2013-05-28 01:20:01.26379
40561	21	6	12	2013-05-28 01:20:01.264505	2013-05-28 01:20:01.264505
40562	21	7	12	2013-05-28 01:20:01.265288	2013-05-28 01:20:01.265288
40563	21	8	12	2013-05-28 01:20:01.265989	2013-05-28 01:20:01.265989
40564	21	9	12	2013-05-28 01:20:01.266702	2013-05-28 01:20:01.266702
40565	21	10	12	2013-05-28 01:20:01.267392	2013-05-28 01:20:01.267392
40566	21	11	12	2013-05-28 01:20:01.268076	2013-05-28 01:20:01.268076
40567	21	12	12	2013-05-28 01:20:01.268751	2013-05-28 01:20:01.268751
41945	56	9	0	2013-06-10 03:35:32.257704	2013-06-10 03:35:32.257704
41946	56	10	0	2013-06-10 03:35:32.258776	2013-06-10 03:35:32.258776
41947	56	9	1	2013-06-10 03:35:32.260508	2013-06-10 03:35:32.260508
41948	56	10	1	2013-06-10 03:35:32.261263	2013-06-10 03:35:32.261263
41949	56	9	2	2013-06-10 03:35:32.261962	2013-06-10 03:35:32.261962
41950	56	10	2	2013-06-10 03:35:32.262646	2013-06-10 03:35:32.262646
41951	56	0	13	2013-06-10 03:35:32.26992	2013-06-10 03:35:32.26992
41952	56	1	13	2013-06-10 03:35:32.270634	2013-06-10 03:35:32.270634
41953	56	2	13	2013-06-10 03:35:32.271343	2013-06-10 03:35:32.271343
41954	56	3	13	2013-06-10 03:35:32.271993	2013-06-10 03:35:32.271993
41955	56	4	13	2013-06-10 03:35:32.272637	2013-06-10 03:35:32.272637
41956	56	5	13	2013-06-10 03:35:32.273274	2013-06-10 03:35:32.273274
41957	56	6	13	2013-06-10 03:35:32.273911	2013-06-10 03:35:32.273911
41958	56	7	13	2013-06-10 03:35:32.27455	2013-06-10 03:35:32.27455
41959	56	10	13	2013-06-10 03:35:32.276196	2013-06-10 03:35:32.276196
41960	56	11	13	2013-06-10 03:35:32.277005	2013-06-10 03:35:32.277005
41961	56	12	13	2013-06-10 03:35:32.277892	2013-06-10 03:35:32.277892
41962	56	13	13	2013-06-10 03:35:32.278685	2013-06-10 03:35:32.278685
41963	56	14	13	2013-06-10 03:35:32.279413	2013-06-10 03:35:32.279413
41964	56	15	13	2013-06-10 03:35:32.280104	2013-06-10 03:35:32.280104
41965	56	0	14	2013-06-10 03:35:32.280767	2013-06-10 03:35:32.280767
41966	56	1	14	2013-06-10 03:35:32.281503	2013-06-10 03:35:32.281503
41967	56	2	14	2013-06-10 03:35:32.282163	2013-06-10 03:35:32.282163
41968	56	3	14	2013-06-10 03:35:32.282805	2013-06-10 03:35:32.282805
41969	56	4	14	2013-06-10 03:35:32.283451	2013-06-10 03:35:32.283451
41970	56	5	14	2013-06-10 03:35:32.284161	2013-06-10 03:35:32.284161
41971	56	6	14	2013-06-10 03:35:32.284927	2013-06-10 03:35:32.284927
41972	56	7	14	2013-06-10 03:35:32.285692	2013-06-10 03:35:32.285692
41973	56	10	14	2013-06-10 03:35:32.287431	2013-06-10 03:35:32.287431
41974	56	11	14	2013-06-10 03:35:32.288323	2013-06-10 03:35:32.288323
41975	56	12	14	2013-06-10 03:35:32.289082	2013-06-10 03:35:32.289082
41976	56	13	14	2013-06-10 03:35:32.289731	2013-06-10 03:35:32.289731
41977	56	14	14	2013-06-10 03:35:32.290365	2013-06-10 03:35:32.290365
41978	56	15	14	2013-06-10 03:35:32.291035	2013-06-10 03:35:32.291035
41979	56	14	15	2013-06-10 03:35:32.291859	2013-06-10 03:35:32.291859
41980	56	15	15	2013-06-10 03:35:32.292517	2013-06-10 03:35:32.292517
41981	56	14	16	2013-06-10 03:35:32.293203	2013-06-10 03:35:32.293203
41982	56	15	16	2013-06-10 03:35:32.29384	2013-06-10 03:35:32.29384
41983	56	14	17	2013-06-10 03:35:32.29537	2013-06-10 03:35:32.29537
41984	56	15	17	2013-06-10 03:35:32.296051	2013-06-10 03:35:32.296051
41985	56	14	18	2013-06-10 03:35:32.298453	2013-06-10 03:35:32.298453
41986	56	15	18	2013-06-10 03:35:32.299132	2013-06-10 03:35:32.299132
41987	56	14	19	2013-06-10 03:35:32.29988	2013-06-10 03:35:32.29988
41988	56	15	19	2013-06-10 03:35:32.300656	2013-06-10 03:35:32.300656
41989	56	14	20	2013-06-10 03:35:32.301488	2013-06-10 03:35:32.301488
41990	56	15	20	2013-06-10 03:35:32.302269	2013-06-10 03:35:32.302269
41991	56	14	21	2013-06-10 03:35:32.302992	2013-06-10 03:35:32.302992
41992	56	15	21	2013-06-10 03:35:32.303667	2013-06-10 03:35:32.303667
42857	58	0	7	2013-06-10 04:03:23.894953	2013-06-10 04:03:23.894953
42858	58	1	7	2013-06-10 04:03:23.895648	2013-06-10 04:03:23.895648
42859	58	2	7	2013-06-10 04:03:23.896465	2013-06-10 04:03:23.896465
42860	58	3	7	2013-06-10 04:03:23.897247	2013-06-10 04:03:23.897247
42861	58	4	7	2013-06-10 04:03:23.897955	2013-06-10 04:03:23.897955
42862	58	5	7	2013-06-10 04:03:23.89863	2013-06-10 04:03:23.89863
42863	58	6	7	2013-06-10 04:03:23.899434	2013-06-10 04:03:23.899434
42864	58	7	7	2013-06-10 04:03:23.900264	2013-06-10 04:03:23.900264
42865	58	8	7	2013-06-10 04:03:23.901111	2013-06-10 04:03:23.901111
42866	58	9	7	2013-06-10 04:03:23.901911	2013-06-10 04:03:23.901911
42867	58	10	7	2013-06-10 04:03:23.902668	2013-06-10 04:03:23.902668
42868	58	22	7	2013-06-10 04:03:23.9034	2013-06-10 04:03:23.9034
42869	58	23	7	2013-06-10 04:03:23.904099	2013-06-10 04:03:23.904099
42870	58	24	7	2013-06-10 04:03:23.904792	2013-06-10 04:03:23.904792
42871	58	25	7	2013-06-10 04:03:23.905524	2013-06-10 04:03:23.905524
42872	58	26	7	2013-06-10 04:03:23.906227	2013-06-10 04:03:23.906227
42873	58	27	7	2013-06-10 04:03:23.906928	2013-06-10 04:03:23.906928
42874	58	28	7	2013-06-10 04:03:23.907613	2013-06-10 04:03:23.907613
42875	58	29	7	2013-06-10 04:03:23.908309	2013-06-10 04:03:23.908309
42876	58	30	7	2013-06-10 04:03:23.909016	2013-06-10 04:03:23.909016
42877	58	31	7	2013-06-10 04:03:23.909802	2013-06-10 04:03:23.909802
42878	58	32	7	2013-06-10 04:03:23.910516	2013-06-10 04:03:23.910516
42879	58	33	7	2013-06-10 04:03:23.911292	2013-06-10 04:03:23.911292
42880	58	34	7	2013-06-10 04:03:23.911991	2013-06-10 04:03:23.911991
42881	58	35	7	2013-06-10 04:03:23.912675	2013-06-10 04:03:23.912675
42882	58	0	8	2013-06-10 04:03:23.913358	2013-06-10 04:03:23.913358
42883	58	1	8	2013-06-10 04:03:23.91407	2013-06-10 04:03:23.91407
42884	58	2	8	2013-06-10 04:03:23.914832	2013-06-10 04:03:23.914832
42885	58	3	8	2013-06-10 04:03:23.915506	2013-06-10 04:03:23.915506
42886	58	4	8	2013-06-10 04:03:23.916204	2013-06-10 04:03:23.916204
42887	58	5	8	2013-06-10 04:03:23.916929	2013-06-10 04:03:23.916929
42888	58	6	8	2013-06-10 04:03:23.917625	2013-06-10 04:03:23.917625
42889	58	7	8	2013-06-10 04:03:23.918309	2013-06-10 04:03:23.918309
42890	58	8	8	2013-06-10 04:03:23.918979	2013-06-10 04:03:23.918979
42891	58	9	8	2013-06-10 04:03:23.919832	2013-06-10 04:03:23.919832
42892	58	10	8	2013-06-10 04:03:23.920837	2013-06-10 04:03:23.920837
42893	58	22	8	2013-06-10 04:03:23.923549	2013-06-10 04:03:23.923549
42894	58	23	8	2013-06-10 04:03:23.924944	2013-06-10 04:03:23.924944
42895	58	24	8	2013-06-10 04:03:23.926378	2013-06-10 04:03:23.926378
42896	58	25	8	2013-06-10 04:03:23.927416	2013-06-10 04:03:23.927416
42897	58	26	8	2013-06-10 04:03:23.928641	2013-06-10 04:03:23.928641
42898	58	27	8	2013-06-10 04:03:23.930434	2013-06-10 04:03:23.930434
42899	58	28	8	2013-06-10 04:03:23.931727	2013-06-10 04:03:23.931727
42900	58	29	8	2013-06-10 04:03:23.932595	2013-06-10 04:03:23.932595
42901	58	30	8	2013-06-10 04:03:23.933396	2013-06-10 04:03:23.933396
42902	58	31	8	2013-06-10 04:03:23.934267	2013-06-10 04:03:23.934267
42903	58	32	8	2013-06-10 04:03:23.935049	2013-06-10 04:03:23.935049
42904	58	33	8	2013-06-10 04:03:23.935815	2013-06-10 04:03:23.935815
42905	58	34	8	2013-06-10 04:03:23.936629	2013-06-10 04:03:23.936629
42906	58	35	8	2013-06-10 04:03:23.937443	2013-06-10 04:03:23.937443
42907	58	0	9	2013-06-10 04:03:23.938334	2013-06-10 04:03:23.938334
42908	58	1	9	2013-06-10 04:03:23.939213	2013-06-10 04:03:23.939213
42909	58	2	9	2013-06-10 04:03:23.940929	2013-06-10 04:03:23.940929
42910	58	3	9	2013-06-10 04:03:23.942006	2013-06-10 04:03:23.942006
42911	58	4	9	2013-06-10 04:03:23.943002	2013-06-10 04:03:23.943002
42912	58	5	9	2013-06-10 04:03:23.943965	2013-06-10 04:03:23.943965
42913	58	6	9	2013-06-10 04:03:23.945071	2013-06-10 04:03:23.945071
42914	58	7	9	2013-06-10 04:03:23.945972	2013-06-10 04:03:23.945972
42915	58	8	9	2013-06-10 04:03:23.946745	2013-06-10 04:03:23.946745
42916	58	9	9	2013-06-10 04:03:23.947575	2013-06-10 04:03:23.947575
42917	58	10	9	2013-06-10 04:03:23.948388	2013-06-10 04:03:23.948388
42918	58	22	9	2013-06-10 04:03:23.94929	2013-06-10 04:03:23.94929
42919	58	23	9	2013-06-10 04:03:23.950063	2013-06-10 04:03:23.950063
42920	58	24	9	2013-06-10 04:03:23.950783	2013-06-10 04:03:23.950783
42921	58	25	9	2013-06-10 04:03:23.951509	2013-06-10 04:03:23.951509
42922	58	26	9	2013-06-10 04:03:23.952236	2013-06-10 04:03:23.952236
42923	58	27	9	2013-06-10 04:03:23.952943	2013-06-10 04:03:23.952943
42924	58	28	9	2013-06-10 04:03:23.95385	2013-06-10 04:03:23.95385
42925	58	29	9	2013-06-10 04:03:23.954653	2013-06-10 04:03:23.954653
42926	58	30	9	2013-06-10 04:03:23.9554	2013-06-10 04:03:23.9554
42927	58	31	9	2013-06-10 04:03:23.956122	2013-06-10 04:03:23.956122
42928	58	32	9	2013-06-10 04:03:23.957047	2013-06-10 04:03:23.957047
42929	58	33	9	2013-06-10 04:03:23.958902	2013-06-10 04:03:23.958902
42930	58	34	9	2013-06-10 04:03:23.960556	2013-06-10 04:03:23.960556
42931	58	35	9	2013-06-10 04:03:23.961579	2013-06-10 04:03:23.961579
42932	58	0	10	2013-06-10 04:03:23.962451	2013-06-10 04:03:23.962451
42933	58	1	10	2013-06-10 04:03:23.963372	2013-06-10 04:03:23.963372
42934	58	2	10	2013-06-10 04:03:23.964302	2013-06-10 04:03:23.964302
42935	58	3	10	2013-06-10 04:03:23.965145	2013-06-10 04:03:23.965145
42936	58	4	10	2013-06-10 04:03:23.966245	2013-06-10 04:03:23.966245
42937	58	5	10	2013-06-10 04:03:23.967238	2013-06-10 04:03:23.967238
42938	58	6	10	2013-06-10 04:03:23.968141	2013-06-10 04:03:23.968141
42939	58	7	10	2013-06-10 04:03:23.96917	2013-06-10 04:03:23.96917
42940	58	8	10	2013-06-10 04:03:23.970522	2013-06-10 04:03:23.970522
42941	58	9	10	2013-06-10 04:03:23.972002	2013-06-10 04:03:23.972002
42942	58	10	10	2013-06-10 04:03:23.973099	2013-06-10 04:03:23.973099
42943	58	22	10	2013-06-10 04:03:23.976407	2013-06-10 04:03:23.976407
42944	58	23	10	2013-06-10 04:03:23.977282	2013-06-10 04:03:23.977282
42945	58	24	10	2013-06-10 04:03:23.978318	2013-06-10 04:03:23.978318
42946	58	25	10	2013-06-10 04:03:23.979305	2013-06-10 04:03:23.979305
42947	58	26	10	2013-06-10 04:03:23.980269	2013-06-10 04:03:23.980269
42948	58	27	10	2013-06-10 04:03:23.981379	2013-06-10 04:03:23.981379
42949	58	28	10	2013-06-10 04:03:23.982272	2013-06-10 04:03:23.982272
42950	58	29	10	2013-06-10 04:03:23.983122	2013-06-10 04:03:23.983122
42951	58	30	10	2013-06-10 04:03:23.983984	2013-06-10 04:03:23.983984
42952	58	31	10	2013-06-10 04:03:23.984707	2013-06-10 04:03:23.984707
42953	58	32	10	2013-06-10 04:03:23.985439	2013-06-10 04:03:23.985439
42954	58	33	10	2013-06-10 04:03:23.986204	2013-06-10 04:03:23.986204
42955	58	34	10	2013-06-10 04:03:23.986999	2013-06-10 04:03:23.986999
42956	58	35	10	2013-06-10 04:03:23.987689	2013-06-10 04:03:23.987689
42957	58	0	11	2013-06-10 04:03:23.988416	2013-06-10 04:03:23.988416
42958	58	1	11	2013-06-10 04:03:23.989224	2013-06-10 04:03:23.989224
42959	58	2	11	2013-06-10 04:03:23.990028	2013-06-10 04:03:23.990028
42960	58	3	11	2013-06-10 04:03:23.991222	2013-06-10 04:03:23.991222
42961	58	4	11	2013-06-10 04:03:23.992073	2013-06-10 04:03:23.992073
42962	58	5	11	2013-06-10 04:03:23.992967	2013-06-10 04:03:23.992967
42963	58	6	11	2013-06-10 04:03:23.993935	2013-06-10 04:03:23.993935
42964	58	7	11	2013-06-10 04:03:23.99483	2013-06-10 04:03:23.99483
42965	58	8	11	2013-06-10 04:03:23.99568	2013-06-10 04:03:23.99568
42966	58	9	11	2013-06-10 04:03:23.996513	2013-06-10 04:03:23.996513
42967	58	10	11	2013-06-10 04:03:23.997435	2013-06-10 04:03:23.997435
42968	58	22	11	2013-06-10 04:03:23.999408	2013-06-10 04:03:23.999408
42969	58	23	11	2013-06-10 04:03:24.000229	2013-06-10 04:03:24.000229
42970	58	24	11	2013-06-10 04:03:24.00101	2013-06-10 04:03:24.00101
42971	58	25	11	2013-06-10 04:03:24.001701	2013-06-10 04:03:24.001701
42972	58	26	11	2013-06-10 04:03:24.002437	2013-06-10 04:03:24.002437
42973	58	27	11	2013-06-10 04:03:24.003185	2013-06-10 04:03:24.003185
42974	58	28	11	2013-06-10 04:03:24.003971	2013-06-10 04:03:24.003971
42975	58	29	11	2013-06-10 04:03:24.004696	2013-06-10 04:03:24.004696
42976	58	30	11	2013-06-10 04:03:24.005391	2013-06-10 04:03:24.005391
42977	58	31	11	2013-06-10 04:03:24.006073	2013-06-10 04:03:24.006073
42978	58	32	11	2013-06-10 04:03:24.006867	2013-06-10 04:03:24.006867
42979	58	33	11	2013-06-10 04:03:24.007559	2013-06-10 04:03:24.007559
42980	58	34	11	2013-06-10 04:03:24.008253	2013-06-10 04:03:24.008253
42981	58	35	11	2013-06-10 04:03:24.00894	2013-06-10 04:03:24.00894
42982	58	0	12	2013-06-10 04:03:24.00967	2013-06-10 04:03:24.00967
42983	58	1	12	2013-06-10 04:03:24.010393	2013-06-10 04:03:24.010393
42984	58	2	12	2013-06-10 04:03:24.011271	2013-06-10 04:03:24.011271
42985	58	3	12	2013-06-10 04:03:24.012275	2013-06-10 04:03:24.012275
42986	58	4	12	2013-06-10 04:03:24.013374	2013-06-10 04:03:24.013374
42987	58	5	12	2013-06-10 04:03:24.014196	2013-06-10 04:03:24.014196
42988	58	6	12	2013-06-10 04:03:24.014993	2013-06-10 04:03:24.014993
42989	58	7	12	2013-06-10 04:03:24.016374	2013-06-10 04:03:24.016374
42990	58	8	12	2013-06-10 04:03:24.017273	2013-06-10 04:03:24.017273
42991	58	9	12	2013-06-10 04:03:24.018098	2013-06-10 04:03:24.018098
42992	58	10	12	2013-06-10 04:03:24.01894	2013-06-10 04:03:24.01894
42993	58	22	12	2013-06-10 04:03:24.019728	2013-06-10 04:03:24.019728
42994	58	23	12	2013-06-10 04:03:24.020487	2013-06-10 04:03:24.020487
42995	58	24	12	2013-06-10 04:03:24.021275	2013-06-10 04:03:24.021275
42996	58	25	12	2013-06-10 04:03:24.022043	2013-06-10 04:03:24.022043
42997	58	26	12	2013-06-10 04:03:24.022747	2013-06-10 04:03:24.022747
42998	58	27	12	2013-06-10 04:03:24.023609	2013-06-10 04:03:24.023609
42999	58	28	12	2013-06-10 04:03:24.02441	2013-06-10 04:03:24.02441
43000	58	29	12	2013-06-10 04:03:24.025188	2013-06-10 04:03:24.025188
43001	58	30	12	2013-06-10 04:03:24.025934	2013-06-10 04:03:24.025934
43002	58	31	12	2013-06-10 04:03:24.02668	2013-06-10 04:03:24.02668
43003	58	32	12	2013-06-10 04:03:24.027498	2013-06-10 04:03:24.027498
43004	58	33	12	2013-06-10 04:03:24.028285	2013-06-10 04:03:24.028285
43005	58	34	12	2013-06-10 04:03:24.02905	2013-06-10 04:03:24.02905
43006	58	35	12	2013-06-10 04:03:24.029805	2013-06-10 04:03:24.029805
43007	58	0	13	2013-06-10 04:03:24.030601	2013-06-10 04:03:24.030601
43008	58	1	13	2013-06-10 04:03:24.031901	2013-06-10 04:03:24.031901
43009	58	2	13	2013-06-10 04:03:24.032884	2013-06-10 04:03:24.032884
43010	58	3	13	2013-06-10 04:03:24.033705	2013-06-10 04:03:24.033705
43011	58	4	13	2013-06-10 04:03:24.034506	2013-06-10 04:03:24.034506
43012	58	5	13	2013-06-10 04:03:24.035281	2013-06-10 04:03:24.035281
43013	58	6	13	2013-06-10 04:03:24.036129	2013-06-10 04:03:24.036129
43014	58	7	13	2013-06-10 04:03:24.036892	2013-06-10 04:03:24.036892
43015	58	8	13	2013-06-10 04:03:24.037612	2013-06-10 04:03:24.037612
43016	58	9	13	2013-06-10 04:03:24.038413	2013-06-10 04:03:24.038413
43017	58	10	13	2013-06-10 04:03:24.039148	2013-06-10 04:03:24.039148
43018	58	22	13	2013-06-10 04:03:24.041256	2013-06-10 04:03:24.041256
43019	58	23	13	2013-06-10 04:03:24.042148	2013-06-10 04:03:24.042148
43020	58	24	13	2013-06-10 04:03:24.042924	2013-06-10 04:03:24.042924
43021	58	25	13	2013-06-10 04:03:24.043679	2013-06-10 04:03:24.043679
43022	58	26	13	2013-06-10 04:03:24.044876	2013-06-10 04:03:24.044876
43023	58	27	13	2013-06-10 04:03:24.045782	2013-06-10 04:03:24.045782
43024	58	28	13	2013-06-10 04:03:24.046605	2013-06-10 04:03:24.046605
43025	58	29	13	2013-06-10 04:03:24.047591	2013-06-10 04:03:24.047591
43026	58	30	13	2013-06-10 04:03:24.048594	2013-06-10 04:03:24.048594
43027	58	31	13	2013-06-10 04:03:24.049416	2013-06-10 04:03:24.049416
43028	58	32	13	2013-06-10 04:03:24.050397	2013-06-10 04:03:24.050397
43029	58	33	13	2013-06-10 04:03:24.051175	2013-06-10 04:03:24.051175
43030	58	34	13	2013-06-10 04:03:24.051924	2013-06-10 04:03:24.051924
43031	58	35	13	2013-06-10 04:03:24.052624	2013-06-10 04:03:24.052624
43032	58	0	14	2013-06-10 04:03:24.053413	2013-06-10 04:03:24.053413
43033	58	1	14	2013-06-10 04:03:24.054136	2013-06-10 04:03:24.054136
43034	58	2	14	2013-06-10 04:03:24.054849	2013-06-10 04:03:24.054849
43035	58	3	14	2013-06-10 04:03:24.055715	2013-06-10 04:03:24.055715
43036	58	4	14	2013-06-10 04:03:24.056592	2013-06-10 04:03:24.056592
43037	58	5	14	2013-06-10 04:03:24.0576	2013-06-10 04:03:24.0576
43038	58	6	14	2013-06-10 04:03:24.058375	2013-06-10 04:03:24.058375
43039	58	7	14	2013-06-10 04:03:24.059264	2013-06-10 04:03:24.059264
43040	58	8	14	2013-06-10 04:03:24.060179	2013-06-10 04:03:24.060179
43041	58	9	14	2013-06-10 04:03:24.061816	2013-06-10 04:03:24.061816
43042	58	10	14	2013-06-10 04:03:24.063241	2013-06-10 04:03:24.063241
43043	58	22	14	2013-06-10 04:03:24.064294	2013-06-10 04:03:24.064294
43044	58	23	14	2013-06-10 04:03:24.065293	2013-06-10 04:03:24.065293
43045	58	24	14	2013-06-10 04:03:24.066208	2013-06-10 04:03:24.066208
43046	58	25	14	2013-06-10 04:03:24.119353	2013-06-10 04:03:24.119353
43047	58	26	14	2013-06-10 04:03:24.120186	2013-06-10 04:03:24.120186
43048	58	27	14	2013-06-10 04:03:24.120904	2013-06-10 04:03:24.120904
43049	58	28	14	2013-06-10 04:03:24.121603	2013-06-10 04:03:24.121603
43050	58	29	14	2013-06-10 04:03:24.122311	2013-06-10 04:03:24.122311
43051	58	30	14	2013-06-10 04:03:24.123062	2013-06-10 04:03:24.123062
43052	58	31	14	2013-06-10 04:03:24.123863	2013-06-10 04:03:24.123863
43053	58	32	14	2013-06-10 04:03:24.12461	2013-06-10 04:03:24.12461
43054	58	33	14	2013-06-10 04:03:24.12544	2013-06-10 04:03:24.12544
43055	58	34	14	2013-06-10 04:03:24.12622	2013-06-10 04:03:24.12622
43056	58	35	14	2013-06-10 04:03:24.126936	2013-06-10 04:03:24.126936
43057	58	0	15	2013-06-10 04:03:24.127859	2013-06-10 04:03:24.127859
43058	58	1	15	2013-06-10 04:03:24.128938	2013-06-10 04:03:24.128938
43059	58	28	15	2013-06-10 04:03:24.130953	2013-06-10 04:03:24.130953
43060	58	29	15	2013-06-10 04:03:24.13184	2013-06-10 04:03:24.13184
43061	58	30	15	2013-06-10 04:03:24.132557	2013-06-10 04:03:24.132557
43062	58	31	15	2013-06-10 04:03:24.133346	2013-06-10 04:03:24.133346
43063	58	32	15	2013-06-10 04:03:24.134062	2013-06-10 04:03:24.134062
43064	58	33	15	2013-06-10 04:03:24.134795	2013-06-10 04:03:24.134795
43065	58	34	15	2013-06-10 04:03:24.135485	2013-06-10 04:03:24.135485
43066	58	35	15	2013-06-10 04:03:24.136178	2013-06-10 04:03:24.136178
43067	58	0	16	2013-06-10 04:03:24.136899	2013-06-10 04:03:24.136899
43068	58	1	16	2013-06-10 04:03:24.137619	2013-06-10 04:03:24.137619
43069	58	2	16	2013-06-10 04:03:24.13832	2013-06-10 04:03:24.13832
43070	58	3	16	2013-06-10 04:03:24.139007	2013-06-10 04:03:24.139007
43071	58	4	16	2013-06-10 04:03:24.139684	2013-06-10 04:03:24.139684
43072	58	5	16	2013-06-10 04:03:24.140467	2013-06-10 04:03:24.140467
43073	58	28	16	2013-06-10 04:03:24.142115	2013-06-10 04:03:24.142115
43074	58	29	16	2013-06-10 04:03:24.142819	2013-06-10 04:03:24.142819
43075	58	30	16	2013-06-10 04:03:24.143513	2013-06-10 04:03:24.143513
43076	58	31	16	2013-06-10 04:03:24.144227	2013-06-10 04:03:24.144227
43077	58	32	16	2013-06-10 04:03:24.145085	2013-06-10 04:03:24.145085
43078	58	33	16	2013-06-10 04:03:24.14606	2013-06-10 04:03:24.14606
43079	58	34	16	2013-06-10 04:03:24.146914	2013-06-10 04:03:24.146914
43080	58	35	16	2013-06-10 04:03:24.147676	2013-06-10 04:03:24.147676
43081	58	0	17	2013-06-10 04:03:24.148457	2013-06-10 04:03:24.148457
43082	58	1	17	2013-06-10 04:03:24.149453	2013-06-10 04:03:24.149453
43083	58	2	17	2013-06-10 04:03:24.150646	2013-06-10 04:03:24.150646
43084	58	3	17	2013-06-10 04:03:24.151416	2013-06-10 04:03:24.151416
43085	58	4	17	2013-06-10 04:03:24.152234	2013-06-10 04:03:24.152234
43086	58	5	17	2013-06-10 04:03:24.152984	2013-06-10 04:03:24.152984
43087	58	28	17	2013-06-10 04:03:24.153677	2013-06-10 04:03:24.153677
43088	58	29	17	2013-06-10 04:03:24.154406	2013-06-10 04:03:24.154406
43089	58	30	17	2013-06-10 04:03:24.155445	2013-06-10 04:03:24.155445
43090	58	31	17	2013-06-10 04:03:24.156226	2013-06-10 04:03:24.156226
43091	58	32	17	2013-06-10 04:03:24.156937	2013-06-10 04:03:24.156937
43092	58	33	17	2013-06-10 04:03:24.157642	2013-06-10 04:03:24.157642
43093	58	34	17	2013-06-10 04:03:24.158341	2013-06-10 04:03:24.158341
43094	58	35	17	2013-06-10 04:03:24.159031	2013-06-10 04:03:24.159031
43095	58	0	18	2013-06-10 04:03:24.159705	2013-06-10 04:03:24.159705
43096	58	1	18	2013-06-10 04:03:24.160457	2013-06-10 04:03:24.160457
43097	58	35	18	2013-06-10 04:03:24.162675	2013-06-10 04:03:24.162675
43098	58	0	19	2013-06-10 04:03:24.16425	2013-06-10 04:03:24.16425
43099	58	1	19	2013-06-10 04:03:24.165366	2013-06-10 04:03:24.165366
43100	58	35	19	2013-06-10 04:03:24.167989	2013-06-10 04:03:24.167989
43101	58	0	20	2013-06-10 04:03:24.168699	2013-06-10 04:03:24.168699
43102	58	1	20	2013-06-10 04:03:24.169453	2013-06-10 04:03:24.169453
43103	58	2	20	2013-06-10 04:03:24.170165	2013-06-10 04:03:24.170165
43104	58	3	20	2013-06-10 04:03:24.17085	2013-06-10 04:03:24.17085
43105	58	30	20	2013-06-10 04:03:24.172399	2013-06-10 04:03:24.172399
43106	58	31	20	2013-06-10 04:03:24.1731	2013-06-10 04:03:24.1731
43107	58	32	20	2013-06-10 04:03:24.173863	2013-06-10 04:03:24.173863
43108	58	33	20	2013-06-10 04:03:24.174528	2013-06-10 04:03:24.174528
43109	58	34	20	2013-06-10 04:03:24.175311	2013-06-10 04:03:24.175311
43110	58	35	20	2013-06-10 04:03:24.176021	2013-06-10 04:03:24.176021
43111	58	0	21	2013-06-10 04:03:24.176674	2013-06-10 04:03:24.176674
43112	58	1	21	2013-06-10 04:03:24.177375	2013-06-10 04:03:24.177375
43113	58	2	21	2013-06-10 04:03:24.17821	2013-06-10 04:03:24.17821
43114	58	3	21	2013-06-10 04:03:24.179224	2013-06-10 04:03:24.179224
43115	58	30	21	2013-06-10 04:03:24.191402	2013-06-10 04:03:24.191402
43116	58	31	21	2013-06-10 04:03:24.192231	2013-06-10 04:03:24.192231
43117	58	32	21	2013-06-10 04:03:24.193047	2013-06-10 04:03:24.193047
43118	58	33	21	2013-06-10 04:03:24.193826	2013-06-10 04:03:24.193826
43119	58	34	21	2013-06-10 04:03:24.194943	2013-06-10 04:03:24.194943
43120	58	35	21	2013-06-10 04:03:24.196151	2013-06-10 04:03:24.196151
43214	59	0	8	2013-06-10 04:18:58.886354	2013-06-10 04:18:58.886354
43215	59	1	8	2013-06-10 04:18:58.887451	2013-06-10 04:18:58.887451
43216	59	2	8	2013-06-10 04:18:58.88841	2013-06-10 04:18:58.88841
43217	59	3	8	2013-06-10 04:18:58.889282	2013-06-10 04:18:58.889282
43218	59	4	8	2013-06-10 04:18:58.890561	2013-06-10 04:18:58.890561
43219	59	5	8	2013-06-10 04:18:58.891476	2013-06-10 04:18:58.891476
43220	59	6	8	2013-06-10 04:18:58.892381	2013-06-10 04:18:58.892381
43221	59	7	8	2013-06-10 04:18:58.893184	2013-06-10 04:18:58.893184
43222	59	28	8	2013-06-10 04:18:58.893967	2013-06-10 04:18:58.893967
43223	59	29	8	2013-06-10 04:18:58.894815	2013-06-10 04:18:58.894815
43224	59	30	8	2013-06-10 04:18:58.895559	2013-06-10 04:18:58.895559
43225	59	31	8	2013-06-10 04:18:58.896308	2013-06-10 04:18:58.896308
43226	59	32	8	2013-06-10 04:18:58.897098	2013-06-10 04:18:58.897098
43227	59	33	8	2013-06-10 04:18:58.897827	2013-06-10 04:18:58.897827
43228	59	34	8	2013-06-10 04:18:58.898566	2013-06-10 04:18:58.898566
43229	59	35	8	2013-06-10 04:18:58.899275	2013-06-10 04:18:58.899275
43230	59	0	9	2013-06-10 04:18:58.899989	2013-06-10 04:18:58.899989
43231	59	1	9	2013-06-10 04:18:58.900697	2013-06-10 04:18:58.900697
43232	59	2	9	2013-06-10 04:18:58.901563	2013-06-10 04:18:58.901563
43233	59	3	9	2013-06-10 04:18:58.902406	2013-06-10 04:18:58.902406
43234	59	4	9	2013-06-10 04:18:58.903156	2013-06-10 04:18:58.903156
43235	59	5	9	2013-06-10 04:18:58.903867	2013-06-10 04:18:58.903867
43236	59	6	9	2013-06-10 04:18:58.904563	2013-06-10 04:18:58.904563
43237	59	7	9	2013-06-10 04:18:58.905355	2013-06-10 04:18:58.905355
43238	59	28	9	2013-06-10 04:18:58.909478	2013-06-10 04:18:58.909478
43239	59	29	9	2013-06-10 04:18:58.910617	2013-06-10 04:18:58.910617
43240	59	30	9	2013-06-10 04:18:58.911883	2013-06-10 04:18:58.911883
43241	59	31	9	2013-06-10 04:18:58.912959	2013-06-10 04:18:58.912959
43242	59	32	9	2013-06-10 04:18:58.913794	2013-06-10 04:18:58.913794
43243	59	33	9	2013-06-10 04:18:58.914685	2013-06-10 04:18:58.914685
43244	59	34	9	2013-06-10 04:18:58.915519	2013-06-10 04:18:58.915519
43245	59	35	9	2013-06-10 04:18:58.916396	2013-06-10 04:18:58.916396
43246	59	0	10	2013-06-10 04:18:58.917546	2013-06-10 04:18:58.917546
43247	59	1	10	2013-06-10 04:18:58.918329	2013-06-10 04:18:58.918329
43248	59	2	10	2013-06-10 04:18:58.919236	2013-06-10 04:18:58.919236
43249	59	3	10	2013-06-10 04:18:58.920442	2013-06-10 04:18:58.920442
43250	59	4	10	2013-06-10 04:18:58.921897	2013-06-10 04:18:58.921897
43251	59	5	10	2013-06-10 04:18:58.923262	2013-06-10 04:18:58.923262
43252	59	6	10	2013-06-10 04:18:58.924209	2013-06-10 04:18:58.924209
43253	59	7	10	2013-06-10 04:18:58.925088	2013-06-10 04:18:58.925088
43254	59	28	10	2013-06-10 04:18:58.927297	2013-06-10 04:18:58.927297
43255	59	29	10	2013-06-10 04:18:58.928234	2013-06-10 04:18:58.928234
43256	59	30	10	2013-06-10 04:18:58.929091	2013-06-10 04:18:58.929091
43257	59	31	10	2013-06-10 04:18:58.929901	2013-06-10 04:18:58.929901
43258	59	32	10	2013-06-10 04:18:58.930676	2013-06-10 04:18:58.930676
43259	59	33	10	2013-06-10 04:18:58.93143	2013-06-10 04:18:58.93143
43260	59	34	10	2013-06-10 04:18:58.932206	2013-06-10 04:18:58.932206
43261	59	35	10	2013-06-10 04:18:58.932928	2013-06-10 04:18:58.932928
44227	57	10	0	2013-06-16 04:43:30.369675	2013-06-16 04:43:30.369675
44228	57	11	0	2013-06-16 04:43:30.370356	2013-06-16 04:43:30.370356
44229	57	12	0	2013-06-16 04:43:30.371054	2013-06-16 04:43:30.371054
44230	57	20	0	2013-06-16 04:43:30.371857	2013-06-16 04:43:30.371857
44231	57	21	0	2013-06-16 04:43:30.372536	2013-06-16 04:43:30.372536
44232	57	34	0	2013-06-16 04:43:30.376672	2013-06-16 04:43:30.376672
44233	57	35	0	2013-06-16 04:43:30.377323	2013-06-16 04:43:30.377323
44234	57	10	1	2013-06-16 04:43:30.377975	2013-06-16 04:43:30.377975
44235	57	11	1	2013-06-16 04:43:30.378608	2013-06-16 04:43:30.378608
44236	57	12	1	2013-06-16 04:43:30.379235	2013-06-16 04:43:30.379235
44237	57	20	1	2013-06-16 04:43:30.382095	2013-06-16 04:43:30.382095
44238	57	21	1	2013-06-16 04:43:30.382761	2013-06-16 04:43:30.382761
44239	57	34	1	2013-06-16 04:43:30.38622	2013-06-16 04:43:30.38622
44240	57	35	1	2013-06-16 04:43:30.386897	2013-06-16 04:43:30.386897
44241	57	10	2	2013-06-16 04:43:30.387691	2013-06-16 04:43:30.387691
44242	57	11	2	2013-06-16 04:43:30.388561	2013-06-16 04:43:30.388561
44243	57	12	2	2013-06-16 04:43:30.389321	2013-06-16 04:43:30.389321
44244	57	20	2	2013-06-16 04:43:30.389975	2013-06-16 04:43:30.389975
44245	57	21	2	2013-06-16 04:43:30.390696	2013-06-16 04:43:30.390696
44246	57	34	2	2013-06-16 04:43:30.391428	2013-06-16 04:43:30.391428
44247	57	35	2	2013-06-16 04:43:30.392058	2013-06-16 04:43:30.392058
44248	57	34	6	2013-06-16 04:43:30.394416	2013-06-16 04:43:30.394416
44249	57	35	6	2013-06-16 04:43:30.395062	2013-06-16 04:43:30.395062
44250	57	34	7	2013-06-16 04:43:30.395739	2013-06-16 04:43:30.395739
44251	57	35	7	2013-06-16 04:43:30.396402	2013-06-16 04:43:30.396402
44252	57	34	8	2013-06-16 04:43:30.397078	2013-06-16 04:43:30.397078
44253	57	35	8	2013-06-16 04:43:30.397702	2013-06-16 04:43:30.397702
44254	57	0	9	2013-06-16 04:43:30.398327	2013-06-16 04:43:30.398327
44255	57	1	9	2013-06-16 04:43:30.398947	2013-06-16 04:43:30.398947
44256	57	0	10	2013-06-16 04:43:30.399625	2013-06-16 04:43:30.399625
44257	57	1	10	2013-06-16 04:43:30.400243	2013-06-16 04:43:30.400243
44258	57	0	11	2013-06-16 04:43:30.400953	2013-06-16 04:43:30.400953
44259	57	1	11	2013-06-16 04:43:30.401575	2013-06-16 04:43:30.401575
44260	57	34	17	2013-06-16 04:43:30.405157	2013-06-16 04:43:30.405157
44261	57	35	17	2013-06-16 04:43:30.405833	2013-06-16 04:43:30.405833
44262	57	34	18	2013-06-16 04:43:30.407931	2013-06-16 04:43:30.407931
44263	57	35	18	2013-06-16 04:43:30.408578	2013-06-16 04:43:30.408578
44264	57	34	19	2013-06-16 04:43:30.410688	2013-06-16 04:43:30.410688
44265	57	35	19	2013-06-16 04:43:30.411333	2013-06-16 04:43:30.411333
44266	57	16	20	2013-06-16 04:43:30.411981	2013-06-16 04:43:30.411981
44267	57	17	20	2013-06-16 04:43:30.412688	2013-06-16 04:43:30.412688
44268	57	18	20	2013-06-16 04:43:30.413376	2013-06-16 04:43:30.413376
44269	57	16	21	2013-06-16 04:43:30.414819	2013-06-16 04:43:30.414819
44270	57	17	21	2013-06-16 04:43:30.415461	2013-06-16 04:43:30.415461
44271	57	18	21	2013-06-16 04:43:30.416086	2013-06-16 04:43:30.416086
47496	62	0	7	2013-06-21 22:35:37.504242	2013-06-21 22:35:37.504242
47497	62	1	7	2013-06-21 22:35:37.505103	2013-06-21 22:35:37.505103
47498	62	34	7	2013-06-21 22:35:37.505928	2013-06-21 22:35:37.505928
47499	62	35	7	2013-06-21 22:35:37.506717	2013-06-21 22:35:37.506717
47500	62	0	8	2013-06-21 22:35:37.507485	2013-06-21 22:35:37.507485
47501	62	1	8	2013-06-21 22:35:37.508162	2013-06-21 22:35:37.508162
47502	62	34	8	2013-06-21 22:35:37.510688	2013-06-21 22:35:37.510688
47503	62	35	8	2013-06-21 22:35:37.511371	2013-06-21 22:35:37.511371
47504	62	8	11	2013-06-21 22:35:37.513637	2013-06-21 22:35:37.513637
47505	62	9	11	2013-06-21 22:35:37.514294	2013-06-21 22:35:37.514294
47506	62	10	11	2013-06-21 22:35:37.514937	2013-06-21 22:35:37.514937
47507	62	11	11	2013-06-21 22:35:37.515602	2013-06-21 22:35:37.515602
47508	62	22	11	2013-06-21 22:35:37.516304	2013-06-21 22:35:37.516304
47509	62	23	11	2013-06-21 22:35:37.516949	2013-06-21 22:35:37.516949
47510	62	24	11	2013-06-21 22:35:37.517618	2013-06-21 22:35:37.517618
47511	62	25	11	2013-06-21 22:35:37.518282	2013-06-21 22:35:37.518282
47512	62	8	12	2013-06-21 22:35:37.518954	2013-06-21 22:35:37.518954
47513	62	9	12	2013-06-21 22:35:37.5196	2013-06-21 22:35:37.5196
47514	62	10	12	2013-06-21 22:35:37.520243	2013-06-21 22:35:37.520243
47515	62	11	12	2013-06-21 22:35:37.520881	2013-06-21 22:35:37.520881
47516	62	22	12	2013-06-21 22:35:37.522567	2013-06-21 22:35:37.522567
47517	62	23	12	2013-06-21 22:35:37.523251	2013-06-21 22:35:37.523251
47518	62	24	12	2013-06-21 22:35:37.52399	2013-06-21 22:35:37.52399
47519	62	25	12	2013-06-21 22:35:37.524655	2013-06-21 22:35:37.524655
47520	62	8	13	2013-06-21 22:35:37.526197	2013-06-21 22:35:37.526197
47521	62	9	13	2013-06-21 22:35:37.526852	2013-06-21 22:35:37.526852
47522	62	10	13	2013-06-21 22:35:37.527493	2013-06-21 22:35:37.527493
47523	62	11	13	2013-06-21 22:35:37.528132	2013-06-21 22:35:37.528132
47524	62	22	13	2013-06-21 22:35:37.528803	2013-06-21 22:35:37.528803
47525	62	23	13	2013-06-21 22:35:37.529784	2013-06-21 22:35:37.529784
47526	62	24	13	2013-06-21 22:35:37.530595	2013-06-21 22:35:37.530595
47527	62	25	13	2013-06-21 22:35:37.531384	2013-06-21 22:35:37.531384
47528	62	8	14	2013-06-21 22:35:37.532295	2013-06-21 22:35:37.532295
47529	62	9	14	2013-06-21 22:35:37.533342	2013-06-21 22:35:37.533342
47530	62	10	14	2013-06-21 22:35:37.534182	2013-06-21 22:35:37.534182
47531	62	11	14	2013-06-21 22:35:37.534959	2013-06-21 22:35:37.534959
47532	62	12	14	2013-06-21 22:35:37.535721	2013-06-21 22:35:37.535721
47533	62	22	14	2013-06-21 22:35:37.536383	2013-06-21 22:35:37.536383
47534	62	23	14	2013-06-21 22:35:37.537024	2013-06-21 22:35:37.537024
47535	62	24	14	2013-06-21 22:35:37.537663	2013-06-21 22:35:37.537663
47536	62	25	14	2013-06-21 22:35:37.538336	2013-06-21 22:35:37.538336
47537	62	26	14	2013-06-21 22:35:37.539147	2013-06-21 22:35:37.539147
47538	62	8	15	2013-06-21 22:35:37.53995	2013-06-21 22:35:37.53995
47539	62	9	15	2013-06-21 22:35:37.540659	2013-06-21 22:35:37.540659
47540	62	10	15	2013-06-21 22:35:37.541462	2013-06-21 22:35:37.541462
47541	62	11	15	2013-06-21 22:35:37.542161	2013-06-21 22:35:37.542161
47542	62	22	15	2013-06-21 22:35:37.542854	2013-06-21 22:35:37.542854
47543	62	23	15	2013-06-21 22:35:37.543492	2013-06-21 22:35:37.543492
47544	62	24	15	2013-06-21 22:35:37.544131	2013-06-21 22:35:37.544131
47545	62	25	15	2013-06-21 22:35:37.544764	2013-06-21 22:35:37.544764
47546	62	8	16	2013-06-21 22:35:37.547926	2013-06-21 22:35:37.547926
47547	62	9	16	2013-06-21 22:35:37.548681	2013-06-21 22:35:37.548681
47548	62	10	16	2013-06-21 22:35:37.549385	2013-06-21 22:35:37.549385
47549	62	11	16	2013-06-21 22:35:37.550312	2013-06-21 22:35:37.550312
47550	62	22	16	2013-06-21 22:35:37.553315	2013-06-21 22:35:37.553315
47551	62	23	16	2013-06-21 22:35:37.553978	2013-06-21 22:35:37.553978
47552	62	24	16	2013-06-21 22:35:37.554616	2013-06-21 22:35:37.554616
47553	62	25	16	2013-06-21 22:35:37.555335	2013-06-21 22:35:37.555335
47554	62	8	17	2013-06-21 22:35:37.558381	2013-06-21 22:35:37.558381
47555	62	9	17	2013-06-21 22:35:37.559043	2013-06-21 22:35:37.559043
47556	62	10	17	2013-06-21 22:35:37.559683	2013-06-21 22:35:37.559683
47557	62	11	17	2013-06-21 22:35:37.560331	2013-06-21 22:35:37.560331
47558	62	22	17	2013-06-21 22:35:37.560979	2013-06-21 22:35:37.560979
47559	62	23	17	2013-06-21 22:35:37.561746	2013-06-21 22:35:37.561746
47560	62	24	17	2013-06-21 22:35:37.562598	2013-06-21 22:35:37.562598
47561	62	25	17	2013-06-21 22:35:37.563348	2013-06-21 22:35:37.563348
47562	62	8	18	2013-06-21 22:35:37.564099	2013-06-21 22:35:37.564099
47563	62	9	18	2013-06-21 22:35:37.564738	2013-06-21 22:35:37.564738
47564	62	10	18	2013-06-21 22:35:37.565373	2013-06-21 22:35:37.565373
47565	62	11	18	2013-06-21 22:35:37.566062	2013-06-21 22:35:37.566062
47566	62	22	18	2013-06-21 22:35:37.566868	2013-06-21 22:35:37.566868
47567	62	23	18	2013-06-21 22:35:37.568049	2013-06-21 22:35:37.568049
47568	62	24	18	2013-06-21 22:35:37.569041	2013-06-21 22:35:37.569041
47569	62	25	18	2013-06-21 22:35:37.569821	2013-06-21 22:35:37.569821
47570	62	8	19	2013-06-21 22:35:37.570589	2013-06-21 22:35:37.570589
47571	62	9	19	2013-06-21 22:35:37.57166	2013-06-21 22:35:37.57166
47572	62	10	19	2013-06-21 22:35:37.57312	2013-06-21 22:35:37.57312
47573	62	11	19	2013-06-21 22:35:37.574572	2013-06-21 22:35:37.574572
47574	62	22	19	2013-06-21 22:35:37.575823	2013-06-21 22:35:37.575823
47575	62	23	19	2013-06-21 22:35:37.577132	2013-06-21 22:35:37.577132
47576	62	24	19	2013-06-21 22:35:37.578613	2013-06-21 22:35:37.578613
47577	62	25	19	2013-06-21 22:35:37.580003	2013-06-21 22:35:37.580003
47578	62	8	20	2013-06-21 22:35:37.581023	2013-06-21 22:35:37.581023
47579	62	9	20	2013-06-21 22:35:37.581894	2013-06-21 22:35:37.581894
47580	62	10	20	2013-06-21 22:35:37.58292	2013-06-21 22:35:37.58292
47581	62	11	20	2013-06-21 22:35:37.583909	2013-06-21 22:35:37.583909
47582	62	22	20	2013-06-21 22:35:37.584886	2013-06-21 22:35:37.584886
47583	62	23	20	2013-06-21 22:35:37.58584	2013-06-21 22:35:37.58584
47584	62	24	20	2013-06-21 22:35:37.586992	2013-06-21 22:35:37.586992
47585	62	25	20	2013-06-21 22:35:37.588105	2013-06-21 22:35:37.588105
47586	62	8	21	2013-06-21 22:35:37.593254	2013-06-21 22:35:37.593254
47587	62	9	21	2013-06-21 22:35:37.594225	2013-06-21 22:35:37.594225
47588	62	10	21	2013-06-21 22:35:37.594989	2013-06-21 22:35:37.594989
47589	62	11	21	2013-06-21 22:35:37.595769	2013-06-21 22:35:37.595769
47590	62	22	21	2013-06-21 22:35:37.59808	2013-06-21 22:35:37.59808
47591	62	23	21	2013-06-21 22:35:37.598787	2013-06-21 22:35:37.598787
47592	62	24	21	2013-06-21 22:35:37.599532	2013-06-21 22:35:37.599532
47593	62	25	21	2013-06-21 22:35:37.600194	2013-06-21 22:35:37.600194
48377	50	7	0	2013-06-22 00:00:07.597712	2013-06-22 00:00:07.597712
48378	50	8	0	2013-06-22 00:00:07.598856	2013-06-22 00:00:07.598856
48379	50	9	0	2013-06-22 00:00:07.600195	2013-06-22 00:00:07.600195
48380	50	11	0	2013-06-22 00:00:07.601652	2013-06-22 00:00:07.601652
48381	50	12	0	2013-06-22 00:00:07.602814	2013-06-22 00:00:07.602814
48382	50	13	0	2013-06-22 00:00:07.604196	2013-06-22 00:00:07.604196
48383	50	15	0	2013-06-22 00:00:07.605393	2013-06-22 00:00:07.605393
48384	50	16	0	2013-06-22 00:00:07.606473	2013-06-22 00:00:07.606473
48385	50	18	0	2013-06-22 00:00:07.607761	2013-06-22 00:00:07.607761
48386	50	19	0	2013-06-22 00:00:07.60904	2013-06-22 00:00:07.60904
48387	50	20	0	2013-06-22 00:00:07.609872	2013-06-22 00:00:07.609872
48388	50	21	0	2013-06-22 00:00:07.610765	2013-06-22 00:00:07.610765
48389	50	22	0	2013-06-22 00:00:07.611602	2013-06-22 00:00:07.611602
48390	50	24	0	2013-06-22 00:00:07.612579	2013-06-22 00:00:07.612579
48391	50	26	0	2013-06-22 00:00:07.613626	2013-06-22 00:00:07.613626
48392	50	27	0	2013-06-22 00:00:07.614621	2013-06-22 00:00:07.614621
48393	50	28	0	2013-06-22 00:00:07.615571	2013-06-22 00:00:07.615571
48394	50	30	0	2013-06-22 00:00:07.616523	2013-06-22 00:00:07.616523
48395	50	31	0	2013-06-22 00:00:07.617499	2013-06-22 00:00:07.617499
48396	50	33	0	2013-06-22 00:00:07.618308	2013-06-22 00:00:07.618308
48397	50	34	0	2013-06-22 00:00:07.619358	2013-06-22 00:00:07.619358
48398	50	7	1	2013-06-22 00:00:07.620254	2013-06-22 00:00:07.620254
48399	50	8	1	2013-06-22 00:00:07.621677	2013-06-22 00:00:07.621677
48400	50	9	1	2013-06-22 00:00:07.623142	2013-06-22 00:00:07.623142
48401	50	11	1	2013-06-22 00:00:07.624342	2013-06-22 00:00:07.624342
48402	50	12	1	2013-06-22 00:00:07.625778	2013-06-22 00:00:07.625778
48403	50	13	1	2013-06-22 00:00:07.627051	2013-06-22 00:00:07.627051
48404	50	15	1	2013-06-22 00:00:07.628044	2013-06-22 00:00:07.628044
48405	50	16	1	2013-06-22 00:00:07.629193	2013-06-22 00:00:07.629193
48406	50	18	1	2013-06-22 00:00:07.629928	2013-06-22 00:00:07.629928
48407	50	19	1	2013-06-22 00:00:07.63102	2013-06-22 00:00:07.63102
48408	50	20	1	2013-06-22 00:00:07.631759	2013-06-22 00:00:07.631759
48409	50	21	1	2013-06-22 00:00:07.632502	2013-06-22 00:00:07.632502
48410	50	22	1	2013-06-22 00:00:07.633474	2013-06-22 00:00:07.633474
48411	50	24	1	2013-06-22 00:00:07.634947	2013-06-22 00:00:07.634947
48412	50	26	1	2013-06-22 00:00:07.636003	2013-06-22 00:00:07.636003
48413	50	27	1	2013-06-22 00:00:07.636896	2013-06-22 00:00:07.636896
48414	50	28	1	2013-06-22 00:00:07.638004	2013-06-22 00:00:07.638004
48415	50	30	1	2013-06-22 00:00:07.639112	2013-06-22 00:00:07.639112
48416	50	31	1	2013-06-22 00:00:07.64033	2013-06-22 00:00:07.64033
48417	50	33	1	2013-06-22 00:00:07.641514	2013-06-22 00:00:07.641514
48418	50	34	1	2013-06-22 00:00:07.642769	2013-06-22 00:00:07.642769
48419	50	7	2	2013-06-22 00:00:07.643687	2013-06-22 00:00:07.643687
48420	50	8	2	2013-06-22 00:00:07.644559	2013-06-22 00:00:07.644559
48421	50	9	2	2013-06-22 00:00:07.64597	2013-06-22 00:00:07.64597
48422	50	11	2	2013-06-22 00:00:07.646946	2013-06-22 00:00:07.646946
48423	50	12	2	2013-06-22 00:00:07.647737	2013-06-22 00:00:07.647737
48424	50	13	2	2013-06-22 00:00:07.64853	2013-06-22 00:00:07.64853
48425	50	15	2	2013-06-22 00:00:07.649397	2013-06-22 00:00:07.649397
48426	50	16	2	2013-06-22 00:00:07.650172	2013-06-22 00:00:07.650172
48427	50	18	2	2013-06-22 00:00:07.651244	2013-06-22 00:00:07.651244
48428	50	19	2	2013-06-22 00:00:07.652213	2013-06-22 00:00:07.652213
48429	50	20	2	2013-06-22 00:00:07.653335	2013-06-22 00:00:07.653335
48430	50	21	2	2013-06-22 00:00:07.654405	2013-06-22 00:00:07.654405
48431	50	22	2	2013-06-22 00:00:07.655406	2013-06-22 00:00:07.655406
48432	50	24	2	2013-06-22 00:00:07.656547	2013-06-22 00:00:07.656547
48433	50	26	2	2013-06-22 00:00:07.657504	2013-06-22 00:00:07.657504
48434	50	27	2	2013-06-22 00:00:07.658527	2013-06-22 00:00:07.658527
48435	50	28	2	2013-06-22 00:00:07.659392	2013-06-22 00:00:07.659392
48436	50	30	2	2013-06-22 00:00:07.661239	2013-06-22 00:00:07.661239
48437	50	31	2	2013-06-22 00:00:07.662523	2013-06-22 00:00:07.662523
48438	50	33	2	2013-06-22 00:00:07.66461	2013-06-22 00:00:07.66461
48439	50	34	2	2013-06-22 00:00:07.665921	2013-06-22 00:00:07.665921
48440	50	7	3	2013-06-22 00:00:07.66837	2013-06-22 00:00:07.66837
48441	50	8	3	2013-06-22 00:00:07.669247	2013-06-22 00:00:07.669247
48442	50	9	3	2013-06-22 00:00:07.670008	2013-06-22 00:00:07.670008
48443	50	11	3	2013-06-22 00:00:07.670737	2013-06-22 00:00:07.670737
48444	50	12	3	2013-06-22 00:00:07.671658	2013-06-22 00:00:07.671658
48445	50	13	3	2013-06-22 00:00:07.672618	2013-06-22 00:00:07.672618
48446	50	15	3	2013-06-22 00:00:07.673771	2013-06-22 00:00:07.673771
48447	50	16	3	2013-06-22 00:00:07.674895	2013-06-22 00:00:07.674895
48448	50	24	3	2013-06-22 00:00:07.676216	2013-06-22 00:00:07.676216
48449	50	26	3	2013-06-22 00:00:07.677026	2013-06-22 00:00:07.677026
48450	50	27	3	2013-06-22 00:00:07.677955	2013-06-22 00:00:07.677955
48451	50	28	3	2013-06-22 00:00:07.679399	2013-06-22 00:00:07.679399
48452	50	30	3	2013-06-22 00:00:07.680548	2013-06-22 00:00:07.680548
48453	50	31	3	2013-06-22 00:00:07.681585	2013-06-22 00:00:07.681585
48454	50	33	3	2013-06-22 00:00:07.682666	2013-06-22 00:00:07.682666
48455	50	34	3	2013-06-22 00:00:07.683937	2013-06-22 00:00:07.683937
48456	50	7	4	2013-06-22 00:00:07.684913	2013-06-22 00:00:07.684913
48457	50	8	4	2013-06-22 00:00:07.685675	2013-06-22 00:00:07.685675
48458	50	9	4	2013-06-22 00:00:07.686483	2013-06-22 00:00:07.686483
48459	50	11	4	2013-06-22 00:00:07.687225	2013-06-22 00:00:07.687225
48460	50	12	4	2013-06-22 00:00:07.687959	2013-06-22 00:00:07.687959
48461	50	13	4	2013-06-22 00:00:07.688823	2013-06-22 00:00:07.688823
48462	50	15	4	2013-06-22 00:00:07.689762	2013-06-22 00:00:07.689762
48463	50	16	4	2013-06-22 00:00:07.690794	2013-06-22 00:00:07.690794
48464	50	24	4	2013-06-22 00:00:07.691676	2013-06-22 00:00:07.691676
48465	50	26	4	2013-06-22 00:00:07.692646	2013-06-22 00:00:07.692646
48466	50	27	4	2013-06-22 00:00:07.69349	2013-06-22 00:00:07.69349
48467	50	28	4	2013-06-22 00:00:07.694256	2013-06-22 00:00:07.694256
48468	50	30	4	2013-06-22 00:00:07.696496	2013-06-22 00:00:07.696496
48469	50	31	4	2013-06-22 00:00:07.697789	2013-06-22 00:00:07.697789
48470	50	33	4	2013-06-22 00:00:07.698637	2013-06-22 00:00:07.698637
48471	50	34	4	2013-06-22 00:00:07.699472	2013-06-22 00:00:07.699472
48472	50	7	5	2013-06-22 00:00:07.700375	2013-06-22 00:00:07.700375
48473	50	8	5	2013-06-22 00:00:07.701691	2013-06-22 00:00:07.701691
48474	50	9	5	2013-06-22 00:00:07.702581	2013-06-22 00:00:07.702581
48475	50	11	5	2013-06-22 00:00:07.703399	2013-06-22 00:00:07.703399
48476	50	12	5	2013-06-22 00:00:07.704255	2013-06-22 00:00:07.704255
48477	50	13	5	2013-06-22 00:00:07.705072	2013-06-22 00:00:07.705072
48478	50	24	5	2013-06-22 00:00:07.707036	2013-06-22 00:00:07.707036
48479	50	26	5	2013-06-22 00:00:07.708244	2013-06-22 00:00:07.708244
48480	50	27	5	2013-06-22 00:00:07.709598	2013-06-22 00:00:07.709598
48481	50	28	5	2013-06-22 00:00:07.710455	2013-06-22 00:00:07.710455
48482	50	30	5	2013-06-22 00:00:07.711488	2013-06-22 00:00:07.711488
48483	50	31	5	2013-06-22 00:00:07.712862	2013-06-22 00:00:07.712862
48484	50	33	5	2013-06-22 00:00:07.713729	2013-06-22 00:00:07.713729
48485	50	34	5	2013-06-22 00:00:07.714587	2013-06-22 00:00:07.714587
48486	50	7	6	2013-06-22 00:00:07.715467	2013-06-22 00:00:07.715467
48487	50	8	6	2013-06-22 00:00:07.716323	2013-06-22 00:00:07.716323
48488	50	9	6	2013-06-22 00:00:07.717132	2013-06-22 00:00:07.717132
48489	50	11	6	2013-06-22 00:00:07.717872	2013-06-22 00:00:07.717872
48490	50	12	6	2013-06-22 00:00:07.718686	2013-06-22 00:00:07.718686
48491	50	13	6	2013-06-22 00:00:07.719405	2013-06-22 00:00:07.719405
48492	50	24	6	2013-06-22 00:00:07.721358	2013-06-22 00:00:07.721358
48493	50	26	6	2013-06-22 00:00:07.722301	2013-06-22 00:00:07.722301
48494	50	27	6	2013-06-22 00:00:07.723633	2013-06-22 00:00:07.723633
48495	50	28	6	2013-06-22 00:00:07.72484	2013-06-22 00:00:07.72484
48496	50	30	6	2013-06-22 00:00:07.725668	2013-06-22 00:00:07.725668
48497	50	31	6	2013-06-22 00:00:07.726425	2013-06-22 00:00:07.726425
48498	50	33	6	2013-06-22 00:00:07.727215	2013-06-22 00:00:07.727215
48499	50	34	6	2013-06-22 00:00:07.72817	2013-06-22 00:00:07.72817
48500	50	7	7	2013-06-22 00:00:07.729077	2013-06-22 00:00:07.729077
48501	50	8	7	2013-06-22 00:00:07.729936	2013-06-22 00:00:07.729936
48502	50	9	7	2013-06-22 00:00:07.730734	2013-06-22 00:00:07.730734
48503	50	11	7	2013-06-22 00:00:07.731563	2013-06-22 00:00:07.731563
48504	50	12	7	2013-06-22 00:00:07.732336	2013-06-22 00:00:07.732336
48505	50	13	7	2013-06-22 00:00:07.733308	2013-06-22 00:00:07.733308
48506	50	24	7	2013-06-22 00:00:07.735092	2013-06-22 00:00:07.735092
48507	50	26	7	2013-06-22 00:00:07.735885	2013-06-22 00:00:07.735885
48508	50	27	7	2013-06-22 00:00:07.736641	2013-06-22 00:00:07.736641
48509	50	28	7	2013-06-22 00:00:07.73744	2013-06-22 00:00:07.73744
48510	50	30	7	2013-06-22 00:00:07.738208	2013-06-22 00:00:07.738208
48511	50	31	7	2013-06-22 00:00:07.738905	2013-06-22 00:00:07.738905
48512	50	33	7	2013-06-22 00:00:07.740834	2013-06-22 00:00:07.740834
48513	50	34	7	2013-06-22 00:00:07.741832	2013-06-22 00:00:07.741832
48514	50	24	8	2013-06-22 00:00:07.743791	2013-06-22 00:00:07.743791
48515	50	26	8	2013-06-22 00:00:07.744594	2013-06-22 00:00:07.744594
48516	50	27	8	2013-06-22 00:00:07.745539	2013-06-22 00:00:07.745539
48517	50	28	8	2013-06-22 00:00:07.746418	2013-06-22 00:00:07.746418
48518	50	30	8	2013-06-22 00:00:07.747279	2013-06-22 00:00:07.747279
48519	50	31	8	2013-06-22 00:00:07.748125	2013-06-22 00:00:07.748125
48520	50	33	8	2013-06-22 00:00:07.749165	2013-06-22 00:00:07.749165
48521	50	34	8	2013-06-22 00:00:07.749954	2013-06-22 00:00:07.749954
48522	50	24	9	2013-06-22 00:00:07.750788	2013-06-22 00:00:07.750788
48523	50	30	9	2013-06-22 00:00:07.751615	2013-06-22 00:00:07.751615
48524	50	31	9	2013-06-22 00:00:07.752512	2013-06-22 00:00:07.752512
48525	50	33	9	2013-06-22 00:00:07.753746	2013-06-22 00:00:07.753746
48526	50	34	9	2013-06-22 00:00:07.75501	2013-06-22 00:00:07.75501
48527	50	24	10	2013-06-22 00:00:07.756644	2013-06-22 00:00:07.756644
48528	50	30	10	2013-06-22 00:00:07.758244	2013-06-22 00:00:07.758244
48529	50	31	10	2013-06-22 00:00:07.759503	2013-06-22 00:00:07.759503
48530	50	33	10	2013-06-22 00:00:07.760383	2013-06-22 00:00:07.760383
48531	50	34	10	2013-06-22 00:00:07.761165	2013-06-22 00:00:07.761165
48532	50	30	11	2013-06-22 00:00:07.763691	2013-06-22 00:00:07.763691
48533	50	31	11	2013-06-22 00:00:07.764558	2013-06-22 00:00:07.764558
48534	50	33	11	2013-06-22 00:00:07.765439	2013-06-22 00:00:07.765439
48535	50	34	11	2013-06-22 00:00:07.766219	2013-06-22 00:00:07.766219
48536	50	30	12	2013-06-22 00:00:07.768063	2013-06-22 00:00:07.768063
48537	50	31	12	2013-06-22 00:00:07.76886	2013-06-22 00:00:07.76886
48538	50	33	12	2013-06-22 00:00:07.769688	2013-06-22 00:00:07.769688
48539	50	34	12	2013-06-22 00:00:07.770806	2013-06-22 00:00:07.770806
48540	50	30	13	2013-06-22 00:00:07.77325	2013-06-22 00:00:07.77325
48541	50	31	13	2013-06-22 00:00:07.774144	2013-06-22 00:00:07.774144
48542	50	33	13	2013-06-22 00:00:07.7751	2013-06-22 00:00:07.7751
48543	50	34	13	2013-06-22 00:00:07.775916	2013-06-22 00:00:07.775916
48544	50	30	14	2013-06-22 00:00:07.77916	2013-06-22 00:00:07.77916
48545	50	31	14	2013-06-22 00:00:07.780521	2013-06-22 00:00:07.780521
48546	50	33	14	2013-06-22 00:00:07.781559	2013-06-22 00:00:07.781559
48547	50	34	14	2013-06-22 00:00:07.782483	2013-06-22 00:00:07.782483
48548	50	30	15	2013-06-22 00:00:07.783512	2013-06-22 00:00:07.783512
48549	50	31	15	2013-06-22 00:00:07.784569	2013-06-22 00:00:07.784569
48550	50	33	15	2013-06-22 00:00:07.785568	2013-06-22 00:00:07.785568
48551	50	34	15	2013-06-22 00:00:07.786361	2013-06-22 00:00:07.786361
49576	65	0	14	2013-06-22 19:03:55.811246	2013-06-22 19:03:55.811246
49577	65	1	14	2013-06-22 19:03:55.812039	2013-06-22 19:03:55.812039
49578	65	2	14	2013-06-22 19:03:55.81276	2013-06-22 19:03:55.81276
49579	65	3	14	2013-06-22 19:03:55.813444	2013-06-22 19:03:55.813444
49580	65	4	14	2013-06-22 19:03:55.814121	2013-06-22 19:03:55.814121
49581	65	5	14	2013-06-22 19:03:55.81481	2013-06-22 19:03:55.81481
49582	65	24	14	2013-06-22 19:03:55.815539	2013-06-22 19:03:55.815539
49583	65	25	14	2013-06-22 19:03:55.816208	2013-06-22 19:03:55.816208
49584	65	26	14	2013-06-22 19:03:55.817142	2013-06-22 19:03:55.817142
49585	65	27	14	2013-06-22 19:03:55.818402	2013-06-22 19:03:55.818402
49586	65	28	14	2013-06-22 19:03:55.81982	2013-06-22 19:03:55.81982
49587	65	29	14	2013-06-22 19:03:55.820793	2013-06-22 19:03:55.820793
49588	65	30	14	2013-06-22 19:03:55.821645	2013-06-22 19:03:55.821645
49589	65	31	14	2013-06-22 19:03:55.822707	2013-06-22 19:03:55.822707
49590	65	32	14	2013-06-22 19:03:55.823562	2013-06-22 19:03:55.823562
49591	65	33	14	2013-06-22 19:03:55.824331	2013-06-22 19:03:55.824331
49592	65	34	14	2013-06-22 19:03:55.825031	2013-06-22 19:03:55.825031
49593	65	0	15	2013-06-22 19:03:55.82574	2013-06-22 19:03:55.82574
49594	65	1	15	2013-06-22 19:03:55.826458	2013-06-22 19:03:55.826458
49595	65	2	15	2013-06-22 19:03:55.82716	2013-06-22 19:03:55.82716
49596	65	3	15	2013-06-22 19:03:55.827904	2013-06-22 19:03:55.827904
49597	65	4	15	2013-06-22 19:03:55.828825	2013-06-22 19:03:55.828825
49598	65	5	15	2013-06-22 19:03:55.830463	2013-06-22 19:03:55.830463
49599	65	24	15	2013-06-22 19:03:55.831822	2013-06-22 19:03:55.831822
49600	65	25	15	2013-06-22 19:03:55.832662	2013-06-22 19:03:55.832662
49601	65	26	15	2013-06-22 19:03:55.833378	2013-06-22 19:03:55.833378
49602	65	27	15	2013-06-22 19:03:55.834139	2013-06-22 19:03:55.834139
49603	65	28	15	2013-06-22 19:03:55.835051	2013-06-22 19:03:55.835051
49604	65	29	15	2013-06-22 19:03:55.835894	2013-06-22 19:03:55.835894
49605	65	30	15	2013-06-22 19:03:55.83682	2013-06-22 19:03:55.83682
49606	65	31	15	2013-06-22 19:03:55.837584	2013-06-22 19:03:55.837584
49607	65	32	15	2013-06-22 19:03:55.838777	2013-06-22 19:03:55.838777
49608	65	33	15	2013-06-22 19:03:55.839832	2013-06-22 19:03:55.839832
49609	65	34	15	2013-06-22 19:03:55.840668	2013-06-22 19:03:55.840668
49610	65	0	16	2013-06-22 19:03:55.841374	2013-06-22 19:03:55.841374
49611	65	1	16	2013-06-22 19:03:55.842626	2013-06-22 19:03:55.842626
49612	65	2	16	2013-06-22 19:03:55.843748	2013-06-22 19:03:55.843748
49613	65	3	16	2013-06-22 19:03:55.844609	2013-06-22 19:03:55.844609
49614	65	4	16	2013-06-22 19:03:55.845349	2013-06-22 19:03:55.845349
49615	65	5	16	2013-06-22 19:03:55.846068	2013-06-22 19:03:55.846068
49616	65	24	16	2013-06-22 19:03:55.847935	2013-06-22 19:03:55.847935
49617	65	25	16	2013-06-22 19:03:55.848702	2013-06-22 19:03:55.848702
49618	65	26	16	2013-06-22 19:03:55.849448	2013-06-22 19:03:55.849448
49619	65	27	16	2013-06-22 19:03:55.850183	2013-06-22 19:03:55.850183
49620	65	28	16	2013-06-22 19:03:55.851178	2013-06-22 19:03:55.851178
49621	65	29	16	2013-06-22 19:03:55.852078	2013-06-22 19:03:55.852078
49622	65	30	16	2013-06-22 19:03:55.853011	2013-06-22 19:03:55.853011
49623	65	31	16	2013-06-22 19:03:55.853837	2013-06-22 19:03:55.853837
49624	65	32	16	2013-06-22 19:03:55.85469	2013-06-22 19:03:55.85469
49625	65	33	16	2013-06-22 19:03:55.855741	2013-06-22 19:03:55.855741
49626	65	34	16	2013-06-22 19:03:55.856587	2013-06-22 19:03:55.856587
49627	65	0	17	2013-06-22 19:03:55.857334	2013-06-22 19:03:55.857334
49628	65	1	17	2013-06-22 19:03:55.858111	2013-06-22 19:03:55.858111
49629	65	2	17	2013-06-22 19:03:55.85902	2013-06-22 19:03:55.85902
49630	65	3	17	2013-06-22 19:03:55.85988	2013-06-22 19:03:55.85988
49631	65	4	17	2013-06-22 19:03:55.860673	2013-06-22 19:03:55.860673
49632	65	5	17	2013-06-22 19:03:55.861637	2013-06-22 19:03:55.861637
49633	65	24	17	2013-06-22 19:03:55.898362	2013-06-22 19:03:55.898362
49634	65	25	17	2013-06-22 19:03:55.899616	2013-06-22 19:03:55.899616
49635	65	26	17	2013-06-22 19:03:55.900476	2013-06-22 19:03:55.900476
49636	65	27	17	2013-06-22 19:03:55.901199	2013-06-22 19:03:55.901199
49637	65	28	17	2013-06-22 19:03:55.901904	2013-06-22 19:03:55.901904
49638	65	29	17	2013-06-22 19:03:55.902596	2013-06-22 19:03:55.902596
49639	65	30	17	2013-06-22 19:03:55.903295	2013-06-22 19:03:55.903295
49640	65	31	17	2013-06-22 19:03:55.904023	2013-06-22 19:03:55.904023
49641	65	32	17	2013-06-22 19:03:55.904796	2013-06-22 19:03:55.904796
49642	65	33	17	2013-06-22 19:03:55.905624	2013-06-22 19:03:55.905624
49643	65	34	17	2013-06-22 19:03:55.906783	2013-06-22 19:03:55.906783
49644	65	0	18	2013-06-22 19:03:55.907781	2013-06-22 19:03:55.907781
49645	65	1	18	2013-06-22 19:03:55.908827	2013-06-22 19:03:55.908827
49646	65	2	18	2013-06-22 19:03:55.909746	2013-06-22 19:03:55.909746
49647	65	3	18	2013-06-22 19:03:55.910507	2013-06-22 19:03:55.910507
49648	65	4	18	2013-06-22 19:03:55.911384	2013-06-22 19:03:55.911384
49649	65	5	18	2013-06-22 19:03:55.912099	2013-06-22 19:03:55.912099
49650	65	24	18	2013-06-22 19:03:55.91317	2013-06-22 19:03:55.91317
49651	65	25	18	2013-06-22 19:03:55.914566	2013-06-22 19:03:55.914566
49652	65	26	18	2013-06-22 19:03:55.915654	2013-06-22 19:03:55.915654
49653	65	27	18	2013-06-22 19:03:55.916404	2013-06-22 19:03:55.916404
49654	65	28	18	2013-06-22 19:03:55.917219	2013-06-22 19:03:55.917219
49655	65	29	18	2013-06-22 19:03:55.917957	2013-06-22 19:03:55.917957
49656	65	0	19	2013-06-22 19:03:55.919647	2013-06-22 19:03:55.919647
49657	65	1	19	2013-06-22 19:03:55.920423	2013-06-22 19:03:55.920423
49658	65	2	19	2013-06-22 19:03:55.921359	2013-06-22 19:03:55.921359
49659	65	3	19	2013-06-22 19:03:55.922355	2013-06-22 19:03:55.922355
49660	65	4	19	2013-06-22 19:03:55.92314	2013-06-22 19:03:55.92314
49661	65	5	19	2013-06-22 19:03:55.923851	2013-06-22 19:03:55.923851
49662	65	24	19	2013-06-22 19:03:55.924587	2013-06-22 19:03:55.924587
49663	65	25	19	2013-06-22 19:03:55.925445	2013-06-22 19:03:55.925445
49664	65	26	19	2013-06-22 19:03:55.926382	2013-06-22 19:03:55.926382
49665	65	27	19	2013-06-22 19:03:55.927522	2013-06-22 19:03:55.927522
49666	65	28	19	2013-06-22 19:03:55.928674	2013-06-22 19:03:55.928674
49667	65	29	19	2013-06-22 19:03:55.929395	2013-06-22 19:03:55.929395
49668	65	0	20	2013-06-22 19:03:55.932222	2013-06-22 19:03:55.932222
49669	65	1	20	2013-06-22 19:03:55.933054	2013-06-22 19:03:55.933054
49670	65	2	20	2013-06-22 19:03:55.933912	2013-06-22 19:03:55.933912
49671	65	3	20	2013-06-22 19:03:55.934689	2013-06-22 19:03:55.934689
49672	65	4	20	2013-06-22 19:03:55.93538	2013-06-22 19:03:55.93538
49673	65	5	20	2013-06-22 19:03:55.93607	2013-06-22 19:03:55.93607
49674	65	24	20	2013-06-22 19:03:55.936829	2013-06-22 19:03:55.936829
49675	65	25	20	2013-06-22 19:03:55.937581	2013-06-22 19:03:55.937581
49676	65	26	20	2013-06-22 19:03:55.938353	2013-06-22 19:03:55.938353
49677	65	27	20	2013-06-22 19:03:55.939122	2013-06-22 19:03:55.939122
49678	65	28	20	2013-06-22 19:03:55.939844	2013-06-22 19:03:55.939844
49679	65	29	20	2013-06-22 19:03:55.940581	2013-06-22 19:03:55.940581
49680	65	0	21	2013-06-22 19:03:55.942488	2013-06-22 19:03:55.942488
49681	65	1	21	2013-06-22 19:03:55.943876	2013-06-22 19:03:55.943876
49682	65	2	21	2013-06-22 19:03:55.944902	2013-06-22 19:03:55.944902
49683	65	3	21	2013-06-22 19:03:55.946027	2013-06-22 19:03:55.946027
49684	65	4	21	2013-06-22 19:03:55.947383	2013-06-22 19:03:55.947383
49685	65	5	21	2013-06-22 19:03:55.948694	2013-06-22 19:03:55.948694
49686	65	24	21	2013-06-22 19:03:55.95052	2013-06-22 19:03:55.95052
49687	65	25	21	2013-06-22 19:03:55.951323	2013-06-22 19:03:55.951323
49688	65	26	21	2013-06-22 19:03:55.952142	2013-06-22 19:03:55.952142
49689	65	27	21	2013-06-22 19:03:55.952888	2013-06-22 19:03:55.952888
49690	65	28	21	2013-06-22 19:03:55.953697	2013-06-22 19:03:55.953697
49691	65	29	21	2013-06-22 19:03:55.954555	2013-06-22 19:03:55.954555
50210	66	9	0	2013-06-22 19:17:12.094696	2013-06-22 19:17:12.094696
50211	66	10	0	2013-06-22 19:17:12.095703	2013-06-22 19:17:12.095703
50212	66	22	0	2013-06-22 19:17:12.097455	2013-06-22 19:17:12.097455
50213	66	23	0	2013-06-22 19:17:12.098152	2013-06-22 19:17:12.098152
50214	66	9	1	2013-06-22 19:17:12.099773	2013-06-22 19:17:12.099773
50215	66	10	1	2013-06-22 19:17:12.100522	2013-06-22 19:17:12.100522
50216	66	22	1	2013-06-22 19:17:12.101539	2013-06-22 19:17:12.101539
50217	66	23	1	2013-06-22 19:17:12.102654	2013-06-22 19:17:12.102654
50218	66	9	2	2013-06-22 19:17:12.103491	2013-06-22 19:17:12.103491
50219	66	10	2	2013-06-22 19:17:12.104256	2013-06-22 19:17:12.104256
50220	66	9	3	2013-06-22 19:17:12.105094	2013-06-22 19:17:12.105094
50221	66	10	3	2013-06-22 19:17:12.105861	2013-06-22 19:17:12.105861
50222	66	9	4	2013-06-22 19:17:12.108475	2013-06-22 19:17:12.108475
50223	66	10	4	2013-06-22 19:17:12.109179	2013-06-22 19:17:12.109179
50224	66	9	5	2013-06-22 19:17:12.111739	2013-06-22 19:17:12.111739
50225	66	10	5	2013-06-22 19:17:12.112925	2013-06-22 19:17:12.112925
50226	66	9	6	2013-06-22 19:17:12.113724	2013-06-22 19:17:12.113724
50227	66	10	6	2013-06-22 19:17:12.114594	2013-06-22 19:17:12.114594
50228	66	9	7	2013-06-22 19:17:12.120304	2013-06-22 19:17:12.120304
50229	66	10	7	2013-06-22 19:17:12.121054	2013-06-22 19:17:12.121054
50230	66	11	7	2013-06-22 19:17:12.121812	2013-06-22 19:17:12.121812
50231	66	12	7	2013-06-22 19:17:12.12257	2013-06-22 19:17:12.12257
50232	66	13	7	2013-06-22 19:17:12.123302	2013-06-22 19:17:12.123302
50233	66	14	7	2013-06-22 19:17:12.123982	2013-06-22 19:17:12.123982
50234	66	17	7	2013-06-22 19:17:12.124723	2013-06-22 19:17:12.124723
50235	66	18	7	2013-06-22 19:17:12.125803	2013-06-22 19:17:12.125803
50236	66	19	7	2013-06-22 19:17:12.127313	2013-06-22 19:17:12.127313
50237	66	20	7	2013-06-22 19:17:12.128532	2013-06-22 19:17:12.128532
50238	66	21	7	2013-06-22 19:17:12.129433	2013-06-22 19:17:12.129433
50239	66	22	7	2013-06-22 19:17:12.130678	2013-06-22 19:17:12.130678
50240	66	23	7	2013-06-22 19:17:12.131659	2013-06-22 19:17:12.131659
50241	66	24	7	2013-06-22 19:17:12.13245	2013-06-22 19:17:12.13245
50242	66	25	7	2013-06-22 19:17:12.133234	2013-06-22 19:17:12.133234
50243	66	26	7	2013-06-22 19:17:12.134122	2013-06-22 19:17:12.134122
50244	66	27	7	2013-06-22 19:17:12.134999	2013-06-22 19:17:12.134999
50245	66	30	7	2013-06-22 19:17:12.13851	2013-06-22 19:17:12.13851
50246	66	31	7	2013-06-22 19:17:12.139607	2013-06-22 19:17:12.139607
50247	66	32	7	2013-06-22 19:17:12.140525	2013-06-22 19:17:12.140525
50248	66	33	7	2013-06-22 19:17:12.141458	2013-06-22 19:17:12.141458
50249	66	34	7	2013-06-22 19:17:12.142772	2013-06-22 19:17:12.142772
50250	66	35	7	2013-06-22 19:17:12.144084	2013-06-22 19:17:12.144084
50251	66	9	8	2013-06-22 19:17:12.145381	2013-06-22 19:17:12.145381
50252	66	10	8	2013-06-22 19:17:12.146387	2013-06-22 19:17:12.146387
50253	66	11	8	2013-06-22 19:17:12.147187	2013-06-22 19:17:12.147187
50254	66	12	8	2013-06-22 19:17:12.147922	2013-06-22 19:17:12.147922
50255	66	13	8	2013-06-22 19:17:12.148762	2013-06-22 19:17:12.148762
50256	66	14	8	2013-06-22 19:17:12.149715	2013-06-22 19:17:12.149715
50257	66	17	8	2013-06-22 19:17:12.15263	2013-06-22 19:17:12.15263
50258	66	18	8	2013-06-22 19:17:12.153783	2013-06-22 19:17:12.153783
50259	66	19	8	2013-06-22 19:17:12.15489	2013-06-22 19:17:12.15489
50260	66	20	8	2013-06-22 19:17:12.155875	2013-06-22 19:17:12.155875
50261	66	21	8	2013-06-22 19:17:12.156795	2013-06-22 19:17:12.156795
50262	66	22	8	2013-06-22 19:17:12.157865	2013-06-22 19:17:12.157865
50263	66	23	8	2013-06-22 19:17:12.158951	2013-06-22 19:17:12.158951
50264	66	24	8	2013-06-22 19:17:12.160539	2013-06-22 19:17:12.160539
50265	66	25	8	2013-06-22 19:17:12.161639	2013-06-22 19:17:12.161639
50266	66	26	8	2013-06-22 19:17:12.162598	2013-06-22 19:17:12.162598
50267	66	27	8	2013-06-22 19:17:12.163512	2013-06-22 19:17:12.163512
50268	66	30	8	2013-06-22 19:17:12.165256	2013-06-22 19:17:12.165256
50269	66	31	8	2013-06-22 19:17:12.165972	2013-06-22 19:17:12.165972
50270	66	32	8	2013-06-22 19:17:12.166688	2013-06-22 19:17:12.166688
50271	66	33	8	2013-06-22 19:17:12.167464	2013-06-22 19:17:12.167464
50272	66	34	8	2013-06-22 19:17:12.168466	2013-06-22 19:17:12.168466
50273	66	35	8	2013-06-22 19:17:12.169352	2013-06-22 19:17:12.169352
50274	66	17	9	2013-06-22 19:17:12.171127	2013-06-22 19:17:12.171127
50275	66	18	9	2013-06-22 19:17:12.172139	2013-06-22 19:17:12.172139
50276	66	17	10	2013-06-22 19:17:12.17715	2013-06-22 19:17:12.17715
50277	66	18	10	2013-06-22 19:17:12.178606	2013-06-22 19:17:12.178606
50278	66	3	11	2013-06-22 19:17:12.180015	2013-06-22 19:17:12.180015
50279	66	4	11	2013-06-22 19:17:12.181015	2013-06-22 19:17:12.181015
50280	66	17	11	2013-06-22 19:17:12.181868	2013-06-22 19:17:12.181868
50281	66	18	11	2013-06-22 19:17:12.182828	2013-06-22 19:17:12.182828
50282	66	3	12	2013-06-22 19:17:12.185421	2013-06-22 19:17:12.185421
50283	66	4	12	2013-06-22 19:17:12.186444	2013-06-22 19:17:12.186444
50284	66	17	12	2013-06-22 19:17:12.189916	2013-06-22 19:17:12.189916
50285	66	18	12	2013-06-22 19:17:12.191157	2013-06-22 19:17:12.191157
50286	66	0	13	2013-06-22 19:17:12.194881	2013-06-22 19:17:12.194881
50287	66	1	13	2013-06-22 19:17:12.19612	2013-06-22 19:17:12.19612
50288	66	2	13	2013-06-22 19:17:12.196998	2013-06-22 19:17:12.196998
50289	66	3	13	2013-06-22 19:17:12.197809	2013-06-22 19:17:12.197809
50290	66	4	13	2013-06-22 19:17:12.198594	2013-06-22 19:17:12.198594
50291	66	5	13	2013-06-22 19:17:12.199376	2013-06-22 19:17:12.199376
50292	66	6	13	2013-06-22 19:17:12.200193	2013-06-22 19:17:12.200193
50293	66	7	13	2013-06-22 19:17:12.201116	2013-06-22 19:17:12.201116
50294	66	10	13	2013-06-22 19:17:12.203758	2013-06-22 19:17:12.203758
50295	66	11	13	2013-06-22 19:17:12.204927	2013-06-22 19:17:12.204927
50296	66	12	13	2013-06-22 19:17:12.205983	2013-06-22 19:17:12.205983
50297	66	13	13	2013-06-22 19:17:12.20678	2013-06-22 19:17:12.20678
50298	66	14	13	2013-06-22 19:17:12.207665	2013-06-22 19:17:12.207665
50299	66	15	13	2013-06-22 19:17:12.208665	2013-06-22 19:17:12.208665
50300	66	16	13	2013-06-22 19:17:12.209566	2013-06-22 19:17:12.209566
50301	66	17	13	2013-06-22 19:17:12.210531	2013-06-22 19:17:12.210531
50302	66	18	13	2013-06-22 19:17:12.211529	2013-06-22 19:17:12.211529
50303	66	0	14	2013-06-22 19:17:12.2126	2013-06-22 19:17:12.2126
50304	66	1	14	2013-06-22 19:17:12.213477	2013-06-22 19:17:12.213477
50305	66	2	14	2013-06-22 19:17:12.214275	2013-06-22 19:17:12.214275
50306	66	3	14	2013-06-22 19:17:12.215083	2013-06-22 19:17:12.215083
50307	66	4	14	2013-06-22 19:17:12.215938	2013-06-22 19:17:12.215938
50308	66	5	14	2013-06-22 19:17:12.2473	2013-06-22 19:17:12.2473
50309	66	6	14	2013-06-22 19:17:12.248216	2013-06-22 19:17:12.248216
50310	66	7	14	2013-06-22 19:17:12.248978	2013-06-22 19:17:12.248978
50311	66	10	14	2013-06-22 19:17:12.250757	2013-06-22 19:17:12.250757
50312	66	11	14	2013-06-22 19:17:12.251751	2013-06-22 19:17:12.251751
50313	66	12	14	2013-06-22 19:17:12.252513	2013-06-22 19:17:12.252513
50314	66	13	14	2013-06-22 19:17:12.253327	2013-06-22 19:17:12.253327
50315	66	14	14	2013-06-22 19:17:12.254066	2013-06-22 19:17:12.254066
50316	66	15	14	2013-06-22 19:17:12.255098	2013-06-22 19:17:12.255098
50317	66	16	14	2013-06-22 19:17:12.256298	2013-06-22 19:17:12.256298
50318	66	17	14	2013-06-22 19:17:12.257208	2013-06-22 19:17:12.257208
50319	66	18	14	2013-06-22 19:17:12.258027	2013-06-22 19:17:12.258027
50320	66	14	15	2013-06-22 19:17:12.261979	2013-06-22 19:17:12.261979
50321	66	15	15	2013-06-22 19:17:12.262867	2013-06-22 19:17:12.262867
50322	66	14	16	2013-06-22 19:17:12.263636	2013-06-22 19:17:12.263636
50323	66	15	16	2013-06-22 19:17:12.264388	2013-06-22 19:17:12.264388
50324	66	14	17	2013-06-22 19:17:12.266213	2013-06-22 19:17:12.266213
50325	66	15	17	2013-06-22 19:17:12.266892	2013-06-22 19:17:12.266892
50326	66	16	17	2013-06-22 19:17:12.267603	2013-06-22 19:17:12.267603
50327	66	17	17	2013-06-22 19:17:12.268527	2013-06-22 19:17:12.268527
50328	66	18	17	2013-06-22 19:17:12.269285	2013-06-22 19:17:12.269285
50329	66	19	17	2013-06-22 19:17:12.269972	2013-06-22 19:17:12.269972
50330	66	20	17	2013-06-22 19:17:12.270706	2013-06-22 19:17:12.270706
50331	66	21	17	2013-06-22 19:17:12.271466	2013-06-22 19:17:12.271466
50332	66	22	17	2013-06-22 19:17:12.272368	2013-06-22 19:17:12.272368
50333	66	23	17	2013-06-22 19:17:12.273571	2013-06-22 19:17:12.273571
50334	66	24	17	2013-06-22 19:17:12.274337	2013-06-22 19:17:12.274337
50335	66	25	17	2013-06-22 19:17:12.27511	2013-06-22 19:17:12.27511
50336	66	26	17	2013-06-22 19:17:12.276093	2013-06-22 19:17:12.276093
50337	66	27	17	2013-06-22 19:17:12.27728	2013-06-22 19:17:12.27728
50338	66	28	17	2013-06-22 19:17:12.278331	2013-06-22 19:17:12.278331
50339	66	29	17	2013-06-22 19:17:12.279192	2013-06-22 19:17:12.279192
50340	66	30	17	2013-06-22 19:17:12.279903	2013-06-22 19:17:12.279903
50341	66	31	17	2013-06-22 19:17:12.280677	2013-06-22 19:17:12.280677
50342	66	32	17	2013-06-22 19:17:12.281398	2013-06-22 19:17:12.281398
50343	66	33	17	2013-06-22 19:17:12.28223	2013-06-22 19:17:12.28223
50344	66	34	17	2013-06-22 19:17:12.282989	2013-06-22 19:17:12.282989
50345	66	35	17	2013-06-22 19:17:12.283656	2013-06-22 19:17:12.283656
50346	66	14	18	2013-06-22 19:17:12.286446	2013-06-22 19:17:12.286446
50347	66	15	18	2013-06-22 19:17:12.287283	2013-06-22 19:17:12.287283
50348	66	16	18	2013-06-22 19:17:12.288008	2013-06-22 19:17:12.288008
50349	66	17	18	2013-06-22 19:17:12.288915	2013-06-22 19:17:12.288915
50350	66	18	18	2013-06-22 19:17:12.290076	2013-06-22 19:17:12.290076
50351	66	19	18	2013-06-22 19:17:12.290818	2013-06-22 19:17:12.290818
50352	66	20	18	2013-06-22 19:17:12.291696	2013-06-22 19:17:12.291696
50353	66	21	18	2013-06-22 19:17:12.292592	2013-06-22 19:17:12.292592
50354	66	22	18	2013-06-22 19:17:12.29351	2013-06-22 19:17:12.29351
50355	66	23	18	2013-06-22 19:17:12.29461	2013-06-22 19:17:12.29461
50356	66	24	18	2013-06-22 19:17:12.29585	2013-06-22 19:17:12.29585
50357	66	25	18	2013-06-22 19:17:12.296637	2013-06-22 19:17:12.296637
50358	66	26	18	2013-06-22 19:17:12.297384	2013-06-22 19:17:12.297384
50359	66	27	18	2013-06-22 19:17:12.298134	2013-06-22 19:17:12.298134
50360	66	28	18	2013-06-22 19:17:12.298884	2013-06-22 19:17:12.298884
50361	66	29	18	2013-06-22 19:17:12.299625	2013-06-22 19:17:12.299625
50362	66	30	18	2013-06-22 19:17:12.300305	2013-06-22 19:17:12.300305
50363	66	31	18	2013-06-22 19:17:12.301235	2013-06-22 19:17:12.301235
50364	66	32	18	2013-06-22 19:17:12.302022	2013-06-22 19:17:12.302022
50365	66	33	18	2013-06-22 19:17:12.302711	2013-06-22 19:17:12.302711
50366	66	34	18	2013-06-22 19:17:12.303435	2013-06-22 19:17:12.303435
50367	66	35	18	2013-06-22 19:17:12.304299	2013-06-22 19:17:12.304299
52198	69	13	0	2013-06-22 20:31:03.573507	2013-06-22 20:31:03.573507
52199	69	14	0	2013-06-22 20:31:03.574538	2013-06-22 20:31:03.574538
52200	69	35	8	2013-06-22 20:31:03.584955	2013-06-22 20:31:03.584955
52201	69	0	9	2013-06-22 20:31:03.586214	2013-06-22 20:31:03.586214
52202	69	35	9	2013-06-22 20:31:03.588569	2013-06-22 20:31:03.588569
52203	69	0	10	2013-06-22 20:31:03.590213	2013-06-22 20:31:03.590213
52204	69	15	10	2013-06-22 20:31:03.592248	2013-06-22 20:31:03.592248
52205	69	16	10	2013-06-22 20:31:03.593892	2013-06-22 20:31:03.593892
52206	69	15	11	2013-06-22 20:31:03.600142	2013-06-22 20:31:03.600142
52207	69	16	11	2013-06-22 20:31:03.601988	2013-06-22 20:31:03.601988
52208	69	15	12	2013-06-22 20:31:03.603642	2013-06-22 20:31:03.603642
52209	69	16	12	2013-06-22 20:31:03.605194	2013-06-22 20:31:03.605194
52210	69	15	13	2013-06-22 20:31:03.608155	2013-06-22 20:31:03.608155
52211	69	16	13	2013-06-22 20:31:03.609348	2013-06-22 20:31:03.609348
52212	69	15	14	2013-06-22 20:31:03.612793	2013-06-22 20:31:03.612793
52213	69	16	14	2013-06-22 20:31:03.613616	2013-06-22 20:31:03.613616
52214	69	15	15	2013-06-22 20:31:03.61538	2013-06-22 20:31:03.61538
52215	69	16	15	2013-06-22 20:31:03.61619	2013-06-22 20:31:03.61619
52216	69	17	15	2013-06-22 20:31:03.616965	2013-06-22 20:31:03.616965
52217	69	15	16	2013-06-22 20:31:03.619262	2013-06-22 20:31:03.619262
52218	69	16	16	2013-06-22 20:31:03.620285	2013-06-22 20:31:03.620285
52219	69	17	16	2013-06-22 20:31:03.621234	2013-06-22 20:31:03.621234
52220	69	15	17	2013-06-22 20:31:03.624023	2013-06-22 20:31:03.624023
52221	69	16	17	2013-06-22 20:31:03.625217	2013-06-22 20:31:03.625217
52222	69	15	18	2013-06-22 20:31:03.626247	2013-06-22 20:31:03.626247
52223	69	16	18	2013-06-22 20:31:03.62722	2013-06-22 20:31:03.62722
52224	69	15	19	2013-06-22 20:31:03.630393	2013-06-22 20:31:03.630393
52225	69	16	19	2013-06-22 20:31:03.63204	2013-06-22 20:31:03.63204
52226	69	15	20	2013-06-22 20:31:03.6332	2013-06-22 20:31:03.6332
52227	69	16	20	2013-06-22 20:31:03.634278	2013-06-22 20:31:03.634278
52228	69	15	21	2013-06-22 20:31:03.638416	2013-06-22 20:31:03.638416
52229	69	16	21	2013-06-22 20:31:03.639265	2013-06-22 20:31:03.639265
52692	67	14	0	2013-06-22 20:33:53.519643	2013-06-22 20:33:53.519643
52693	67	15	0	2013-06-22 20:33:53.52079	2013-06-22 20:33:53.52079
52694	67	16	0	2013-06-22 20:33:53.521901	2013-06-22 20:33:53.521901
52695	67	17	0	2013-06-22 20:33:53.523138	2013-06-22 20:33:53.523138
52696	67	18	0	2013-06-22 20:33:53.524358	2013-06-22 20:33:53.524358
52697	67	19	0	2013-06-22 20:33:53.525351	2013-06-22 20:33:53.525351
52698	67	20	0	2013-06-22 20:33:53.526417	2013-06-22 20:33:53.526417
52699	67	21	0	2013-06-22 20:33:53.527638	2013-06-22 20:33:53.527638
52700	67	22	0	2013-06-22 20:33:53.529207	2013-06-22 20:33:53.529207
52701	67	14	1	2013-06-22 20:33:53.530309	2013-06-22 20:33:53.530309
52702	67	15	1	2013-06-22 20:33:53.531169	2013-06-22 20:33:53.531169
52703	67	16	1	2013-06-22 20:33:53.532059	2013-06-22 20:33:53.532059
52704	67	17	1	2013-06-22 20:33:53.533035	2013-06-22 20:33:53.533035
52705	67	18	1	2013-06-22 20:33:53.533982	2013-06-22 20:33:53.533982
52706	67	19	1	2013-06-22 20:33:53.534778	2013-06-22 20:33:53.534778
52707	67	20	1	2013-06-22 20:33:53.53577	2013-06-22 20:33:53.53577
52708	67	21	1	2013-06-22 20:33:53.536831	2013-06-22 20:33:53.536831
52709	67	22	1	2013-06-22 20:33:53.537896	2013-06-22 20:33:53.537896
52710	67	14	2	2013-06-22 20:33:53.53901	2013-06-22 20:33:53.53901
52711	67	15	2	2013-06-22 20:33:53.540348	2013-06-22 20:33:53.540348
52712	67	16	2	2013-06-22 20:33:53.541605	2013-06-22 20:33:53.541605
52713	67	17	2	2013-06-22 20:33:53.542589	2013-06-22 20:33:53.542589
52714	67	18	2	2013-06-22 20:33:53.543531	2013-06-22 20:33:53.543531
52715	67	19	2	2013-06-22 20:33:53.545073	2013-06-22 20:33:53.545073
52716	67	20	2	2013-06-22 20:33:53.546594	2013-06-22 20:33:53.546594
52717	67	21	2	2013-06-22 20:33:53.548234	2013-06-22 20:33:53.548234
52718	67	22	2	2013-06-22 20:33:53.549676	2013-06-22 20:33:53.549676
52719	67	14	3	2013-06-22 20:33:53.55072	2013-06-22 20:33:53.55072
52720	67	15	3	2013-06-22 20:33:53.551761	2013-06-22 20:33:53.551761
52721	67	16	3	2013-06-22 20:33:53.552741	2013-06-22 20:33:53.552741
52722	67	17	3	2013-06-22 20:33:53.553983	2013-06-22 20:33:53.553983
52723	67	18	3	2013-06-22 20:33:53.555585	2013-06-22 20:33:53.555585
52724	67	19	3	2013-06-22 20:33:53.556648	2013-06-22 20:33:53.556648
52725	67	20	3	2013-06-22 20:33:53.558015	2013-06-22 20:33:53.558015
52726	67	21	3	2013-06-22 20:33:53.559399	2013-06-22 20:33:53.559399
52727	67	22	3	2013-06-22 20:33:53.560734	2013-06-22 20:33:53.560734
52728	67	9	4	2013-06-22 20:33:53.56181	2013-06-22 20:33:53.56181
52729	67	10	4	2013-06-22 20:33:53.562753	2013-06-22 20:33:53.562753
52730	67	11	4	2013-06-22 20:33:53.563935	2013-06-22 20:33:53.563935
52731	67	12	4	2013-06-22 20:33:53.565028	2013-06-22 20:33:53.565028
52732	67	13	4	2013-06-22 20:33:53.565875	2013-06-22 20:33:53.565875
52733	67	14	4	2013-06-22 20:33:53.566652	2013-06-22 20:33:53.566652
52734	67	15	4	2013-06-22 20:33:53.567471	2013-06-22 20:33:53.567471
52735	67	16	4	2013-06-22 20:33:53.568242	2013-06-22 20:33:53.568242
52736	67	17	4	2013-06-22 20:33:53.568968	2013-06-22 20:33:53.568968
52737	67	18	4	2013-06-22 20:33:53.569735	2013-06-22 20:33:53.569735
52738	67	19	4	2013-06-22 20:33:53.570609	2013-06-22 20:33:53.570609
52739	67	20	4	2013-06-22 20:33:53.571603	2013-06-22 20:33:53.571603
52740	67	21	4	2013-06-22 20:33:53.572751	2013-06-22 20:33:53.572751
52741	67	22	4	2013-06-22 20:33:53.574343	2013-06-22 20:33:53.574343
52742	67	23	4	2013-06-22 20:33:53.57552	2013-06-22 20:33:53.57552
52743	67	24	4	2013-06-22 20:33:53.576597	2013-06-22 20:33:53.576597
52744	67	25	4	2013-06-22 20:33:53.577554	2013-06-22 20:33:53.577554
52745	67	26	4	2013-06-22 20:33:53.578866	2013-06-22 20:33:53.578866
52746	67	27	4	2013-06-22 20:33:53.579994	2013-06-22 20:33:53.579994
52747	67	9	5	2013-06-22 20:33:53.583087	2013-06-22 20:33:53.583087
52748	67	10	5	2013-06-22 20:33:53.585241	2013-06-22 20:33:53.585241
52749	67	11	5	2013-06-22 20:33:53.587007	2013-06-22 20:33:53.587007
52750	67	12	5	2013-06-22 20:33:53.588663	2013-06-22 20:33:53.588663
52751	67	13	5	2013-06-22 20:33:53.590078	2013-06-22 20:33:53.590078
52752	67	14	5	2013-06-22 20:33:53.591335	2013-06-22 20:33:53.591335
52753	67	15	5	2013-06-22 20:33:53.592358	2013-06-22 20:33:53.592358
52754	67	21	5	2013-06-22 20:33:53.593388	2013-06-22 20:33:53.593388
52755	67	22	5	2013-06-22 20:33:53.594307	2013-06-22 20:33:53.594307
52756	67	23	5	2013-06-22 20:33:53.595414	2013-06-22 20:33:53.595414
52757	67	24	5	2013-06-22 20:33:53.596734	2013-06-22 20:33:53.596734
52758	67	25	5	2013-06-22 20:33:53.597662	2013-06-22 20:33:53.597662
52759	67	26	5	2013-06-22 20:33:53.598986	2013-06-22 20:33:53.598986
52760	67	27	5	2013-06-22 20:33:53.599904	2013-06-22 20:33:53.599904
52761	67	9	6	2013-06-22 20:33:53.600783	2013-06-22 20:33:53.600783
52762	67	10	6	2013-06-22 20:33:53.601591	2013-06-22 20:33:53.601591
52763	67	11	6	2013-06-22 20:33:53.602534	2013-06-22 20:33:53.602534
52764	67	12	6	2013-06-22 20:33:53.603468	2013-06-22 20:33:53.603468
52765	67	24	6	2013-06-22 20:33:53.604373	2013-06-22 20:33:53.604373
52766	67	25	6	2013-06-22 20:33:53.605236	2013-06-22 20:33:53.605236
52767	67	26	6	2013-06-22 20:33:53.606283	2013-06-22 20:33:53.606283
52768	67	27	6	2013-06-22 20:33:53.607297	2013-06-22 20:33:53.607297
52769	67	9	7	2013-06-22 20:33:53.608423	2013-06-22 20:33:53.608423
52770	67	10	7	2013-06-22 20:33:53.609451	2013-06-22 20:33:53.609451
52771	67	11	7	2013-06-22 20:33:53.610399	2013-06-22 20:33:53.610399
52772	67	25	7	2013-06-22 20:33:53.611535	2013-06-22 20:33:53.611535
52773	67	26	7	2013-06-22 20:33:53.612472	2013-06-22 20:33:53.612472
52774	67	27	7	2013-06-22 20:33:53.613313	2013-06-22 20:33:53.613313
52775	67	9	8	2013-06-22 20:33:53.614252	2013-06-22 20:33:53.614252
52776	67	10	8	2013-06-22 20:33:53.615618	2013-06-22 20:33:53.615618
52777	67	11	8	2013-06-22 20:33:53.61698	2013-06-22 20:33:53.61698
52778	67	25	8	2013-06-22 20:33:53.625319	2013-06-22 20:33:53.625319
52779	67	26	8	2013-06-22 20:33:53.626899	2013-06-22 20:33:53.626899
52780	67	27	8	2013-06-22 20:33:53.628269	2013-06-22 20:33:53.628269
52781	67	9	9	2013-06-22 20:33:53.629389	2013-06-22 20:33:53.629389
52782	67	10	9	2013-06-22 20:33:53.63033	2013-06-22 20:33:53.63033
52783	67	26	9	2013-06-22 20:33:53.637354	2013-06-22 20:33:53.637354
52784	67	27	9	2013-06-22 20:33:53.638223	2013-06-22 20:33:53.638223
52785	67	9	10	2013-06-22 20:33:53.638966	2013-06-22 20:33:53.638966
52786	67	10	10	2013-06-22 20:33:53.639815	2013-06-22 20:33:53.639815
52787	67	26	10	2013-06-22 20:33:53.640678	2013-06-22 20:33:53.640678
52788	67	27	10	2013-06-22 20:33:53.641922	2013-06-22 20:33:53.641922
52789	67	8	11	2013-06-22 20:33:53.64329	2013-06-22 20:33:53.64329
52790	67	9	11	2013-06-22 20:33:53.644685	2013-06-22 20:33:53.644685
52791	67	10	11	2013-06-22 20:33:53.645813	2013-06-22 20:33:53.645813
52792	67	26	11	2013-06-22 20:33:53.6467	2013-06-22 20:33:53.6467
52793	67	27	11	2013-06-22 20:33:53.647611	2013-06-22 20:33:53.647611
52794	67	8	12	2013-06-22 20:33:53.648576	2013-06-22 20:33:53.648576
52795	67	9	12	2013-06-22 20:33:53.649485	2013-06-22 20:33:53.649485
52796	67	10	12	2013-06-22 20:33:53.650862	2013-06-22 20:33:53.650862
52797	67	11	12	2013-06-22 20:33:53.651978	2013-06-22 20:33:53.651978
52798	67	25	12	2013-06-22 20:33:53.653131	2013-06-22 20:33:53.653131
52799	67	26	12	2013-06-22 20:33:53.654278	2013-06-22 20:33:53.654278
52800	67	27	12	2013-06-22 20:33:53.65522	2013-06-22 20:33:53.65522
52801	67	28	12	2013-06-22 20:33:53.655913	2013-06-22 20:33:53.655913
52802	67	9	13	2013-06-22 20:33:53.656808	2013-06-22 20:33:53.656808
52803	67	10	13	2013-06-22 20:33:53.657644	2013-06-22 20:33:53.657644
52804	67	11	13	2013-06-22 20:33:53.65856	2013-06-22 20:33:53.65856
52805	67	25	13	2013-06-22 20:33:53.659519	2013-06-22 20:33:53.659519
52806	67	26	13	2013-06-22 20:33:53.66071	2013-06-22 20:33:53.66071
52807	67	27	13	2013-06-22 20:33:53.661986	2013-06-22 20:33:53.661986
52808	67	0	14	2013-06-22 20:33:53.663241	2013-06-22 20:33:53.663241
52809	67	9	14	2013-06-22 20:33:53.665313	2013-06-22 20:33:53.665313
52810	67	10	14	2013-06-22 20:33:53.666235	2013-06-22 20:33:53.666235
52811	67	11	14	2013-06-22 20:33:53.667024	2013-06-22 20:33:53.667024
52812	67	12	14	2013-06-22 20:33:53.667928	2013-06-22 20:33:53.667928
52813	67	24	14	2013-06-22 20:33:53.668947	2013-06-22 20:33:53.668947
52814	67	25	14	2013-06-22 20:33:53.670042	2013-06-22 20:33:53.670042
52815	67	26	14	2013-06-22 20:33:53.671232	2013-06-22 20:33:53.671232
52816	67	27	14	2013-06-22 20:33:53.672889	2013-06-22 20:33:53.672889
52817	67	0	15	2013-06-22 20:33:53.676596	2013-06-22 20:33:53.676596
52818	67	9	15	2013-06-22 20:33:53.678252	2013-06-22 20:33:53.678252
52819	67	10	15	2013-06-22 20:33:53.679454	2013-06-22 20:33:53.679454
52820	67	11	15	2013-06-22 20:33:53.680276	2013-06-22 20:33:53.680276
52821	67	12	15	2013-06-22 20:33:53.681206	2013-06-22 20:33:53.681206
52822	67	13	15	2013-06-22 20:33:53.682231	2013-06-22 20:33:53.682231
52823	67	23	15	2013-06-22 20:33:53.685042	2013-06-22 20:33:53.685042
52824	67	24	15	2013-06-22 20:33:53.6859	2013-06-22 20:33:53.6859
52825	67	25	15	2013-06-22 20:33:53.686838	2013-06-22 20:33:53.686838
52826	67	26	15	2013-06-22 20:33:53.687879	2013-06-22 20:33:53.687879
52827	67	27	15	2013-06-22 20:33:53.689425	2013-06-22 20:33:53.689425
52828	67	9	16	2013-06-22 20:33:53.691034	2013-06-22 20:33:53.691034
52829	67	10	16	2013-06-22 20:33:53.692737	2013-06-22 20:33:53.692737
52830	67	11	16	2013-06-22 20:33:53.694311	2013-06-22 20:33:53.694311
52831	67	12	16	2013-06-22 20:33:53.69613	2013-06-22 20:33:53.69613
52832	67	13	16	2013-06-22 20:33:53.697618	2013-06-22 20:33:53.697618
52833	67	14	16	2013-06-22 20:33:53.699206	2013-06-22 20:33:53.699206
52834	67	15	16	2013-06-22 20:33:53.700296	2013-06-22 20:33:53.700296
52835	67	16	16	2013-06-22 20:33:53.701261	2013-06-22 20:33:53.701261
52836	67	20	16	2013-06-22 20:33:53.704673	2013-06-22 20:33:53.704673
52837	67	21	16	2013-06-22 20:33:53.738676	2013-06-22 20:33:53.738676
52838	67	22	16	2013-06-22 20:33:53.740155	2013-06-22 20:33:53.740155
52839	67	23	16	2013-06-22 20:33:53.741648	2013-06-22 20:33:53.741648
52840	67	24	16	2013-06-22 20:33:53.743176	2013-06-22 20:33:53.743176
52841	67	25	16	2013-06-22 20:33:53.744739	2013-06-22 20:33:53.744739
52842	67	26	16	2013-06-22 20:33:53.745921	2013-06-22 20:33:53.745921
52843	67	27	16	2013-06-22 20:33:53.746798	2013-06-22 20:33:53.746798
52844	67	22	21	2013-06-22 20:33:53.757235	2013-06-22 20:33:53.757235
52845	67	23	21	2013-06-22 20:33:53.758018	2013-06-22 20:33:53.758018
53021	68	32	0	2013-06-22 21:26:40.081674	2013-06-22 21:26:40.081674
53022	68	33	0	2013-06-22 21:26:40.082669	2013-06-22 21:26:40.082669
53023	68	34	0	2013-06-22 21:26:40.083442	2013-06-22 21:26:40.083442
53024	68	35	0	2013-06-22 21:26:40.084165	2013-06-22 21:26:40.084165
53025	68	32	1	2013-06-22 21:26:40.085014	2013-06-22 21:26:40.085014
53026	68	33	1	2013-06-22 21:26:40.085741	2013-06-22 21:26:40.085741
53027	68	34	1	2013-06-22 21:26:40.08647	2013-06-22 21:26:40.08647
53028	68	35	1	2013-06-22 21:26:40.087318	2013-06-22 21:26:40.087318
53029	68	32	2	2013-06-22 21:26:40.088188	2013-06-22 21:26:40.088188
53030	68	33	2	2013-06-22 21:26:40.08908	2013-06-22 21:26:40.08908
53031	68	34	2	2013-06-22 21:26:40.089955	2013-06-22 21:26:40.089955
53032	68	35	2	2013-06-22 21:26:40.090722	2013-06-22 21:26:40.090722
53033	68	32	3	2013-06-22 21:26:40.094777	2013-06-22 21:26:40.094777
53034	68	33	3	2013-06-22 21:26:40.095803	2013-06-22 21:26:40.095803
53035	68	34	3	2013-06-22 21:26:40.096616	2013-06-22 21:26:40.096616
53036	68	35	3	2013-06-22 21:26:40.097476	2013-06-22 21:26:40.097476
53037	68	32	4	2013-06-22 21:26:40.098557	2013-06-22 21:26:40.098557
53038	68	33	4	2013-06-22 21:26:40.099443	2013-06-22 21:26:40.099443
53039	68	34	4	2013-06-22 21:26:40.100211	2013-06-22 21:26:40.100211
53040	68	35	4	2013-06-22 21:26:40.101121	2013-06-22 21:26:40.101121
53041	68	32	5	2013-06-22 21:26:40.102018	2013-06-22 21:26:40.102018
53042	68	33	5	2013-06-22 21:26:40.10281	2013-06-22 21:26:40.10281
53043	68	34	5	2013-06-22 21:26:40.103585	2013-06-22 21:26:40.103585
53044	68	35	5	2013-06-22 21:26:40.104358	2013-06-22 21:26:40.104358
53045	68	32	6	2013-06-22 21:26:40.107098	2013-06-22 21:26:40.107098
53046	68	33	6	2013-06-22 21:26:40.107888	2013-06-22 21:26:40.107888
53047	68	34	6	2013-06-22 21:26:40.108614	2013-06-22 21:26:40.108614
53048	68	35	6	2013-06-22 21:26:40.109557	2013-06-22 21:26:40.109557
53049	68	0	7	2013-06-22 21:26:40.11076	2013-06-22 21:26:40.11076
53050	68	1	7	2013-06-22 21:26:40.11177	2013-06-22 21:26:40.11177
53051	68	2	7	2013-06-22 21:26:40.112538	2013-06-22 21:26:40.112538
53052	68	3	7	2013-06-22 21:26:40.113419	2013-06-22 21:26:40.113419
53053	68	4	7	2013-06-22 21:26:40.114197	2013-06-22 21:26:40.114197
53054	68	5	7	2013-06-22 21:26:40.114982	2013-06-22 21:26:40.114982
53055	68	6	7	2013-06-22 21:26:40.115729	2013-06-22 21:26:40.115729
53056	68	7	7	2013-06-22 21:26:40.116589	2013-06-22 21:26:40.116589
53057	68	8	7	2013-06-22 21:26:40.117399	2013-06-22 21:26:40.117399
53058	68	9	7	2013-06-22 21:26:40.118151	2013-06-22 21:26:40.118151
53059	68	10	7	2013-06-22 21:26:40.118955	2013-06-22 21:26:40.118955
53060	68	11	7	2013-06-22 21:26:40.119764	2013-06-22 21:26:40.119764
53061	68	12	7	2013-06-22 21:26:40.120525	2013-06-22 21:26:40.120525
53062	68	13	7	2013-06-22 21:26:40.121237	2013-06-22 21:26:40.121237
53063	68	14	7	2013-06-22 21:26:40.122248	2013-06-22 21:26:40.122248
53064	68	15	7	2013-06-22 21:26:40.123176	2013-06-22 21:26:40.123176
53065	68	16	7	2013-06-22 21:26:40.124128	2013-06-22 21:26:40.124128
53066	68	17	7	2013-06-22 21:26:40.125104	2013-06-22 21:26:40.125104
53067	68	18	7	2013-06-22 21:26:40.125998	2013-06-22 21:26:40.125998
53068	68	19	7	2013-06-22 21:26:40.127059	2013-06-22 21:26:40.127059
53069	68	21	7	2013-06-22 21:26:40.128116	2013-06-22 21:26:40.128116
53070	68	22	7	2013-06-22 21:26:40.128956	2013-06-22 21:26:40.128956
53071	68	23	7	2013-06-22 21:26:40.129733	2013-06-22 21:26:40.129733
53072	68	24	7	2013-06-22 21:26:40.130882	2013-06-22 21:26:40.130882
53073	68	25	7	2013-06-22 21:26:40.132259	2013-06-22 21:26:40.132259
53074	68	26	7	2013-06-22 21:26:40.133264	2013-06-22 21:26:40.133264
53075	68	27	7	2013-06-22 21:26:40.134291	2013-06-22 21:26:40.134291
53076	68	28	7	2013-06-22 21:26:40.135327	2013-06-22 21:26:40.135327
53077	68	29	7	2013-06-22 21:26:40.136124	2013-06-22 21:26:40.136124
53078	68	30	7	2013-06-22 21:26:40.137257	2013-06-22 21:26:40.137257
53079	68	31	7	2013-06-22 21:26:40.138292	2013-06-22 21:26:40.138292
53080	68	32	7	2013-06-22 21:26:40.139284	2013-06-22 21:26:40.139284
53081	68	33	7	2013-06-22 21:26:40.140798	2013-06-22 21:26:40.140798
53082	68	34	7	2013-06-22 21:26:40.142584	2013-06-22 21:26:40.142584
53083	68	35	7	2013-06-22 21:26:40.144184	2013-06-22 21:26:40.144184
53084	68	0	8	2013-06-22 21:26:40.145332	2013-06-22 21:26:40.145332
53085	68	1	8	2013-06-22 21:26:40.146269	2013-06-22 21:26:40.146269
53086	68	2	8	2013-06-22 21:26:40.147634	2013-06-22 21:26:40.147634
53087	68	3	8	2013-06-22 21:26:40.14929	2013-06-22 21:26:40.14929
53088	68	4	8	2013-06-22 21:26:40.15031	2013-06-22 21:26:40.15031
53089	68	5	8	2013-06-22 21:26:40.151776	2013-06-22 21:26:40.151776
53090	68	6	8	2013-06-22 21:26:40.153298	2013-06-22 21:26:40.153298
53091	68	7	8	2013-06-22 21:26:40.154848	2013-06-22 21:26:40.154848
53092	68	8	8	2013-06-22 21:26:40.156476	2013-06-22 21:26:40.156476
53093	68	9	8	2013-06-22 21:26:40.158029	2013-06-22 21:26:40.158029
53094	68	10	8	2013-06-22 21:26:40.159529	2013-06-22 21:26:40.159529
53095	68	11	8	2013-06-22 21:26:40.160762	2013-06-22 21:26:40.160762
53096	68	12	8	2013-06-22 21:26:40.161831	2013-06-22 21:26:40.161831
53097	68	13	8	2013-06-22 21:26:40.163047	2013-06-22 21:26:40.163047
53098	68	14	8	2013-06-22 21:26:40.164122	2013-06-22 21:26:40.164122
53099	68	15	8	2013-06-22 21:26:40.16538	2013-06-22 21:26:40.16538
53100	68	16	8	2013-06-22 21:26:40.166649	2013-06-22 21:26:40.166649
53101	68	17	8	2013-06-22 21:26:40.167775	2013-06-22 21:26:40.167775
53102	68	18	8	2013-06-22 21:26:40.168853	2013-06-22 21:26:40.168853
53103	68	19	8	2013-06-22 21:26:40.169726	2013-06-22 21:26:40.169726
53104	68	23	8	2013-06-22 21:26:40.170535	2013-06-22 21:26:40.170535
53105	68	24	8	2013-06-22 21:26:40.171519	2013-06-22 21:26:40.171519
53106	68	25	8	2013-06-22 21:26:40.17235	2013-06-22 21:26:40.17235
53107	68	26	8	2013-06-22 21:26:40.173125	2013-06-22 21:26:40.173125
53108	68	27	8	2013-06-22 21:26:40.173984	2013-06-22 21:26:40.173984
53109	68	28	8	2013-06-22 21:26:40.174813	2013-06-22 21:26:40.174813
53110	68	29	8	2013-06-22 21:26:40.175629	2013-06-22 21:26:40.175629
53111	68	30	8	2013-06-22 21:26:40.176402	2013-06-22 21:26:40.176402
53112	68	31	8	2013-06-22 21:26:40.177222	2013-06-22 21:26:40.177222
53113	68	32	8	2013-06-22 21:26:40.177977	2013-06-22 21:26:40.177977
53114	68	33	8	2013-06-22 21:26:40.178704	2013-06-22 21:26:40.178704
53115	68	34	8	2013-06-22 21:26:40.179553	2013-06-22 21:26:40.179553
53116	68	35	8	2013-06-22 21:26:40.18095	2013-06-22 21:26:40.18095
53117	68	0	9	2013-06-22 21:26:40.182075	2013-06-22 21:26:40.182075
53118	68	1	9	2013-06-22 21:26:40.183209	2013-06-22 21:26:40.183209
53119	68	2	9	2013-06-22 21:26:40.184161	2013-06-22 21:26:40.184161
53120	68	3	9	2013-06-22 21:26:40.185126	2013-06-22 21:26:40.185126
53121	68	4	9	2013-06-22 21:26:40.186082	2013-06-22 21:26:40.186082
53122	68	5	9	2013-06-22 21:26:40.187012	2013-06-22 21:26:40.187012
53123	68	6	9	2013-06-22 21:26:40.187894	2013-06-22 21:26:40.187894
53124	68	7	9	2013-06-22 21:26:40.188819	2013-06-22 21:26:40.188819
53125	68	8	9	2013-06-22 21:26:40.189608	2013-06-22 21:26:40.189608
53126	68	9	9	2013-06-22 21:26:40.190369	2013-06-22 21:26:40.190369
53127	68	10	9	2013-06-22 21:26:40.191119	2013-06-22 21:26:40.191119
53128	68	11	9	2013-06-22 21:26:40.191941	2013-06-22 21:26:40.191941
53129	68	12	9	2013-06-22 21:26:40.192709	2013-06-22 21:26:40.192709
53130	68	13	9	2013-06-22 21:26:40.193442	2013-06-22 21:26:40.193442
53131	68	14	9	2013-06-22 21:26:40.194251	2013-06-22 21:26:40.194251
53132	68	15	9	2013-06-22 21:26:40.19501	2013-06-22 21:26:40.19501
53133	68	16	9	2013-06-22 21:26:40.195737	2013-06-22 21:26:40.195737
53134	68	17	9	2013-06-22 21:26:40.196551	2013-06-22 21:26:40.196551
53135	68	18	9	2013-06-22 21:26:40.197772	2013-06-22 21:26:40.197772
53136	68	19	9	2013-06-22 21:26:40.198583	2013-06-22 21:26:40.198583
53137	68	23	9	2013-06-22 21:26:40.200637	2013-06-22 21:26:40.200637
53138	68	24	9	2013-06-22 21:26:40.201528	2013-06-22 21:26:40.201528
53139	68	25	9	2013-06-22 21:26:40.202344	2013-06-22 21:26:40.202344
53140	68	26	9	2013-06-22 21:26:40.20327	2013-06-22 21:26:40.20327
53141	68	27	9	2013-06-22 21:26:40.20441	2013-06-22 21:26:40.20441
53142	68	28	9	2013-06-22 21:26:40.205574	2013-06-22 21:26:40.205574
53143	68	29	9	2013-06-22 21:26:40.206696	2013-06-22 21:26:40.206696
53144	68	30	9	2013-06-22 21:26:40.207667	2013-06-22 21:26:40.207667
53145	68	31	9	2013-06-22 21:26:40.208478	2013-06-22 21:26:40.208478
53146	68	32	9	2013-06-22 21:26:40.209403	2013-06-22 21:26:40.209403
53147	68	33	9	2013-06-22 21:26:40.2104	2013-06-22 21:26:40.2104
53148	68	34	9	2013-06-22 21:26:40.211604	2013-06-22 21:26:40.211604
53149	68	35	9	2013-06-22 21:26:40.212579	2013-06-22 21:26:40.212579
53150	68	18	10	2013-06-22 21:26:40.249979	2013-06-22 21:26:40.249979
53151	68	19	10	2013-06-22 21:26:40.250851	2013-06-22 21:26:40.250851
53152	68	18	11	2013-06-22 21:26:40.252597	2013-06-22 21:26:40.252597
53153	68	19	11	2013-06-22 21:26:40.253376	2013-06-22 21:26:40.253376
53154	68	18	20	2013-06-22 21:26:40.261722	2013-06-22 21:26:40.261722
53155	68	19	20	2013-06-22 21:26:40.262685	2013-06-22 21:26:40.262685
53156	68	20	20	2013-06-22 21:26:40.263597	2013-06-22 21:26:40.263597
53157	68	18	21	2013-06-22 21:26:40.266776	2013-06-22 21:26:40.266776
53158	68	19	21	2013-06-22 21:26:40.267699	2013-06-22 21:26:40.267699
53159	68	20	21	2013-06-22 21:26:40.268515	2013-06-22 21:26:40.268515
54475	70	3	0	2013-06-22 21:56:56.4343	2013-06-22 21:56:56.4343
54476	70	4	0	2013-06-22 21:56:56.43572	2013-06-22 21:56:56.43572
54477	70	5	0	2013-06-22 21:56:56.437044	2013-06-22 21:56:56.437044
54478	70	6	0	2013-06-22 21:56:56.438596	2013-06-22 21:56:56.438596
54479	70	9	0	2013-06-22 21:56:56.439771	2013-06-22 21:56:56.439771
54480	70	10	0	2013-06-22 21:56:56.440654	2013-06-22 21:56:56.440654
54481	70	11	0	2013-06-22 21:56:56.441582	2013-06-22 21:56:56.441582
54482	70	12	0	2013-06-22 21:56:56.442394	2013-06-22 21:56:56.442394
54483	70	13	0	2013-06-22 21:56:56.443287	2013-06-22 21:56:56.443287
54484	70	17	0	2013-06-22 21:56:56.444196	2013-06-22 21:56:56.444196
54485	70	21	0	2013-06-22 21:56:56.445128	2013-06-22 21:56:56.445128
54486	70	22	0	2013-06-22 21:56:56.445955	2013-06-22 21:56:56.445955
54487	70	23	0	2013-06-22 21:56:56.447355	2013-06-22 21:56:56.447355
54488	70	24	0	2013-06-22 21:56:56.448716	2013-06-22 21:56:56.448716
54489	70	25	0	2013-06-22 21:56:56.450595	2013-06-22 21:56:56.450595
54490	70	28	0	2013-06-22 21:56:56.452377	2013-06-22 21:56:56.452377
54491	70	29	0	2013-06-22 21:56:56.45393	2013-06-22 21:56:56.45393
54492	70	30	0	2013-06-22 21:56:56.454977	2013-06-22 21:56:56.454977
54493	70	31	0	2013-06-22 21:56:56.456002	2013-06-22 21:56:56.456002
54494	70	32	0	2013-06-22 21:56:56.457415	2013-06-22 21:56:56.457415
54495	70	0	3	2013-06-22 21:56:56.459971	2013-06-22 21:56:56.459971
54496	70	1	3	2013-06-22 21:56:56.46119	2013-06-22 21:56:56.46119
54497	70	2	3	2013-06-22 21:56:56.46225	2013-06-22 21:56:56.46225
54498	70	3	3	2013-06-22 21:56:56.463232	2013-06-22 21:56:56.463232
54499	70	4	3	2013-06-22 21:56:56.464271	2013-06-22 21:56:56.464271
54500	70	5	3	2013-06-22 21:56:56.465425	2013-06-22 21:56:56.465425
54501	70	6	3	2013-06-22 21:56:56.466793	2013-06-22 21:56:56.466793
54502	70	7	3	2013-06-22 21:56:56.468036	2013-06-22 21:56:56.468036
54503	70	8	3	2013-06-22 21:56:56.469275	2013-06-22 21:56:56.469275
54504	70	9	3	2013-06-22 21:56:56.470731	2013-06-22 21:56:56.470731
54505	70	13	3	2013-06-22 21:56:56.471879	2013-06-22 21:56:56.471879
54506	70	14	3	2013-06-22 21:56:56.472719	2013-06-22 21:56:56.472719
54507	70	15	3	2013-06-22 21:56:56.474884	2013-06-22 21:56:56.474884
54508	70	16	3	2013-06-22 21:56:56.47672	2013-06-22 21:56:56.47672
54509	70	17	3	2013-06-22 21:56:56.478399	2013-06-22 21:56:56.478399
54510	70	18	3	2013-06-22 21:56:56.479976	2013-06-22 21:56:56.479976
54511	70	19	3	2013-06-22 21:56:56.481185	2013-06-22 21:56:56.481185
54512	70	20	3	2013-06-22 21:56:56.482531	2013-06-22 21:56:56.482531
54513	70	21	3	2013-06-22 21:56:56.483713	2013-06-22 21:56:56.483713
54514	70	22	3	2013-06-22 21:56:56.484901	2013-06-22 21:56:56.484901
54515	70	23	3	2013-06-22 21:56:56.486217	2013-06-22 21:56:56.486217
54516	70	24	3	2013-06-22 21:56:56.487569	2013-06-22 21:56:56.487569
54517	70	25	3	2013-06-22 21:56:56.488928	2013-06-22 21:56:56.488928
54518	70	26	3	2013-06-22 21:56:56.49012	2013-06-22 21:56:56.49012
54519	70	27	3	2013-06-22 21:56:56.491244	2013-06-22 21:56:56.491244
54520	70	28	3	2013-06-22 21:56:56.492209	2013-06-22 21:56:56.492209
54521	70	29	3	2013-06-22 21:56:56.493088	2013-06-22 21:56:56.493088
54522	70	30	3	2013-06-22 21:56:56.494099	2013-06-22 21:56:56.494099
54523	70	31	3	2013-06-22 21:56:56.495006	2013-06-22 21:56:56.495006
54524	70	32	3	2013-06-22 21:56:56.495867	2013-06-22 21:56:56.495867
54525	70	9	4	2013-06-22 21:56:56.496812	2013-06-22 21:56:56.496812
54526	70	17	4	2013-06-22 21:56:56.497689	2013-06-22 21:56:56.497689
54527	70	25	4	2013-06-22 21:56:56.498643	2013-06-22 21:56:56.498643
54528	70	9	5	2013-06-22 21:56:56.4999	2013-06-22 21:56:56.4999
54529	70	17	5	2013-06-22 21:56:56.501288	2013-06-22 21:56:56.501288
54530	70	25	5	2013-06-22 21:56:56.502163	2013-06-22 21:56:56.502163
54531	70	9	6	2013-06-22 21:56:56.504208	2013-06-22 21:56:56.504208
54532	70	25	6	2013-06-22 21:56:56.505023	2013-06-22 21:56:56.505023
54533	70	0	7	2013-06-22 21:56:56.506148	2013-06-22 21:56:56.506148
54534	70	1	7	2013-06-22 21:56:56.50746	2013-06-22 21:56:56.50746
54535	70	2	7	2013-06-22 21:56:56.508503	2013-06-22 21:56:56.508503
54536	70	3	7	2013-06-22 21:56:56.509436	2013-06-22 21:56:56.509436
54537	70	4	7	2013-06-22 21:56:56.510285	2013-06-22 21:56:56.510285
54538	70	13	7	2013-06-22 21:56:56.511201	2013-06-22 21:56:56.511201
54539	70	14	7	2013-06-22 21:56:56.512155	2013-06-22 21:56:56.512155
54540	70	15	7	2013-06-22 21:56:56.51317	2013-06-22 21:56:56.51317
54541	70	16	7	2013-06-22 21:56:56.514227	2013-06-22 21:56:56.514227
54542	70	17	7	2013-06-22 21:56:56.515243	2013-06-22 21:56:56.515243
54543	70	18	7	2013-06-22 21:56:56.516397	2013-06-22 21:56:56.516397
54544	70	19	7	2013-06-22 21:56:56.517619	2013-06-22 21:56:56.517619
54545	70	20	7	2013-06-22 21:56:56.518738	2013-06-22 21:56:56.518738
54546	70	21	7	2013-06-22 21:56:56.519911	2013-06-22 21:56:56.519911
54547	70	22	7	2013-06-22 21:56:56.521228	2013-06-22 21:56:56.521228
54548	70	23	7	2013-06-22 21:56:56.52242	2013-06-22 21:56:56.52242
54549	70	24	7	2013-06-22 21:56:56.523736	2013-06-22 21:56:56.523736
54550	70	25	7	2013-06-22 21:56:56.525126	2013-06-22 21:56:56.525126
54551	70	26	7	2013-06-22 21:56:56.526371	2013-06-22 21:56:56.526371
54552	70	27	7	2013-06-22 21:56:56.527944	2013-06-22 21:56:56.527944
54553	70	28	7	2013-06-22 21:56:56.529133	2013-06-22 21:56:56.529133
54554	70	29	7	2013-06-22 21:56:56.530441	2013-06-22 21:56:56.530441
54555	70	30	7	2013-06-22 21:56:56.531572	2013-06-22 21:56:56.531572
54556	70	31	7	2013-06-22 21:56:56.53264	2013-06-22 21:56:56.53264
54557	70	32	7	2013-06-22 21:56:56.533639	2013-06-22 21:56:56.533639
54558	70	33	7	2013-06-22 21:56:56.534666	2013-06-22 21:56:56.534666
54559	70	34	7	2013-06-22 21:56:56.536147	2013-06-22 21:56:56.536147
54560	70	35	7	2013-06-22 21:56:56.537629	2013-06-22 21:56:56.537629
54561	70	4	8	2013-06-22 21:56:56.539239	2013-06-22 21:56:56.539239
54562	70	13	8	2013-06-22 21:56:56.540331	2013-06-22 21:56:56.540331
54563	70	20	8	2013-06-22 21:56:56.541289	2013-06-22 21:56:56.541289
54564	70	31	8	2013-06-22 21:56:56.542219	2013-06-22 21:56:56.542219
54565	70	0	9	2013-06-22 21:56:56.543716	2013-06-22 21:56:56.543716
54566	70	1	9	2013-06-22 21:56:56.545061	2013-06-22 21:56:56.545061
54567	70	2	9	2013-06-22 21:56:56.545946	2013-06-22 21:56:56.545946
54568	70	3	9	2013-06-22 21:56:56.546875	2013-06-22 21:56:56.546875
54569	70	4	9	2013-06-22 21:56:56.547889	2013-06-22 21:56:56.547889
54570	70	13	9	2013-06-22 21:56:56.549079	2013-06-22 21:56:56.549079
54571	70	14	9	2013-06-22 21:56:56.550167	2013-06-22 21:56:56.550167
54572	70	15	9	2013-06-22 21:56:56.550913	2013-06-22 21:56:56.550913
54573	70	16	9	2013-06-22 21:56:56.551789	2013-06-22 21:56:56.551789
54574	70	17	9	2013-06-22 21:56:56.552802	2013-06-22 21:56:56.552802
54575	70	18	9	2013-06-22 21:56:56.554091	2013-06-22 21:56:56.554091
54576	70	19	9	2013-06-22 21:56:56.555425	2013-06-22 21:56:56.555425
54577	70	20	9	2013-06-22 21:56:56.556992	2013-06-22 21:56:56.556992
54578	70	31	9	2013-06-22 21:56:56.558523	2013-06-22 21:56:56.558523
54579	70	32	9	2013-06-22 21:56:56.559951	2013-06-22 21:56:56.559951
54580	70	33	9	2013-06-22 21:56:56.561303	2013-06-22 21:56:56.561303
54581	70	34	9	2013-06-22 21:56:56.562723	2013-06-22 21:56:56.562723
54582	70	35	9	2013-06-22 21:56:56.564599	2013-06-22 21:56:56.564599
54583	70	9	10	2013-06-22 21:56:56.570792	2013-06-22 21:56:56.570792
54584	70	25	10	2013-06-22 21:56:56.576238	2013-06-22 21:56:56.576238
54585	70	0	11	2013-06-22 21:56:56.579322	2013-06-22 21:56:56.579322
54586	70	1	11	2013-06-22 21:56:56.580637	2013-06-22 21:56:56.580637
54587	70	2	11	2013-06-22 21:56:56.581981	2013-06-22 21:56:56.581981
54588	70	3	11	2013-06-22 21:56:56.582993	2013-06-22 21:56:56.582993
54589	70	4	11	2013-06-22 21:56:56.584074	2013-06-22 21:56:56.584074
54590	70	9	11	2013-06-22 21:56:56.585173	2013-06-22 21:56:56.585173
54591	70	25	11	2013-06-22 21:56:56.586379	2013-06-22 21:56:56.586379
54592	70	31	11	2013-06-22 21:56:56.587967	2013-06-22 21:56:56.587967
54593	70	32	11	2013-06-22 21:56:56.589096	2013-06-22 21:56:56.589096
54594	70	33	11	2013-06-22 21:56:56.590046	2013-06-22 21:56:56.590046
54595	70	34	11	2013-06-22 21:56:56.591017	2013-06-22 21:56:56.591017
54596	70	35	11	2013-06-22 21:56:56.591958	2013-06-22 21:56:56.591958
54597	70	4	12	2013-06-22 21:56:56.592952	2013-06-22 21:56:56.592952
54598	70	9	12	2013-06-22 21:56:56.594052	2013-06-22 21:56:56.594052
54599	70	10	12	2013-06-22 21:56:56.594974	2013-06-22 21:56:56.594974
54600	70	11	12	2013-06-22 21:56:56.595921	2013-06-22 21:56:56.595921
54601	70	12	12	2013-06-22 21:56:56.597311	2013-06-22 21:56:56.597311
54602	70	13	12	2013-06-22 21:56:56.598456	2013-06-22 21:56:56.598456
54603	70	14	12	2013-06-22 21:56:56.600039	2013-06-22 21:56:56.600039
54604	70	15	12	2013-06-22 21:56:56.601259	2013-06-22 21:56:56.601259
54605	70	16	12	2013-06-22 21:56:56.602504	2013-06-22 21:56:56.602504
54606	70	17	12	2013-06-22 21:56:56.604134	2013-06-22 21:56:56.604134
54607	70	18	12	2013-06-22 21:56:56.60577	2013-06-22 21:56:56.60577
54608	70	19	12	2013-06-22 21:56:56.606716	2013-06-22 21:56:56.606716
54609	70	20	12	2013-06-22 21:56:56.60763	2013-06-22 21:56:56.60763
54610	70	21	12	2013-06-22 21:56:56.608474	2013-06-22 21:56:56.608474
54611	70	22	12	2013-06-22 21:56:56.609348	2013-06-22 21:56:56.609348
54612	70	23	12	2013-06-22 21:56:56.61021	2013-06-22 21:56:56.61021
54613	70	24	12	2013-06-22 21:56:56.611168	2013-06-22 21:56:56.611168
54614	70	25	12	2013-06-22 21:56:56.612036	2013-06-22 21:56:56.612036
54615	70	31	12	2013-06-22 21:56:56.612909	2013-06-22 21:56:56.612909
54616	70	0	13	2013-06-22 21:56:56.614138	2013-06-22 21:56:56.614138
54617	70	1	13	2013-06-22 21:56:56.615117	2013-06-22 21:56:56.615117
54618	70	2	13	2013-06-22 21:56:56.616208	2013-06-22 21:56:56.616208
54619	70	3	13	2013-06-22 21:56:56.617494	2013-06-22 21:56:56.617494
54620	70	4	13	2013-06-22 21:56:56.618723	2013-06-22 21:56:56.618723
54621	70	9	13	2013-06-22 21:56:56.620214	2013-06-22 21:56:56.620214
54622	70	17	13	2013-06-22 21:56:56.621398	2013-06-22 21:56:56.621398
54623	70	31	13	2013-06-22 21:56:56.622334	2013-06-22 21:56:56.622334
54624	70	32	13	2013-06-22 21:56:56.623265	2013-06-22 21:56:56.623265
54625	70	33	13	2013-06-22 21:56:56.624539	2013-06-22 21:56:56.624539
54626	70	34	13	2013-06-22 21:56:56.625941	2013-06-22 21:56:56.625941
54627	70	35	13	2013-06-22 21:56:56.627221	2013-06-22 21:56:56.627221
54628	70	17	14	2013-06-22 21:56:56.62847	2013-06-22 21:56:56.62847
54629	70	0	15	2013-06-22 21:56:56.629539	2013-06-22 21:56:56.629539
54630	70	1	15	2013-06-22 21:56:56.630482	2013-06-22 21:56:56.630482
54631	70	2	15	2013-06-22 21:56:56.631586	2013-06-22 21:56:56.631586
54632	70	3	15	2013-06-22 21:56:56.632497	2013-06-22 21:56:56.632497
54633	70	4	15	2013-06-22 21:56:56.633555	2013-06-22 21:56:56.633555
54634	70	5	15	2013-06-22 21:56:56.634644	2013-06-22 21:56:56.634644
54635	70	6	15	2013-06-22 21:56:56.635861	2013-06-22 21:56:56.635861
54636	70	7	15	2013-06-22 21:56:56.637152	2013-06-22 21:56:56.637152
54637	70	8	15	2013-06-22 21:56:56.638248	2013-06-22 21:56:56.638248
54638	70	9	15	2013-06-22 21:56:56.639433	2013-06-22 21:56:56.639433
54639	70	10	15	2013-06-22 21:56:56.640757	2013-06-22 21:56:56.640757
54640	70	11	15	2013-06-22 21:56:56.641614	2013-06-22 21:56:56.641614
54641	70	12	15	2013-06-22 21:56:56.642409	2013-06-22 21:56:56.642409
54642	70	13	15	2013-06-22 21:56:56.643251	2013-06-22 21:56:56.643251
54643	70	14	15	2013-06-22 21:56:56.644134	2013-06-22 21:56:56.644134
54644	70	15	15	2013-06-22 21:56:56.644969	2013-06-22 21:56:56.644969
54645	70	16	15	2013-06-22 21:56:56.645995	2013-06-22 21:56:56.645995
54646	70	17	15	2013-06-22 21:56:56.646995	2013-06-22 21:56:56.646995
54647	70	21	15	2013-06-22 21:56:56.648005	2013-06-22 21:56:56.648005
54648	70	22	15	2013-06-22 21:56:56.649015	2013-06-22 21:56:56.649015
54649	70	23	15	2013-06-22 21:56:56.650025	2013-06-22 21:56:56.650025
54650	70	24	15	2013-06-22 21:56:56.650979	2013-06-22 21:56:56.650979
54651	70	25	15	2013-06-22 21:56:56.651979	2013-06-22 21:56:56.651979
54652	70	26	15	2013-06-22 21:56:56.653084	2013-06-22 21:56:56.653084
54653	70	27	15	2013-06-22 21:56:56.654406	2013-06-22 21:56:56.654406
54654	70	28	15	2013-06-22 21:56:56.655585	2013-06-22 21:56:56.655585
54655	70	29	15	2013-06-22 21:56:56.656858	2013-06-22 21:56:56.656858
54656	70	30	15	2013-06-22 21:56:56.658058	2013-06-22 21:56:56.658058
54657	70	31	15	2013-06-22 21:56:56.659328	2013-06-22 21:56:56.659328
54658	70	32	15	2013-06-22 21:56:56.661195	2013-06-22 21:56:56.661195
54659	70	33	15	2013-06-22 21:56:56.662947	2013-06-22 21:56:56.662947
54660	70	34	15	2013-06-22 21:56:56.664191	2013-06-22 21:56:56.664191
54661	70	35	15	2013-06-22 21:56:56.665405	2013-06-22 21:56:56.665405
54662	70	5	16	2013-06-22 21:56:56.666902	2013-06-22 21:56:56.666902
54663	70	30	16	2013-06-22 21:56:56.667988	2013-06-22 21:56:56.667988
54664	70	0	18	2013-06-22 21:56:56.669609	2013-06-22 21:56:56.669609
54665	70	1	18	2013-06-22 21:56:56.67093	2013-06-22 21:56:56.67093
54666	70	9	18	2013-06-22 21:56:56.67341	2013-06-22 21:56:56.67341
54667	70	26	18	2013-06-22 21:56:56.675468	2013-06-22 21:56:56.675468
54668	70	9	19	2013-06-22 21:56:56.679205	2013-06-22 21:56:56.679205
54669	70	13	19	2013-06-22 21:56:56.680416	2013-06-22 21:56:56.680416
54670	70	14	19	2013-06-22 21:56:56.681421	2013-06-22 21:56:56.681421
54671	70	15	19	2013-06-22 21:56:56.682226	2013-06-22 21:56:56.682226
54672	70	16	19	2013-06-22 21:56:56.683016	2013-06-22 21:56:56.683016
54673	70	17	19	2013-06-22 21:56:56.683809	2013-06-22 21:56:56.683809
54674	70	18	19	2013-06-22 21:56:56.68479	2013-06-22 21:56:56.68479
54675	70	19	19	2013-06-22 21:56:56.686006	2013-06-22 21:56:56.686006
54676	70	20	19	2013-06-22 21:56:56.687314	2013-06-22 21:56:56.687314
54677	70	21	19	2013-06-22 21:56:56.68864	2013-06-22 21:56:56.68864
54678	70	22	19	2013-06-22 21:56:56.689881	2013-06-22 21:56:56.689881
54679	70	26	19	2013-06-22 21:56:56.691073	2013-06-22 21:56:56.691073
54680	70	0	20	2013-06-22 21:56:56.692279	2013-06-22 21:56:56.692279
54681	70	1	20	2013-06-22 21:56:56.693487	2013-06-22 21:56:56.693487
54682	70	2	20	2013-06-22 21:56:56.694752	2013-06-22 21:56:56.694752
54683	70	3	20	2013-06-22 21:56:56.69571	2013-06-22 21:56:56.69571
54684	70	4	20	2013-06-22 21:56:56.696928	2013-06-22 21:56:56.696928
54685	70	5	20	2013-06-22 21:56:56.698222	2013-06-22 21:56:56.698222
54686	70	6	20	2013-06-22 21:56:56.699241	2013-06-22 21:56:56.699241
54687	70	7	20	2013-06-22 21:56:56.700564	2013-06-22 21:56:56.700564
54688	70	8	20	2013-06-22 21:56:56.701878	2013-06-22 21:56:56.701878
54689	70	9	20	2013-06-22 21:56:56.702806	2013-06-22 21:56:56.702806
54690	70	17	20	2013-06-22 21:56:56.703653	2013-06-22 21:56:56.703653
54691	70	26	20	2013-06-22 21:56:56.704506	2013-06-22 21:56:56.704506
54692	70	27	20	2013-06-22 21:56:56.705542	2013-06-22 21:56:56.705542
54693	70	28	20	2013-06-22 21:56:56.706587	2013-06-22 21:56:56.706587
54694	70	29	20	2013-06-22 21:56:56.707431	2013-06-22 21:56:56.707431
54695	70	30	20	2013-06-22 21:56:56.708201	2013-06-22 21:56:56.708201
54696	70	31	20	2013-06-22 21:56:56.70902	2013-06-22 21:56:56.70902
54697	70	32	20	2013-06-22 21:56:56.709764	2013-06-22 21:56:56.709764
54698	70	33	20	2013-06-22 21:56:56.710681	2013-06-22 21:56:56.710681
54699	70	34	20	2013-06-22 21:56:56.711542	2013-06-22 21:56:56.711542
54700	70	35	20	2013-06-22 21:56:56.712523	2013-06-22 21:56:56.712523
54701	70	17	21	2013-06-22 21:56:56.713564	2013-06-22 21:56:56.713564
54939	64	9	0	2013-06-22 22:48:11.551519	2013-06-22 22:48:11.551519
54940	64	10	0	2013-06-22 22:48:11.552498	2013-06-22 22:48:11.552498
54941	64	19	0	2013-06-22 22:48:11.554413	2013-06-22 22:48:11.554413
54942	64	20	0	2013-06-22 22:48:11.5552	2013-06-22 22:48:11.5552
54943	64	21	0	2013-06-22 22:48:11.55682	2013-06-22 22:48:11.55682
54944	64	22	0	2013-06-22 22:48:11.558547	2013-06-22 22:48:11.558547
54945	64	23	0	2013-06-22 22:48:11.560123	2013-06-22 22:48:11.560123
54946	64	24	0	2013-06-22 22:48:11.56117	2013-06-22 22:48:11.56117
54947	64	25	0	2013-06-22 22:48:11.562025	2013-06-22 22:48:11.562025
54948	64	26	0	2013-06-22 22:48:11.563364	2013-06-22 22:48:11.563364
54949	64	27	0	2013-06-22 22:48:11.564521	2013-06-22 22:48:11.564521
54950	64	28	0	2013-06-22 22:48:11.5657	2013-06-22 22:48:11.5657
54951	64	29	0	2013-06-22 22:48:11.566506	2013-06-22 22:48:11.566506
54952	64	30	0	2013-06-22 22:48:11.567626	2013-06-22 22:48:11.567626
54953	64	31	0	2013-06-22 22:48:11.568863	2013-06-22 22:48:11.568863
54954	64	32	0	2013-06-22 22:48:11.569828	2013-06-22 22:48:11.569828
54955	64	33	0	2013-06-22 22:48:11.571083	2013-06-22 22:48:11.571083
54956	64	34	0	2013-06-22 22:48:11.572273	2013-06-22 22:48:11.572273
54957	64	35	0	2013-06-22 22:48:11.574069	2013-06-22 22:48:11.574069
54958	64	9	1	2013-06-22 22:48:11.57523	2013-06-22 22:48:11.57523
54959	64	10	1	2013-06-22 22:48:11.576181	2013-06-22 22:48:11.576181
54960	64	19	1	2013-06-22 22:48:11.577333	2013-06-22 22:48:11.577333
54961	64	20	1	2013-06-22 22:48:11.578134	2013-06-22 22:48:11.578134
54962	64	21	1	2013-06-22 22:48:11.57904	2013-06-22 22:48:11.57904
54963	64	22	1	2013-06-22 22:48:11.580356	2013-06-22 22:48:11.580356
54964	64	23	1	2013-06-22 22:48:11.58135	2013-06-22 22:48:11.58135
54965	64	24	1	2013-06-22 22:48:11.582468	2013-06-22 22:48:11.582468
54966	64	25	1	2013-06-22 22:48:11.583599	2013-06-22 22:48:11.583599
54967	64	26	1	2013-06-22 22:48:11.585281	2013-06-22 22:48:11.585281
54968	64	27	1	2013-06-22 22:48:11.586404	2013-06-22 22:48:11.586404
54969	64	28	1	2013-06-22 22:48:11.58797	2013-06-22 22:48:11.58797
54970	64	29	1	2013-06-22 22:48:11.588967	2013-06-22 22:48:11.588967
54971	64	30	1	2013-06-22 22:48:11.590101	2013-06-22 22:48:11.590101
54972	64	31	1	2013-06-22 22:48:11.591063	2013-06-22 22:48:11.591063
54973	64	32	1	2013-06-22 22:48:11.592449	2013-06-22 22:48:11.592449
54974	64	33	1	2013-06-22 22:48:11.594067	2013-06-22 22:48:11.594067
54975	64	34	1	2013-06-22 22:48:11.595576	2013-06-22 22:48:11.595576
54976	64	35	1	2013-06-22 22:48:11.59686	2013-06-22 22:48:11.59686
54977	64	19	2	2013-06-22 22:48:11.5983	2013-06-22 22:48:11.5983
54978	64	20	2	2013-06-22 22:48:11.599808	2013-06-22 22:48:11.599808
54979	64	21	2	2013-06-22 22:48:11.600937	2013-06-22 22:48:11.600937
54980	64	22	2	2013-06-22 22:48:11.602628	2013-06-22 22:48:11.602628
54981	64	23	2	2013-06-22 22:48:11.603905	2013-06-22 22:48:11.603905
54982	64	24	2	2013-06-22 22:48:11.604818	2013-06-22 22:48:11.604818
54983	64	25	2	2013-06-22 22:48:11.605969	2013-06-22 22:48:11.605969
54984	64	26	2	2013-06-22 22:48:11.607153	2013-06-22 22:48:11.607153
54985	64	27	2	2013-06-22 22:48:11.608449	2013-06-22 22:48:11.608449
54986	64	28	2	2013-06-22 22:48:11.609902	2013-06-22 22:48:11.609902
54987	64	29	2	2013-06-22 22:48:11.611685	2013-06-22 22:48:11.611685
54988	64	30	2	2013-06-22 22:48:11.613238	2013-06-22 22:48:11.613238
54989	64	31	2	2013-06-22 22:48:11.615016	2013-06-22 22:48:11.615016
54990	64	32	2	2013-06-22 22:48:11.616592	2013-06-22 22:48:11.616592
54991	64	33	2	2013-06-22 22:48:11.618158	2013-06-22 22:48:11.618158
54992	64	34	2	2013-06-22 22:48:11.619789	2013-06-22 22:48:11.619789
54993	64	35	2	2013-06-22 22:48:11.621108	2013-06-22 22:48:11.621108
54994	64	19	3	2013-06-22 22:48:11.659291	2013-06-22 22:48:11.659291
54995	64	20	3	2013-06-22 22:48:11.661432	2013-06-22 22:48:11.661432
54996	64	21	3	2013-06-22 22:48:11.66261	2013-06-22 22:48:11.66261
54997	64	22	3	2013-06-22 22:48:11.663765	2013-06-22 22:48:11.663765
54998	64	23	3	2013-06-22 22:48:11.664556	2013-06-22 22:48:11.664556
54999	64	24	3	2013-06-22 22:48:11.665685	2013-06-22 22:48:11.665685
55000	64	25	3	2013-06-22 22:48:11.667351	2013-06-22 22:48:11.667351
55001	64	26	3	2013-06-22 22:48:11.66844	2013-06-22 22:48:11.66844
55002	64	27	3	2013-06-22 22:48:11.669277	2013-06-22 22:48:11.669277
55003	64	28	3	2013-06-22 22:48:11.670228	2013-06-22 22:48:11.670228
55004	64	29	3	2013-06-22 22:48:11.671088	2013-06-22 22:48:11.671088
55005	64	30	3	2013-06-22 22:48:11.672013	2013-06-22 22:48:11.672013
55006	64	31	3	2013-06-22 22:48:11.673454	2013-06-22 22:48:11.673454
55007	64	32	3	2013-06-22 22:48:11.675983	2013-06-22 22:48:11.675983
55008	64	33	3	2013-06-22 22:48:11.677849	2013-06-22 22:48:11.677849
55009	64	34	3	2013-06-22 22:48:11.679353	2013-06-22 22:48:11.679353
55010	64	35	3	2013-06-22 22:48:11.680825	2013-06-22 22:48:11.680825
55011	64	19	4	2013-06-22 22:48:11.681772	2013-06-22 22:48:11.681772
55012	64	20	4	2013-06-22 22:48:11.683215	2013-06-22 22:48:11.683215
55013	64	21	4	2013-06-22 22:48:11.684768	2013-06-22 22:48:11.684768
55014	64	22	4	2013-06-22 22:48:11.686073	2013-06-22 22:48:11.686073
55015	64	23	4	2013-06-22 22:48:11.687457	2013-06-22 22:48:11.687457
55016	64	24	4	2013-06-22 22:48:11.68852	2013-06-22 22:48:11.68852
55017	64	25	4	2013-06-22 22:48:11.689565	2013-06-22 22:48:11.689565
55018	64	26	4	2013-06-22 22:48:11.690755	2013-06-22 22:48:11.690755
55019	64	27	4	2013-06-22 22:48:11.692199	2013-06-22 22:48:11.692199
55020	64	28	4	2013-06-22 22:48:11.693691	2013-06-22 22:48:11.693691
55021	64	29	4	2013-06-22 22:48:11.695063	2013-06-22 22:48:11.695063
55022	64	30	4	2013-06-22 22:48:11.696484	2013-06-22 22:48:11.696484
55023	64	31	4	2013-06-22 22:48:11.698139	2013-06-22 22:48:11.698139
55024	64	32	4	2013-06-22 22:48:11.699452	2013-06-22 22:48:11.699452
55025	64	33	4	2013-06-22 22:48:11.700835	2013-06-22 22:48:11.700835
55026	64	34	4	2013-06-22 22:48:11.702169	2013-06-22 22:48:11.702169
55027	64	35	4	2013-06-22 22:48:11.703605	2013-06-22 22:48:11.703605
55028	64	19	5	2013-06-22 22:48:11.705345	2013-06-22 22:48:11.705345
55029	64	20	5	2013-06-22 22:48:11.706729	2013-06-22 22:48:11.706729
55030	64	21	5	2013-06-22 22:48:11.708253	2013-06-22 22:48:11.708253
55031	64	22	5	2013-06-22 22:48:11.709721	2013-06-22 22:48:11.709721
55032	64	23	5	2013-06-22 22:48:11.711393	2013-06-22 22:48:11.711393
55033	64	24	5	2013-06-22 22:48:11.712782	2013-06-22 22:48:11.712782
55034	64	25	5	2013-06-22 22:48:11.714441	2013-06-22 22:48:11.714441
55035	64	26	5	2013-06-22 22:48:11.715822	2013-06-22 22:48:11.715822
55036	64	27	5	2013-06-22 22:48:11.717081	2013-06-22 22:48:11.717081
55037	64	28	5	2013-06-22 22:48:11.718472	2013-06-22 22:48:11.718472
55038	64	29	5	2013-06-22 22:48:11.719643	2013-06-22 22:48:11.719643
55039	64	30	5	2013-06-22 22:48:11.720685	2013-06-22 22:48:11.720685
55040	64	31	5	2013-06-22 22:48:11.721874	2013-06-22 22:48:11.721874
55041	64	32	5	2013-06-22 22:48:11.723296	2013-06-22 22:48:11.723296
55042	64	33	5	2013-06-22 22:48:11.724682	2013-06-22 22:48:11.724682
55043	64	34	5	2013-06-22 22:48:11.725595	2013-06-22 22:48:11.725595
55044	64	35	5	2013-06-22 22:48:11.726956	2013-06-22 22:48:11.726956
55045	64	19	6	2013-06-22 22:48:11.728197	2013-06-22 22:48:11.728197
55046	64	20	6	2013-06-22 22:48:11.729385	2013-06-22 22:48:11.729385
55047	64	21	6	2013-06-22 22:48:11.730395	2013-06-22 22:48:11.730395
55048	64	22	6	2013-06-22 22:48:11.731409	2013-06-22 22:48:11.731409
55049	64	23	6	2013-06-22 22:48:11.732991	2013-06-22 22:48:11.732991
55050	64	24	6	2013-06-22 22:48:11.734696	2013-06-22 22:48:11.734696
55051	64	25	6	2013-06-22 22:48:11.73683	2013-06-22 22:48:11.73683
55052	64	26	6	2013-06-22 22:48:11.738558	2013-06-22 22:48:11.738558
55053	64	27	6	2013-06-22 22:48:11.740078	2013-06-22 22:48:11.740078
55054	64	28	6	2013-06-22 22:48:11.740991	2013-06-22 22:48:11.740991
55055	64	29	6	2013-06-22 22:48:11.742469	2013-06-22 22:48:11.742469
55056	64	30	6	2013-06-22 22:48:11.744214	2013-06-22 22:48:11.744214
55057	64	31	6	2013-06-22 22:48:11.745597	2013-06-22 22:48:11.745597
55058	64	32	6	2013-06-22 22:48:11.746865	2013-06-22 22:48:11.746865
55059	64	33	6	2013-06-22 22:48:11.748311	2013-06-22 22:48:11.748311
55060	64	34	6	2013-06-22 22:48:11.749248	2013-06-22 22:48:11.749248
55061	64	35	6	2013-06-22 22:48:11.7509	2013-06-22 22:48:11.7509
55062	64	19	7	2013-06-22 22:48:11.756421	2013-06-22 22:48:11.756421
55063	64	20	7	2013-06-22 22:48:11.758016	2013-06-22 22:48:11.758016
55064	64	21	7	2013-06-22 22:48:11.759039	2013-06-22 22:48:11.759039
55065	64	22	7	2013-06-22 22:48:11.760223	2013-06-22 22:48:11.760223
55066	64	23	7	2013-06-22 22:48:11.762024	2013-06-22 22:48:11.762024
55067	64	24	7	2013-06-22 22:48:11.763763	2013-06-22 22:48:11.763763
55068	64	25	7	2013-06-22 22:48:11.765012	2013-06-22 22:48:11.765012
55069	64	26	7	2013-06-22 22:48:11.766038	2013-06-22 22:48:11.766038
55070	64	27	7	2013-06-22 22:48:11.766979	2013-06-22 22:48:11.766979
55071	64	28	7	2013-06-22 22:48:11.768172	2013-06-22 22:48:11.768172
55072	64	29	7	2013-06-22 22:48:11.769173	2013-06-22 22:48:11.769173
55073	64	30	7	2013-06-22 22:48:11.770015	2013-06-22 22:48:11.770015
55074	64	31	7	2013-06-22 22:48:11.771352	2013-06-22 22:48:11.771352
55075	64	32	7	2013-06-22 22:48:11.772264	2013-06-22 22:48:11.772264
55076	64	33	7	2013-06-22 22:48:11.773809	2013-06-22 22:48:11.773809
55077	64	34	7	2013-06-22 22:48:11.775368	2013-06-22 22:48:11.775368
55078	64	35	7	2013-06-22 22:48:11.777409	2013-06-22 22:48:11.777409
55079	64	19	8	2013-06-22 22:48:11.779004	2013-06-22 22:48:11.779004
55080	64	20	8	2013-06-22 22:48:11.780423	2013-06-22 22:48:11.780423
55081	64	21	8	2013-06-22 22:48:11.781877	2013-06-22 22:48:11.781877
55082	64	22	8	2013-06-22 22:48:11.783096	2013-06-22 22:48:11.783096
55083	64	23	8	2013-06-22 22:48:11.784316	2013-06-22 22:48:11.784316
55084	64	24	8	2013-06-22 22:48:11.785735	2013-06-22 22:48:11.785735
55085	64	25	8	2013-06-22 22:48:11.787159	2013-06-22 22:48:11.787159
55086	64	26	8	2013-06-22 22:48:11.788599	2013-06-22 22:48:11.788599
55087	64	27	8	2013-06-22 22:48:11.790051	2013-06-22 22:48:11.790051
55088	64	28	8	2013-06-22 22:48:11.791284	2013-06-22 22:48:11.791284
55089	64	29	8	2013-06-22 22:48:11.792708	2013-06-22 22:48:11.792708
55090	64	30	8	2013-06-22 22:48:11.794123	2013-06-22 22:48:11.794123
55091	64	31	8	2013-06-22 22:48:11.795472	2013-06-22 22:48:11.795472
55092	64	32	8	2013-06-22 22:48:11.797223	2013-06-22 22:48:11.797223
55093	64	33	8	2013-06-22 22:48:11.798959	2013-06-22 22:48:11.798959
55094	64	34	8	2013-06-22 22:48:11.800418	2013-06-22 22:48:11.800418
55095	64	35	8	2013-06-22 22:48:11.801635	2013-06-22 22:48:11.801635
55096	64	19	9	2013-06-22 22:48:11.802873	2013-06-22 22:48:11.802873
55097	64	20	9	2013-06-22 22:48:11.804367	2013-06-22 22:48:11.804367
55098	64	21	9	2013-06-22 22:48:11.805555	2013-06-22 22:48:11.805555
55099	64	22	9	2013-06-22 22:48:11.806859	2013-06-22 22:48:11.806859
55100	64	23	9	2013-06-22 22:48:11.807826	2013-06-22 22:48:11.807826
55101	64	24	9	2013-06-22 22:48:11.809095	2013-06-22 22:48:11.809095
55102	64	25	9	2013-06-22 22:48:11.810543	2013-06-22 22:48:11.810543
55103	64	26	9	2013-06-22 22:48:11.811856	2013-06-22 22:48:11.811856
55104	64	27	9	2013-06-22 22:48:11.813177	2013-06-22 22:48:11.813177
55105	64	28	9	2013-06-22 22:48:11.814358	2013-06-22 22:48:11.814358
55106	64	29	9	2013-06-22 22:48:11.815461	2013-06-22 22:48:11.815461
55107	64	30	9	2013-06-22 22:48:11.816927	2013-06-22 22:48:11.816927
55108	64	31	9	2013-06-22 22:48:11.817939	2013-06-22 22:48:11.817939
55109	64	32	9	2013-06-22 22:48:11.819076	2013-06-22 22:48:11.819076
55110	64	33	9	2013-06-22 22:48:11.820692	2013-06-22 22:48:11.820692
55111	64	34	9	2013-06-22 22:48:11.822153	2013-06-22 22:48:11.822153
55112	64	35	9	2013-06-22 22:48:11.823684	2013-06-22 22:48:11.823684
55113	64	19	10	2013-06-22 22:48:11.825184	2013-06-22 22:48:11.825184
55114	64	20	10	2013-06-22 22:48:11.826842	2013-06-22 22:48:11.826842
55115	64	21	10	2013-06-22 22:48:11.828444	2013-06-22 22:48:11.828444
55116	64	22	10	2013-06-22 22:48:11.829784	2013-06-22 22:48:11.829784
55117	64	23	10	2013-06-22 22:48:11.83114	2013-06-22 22:48:11.83114
55118	64	24	10	2013-06-22 22:48:11.832559	2013-06-22 22:48:11.832559
55119	64	25	10	2013-06-22 22:48:11.833649	2013-06-22 22:48:11.833649
55120	64	26	10	2013-06-22 22:48:11.834792	2013-06-22 22:48:11.834792
55121	64	27	10	2013-06-22 22:48:11.83565	2013-06-22 22:48:11.83565
55122	64	28	10	2013-06-22 22:48:11.836618	2013-06-22 22:48:11.836618
55123	64	29	10	2013-06-22 22:48:11.838195	2013-06-22 22:48:11.838195
55124	64	30	10	2013-06-22 22:48:11.83924	2013-06-22 22:48:11.83924
55125	64	31	10	2013-06-22 22:48:11.840908	2013-06-22 22:48:11.840908
55126	64	32	10	2013-06-22 22:48:11.842607	2013-06-22 22:48:11.842607
55127	64	33	10	2013-06-22 22:48:11.84443	2013-06-22 22:48:11.84443
55128	64	34	10	2013-06-22 22:48:11.845778	2013-06-22 22:48:11.845778
55129	64	35	10	2013-06-22 22:48:11.847028	2013-06-22 22:48:11.847028
55130	64	19	11	2013-06-22 22:48:11.849984	2013-06-22 22:48:11.849984
55131	64	20	11	2013-06-22 22:48:11.851293	2013-06-22 22:48:11.851293
55132	64	21	11	2013-06-22 22:48:11.852899	2013-06-22 22:48:11.852899
55133	64	22	11	2013-06-22 22:48:11.854162	2013-06-22 22:48:11.854162
55134	64	23	11	2013-06-22 22:48:11.855479	2013-06-22 22:48:11.855479
55135	64	24	11	2013-06-22 22:48:11.857364	2013-06-22 22:48:11.857364
55136	64	25	11	2013-06-22 22:48:11.859277	2013-06-22 22:48:11.859277
55137	64	26	11	2013-06-22 22:48:11.860754	2013-06-22 22:48:11.860754
55138	64	27	11	2013-06-22 22:48:11.861628	2013-06-22 22:48:11.861628
55139	64	28	11	2013-06-22 22:48:11.862451	2013-06-22 22:48:11.862451
55140	64	29	11	2013-06-22 22:48:11.863556	2013-06-22 22:48:11.863556
55141	64	30	11	2013-06-22 22:48:11.865029	2013-06-22 22:48:11.865029
55142	64	31	11	2013-06-22 22:48:11.866507	2013-06-22 22:48:11.866507
55143	64	32	11	2013-06-22 22:48:11.867706	2013-06-22 22:48:11.867706
55144	64	33	11	2013-06-22 22:48:11.868575	2013-06-22 22:48:11.868575
55145	64	34	11	2013-06-22 22:48:11.86944	2013-06-22 22:48:11.86944
55146	64	35	11	2013-06-22 22:48:11.87024	2013-06-22 22:48:11.87024
55147	64	19	12	2013-06-22 22:48:11.871051	2013-06-22 22:48:11.871051
55148	64	20	12	2013-06-22 22:48:11.871914	2013-06-22 22:48:11.871914
55149	64	21	12	2013-06-22 22:48:11.872676	2013-06-22 22:48:11.872676
55150	64	22	12	2013-06-22 22:48:11.873402	2013-06-22 22:48:11.873402
55151	64	23	12	2013-06-22 22:48:11.874138	2013-06-22 22:48:11.874138
55152	64	24	12	2013-06-22 22:48:11.874926	2013-06-22 22:48:11.874926
55153	64	25	12	2013-06-22 22:48:11.875652	2013-06-22 22:48:11.875652
55154	64	26	12	2013-06-22 22:48:11.876624	2013-06-22 22:48:11.876624
55155	64	27	12	2013-06-22 22:48:11.878426	2013-06-22 22:48:11.878426
55156	64	28	12	2013-06-22 22:48:11.879641	2013-06-22 22:48:11.879641
55157	64	29	12	2013-06-22 22:48:11.880642	2013-06-22 22:48:11.880642
55158	64	30	12	2013-06-22 22:48:11.882162	2013-06-22 22:48:11.882162
55159	64	31	12	2013-06-22 22:48:11.883896	2013-06-22 22:48:11.883896
55160	64	32	12	2013-06-22 22:48:11.885285	2013-06-22 22:48:11.885285
55161	64	33	12	2013-06-22 22:48:11.886249	2013-06-22 22:48:11.886249
55162	64	34	12	2013-06-22 22:48:11.887763	2013-06-22 22:48:11.887763
55163	64	35	12	2013-06-22 22:48:11.889853	2013-06-22 22:48:11.889853
58197	23	0	9	2013-06-23 19:44:44.627611	2013-06-23 19:44:44.627611
58198	23	1	9	2013-06-23 19:44:44.628411	2013-06-23 19:44:44.628411
58199	23	2	9	2013-06-23 19:44:44.62909	2013-06-23 19:44:44.62909
58200	23	3	9	2013-06-23 19:44:44.63015	2013-06-23 19:44:44.63015
58201	23	4	9	2013-06-23 19:44:44.631255	2013-06-23 19:44:44.631255
58202	23	5	9	2013-06-23 19:44:44.632252	2013-06-23 19:44:44.632252
58203	23	6	9	2013-06-23 19:44:44.63308	2013-06-23 19:44:44.63308
58204	23	7	9	2013-06-23 19:44:44.633799	2013-06-23 19:44:44.633799
58205	23	8	9	2013-06-23 19:44:44.634507	2013-06-23 19:44:44.634507
58206	23	9	9	2013-06-23 19:44:44.635177	2013-06-23 19:44:44.635177
58207	23	10	9	2013-06-23 19:44:44.635968	2013-06-23 19:44:44.635968
58208	23	11	9	2013-06-23 19:44:44.636853	2013-06-23 19:44:44.636853
58209	23	12	9	2013-06-23 19:44:44.637855	2013-06-23 19:44:44.637855
58210	23	13	9	2013-06-23 19:44:44.638789	2013-06-23 19:44:44.638789
58211	23	14	9	2013-06-23 19:44:44.639557	2013-06-23 19:44:44.639557
58212	23	15	9	2013-06-23 19:44:44.640584	2013-06-23 19:44:44.640584
58213	23	16	9	2013-06-23 19:44:44.64133	2013-06-23 19:44:44.64133
58214	23	17	9	2013-06-23 19:44:44.642008	2013-06-23 19:44:44.642008
58215	23	18	9	2013-06-23 19:44:44.642764	2013-06-23 19:44:44.642764
58216	23	19	9	2013-06-23 19:44:44.643522	2013-06-23 19:44:44.643522
58217	23	20	9	2013-06-23 19:44:44.644388	2013-06-23 19:44:44.644388
58218	23	21	9	2013-06-23 19:44:44.645453	2013-06-23 19:44:44.645453
58219	23	22	9	2013-06-23 19:44:44.646273	2013-06-23 19:44:44.646273
58220	23	23	9	2013-06-23 19:44:44.647034	2013-06-23 19:44:44.647034
58221	23	24	9	2013-06-23 19:44:44.647846	2013-06-23 19:44:44.647846
58222	23	27	9	2013-06-23 19:44:44.648749	2013-06-23 19:44:44.648749
58223	23	28	9	2013-06-23 19:44:44.649687	2013-06-23 19:44:44.649687
58224	23	29	9	2013-06-23 19:44:44.650395	2013-06-23 19:44:44.650395
58225	23	30	9	2013-06-23 19:44:44.651118	2013-06-23 19:44:44.651118
58226	23	31	9	2013-06-23 19:44:44.651827	2013-06-23 19:44:44.651827
58227	23	32	9	2013-06-23 19:44:44.652558	2013-06-23 19:44:44.652558
58228	23	33	9	2013-06-23 19:44:44.653303	2013-06-23 19:44:44.653303
58229	23	34	9	2013-06-23 19:44:44.654131	2013-06-23 19:44:44.654131
58230	23	35	9	2013-06-23 19:44:44.65482	2013-06-23 19:44:44.65482
58231	23	0	10	2013-06-23 19:44:44.655552	2013-06-23 19:44:44.655552
58232	23	1	10	2013-06-23 19:44:44.656372	2013-06-23 19:44:44.656372
58233	23	2	10	2013-06-23 19:44:44.657176	2013-06-23 19:44:44.657176
58234	23	3	10	2013-06-23 19:44:44.657961	2013-06-23 19:44:44.657961
58235	23	4	10	2013-06-23 19:44:44.65866	2013-06-23 19:44:44.65866
58236	23	5	10	2013-06-23 19:44:44.659353	2013-06-23 19:44:44.659353
58237	23	6	10	2013-06-23 19:44:44.660081	2013-06-23 19:44:44.660081
58238	23	7	10	2013-06-23 19:44:44.660738	2013-06-23 19:44:44.660738
58239	23	8	10	2013-06-23 19:44:44.661561	2013-06-23 19:44:44.661561
58240	23	27	10	2013-06-23 19:44:44.670638	2013-06-23 19:44:44.670638
58241	23	28	10	2013-06-23 19:44:44.671795	2013-06-23 19:44:44.671795
58242	23	29	10	2013-06-23 19:44:44.672557	2013-06-23 19:44:44.672557
58243	23	30	10	2013-06-23 19:44:44.673269	2013-06-23 19:44:44.673269
58244	23	31	10	2013-06-23 19:44:44.673946	2013-06-23 19:44:44.673946
58245	23	32	10	2013-06-23 19:44:44.674649	2013-06-23 19:44:44.674649
58246	23	33	10	2013-06-23 19:44:44.675461	2013-06-23 19:44:44.675461
58247	23	34	10	2013-06-23 19:44:44.676173	2013-06-23 19:44:44.676173
58248	23	35	10	2013-06-23 19:44:44.676871	2013-06-23 19:44:44.676871
58249	23	0	11	2013-06-23 19:44:44.677647	2013-06-23 19:44:44.677647
58250	23	1	11	2013-06-23 19:44:44.6787	2013-06-23 19:44:44.6787
58251	23	2	11	2013-06-23 19:44:44.680041	2013-06-23 19:44:44.680041
58252	23	3	11	2013-06-23 19:44:44.681337	2013-06-23 19:44:44.681337
58253	23	4	11	2013-06-23 19:44:44.682151	2013-06-23 19:44:44.682151
58254	23	5	11	2013-06-23 19:44:44.68286	2013-06-23 19:44:44.68286
58255	23	6	11	2013-06-23 19:44:44.683546	2013-06-23 19:44:44.683546
58256	23	7	11	2013-06-23 19:44:44.68427	2013-06-23 19:44:44.68427
58257	23	8	11	2013-06-23 19:44:44.685007	2013-06-23 19:44:44.685007
58258	23	11	11	2013-06-23 19:44:44.686212	2013-06-23 19:44:44.686212
58259	23	12	11	2013-06-23 19:44:44.687163	2013-06-23 19:44:44.687163
58260	23	13	11	2013-06-23 19:44:44.687845	2013-06-23 19:44:44.687845
58261	23	14	11	2013-06-23 19:44:44.688617	2013-06-23 19:44:44.688617
58262	23	15	11	2013-06-23 19:44:44.68946	2013-06-23 19:44:44.68946
58263	23	16	11	2013-06-23 19:44:44.690465	2013-06-23 19:44:44.690465
58264	23	17	11	2013-06-23 19:44:44.691161	2013-06-23 19:44:44.691161
58265	23	18	11	2013-06-23 19:44:44.691852	2013-06-23 19:44:44.691852
58266	23	19	11	2013-06-23 19:44:44.692542	2013-06-23 19:44:44.692542
58267	23	20	11	2013-06-23 19:44:44.693221	2013-06-23 19:44:44.693221
58268	23	21	11	2013-06-23 19:44:44.694084	2013-06-23 19:44:44.694084
58269	23	22	11	2013-06-23 19:44:44.695078	2013-06-23 19:44:44.695078
58270	23	23	11	2013-06-23 19:44:44.695943	2013-06-23 19:44:44.695943
58271	23	24	11	2013-06-23 19:44:44.696681	2013-06-23 19:44:44.696681
58272	23	25	11	2013-06-23 19:44:44.697384	2013-06-23 19:44:44.697384
58273	23	26	11	2013-06-23 19:44:44.698248	2013-06-23 19:44:44.698248
58274	23	27	11	2013-06-23 19:44:44.699124	2013-06-23 19:44:44.699124
58275	23	28	11	2013-06-23 19:44:44.700059	2013-06-23 19:44:44.700059
58276	23	29	11	2013-06-23 19:44:44.700771	2013-06-23 19:44:44.700771
58277	23	30	11	2013-06-23 19:44:44.701515	2013-06-23 19:44:44.701515
58278	23	31	11	2013-06-23 19:44:44.702288	2013-06-23 19:44:44.702288
58279	23	32	11	2013-06-23 19:44:44.703009	2013-06-23 19:44:44.703009
58280	23	33	11	2013-06-23 19:44:44.703765	2013-06-23 19:44:44.703765
58281	23	34	11	2013-06-23 19:44:44.704493	2013-06-23 19:44:44.704493
58282	23	35	11	2013-06-23 19:44:44.705149	2013-06-23 19:44:44.705149
58283	23	0	12	2013-06-23 19:44:44.705842	2013-06-23 19:44:44.705842
58284	23	1	12	2013-06-23 19:44:44.706588	2013-06-23 19:44:44.706588
58285	23	2	12	2013-06-23 19:44:44.707253	2013-06-23 19:44:44.707253
58286	23	3	12	2013-06-23 19:44:44.707953	2013-06-23 19:44:44.707953
58287	23	4	12	2013-06-23 19:44:44.708643	2013-06-23 19:44:44.708643
58288	23	5	12	2013-06-23 19:44:44.709402	2013-06-23 19:44:44.709402
58289	23	6	12	2013-06-23 19:44:44.71016	2013-06-23 19:44:44.71016
58290	23	26	12	2013-06-23 19:44:44.710877	2013-06-23 19:44:44.710877
58291	23	27	12	2013-06-23 19:44:44.712304	2013-06-23 19:44:44.712304
58292	23	28	12	2013-06-23 19:44:44.713304	2013-06-23 19:44:44.713304
58293	23	29	12	2013-06-23 19:44:44.714	2013-06-23 19:44:44.714
58294	23	30	12	2013-06-23 19:44:44.714714	2013-06-23 19:44:44.714714
58295	23	31	12	2013-06-23 19:44:44.715483	2013-06-23 19:44:44.715483
58296	23	32	12	2013-06-23 19:44:44.71646	2013-06-23 19:44:44.71646
58297	23	33	12	2013-06-23 19:44:44.717485	2013-06-23 19:44:44.717485
58298	23	34	12	2013-06-23 19:44:44.718393	2013-06-23 19:44:44.718393
58299	23	35	12	2013-06-23 19:44:44.719303	2013-06-23 19:44:44.719303
58300	23	0	13	2013-06-23 19:44:44.720131	2013-06-23 19:44:44.720131
58301	23	1	13	2013-06-23 19:44:44.720969	2013-06-23 19:44:44.720969
58302	23	2	13	2013-06-23 19:44:44.721758	2013-06-23 19:44:44.721758
58303	23	3	13	2013-06-23 19:44:44.722435	2013-06-23 19:44:44.722435
58304	23	4	13	2013-06-23 19:44:44.723143	2013-06-23 19:44:44.723143
58305	23	5	13	2013-06-23 19:44:44.723805	2013-06-23 19:44:44.723805
58306	23	6	13	2013-06-23 19:44:44.724498	2013-06-23 19:44:44.724498
58307	23	26	13	2013-06-23 19:44:44.725231	2013-06-23 19:44:44.725231
58308	23	27	13	2013-06-23 19:44:44.726012	2013-06-23 19:44:44.726012
58309	23	28	13	2013-06-23 19:44:44.726728	2013-06-23 19:44:44.726728
58310	23	29	13	2013-06-23 19:44:44.727856	2013-06-23 19:44:44.727856
58311	23	30	13	2013-06-23 19:44:44.728733	2013-06-23 19:44:44.728733
58312	23	31	13	2013-06-23 19:44:44.729448	2013-06-23 19:44:44.729448
58313	23	32	13	2013-06-23 19:44:44.730284	2013-06-23 19:44:44.730284
58314	23	33	13	2013-06-23 19:44:44.731114	2013-06-23 19:44:44.731114
58315	23	34	13	2013-06-23 19:44:44.732032	2013-06-23 19:44:44.732032
58316	23	35	13	2013-06-23 19:44:44.732994	2013-06-23 19:44:44.732994
58317	23	0	14	2013-06-23 19:44:44.733995	2013-06-23 19:44:44.733995
58318	23	1	14	2013-06-23 19:44:44.734898	2013-06-23 19:44:44.734898
58319	23	2	14	2013-06-23 19:44:44.735867	2013-06-23 19:44:44.735867
58320	23	3	14	2013-06-23 19:44:44.73684	2013-06-23 19:44:44.73684
58321	23	4	14	2013-06-23 19:44:44.737597	2013-06-23 19:44:44.737597
58322	23	5	14	2013-06-23 19:44:44.738267	2013-06-23 19:44:44.738267
58323	23	6	14	2013-06-23 19:44:44.738983	2013-06-23 19:44:44.738983
58324	23	26	14	2013-06-23 19:44:44.740064	2013-06-23 19:44:44.740064
58325	23	27	14	2013-06-23 19:44:44.741078	2013-06-23 19:44:44.741078
58326	23	28	14	2013-06-23 19:44:44.742077	2013-06-23 19:44:44.742077
58327	23	29	14	2013-06-23 19:44:44.742824	2013-06-23 19:44:44.742824
58328	23	30	14	2013-06-23 19:44:44.743521	2013-06-23 19:44:44.743521
58329	23	31	14	2013-06-23 19:44:44.744219	2013-06-23 19:44:44.744219
58330	23	32	14	2013-06-23 19:44:44.745246	2013-06-23 19:44:44.745246
58331	23	33	14	2013-06-23 19:44:44.746684	2013-06-23 19:44:44.746684
58332	23	34	14	2013-06-23 19:44:44.747932	2013-06-23 19:44:44.747932
58333	23	35	14	2013-06-23 19:44:44.749035	2013-06-23 19:44:44.749035
58334	23	0	15	2013-06-23 19:44:44.750161	2013-06-23 19:44:44.750161
58335	23	1	15	2013-06-23 19:44:44.750946	2013-06-23 19:44:44.750946
58336	23	2	15	2013-06-23 19:44:44.751624	2013-06-23 19:44:44.751624
58337	23	3	15	2013-06-23 19:44:44.752429	2013-06-23 19:44:44.752429
58338	23	4	15	2013-06-23 19:44:44.753631	2013-06-23 19:44:44.753631
58339	23	5	15	2013-06-23 19:44:44.754604	2013-06-23 19:44:44.754604
58340	23	6	15	2013-06-23 19:44:44.755434	2013-06-23 19:44:44.755434
58341	23	26	15	2013-06-23 19:44:44.75767	2013-06-23 19:44:44.75767
58342	23	27	15	2013-06-23 19:44:44.758458	2013-06-23 19:44:44.758458
58343	23	28	15	2013-06-23 19:44:44.759178	2013-06-23 19:44:44.759178
58344	23	29	15	2013-06-23 19:44:44.759981	2013-06-23 19:44:44.759981
58345	23	30	15	2013-06-23 19:44:44.760879	2013-06-23 19:44:44.760879
58346	23	31	15	2013-06-23 19:44:44.762193	2013-06-23 19:44:44.762193
58347	23	32	15	2013-06-23 19:44:44.763623	2013-06-23 19:44:44.763623
58348	23	33	15	2013-06-23 19:44:44.764671	2013-06-23 19:44:44.764671
58349	23	34	15	2013-06-23 19:44:44.765571	2013-06-23 19:44:44.765571
58350	23	35	15	2013-06-23 19:44:44.766358	2013-06-23 19:44:44.766358
58351	23	0	16	2013-06-23 19:44:44.767165	2013-06-23 19:44:44.767165
58352	23	1	16	2013-06-23 19:44:44.768067	2013-06-23 19:44:44.768067
58353	23	2	16	2013-06-23 19:44:44.768955	2013-06-23 19:44:44.768955
58354	23	3	16	2013-06-23 19:44:44.769942	2013-06-23 19:44:44.769942
58355	23	4	16	2013-06-23 19:44:44.770634	2013-06-23 19:44:44.770634
58356	23	5	16	2013-06-23 19:44:44.771329	2013-06-23 19:44:44.771329
58357	23	6	16	2013-06-23 19:44:44.772563	2013-06-23 19:44:44.772563
58358	23	26	16	2013-06-23 19:44:44.773534	2013-06-23 19:44:44.773534
58359	23	27	16	2013-06-23 19:44:44.774299	2013-06-23 19:44:44.774299
58360	23	28	16	2013-06-23 19:44:44.775059	2013-06-23 19:44:44.775059
58361	23	29	16	2013-06-23 19:44:44.775765	2013-06-23 19:44:44.775765
58362	23	30	16	2013-06-23 19:44:44.776664	2013-06-23 19:44:44.776664
58363	23	31	16	2013-06-23 19:44:44.777567	2013-06-23 19:44:44.777567
58364	23	32	16	2013-06-23 19:44:44.778272	2013-06-23 19:44:44.778272
58365	23	33	16	2013-06-23 19:44:44.778926	2013-06-23 19:44:44.778926
58366	23	34	16	2013-06-23 19:44:44.779721	2013-06-23 19:44:44.779721
58367	23	35	16	2013-06-23 19:44:44.780443	2013-06-23 19:44:44.780443
58368	23	0	17	2013-06-23 19:44:44.781338	2013-06-23 19:44:44.781338
58369	23	1	17	2013-06-23 19:44:44.782372	2013-06-23 19:44:44.782372
58370	23	2	17	2013-06-23 19:44:44.783199	2013-06-23 19:44:44.783199
58371	23	3	17	2013-06-23 19:44:44.784133	2013-06-23 19:44:44.784133
58372	23	4	17	2013-06-23 19:44:44.784995	2013-06-23 19:44:44.784995
58373	23	5	17	2013-06-23 19:44:44.786047	2013-06-23 19:44:44.786047
58374	23	6	17	2013-06-23 19:44:44.786834	2013-06-23 19:44:44.786834
58375	23	26	17	2013-06-23 19:44:44.787572	2013-06-23 19:44:44.787572
58376	23	27	17	2013-06-23 19:44:44.788279	2013-06-23 19:44:44.788279
58377	23	28	17	2013-06-23 19:44:44.788951	2013-06-23 19:44:44.788951
58378	23	29	17	2013-06-23 19:44:44.789762	2013-06-23 19:44:44.789762
58379	23	30	17	2013-06-23 19:44:44.790535	2013-06-23 19:44:44.790535
58380	23	31	17	2013-06-23 19:44:44.791582	2013-06-23 19:44:44.791582
58381	23	32	17	2013-06-23 19:44:44.792294	2013-06-23 19:44:44.792294
58382	23	33	17	2013-06-23 19:44:44.792951	2013-06-23 19:44:44.792951
58383	23	34	17	2013-06-23 19:44:44.793656	2013-06-23 19:44:44.793656
58384	23	35	17	2013-06-23 19:44:44.794384	2013-06-23 19:44:44.794384
58385	23	0	18	2013-06-23 19:44:44.795407	2013-06-23 19:44:44.795407
58386	23	1	18	2013-06-23 19:44:44.796311	2013-06-23 19:44:44.796311
58387	23	2	18	2013-06-23 19:44:44.797077	2013-06-23 19:44:44.797077
58388	23	3	18	2013-06-23 19:44:44.798284	2013-06-23 19:44:44.798284
58389	23	4	18	2013-06-23 19:44:44.799299	2013-06-23 19:44:44.799299
58390	23	5	18	2013-06-23 19:44:44.800074	2013-06-23 19:44:44.800074
58391	23	6	18	2013-06-23 19:44:44.801077	2013-06-23 19:44:44.801077
58392	23	26	18	2013-06-23 19:44:44.801918	2013-06-23 19:44:44.801918
58393	23	27	18	2013-06-23 19:44:44.802586	2013-06-23 19:44:44.802586
58394	23	28	18	2013-06-23 19:44:44.80347	2013-06-23 19:44:44.80347
58395	23	29	18	2013-06-23 19:44:44.804242	2013-06-23 19:44:44.804242
58396	23	30	18	2013-06-23 19:44:44.805012	2013-06-23 19:44:44.805012
58397	23	31	18	2013-06-23 19:44:44.805828	2013-06-23 19:44:44.805828
58398	23	32	18	2013-06-23 19:44:44.806691	2013-06-23 19:44:44.806691
58399	23	33	18	2013-06-23 19:44:44.807549	2013-06-23 19:44:44.807549
58400	23	34	18	2013-06-23 19:44:44.808268	2013-06-23 19:44:44.808268
58401	23	35	18	2013-06-23 19:44:44.808966	2013-06-23 19:44:44.808966
58402	23	0	19	2013-06-23 19:44:44.809665	2013-06-23 19:44:44.809665
58403	23	1	19	2013-06-23 19:44:44.810353	2013-06-23 19:44:44.810353
58404	23	2	19	2013-06-23 19:44:44.811138	2013-06-23 19:44:44.811138
58405	23	3	19	2013-06-23 19:44:44.812078	2013-06-23 19:44:44.812078
58406	23	4	19	2013-06-23 19:44:44.812817	2013-06-23 19:44:44.812817
58407	23	5	19	2013-06-23 19:44:44.813601	2013-06-23 19:44:44.813601
58408	23	6	19	2013-06-23 19:44:44.814725	2013-06-23 19:44:44.814725
58409	23	7	19	2013-06-23 19:44:44.815515	2013-06-23 19:44:44.815515
58410	23	8	19	2013-06-23 19:44:44.816278	2013-06-23 19:44:44.816278
58411	23	9	19	2013-06-23 19:44:44.817039	2013-06-23 19:44:44.817039
58412	23	10	19	2013-06-23 19:44:44.817777	2013-06-23 19:44:44.817777
58413	23	11	19	2013-06-23 19:44:44.818478	2013-06-23 19:44:44.818478
58414	23	12	19	2013-06-23 19:44:44.819208	2013-06-23 19:44:44.819208
58415	23	13	19	2013-06-23 19:44:44.819911	2013-06-23 19:44:44.819911
58416	23	14	19	2013-06-23 19:44:44.82061	2013-06-23 19:44:44.82061
58417	23	29	19	2013-06-23 19:44:44.821368	2013-06-23 19:44:44.821368
58418	23	30	19	2013-06-23 19:44:44.822478	2013-06-23 19:44:44.822478
58419	23	31	19	2013-06-23 19:44:44.823469	2013-06-23 19:44:44.823469
58420	23	32	19	2013-06-23 19:44:44.824238	2013-06-23 19:44:44.824238
58421	23	33	19	2013-06-23 19:44:44.824945	2013-06-23 19:44:44.824945
58422	23	34	19	2013-06-23 19:44:44.825645	2013-06-23 19:44:44.825645
58423	23	35	19	2013-06-23 19:44:44.826348	2013-06-23 19:44:44.826348
58424	23	0	20	2013-06-23 19:44:44.827031	2013-06-23 19:44:44.827031
58425	23	1	20	2013-06-23 19:44:44.827714	2013-06-23 19:44:44.827714
58426	23	2	20	2013-06-23 19:44:44.82842	2013-06-23 19:44:44.82842
58427	23	3	20	2013-06-23 19:44:44.829137	2013-06-23 19:44:44.829137
58428	23	4	20	2013-06-23 19:44:44.830003	2013-06-23 19:44:44.830003
58429	23	5	20	2013-06-23 19:44:44.830923	2013-06-23 19:44:44.830923
58430	23	6	20	2013-06-23 19:44:44.831925	2013-06-23 19:44:44.831925
58431	23	7	20	2013-06-23 19:44:44.832836	2013-06-23 19:44:44.832836
58432	23	8	20	2013-06-23 19:44:44.834119	2013-06-23 19:44:44.834119
58433	23	9	20	2013-06-23 19:44:44.834961	2013-06-23 19:44:44.834961
58434	23	10	20	2013-06-23 19:44:44.835697	2013-06-23 19:44:44.835697
58435	23	11	20	2013-06-23 19:44:44.836412	2013-06-23 19:44:44.836412
58436	23	12	20	2013-06-23 19:44:44.837244	2013-06-23 19:44:44.837244
58437	23	13	20	2013-06-23 19:44:44.838031	2013-06-23 19:44:44.838031
58438	23	14	20	2013-06-23 19:44:44.838763	2013-06-23 19:44:44.838763
58439	23	29	20	2013-06-23 19:44:44.839474	2013-06-23 19:44:44.839474
58440	23	30	20	2013-06-23 19:44:44.840212	2013-06-23 19:44:44.840212
58441	23	31	20	2013-06-23 19:44:44.840894	2013-06-23 19:44:44.840894
58442	23	32	20	2013-06-23 19:44:44.841909	2013-06-23 19:44:44.841909
58443	23	33	20	2013-06-23 19:44:44.84264	2013-06-23 19:44:44.84264
58444	23	34	20	2013-06-23 19:44:44.84334	2013-06-23 19:44:44.84334
58445	23	35	20	2013-06-23 19:44:44.844053	2013-06-23 19:44:44.844053
58446	23	0	21	2013-06-23 19:44:44.844741	2013-06-23 19:44:44.844741
58447	23	1	21	2013-06-23 19:44:44.845469	2013-06-23 19:44:44.845469
58448	23	2	21	2013-06-23 19:44:44.846156	2013-06-23 19:44:44.846156
58449	23	3	21	2013-06-23 19:44:44.846959	2013-06-23 19:44:44.846959
58450	23	4	21	2013-06-23 19:44:44.848052	2013-06-23 19:44:44.848052
58451	23	5	21	2013-06-23 19:44:44.849048	2013-06-23 19:44:44.849048
58452	23	6	21	2013-06-23 19:44:44.849878	2013-06-23 19:44:44.849878
58453	23	7	21	2013-06-23 19:44:44.85077	2013-06-23 19:44:44.85077
58454	23	8	21	2013-06-23 19:44:44.851667	2013-06-23 19:44:44.851667
58455	23	9	21	2013-06-23 19:44:44.852535	2013-06-23 19:44:44.852535
58456	23	10	21	2013-06-23 19:44:44.853302	2013-06-23 19:44:44.853302
58457	23	11	21	2013-06-23 19:44:44.854008	2013-06-23 19:44:44.854008
58458	23	12	21	2013-06-23 19:44:44.854714	2013-06-23 19:44:44.854714
58459	23	13	21	2013-06-23 19:44:44.855467	2013-06-23 19:44:44.855467
58460	23	14	21	2013-06-23 19:44:44.85616	2013-06-23 19:44:44.85616
58461	23	29	21	2013-06-23 19:44:44.856878	2013-06-23 19:44:44.856878
58462	23	30	21	2013-06-23 19:44:44.857667	2013-06-23 19:44:44.857667
58463	23	31	21	2013-06-23 19:44:44.858401	2013-06-23 19:44:44.858401
58464	23	32	21	2013-06-23 19:44:44.85912	2013-06-23 19:44:44.85912
58465	23	33	21	2013-06-23 19:44:44.859801	2013-06-23 19:44:44.859801
58466	23	34	21	2013-06-23 19:44:44.86049	2013-06-23 19:44:44.86049
58467	23	35	21	2013-06-23 19:44:44.861168	2013-06-23 19:44:44.861168
61018	73	16	0	2013-06-24 04:00:28.574833	2013-06-24 04:00:28.574833
61019	73	17	0	2013-06-24 04:00:28.575722	2013-06-24 04:00:28.575722
61020	73	18	0	2013-06-24 04:00:28.576478	2013-06-24 04:00:28.576478
61021	73	19	0	2013-06-24 04:00:28.577213	2013-06-24 04:00:28.577213
61022	73	20	0	2013-06-24 04:00:28.577873	2013-06-24 04:00:28.577873
61023	73	21	0	2013-06-24 04:00:28.578601	2013-06-24 04:00:28.578601
61024	73	22	0	2013-06-24 04:00:28.579354	2013-06-24 04:00:28.579354
61025	73	23	0	2013-06-24 04:00:28.580109	2013-06-24 04:00:28.580109
61026	73	24	0	2013-06-24 04:00:28.581062	2013-06-24 04:00:28.581062
61027	73	16	1	2013-06-24 04:00:28.5836	2013-06-24 04:00:28.5836
61028	73	17	1	2013-06-24 04:00:28.584765	2013-06-24 04:00:28.584765
61029	73	18	1	2013-06-24 04:00:28.585837	2013-06-24 04:00:28.585837
61030	73	19	1	2013-06-24 04:00:28.586783	2013-06-24 04:00:28.586783
61031	73	20	1	2013-06-24 04:00:28.587527	2013-06-24 04:00:28.587527
61032	73	21	1	2013-06-24 04:00:28.588197	2013-06-24 04:00:28.588197
61033	73	22	1	2013-06-24 04:00:28.588936	2013-06-24 04:00:28.588936
61034	73	23	1	2013-06-24 04:00:28.589672	2013-06-24 04:00:28.589672
61035	73	24	1	2013-06-24 04:00:28.590393	2013-06-24 04:00:28.590393
61036	73	23	2	2013-06-24 04:00:28.592048	2013-06-24 04:00:28.592048
61037	73	24	2	2013-06-24 04:00:28.592729	2013-06-24 04:00:28.592729
61038	73	23	3	2013-06-24 04:00:28.598007	2013-06-24 04:00:28.598007
61039	73	24	3	2013-06-24 04:00:28.598812	2013-06-24 04:00:28.598812
61040	73	13	4	2013-06-24 04:00:28.602239	2013-06-24 04:00:28.602239
61041	73	14	4	2013-06-24 04:00:28.603015	2013-06-24 04:00:28.603015
61042	73	15	4	2013-06-24 04:00:28.60373	2013-06-24 04:00:28.60373
61043	73	16	4	2013-06-24 04:00:28.604556	2013-06-24 04:00:28.604556
61044	73	17	4	2013-06-24 04:00:28.605512	2013-06-24 04:00:28.605512
61045	73	18	4	2013-06-24 04:00:28.606283	2013-06-24 04:00:28.606283
61046	73	19	4	2013-06-24 04:00:28.60745	2013-06-24 04:00:28.60745
61047	73	20	4	2013-06-24 04:00:28.608378	2013-06-24 04:00:28.608378
61048	73	23	4	2013-06-24 04:00:28.610451	2013-06-24 04:00:28.610451
61049	73	24	4	2013-06-24 04:00:28.611368	2013-06-24 04:00:28.611368
61050	73	0	5	2013-06-24 04:00:28.612146	2013-06-24 04:00:28.612146
61051	73	1	5	2013-06-24 04:00:28.612822	2013-06-24 04:00:28.612822
61052	73	13	5	2013-06-24 04:00:28.613529	2013-06-24 04:00:28.613529
61053	73	14	5	2013-06-24 04:00:28.614256	2013-06-24 04:00:28.614256
61054	73	15	5	2013-06-24 04:00:28.614917	2013-06-24 04:00:28.614917
61055	73	16	5	2013-06-24 04:00:28.615659	2013-06-24 04:00:28.615659
61056	73	17	5	2013-06-24 04:00:28.616363	2013-06-24 04:00:28.616363
61057	73	18	5	2013-06-24 04:00:28.617109	2013-06-24 04:00:28.617109
61058	73	19	5	2013-06-24 04:00:28.617829	2013-06-24 04:00:28.617829
61059	73	20	5	2013-06-24 04:00:28.61853	2013-06-24 04:00:28.61853
61060	73	23	5	2013-06-24 04:00:28.620111	2013-06-24 04:00:28.620111
61061	73	24	5	2013-06-24 04:00:28.620857	2013-06-24 04:00:28.620857
61062	73	34	5	2013-06-24 04:00:28.621567	2013-06-24 04:00:28.621567
61063	73	35	5	2013-06-24 04:00:28.622323	2013-06-24 04:00:28.622323
61064	73	0	6	2013-06-24 04:00:28.623076	2013-06-24 04:00:28.623076
61065	73	1	6	2013-06-24 04:00:28.624006	2013-06-24 04:00:28.624006
61066	73	13	6	2013-06-24 04:00:28.625656	2013-06-24 04:00:28.625656
61067	73	14	6	2013-06-24 04:00:28.626481	2013-06-24 04:00:28.626481
61068	73	23	6	2013-06-24 04:00:28.628254	2013-06-24 04:00:28.628254
61069	73	24	6	2013-06-24 04:00:28.628954	2013-06-24 04:00:28.628954
61070	73	34	6	2013-06-24 04:00:28.630765	2013-06-24 04:00:28.630765
61071	73	35	6	2013-06-24 04:00:28.631577	2013-06-24 04:00:28.631577
61072	73	0	7	2013-06-24 04:00:28.632302	2013-06-24 04:00:28.632302
61073	73	1	7	2013-06-24 04:00:28.633082	2013-06-24 04:00:28.633082
61074	73	13	7	2013-06-24 04:00:28.633929	2013-06-24 04:00:28.633929
61075	73	14	7	2013-06-24 04:00:28.634683	2013-06-24 04:00:28.634683
61076	73	23	7	2013-06-24 04:00:28.636257	2013-06-24 04:00:28.636257
61077	73	24	7	2013-06-24 04:00:28.637021	2013-06-24 04:00:28.637021
61078	73	34	7	2013-06-24 04:00:28.637721	2013-06-24 04:00:28.637721
61079	73	35	7	2013-06-24 04:00:28.638428	2013-06-24 04:00:28.638428
61080	73	0	8	2013-06-24 04:00:28.63916	2013-06-24 04:00:28.63916
61081	73	1	8	2013-06-24 04:00:28.639851	2013-06-24 04:00:28.639851
61082	73	13	8	2013-06-24 04:00:28.640562	2013-06-24 04:00:28.640562
61083	73	14	8	2013-06-24 04:00:28.641232	2013-06-24 04:00:28.641232
61084	73	17	8	2013-06-24 04:00:28.643553	2013-06-24 04:00:28.643553
61085	73	18	8	2013-06-24 04:00:28.644296	2013-06-24 04:00:28.644296
61086	73	19	8	2013-06-24 04:00:28.645231	2013-06-24 04:00:28.645231
61087	73	20	8	2013-06-24 04:00:28.645974	2013-06-24 04:00:28.645974
61088	73	21	8	2013-06-24 04:00:28.646701	2013-06-24 04:00:28.646701
61089	73	22	8	2013-06-24 04:00:28.647378	2013-06-24 04:00:28.647378
61090	73	23	8	2013-06-24 04:00:28.648093	2013-06-24 04:00:28.648093
61091	73	24	8	2013-06-24 04:00:28.648868	2013-06-24 04:00:28.648868
61092	73	34	8	2013-06-24 04:00:28.649563	2013-06-24 04:00:28.649563
61093	73	35	8	2013-06-24 04:00:28.650261	2013-06-24 04:00:28.650261
61094	73	0	9	2013-06-24 04:00:28.650957	2013-06-24 04:00:28.650957
61095	73	1	9	2013-06-24 04:00:28.651658	2013-06-24 04:00:28.651658
61096	73	13	9	2013-06-24 04:00:28.653246	2013-06-24 04:00:28.653246
61097	73	14	9	2013-06-24 04:00:28.653964	2013-06-24 04:00:28.653964
61098	73	17	9	2013-06-24 04:00:28.654663	2013-06-24 04:00:28.654663
61099	73	18	9	2013-06-24 04:00:28.655535	2013-06-24 04:00:28.655535
61100	73	19	9	2013-06-24 04:00:28.65637	2013-06-24 04:00:28.65637
61101	73	20	9	2013-06-24 04:00:28.657173	2013-06-24 04:00:28.657173
61102	73	21	9	2013-06-24 04:00:28.6579	2013-06-24 04:00:28.6579
61103	73	22	9	2013-06-24 04:00:28.658625	2013-06-24 04:00:28.658625
61104	73	23	9	2013-06-24 04:00:28.659431	2013-06-24 04:00:28.659431
61105	73	24	9	2013-06-24 04:00:28.660258	2013-06-24 04:00:28.660258
61106	73	34	9	2013-06-24 04:00:28.661013	2013-06-24 04:00:28.661013
61107	73	35	9	2013-06-24 04:00:28.661676	2013-06-24 04:00:28.661676
61108	73	0	10	2013-06-24 04:00:28.662462	2013-06-24 04:00:28.662462
61109	73	1	10	2013-06-24 04:00:28.663355	2013-06-24 04:00:28.663355
61110	73	2	10	2013-06-24 04:00:28.664313	2013-06-24 04:00:28.664313
61111	73	3	10	2013-06-24 04:00:28.665102	2013-06-24 04:00:28.665102
61112	73	4	10	2013-06-24 04:00:28.665769	2013-06-24 04:00:28.665769
61113	73	5	10	2013-06-24 04:00:28.666467	2013-06-24 04:00:28.666467
61114	73	6	10	2013-06-24 04:00:28.667138	2013-06-24 04:00:28.667138
61115	73	7	10	2013-06-24 04:00:28.667826	2013-06-24 04:00:28.667826
61116	73	8	10	2013-06-24 04:00:28.668746	2013-06-24 04:00:28.668746
61117	73	9	10	2013-06-24 04:00:28.669407	2013-06-24 04:00:28.669407
61118	73	10	10	2013-06-24 04:00:28.670086	2013-06-24 04:00:28.670086
61119	73	11	10	2013-06-24 04:00:28.670748	2013-06-24 04:00:28.670748
61120	73	12	10	2013-06-24 04:00:28.671435	2013-06-24 04:00:28.671435
61121	73	13	10	2013-06-24 04:00:28.67216	2013-06-24 04:00:28.67216
61122	73	14	10	2013-06-24 04:00:28.672989	2013-06-24 04:00:28.672989
61123	73	27	10	2013-06-24 04:00:28.675204	2013-06-24 04:00:28.675204
61124	73	28	10	2013-06-24 04:00:28.676181	2013-06-24 04:00:28.676181
61125	73	29	10	2013-06-24 04:00:28.677021	2013-06-24 04:00:28.677021
61126	73	30	10	2013-06-24 04:00:28.677773	2013-06-24 04:00:28.677773
61127	73	31	10	2013-06-24 04:00:28.678497	2013-06-24 04:00:28.678497
61128	73	32	10	2013-06-24 04:00:28.679168	2013-06-24 04:00:28.679168
61129	73	33	10	2013-06-24 04:00:28.679879	2013-06-24 04:00:28.679879
61130	73	34	10	2013-06-24 04:00:28.680599	2013-06-24 04:00:28.680599
61131	73	35	10	2013-06-24 04:00:28.6813	2013-06-24 04:00:28.6813
61132	73	0	11	2013-06-24 04:00:28.682009	2013-06-24 04:00:28.682009
61133	73	1	11	2013-06-24 04:00:28.682673	2013-06-24 04:00:28.682673
61134	73	2	11	2013-06-24 04:00:28.683365	2013-06-24 04:00:28.683365
61135	73	3	11	2013-06-24 04:00:28.684055	2013-06-24 04:00:28.684055
61136	73	4	11	2013-06-24 04:00:28.684721	2013-06-24 04:00:28.684721
61137	73	5	11	2013-06-24 04:00:28.685713	2013-06-24 04:00:28.685713
61138	73	6	11	2013-06-24 04:00:28.686589	2013-06-24 04:00:28.686589
61139	73	7	11	2013-06-24 04:00:28.687471	2013-06-24 04:00:28.687471
61140	73	8	11	2013-06-24 04:00:28.688255	2013-06-24 04:00:28.688255
61141	73	9	11	2013-06-24 04:00:28.68915	2013-06-24 04:00:28.68915
61142	73	10	11	2013-06-24 04:00:28.690064	2013-06-24 04:00:28.690064
61143	73	11	11	2013-06-24 04:00:28.691031	2013-06-24 04:00:28.691031
61144	73	12	11	2013-06-24 04:00:28.691987	2013-06-24 04:00:28.691987
61145	73	13	11	2013-06-24 04:00:28.692803	2013-06-24 04:00:28.692803
61146	73	14	11	2013-06-24 04:00:28.693901	2013-06-24 04:00:28.693901
61147	73	27	11	2013-06-24 04:00:28.695773	2013-06-24 04:00:28.695773
61148	73	28	11	2013-06-24 04:00:28.696487	2013-06-24 04:00:28.696487
61149	73	29	11	2013-06-24 04:00:28.697192	2013-06-24 04:00:28.697192
61150	73	30	11	2013-06-24 04:00:28.697859	2013-06-24 04:00:28.697859
61151	73	31	11	2013-06-24 04:00:28.698595	2013-06-24 04:00:28.698595
61152	73	32	11	2013-06-24 04:00:28.699296	2013-06-24 04:00:28.699296
61153	73	33	11	2013-06-24 04:00:28.699988	2013-06-24 04:00:28.699988
61154	73	34	11	2013-06-24 04:00:28.700676	2013-06-24 04:00:28.700676
61155	73	35	11	2013-06-24 04:00:28.70133	2013-06-24 04:00:28.70133
61156	73	0	12	2013-06-24 04:00:28.70201	2013-06-24 04:00:28.70201
61157	73	1	12	2013-06-24 04:00:28.702706	2013-06-24 04:00:28.702706
61158	73	27	12	2013-06-24 04:00:28.705984	2013-06-24 04:00:28.705984
61159	73	28	12	2013-06-24 04:00:28.706707	2013-06-24 04:00:28.706707
61160	73	34	12	2013-06-24 04:00:28.707404	2013-06-24 04:00:28.707404
61161	73	35	12	2013-06-24 04:00:28.708064	2013-06-24 04:00:28.708064
61162	73	0	13	2013-06-24 04:00:28.709114	2013-06-24 04:00:28.709114
61163	73	1	13	2013-06-24 04:00:28.70986	2013-06-24 04:00:28.70986
61164	73	27	13	2013-06-24 04:00:28.712353	2013-06-24 04:00:28.712353
61165	73	28	13	2013-06-24 04:00:28.713291	2013-06-24 04:00:28.713291
61166	73	34	13	2013-06-24 04:00:28.714123	2013-06-24 04:00:28.714123
61167	73	35	13	2013-06-24 04:00:28.714902	2013-06-24 04:00:28.714902
61168	73	0	14	2013-06-24 04:00:28.715708	2013-06-24 04:00:28.715708
61169	73	1	14	2013-06-24 04:00:28.716554	2013-06-24 04:00:28.716554
61170	73	11	14	2013-06-24 04:00:28.717401	2013-06-24 04:00:28.717401
61171	73	12	14	2013-06-24 04:00:28.718278	2013-06-24 04:00:28.718278
61172	73	13	14	2013-06-24 04:00:28.719018	2013-06-24 04:00:28.719018
61173	73	14	14	2013-06-24 04:00:28.719722	2013-06-24 04:00:28.719722
61174	73	15	14	2013-06-24 04:00:28.720411	2013-06-24 04:00:28.720411
61175	73	16	14	2013-06-24 04:00:28.721207	2013-06-24 04:00:28.721207
61176	73	17	14	2013-06-24 04:00:28.721892	2013-06-24 04:00:28.721892
61177	73	18	14	2013-06-24 04:00:28.722604	2013-06-24 04:00:28.722604
61178	73	19	14	2013-06-24 04:00:28.723264	2013-06-24 04:00:28.723264
61179	73	20	14	2013-06-24 04:00:28.723955	2013-06-24 04:00:28.723955
61180	73	21	14	2013-06-24 04:00:28.724821	2013-06-24 04:00:28.724821
61181	73	22	14	2013-06-24 04:00:28.725598	2013-06-24 04:00:28.725598
61182	73	23	14	2013-06-24 04:00:28.726377	2013-06-24 04:00:28.726377
61183	73	24	14	2013-06-24 04:00:28.727202	2013-06-24 04:00:28.727202
61184	73	27	14	2013-06-24 04:00:28.728864	2013-06-24 04:00:28.728864
61185	73	28	14	2013-06-24 04:00:28.729609	2013-06-24 04:00:28.729609
61186	73	34	14	2013-06-24 04:00:28.730338	2013-06-24 04:00:28.730338
61187	73	35	14	2013-06-24 04:00:28.731031	2013-06-24 04:00:28.731031
61188	73	0	15	2013-06-24 04:00:28.731689	2013-06-24 04:00:28.731689
61189	73	1	15	2013-06-24 04:00:28.7324	2013-06-24 04:00:28.7324
61190	73	11	15	2013-06-24 04:00:28.733127	2013-06-24 04:00:28.733127
61191	73	12	15	2013-06-24 04:00:28.733851	2013-06-24 04:00:28.733851
61192	73	13	15	2013-06-24 04:00:28.734534	2013-06-24 04:00:28.734534
61193	73	14	15	2013-06-24 04:00:28.735197	2013-06-24 04:00:28.735197
61194	73	15	15	2013-06-24 04:00:28.735911	2013-06-24 04:00:28.735911
61195	73	16	15	2013-06-24 04:00:28.736567	2013-06-24 04:00:28.736567
61196	73	17	15	2013-06-24 04:00:28.737275	2013-06-24 04:00:28.737275
61197	73	18	15	2013-06-24 04:00:28.738333	2013-06-24 04:00:28.738333
61198	73	19	15	2013-06-24 04:00:28.73912	2013-06-24 04:00:28.73912
61199	73	20	15	2013-06-24 04:00:28.739855	2013-06-24 04:00:28.739855
61200	73	21	15	2013-06-24 04:00:28.740529	2013-06-24 04:00:28.740529
61201	73	22	15	2013-06-24 04:00:28.741227	2013-06-24 04:00:28.741227
61202	73	23	15	2013-06-24 04:00:28.741964	2013-06-24 04:00:28.741964
61203	73	24	15	2013-06-24 04:00:28.742691	2013-06-24 04:00:28.742691
61204	73	27	15	2013-06-24 04:00:28.744282	2013-06-24 04:00:28.744282
61205	73	28	15	2013-06-24 04:00:28.74497	2013-06-24 04:00:28.74497
61206	73	34	15	2013-06-24 04:00:28.746794	2013-06-24 04:00:28.746794
61207	73	35	15	2013-06-24 04:00:28.747713	2013-06-24 04:00:28.747713
61208	73	11	16	2013-06-24 04:00:28.748483	2013-06-24 04:00:28.748483
61209	73	12	16	2013-06-24 04:00:28.749142	2013-06-24 04:00:28.749142
61210	73	27	16	2013-06-24 04:00:28.750702	2013-06-24 04:00:28.750702
61211	73	28	16	2013-06-24 04:00:28.751377	2013-06-24 04:00:28.751377
61212	73	11	17	2013-06-24 04:00:28.752902	2013-06-24 04:00:28.752902
61213	73	12	17	2013-06-24 04:00:28.75359	2013-06-24 04:00:28.75359
61214	73	27	17	2013-06-24 04:00:28.755125	2013-06-24 04:00:28.755125
61215	73	28	17	2013-06-24 04:00:28.755801	2013-06-24 04:00:28.755801
61216	73	11	18	2013-06-24 04:00:28.756515	2013-06-24 04:00:28.756515
61217	73	12	18	2013-06-24 04:00:28.757191	2013-06-24 04:00:28.757191
61218	73	15	18	2013-06-24 04:00:28.758794	2013-06-24 04:00:28.758794
61219	73	16	18	2013-06-24 04:00:28.759561	2013-06-24 04:00:28.759561
61220	73	17	18	2013-06-24 04:00:28.760382	2013-06-24 04:00:28.760382
61221	73	18	18	2013-06-24 04:00:28.761133	2013-06-24 04:00:28.761133
61222	73	19	18	2013-06-24 04:00:28.761835	2013-06-24 04:00:28.761835
61223	73	20	18	2013-06-24 04:00:28.762665	2013-06-24 04:00:28.762665
61224	73	21	18	2013-06-24 04:00:28.763811	2013-06-24 04:00:28.763811
61225	73	22	18	2013-06-24 04:00:28.764763	2013-06-24 04:00:28.764763
61226	73	23	18	2013-06-24 04:00:28.765642	2013-06-24 04:00:28.765642
61227	73	24	18	2013-06-24 04:00:28.766467	2013-06-24 04:00:28.766467
61228	73	25	18	2013-06-24 04:00:28.767278	2013-06-24 04:00:28.767278
61229	73	26	18	2013-06-24 04:00:28.767971	2013-06-24 04:00:28.767971
61230	73	27	18	2013-06-24 04:00:28.768629	2013-06-24 04:00:28.768629
61231	73	28	18	2013-06-24 04:00:28.769332	2013-06-24 04:00:28.769332
61232	73	11	19	2013-06-24 04:00:28.772414	2013-06-24 04:00:28.772414
61233	73	12	19	2013-06-24 04:00:28.773117	2013-06-24 04:00:28.773117
61234	73	15	19	2013-06-24 04:00:28.774635	2013-06-24 04:00:28.774635
61235	73	16	19	2013-06-24 04:00:28.775343	2013-06-24 04:00:28.775343
61236	73	17	19	2013-06-24 04:00:28.776554	2013-06-24 04:00:28.776554
61237	73	18	19	2013-06-24 04:00:28.777494	2013-06-24 04:00:28.777494
61238	73	19	19	2013-06-24 04:00:28.778246	2013-06-24 04:00:28.778246
61239	73	20	19	2013-06-24 04:00:28.778943	2013-06-24 04:00:28.778943
61240	73	21	19	2013-06-24 04:00:28.779646	2013-06-24 04:00:28.779646
61241	73	22	19	2013-06-24 04:00:28.780536	2013-06-24 04:00:28.780536
61242	73	23	19	2013-06-24 04:00:28.781346	2013-06-24 04:00:28.781346
61243	73	24	19	2013-06-24 04:00:28.782163	2013-06-24 04:00:28.782163
61244	73	25	19	2013-06-24 04:00:28.782951	2013-06-24 04:00:28.782951
61245	73	26	19	2013-06-24 04:00:28.783657	2013-06-24 04:00:28.783657
61246	73	27	19	2013-06-24 04:00:28.784361	2013-06-24 04:00:28.784361
61247	73	28	19	2013-06-24 04:00:28.785028	2013-06-24 04:00:28.785028
61248	73	11	20	2013-06-24 04:00:28.788249	2013-06-24 04:00:28.788249
61249	73	12	20	2013-06-24 04:00:28.789316	2013-06-24 04:00:28.789316
61250	73	11	21	2013-06-24 04:00:28.791144	2013-06-24 04:00:28.791144
61251	73	12	21	2013-06-24 04:00:28.792031	2013-06-24 04:00:28.792031
62687	71	0	1	2013-06-24 16:48:57.211489	2013-06-24 16:48:57.211489
62688	71	1	1	2013-06-24 16:48:57.212598	2013-06-24 16:48:57.212598
62689	71	2	1	2013-06-24 16:48:57.213339	2013-06-24 16:48:57.213339
62690	71	3	1	2013-06-24 16:48:57.214017	2013-06-24 16:48:57.214017
62691	71	4	1	2013-06-24 16:48:57.214778	2013-06-24 16:48:57.214778
62692	71	5	1	2013-06-24 16:48:57.215482	2013-06-24 16:48:57.215482
62693	71	6	1	2013-06-24 16:48:57.216151	2013-06-24 16:48:57.216151
62694	71	7	1	2013-06-24 16:48:57.21709	2013-06-24 16:48:57.21709
62695	71	8	1	2013-06-24 16:48:57.217978	2013-06-24 16:48:57.217978
62696	71	9	1	2013-06-24 16:48:57.218953	2013-06-24 16:48:57.218953
62697	71	10	1	2013-06-24 16:48:57.220181	2013-06-24 16:48:57.220181
62698	71	11	1	2013-06-24 16:48:57.221034	2013-06-24 16:48:57.221034
62699	71	12	1	2013-06-24 16:48:57.221836	2013-06-24 16:48:57.221836
62700	71	13	1	2013-06-24 16:48:57.222624	2013-06-24 16:48:57.222624
62701	71	14	1	2013-06-24 16:48:57.223774	2013-06-24 16:48:57.223774
62702	71	15	1	2013-06-24 16:48:57.225026	2013-06-24 16:48:57.225026
62703	71	16	1	2013-06-24 16:48:57.225786	2013-06-24 16:48:57.225786
62704	71	17	1	2013-06-24 16:48:57.226485	2013-06-24 16:48:57.226485
62705	71	18	1	2013-06-24 16:48:57.227143	2013-06-24 16:48:57.227143
62706	71	19	1	2013-06-24 16:48:57.227834	2013-06-24 16:48:57.227834
62707	71	20	1	2013-06-24 16:48:57.228538	2013-06-24 16:48:57.228538
62708	71	21	1	2013-06-24 16:48:57.22944	2013-06-24 16:48:57.22944
62709	71	22	1	2013-06-24 16:48:57.230185	2013-06-24 16:48:57.230185
62710	71	23	1	2013-06-24 16:48:57.230852	2013-06-24 16:48:57.230852
62711	71	24	1	2013-06-24 16:48:57.231661	2013-06-24 16:48:57.231661
62712	71	25	1	2013-06-24 16:48:57.232432	2013-06-24 16:48:57.232432
62713	71	26	1	2013-06-24 16:48:57.233266	2013-06-24 16:48:57.233266
62714	71	27	1	2013-06-24 16:48:57.23424	2013-06-24 16:48:57.23424
62715	71	28	1	2013-06-24 16:48:57.235583	2013-06-24 16:48:57.235583
62716	71	29	1	2013-06-24 16:48:57.236953	2013-06-24 16:48:57.236953
62717	71	30	1	2013-06-24 16:48:57.238224	2013-06-24 16:48:57.238224
62718	71	31	1	2013-06-24 16:48:57.239264	2013-06-24 16:48:57.239264
62719	71	32	1	2013-06-24 16:48:57.240144	2013-06-24 16:48:57.240144
62720	71	33	1	2013-06-24 16:48:57.240858	2013-06-24 16:48:57.240858
62721	71	34	1	2013-06-24 16:48:57.241565	2013-06-24 16:48:57.241565
62722	71	1	3	2013-06-24 16:48:57.243247	2013-06-24 16:48:57.243247
62723	71	2	3	2013-06-24 16:48:57.243934	2013-06-24 16:48:57.243934
62724	71	3	3	2013-06-24 16:48:57.244619	2013-06-24 16:48:57.244619
62725	71	4	3	2013-06-24 16:48:57.245398	2013-06-24 16:48:57.245398
62726	71	5	3	2013-06-24 16:48:57.246153	2013-06-24 16:48:57.246153
62727	71	6	3	2013-06-24 16:48:57.24701	2013-06-24 16:48:57.24701
62728	71	7	3	2013-06-24 16:48:57.247793	2013-06-24 16:48:57.247793
62729	71	8	3	2013-06-24 16:48:57.248519	2013-06-24 16:48:57.248519
62730	71	9	3	2013-06-24 16:48:57.249215	2013-06-24 16:48:57.249215
62731	71	10	3	2013-06-24 16:48:57.249941	2013-06-24 16:48:57.249941
62732	71	11	3	2013-06-24 16:48:57.250669	2013-06-24 16:48:57.250669
62733	71	12	3	2013-06-24 16:48:57.251359	2013-06-24 16:48:57.251359
62734	71	13	3	2013-06-24 16:48:57.252361	2013-06-24 16:48:57.252361
62735	71	14	3	2013-06-24 16:48:57.253192	2013-06-24 16:48:57.253192
62736	71	15	3	2013-06-24 16:48:57.254298	2013-06-24 16:48:57.254298
62737	71	16	3	2013-06-24 16:48:57.255498	2013-06-24 16:48:57.255498
62738	71	17	3	2013-06-24 16:48:57.256271	2013-06-24 16:48:57.256271
62739	71	18	3	2013-06-24 16:48:57.25707	2013-06-24 16:48:57.25707
62740	71	19	3	2013-06-24 16:48:57.257794	2013-06-24 16:48:57.257794
62741	71	20	3	2013-06-24 16:48:57.258528	2013-06-24 16:48:57.258528
62742	71	21	3	2013-06-24 16:48:57.259229	2013-06-24 16:48:57.259229
62743	71	22	3	2013-06-24 16:48:57.260102	2013-06-24 16:48:57.260102
62744	71	23	3	2013-06-24 16:48:57.261024	2013-06-24 16:48:57.261024
62745	71	24	3	2013-06-24 16:48:57.261829	2013-06-24 16:48:57.261829
62746	71	25	3	2013-06-24 16:48:57.262569	2013-06-24 16:48:57.262569
62747	71	26	3	2013-06-24 16:48:57.263259	2013-06-24 16:48:57.263259
62748	71	27	3	2013-06-24 16:48:57.263924	2013-06-24 16:48:57.263924
62749	71	28	3	2013-06-24 16:48:57.264703	2013-06-24 16:48:57.264703
62750	71	29	3	2013-06-24 16:48:57.265404	2013-06-24 16:48:57.265404
62751	71	30	3	2013-06-24 16:48:57.26612	2013-06-24 16:48:57.26612
62752	71	31	3	2013-06-24 16:48:57.266799	2013-06-24 16:48:57.266799
62753	71	32	3	2013-06-24 16:48:57.267454	2013-06-24 16:48:57.267454
62754	71	33	3	2013-06-24 16:48:57.268169	2013-06-24 16:48:57.268169
62755	71	34	3	2013-06-24 16:48:57.269042	2013-06-24 16:48:57.269042
62756	71	35	3	2013-06-24 16:48:57.27028	2013-06-24 16:48:57.27028
62757	71	0	5	2013-06-24 16:48:57.271301	2013-06-24 16:48:57.271301
62758	71	1	5	2013-06-24 16:48:57.27206	2013-06-24 16:48:57.27206
62759	71	2	5	2013-06-24 16:48:57.273183	2013-06-24 16:48:57.273183
62760	71	3	5	2013-06-24 16:48:57.27407	2013-06-24 16:48:57.27407
62761	71	4	5	2013-06-24 16:48:57.274789	2013-06-24 16:48:57.274789
62762	71	5	5	2013-06-24 16:48:57.275526	2013-06-24 16:48:57.275526
62763	71	6	5	2013-06-24 16:48:57.276208	2013-06-24 16:48:57.276208
62764	71	7	5	2013-06-24 16:48:57.27698	2013-06-24 16:48:57.27698
62765	71	8	5	2013-06-24 16:48:57.277715	2013-06-24 16:48:57.277715
62766	71	9	5	2013-06-24 16:48:57.278412	2013-06-24 16:48:57.278412
62767	71	10	5	2013-06-24 16:48:57.279262	2013-06-24 16:48:57.279262
62768	71	11	5	2013-06-24 16:48:57.279968	2013-06-24 16:48:57.279968
62769	71	12	5	2013-06-24 16:48:57.280747	2013-06-24 16:48:57.280747
62770	71	13	5	2013-06-24 16:48:57.281681	2013-06-24 16:48:57.281681
62771	71	14	5	2013-06-24 16:48:57.282352	2013-06-24 16:48:57.282352
62772	71	15	5	2013-06-24 16:48:57.283046	2013-06-24 16:48:57.283046
62773	71	16	5	2013-06-24 16:48:57.283732	2013-06-24 16:48:57.283732
62774	71	17	5	2013-06-24 16:48:57.28443	2013-06-24 16:48:57.28443
62775	71	18	5	2013-06-24 16:48:57.285146	2013-06-24 16:48:57.285146
62776	71	19	5	2013-06-24 16:48:57.285812	2013-06-24 16:48:57.285812
62777	71	20	5	2013-06-24 16:48:57.286717	2013-06-24 16:48:57.286717
62778	71	21	5	2013-06-24 16:48:57.288156	2013-06-24 16:48:57.288156
62779	71	22	5	2013-06-24 16:48:57.289035	2013-06-24 16:48:57.289035
62780	71	23	5	2013-06-24 16:48:57.290118	2013-06-24 16:48:57.290118
62781	71	24	5	2013-06-24 16:48:57.291049	2013-06-24 16:48:57.291049
62782	71	25	5	2013-06-24 16:48:57.29187	2013-06-24 16:48:57.29187
62783	71	26	5	2013-06-24 16:48:57.292599	2013-06-24 16:48:57.292599
62784	71	27	5	2013-06-24 16:48:57.293344	2013-06-24 16:48:57.293344
62785	71	28	5	2013-06-24 16:48:57.294139	2013-06-24 16:48:57.294139
62786	71	29	5	2013-06-24 16:48:57.295018	2013-06-24 16:48:57.295018
62787	71	30	5	2013-06-24 16:48:57.295786	2013-06-24 16:48:57.295786
62788	71	31	5	2013-06-24 16:48:57.296484	2013-06-24 16:48:57.296484
62789	71	32	5	2013-06-24 16:48:57.297254	2013-06-24 16:48:57.297254
62790	71	33	5	2013-06-24 16:48:57.29798	2013-06-24 16:48:57.29798
62791	71	34	5	2013-06-24 16:48:57.298696	2013-06-24 16:48:57.298696
62792	71	1	7	2013-06-24 16:48:57.299522	2013-06-24 16:48:57.299522
62793	71	2	7	2013-06-24 16:48:57.300259	2013-06-24 16:48:57.300259
62794	71	3	7	2013-06-24 16:48:57.300908	2013-06-24 16:48:57.300908
62795	71	4	7	2013-06-24 16:48:57.301599	2013-06-24 16:48:57.301599
62796	71	5	7	2013-06-24 16:48:57.303067	2013-06-24 16:48:57.303067
62797	71	6	7	2013-06-24 16:48:57.304212	2013-06-24 16:48:57.304212
62798	71	7	7	2013-06-24 16:48:57.305186	2013-06-24 16:48:57.305186
62799	71	8	7	2013-06-24 16:48:57.30632	2013-06-24 16:48:57.30632
62800	71	9	7	2013-06-24 16:48:57.307169	2013-06-24 16:48:57.307169
62801	71	10	7	2013-06-24 16:48:57.307917	2013-06-24 16:48:57.307917
62802	71	11	7	2013-06-24 16:48:57.308665	2013-06-24 16:48:57.308665
62803	71	12	7	2013-06-24 16:48:57.309358	2013-06-24 16:48:57.309358
62804	71	13	7	2013-06-24 16:48:57.310171	2013-06-24 16:48:57.310171
62805	71	14	7	2013-06-24 16:48:57.311285	2013-06-24 16:48:57.311285
62806	71	15	7	2013-06-24 16:48:57.312319	2013-06-24 16:48:57.312319
62807	71	16	7	2013-06-24 16:48:57.313265	2013-06-24 16:48:57.313265
62808	71	17	7	2013-06-24 16:48:57.314196	2013-06-24 16:48:57.314196
62809	71	18	7	2013-06-24 16:48:57.314986	2013-06-24 16:48:57.314986
62810	71	19	7	2013-06-24 16:48:57.315661	2013-06-24 16:48:57.315661
62811	71	20	7	2013-06-24 16:48:57.316443	2013-06-24 16:48:57.316443
62812	71	21	7	2013-06-24 16:48:57.317168	2013-06-24 16:48:57.317168
62813	71	22	7	2013-06-24 16:48:57.317833	2013-06-24 16:48:57.317833
62814	71	23	7	2013-06-24 16:48:57.318614	2013-06-24 16:48:57.318614
62815	71	24	7	2013-06-24 16:48:57.319435	2013-06-24 16:48:57.319435
62816	71	25	7	2013-06-24 16:48:57.320385	2013-06-24 16:48:57.320385
62817	71	26	7	2013-06-24 16:48:57.321224	2013-06-24 16:48:57.321224
62818	71	27	7	2013-06-24 16:48:57.321962	2013-06-24 16:48:57.321962
62819	71	28	7	2013-06-24 16:48:57.322853	2013-06-24 16:48:57.322853
62820	71	29	7	2013-06-24 16:48:57.323765	2013-06-24 16:48:57.323765
62821	71	30	7	2013-06-24 16:48:57.324486	2013-06-24 16:48:57.324486
62822	71	31	7	2013-06-24 16:48:57.325194	2013-06-24 16:48:57.325194
62823	71	32	7	2013-06-24 16:48:57.325899	2013-06-24 16:48:57.325899
62824	71	33	7	2013-06-24 16:48:57.326659	2013-06-24 16:48:57.326659
62825	71	34	7	2013-06-24 16:48:57.327424	2013-06-24 16:48:57.327424
62826	71	35	7	2013-06-24 16:48:57.328109	2013-06-24 16:48:57.328109
62827	71	0	9	2013-06-24 16:48:57.328924	2013-06-24 16:48:57.328924
62828	71	1	9	2013-06-24 16:48:57.329743	2013-06-24 16:48:57.329743
62829	71	2	9	2013-06-24 16:48:57.330628	2013-06-24 16:48:57.330628
62830	71	3	9	2013-06-24 16:48:57.331383	2013-06-24 16:48:57.331383
62831	71	4	9	2013-06-24 16:48:57.332067	2013-06-24 16:48:57.332067
62832	71	5	9	2013-06-24 16:48:57.332811	2013-06-24 16:48:57.332811
62833	71	6	9	2013-06-24 16:48:57.333513	2013-06-24 16:48:57.333513
62834	71	7	9	2013-06-24 16:48:57.334192	2013-06-24 16:48:57.334192
62835	71	8	9	2013-06-24 16:48:57.33512	2013-06-24 16:48:57.33512
62836	71	9	9	2013-06-24 16:48:57.33593	2013-06-24 16:48:57.33593
62837	71	10	9	2013-06-24 16:48:57.336673	2013-06-24 16:48:57.336673
62838	71	11	9	2013-06-24 16:48:57.337372	2013-06-24 16:48:57.337372
62839	71	12	9	2013-06-24 16:48:57.338179	2013-06-24 16:48:57.338179
62840	71	13	9	2013-06-24 16:48:57.338934	2013-06-24 16:48:57.338934
62841	71	14	9	2013-06-24 16:48:57.339808	2013-06-24 16:48:57.339808
62842	71	15	9	2013-06-24 16:48:57.340561	2013-06-24 16:48:57.340561
62843	71	16	9	2013-06-24 16:48:57.341278	2013-06-24 16:48:57.341278
62844	71	17	9	2013-06-24 16:48:57.341972	2013-06-24 16:48:57.341972
62845	71	18	9	2013-06-24 16:48:57.342682	2013-06-24 16:48:57.342682
62846	71	19	9	2013-06-24 16:48:57.343402	2013-06-24 16:48:57.343402
62847	71	20	9	2013-06-24 16:48:57.344123	2013-06-24 16:48:57.344123
62848	71	21	9	2013-06-24 16:48:57.344777	2013-06-24 16:48:57.344777
62849	71	22	9	2013-06-24 16:48:57.345501	2013-06-24 16:48:57.345501
62850	71	23	9	2013-06-24 16:48:57.346211	2013-06-24 16:48:57.346211
62851	71	24	9	2013-06-24 16:48:57.346886	2013-06-24 16:48:57.346886
62852	71	25	9	2013-06-24 16:48:57.347572	2013-06-24 16:48:57.347572
62853	71	26	9	2013-06-24 16:48:57.348307	2013-06-24 16:48:57.348307
62854	71	27	9	2013-06-24 16:48:57.349021	2013-06-24 16:48:57.349021
62855	71	28	9	2013-06-24 16:48:57.349678	2013-06-24 16:48:57.349678
62856	71	29	9	2013-06-24 16:48:57.350459	2013-06-24 16:48:57.350459
62857	71	30	9	2013-06-24 16:48:57.35134	2013-06-24 16:48:57.35134
62858	71	31	9	2013-06-24 16:48:57.352166	2013-06-24 16:48:57.352166
62859	71	32	9	2013-06-24 16:48:57.352921	2013-06-24 16:48:57.352921
62860	71	33	9	2013-06-24 16:48:57.353624	2013-06-24 16:48:57.353624
62861	71	34	9	2013-06-24 16:48:57.354434	2013-06-24 16:48:57.354434
62862	71	1	11	2013-06-24 16:48:57.356501	2013-06-24 16:48:57.356501
62863	71	2	11	2013-06-24 16:48:57.357382	2013-06-24 16:48:57.357382
62864	71	3	11	2013-06-24 16:48:57.358081	2013-06-24 16:48:57.358081
62865	71	4	11	2013-06-24 16:48:57.358777	2013-06-24 16:48:57.358777
62866	71	5	11	2013-06-24 16:48:57.359648	2013-06-24 16:48:57.359648
62867	71	6	11	2013-06-24 16:48:57.360378	2013-06-24 16:48:57.360378
62868	71	7	11	2013-06-24 16:48:57.361076	2013-06-24 16:48:57.361076
62869	71	8	11	2013-06-24 16:48:57.361743	2013-06-24 16:48:57.361743
62870	71	9	11	2013-06-24 16:48:57.362461	2013-06-24 16:48:57.362461
62871	71	10	11	2013-06-24 16:48:57.363192	2013-06-24 16:48:57.363192
62872	71	11	11	2013-06-24 16:48:57.363853	2013-06-24 16:48:57.363853
62873	71	12	11	2013-06-24 16:48:57.364526	2013-06-24 16:48:57.364526
62874	71	13	11	2013-06-24 16:48:57.365211	2013-06-24 16:48:57.365211
62875	71	14	11	2013-06-24 16:48:57.365867	2013-06-24 16:48:57.365867
62876	71	15	11	2013-06-24 16:48:57.366536	2013-06-24 16:48:57.366536
62877	71	16	11	2013-06-24 16:48:57.367228	2013-06-24 16:48:57.367228
62878	71	17	11	2013-06-24 16:48:57.367934	2013-06-24 16:48:57.367934
62879	71	18	11	2013-06-24 16:48:57.368723	2013-06-24 16:48:57.368723
62880	71	19	11	2013-06-24 16:48:57.369442	2013-06-24 16:48:57.369442
62881	71	20	11	2013-06-24 16:48:57.370157	2013-06-24 16:48:57.370157
62882	71	21	11	2013-06-24 16:48:57.370817	2013-06-24 16:48:57.370817
62883	71	22	11	2013-06-24 16:48:57.371505	2013-06-24 16:48:57.371505
62884	71	23	11	2013-06-24 16:48:57.372197	2013-06-24 16:48:57.372197
62885	71	24	11	2013-06-24 16:48:57.372853	2013-06-24 16:48:57.372853
62886	71	25	11	2013-06-24 16:48:57.373562	2013-06-24 16:48:57.373562
62887	71	26	11	2013-06-24 16:48:57.374265	2013-06-24 16:48:57.374265
62888	71	27	11	2013-06-24 16:48:57.374961	2013-06-24 16:48:57.374961
62889	71	28	11	2013-06-24 16:48:57.375643	2013-06-24 16:48:57.375643
62890	71	29	11	2013-06-24 16:48:57.37635	2013-06-24 16:48:57.37635
62891	71	30	11	2013-06-24 16:48:57.37704	2013-06-24 16:48:57.37704
62892	71	31	11	2013-06-24 16:48:57.377703	2013-06-24 16:48:57.377703
62893	71	32	11	2013-06-24 16:48:57.378406	2013-06-24 16:48:57.378406
62894	71	33	11	2013-06-24 16:48:57.379101	2013-06-24 16:48:57.379101
62895	71	34	11	2013-06-24 16:48:57.379773	2013-06-24 16:48:57.379773
62896	71	35	11	2013-06-24 16:48:57.38072	2013-06-24 16:48:57.38072
62897	71	0	13	2013-06-24 16:48:57.381619	2013-06-24 16:48:57.381619
62898	71	1	13	2013-06-24 16:48:57.38248	2013-06-24 16:48:57.38248
62899	71	2	13	2013-06-24 16:48:57.383221	2013-06-24 16:48:57.383221
62900	71	3	13	2013-06-24 16:48:57.3839	2013-06-24 16:48:57.3839
62901	71	4	13	2013-06-24 16:48:57.384673	2013-06-24 16:48:57.384673
62902	71	5	13	2013-06-24 16:48:57.38538	2013-06-24 16:48:57.38538
62903	71	6	13	2013-06-24 16:48:57.386037	2013-06-24 16:48:57.386037
62904	71	7	13	2013-06-24 16:48:57.386709	2013-06-24 16:48:57.386709
62905	71	8	13	2013-06-24 16:48:57.387404	2013-06-24 16:48:57.387404
62906	71	9	13	2013-06-24 16:48:57.388075	2013-06-24 16:48:57.388075
62907	71	10	13	2013-06-24 16:48:57.388756	2013-06-24 16:48:57.388756
62908	71	11	13	2013-06-24 16:48:57.3895	2013-06-24 16:48:57.3895
62909	71	12	13	2013-06-24 16:48:57.390238	2013-06-24 16:48:57.390238
62910	71	13	13	2013-06-24 16:48:57.390884	2013-06-24 16:48:57.390884
62911	71	14	13	2013-06-24 16:48:57.391577	2013-06-24 16:48:57.391577
62912	71	15	13	2013-06-24 16:48:57.392259	2013-06-24 16:48:57.392259
62913	71	16	13	2013-06-24 16:48:57.392963	2013-06-24 16:48:57.392963
62914	71	17	13	2013-06-24 16:48:57.3938	2013-06-24 16:48:57.3938
62915	71	18	13	2013-06-24 16:48:57.394545	2013-06-24 16:48:57.394545
62916	71	19	13	2013-06-24 16:48:57.395334	2013-06-24 16:48:57.395334
62917	71	20	13	2013-06-24 16:48:57.39608	2013-06-24 16:48:57.39608
62918	71	21	13	2013-06-24 16:48:57.396796	2013-06-24 16:48:57.396796
62919	71	22	13	2013-06-24 16:48:57.397471	2013-06-24 16:48:57.397471
62920	71	23	13	2013-06-24 16:48:57.398159	2013-06-24 16:48:57.398159
62921	71	24	13	2013-06-24 16:48:57.398885	2013-06-24 16:48:57.398885
62922	71	25	13	2013-06-24 16:48:57.399588	2013-06-24 16:48:57.399588
62923	71	26	13	2013-06-24 16:48:57.400264	2013-06-24 16:48:57.400264
62924	71	27	13	2013-06-24 16:48:57.400957	2013-06-24 16:48:57.400957
62925	71	28	13	2013-06-24 16:48:57.401731	2013-06-24 16:48:57.401731
62926	71	29	13	2013-06-24 16:48:57.402484	2013-06-24 16:48:57.402484
62927	71	30	13	2013-06-24 16:48:57.403159	2013-06-24 16:48:57.403159
62928	71	31	13	2013-06-24 16:48:57.403854	2013-06-24 16:48:57.403854
62929	71	32	13	2013-06-24 16:48:57.404562	2013-06-24 16:48:57.404562
62930	71	33	13	2013-06-24 16:48:57.405228	2013-06-24 16:48:57.405228
62931	71	34	13	2013-06-24 16:48:57.405916	2013-06-24 16:48:57.405916
62932	71	1	15	2013-06-24 16:48:57.406653	2013-06-24 16:48:57.406653
62933	71	2	15	2013-06-24 16:48:57.407327	2013-06-24 16:48:57.407327
62934	71	3	15	2013-06-24 16:48:57.407981	2013-06-24 16:48:57.407981
62935	71	4	15	2013-06-24 16:48:57.408674	2013-06-24 16:48:57.408674
62936	71	5	15	2013-06-24 16:48:57.409367	2013-06-24 16:48:57.409367
62937	71	6	15	2013-06-24 16:48:57.410567	2013-06-24 16:48:57.410567
62938	71	7	15	2013-06-24 16:48:57.41148	2013-06-24 16:48:57.41148
62939	71	8	15	2013-06-24 16:48:57.412403	2013-06-24 16:48:57.412403
62940	71	9	15	2013-06-24 16:48:57.413303	2013-06-24 16:48:57.413303
62941	71	10	15	2013-06-24 16:48:57.414133	2013-06-24 16:48:57.414133
62942	71	11	15	2013-06-24 16:48:57.414877	2013-06-24 16:48:57.414877
62943	71	12	15	2013-06-24 16:48:57.415567	2013-06-24 16:48:57.415567
62944	71	13	15	2013-06-24 16:48:57.41627	2013-06-24 16:48:57.41627
62945	71	14	15	2013-06-24 16:48:57.417033	2013-06-24 16:48:57.417033
62946	71	15	15	2013-06-24 16:48:57.417721	2013-06-24 16:48:57.417721
62947	71	16	15	2013-06-24 16:48:57.418458	2013-06-24 16:48:57.418458
62948	71	17	15	2013-06-24 16:48:57.419124	2013-06-24 16:48:57.419124
62949	71	18	15	2013-06-24 16:48:57.419806	2013-06-24 16:48:57.419806
62950	71	19	15	2013-06-24 16:48:57.420494	2013-06-24 16:48:57.420494
62951	71	20	15	2013-06-24 16:48:57.421153	2013-06-24 16:48:57.421153
62952	71	21	15	2013-06-24 16:48:57.421834	2013-06-24 16:48:57.421834
62953	71	22	15	2013-06-24 16:48:57.422525	2013-06-24 16:48:57.422525
62954	71	23	15	2013-06-24 16:48:57.423236	2013-06-24 16:48:57.423236
62955	71	24	15	2013-06-24 16:48:57.424267	2013-06-24 16:48:57.424267
62956	71	25	15	2013-06-24 16:48:57.424977	2013-06-24 16:48:57.424977
62957	71	26	15	2013-06-24 16:48:57.425681	2013-06-24 16:48:57.425681
62958	71	27	15	2013-06-24 16:48:57.426363	2013-06-24 16:48:57.426363
62959	71	28	15	2013-06-24 16:48:57.427203	2013-06-24 16:48:57.427203
62960	71	29	15	2013-06-24 16:48:57.428046	2013-06-24 16:48:57.428046
62961	71	30	15	2013-06-24 16:48:57.428863	2013-06-24 16:48:57.428863
62962	71	31	15	2013-06-24 16:48:57.429707	2013-06-24 16:48:57.429707
62963	71	32	15	2013-06-24 16:48:57.430541	2013-06-24 16:48:57.430541
62964	71	33	15	2013-06-24 16:48:57.431258	2013-06-24 16:48:57.431258
62965	71	34	15	2013-06-24 16:48:57.431965	2013-06-24 16:48:57.431965
62966	71	35	15	2013-06-24 16:48:57.432707	2013-06-24 16:48:57.432707
62967	71	0	17	2013-06-24 16:48:57.433448	2013-06-24 16:48:57.433448
62968	71	1	17	2013-06-24 16:48:57.434223	2013-06-24 16:48:57.434223
62969	71	2	17	2013-06-24 16:48:57.434904	2013-06-24 16:48:57.434904
62970	71	3	17	2013-06-24 16:48:57.435602	2013-06-24 16:48:57.435602
62971	71	4	17	2013-06-24 16:48:57.436287	2013-06-24 16:48:57.436287
62972	71	5	17	2013-06-24 16:48:57.436955	2013-06-24 16:48:57.436955
62973	71	6	17	2013-06-24 16:48:57.437786	2013-06-24 16:48:57.437786
62974	71	7	17	2013-06-24 16:48:57.438499	2013-06-24 16:48:57.438499
62975	71	8	17	2013-06-24 16:48:57.439386	2013-06-24 16:48:57.439386
62976	71	9	17	2013-06-24 16:48:57.440412	2013-06-24 16:48:57.440412
62977	71	10	17	2013-06-24 16:48:57.441166	2013-06-24 16:48:57.441166
62978	71	11	17	2013-06-24 16:48:57.441852	2013-06-24 16:48:57.441852
62979	71	12	17	2013-06-24 16:48:57.442549	2013-06-24 16:48:57.442549
62980	71	13	17	2013-06-24 16:48:57.443234	2013-06-24 16:48:57.443234
62981	71	14	17	2013-06-24 16:48:57.444532	2013-06-24 16:48:57.444532
62982	71	15	17	2013-06-24 16:48:57.445377	2013-06-24 16:48:57.445377
62983	71	16	17	2013-06-24 16:48:57.446253	2013-06-24 16:48:57.446253
62984	71	17	17	2013-06-24 16:48:57.447037	2013-06-24 16:48:57.447037
62985	71	18	17	2013-06-24 16:48:57.447731	2013-06-24 16:48:57.447731
62986	71	19	17	2013-06-24 16:48:57.448439	2013-06-24 16:48:57.448439
62987	71	20	17	2013-06-24 16:48:57.449153	2013-06-24 16:48:57.449153
62988	71	21	17	2013-06-24 16:48:57.449862	2013-06-24 16:48:57.449862
62989	71	22	17	2013-06-24 16:48:57.450523	2013-06-24 16:48:57.450523
62990	71	23	17	2013-06-24 16:48:57.451193	2013-06-24 16:48:57.451193
62991	71	24	17	2013-06-24 16:48:57.452438	2013-06-24 16:48:57.452438
62992	71	25	17	2013-06-24 16:48:57.453111	2013-06-24 16:48:57.453111
62993	71	26	17	2013-06-24 16:48:57.45405	2013-06-24 16:48:57.45405
62994	71	27	17	2013-06-24 16:48:57.454747	2013-06-24 16:48:57.454747
62995	71	28	17	2013-06-24 16:48:57.45555	2013-06-24 16:48:57.45555
62996	71	29	17	2013-06-24 16:48:57.456324	2013-06-24 16:48:57.456324
62997	71	30	17	2013-06-24 16:48:57.457051	2013-06-24 16:48:57.457051
62998	71	31	17	2013-06-24 16:48:57.457789	2013-06-24 16:48:57.457789
62999	71	32	17	2013-06-24 16:48:57.458449	2013-06-24 16:48:57.458449
63000	71	33	17	2013-06-24 16:48:57.459157	2013-06-24 16:48:57.459157
63001	71	34	17	2013-06-24 16:48:57.460007	2013-06-24 16:48:57.460007
63002	71	1	19	2013-06-24 16:48:57.462502	2013-06-24 16:48:57.462502
63003	71	2	19	2013-06-24 16:48:57.46327	2013-06-24 16:48:57.46327
63004	71	3	19	2013-06-24 16:48:57.463991	2013-06-24 16:48:57.463991
63005	71	4	19	2013-06-24 16:48:57.464652	2013-06-24 16:48:57.464652
63006	71	5	19	2013-06-24 16:48:57.465337	2013-06-24 16:48:57.465337
63007	71	6	19	2013-06-24 16:48:57.466068	2013-06-24 16:48:57.466068
63008	71	7	19	2013-06-24 16:48:57.466797	2013-06-24 16:48:57.466797
63009	71	8	19	2013-06-24 16:48:57.467538	2013-06-24 16:48:57.467538
63010	71	9	19	2013-06-24 16:48:57.468257	2013-06-24 16:48:57.468257
63011	71	10	19	2013-06-24 16:48:57.468979	2013-06-24 16:48:57.468979
63012	71	11	19	2013-06-24 16:48:57.470351	2013-06-24 16:48:57.470351
63013	71	12	19	2013-06-24 16:48:57.471897	2013-06-24 16:48:57.471897
63014	71	13	19	2013-06-24 16:48:57.473214	2013-06-24 16:48:57.473214
63015	71	14	19	2013-06-24 16:48:57.474093	2013-06-24 16:48:57.474093
63016	71	15	19	2013-06-24 16:48:57.474807	2013-06-24 16:48:57.474807
63017	71	16	19	2013-06-24 16:48:57.475631	2013-06-24 16:48:57.475631
63018	71	17	19	2013-06-24 16:48:57.476337	2013-06-24 16:48:57.476337
63019	71	18	19	2013-06-24 16:48:57.477005	2013-06-24 16:48:57.477005
63020	71	19	19	2013-06-24 16:48:57.477707	2013-06-24 16:48:57.477707
63021	71	20	19	2013-06-24 16:48:57.478402	2013-06-24 16:48:57.478402
63022	71	21	19	2013-06-24 16:48:57.479088	2013-06-24 16:48:57.479088
63023	71	22	19	2013-06-24 16:48:57.479866	2013-06-24 16:48:57.479866
63024	71	23	19	2013-06-24 16:48:57.480608	2013-06-24 16:48:57.480608
63025	71	24	19	2013-06-24 16:48:57.481278	2013-06-24 16:48:57.481278
63026	71	25	19	2013-06-24 16:48:57.481991	2013-06-24 16:48:57.481991
63027	71	26	19	2013-06-24 16:48:57.482867	2013-06-24 16:48:57.482867
63028	71	27	19	2013-06-24 16:48:57.483637	2013-06-24 16:48:57.483637
63029	71	28	19	2013-06-24 16:48:57.484336	2013-06-24 16:48:57.484336
63030	71	29	19	2013-06-24 16:48:57.485055	2013-06-24 16:48:57.485055
63031	71	30	19	2013-06-24 16:48:57.485766	2013-06-24 16:48:57.485766
63032	71	31	19	2013-06-24 16:48:57.486416	2013-06-24 16:48:57.486416
63033	71	32	19	2013-06-24 16:48:57.487105	2013-06-24 16:48:57.487105
63034	71	33	19	2013-06-24 16:48:57.487797	2013-06-24 16:48:57.487797
63035	71	34	19	2013-06-24 16:48:57.488494	2013-06-24 16:48:57.488494
63036	71	35	19	2013-06-24 16:48:57.48915	2013-06-24 16:48:57.48915
64006	72	0	3	2013-06-28 01:06:40.488726	2013-06-28 01:06:40.488726
64007	72	1	3	2013-06-28 01:06:40.489622	2013-06-28 01:06:40.489622
64008	72	2	3	2013-06-28 01:06:40.490504	2013-06-28 01:06:40.490504
64009	72	3	3	2013-06-28 01:06:40.491713	2013-06-28 01:06:40.491713
64010	72	4	3	2013-06-28 01:06:40.492717	2013-06-28 01:06:40.492717
64011	72	5	3	2013-06-28 01:06:40.49347	2013-06-28 01:06:40.49347
64012	72	6	3	2013-06-28 01:06:40.49419	2013-06-28 01:06:40.49419
64013	72	7	3	2013-06-28 01:06:40.494984	2013-06-28 01:06:40.494984
64014	72	8	3	2013-06-28 01:06:40.4957	2013-06-28 01:06:40.4957
64015	72	9	3	2013-06-28 01:06:40.496468	2013-06-28 01:06:40.496468
64016	72	10	3	2013-06-28 01:06:40.497321	2013-06-28 01:06:40.497321
64017	72	11	3	2013-06-28 01:06:40.498331	2013-06-28 01:06:40.498331
64018	72	12	3	2013-06-28 01:06:40.499709	2013-06-28 01:06:40.499709
64019	72	13	3	2013-06-28 01:06:40.50075	2013-06-28 01:06:40.50075
64020	72	14	3	2013-06-28 01:06:40.501517	2013-06-28 01:06:40.501517
64021	72	15	3	2013-06-28 01:06:40.502583	2013-06-28 01:06:40.502583
64022	72	16	3	2013-06-28 01:06:40.503343	2013-06-28 01:06:40.503343
64023	72	17	3	2013-06-28 01:06:40.50404	2013-06-28 01:06:40.50404
64024	72	18	3	2013-06-28 01:06:40.504959	2013-06-28 01:06:40.504959
64025	72	19	3	2013-06-28 01:06:40.505712	2013-06-28 01:06:40.505712
64026	72	20	3	2013-06-28 01:06:40.50681	2013-06-28 01:06:40.50681
64027	72	21	3	2013-06-28 01:06:40.508496	2013-06-28 01:06:40.508496
64028	72	22	3	2013-06-28 01:06:40.50998	2013-06-28 01:06:40.50998
64029	72	23	3	2013-06-28 01:06:40.51136	2013-06-28 01:06:40.51136
64030	72	24	3	2013-06-28 01:06:40.51242	2013-06-28 01:06:40.51242
64031	72	25	3	2013-06-28 01:06:40.513204	2013-06-28 01:06:40.513204
64032	72	26	3	2013-06-28 01:06:40.513925	2013-06-28 01:06:40.513925
64033	72	27	3	2013-06-28 01:06:40.514642	2013-06-28 01:06:40.514642
64034	72	28	3	2013-06-28 01:06:40.515463	2013-06-28 01:06:40.515463
64035	72	29	3	2013-06-28 01:06:40.516188	2013-06-28 01:06:40.516188
64036	72	30	3	2013-06-28 01:06:40.516888	2013-06-28 01:06:40.516888
64037	72	31	3	2013-06-28 01:06:40.51761	2013-06-28 01:06:40.51761
64038	72	32	3	2013-06-28 01:06:40.518344	2013-06-28 01:06:40.518344
64039	72	32	4	2013-06-28 01:06:40.519396	2013-06-28 01:06:40.519396
64040	72	32	5	2013-06-28 01:06:40.522767	2013-06-28 01:06:40.522767
64041	72	32	6	2013-06-28 01:06:40.524976	2013-06-28 01:06:40.524976
64042	72	3	7	2013-06-28 01:06:40.526478	2013-06-28 01:06:40.526478
64043	72	4	7	2013-06-28 01:06:40.527802	2013-06-28 01:06:40.527802
64044	72	5	7	2013-06-28 01:06:40.528742	2013-06-28 01:06:40.528742
64045	72	6	7	2013-06-28 01:06:40.529626	2013-06-28 01:06:40.529626
64046	72	7	7	2013-06-28 01:06:40.53059	2013-06-28 01:06:40.53059
64047	72	8	7	2013-06-28 01:06:40.531378	2013-06-28 01:06:40.531378
64048	72	9	7	2013-06-28 01:06:40.532086	2013-06-28 01:06:40.532086
64049	72	10	7	2013-06-28 01:06:40.532768	2013-06-28 01:06:40.532768
64050	72	11	7	2013-06-28 01:06:40.533677	2013-06-28 01:06:40.533677
64051	72	12	7	2013-06-28 01:06:40.534476	2013-06-28 01:06:40.534476
64052	72	13	7	2013-06-28 01:06:40.535184	2013-06-28 01:06:40.535184
64053	72	14	7	2013-06-28 01:06:40.53589	2013-06-28 01:06:40.53589
64054	72	15	7	2013-06-28 01:06:40.536585	2013-06-28 01:06:40.536585
64055	72	16	7	2013-06-28 01:06:40.5373	2013-06-28 01:06:40.5373
64056	72	17	7	2013-06-28 01:06:40.538046	2013-06-28 01:06:40.538046
64057	72	18	7	2013-06-28 01:06:40.538729	2013-06-28 01:06:40.538729
64058	72	19	7	2013-06-28 01:06:40.539467	2013-06-28 01:06:40.539467
64059	72	20	7	2013-06-28 01:06:40.540258	2013-06-28 01:06:40.540258
64060	72	21	7	2013-06-28 01:06:40.541187	2013-06-28 01:06:40.541187
64061	72	22	7	2013-06-28 01:06:40.542154	2013-06-28 01:06:40.542154
64062	72	23	7	2013-06-28 01:06:40.542914	2013-06-28 01:06:40.542914
64063	72	24	7	2013-06-28 01:06:40.543695	2013-06-28 01:06:40.543695
64064	72	25	7	2013-06-28 01:06:40.544521	2013-06-28 01:06:40.544521
64065	72	26	7	2013-06-28 01:06:40.545494	2013-06-28 01:06:40.545494
64066	72	27	7	2013-06-28 01:06:40.546253	2013-06-28 01:06:40.546253
64067	72	28	7	2013-06-28 01:06:40.546993	2013-06-28 01:06:40.546993
64068	72	32	7	2013-06-28 01:06:40.547704	2013-06-28 01:06:40.547704
64069	72	3	8	2013-06-28 01:06:40.548405	2013-06-28 01:06:40.548405
64070	72	4	8	2013-06-28 01:06:40.549321	2013-06-28 01:06:40.549321
64071	72	5	8	2013-06-28 01:06:40.550232	2013-06-28 01:06:40.550232
64072	72	6	8	2013-06-28 01:06:40.551168	2013-06-28 01:06:40.551168
64073	72	7	8	2013-06-28 01:06:40.552007	2013-06-28 01:06:40.552007
64074	72	8	8	2013-06-28 01:06:40.552823	2013-06-28 01:06:40.552823
64075	72	9	8	2013-06-28 01:06:40.553545	2013-06-28 01:06:40.553545
64076	72	10	8	2013-06-28 01:06:40.554351	2013-06-28 01:06:40.554351
64077	72	11	8	2013-06-28 01:06:40.555069	2013-06-28 01:06:40.555069
64078	72	12	8	2013-06-28 01:06:40.555779	2013-06-28 01:06:40.555779
64079	72	13	8	2013-06-28 01:06:40.556476	2013-06-28 01:06:40.556476
64080	72	14	8	2013-06-28 01:06:40.557324	2013-06-28 01:06:40.557324
64081	72	15	8	2013-06-28 01:06:40.558396	2013-06-28 01:06:40.558396
64082	72	16	8	2013-06-28 01:06:40.559551	2013-06-28 01:06:40.559551
64083	72	17	8	2013-06-28 01:06:40.560293	2013-06-28 01:06:40.560293
64084	72	18	8	2013-06-28 01:06:40.561124	2013-06-28 01:06:40.561124
64085	72	19	8	2013-06-28 01:06:40.562002	2013-06-28 01:06:40.562002
64086	72	20	8	2013-06-28 01:06:40.562812	2013-06-28 01:06:40.562812
64087	72	21	8	2013-06-28 01:06:40.56359	2013-06-28 01:06:40.56359
64088	72	22	8	2013-06-28 01:06:40.564741	2013-06-28 01:06:40.564741
64089	72	23	8	2013-06-28 01:06:40.593821	2013-06-28 01:06:40.593821
64090	72	24	8	2013-06-28 01:06:40.595076	2013-06-28 01:06:40.595076
64091	72	25	8	2013-06-28 01:06:40.595925	2013-06-28 01:06:40.595925
64092	72	26	8	2013-06-28 01:06:40.596781	2013-06-28 01:06:40.596781
64093	72	27	8	2013-06-28 01:06:40.597645	2013-06-28 01:06:40.597645
64094	72	28	8	2013-06-28 01:06:40.598371	2013-06-28 01:06:40.598371
64095	72	32	8	2013-06-28 01:06:40.600517	2013-06-28 01:06:40.600517
64096	72	3	9	2013-06-28 01:06:40.60313	2013-06-28 01:06:40.60313
64097	72	28	9	2013-06-28 01:06:40.6073	2013-06-28 01:06:40.6073
64098	72	32	9	2013-06-28 01:06:40.608671	2013-06-28 01:06:40.608671
64099	72	3	10	2013-06-28 01:06:40.60957	2013-06-28 01:06:40.60957
64100	72	28	10	2013-06-28 01:06:40.6104	2013-06-28 01:06:40.6104
64101	72	32	10	2013-06-28 01:06:40.611384	2013-06-28 01:06:40.611384
64102	72	3	11	2013-06-28 01:06:40.612441	2013-06-28 01:06:40.612441
64103	72	7	11	2013-06-28 01:06:40.613349	2013-06-28 01:06:40.613349
64104	72	8	11	2013-06-28 01:06:40.614153	2013-06-28 01:06:40.614153
64105	72	9	11	2013-06-28 01:06:40.61487	2013-06-28 01:06:40.61487
64106	72	10	11	2013-06-28 01:06:40.615571	2013-06-28 01:06:40.615571
64107	72	11	11	2013-06-28 01:06:40.61628	2013-06-28 01:06:40.61628
64108	72	12	11	2013-06-28 01:06:40.616986	2013-06-28 01:06:40.616986
64109	72	13	11	2013-06-28 01:06:40.617725	2013-06-28 01:06:40.617725
64110	72	14	11	2013-06-28 01:06:40.618413	2013-06-28 01:06:40.618413
64111	72	15	11	2013-06-28 01:06:40.619239	2013-06-28 01:06:40.619239
64112	72	16	11	2013-06-28 01:06:40.620002	2013-06-28 01:06:40.620002
64113	72	17	11	2013-06-28 01:06:40.620684	2013-06-28 01:06:40.620684
64114	72	18	11	2013-06-28 01:06:40.621412	2013-06-28 01:06:40.621412
64115	72	19	11	2013-06-28 01:06:40.622106	2013-06-28 01:06:40.622106
64116	72	20	11	2013-06-28 01:06:40.623095	2013-06-28 01:06:40.623095
64117	72	21	11	2013-06-28 01:06:40.624031	2013-06-28 01:06:40.624031
64118	72	22	11	2013-06-28 01:06:40.62522	2013-06-28 01:06:40.62522
64119	72	23	11	2013-06-28 01:06:40.626797	2013-06-28 01:06:40.626797
64120	72	24	11	2013-06-28 01:06:40.627931	2013-06-28 01:06:40.627931
64121	72	28	11	2013-06-28 01:06:40.629851	2013-06-28 01:06:40.629851
64122	72	32	11	2013-06-28 01:06:40.631033	2013-06-28 01:06:40.631033
64123	72	3	12	2013-06-28 01:06:40.632074	2013-06-28 01:06:40.632074
64124	72	7	12	2013-06-28 01:06:40.632851	2013-06-28 01:06:40.632851
64125	72	28	12	2013-06-28 01:06:40.637277	2013-06-28 01:06:40.637277
64126	72	32	12	2013-06-28 01:06:40.638041	2013-06-28 01:06:40.638041
64127	72	3	13	2013-06-28 01:06:40.639531	2013-06-28 01:06:40.639531
64128	72	7	13	2013-06-28 01:06:40.641048	2013-06-28 01:06:40.641048
64129	72	28	13	2013-06-28 01:06:40.642992	2013-06-28 01:06:40.642992
64130	72	32	13	2013-06-28 01:06:40.643744	2013-06-28 01:06:40.643744
64131	72	3	14	2013-06-28 01:06:40.644632	2013-06-28 01:06:40.644632
64132	72	7	14	2013-06-28 01:06:40.645642	2013-06-28 01:06:40.645642
64133	72	8	14	2013-06-28 01:06:40.646542	2013-06-28 01:06:40.646542
64134	72	9	14	2013-06-28 01:06:40.647449	2013-06-28 01:06:40.647449
64135	72	10	14	2013-06-28 01:06:40.64834	2013-06-28 01:06:40.64834
64136	72	11	14	2013-06-28 01:06:40.649064	2013-06-28 01:06:40.649064
64137	72	12	14	2013-06-28 01:06:40.649854	2013-06-28 01:06:40.649854
64138	72	13	14	2013-06-28 01:06:40.650579	2013-06-28 01:06:40.650579
64139	72	14	14	2013-06-28 01:06:40.651282	2013-06-28 01:06:40.651282
64140	72	15	14	2013-06-28 01:06:40.652003	2013-06-28 01:06:40.652003
64141	72	16	14	2013-06-28 01:06:40.652839	2013-06-28 01:06:40.652839
64142	72	17	14	2013-06-28 01:06:40.653578	2013-06-28 01:06:40.653578
64143	72	18	14	2013-06-28 01:06:40.654253	2013-06-28 01:06:40.654253
64144	72	19	14	2013-06-28 01:06:40.655012	2013-06-28 01:06:40.655012
64145	72	20	14	2013-06-28 01:06:40.655704	2013-06-28 01:06:40.655704
64146	72	21	14	2013-06-28 01:06:40.656381	2013-06-28 01:06:40.656381
64147	72	22	14	2013-06-28 01:06:40.657134	2013-06-28 01:06:40.657134
64148	72	23	14	2013-06-28 01:06:40.658046	2013-06-28 01:06:40.658046
64149	72	24	14	2013-06-28 01:06:40.658804	2013-06-28 01:06:40.658804
64150	72	25	14	2013-06-28 01:06:40.659527	2013-06-28 01:06:40.659527
64151	72	26	14	2013-06-28 01:06:40.660235	2013-06-28 01:06:40.660235
64152	72	27	14	2013-06-28 01:06:40.661021	2013-06-28 01:06:40.661021
64153	72	28	14	2013-06-28 01:06:40.662055	2013-06-28 01:06:40.662055
64154	72	32	14	2013-06-28 01:06:40.663048	2013-06-28 01:06:40.663048
64155	72	3	15	2013-06-28 01:06:40.663914	2013-06-28 01:06:40.663914
64156	72	32	15	2013-06-28 01:06:40.666208	2013-06-28 01:06:40.666208
64157	72	3	16	2013-06-28 01:06:40.667516	2013-06-28 01:06:40.667516
64158	72	32	16	2013-06-28 01:06:40.6693	2013-06-28 01:06:40.6693
64159	72	3	17	2013-06-28 01:06:40.670004	2013-06-28 01:06:40.670004
64160	72	32	17	2013-06-28 01:06:40.670764	2013-06-28 01:06:40.670764
64161	72	3	18	2013-06-28 01:06:40.671475	2013-06-28 01:06:40.671475
64162	72	4	18	2013-06-28 01:06:40.67221	2013-06-28 01:06:40.67221
64163	72	5	18	2013-06-28 01:06:40.672923	2013-06-28 01:06:40.672923
64164	72	6	18	2013-06-28 01:06:40.673634	2013-06-28 01:06:40.673634
64165	72	7	18	2013-06-28 01:06:40.67431	2013-06-28 01:06:40.67431
64166	72	8	18	2013-06-28 01:06:40.675224	2013-06-28 01:06:40.675224
64167	72	9	18	2013-06-28 01:06:40.676021	2013-06-28 01:06:40.676021
64168	72	10	18	2013-06-28 01:06:40.676781	2013-06-28 01:06:40.676781
64169	72	11	18	2013-06-28 01:06:40.677559	2013-06-28 01:06:40.677559
64170	72	12	18	2013-06-28 01:06:40.678465	2013-06-28 01:06:40.678465
64171	72	13	18	2013-06-28 01:06:40.679251	2013-06-28 01:06:40.679251
64172	72	14	18	2013-06-28 01:06:40.680059	2013-06-28 01:06:40.680059
64173	72	15	18	2013-06-28 01:06:40.680951	2013-06-28 01:06:40.680951
64174	72	16	18	2013-06-28 01:06:40.681737	2013-06-28 01:06:40.681737
64175	72	17	18	2013-06-28 01:06:40.682457	2013-06-28 01:06:40.682457
64176	72	18	18	2013-06-28 01:06:40.68317	2013-06-28 01:06:40.68317
64177	72	19	18	2013-06-28 01:06:40.683863	2013-06-28 01:06:40.683863
64178	72	20	18	2013-06-28 01:06:40.684576	2013-06-28 01:06:40.684576
64179	72	21	18	2013-06-28 01:06:40.685237	2013-06-28 01:06:40.685237
64180	72	22	18	2013-06-28 01:06:40.685932	2013-06-28 01:06:40.685932
64181	72	23	18	2013-06-28 01:06:40.686766	2013-06-28 01:06:40.686766
64182	72	24	18	2013-06-28 01:06:40.687545	2013-06-28 01:06:40.687545
64183	72	25	18	2013-06-28 01:06:40.688265	2013-06-28 01:06:40.688265
64184	72	26	18	2013-06-28 01:06:40.68921	2013-06-28 01:06:40.68921
64185	72	27	18	2013-06-28 01:06:40.689955	2013-06-28 01:06:40.689955
64186	72	28	18	2013-06-28 01:06:40.690774	2013-06-28 01:06:40.690774
64187	72	29	18	2013-06-28 01:06:40.691919	2013-06-28 01:06:40.691919
64188	72	30	18	2013-06-28 01:06:40.692725	2013-06-28 01:06:40.692725
64189	72	31	18	2013-06-28 01:06:40.693487	2013-06-28 01:06:40.693487
64190	72	32	18	2013-06-28 01:06:40.694222	2013-06-28 01:06:40.694222
64695	75	12	9	2013-06-28 15:38:50.033008	2013-06-28 15:38:50.033008
64696	75	13	9	2013-06-28 15:38:50.034128	2013-06-28 15:38:50.034128
64697	75	22	9	2013-06-28 15:38:50.038146	2013-06-28 15:38:50.038146
64698	75	23	9	2013-06-28 15:38:50.039076	2013-06-28 15:38:50.039076
64699	75	12	10	2013-06-28 15:38:50.039939	2013-06-28 15:38:50.039939
64700	75	13	10	2013-06-28 15:38:50.04091	2013-06-28 15:38:50.04091
64701	75	22	10	2013-06-28 15:38:50.043653	2013-06-28 15:38:50.043653
64702	75	23	10	2013-06-28 15:38:50.04449	2013-06-28 15:38:50.04449
64703	75	10	11	2013-06-28 15:38:50.045593	2013-06-28 15:38:50.045593
64704	75	11	11	2013-06-28 15:38:50.046432	2013-06-28 15:38:50.046432
64705	75	12	11	2013-06-28 15:38:50.04722	2013-06-28 15:38:50.04722
64706	75	13	11	2013-06-28 15:38:50.048029	2013-06-28 15:38:50.048029
64707	75	22	11	2013-06-28 15:38:50.050555	2013-06-28 15:38:50.050555
64708	75	23	11	2013-06-28 15:38:50.05135	2013-06-28 15:38:50.05135
64709	75	24	11	2013-06-28 15:38:50.052087	2013-06-28 15:38:50.052087
64710	75	25	11	2013-06-28 15:38:50.053242	2013-06-28 15:38:50.053242
64711	75	10	12	2013-06-28 15:38:50.05421	2013-06-28 15:38:50.05421
64712	75	11	12	2013-06-28 15:38:50.055171	2013-06-28 15:38:50.055171
64713	75	24	12	2013-06-28 15:38:50.057893	2013-06-28 15:38:50.057893
64714	75	25	12	2013-06-28 15:38:50.05871	2013-06-28 15:38:50.05871
64715	75	8	13	2013-06-28 15:38:50.059582	2013-06-28 15:38:50.059582
64716	75	9	13	2013-06-28 15:38:50.060408	2013-06-28 15:38:50.060408
64717	75	10	13	2013-06-28 15:38:50.061328	2013-06-28 15:38:50.061328
64718	75	11	13	2013-06-28 15:38:50.062101	2013-06-28 15:38:50.062101
64719	75	24	13	2013-06-28 15:38:50.063202	2013-06-28 15:38:50.063202
64720	75	25	13	2013-06-28 15:38:50.063988	2013-06-28 15:38:50.063988
64721	75	26	13	2013-06-28 15:38:50.064791	2013-06-28 15:38:50.064791
64722	75	27	13	2013-06-28 15:38:50.065589	2013-06-28 15:38:50.065589
64723	75	8	14	2013-06-28 15:38:50.066354	2013-06-28 15:38:50.066354
64724	75	9	14	2013-06-28 15:38:50.067133	2013-06-28 15:38:50.067133
64725	75	26	14	2013-06-28 15:38:50.071855	2013-06-28 15:38:50.071855
64726	75	27	14	2013-06-28 15:38:50.072687	2013-06-28 15:38:50.072687
64727	75	8	15	2013-06-28 15:38:50.073498	2013-06-28 15:38:50.073498
64728	75	9	15	2013-06-28 15:38:50.074372	2013-06-28 15:38:50.074372
64729	75	26	15	2013-06-28 15:38:50.075478	2013-06-28 15:38:50.075478
64730	75	27	15	2013-06-28 15:38:50.076569	2013-06-28 15:38:50.076569
64731	75	8	16	2013-06-28 15:38:50.077458	2013-06-28 15:38:50.077458
64732	75	9	16	2013-06-28 15:38:50.078221	2013-06-28 15:38:50.078221
64733	75	26	16	2013-06-28 15:38:50.079147	2013-06-28 15:38:50.079147
64734	75	27	16	2013-06-28 15:38:50.080194	2013-06-28 15:38:50.080194
64735	75	8	17	2013-06-28 15:38:50.081043	2013-06-28 15:38:50.081043
64736	75	9	17	2013-06-28 15:38:50.081877	2013-06-28 15:38:50.081877
64737	75	26	17	2013-06-28 15:38:50.083071	2013-06-28 15:38:50.083071
64738	75	27	17	2013-06-28 15:38:50.08451	2013-06-28 15:38:50.08451
64739	75	8	18	2013-06-28 15:38:50.085987	2013-06-28 15:38:50.085987
64740	75	9	18	2013-06-28 15:38:50.08695	2013-06-28 15:38:50.08695
64741	75	26	18	2013-06-28 15:38:50.087802	2013-06-28 15:38:50.087802
64742	75	27	18	2013-06-28 15:38:50.088691	2013-06-28 15:38:50.088691
64743	75	8	19	2013-06-28 15:38:50.089461	2013-06-28 15:38:50.089461
64744	75	9	19	2013-06-28 15:38:50.0903	2013-06-28 15:38:50.0903
64745	75	26	19	2013-06-28 15:38:50.092806	2013-06-28 15:38:50.092806
64746	75	27	19	2013-06-28 15:38:50.093899	2013-06-28 15:38:50.093899
64747	75	5	20	2013-06-28 15:38:50.094855	2013-06-28 15:38:50.094855
64748	75	6	20	2013-06-28 15:38:50.095664	2013-06-28 15:38:50.095664
64749	75	7	20	2013-06-28 15:38:50.096486	2013-06-28 15:38:50.096486
64750	75	8	20	2013-06-28 15:38:50.097307	2013-06-28 15:38:50.097307
64751	75	9	20	2013-06-28 15:38:50.098069	2013-06-28 15:38:50.098069
64752	75	10	20	2013-06-28 15:38:50.098822	2013-06-28 15:38:50.098822
64753	75	11	20	2013-06-28 15:38:50.099542	2013-06-28 15:38:50.099542
64754	75	12	20	2013-06-28 15:38:50.10027	2013-06-28 15:38:50.10027
64755	75	23	20	2013-06-28 15:38:50.101129	2013-06-28 15:38:50.101129
64756	75	24	20	2013-06-28 15:38:50.101965	2013-06-28 15:38:50.101965
64757	75	25	20	2013-06-28 15:38:50.10279	2013-06-28 15:38:50.10279
64758	75	26	20	2013-06-28 15:38:50.103568	2013-06-28 15:38:50.103568
64759	75	27	20	2013-06-28 15:38:50.104326	2013-06-28 15:38:50.104326
64760	75	28	20	2013-06-28 15:38:50.105051	2013-06-28 15:38:50.105051
64761	75	29	20	2013-06-28 15:38:50.105801	2013-06-28 15:38:50.105801
64762	75	30	20	2013-06-28 15:38:50.106502	2013-06-28 15:38:50.106502
64763	75	5	21	2013-06-28 15:38:50.107257	2013-06-28 15:38:50.107257
64764	75	6	21	2013-06-28 15:38:50.108001	2013-06-28 15:38:50.108001
64765	75	7	21	2013-06-28 15:38:50.109042	2013-06-28 15:38:50.109042
64766	75	8	21	2013-06-28 15:38:50.110321	2013-06-28 15:38:50.110321
64767	75	9	21	2013-06-28 15:38:50.111271	2013-06-28 15:38:50.111271
64768	75	10	21	2013-06-28 15:38:50.112171	2013-06-28 15:38:50.112171
64769	75	11	21	2013-06-28 15:38:50.113227	2013-06-28 15:38:50.113227
64770	75	12	21	2013-06-28 15:38:50.114212	2013-06-28 15:38:50.114212
64771	75	23	21	2013-06-28 15:38:50.115114	2013-06-28 15:38:50.115114
64772	75	24	21	2013-06-28 15:38:50.115984	2013-06-28 15:38:50.115984
64773	75	25	21	2013-06-28 15:38:50.116975	2013-06-28 15:38:50.116975
64774	75	26	21	2013-06-28 15:38:50.117973	2013-06-28 15:38:50.117973
64775	75	27	21	2013-06-28 15:38:50.118887	2013-06-28 15:38:50.118887
64776	75	28	21	2013-06-28 15:38:50.119648	2013-06-28 15:38:50.119648
64777	75	29	21	2013-06-28 15:38:50.120401	2013-06-28 15:38:50.120401
64778	75	30	21	2013-06-28 15:38:50.121132	2013-06-28 15:38:50.121132
66656	78	0	6	2013-06-28 16:15:00.764551	2013-06-28 16:15:00.764551
66657	78	1	6	2013-06-28 16:15:00.765337	2013-06-28 16:15:00.765337
66658	78	2	6	2013-06-28 16:15:00.766044	2013-06-28 16:15:00.766044
66659	78	3	6	2013-06-28 16:15:00.767086	2013-06-28 16:15:00.767086
66660	78	4	6	2013-06-28 16:15:00.767796	2013-06-28 16:15:00.767796
66661	78	5	6	2013-06-28 16:15:00.768517	2013-06-28 16:15:00.768517
66662	78	6	6	2013-06-28 16:15:00.769223	2013-06-28 16:15:00.769223
66663	78	7	6	2013-06-28 16:15:00.770099	2013-06-28 16:15:00.770099
66664	78	8	6	2013-06-28 16:15:00.771049	2013-06-28 16:15:00.771049
66665	78	9	6	2013-06-28 16:15:00.771851	2013-06-28 16:15:00.771851
66666	78	10	6	2013-06-28 16:15:00.773309	2013-06-28 16:15:00.773309
66667	78	11	6	2013-06-28 16:15:00.774103	2013-06-28 16:15:00.774103
66668	78	12	6	2013-06-28 16:15:00.774884	2013-06-28 16:15:00.774884
66669	78	15	6	2013-06-28 16:15:00.775578	2013-06-28 16:15:00.775578
66670	78	16	6	2013-06-28 16:15:00.776285	2013-06-28 16:15:00.776285
66671	78	17	6	2013-06-28 16:15:00.777059	2013-06-28 16:15:00.777059
66672	78	18	6	2013-06-28 16:15:00.777826	2013-06-28 16:15:00.777826
66673	78	19	6	2013-06-28 16:15:00.778751	2013-06-28 16:15:00.778751
66674	78	20	6	2013-06-28 16:15:00.780372	2013-06-28 16:15:00.780372
66675	78	21	6	2013-06-28 16:15:00.781892	2013-06-28 16:15:00.781892
66676	78	22	6	2013-06-28 16:15:00.782906	2013-06-28 16:15:00.782906
66677	78	23	6	2013-06-28 16:15:00.783669	2013-06-28 16:15:00.783669
66678	78	24	6	2013-06-28 16:15:00.784492	2013-06-28 16:15:00.784492
66679	78	25	6	2013-06-28 16:15:00.785213	2013-06-28 16:15:00.785213
66680	78	26	6	2013-06-28 16:15:00.785948	2013-06-28 16:15:00.785948
66681	78	27	6	2013-06-28 16:15:00.786656	2013-06-28 16:15:00.786656
66682	78	28	6	2013-06-28 16:15:00.78752	2013-06-28 16:15:00.78752
66683	78	29	6	2013-06-28 16:15:00.788369	2013-06-28 16:15:00.788369
66684	78	30	6	2013-06-28 16:15:00.789209	2013-06-28 16:15:00.789209
66685	78	31	6	2013-06-28 16:15:00.789964	2013-06-28 16:15:00.789964
66686	78	32	6	2013-06-28 16:15:00.790674	2013-06-28 16:15:00.790674
66687	78	33	6	2013-06-28 16:15:00.791769	2013-06-28 16:15:00.791769
66688	78	34	6	2013-06-28 16:15:00.792482	2013-06-28 16:15:00.792482
66689	78	35	6	2013-06-28 16:15:00.793248	2013-06-28 16:15:00.793248
66690	78	0	7	2013-06-28 16:15:00.794079	2013-06-28 16:15:00.794079
66691	78	1	7	2013-06-28 16:15:00.794823	2013-06-28 16:15:00.794823
66692	78	2	7	2013-06-28 16:15:00.796132	2013-06-28 16:15:00.796132
66693	78	3	7	2013-06-28 16:15:00.797167	2013-06-28 16:15:00.797167
66694	78	4	7	2013-06-28 16:15:00.797973	2013-06-28 16:15:00.797973
66695	78	5	7	2013-06-28 16:15:00.79891	2013-06-28 16:15:00.79891
66696	78	6	7	2013-06-28 16:15:00.799674	2013-06-28 16:15:00.799674
66697	78	7	7	2013-06-28 16:15:00.800481	2013-06-28 16:15:00.800481
66698	78	8	7	2013-06-28 16:15:00.801636	2013-06-28 16:15:00.801636
66699	78	9	7	2013-06-28 16:15:00.832069	2013-06-28 16:15:00.832069
66700	78	10	7	2013-06-28 16:15:00.833137	2013-06-28 16:15:00.833137
66701	78	11	7	2013-06-28 16:15:00.83388	2013-06-28 16:15:00.83388
66702	78	12	7	2013-06-28 16:15:00.834633	2013-06-28 16:15:00.834633
66703	78	15	7	2013-06-28 16:15:00.835398	2013-06-28 16:15:00.835398
66704	78	16	7	2013-06-28 16:15:00.836116	2013-06-28 16:15:00.836116
66705	78	17	7	2013-06-28 16:15:00.836859	2013-06-28 16:15:00.836859
66706	78	18	7	2013-06-28 16:15:00.837592	2013-06-28 16:15:00.837592
66707	78	19	7	2013-06-28 16:15:00.838351	2013-06-28 16:15:00.838351
66708	78	20	7	2013-06-28 16:15:00.839151	2013-06-28 16:15:00.839151
66709	78	21	7	2013-06-28 16:15:00.839954	2013-06-28 16:15:00.839954
66710	78	22	7	2013-06-28 16:15:00.840686	2013-06-28 16:15:00.840686
66711	78	23	7	2013-06-28 16:15:00.841406	2013-06-28 16:15:00.841406
66712	78	24	7	2013-06-28 16:15:00.842133	2013-06-28 16:15:00.842133
66713	78	25	7	2013-06-28 16:15:00.842926	2013-06-28 16:15:00.842926
66714	78	26	7	2013-06-28 16:15:00.843752	2013-06-28 16:15:00.843752
66715	78	27	7	2013-06-28 16:15:00.844471	2013-06-28 16:15:00.844471
66716	78	28	7	2013-06-28 16:15:00.845393	2013-06-28 16:15:00.845393
66717	78	29	7	2013-06-28 16:15:00.84657	2013-06-28 16:15:00.84657
66718	78	30	7	2013-06-28 16:15:00.847514	2013-06-28 16:15:00.847514
66719	78	31	7	2013-06-28 16:15:00.848442	2013-06-28 16:15:00.848442
66720	78	32	7	2013-06-28 16:15:00.849219	2013-06-28 16:15:00.849219
66721	78	33	7	2013-06-28 16:15:00.850002	2013-06-28 16:15:00.850002
66722	78	34	7	2013-06-28 16:15:00.850753	2013-06-28 16:15:00.850753
66723	78	35	7	2013-06-28 16:15:00.851482	2013-06-28 16:15:00.851482
66724	78	8	8	2013-06-28 16:15:00.852302	2013-06-28 16:15:00.852302
66725	78	9	8	2013-06-28 16:15:00.853263	2013-06-28 16:15:00.853263
66726	78	10	8	2013-06-28 16:15:00.854185	2013-06-28 16:15:00.854185
66727	78	8	9	2013-06-28 16:15:00.856631	2013-06-28 16:15:00.856631
66728	78	9	9	2013-06-28 16:15:00.857328	2013-06-28 16:15:00.857328
66729	78	10	9	2013-06-28 16:15:00.858057	2013-06-28 16:15:00.858057
66730	78	8	10	2013-06-28 16:15:00.858799	2013-06-28 16:15:00.858799
66731	78	9	10	2013-06-28 16:15:00.859514	2013-06-28 16:15:00.859514
66732	78	10	10	2013-06-28 16:15:00.86023	2013-06-28 16:15:00.86023
66733	78	8	11	2013-06-28 16:15:00.861169	2013-06-28 16:15:00.861169
66734	78	9	11	2013-06-28 16:15:00.862311	2013-06-28 16:15:00.862311
66735	78	10	11	2013-06-28 16:15:00.863897	2013-06-28 16:15:00.863897
66736	78	8	12	2013-06-28 16:15:00.865343	2013-06-28 16:15:00.865343
66737	78	9	12	2013-06-28 16:15:00.866384	2013-06-28 16:15:00.866384
66738	78	10	12	2013-06-28 16:15:00.86727	2013-06-28 16:15:00.86727
66739	78	18	13	2013-06-28 16:15:00.870443	2013-06-28 16:15:00.870443
66740	78	19	13	2013-06-28 16:15:00.871199	2013-06-28 16:15:00.871199
66741	78	20	13	2013-06-28 16:15:00.871966	2013-06-28 16:15:00.871966
66742	78	21	13	2013-06-28 16:15:00.872793	2013-06-28 16:15:00.872793
66743	78	22	13	2013-06-28 16:15:00.873573	2013-06-28 16:15:00.873573
66744	78	23	13	2013-06-28 16:15:00.874275	2013-06-28 16:15:00.874275
66745	78	26	13	2013-06-28 16:15:00.875917	2013-06-28 16:15:00.875917
66746	78	27	13	2013-06-28 16:15:00.876681	2013-06-28 16:15:00.876681
66747	78	28	13	2013-06-28 16:15:00.877517	2013-06-28 16:15:00.877517
66748	78	29	13	2013-06-28 16:15:00.878351	2013-06-28 16:15:00.878351
66749	78	30	13	2013-06-28 16:15:00.879671	2013-06-28 16:15:00.879671
66750	78	31	13	2013-06-28 16:15:00.881243	2013-06-28 16:15:00.881243
66751	78	32	13	2013-06-28 16:15:00.882331	2013-06-28 16:15:00.882331
66752	78	33	13	2013-06-28 16:15:00.883477	2013-06-28 16:15:00.883477
66753	78	34	13	2013-06-28 16:15:00.884282	2013-06-28 16:15:00.884282
66754	78	35	13	2013-06-28 16:15:00.885584	2013-06-28 16:15:00.885584
66755	78	18	14	2013-06-28 16:15:00.888224	2013-06-28 16:15:00.888224
66756	78	19	14	2013-06-28 16:15:00.888938	2013-06-28 16:15:00.888938
66757	78	20	14	2013-06-28 16:15:00.889647	2013-06-28 16:15:00.889647
66758	78	21	14	2013-06-28 16:15:00.890376	2013-06-28 16:15:00.890376
66759	78	22	14	2013-06-28 16:15:00.891054	2013-06-28 16:15:00.891054
66760	78	23	14	2013-06-28 16:15:00.891763	2013-06-28 16:15:00.891763
66761	78	26	14	2013-06-28 16:15:00.892486	2013-06-28 16:15:00.892486
66762	78	27	14	2013-06-28 16:15:00.893204	2013-06-28 16:15:00.893204
66763	78	28	14	2013-06-28 16:15:00.894415	2013-06-28 16:15:00.894415
66764	78	29	14	2013-06-28 16:15:00.895608	2013-06-28 16:15:00.895608
66765	78	30	14	2013-06-28 16:15:00.896427	2013-06-28 16:15:00.896427
66766	78	31	14	2013-06-28 16:15:00.897332	2013-06-28 16:15:00.897332
66767	78	32	14	2013-06-28 16:15:00.898114	2013-06-28 16:15:00.898114
66768	78	33	14	2013-06-28 16:15:00.898945	2013-06-28 16:15:00.898945
66769	78	34	14	2013-06-28 16:15:00.900045	2013-06-28 16:15:00.900045
66770	78	35	14	2013-06-28 16:15:00.900915	2013-06-28 16:15:00.900915
66771	78	8	15	2013-06-28 16:15:00.901761	2013-06-28 16:15:00.901761
66772	78	9	15	2013-06-28 16:15:00.902709	2013-06-28 16:15:00.902709
66773	78	10	15	2013-06-28 16:15:00.903618	2013-06-28 16:15:00.903618
66774	78	18	15	2013-06-28 16:15:00.904925	2013-06-28 16:15:00.904925
66775	78	19	15	2013-06-28 16:15:00.90594	2013-06-28 16:15:00.90594
66776	78	8	16	2013-06-28 16:15:00.907815	2013-06-28 16:15:00.907815
66777	78	9	16	2013-06-28 16:15:00.908578	2013-06-28 16:15:00.908578
66778	78	10	16	2013-06-28 16:15:00.909252	2013-06-28 16:15:00.909252
66779	78	18	16	2013-06-28 16:15:00.910899	2013-06-28 16:15:00.910899
66780	78	19	16	2013-06-28 16:15:00.911641	2013-06-28 16:15:00.911641
66781	78	8	17	2013-06-28 16:15:00.912458	2013-06-28 16:15:00.912458
66782	78	9	17	2013-06-28 16:15:00.913177	2013-06-28 16:15:00.913177
66783	78	10	17	2013-06-28 16:15:00.913881	2013-06-28 16:15:00.913881
66784	78	18	17	2013-06-28 16:15:00.914707	2013-06-28 16:15:00.914707
66785	78	19	17	2013-06-28 16:15:00.915749	2013-06-28 16:15:00.915749
66786	78	8	18	2013-06-28 16:15:00.916702	2013-06-28 16:15:00.916702
66787	78	9	18	2013-06-28 16:15:00.918274	2013-06-28 16:15:00.918274
66788	78	10	18	2013-06-28 16:15:00.919789	2013-06-28 16:15:00.919789
66789	78	18	18	2013-06-28 16:15:00.920753	2013-06-28 16:15:00.920753
66790	78	19	18	2013-06-28 16:15:00.921482	2013-06-28 16:15:00.921482
66791	78	8	19	2013-06-28 16:15:00.924035	2013-06-28 16:15:00.924035
66792	78	9	19	2013-06-28 16:15:00.924779	2013-06-28 16:15:00.924779
66793	78	10	19	2013-06-28 16:15:00.925545	2013-06-28 16:15:00.925545
66794	78	18	19	2013-06-28 16:15:00.926285	2013-06-28 16:15:00.926285
66795	78	19	19	2013-06-28 16:15:00.927018	2013-06-28 16:15:00.927018
66796	78	8	20	2013-06-28 16:15:00.92774	2013-06-28 16:15:00.92774
66797	78	9	20	2013-06-28 16:15:00.928575	2013-06-28 16:15:00.928575
66798	78	10	20	2013-06-28 16:15:00.929442	2013-06-28 16:15:00.929442
66799	78	18	20	2013-06-28 16:15:00.9302	2013-06-28 16:15:00.9302
66800	78	19	20	2013-06-28 16:15:00.93093	2013-06-28 16:15:00.93093
66801	78	8	21	2013-06-28 16:15:00.931695	2013-06-28 16:15:00.931695
66802	78	9	21	2013-06-28 16:15:00.932544	2013-06-28 16:15:00.932544
66803	78	10	21	2013-06-28 16:15:00.93381	2013-06-28 16:15:00.93381
66804	78	18	21	2013-06-28 16:15:00.934577	2013-06-28 16:15:00.934577
66805	78	19	21	2013-06-28 16:15:00.935406	2013-06-28 16:15:00.935406
66846	77	0	14	2013-06-28 17:08:44.090286	2013-06-28 17:08:44.090286
66847	77	1	14	2013-06-28 17:08:44.092332	2013-06-28 17:08:44.092332
66848	77	2	14	2013-06-28 17:08:44.09345	2013-06-28 17:08:44.09345
66849	77	3	14	2013-06-28 17:08:44.094579	2013-06-28 17:08:44.094579
66850	77	4	14	2013-06-28 17:08:44.095526	2013-06-28 17:08:44.095526
66851	77	5	14	2013-06-28 17:08:44.096215	2013-06-28 17:08:44.096215
66852	77	6	14	2013-06-28 17:08:44.096869	2013-06-28 17:08:44.096869
66853	77	7	14	2013-06-28 17:08:44.097512	2013-06-28 17:08:44.097512
66854	77	8	14	2013-06-28 17:08:44.098194	2013-06-28 17:08:44.098194
66855	77	9	14	2013-06-28 17:08:44.098877	2013-06-28 17:08:44.098877
66856	77	10	14	2013-06-28 17:08:44.09955	2013-06-28 17:08:44.09955
66857	77	11	14	2013-06-28 17:08:44.100189	2013-06-28 17:08:44.100189
66858	77	12	14	2013-06-28 17:08:44.100822	2013-06-28 17:08:44.100822
66859	77	13	14	2013-06-28 17:08:44.101452	2013-06-28 17:08:44.101452
66860	77	14	14	2013-06-28 17:08:44.102087	2013-06-28 17:08:44.102087
66861	77	15	14	2013-06-28 17:08:44.102801	2013-06-28 17:08:44.102801
66862	77	16	14	2013-06-28 17:08:44.103514	2013-06-28 17:08:44.103514
66863	77	17	14	2013-06-28 17:08:44.104339	2013-06-28 17:08:44.104339
66864	77	18	14	2013-06-28 17:08:44.10514	2013-06-28 17:08:44.10514
66865	77	19	14	2013-06-28 17:08:44.105845	2013-06-28 17:08:44.105845
66866	77	20	14	2013-06-28 17:08:44.106538	2013-06-28 17:08:44.106538
66867	77	21	14	2013-06-28 17:08:44.107196	2013-06-28 17:08:44.107196
66868	77	22	14	2013-06-28 17:08:44.108098	2013-06-28 17:08:44.108098
66869	77	23	14	2013-06-28 17:08:44.109111	2013-06-28 17:08:44.109111
66870	77	24	14	2013-06-28 17:08:44.109913	2013-06-28 17:08:44.109913
66871	77	25	14	2013-06-28 17:08:44.1107	2013-06-28 17:08:44.1107
66872	77	26	14	2013-06-28 17:08:44.111522	2013-06-28 17:08:44.111522
66873	77	27	14	2013-06-28 17:08:44.112428	2013-06-28 17:08:44.112428
66874	77	28	14	2013-06-28 17:08:44.11375	2013-06-28 17:08:44.11375
66875	77	29	14	2013-06-28 17:08:44.114986	2013-06-28 17:08:44.114986
66876	77	30	14	2013-06-28 17:08:44.115903	2013-06-28 17:08:44.115903
66877	77	31	14	2013-06-28 17:08:44.116661	2013-06-28 17:08:44.116661
66878	77	32	14	2013-06-28 17:08:44.117325	2013-06-28 17:08:44.117325
66879	77	33	14	2013-06-28 17:08:44.117985	2013-06-28 17:08:44.117985
66880	77	34	14	2013-06-28 17:08:44.118673	2013-06-28 17:08:44.118673
66881	77	35	14	2013-06-28 17:08:44.119412	2013-06-28 17:08:44.119412
66882	77	0	15	2013-06-28 17:08:44.120177	2013-06-28 17:08:44.120177
66883	77	1	15	2013-06-28 17:08:44.168447	2013-06-28 17:08:44.168447
66884	77	2	15	2013-06-28 17:08:44.169303	2013-06-28 17:08:44.169303
66885	77	3	15	2013-06-28 17:08:44.170054	2013-06-28 17:08:44.170054
66886	77	4	15	2013-06-28 17:08:44.170941	2013-06-28 17:08:44.170941
66887	77	5	15	2013-06-28 17:08:44.17176	2013-06-28 17:08:44.17176
66888	77	6	15	2013-06-28 17:08:44.172459	2013-06-28 17:08:44.172459
66889	77	7	15	2013-06-28 17:08:44.173126	2013-06-28 17:08:44.173126
66890	77	8	15	2013-06-28 17:08:44.173844	2013-06-28 17:08:44.173844
66891	77	9	15	2013-06-28 17:08:44.174527	2013-06-28 17:08:44.174527
66892	77	10	15	2013-06-28 17:08:44.175324	2013-06-28 17:08:44.175324
66893	77	11	15	2013-06-28 17:08:44.176363	2013-06-28 17:08:44.176363
66894	77	12	15	2013-06-28 17:08:44.177528	2013-06-28 17:08:44.177528
66895	77	13	15	2013-06-28 17:08:44.17868	2013-06-28 17:08:44.17868
66896	77	14	15	2013-06-28 17:08:44.180064	2013-06-28 17:08:44.180064
66897	77	15	15	2013-06-28 17:08:44.181289	2013-06-28 17:08:44.181289
66898	77	16	15	2013-06-28 17:08:44.182213	2013-06-28 17:08:44.182213
66899	77	17	15	2013-06-28 17:08:44.183379	2013-06-28 17:08:44.183379
66900	77	18	15	2013-06-28 17:08:44.184841	2013-06-28 17:08:44.184841
66901	77	19	15	2013-06-28 17:08:44.185869	2013-06-28 17:08:44.185869
66902	77	20	15	2013-06-28 17:08:44.186698	2013-06-28 17:08:44.186698
66903	77	21	15	2013-06-28 17:08:44.187452	2013-06-28 17:08:44.187452
66904	77	22	15	2013-06-28 17:08:44.188295	2013-06-28 17:08:44.188295
66905	77	23	15	2013-06-28 17:08:44.189059	2013-06-28 17:08:44.189059
66906	77	24	15	2013-06-28 17:08:44.190197	2013-06-28 17:08:44.190197
66907	77	25	15	2013-06-28 17:08:44.190953	2013-06-28 17:08:44.190953
66908	77	26	15	2013-06-28 17:08:44.191864	2013-06-28 17:08:44.191864
66909	77	27	15	2013-06-28 17:08:44.192671	2013-06-28 17:08:44.192671
66910	77	28	15	2013-06-28 17:08:44.193396	2013-06-28 17:08:44.193396
66911	77	29	15	2013-06-28 17:08:44.194102	2013-06-28 17:08:44.194102
66912	77	30	15	2013-06-28 17:08:44.194834	2013-06-28 17:08:44.194834
66913	77	31	15	2013-06-28 17:08:44.195699	2013-06-28 17:08:44.195699
66914	77	32	15	2013-06-28 17:08:44.196742	2013-06-28 17:08:44.196742
66915	77	33	15	2013-06-28 17:08:44.198273	2013-06-28 17:08:44.198273
66916	77	34	15	2013-06-28 17:08:44.199311	2013-06-28 17:08:44.199311
66917	77	35	15	2013-06-28 17:08:44.200216	2013-06-28 17:08:44.200216
66918	77	0	16	2013-06-28 17:08:44.201086	2013-06-28 17:08:44.201086
66919	77	1	16	2013-06-28 17:08:44.201939	2013-06-28 17:08:44.201939
66920	77	6	16	2013-06-28 17:08:44.202723	2013-06-28 17:08:44.202723
66921	77	8	16	2013-06-28 17:08:44.20342	2013-06-28 17:08:44.20342
66922	77	9	16	2013-06-28 17:08:44.204215	2013-06-28 17:08:44.204215
66923	77	11	16	2013-06-28 17:08:44.205	2013-06-28 17:08:44.205
66924	77	12	16	2013-06-28 17:08:44.205747	2013-06-28 17:08:44.205747
66925	77	13	16	2013-06-28 17:08:44.206453	2013-06-28 17:08:44.206453
66926	77	18	16	2013-06-28 17:08:44.207207	2013-06-28 17:08:44.207207
66927	77	20	16	2013-06-28 17:08:44.207902	2013-06-28 17:08:44.207902
66928	77	21	16	2013-06-28 17:08:44.208696	2013-06-28 17:08:44.208696
66929	77	23	16	2013-06-28 17:08:44.209431	2013-06-28 17:08:44.209431
66930	77	24	16	2013-06-28 17:08:44.210078	2013-06-28 17:08:44.210078
66931	77	25	16	2013-06-28 17:08:44.2108	2013-06-28 17:08:44.2108
66932	77	30	16	2013-06-28 17:08:44.21171	2013-06-28 17:08:44.21171
66933	77	32	16	2013-06-28 17:08:44.212704	2013-06-28 17:08:44.212704
66934	77	33	16	2013-06-28 17:08:44.213394	2013-06-28 17:08:44.213394
66935	77	35	16	2013-06-28 17:08:44.214039	2013-06-28 17:08:44.214039
66936	77	0	17	2013-06-28 17:08:44.21468	2013-06-28 17:08:44.21468
66937	77	1	17	2013-06-28 17:08:44.215459	2013-06-28 17:08:44.215459
66938	77	3	17	2013-06-28 17:08:44.216409	2013-06-28 17:08:44.216409
66939	77	4	17	2013-06-28 17:08:44.217426	2013-06-28 17:08:44.217426
66940	77	6	17	2013-06-28 17:08:44.218417	2013-06-28 17:08:44.218417
66941	77	8	17	2013-06-28 17:08:44.219277	2013-06-28 17:08:44.219277
66942	77	9	17	2013-06-28 17:08:44.220102	2013-06-28 17:08:44.220102
66943	77	11	17	2013-06-28 17:08:44.220936	2013-06-28 17:08:44.220936
66944	77	12	17	2013-06-28 17:08:44.22167	2013-06-28 17:08:44.22167
66945	77	13	17	2013-06-28 17:08:44.222357	2013-06-28 17:08:44.222357
66946	77	15	17	2013-06-28 17:08:44.223028	2013-06-28 17:08:44.223028
66947	77	16	17	2013-06-28 17:08:44.223699	2013-06-28 17:08:44.223699
66948	77	18	17	2013-06-28 17:08:44.224478	2013-06-28 17:08:44.224478
66949	77	20	17	2013-06-28 17:08:44.225517	2013-06-28 17:08:44.225517
66950	77	21	17	2013-06-28 17:08:44.226469	2013-06-28 17:08:44.226469
66951	77	23	17	2013-06-28 17:08:44.227151	2013-06-28 17:08:44.227151
66952	77	24	17	2013-06-28 17:08:44.227911	2013-06-28 17:08:44.227911
66953	77	25	17	2013-06-28 17:08:44.228822	2013-06-28 17:08:44.228822
66954	77	27	17	2013-06-28 17:08:44.229548	2013-06-28 17:08:44.229548
66955	77	28	17	2013-06-28 17:08:44.230193	2013-06-28 17:08:44.230193
66956	77	30	17	2013-06-28 17:08:44.230837	2013-06-28 17:08:44.230837
66957	77	32	17	2013-06-28 17:08:44.231474	2013-06-28 17:08:44.231474
66958	77	33	17	2013-06-28 17:08:44.232109	2013-06-28 17:08:44.232109
66959	77	35	17	2013-06-28 17:08:44.232783	2013-06-28 17:08:44.232783
66960	77	0	18	2013-06-28 17:08:44.233569	2013-06-28 17:08:44.233569
66961	77	1	18	2013-06-28 17:08:44.234376	2013-06-28 17:08:44.234376
66962	77	6	18	2013-06-28 17:08:44.235145	2013-06-28 17:08:44.235145
66963	77	11	18	2013-06-28 17:08:44.235978	2013-06-28 17:08:44.235978
66964	77	12	18	2013-06-28 17:08:44.237025	2013-06-28 17:08:44.237025
66965	77	13	18	2013-06-28 17:08:44.237864	2013-06-28 17:08:44.237864
66966	77	18	18	2013-06-28 17:08:44.238576	2013-06-28 17:08:44.238576
66967	77	23	18	2013-06-28 17:08:44.239234	2013-06-28 17:08:44.239234
66968	77	24	18	2013-06-28 17:08:44.239889	2013-06-28 17:08:44.239889
66969	77	25	18	2013-06-28 17:08:44.240637	2013-06-28 17:08:44.240637
66970	77	30	18	2013-06-28 17:08:44.24151	2013-06-28 17:08:44.24151
66971	77	35	18	2013-06-28 17:08:44.242409	2013-06-28 17:08:44.242409
66972	77	0	19	2013-06-28 17:08:44.243122	2013-06-28 17:08:44.243122
66973	77	1	19	2013-06-28 17:08:44.243766	2013-06-28 17:08:44.243766
66974	77	3	19	2013-06-28 17:08:44.24489	2013-06-28 17:08:44.24489
66975	77	4	19	2013-06-28 17:08:44.246123	2013-06-28 17:08:44.246123
66976	77	6	19	2013-06-28 17:08:44.247368	2013-06-28 17:08:44.247368
66977	77	8	19	2013-06-28 17:08:44.248261	2013-06-28 17:08:44.248261
66978	77	9	19	2013-06-28 17:08:44.248951	2013-06-28 17:08:44.248951
66979	77	11	19	2013-06-28 17:08:44.249648	2013-06-28 17:08:44.249648
66980	77	12	19	2013-06-28 17:08:44.250356	2013-06-28 17:08:44.250356
66981	77	13	19	2013-06-28 17:08:44.251251	2013-06-28 17:08:44.251251
66982	77	15	19	2013-06-28 17:08:44.252068	2013-06-28 17:08:44.252068
66983	77	16	19	2013-06-28 17:08:44.252761	2013-06-28 17:08:44.252761
66984	77	18	19	2013-06-28 17:08:44.253546	2013-06-28 17:08:44.253546
66985	77	20	19	2013-06-28 17:08:44.254777	2013-06-28 17:08:44.254777
66986	77	21	19	2013-06-28 17:08:44.255669	2013-06-28 17:08:44.255669
66987	77	23	19	2013-06-28 17:08:44.256361	2013-06-28 17:08:44.256361
66988	77	24	19	2013-06-28 17:08:44.257256	2013-06-28 17:08:44.257256
66989	77	25	19	2013-06-28 17:08:44.258016	2013-06-28 17:08:44.258016
66990	77	27	19	2013-06-28 17:08:44.258816	2013-06-28 17:08:44.258816
66991	77	28	19	2013-06-28 17:08:44.259544	2013-06-28 17:08:44.259544
66992	77	30	19	2013-06-28 17:08:44.260221	2013-06-28 17:08:44.260221
66993	77	32	19	2013-06-28 17:08:44.260923	2013-06-28 17:08:44.260923
66994	77	33	19	2013-06-28 17:08:44.261654	2013-06-28 17:08:44.261654
66995	77	35	19	2013-06-28 17:08:44.262485	2013-06-28 17:08:44.262485
66996	77	0	20	2013-06-28 17:08:44.263526	2013-06-28 17:08:44.263526
66997	77	1	20	2013-06-28 17:08:44.264418	2013-06-28 17:08:44.264418
66998	77	3	20	2013-06-28 17:08:44.265199	2013-06-28 17:08:44.265199
66999	77	4	20	2013-06-28 17:08:44.266007	2013-06-28 17:08:44.266007
67000	77	6	20	2013-06-28 17:08:44.266672	2013-06-28 17:08:44.266672
67001	77	8	20	2013-06-28 17:08:44.267339	2013-06-28 17:08:44.267339
67002	77	9	20	2013-06-28 17:08:44.268059	2013-06-28 17:08:44.268059
67003	77	11	20	2013-06-28 17:08:44.268875	2013-06-28 17:08:44.268875
67004	77	12	20	2013-06-28 17:08:44.269627	2013-06-28 17:08:44.269627
67005	77	13	20	2013-06-28 17:08:44.270615	2013-06-28 17:08:44.270615
67006	77	15	20	2013-06-28 17:08:44.27187	2013-06-28 17:08:44.27187
67007	77	16	20	2013-06-28 17:08:44.272652	2013-06-28 17:08:44.272652
67008	77	18	20	2013-06-28 17:08:44.273408	2013-06-28 17:08:44.273408
67009	77	20	20	2013-06-28 17:08:44.27412	2013-06-28 17:08:44.27412
67010	77	21	20	2013-06-28 17:08:44.274973	2013-06-28 17:08:44.274973
67011	77	23	20	2013-06-28 17:08:44.275733	2013-06-28 17:08:44.275733
67012	77	24	20	2013-06-28 17:08:44.276388	2013-06-28 17:08:44.276388
67013	77	25	20	2013-06-28 17:08:44.2771	2013-06-28 17:08:44.2771
67014	77	27	20	2013-06-28 17:08:44.277878	2013-06-28 17:08:44.277878
67015	77	28	20	2013-06-28 17:08:44.278665	2013-06-28 17:08:44.278665
67016	77	30	20	2013-06-28 17:08:44.279441	2013-06-28 17:08:44.279441
67017	77	32	20	2013-06-28 17:08:44.280397	2013-06-28 17:08:44.280397
67018	77	33	20	2013-06-28 17:08:44.281173	2013-06-28 17:08:44.281173
67019	77	35	20	2013-06-28 17:08:44.281915	2013-06-28 17:08:44.281915
67020	77	0	21	2013-06-28 17:08:44.282674	2013-06-28 17:08:44.282674
67021	77	1	21	2013-06-28 17:08:44.28335	2013-06-28 17:08:44.28335
67022	77	2	21	2013-06-28 17:08:44.284051	2013-06-28 17:08:44.284051
67023	77	3	21	2013-06-28 17:08:44.284746	2013-06-28 17:08:44.284746
67024	77	4	21	2013-06-28 17:08:44.285728	2013-06-28 17:08:44.285728
67025	77	5	21	2013-06-28 17:08:44.286966	2013-06-28 17:08:44.286966
67026	77	6	21	2013-06-28 17:08:44.28796	2013-06-28 17:08:44.28796
67027	77	7	21	2013-06-28 17:08:44.288637	2013-06-28 17:08:44.288637
67028	77	8	21	2013-06-28 17:08:44.289369	2013-06-28 17:08:44.289369
67029	77	9	21	2013-06-28 17:08:44.290178	2013-06-28 17:08:44.290178
67030	77	10	21	2013-06-28 17:08:44.291307	2013-06-28 17:08:44.291307
67031	77	11	21	2013-06-28 17:08:44.292287	2013-06-28 17:08:44.292287
67032	77	12	21	2013-06-28 17:08:44.293285	2013-06-28 17:08:44.293285
67033	77	13	21	2013-06-28 17:08:44.294186	2013-06-28 17:08:44.294186
67034	77	14	21	2013-06-28 17:08:44.294887	2013-06-28 17:08:44.294887
67035	77	15	21	2013-06-28 17:08:44.295576	2013-06-28 17:08:44.295576
67036	77	16	21	2013-06-28 17:08:44.296327	2013-06-28 17:08:44.296327
67037	77	17	21	2013-06-28 17:08:44.2972	2013-06-28 17:08:44.2972
67038	77	18	21	2013-06-28 17:08:44.29834	2013-06-28 17:08:44.29834
67039	77	19	21	2013-06-28 17:08:44.299056	2013-06-28 17:08:44.299056
67040	77	20	21	2013-06-28 17:08:44.299723	2013-06-28 17:08:44.299723
67041	77	21	21	2013-06-28 17:08:44.300468	2013-06-28 17:08:44.300468
67042	77	22	21	2013-06-28 17:08:44.301128	2013-06-28 17:08:44.301128
67043	77	23	21	2013-06-28 17:08:44.301774	2013-06-28 17:08:44.301774
67044	77	24	21	2013-06-28 17:08:44.302424	2013-06-28 17:08:44.302424
67045	77	25	21	2013-06-28 17:08:44.303221	2013-06-28 17:08:44.303221
67046	77	26	21	2013-06-28 17:08:44.303922	2013-06-28 17:08:44.303922
67047	77	27	21	2013-06-28 17:08:44.304567	2013-06-28 17:08:44.304567
67048	77	28	21	2013-06-28 17:08:44.3052	2013-06-28 17:08:44.3052
67049	77	29	21	2013-06-28 17:08:44.305835	2013-06-28 17:08:44.305835
67050	77	30	21	2013-06-28 17:08:44.306479	2013-06-28 17:08:44.306479
67051	77	31	21	2013-06-28 17:08:44.307135	2013-06-28 17:08:44.307135
67052	77	32	21	2013-06-28 17:08:44.307796	2013-06-28 17:08:44.307796
67053	77	33	21	2013-06-28 17:08:44.308484	2013-06-28 17:08:44.308484
67054	77	34	21	2013-06-28 17:08:44.309325	2013-06-28 17:08:44.309325
67055	77	35	21	2013-06-28 17:08:44.310028	2013-06-28 17:08:44.310028
68286	80	7	7	2013-06-28 20:06:44.402739	2013-06-28 20:06:44.402739
68287	80	8	7	2013-06-28 20:06:44.403564	2013-06-28 20:06:44.403564
68288	80	17	7	2013-06-28 20:06:44.404259	2013-06-28 20:06:44.404259
68289	80	18	7	2013-06-28 20:06:44.40494	2013-06-28 20:06:44.40494
68290	80	27	7	2013-06-28 20:06:44.405611	2013-06-28 20:06:44.405611
68291	80	28	7	2013-06-28 20:06:44.406298	2013-06-28 20:06:44.406298
68292	80	7	8	2013-06-28 20:06:44.406965	2013-06-28 20:06:44.406965
68293	80	8	8	2013-06-28 20:06:44.407703	2013-06-28 20:06:44.407703
68294	80	17	8	2013-06-28 20:06:44.408426	2013-06-28 20:06:44.408426
68295	80	18	8	2013-06-28 20:06:44.409209	2013-06-28 20:06:44.409209
68296	80	27	8	2013-06-28 20:06:44.409904	2013-06-28 20:06:44.409904
68297	80	28	8	2013-06-28 20:06:44.410545	2013-06-28 20:06:44.410545
68298	80	7	9	2013-06-28 20:06:44.412054	2013-06-28 20:06:44.412054
68299	80	8	9	2013-06-28 20:06:44.412745	2013-06-28 20:06:44.412745
68300	80	17	9	2013-06-28 20:06:44.414254	2013-06-28 20:06:44.414254
68301	80	18	9	2013-06-28 20:06:44.414962	2013-06-28 20:06:44.414962
68302	80	27	9	2013-06-28 20:06:44.41565	2013-06-28 20:06:44.41565
68303	80	28	9	2013-06-28 20:06:44.416426	2013-06-28 20:06:44.416426
68304	80	6	10	2013-06-28 20:06:44.417175	2013-06-28 20:06:44.417175
68305	80	7	10	2013-06-28 20:06:44.417897	2013-06-28 20:06:44.417897
68306	80	8	10	2013-06-28 20:06:44.418565	2013-06-28 20:06:44.418565
68307	80	9	10	2013-06-28 20:06:44.419301	2013-06-28 20:06:44.419301
68308	80	17	10	2013-06-28 20:06:44.419981	2013-06-28 20:06:44.419981
68309	80	18	10	2013-06-28 20:06:44.420651	2013-06-28 20:06:44.420651
68310	80	27	10	2013-06-28 20:06:44.421406	2013-06-28 20:06:44.421406
68311	80	28	10	2013-06-28 20:06:44.422089	2013-06-28 20:06:44.422089
68312	80	6	11	2013-06-28 20:06:44.422802	2013-06-28 20:06:44.422802
68313	80	7	11	2013-06-28 20:06:44.423469	2013-06-28 20:06:44.423469
68314	80	8	11	2013-06-28 20:06:44.424173	2013-06-28 20:06:44.424173
68315	80	9	11	2013-06-28 20:06:44.424943	2013-06-28 20:06:44.424943
68316	80	17	11	2013-06-28 20:06:44.425727	2013-06-28 20:06:44.425727
68317	80	18	11	2013-06-28 20:06:44.426458	2013-06-28 20:06:44.426458
68318	80	27	11	2013-06-28 20:06:44.427164	2013-06-28 20:06:44.427164
68319	80	28	11	2013-06-28 20:06:44.427831	2013-06-28 20:06:44.427831
68320	80	6	12	2013-06-28 20:06:44.429463	2013-06-28 20:06:44.429463
68321	80	7	12	2013-06-28 20:06:44.430206	2013-06-28 20:06:44.430206
68322	80	8	12	2013-06-28 20:06:44.430885	2013-06-28 20:06:44.430885
68323	80	9	12	2013-06-28 20:06:44.431612	2013-06-28 20:06:44.431612
68324	80	17	12	2013-06-28 20:06:44.433249	2013-06-28 20:06:44.433249
68325	80	18	12	2013-06-28 20:06:44.433968	2013-06-28 20:06:44.433968
68326	80	27	12	2013-06-28 20:06:44.434652	2013-06-28 20:06:44.434652
68327	80	28	12	2013-06-28 20:06:44.435302	2013-06-28 20:06:44.435302
68328	80	5	13	2013-06-28 20:06:44.435996	2013-06-28 20:06:44.435996
68329	80	6	13	2013-06-28 20:06:44.436726	2013-06-28 20:06:44.436726
68330	80	7	13	2013-06-28 20:06:44.437372	2013-06-28 20:06:44.437372
68331	80	8	13	2013-06-28 20:06:44.438026	2013-06-28 20:06:44.438026
68332	80	9	13	2013-06-28 20:06:44.438702	2013-06-28 20:06:44.438702
68333	80	10	13	2013-06-28 20:06:44.439342	2013-06-28 20:06:44.439342
68334	80	17	13	2013-06-28 20:06:44.440141	2013-06-28 20:06:44.440141
68335	80	18	13	2013-06-28 20:06:44.440912	2013-06-28 20:06:44.440912
68336	80	27	13	2013-06-28 20:06:44.44165	2013-06-28 20:06:44.44165
68337	80	28	13	2013-06-28 20:06:44.442347	2013-06-28 20:06:44.442347
68338	80	5	14	2013-06-28 20:06:44.443018	2013-06-28 20:06:44.443018
68339	80	6	14	2013-06-28 20:06:44.443663	2013-06-28 20:06:44.443663
68340	80	7	14	2013-06-28 20:06:44.444321	2013-06-28 20:06:44.444321
68341	80	8	14	2013-06-28 20:06:44.44496	2013-06-28 20:06:44.44496
68342	80	9	14	2013-06-28 20:06:44.445657	2013-06-28 20:06:44.445657
68343	80	10	14	2013-06-28 20:06:44.446342	2013-06-28 20:06:44.446342
68344	80	17	14	2013-06-28 20:06:44.447844	2013-06-28 20:06:44.447844
68345	80	18	14	2013-06-28 20:06:44.448513	2013-06-28 20:06:44.448513
68346	80	27	14	2013-06-28 20:06:44.449187	2013-06-28 20:06:44.449187
68347	80	28	14	2013-06-28 20:06:44.449891	2013-06-28 20:06:44.449891
68348	80	5	15	2013-06-28 20:06:44.451642	2013-06-28 20:06:44.451642
68349	80	6	15	2013-06-28 20:06:44.452502	2013-06-28 20:06:44.452502
68350	80	7	15	2013-06-28 20:06:44.453279	2013-06-28 20:06:44.453279
68351	80	8	15	2013-06-28 20:06:44.454189	2013-06-28 20:06:44.454189
68352	80	9	15	2013-06-28 20:06:44.455205	2013-06-28 20:06:44.455205
68353	80	10	15	2013-06-28 20:06:44.456112	2013-06-28 20:06:44.456112
68354	80	17	15	2013-06-28 20:06:44.457731	2013-06-28 20:06:44.457731
68355	80	18	15	2013-06-28 20:06:44.458403	2013-06-28 20:06:44.458403
68356	80	27	15	2013-06-28 20:06:44.459084	2013-06-28 20:06:44.459084
68357	80	28	15	2013-06-28 20:06:44.459728	2013-06-28 20:06:44.459728
68358	80	4	16	2013-06-28 20:06:44.460461	2013-06-28 20:06:44.460461
68359	80	5	16	2013-06-28 20:06:44.461161	2013-06-28 20:06:44.461161
68360	80	6	16	2013-06-28 20:06:44.461819	2013-06-28 20:06:44.461819
68361	80	7	16	2013-06-28 20:06:44.462524	2013-06-28 20:06:44.462524
68362	80	8	16	2013-06-28 20:06:44.463223	2013-06-28 20:06:44.463223
68363	80	9	16	2013-06-28 20:06:44.463976	2013-06-28 20:06:44.463976
68364	80	10	16	2013-06-28 20:06:44.464762	2013-06-28 20:06:44.464762
68365	80	11	16	2013-06-28 20:06:44.465598	2013-06-28 20:06:44.465598
68366	80	17	16	2013-06-28 20:06:44.466285	2013-06-28 20:06:44.466285
68367	80	18	16	2013-06-28 20:06:44.466947	2013-06-28 20:06:44.466947
68368	80	27	16	2013-06-28 20:06:44.467647	2013-06-28 20:06:44.467647
68369	80	28	16	2013-06-28 20:06:44.468406	2013-06-28 20:06:44.468406
68370	80	4	17	2013-06-28 20:06:44.469175	2013-06-28 20:06:44.469175
68371	80	5	17	2013-06-28 20:06:44.469903	2013-06-28 20:06:44.469903
68372	80	6	17	2013-06-28 20:06:44.470867	2013-06-28 20:06:44.470867
68373	80	7	17	2013-06-28 20:06:44.471672	2013-06-28 20:06:44.471672
68374	80	8	17	2013-06-28 20:06:44.472388	2013-06-28 20:06:44.472388
68375	80	9	17	2013-06-28 20:06:44.473073	2013-06-28 20:06:44.473073
68376	80	10	17	2013-06-28 20:06:44.473736	2013-06-28 20:06:44.473736
68377	80	11	17	2013-06-28 20:06:44.47442	2013-06-28 20:06:44.47442
68378	80	17	17	2013-06-28 20:06:44.475098	2013-06-28 20:06:44.475098
68379	80	18	17	2013-06-28 20:06:44.475872	2013-06-28 20:06:44.475872
68380	80	27	17	2013-06-28 20:06:44.478152	2013-06-28 20:06:44.478152
68381	80	28	17	2013-06-28 20:06:44.478817	2013-06-28 20:06:44.478817
68382	80	4	18	2013-06-28 20:06:44.482204	2013-06-28 20:06:44.482204
68383	80	5	18	2013-06-28 20:06:44.482894	2013-06-28 20:06:44.482894
68384	80	6	18	2013-06-28 20:06:44.483544	2013-06-28 20:06:44.483544
68385	80	7	18	2013-06-28 20:06:44.484307	2013-06-28 20:06:44.484307
68386	80	8	18	2013-06-28 20:06:44.4851	2013-06-28 20:06:44.4851
68387	80	9	18	2013-06-28 20:06:44.485788	2013-06-28 20:06:44.485788
68388	80	10	18	2013-06-28 20:06:44.486552	2013-06-28 20:06:44.486552
68389	80	11	18	2013-06-28 20:06:44.48736	2013-06-28 20:06:44.48736
68390	80	17	18	2013-06-28 20:06:44.489076	2013-06-28 20:06:44.489076
68391	80	18	18	2013-06-28 20:06:44.489827	2013-06-28 20:06:44.489827
68392	80	27	18	2013-06-28 20:06:44.490618	2013-06-28 20:06:44.490618
68393	80	28	18	2013-06-28 20:06:44.491425	2013-06-28 20:06:44.491425
68394	80	3	19	2013-06-28 20:06:44.492137	2013-06-28 20:06:44.492137
68395	80	4	19	2013-06-28 20:06:44.492812	2013-06-28 20:06:44.492812
68396	80	5	19	2013-06-28 20:06:44.493471	2013-06-28 20:06:44.493471
68397	80	6	19	2013-06-28 20:06:44.49413	2013-06-28 20:06:44.49413
68398	80	7	19	2013-06-28 20:06:44.494806	2013-06-28 20:06:44.494806
68399	80	8	19	2013-06-28 20:06:44.495466	2013-06-28 20:06:44.495466
68400	80	9	19	2013-06-28 20:06:44.496219	2013-06-28 20:06:44.496219
68401	80	10	19	2013-06-28 20:06:44.497104	2013-06-28 20:06:44.497104
68402	80	11	19	2013-06-28 20:06:44.497957	2013-06-28 20:06:44.497957
68403	80	12	19	2013-06-28 20:06:44.498692	2013-06-28 20:06:44.498692
68404	80	17	19	2013-06-28 20:06:44.499556	2013-06-28 20:06:44.499556
68405	80	18	19	2013-06-28 20:06:44.50035	2013-06-28 20:06:44.50035
68406	80	27	19	2013-06-28 20:06:44.501079	2013-06-28 20:06:44.501079
68407	80	28	19	2013-06-28 20:06:44.501753	2013-06-28 20:06:44.501753
68408	80	3	20	2013-06-28 20:06:44.50245	2013-06-28 20:06:44.50245
68409	80	4	20	2013-06-28 20:06:44.503132	2013-06-28 20:06:44.503132
68410	80	5	20	2013-06-28 20:06:44.503794	2013-06-28 20:06:44.503794
68411	80	6	20	2013-06-28 20:06:44.5045	2013-06-28 20:06:44.5045
68412	80	7	20	2013-06-28 20:06:44.505282	2013-06-28 20:06:44.505282
68413	80	8	20	2013-06-28 20:06:44.50615	2013-06-28 20:06:44.50615
68414	80	9	20	2013-06-28 20:06:44.507156	2013-06-28 20:06:44.507156
68415	80	10	20	2013-06-28 20:06:44.508025	2013-06-28 20:06:44.508025
68416	80	11	20	2013-06-28 20:06:44.508922	2013-06-28 20:06:44.508922
68417	80	12	20	2013-06-28 20:06:44.509667	2013-06-28 20:06:44.509667
68418	80	17	20	2013-06-28 20:06:44.51033	2013-06-28 20:06:44.51033
68419	80	18	20	2013-06-28 20:06:44.510993	2013-06-28 20:06:44.510993
68420	80	27	20	2013-06-28 20:06:44.511661	2013-06-28 20:06:44.511661
68421	80	28	20	2013-06-28 20:06:44.512357	2013-06-28 20:06:44.512357
68422	80	3	21	2013-06-28 20:06:44.513363	2013-06-28 20:06:44.513363
68423	80	4	21	2013-06-28 20:06:44.514212	2013-06-28 20:06:44.514212
68424	80	5	21	2013-06-28 20:06:44.514954	2013-06-28 20:06:44.514954
68425	80	6	21	2013-06-28 20:06:44.515606	2013-06-28 20:06:44.515606
68426	80	7	21	2013-06-28 20:06:44.516304	2013-06-28 20:06:44.516304
68427	80	8	21	2013-06-28 20:06:44.517118	2013-06-28 20:06:44.517118
68428	80	9	21	2013-06-28 20:06:44.517813	2013-06-28 20:06:44.517813
68429	80	10	21	2013-06-28 20:06:44.518544	2013-06-28 20:06:44.518544
68430	80	11	21	2013-06-28 20:06:44.51928	2013-06-28 20:06:44.51928
68431	80	12	21	2013-06-28 20:06:44.52009	2013-06-28 20:06:44.52009
68432	80	17	21	2013-06-28 20:06:44.520768	2013-06-28 20:06:44.520768
68433	80	18	21	2013-06-28 20:06:44.52152	2013-06-28 20:06:44.52152
68434	80	27	21	2013-06-28 20:06:44.523155	2013-06-28 20:06:44.523155
68435	80	28	21	2013-06-28 20:06:44.524194	2013-06-28 20:06:44.524194
73934	22	10	0	2013-06-28 23:05:13.954668	2013-06-28 23:05:13.954668
73935	22	11	0	2013-06-28 23:05:13.956957	2013-06-28 23:05:13.956957
73936	22	12	0	2013-06-28 23:05:13.960128	2013-06-28 23:05:13.960128
73937	22	10	1	2013-06-28 23:05:13.967584	2013-06-28 23:05:13.967584
73938	22	11	1	2013-06-28 23:05:13.970702	2013-06-28 23:05:13.970702
73939	22	12	1	2013-06-28 23:05:13.972992	2013-06-28 23:05:13.972992
73940	22	10	2	2013-06-28 23:05:13.97548	2013-06-28 23:05:13.97548
73941	22	11	2	2013-06-28 23:05:13.978489	2013-06-28 23:05:13.978489
73942	22	12	2	2013-06-28 23:05:13.980934	2013-06-28 23:05:13.980934
73943	22	0	4	2013-06-28 23:05:13.983508	2013-06-28 23:05:13.983508
73944	22	1	4	2013-06-28 23:05:13.985688	2013-06-28 23:05:13.985688
73945	22	2	4	2013-06-28 23:05:13.987943	2013-06-28 23:05:13.987943
73946	22	0	5	2013-06-28 23:05:13.99356	2013-06-28 23:05:13.99356
73947	22	1	5	2013-06-28 23:05:13.995714	2013-06-28 23:05:13.995714
73948	22	2	5	2013-06-28 23:05:13.997807	2013-06-28 23:05:13.997807
73949	22	0	6	2013-06-28 23:05:14.000089	2013-06-28 23:05:14.000089
73950	22	1	6	2013-06-28 23:05:14.002431	2013-06-28 23:05:14.002431
73951	22	2	6	2013-06-28 23:05:14.005588	2013-06-28 23:05:14.005588
74052	79	13	0	2013-06-28 23:25:39.93249	2013-06-28 23:25:39.93249
74053	79	14	0	2013-06-28 23:25:39.935911	2013-06-28 23:25:39.935911
74054	79	15	0	2013-06-28 23:25:39.938298	2013-06-28 23:25:39.938298
74055	79	0	1	2013-06-28 23:25:39.943395	2013-06-28 23:25:39.943395
74056	79	13	1	2013-06-28 23:25:39.949197	2013-06-28 23:25:39.949197
74057	79	14	1	2013-06-28 23:25:39.951579	2013-06-28 23:25:39.951579
74058	79	15	1	2013-06-28 23:25:39.953559	2013-06-28 23:25:39.953559
74059	79	0	2	2013-06-28 23:25:39.957669	2013-06-28 23:25:39.957669
74060	79	13	2	2013-06-28 23:25:39.95996	2013-06-28 23:25:39.95996
74061	79	14	2	2013-06-28 23:25:39.962233	2013-06-28 23:25:39.962233
74062	79	15	2	2013-06-28 23:25:39.964573	2013-06-28 23:25:39.964573
74063	79	0	3	2013-06-28 23:25:39.967242	2013-06-28 23:25:39.967242
74064	79	13	3	2013-06-28 23:25:39.969356	2013-06-28 23:25:39.969356
74065	79	14	3	2013-06-28 23:25:39.971367	2013-06-28 23:25:39.971367
74066	79	15	3	2013-06-28 23:25:39.973326	2013-06-28 23:25:39.973326
74067	79	13	6	2013-06-28 23:25:40.003805	2013-06-28 23:25:40.003805
74068	79	14	6	2013-06-28 23:25:40.006024	2013-06-28 23:25:40.006024
74069	79	15	6	2013-06-28 23:25:40.008114	2013-06-28 23:25:40.008114
74070	79	35	6	2013-06-28 23:25:40.010284	2013-06-28 23:25:40.010284
74071	79	13	7	2013-06-28 23:25:40.017822	2013-06-28 23:25:40.017822
74072	79	14	7	2013-06-28 23:25:40.11356	2013-06-28 23:25:40.11356
74073	79	15	7	2013-06-28 23:25:40.116326	2013-06-28 23:25:40.116326
74074	79	0	8	2013-06-28 23:25:40.123171	2013-06-28 23:25:40.123171
74075	79	1	8	2013-06-28 23:25:40.125294	2013-06-28 23:25:40.125294
74076	79	2	8	2013-06-28 23:25:40.12732	2013-06-28 23:25:40.12732
74077	79	3	8	2013-06-28 23:25:40.129493	2013-06-28 23:25:40.129493
74078	79	4	8	2013-06-28 23:25:40.131629	2013-06-28 23:25:40.131629
74079	79	5	8	2013-06-28 23:25:40.133676	2013-06-28 23:25:40.133676
74080	79	6	8	2013-06-28 23:25:40.135588	2013-06-28 23:25:40.135588
74081	79	7	8	2013-06-28 23:25:40.137393	2013-06-28 23:25:40.137393
74082	79	8	8	2013-06-28 23:25:40.13937	2013-06-28 23:25:40.13937
74083	79	9	8	2013-06-28 23:25:40.14145	2013-06-28 23:25:40.14145
74084	79	10	8	2013-06-28 23:25:40.143762	2013-06-28 23:25:40.143762
74085	79	11	8	2013-06-28 23:25:40.146319	2013-06-28 23:25:40.146319
74086	79	12	8	2013-06-28 23:25:40.148593	2013-06-28 23:25:40.148593
74087	79	13	8	2013-06-28 23:25:40.150564	2013-06-28 23:25:40.150564
74088	79	14	8	2013-06-28 23:25:40.152565	2013-06-28 23:25:40.152565
74089	79	15	8	2013-06-28 23:25:40.154531	2013-06-28 23:25:40.154531
74090	79	16	8	2013-06-28 23:25:40.156477	2013-06-28 23:25:40.156477
74091	79	17	8	2013-06-28 23:25:40.158423	2013-06-28 23:25:40.158423
74092	79	18	8	2013-06-28 23:25:40.16044	2013-06-28 23:25:40.16044
74093	79	19	8	2013-06-28 23:25:40.162606	2013-06-28 23:25:40.162606
74094	79	20	8	2013-06-28 23:25:40.164904	2013-06-28 23:25:40.164904
74095	79	21	8	2013-06-28 23:25:40.166883	2013-06-28 23:25:40.166883
74096	79	22	8	2013-06-28 23:25:40.169132	2013-06-28 23:25:40.169132
74097	79	23	8	2013-06-28 23:25:40.172808	2013-06-28 23:25:40.172808
74098	79	24	8	2013-06-28 23:25:40.175567	2013-06-28 23:25:40.175567
74099	79	25	8	2013-06-28 23:25:40.177953	2013-06-28 23:25:40.177953
74100	79	26	8	2013-06-28 23:25:40.18133	2013-06-28 23:25:40.18133
74101	79	27	8	2013-06-28 23:25:40.183588	2013-06-28 23:25:40.183588
74102	79	28	8	2013-06-28 23:25:40.186074	2013-06-28 23:25:40.186074
74103	79	29	8	2013-06-28 23:25:40.18854	2013-06-28 23:25:40.18854
74104	79	30	8	2013-06-28 23:25:40.190757	2013-06-28 23:25:40.190757
74105	79	31	8	2013-06-28 23:25:40.193525	2013-06-28 23:25:40.193525
74106	79	32	8	2013-06-28 23:25:40.196183	2013-06-28 23:25:40.196183
74107	79	33	8	2013-06-28 23:25:40.198389	2013-06-28 23:25:40.198389
74108	79	34	8	2013-06-28 23:25:40.200315	2013-06-28 23:25:40.200315
74109	79	0	9	2013-06-28 23:25:40.202426	2013-06-28 23:25:40.202426
74110	79	1	9	2013-06-28 23:25:40.204379	2013-06-28 23:25:40.204379
74111	79	2	9	2013-06-28 23:25:40.206703	2013-06-28 23:25:40.206703
74112	79	3	9	2013-06-28 23:25:40.208811	2013-06-28 23:25:40.208811
74113	79	4	9	2013-06-28 23:25:40.210693	2013-06-28 23:25:40.210693
74114	79	5	9	2013-06-28 23:25:40.213404	2013-06-28 23:25:40.213404
74115	79	6	9	2013-06-28 23:25:40.215457	2013-06-28 23:25:40.215457
74116	79	7	9	2013-06-28 23:25:40.217352	2013-06-28 23:25:40.217352
74117	79	8	9	2013-06-28 23:25:40.219352	2013-06-28 23:25:40.219352
74118	79	9	9	2013-06-28 23:25:40.221258	2013-06-28 23:25:40.221258
74119	79	10	9	2013-06-28 23:25:40.223812	2013-06-28 23:25:40.223812
74120	79	11	9	2013-06-28 23:25:40.226324	2013-06-28 23:25:40.226324
74121	79	12	9	2013-06-28 23:25:40.228493	2013-06-28 23:25:40.228493
74122	79	13	9	2013-06-28 23:25:40.230747	2013-06-28 23:25:40.230747
74123	79	14	9	2013-06-28 23:25:40.23351	2013-06-28 23:25:40.23351
74124	79	15	9	2013-06-28 23:25:40.235945	2013-06-28 23:25:40.235945
74125	79	16	9	2013-06-28 23:25:40.237984	2013-06-28 23:25:40.237984
74126	79	17	9	2013-06-28 23:25:40.239889	2013-06-28 23:25:40.239889
74127	79	18	9	2013-06-28 23:25:40.241854	2013-06-28 23:25:40.241854
74128	79	19	9	2013-06-28 23:25:40.243877	2013-06-28 23:25:40.243877
74129	79	20	9	2013-06-28 23:25:40.246454	2013-06-28 23:25:40.246454
74130	79	21	9	2013-06-28 23:25:40.248457	2013-06-28 23:25:40.248457
74131	79	22	9	2013-06-28 23:25:40.250523	2013-06-28 23:25:40.250523
74132	79	23	9	2013-06-28 23:25:40.252433	2013-06-28 23:25:40.252433
74133	79	24	9	2013-06-28 23:25:40.254283	2013-06-28 23:25:40.254283
74134	79	25	9	2013-06-28 23:25:40.256316	2013-06-28 23:25:40.256316
74135	79	26	9	2013-06-28 23:25:40.258267	2013-06-28 23:25:40.258267
74136	79	27	9	2013-06-28 23:25:40.260157	2013-06-28 23:25:40.260157
74137	79	28	9	2013-06-28 23:25:40.262383	2013-06-28 23:25:40.262383
74138	79	29	9	2013-06-28 23:25:40.264593	2013-06-28 23:25:40.264593
74139	79	30	9	2013-06-28 23:25:40.266958	2013-06-28 23:25:40.266958
74140	79	31	9	2013-06-28 23:25:40.269085	2013-06-28 23:25:40.269085
74141	79	32	9	2013-06-28 23:25:40.271229	2013-06-28 23:25:40.271229
74142	79	33	9	2013-06-28 23:25:40.273756	2013-06-28 23:25:40.273756
74143	79	34	9	2013-06-28 23:25:40.275833	2013-06-28 23:25:40.275833
74144	79	28	10	2013-06-28 23:25:40.286072	2013-06-28 23:25:40.286072
74145	79	29	10	2013-06-28 23:25:40.28882	2013-06-28 23:25:40.28882
74146	79	28	11	2013-06-28 23:25:40.291785	2013-06-28 23:25:40.291785
74147	79	29	11	2013-06-28 23:25:40.293946	2013-06-28 23:25:40.293946
74148	79	1	20	2013-06-28 23:25:40.306983	2013-06-28 23:25:40.306983
74149	79	2	20	2013-06-28 23:25:40.308931	2013-06-28 23:25:40.308931
74150	79	1	21	2013-06-28 23:25:40.31214	2013-06-28 23:25:40.31214
74151	79	2	21	2013-06-28 23:25:40.3142	2013-06-28 23:25:40.3142
74485	81	8	0	2013-06-29 00:32:05.844581	2013-06-29 00:32:05.844581
74486	81	9	0	2013-06-29 00:32:05.847062	2013-06-29 00:32:05.847062
74487	81	24	0	2013-06-29 00:32:05.85145	2013-06-29 00:32:05.85145
74488	81	25	0	2013-06-29 00:32:05.853476	2013-06-29 00:32:05.853476
74489	81	26	0	2013-06-29 00:32:05.855562	2013-06-29 00:32:05.855562
74490	81	27	0	2013-06-29 00:32:05.857568	2013-06-29 00:32:05.857568
74491	81	28	0	2013-06-29 00:32:05.859598	2013-06-29 00:32:05.859598
74492	81	29	0	2013-06-29 00:32:05.861536	2013-06-29 00:32:05.861536
74493	81	8	1	2013-06-29 00:32:05.863519	2013-06-29 00:32:05.863519
74494	81	9	1	2013-06-29 00:32:05.865395	2013-06-29 00:32:05.865395
74495	81	8	2	2013-06-29 00:32:05.870028	2013-06-29 00:32:05.870028
74496	81	9	2	2013-06-29 00:32:05.872196	2013-06-29 00:32:05.872196
74497	81	17	2	2013-06-29 00:32:05.874265	2013-06-29 00:32:05.874265
74498	81	18	2	2013-06-29 00:32:05.876365	2013-06-29 00:32:05.876365
74499	81	19	2	2013-06-29 00:32:05.87827	2013-06-29 00:32:05.87827
74500	81	32	2	2013-06-29 00:32:05.880239	2013-06-29 00:32:05.880239
74501	81	33	2	2013-06-29 00:32:05.882246	2013-06-29 00:32:05.882246
74502	81	8	3	2013-06-29 00:32:05.886751	2013-06-29 00:32:05.886751
74503	81	9	3	2013-06-29 00:32:05.888753	2013-06-29 00:32:05.888753
74504	81	12	3	2013-06-29 00:32:05.891142	2013-06-29 00:32:05.891142
74505	81	13	3	2013-06-29 00:32:05.893828	2013-06-29 00:32:05.893828
74506	81	14	3	2013-06-29 00:32:05.896001	2013-06-29 00:32:05.896001
74507	81	15	3	2013-06-29 00:32:05.898224	2013-06-29 00:32:05.898224
74508	81	16	3	2013-06-29 00:32:05.901061	2013-06-29 00:32:05.901061
74509	81	17	3	2013-06-29 00:32:05.903221	2013-06-29 00:32:05.903221
74510	81	18	3	2013-06-29 00:32:05.905417	2013-06-29 00:32:05.905417
74511	81	19	3	2013-06-29 00:32:05.907449	2013-06-29 00:32:05.907449
74512	81	20	3	2013-06-29 00:32:05.909747	2013-06-29 00:32:05.909747
74513	81	21	3	2013-06-29 00:32:05.911783	2013-06-29 00:32:05.911783
74514	81	22	3	2013-06-29 00:32:05.913637	2013-06-29 00:32:05.913637
74515	81	23	3	2013-06-29 00:32:05.915468	2013-06-29 00:32:05.915468
74516	81	24	3	2013-06-29 00:32:05.917423	2013-06-29 00:32:05.917423
74517	81	25	3	2013-06-29 00:32:05.919269	2013-06-29 00:32:05.919269
74518	81	26	3	2013-06-29 00:32:05.921277	2013-06-29 00:32:05.921277
74519	81	27	3	2013-06-29 00:32:05.923468	2013-06-29 00:32:05.923468
74520	81	28	3	2013-06-29 00:32:05.925421	2013-06-29 00:32:05.925421
74521	81	29	3	2013-06-29 00:32:05.927282	2013-06-29 00:32:05.927282
74522	81	32	3	2013-06-29 00:32:05.929485	2013-06-29 00:32:05.929485
74523	81	33	3	2013-06-29 00:32:05.931417	2013-06-29 00:32:05.931417
74524	81	34	3	2013-06-29 00:32:05.93327	2013-06-29 00:32:05.93327
74525	81	35	3	2013-06-29 00:32:05.93512	2013-06-29 00:32:05.93512
74526	81	12	4	2013-06-29 00:32:05.93753	2013-06-29 00:32:05.93753
74527	81	13	4	2013-06-29 00:32:05.93984	2013-06-29 00:32:05.93984
74528	81	14	4	2013-06-29 00:32:05.941774	2013-06-29 00:32:05.941774
74529	81	15	4	2013-06-29 00:32:05.943647	2013-06-29 00:32:05.943647
74530	81	16	4	2013-06-29 00:32:05.945494	2013-06-29 00:32:05.945494
74531	81	17	4	2013-06-29 00:32:05.947364	2013-06-29 00:32:05.947364
74532	81	18	4	2013-06-29 00:32:05.949319	2013-06-29 00:32:05.949319
74533	81	19	4	2013-06-29 00:32:05.951149	2013-06-29 00:32:05.951149
74534	81	20	4	2013-06-29 00:32:05.953107	2013-06-29 00:32:05.953107
74535	81	21	4	2013-06-29 00:32:05.954944	2013-06-29 00:32:05.954944
74536	81	22	4	2013-06-29 00:32:05.956736	2013-06-29 00:32:05.956736
74537	81	23	4	2013-06-29 00:32:05.9591	2013-06-29 00:32:05.9591
74538	81	24	4	2013-06-29 00:32:05.961147	2013-06-29 00:32:05.961147
74539	81	25	4	2013-06-29 00:32:05.963511	2013-06-29 00:32:05.963511
74540	81	26	4	2013-06-29 00:32:05.965869	2013-06-29 00:32:05.965869
74541	81	27	4	2013-06-29 00:32:05.967824	2013-06-29 00:32:05.967824
74542	81	28	4	2013-06-29 00:32:05.969895	2013-06-29 00:32:05.969895
74543	81	29	4	2013-06-29 00:32:05.971947	2013-06-29 00:32:05.971947
74544	81	32	4	2013-06-29 00:32:05.97385	2013-06-29 00:32:05.97385
74545	81	33	4	2013-06-29 00:32:05.975743	2013-06-29 00:32:05.975743
74546	81	34	4	2013-06-29 00:32:05.977583	2013-06-29 00:32:05.977583
74547	81	35	4	2013-06-29 00:32:05.979422	2013-06-29 00:32:05.979422
74548	81	13	5	2013-06-29 00:32:05.98369	2013-06-29 00:32:05.98369
74549	81	14	5	2013-06-29 00:32:05.985606	2013-06-29 00:32:05.985606
74550	81	25	5	2013-06-29 00:32:05.987831	2013-06-29 00:32:05.987831
74551	81	26	5	2013-06-29 00:32:05.989922	2013-06-29 00:32:05.989922
74552	81	0	6	2013-06-29 00:32:05.992334	2013-06-29 00:32:05.992334
74553	81	1	6	2013-06-29 00:32:05.994503	2013-06-29 00:32:05.994503
74554	81	2	6	2013-06-29 00:32:05.996438	2013-06-29 00:32:05.996438
74555	81	3	6	2013-06-29 00:32:05.998233	2013-06-29 00:32:05.998233
74556	81	4	6	2013-06-29 00:32:06.000022	2013-06-29 00:32:06.000022
74557	81	5	6	2013-06-29 00:32:06.001937	2013-06-29 00:32:06.001937
74558	81	6	6	2013-06-29 00:32:06.003832	2013-06-29 00:32:06.003832
74559	81	7	6	2013-06-29 00:32:06.005997	2013-06-29 00:32:06.005997
74560	81	8	6	2013-06-29 00:32:06.008723	2013-06-29 00:32:06.008723
74561	81	9	6	2013-06-29 00:32:06.010792	2013-06-29 00:32:06.010792
74562	81	13	6	2013-06-29 00:32:06.012801	2013-06-29 00:32:06.012801
74563	81	14	6	2013-06-29 00:32:06.014665	2013-06-29 00:32:06.014665
74564	81	25	6	2013-06-29 00:32:06.016724	2013-06-29 00:32:06.016724
74565	81	26	6	2013-06-29 00:32:06.018692	2013-06-29 00:32:06.018692
74566	81	0	7	2013-06-29 00:32:06.023382	2013-06-29 00:32:06.023382
74567	81	1	7	2013-06-29 00:32:06.025478	2013-06-29 00:32:06.025478
74568	81	2	7	2013-06-29 00:32:06.027429	2013-06-29 00:32:06.027429
74569	81	3	7	2013-06-29 00:32:06.02922	2013-06-29 00:32:06.02922
74570	81	4	7	2013-06-29 00:32:06.031391	2013-06-29 00:32:06.031391
74571	81	5	7	2013-06-29 00:32:06.033625	2013-06-29 00:32:06.033625
74572	81	6	7	2013-06-29 00:32:06.03706	2013-06-29 00:32:06.03706
74573	81	7	7	2013-06-29 00:32:06.039218	2013-06-29 00:32:06.039218
74574	81	8	7	2013-06-29 00:32:06.041475	2013-06-29 00:32:06.041475
74575	81	9	7	2013-06-29 00:32:06.043823	2013-06-29 00:32:06.043823
74576	81	25	7	2013-06-29 00:32:06.045986	2013-06-29 00:32:06.045986
74577	81	26	7	2013-06-29 00:32:06.048	2013-06-29 00:32:06.048
74578	81	8	8	2013-06-29 00:32:06.053303	2013-06-29 00:32:06.053303
74579	81	9	8	2013-06-29 00:32:06.055755	2013-06-29 00:32:06.055755
74580	81	25	8	2013-06-29 00:32:06.060451	2013-06-29 00:32:06.060451
74581	81	26	8	2013-06-29 00:32:06.062434	2013-06-29 00:32:06.062434
74582	81	27	8	2013-06-29 00:32:06.064456	2013-06-29 00:32:06.064456
74583	81	28	8	2013-06-29 00:32:06.066343	2013-06-29 00:32:06.066343
74584	81	29	8	2013-06-29 00:32:06.069026	2013-06-29 00:32:06.069026
74585	81	30	8	2013-06-29 00:32:06.071959	2013-06-29 00:32:06.071959
74586	81	31	8	2013-06-29 00:32:06.074487	2013-06-29 00:32:06.074487
74587	81	32	8	2013-06-29 00:32:06.076768	2013-06-29 00:32:06.076768
74588	81	33	8	2013-06-29 00:32:06.078981	2013-06-29 00:32:06.078981
74589	81	34	8	2013-06-29 00:32:06.080883	2013-06-29 00:32:06.080883
74590	81	35	8	2013-06-29 00:32:06.082947	2013-06-29 00:32:06.082947
74591	81	8	9	2013-06-29 00:32:06.087671	2013-06-29 00:32:06.087671
74592	81	9	9	2013-06-29 00:32:06.089917	2013-06-29 00:32:06.089917
74593	81	13	9	2013-06-29 00:32:06.093077	2013-06-29 00:32:06.093077
74594	81	14	9	2013-06-29 00:32:06.095307	2013-06-29 00:32:06.095307
74595	81	25	9	2013-06-29 00:32:06.09743	2013-06-29 00:32:06.09743
74596	81	26	9	2013-06-29 00:32:06.099365	2013-06-29 00:32:06.099365
74597	81	27	9	2013-06-29 00:32:06.101661	2013-06-29 00:32:06.101661
74598	81	28	9	2013-06-29 00:32:06.103962	2013-06-29 00:32:06.103962
74599	81	29	9	2013-06-29 00:32:06.106251	2013-06-29 00:32:06.106251
74600	81	30	9	2013-06-29 00:32:06.108458	2013-06-29 00:32:06.108458
74601	81	31	9	2013-06-29 00:32:06.110431	2013-06-29 00:32:06.110431
74602	81	32	9	2013-06-29 00:32:06.112275	2013-06-29 00:32:06.112275
74603	81	33	9	2013-06-29 00:32:06.11411	2013-06-29 00:32:06.11411
74604	81	34	9	2013-06-29 00:32:06.11592	2013-06-29 00:32:06.11592
74605	81	35	9	2013-06-29 00:32:06.117851	2013-06-29 00:32:06.117851
74606	81	8	10	2013-06-29 00:32:06.119806	2013-06-29 00:32:06.119806
74607	81	9	10	2013-06-29 00:32:06.121888	2013-06-29 00:32:06.121888
74608	81	13	10	2013-06-29 00:32:06.124172	2013-06-29 00:32:06.124172
74609	81	14	10	2013-06-29 00:32:06.126509	2013-06-29 00:32:06.126509
74610	81	0	11	2013-06-29 00:32:06.136008	2013-06-29 00:32:06.136008
74611	81	1	11	2013-06-29 00:32:06.138344	2013-06-29 00:32:06.138344
74612	81	2	11	2013-06-29 00:32:06.140443	2013-06-29 00:32:06.140443
74613	81	3	11	2013-06-29 00:32:06.142663	2013-06-29 00:32:06.142663
74614	81	4	11	2013-06-29 00:32:06.145135	2013-06-29 00:32:06.145135
74615	81	5	11	2013-06-29 00:32:06.147188	2013-06-29 00:32:06.147188
74616	81	13	11	2013-06-29 00:32:06.151218	2013-06-29 00:32:06.151218
74617	81	14	11	2013-06-29 00:32:06.153206	2013-06-29 00:32:06.153206
74618	81	0	12	2013-06-29 00:32:06.155606	2013-06-29 00:32:06.155606
74619	81	1	12	2013-06-29 00:32:06.158413	2013-06-29 00:32:06.158413
74620	81	2	12	2013-06-29 00:32:06.16053	2013-06-29 00:32:06.16053
74621	81	3	12	2013-06-29 00:32:06.163136	2013-06-29 00:32:06.163136
74622	81	4	12	2013-06-29 00:32:06.166178	2013-06-29 00:32:06.166178
74623	81	5	12	2013-06-29 00:32:06.168503	2013-06-29 00:32:06.168503
74624	81	13	12	2013-06-29 00:32:06.171533	2013-06-29 00:32:06.171533
74625	81	14	12	2013-06-29 00:32:06.173893	2013-06-29 00:32:06.173893
74626	81	25	12	2013-06-29 00:32:06.176142	2013-06-29 00:32:06.176142
74627	81	26	12	2013-06-29 00:32:06.1785	2013-06-29 00:32:06.1785
74628	81	4	13	2013-06-29 00:32:06.185131	2013-06-29 00:32:06.185131
74629	81	5	13	2013-06-29 00:32:06.18712	2013-06-29 00:32:06.18712
74630	81	8	13	2013-06-29 00:32:06.189866	2013-06-29 00:32:06.189866
74631	81	9	13	2013-06-29 00:32:06.192084	2013-06-29 00:32:06.192084
74632	81	10	13	2013-06-29 00:32:06.194814	2013-06-29 00:32:06.194814
74633	81	11	13	2013-06-29 00:32:06.196896	2013-06-29 00:32:06.196896
74634	81	12	13	2013-06-29 00:32:06.198854	2013-06-29 00:32:06.198854
74635	81	13	13	2013-06-29 00:32:06.20083	2013-06-29 00:32:06.20083
74636	81	14	13	2013-06-29 00:32:06.202693	2013-06-29 00:32:06.202693
74637	81	25	13	2013-06-29 00:32:06.204747	2013-06-29 00:32:06.204747
74638	81	26	13	2013-06-29 00:32:06.20704	2013-06-29 00:32:06.20704
74639	81	4	14	2013-06-29 00:32:06.20941	2013-06-29 00:32:06.20941
74640	81	5	14	2013-06-29 00:32:06.211326	2013-06-29 00:32:06.211326
74641	81	8	14	2013-06-29 00:32:06.213247	2013-06-29 00:32:06.213247
74642	81	9	14	2013-06-29 00:32:06.215104	2013-06-29 00:32:06.215104
74643	81	10	14	2013-06-29 00:32:06.217437	2013-06-29 00:32:06.217437
74644	81	11	14	2013-06-29 00:32:06.219436	2013-06-29 00:32:06.219436
74645	81	12	14	2013-06-29 00:32:06.221526	2013-06-29 00:32:06.221526
74646	81	13	14	2013-06-29 00:32:06.223818	2013-06-29 00:32:06.223818
74647	81	14	14	2013-06-29 00:32:06.225878	2013-06-29 00:32:06.225878
74648	81	25	14	2013-06-29 00:32:06.236489	2013-06-29 00:32:06.236489
74649	81	26	14	2013-06-29 00:32:06.239869	2013-06-29 00:32:06.239869
74650	81	13	15	2013-06-29 00:32:06.258441	2013-06-29 00:32:06.258441
74651	81	14	15	2013-06-29 00:32:06.261253	2013-06-29 00:32:06.261253
74652	81	25	15	2013-06-29 00:32:06.264013	2013-06-29 00:32:06.264013
74653	81	26	15	2013-06-29 00:32:06.266148	2013-06-29 00:32:06.266148
74654	81	27	15	2013-06-29 00:32:06.26815	2013-06-29 00:32:06.26815
74655	81	28	15	2013-06-29 00:32:06.269999	2013-06-29 00:32:06.269999
74656	81	29	15	2013-06-29 00:32:06.27286	2013-06-29 00:32:06.27286
74657	81	32	15	2013-06-29 00:32:06.279137	2013-06-29 00:32:06.279137
74658	81	33	15	2013-06-29 00:32:06.281191	2013-06-29 00:32:06.281191
74659	81	34	15	2013-06-29 00:32:06.283182	2013-06-29 00:32:06.283182
74660	81	35	15	2013-06-29 00:32:06.285234	2013-06-29 00:32:06.285234
74661	81	13	16	2013-06-29 00:32:06.289954	2013-06-29 00:32:06.289954
74662	81	14	16	2013-06-29 00:32:06.292756	2013-06-29 00:32:06.292756
74663	81	25	16	2013-06-29 00:32:06.297377	2013-06-29 00:32:06.297377
74664	81	26	16	2013-06-29 00:32:06.299483	2013-06-29 00:32:06.299483
74665	81	27	16	2013-06-29 00:32:06.301383	2013-06-29 00:32:06.301383
74666	81	28	16	2013-06-29 00:32:06.303405	2013-06-29 00:32:06.303405
74667	81	29	16	2013-06-29 00:32:06.306014	2013-06-29 00:32:06.306014
74668	81	32	16	2013-06-29 00:32:06.31087	2013-06-29 00:32:06.31087
74669	81	33	16	2013-06-29 00:32:06.31289	2013-06-29 00:32:06.31289
74670	81	34	16	2013-06-29 00:32:06.314763	2013-06-29 00:32:06.314763
74671	81	35	16	2013-06-29 00:32:06.316536	2013-06-29 00:32:06.316536
74672	81	0	17	2013-06-29 00:32:06.318357	2013-06-29 00:32:06.318357
74673	81	1	17	2013-06-29 00:32:06.320315	2013-06-29 00:32:06.320315
74674	81	2	17	2013-06-29 00:32:06.322473	2013-06-29 00:32:06.322473
74675	81	3	17	2013-06-29 00:32:06.324689	2013-06-29 00:32:06.324689
74676	81	4	17	2013-06-29 00:32:06.326876	2013-06-29 00:32:06.326876
74677	81	5	17	2013-06-29 00:32:06.32904	2013-06-29 00:32:06.32904
74678	81	6	17	2013-06-29 00:32:06.330942	2013-06-29 00:32:06.330942
74679	81	7	17	2013-06-29 00:32:06.332779	2013-06-29 00:32:06.332779
74680	81	8	17	2013-06-29 00:32:06.334626	2013-06-29 00:32:06.334626
74681	81	9	17	2013-06-29 00:32:06.434096	2013-06-29 00:32:06.434096
74682	81	10	17	2013-06-29 00:32:06.436234	2013-06-29 00:32:06.436234
74683	81	11	17	2013-06-29 00:32:06.438519	2013-06-29 00:32:06.438519
74684	81	12	17	2013-06-29 00:32:06.440709	2013-06-29 00:32:06.440709
74685	81	13	17	2013-06-29 00:32:06.442924	2013-06-29 00:32:06.442924
74686	81	14	17	2013-06-29 00:32:06.444896	2013-06-29 00:32:06.444896
74687	81	15	17	2013-06-29 00:32:06.446731	2013-06-29 00:32:06.446731
74688	81	16	17	2013-06-29 00:32:06.448745	2013-06-29 00:32:06.448745
74689	81	17	17	2013-06-29 00:32:06.450793	2013-06-29 00:32:06.450793
74690	81	18	17	2013-06-29 00:32:06.452737	2013-06-29 00:32:06.452737
74691	81	21	17	2013-06-29 00:32:06.457386	2013-06-29 00:32:06.457386
74692	81	22	17	2013-06-29 00:32:06.459539	2013-06-29 00:32:06.459539
74693	81	23	17	2013-06-29 00:32:06.461592	2013-06-29 00:32:06.461592
74694	81	24	17	2013-06-29 00:32:06.46364	2013-06-29 00:32:06.46364
74695	81	25	17	2013-06-29 00:32:06.465553	2013-06-29 00:32:06.465553
74696	81	26	17	2013-06-29 00:32:06.46762	2013-06-29 00:32:06.46762
74697	81	0	18	2013-06-29 00:32:06.47511	2013-06-29 00:32:06.47511
74698	81	1	18	2013-06-29 00:32:06.477106	2013-06-29 00:32:06.477106
74699	81	2	18	2013-06-29 00:32:06.479095	2013-06-29 00:32:06.479095
74700	81	3	18	2013-06-29 00:32:06.48106	2013-06-29 00:32:06.48106
74701	81	4	18	2013-06-29 00:32:06.483074	2013-06-29 00:32:06.483074
74702	81	5	18	2013-06-29 00:32:06.485096	2013-06-29 00:32:06.485096
74703	81	6	18	2013-06-29 00:32:06.487031	2013-06-29 00:32:06.487031
74704	81	7	18	2013-06-29 00:32:06.488989	2013-06-29 00:32:06.488989
74705	81	8	18	2013-06-29 00:32:06.490991	2013-06-29 00:32:06.490991
74706	81	9	18	2013-06-29 00:32:06.492918	2013-06-29 00:32:06.492918
74707	81	10	18	2013-06-29 00:32:06.495026	2013-06-29 00:32:06.495026
74708	81	11	18	2013-06-29 00:32:06.497603	2013-06-29 00:32:06.497603
74709	81	12	18	2013-06-29 00:32:06.500028	2013-06-29 00:32:06.500028
74710	81	13	18	2013-06-29 00:32:06.501928	2013-06-29 00:32:06.501928
74711	81	14	18	2013-06-29 00:32:06.503824	2013-06-29 00:32:06.503824
74712	81	15	18	2013-06-29 00:32:06.505808	2013-06-29 00:32:06.505808
74713	81	16	18	2013-06-29 00:32:06.507777	2013-06-29 00:32:06.507777
74714	81	17	18	2013-06-29 00:32:06.510039	2013-06-29 00:32:06.510039
74715	81	18	18	2013-06-29 00:32:06.512805	2013-06-29 00:32:06.512805
74716	81	21	18	2013-06-29 00:32:06.517297	2013-06-29 00:32:06.517297
74717	81	22	18	2013-06-29 00:32:06.519227	2013-06-29 00:32:06.519227
74718	81	23	18	2013-06-29 00:32:06.521287	2013-06-29 00:32:06.521287
74719	81	24	18	2013-06-29 00:32:06.52354	2013-06-29 00:32:06.52354
74720	81	25	18	2013-06-29 00:32:06.525704	2013-06-29 00:32:06.525704
74721	81	26	18	2013-06-29 00:32:06.527778	2013-06-29 00:32:06.527778
74722	81	25	19	2013-06-29 00:32:06.535151	2013-06-29 00:32:06.535151
74723	81	26	19	2013-06-29 00:32:06.537546	2013-06-29 00:32:06.537546
74724	81	25	20	2013-06-29 00:32:06.552879	2013-06-29 00:32:06.552879
74725	81	26	20	2013-06-29 00:32:06.554871	2013-06-29 00:32:06.554871
74726	81	25	21	2013-06-29 00:32:06.561984	2013-06-29 00:32:06.561984
74727	81	26	21	2013-06-29 00:32:06.564044	2013-06-29 00:32:06.564044
76776	30	0	7	2013-06-29 20:02:42.385868	2013-06-29 20:02:42.385868
76777	30	1	7	2013-06-29 20:02:42.386715	2013-06-29 20:02:42.386715
76778	30	2	7	2013-06-29 20:02:42.387429	2013-06-29 20:02:42.387429
76779	30	3	7	2013-06-29 20:02:42.388154	2013-06-29 20:02:42.388154
76780	30	4	7	2013-06-29 20:02:42.388832	2013-06-29 20:02:42.388832
76781	30	5	7	2013-06-29 20:02:42.389515	2013-06-29 20:02:42.389515
76782	30	6	7	2013-06-29 20:02:42.390198	2013-06-29 20:02:42.390198
76783	30	7	7	2013-06-29 20:02:42.390906	2013-06-29 20:02:42.390906
76784	30	8	7	2013-06-29 20:02:42.391598	2013-06-29 20:02:42.391598
76785	30	9	7	2013-06-29 20:02:42.392305	2013-06-29 20:02:42.392305
76786	30	10	7	2013-06-29 20:02:42.393079	2013-06-29 20:02:42.393079
76787	30	11	7	2013-06-29 20:02:42.394025	2013-06-29 20:02:42.394025
76788	30	12	7	2013-06-29 20:02:42.394777	2013-06-29 20:02:42.394777
76789	30	13	7	2013-06-29 20:02:42.395588	2013-06-29 20:02:42.395588
76790	30	14	7	2013-06-29 20:02:42.396298	2013-06-29 20:02:42.396298
76791	30	18	7	2013-06-29 20:02:42.396993	2013-06-29 20:02:42.396993
76792	30	19	7	2013-06-29 20:02:42.397793	2013-06-29 20:02:42.397793
76793	30	20	7	2013-06-29 20:02:42.398574	2013-06-29 20:02:42.398574
76794	30	21	7	2013-06-29 20:02:42.39927	2013-06-29 20:02:42.39927
76795	30	22	7	2013-06-29 20:02:42.400011	2013-06-29 20:02:42.400011
76796	30	23	7	2013-06-29 20:02:42.400704	2013-06-29 20:02:42.400704
76797	30	24	7	2013-06-29 20:02:42.401542	2013-06-29 20:02:42.401542
76798	30	25	7	2013-06-29 20:02:42.40247	2013-06-29 20:02:42.40247
76799	30	26	7	2013-06-29 20:02:42.403213	2013-06-29 20:02:42.403213
76800	30	27	7	2013-06-29 20:02:42.403965	2013-06-29 20:02:42.403965
76801	30	28	7	2013-06-29 20:02:42.404808	2013-06-29 20:02:42.404808
76802	30	29	7	2013-06-29 20:02:42.405654	2013-06-29 20:02:42.405654
76803	30	30	7	2013-06-29 20:02:42.406713	2013-06-29 20:02:42.406713
76804	30	31	7	2013-06-29 20:02:42.407679	2013-06-29 20:02:42.407679
76805	30	32	7	2013-06-29 20:02:42.408409	2013-06-29 20:02:42.408409
76806	30	33	7	2013-06-29 20:02:42.409095	2013-06-29 20:02:42.409095
76807	30	34	7	2013-06-29 20:02:42.409892	2013-06-29 20:02:42.409892
76808	30	35	7	2013-06-29 20:02:42.410736	2013-06-29 20:02:42.410736
76809	30	0	8	2013-06-29 20:02:42.411804	2013-06-29 20:02:42.411804
76810	30	1	8	2013-06-29 20:02:42.412526	2013-06-29 20:02:42.412526
76811	30	2	8	2013-06-29 20:02:42.413445	2013-06-29 20:02:42.413445
76812	30	3	8	2013-06-29 20:02:42.414299	2013-06-29 20:02:42.414299
76813	30	4	8	2013-06-29 20:02:42.415095	2013-06-29 20:02:42.415095
76814	30	5	8	2013-06-29 20:02:42.415854	2013-06-29 20:02:42.415854
76815	30	6	8	2013-06-29 20:02:42.416578	2013-06-29 20:02:42.416578
76816	30	7	8	2013-06-29 20:02:42.417279	2013-06-29 20:02:42.417279
76817	30	8	8	2013-06-29 20:02:42.41808	2013-06-29 20:02:42.41808
76818	30	9	8	2013-06-29 20:02:42.418802	2013-06-29 20:02:42.418802
76819	30	10	8	2013-06-29 20:02:42.41956	2013-06-29 20:02:42.41956
76820	30	11	8	2013-06-29 20:02:42.420299	2013-06-29 20:02:42.420299
76821	30	12	8	2013-06-29 20:02:42.421034	2013-06-29 20:02:42.421034
76822	30	13	8	2013-06-29 20:02:42.42188	2013-06-29 20:02:42.42188
76823	30	14	8	2013-06-29 20:02:42.422737	2013-06-29 20:02:42.422737
76824	30	18	8	2013-06-29 20:02:42.425603	2013-06-29 20:02:42.425603
76825	30	19	8	2013-06-29 20:02:42.426419	2013-06-29 20:02:42.426419
76826	30	20	8	2013-06-29 20:02:42.427167	2013-06-29 20:02:42.427167
76827	30	21	8	2013-06-29 20:02:42.427837	2013-06-29 20:02:42.427837
76828	30	22	8	2013-06-29 20:02:42.428534	2013-06-29 20:02:42.428534
76829	30	23	8	2013-06-29 20:02:42.429381	2013-06-29 20:02:42.429381
76830	30	24	8	2013-06-29 20:02:42.430225	2013-06-29 20:02:42.430225
76831	30	25	8	2013-06-29 20:02:42.431305	2013-06-29 20:02:42.431305
76832	30	26	8	2013-06-29 20:02:42.432436	2013-06-29 20:02:42.432436
76833	30	27	8	2013-06-29 20:02:42.433375	2013-06-29 20:02:42.433375
76834	30	28	8	2013-06-29 20:02:42.434185	2013-06-29 20:02:42.434185
76835	30	29	8	2013-06-29 20:02:42.434902	2013-06-29 20:02:42.434902
76836	30	30	8	2013-06-29 20:02:42.435669	2013-06-29 20:02:42.435669
76837	30	31	8	2013-06-29 20:02:42.436419	2013-06-29 20:02:42.436419
76838	30	32	8	2013-06-29 20:02:42.437113	2013-06-29 20:02:42.437113
76839	30	33	8	2013-06-29 20:02:42.437833	2013-06-29 20:02:42.437833
76840	30	34	8	2013-06-29 20:02:42.438674	2013-06-29 20:02:42.438674
76841	30	35	8	2013-06-29 20:02:42.439516	2013-06-29 20:02:42.439516
76842	30	0	9	2013-06-29 20:02:42.440372	2013-06-29 20:02:42.440372
76843	30	1	9	2013-06-29 20:02:42.441223	2013-06-29 20:02:42.441223
76844	30	2	9	2013-06-29 20:02:42.441923	2013-06-29 20:02:42.441923
76845	30	3	9	2013-06-29 20:02:42.442809	2013-06-29 20:02:42.442809
76846	30	4	9	2013-06-29 20:02:42.443819	2013-06-29 20:02:42.443819
76847	30	5	9	2013-06-29 20:02:42.444757	2013-06-29 20:02:42.444757
76848	30	6	9	2013-06-29 20:02:42.445496	2013-06-29 20:02:42.445496
76849	30	7	9	2013-06-29 20:02:42.446229	2013-06-29 20:02:42.446229
76850	30	8	9	2013-06-29 20:02:42.446919	2013-06-29 20:02:42.446919
76851	30	9	9	2013-06-29 20:02:42.447735	2013-06-29 20:02:42.447735
76852	30	10	9	2013-06-29 20:02:42.448448	2013-06-29 20:02:42.448448
76853	30	11	9	2013-06-29 20:02:42.449126	2013-06-29 20:02:42.449126
76854	30	12	9	2013-06-29 20:02:42.44983	2013-06-29 20:02:42.44983
76855	30	13	9	2013-06-29 20:02:42.45052	2013-06-29 20:02:42.45052
76856	30	14	9	2013-06-29 20:02:42.451221	2013-06-29 20:02:42.451221
76857	30	18	9	2013-06-29 20:02:42.452059	2013-06-29 20:02:42.452059
76858	30	19	9	2013-06-29 20:02:42.452759	2013-06-29 20:02:42.452759
76859	30	20	9	2013-06-29 20:02:42.453429	2013-06-29 20:02:42.453429
76860	30	21	9	2013-06-29 20:02:42.454136	2013-06-29 20:02:42.454136
76861	30	22	9	2013-06-29 20:02:42.454834	2013-06-29 20:02:42.454834
76862	30	23	9	2013-06-29 20:02:42.455531	2013-06-29 20:02:42.455531
76863	30	24	9	2013-06-29 20:02:42.456266	2013-06-29 20:02:42.456266
76864	30	25	9	2013-06-29 20:02:42.456967	2013-06-29 20:02:42.456967
76865	30	26	9	2013-06-29 20:02:42.457622	2013-06-29 20:02:42.457622
76866	30	27	9	2013-06-29 20:02:42.458351	2013-06-29 20:02:42.458351
76867	30	28	9	2013-06-29 20:02:42.459039	2013-06-29 20:02:42.459039
76868	30	29	9	2013-06-29 20:02:42.459713	2013-06-29 20:02:42.459713
76869	30	30	9	2013-06-29 20:02:42.460611	2013-06-29 20:02:42.460611
76870	30	31	9	2013-06-29 20:02:42.4615	2013-06-29 20:02:42.4615
76871	30	32	9	2013-06-29 20:02:42.462228	2013-06-29 20:02:42.462228
76872	30	33	9	2013-06-29 20:02:42.463073	2013-06-29 20:02:42.463073
76873	30	34	9	2013-06-29 20:02:42.463851	2013-06-29 20:02:42.463851
76874	30	35	9	2013-06-29 20:02:42.46515	2013-06-29 20:02:42.46515
76875	30	0	10	2013-06-29 20:02:42.466105	2013-06-29 20:02:42.466105
76876	30	1	10	2013-06-29 20:02:42.466873	2013-06-29 20:02:42.466873
76877	30	2	10	2013-06-29 20:02:42.46759	2013-06-29 20:02:42.46759
76878	30	3	10	2013-06-29 20:02:42.468309	2013-06-29 20:02:42.468309
76879	30	4	10	2013-06-29 20:02:42.469126	2013-06-29 20:02:42.469126
76880	30	5	10	2013-06-29 20:02:42.469823	2013-06-29 20:02:42.469823
76881	30	6	10	2013-06-29 20:02:42.470483	2013-06-29 20:02:42.470483
76882	30	7	10	2013-06-29 20:02:42.471195	2013-06-29 20:02:42.471195
76883	30	8	10	2013-06-29 20:02:42.471995	2013-06-29 20:02:42.471995
76884	30	9	10	2013-06-29 20:02:42.472721	2013-06-29 20:02:42.472721
76885	30	10	10	2013-06-29 20:02:42.4736	2013-06-29 20:02:42.4736
76886	30	11	10	2013-06-29 20:02:42.474428	2013-06-29 20:02:42.474428
76887	30	12	10	2013-06-29 20:02:42.475156	2013-06-29 20:02:42.475156
76888	30	13	10	2013-06-29 20:02:42.475847	2013-06-29 20:02:42.475847
76889	30	14	10	2013-06-29 20:02:42.47667	2013-06-29 20:02:42.47667
76890	30	18	10	2013-06-29 20:02:42.477543	2013-06-29 20:02:42.477543
76891	30	19	10	2013-06-29 20:02:42.478936	2013-06-29 20:02:42.478936
76892	30	20	10	2013-06-29 20:02:42.480833	2013-06-29 20:02:42.480833
76893	30	21	10	2013-06-29 20:02:42.482151	2013-06-29 20:02:42.482151
76894	30	22	10	2013-06-29 20:02:42.482899	2013-06-29 20:02:42.482899
76895	30	23	10	2013-06-29 20:02:42.483706	2013-06-29 20:02:42.483706
76896	30	24	10	2013-06-29 20:02:42.484687	2013-06-29 20:02:42.484687
76897	30	25	10	2013-06-29 20:02:42.485721	2013-06-29 20:02:42.485721
76898	30	26	10	2013-06-29 20:02:42.486522	2013-06-29 20:02:42.486522
76899	30	27	10	2013-06-29 20:02:42.487244	2013-06-29 20:02:42.487244
76900	30	28	10	2013-06-29 20:02:42.48794	2013-06-29 20:02:42.48794
76901	30	29	10	2013-06-29 20:02:42.488663	2013-06-29 20:02:42.488663
76902	30	30	10	2013-06-29 20:02:42.489455	2013-06-29 20:02:42.489455
76903	30	31	10	2013-06-29 20:02:42.490366	2013-06-29 20:02:42.490366
76904	30	32	10	2013-06-29 20:02:42.491251	2013-06-29 20:02:42.491251
76905	30	33	10	2013-06-29 20:02:42.492019	2013-06-29 20:02:42.492019
76906	30	34	10	2013-06-29 20:02:42.49281	2013-06-29 20:02:42.49281
76907	30	35	10	2013-06-29 20:02:42.493666	2013-06-29 20:02:42.493666
76908	30	0	16	2013-06-29 20:02:42.503328	2013-06-29 20:02:42.503328
76909	30	1	16	2013-06-29 20:02:42.504334	2013-06-29 20:02:42.504334
76910	30	2	16	2013-06-29 20:02:42.505458	2013-06-29 20:02:42.505458
76911	30	3	16	2013-06-29 20:02:42.50644	2013-06-29 20:02:42.50644
76912	30	4	16	2013-06-29 20:02:42.507149	2013-06-29 20:02:42.507149
76913	30	5	16	2013-06-29 20:02:42.507994	2013-06-29 20:02:42.507994
76914	30	6	16	2013-06-29 20:02:42.508747	2013-06-29 20:02:42.508747
76915	30	26	16	2013-06-29 20:02:42.509512	2013-06-29 20:02:42.509512
76916	30	27	16	2013-06-29 20:02:42.510312	2013-06-29 20:02:42.510312
76917	30	28	16	2013-06-29 20:02:42.511063	2013-06-29 20:02:42.511063
76918	30	29	16	2013-06-29 20:02:42.511752	2013-06-29 20:02:42.511752
76919	30	30	16	2013-06-29 20:02:42.512474	2013-06-29 20:02:42.512474
76920	30	31	16	2013-06-29 20:02:42.513172	2013-06-29 20:02:42.513172
76921	30	32	16	2013-06-29 20:02:42.513935	2013-06-29 20:02:42.513935
76922	30	33	16	2013-06-29 20:02:42.514951	2013-06-29 20:02:42.514951
76923	30	34	16	2013-06-29 20:02:42.515776	2013-06-29 20:02:42.515776
76924	30	35	16	2013-06-29 20:02:42.51655	2013-06-29 20:02:42.51655
76925	30	0	17	2013-06-29 20:02:42.517624	2013-06-29 20:02:42.517624
76926	30	1	17	2013-06-29 20:02:42.518587	2013-06-29 20:02:42.518587
76927	30	2	17	2013-06-29 20:02:42.519517	2013-06-29 20:02:42.519517
76928	30	3	17	2013-06-29 20:02:42.520258	2013-06-29 20:02:42.520258
76929	30	4	17	2013-06-29 20:02:42.520991	2013-06-29 20:02:42.520991
76930	30	5	17	2013-06-29 20:02:42.521843	2013-06-29 20:02:42.521843
76931	30	6	17	2013-06-29 20:02:42.522654	2013-06-29 20:02:42.522654
76932	30	26	17	2013-06-29 20:02:42.524434	2013-06-29 20:02:42.524434
76933	30	27	17	2013-06-29 20:02:42.52526	2013-06-29 20:02:42.52526
76934	30	28	17	2013-06-29 20:02:42.526077	2013-06-29 20:02:42.526077
76935	30	29	17	2013-06-29 20:02:42.55683	2013-06-29 20:02:42.55683
76936	30	30	17	2013-06-29 20:02:42.557866	2013-06-29 20:02:42.557866
76937	30	31	17	2013-06-29 20:02:42.558592	2013-06-29 20:02:42.558592
76938	30	32	17	2013-06-29 20:02:42.559316	2013-06-29 20:02:42.559316
76939	30	33	17	2013-06-29 20:02:42.560115	2013-06-29 20:02:42.560115
76940	30	34	17	2013-06-29 20:02:42.560834	2013-06-29 20:02:42.560834
76941	30	35	17	2013-06-29 20:02:42.561511	2013-06-29 20:02:42.561511
76942	30	0	18	2013-06-29 20:02:42.5622	2013-06-29 20:02:42.5622
76943	30	1	18	2013-06-29 20:02:42.562913	2013-06-29 20:02:42.562913
76944	30	2	18	2013-06-29 20:02:42.563682	2013-06-29 20:02:42.563682
76945	30	3	18	2013-06-29 20:02:42.564608	2013-06-29 20:02:42.564608
76946	30	4	18	2013-06-29 20:02:42.565361	2013-06-29 20:02:42.565361
76947	30	5	18	2013-06-29 20:02:42.56607	2013-06-29 20:02:42.56607
76948	30	6	18	2013-06-29 20:02:42.566944	2013-06-29 20:02:42.566944
76949	30	26	18	2013-06-29 20:02:42.567859	2013-06-29 20:02:42.567859
76950	30	27	18	2013-06-29 20:02:42.568649	2013-06-29 20:02:42.568649
76951	30	28	18	2013-06-29 20:02:42.569448	2013-06-29 20:02:42.569448
76952	30	29	18	2013-06-29 20:02:42.570115	2013-06-29 20:02:42.570115
76953	30	30	18	2013-06-29 20:02:42.570797	2013-06-29 20:02:42.570797
76954	30	31	18	2013-06-29 20:02:42.571469	2013-06-29 20:02:42.571469
76955	30	32	18	2013-06-29 20:02:42.572122	2013-06-29 20:02:42.572122
76956	30	33	18	2013-06-29 20:02:42.572824	2013-06-29 20:02:42.572824
76957	30	34	18	2013-06-29 20:02:42.57349	2013-06-29 20:02:42.57349
76958	30	35	18	2013-06-29 20:02:42.574157	2013-06-29 20:02:42.574157
76959	30	0	19	2013-06-29 20:02:42.574904	2013-06-29 20:02:42.574904
76960	30	1	19	2013-06-29 20:02:42.575582	2013-06-29 20:02:42.575582
76961	30	2	19	2013-06-29 20:02:42.576235	2013-06-29 20:02:42.576235
76962	30	3	19	2013-06-29 20:02:42.576998	2013-06-29 20:02:42.576998
76963	30	4	19	2013-06-29 20:02:42.577703	2013-06-29 20:02:42.577703
76964	30	5	19	2013-06-29 20:02:42.578379	2013-06-29 20:02:42.578379
76965	30	6	19	2013-06-29 20:02:42.5791	2013-06-29 20:02:42.5791
76966	30	7	19	2013-06-29 20:02:42.579776	2013-06-29 20:02:42.579776
76967	30	8	19	2013-06-29 20:02:42.580585	2013-06-29 20:02:42.580585
76968	30	9	19	2013-06-29 20:02:42.581441	2013-06-29 20:02:42.581441
76969	30	10	19	2013-06-29 20:02:42.58213	2013-06-29 20:02:42.58213
76970	30	11	19	2013-06-29 20:02:42.582823	2013-06-29 20:02:42.582823
76971	30	12	19	2013-06-29 20:02:42.583493	2013-06-29 20:02:42.583493
76972	30	13	19	2013-06-29 20:02:42.584341	2013-06-29 20:02:42.584341
76973	30	14	19	2013-06-29 20:02:42.585263	2013-06-29 20:02:42.585263
76974	30	29	19	2013-06-29 20:02:42.586087	2013-06-29 20:02:42.586087
76975	30	30	19	2013-06-29 20:02:42.586773	2013-06-29 20:02:42.586773
76976	30	31	19	2013-06-29 20:02:42.587535	2013-06-29 20:02:42.587535
76977	30	32	19	2013-06-29 20:02:42.58821	2013-06-29 20:02:42.58821
76978	30	33	19	2013-06-29 20:02:42.58887	2013-06-29 20:02:42.58887
76979	30	34	19	2013-06-29 20:02:42.589541	2013-06-29 20:02:42.589541
76980	30	35	19	2013-06-29 20:02:42.590223	2013-06-29 20:02:42.590223
76981	30	0	20	2013-06-29 20:02:42.590885	2013-06-29 20:02:42.590885
76982	30	1	20	2013-06-29 20:02:42.591596	2013-06-29 20:02:42.591596
76983	30	2	20	2013-06-29 20:02:42.592366	2013-06-29 20:02:42.592366
76984	30	3	20	2013-06-29 20:02:42.593063	2013-06-29 20:02:42.593063
76985	30	4	20	2013-06-29 20:02:42.593788	2013-06-29 20:02:42.593788
76986	30	5	20	2013-06-29 20:02:42.594555	2013-06-29 20:02:42.594555
76987	30	6	20	2013-06-29 20:02:42.595301	2013-06-29 20:02:42.595301
76988	30	7	20	2013-06-29 20:02:42.596098	2013-06-29 20:02:42.596098
76989	30	8	20	2013-06-29 20:02:42.596909	2013-06-29 20:02:42.596909
76990	30	9	20	2013-06-29 20:02:42.597756	2013-06-29 20:02:42.597756
76991	30	10	20	2013-06-29 20:02:42.598707	2013-06-29 20:02:42.598707
76992	30	11	20	2013-06-29 20:02:42.599666	2013-06-29 20:02:42.599666
76993	30	12	20	2013-06-29 20:02:42.60051	2013-06-29 20:02:42.60051
76994	30	13	20	2013-06-29 20:02:42.601407	2013-06-29 20:02:42.601407
76995	30	14	20	2013-06-29 20:02:42.602177	2013-06-29 20:02:42.602177
76996	30	29	20	2013-06-29 20:02:42.604848	2013-06-29 20:02:42.604848
76997	30	30	20	2013-06-29 20:02:42.605553	2013-06-29 20:02:42.605553
76998	30	31	20	2013-06-29 20:02:42.606285	2013-06-29 20:02:42.606285
76999	30	32	20	2013-06-29 20:02:42.607124	2013-06-29 20:02:42.607124
77000	30	33	20	2013-06-29 20:02:42.608024	2013-06-29 20:02:42.608024
77001	30	34	20	2013-06-29 20:02:42.608923	2013-06-29 20:02:42.608923
77002	30	35	20	2013-06-29 20:02:42.609788	2013-06-29 20:02:42.609788
77003	30	0	21	2013-06-29 20:02:42.610731	2013-06-29 20:02:42.610731
77004	30	1	21	2013-06-29 20:02:42.611496	2013-06-29 20:02:42.611496
77005	30	2	21	2013-06-29 20:02:42.612207	2013-06-29 20:02:42.612207
77006	30	3	21	2013-06-29 20:02:42.612903	2013-06-29 20:02:42.612903
77007	30	4	21	2013-06-29 20:02:42.613627	2013-06-29 20:02:42.613627
77008	30	5	21	2013-06-29 20:02:42.614402	2013-06-29 20:02:42.614402
77009	30	6	21	2013-06-29 20:02:42.615376	2013-06-29 20:02:42.615376
77010	30	7	21	2013-06-29 20:02:42.616232	2013-06-29 20:02:42.616232
77011	30	8	21	2013-06-29 20:02:42.616963	2013-06-29 20:02:42.616963
77012	30	9	21	2013-06-29 20:02:42.617756	2013-06-29 20:02:42.617756
77013	30	10	21	2013-06-29 20:02:42.618485	2013-06-29 20:02:42.618485
77014	30	11	21	2013-06-29 20:02:42.619234	2013-06-29 20:02:42.619234
77015	30	12	21	2013-06-29 20:02:42.619996	2013-06-29 20:02:42.619996
77016	30	13	21	2013-06-29 20:02:42.620735	2013-06-29 20:02:42.620735
77017	30	14	21	2013-06-29 20:02:42.621485	2013-06-29 20:02:42.621485
77018	30	29	21	2013-06-29 20:02:42.62315	2013-06-29 20:02:42.62315
77019	30	30	21	2013-06-29 20:02:42.623905	2013-06-29 20:02:42.623905
77020	30	31	21	2013-06-29 20:02:42.624736	2013-06-29 20:02:42.624736
77021	30	32	21	2013-06-29 20:02:42.625631	2013-06-29 20:02:42.625631
77022	30	33	21	2013-06-29 20:02:42.626385	2013-06-29 20:02:42.626385
77023	30	34	21	2013-06-29 20:02:42.62712	2013-06-29 20:02:42.62712
77024	30	35	21	2013-06-29 20:02:42.627846	2013-06-29 20:02:42.627846
77025	34	15	2	2013-06-29 20:03:00.616884	2013-06-29 20:03:00.616884
77026	34	16	2	2013-06-29 20:03:00.618679	2013-06-29 20:03:00.618679
77027	34	17	2	2013-06-29 20:03:00.619729	2013-06-29 20:03:00.619729
77028	34	15	3	2013-06-29 20:03:00.621642	2013-06-29 20:03:00.621642
77029	34	16	3	2013-06-29 20:03:00.622503	2013-06-29 20:03:00.622503
77030	34	17	3	2013-06-29 20:03:00.623589	2013-06-29 20:03:00.623589
77031	34	15	4	2013-06-29 20:03:00.626064	2013-06-29 20:03:00.626064
77032	34	16	4	2013-06-29 20:03:00.626834	2013-06-29 20:03:00.626834
77033	34	17	4	2013-06-29 20:03:00.627576	2013-06-29 20:03:00.627576
77034	34	15	5	2013-06-29 20:03:00.629339	2013-06-29 20:03:00.629339
77035	34	16	5	2013-06-29 20:03:00.630075	2013-06-29 20:03:00.630075
77036	34	17	5	2013-06-29 20:03:00.630782	2013-06-29 20:03:00.630782
77037	34	15	6	2013-06-29 20:03:00.632753	2013-06-29 20:03:00.632753
77038	34	16	6	2013-06-29 20:03:00.633858	2013-06-29 20:03:00.633858
77039	34	17	6	2013-06-29 20:03:00.63457	2013-06-29 20:03:00.63457
77040	34	15	7	2013-06-29 20:03:00.635372	2013-06-29 20:03:00.635372
77041	34	16	7	2013-06-29 20:03:00.636252	2013-06-29 20:03:00.636252
77042	34	17	7	2013-06-29 20:03:00.637492	2013-06-29 20:03:00.637492
77043	34	18	7	2013-06-29 20:03:00.638361	2013-06-29 20:03:00.638361
77044	34	19	7	2013-06-29 20:03:00.639044	2013-06-29 20:03:00.639044
77045	34	20	7	2013-06-29 20:03:00.639779	2013-06-29 20:03:00.639779
77046	34	21	7	2013-06-29 20:03:00.640563	2013-06-29 20:03:00.640563
77047	34	22	7	2013-06-29 20:03:00.641294	2013-06-29 20:03:00.641294
77048	34	23	7	2013-06-29 20:03:00.642084	2013-06-29 20:03:00.642084
77049	34	24	7	2013-06-29 20:03:00.642865	2013-06-29 20:03:00.642865
77050	34	25	7	2013-06-29 20:03:00.643692	2013-06-29 20:03:00.643692
77051	34	26	7	2013-06-29 20:03:00.644523	2013-06-29 20:03:00.644523
77052	34	27	7	2013-06-29 20:03:00.645567	2013-06-29 20:03:00.645567
77053	34	28	7	2013-06-29 20:03:00.64665	2013-06-29 20:03:00.64665
77054	34	29	7	2013-06-29 20:03:00.647559	2013-06-29 20:03:00.647559
77055	34	30	7	2013-06-29 20:03:00.648313	2013-06-29 20:03:00.648313
77056	34	31	7	2013-06-29 20:03:00.649225	2013-06-29 20:03:00.649225
77057	34	32	7	2013-06-29 20:03:00.64999	2013-06-29 20:03:00.64999
77058	34	33	7	2013-06-29 20:03:00.650737	2013-06-29 20:03:00.650737
77059	34	34	7	2013-06-29 20:03:00.65158	2013-06-29 20:03:00.65158
77060	34	35	7	2013-06-29 20:03:00.652401	2013-06-29 20:03:00.652401
77061	34	15	8	2013-06-29 20:03:00.656091	2013-06-29 20:03:00.656091
77062	34	16	8	2013-06-29 20:03:00.656847	2013-06-29 20:03:00.656847
77063	34	17	8	2013-06-29 20:03:00.657519	2013-06-29 20:03:00.657519
77064	34	18	8	2013-06-29 20:03:00.658185	2013-06-29 20:03:00.658185
77065	34	19	8	2013-06-29 20:03:00.658974	2013-06-29 20:03:00.658974
77066	34	20	8	2013-06-29 20:03:00.65966	2013-06-29 20:03:00.65966
77067	34	21	8	2013-06-29 20:03:00.660337	2013-06-29 20:03:00.660337
77068	34	22	8	2013-06-29 20:03:00.661174	2013-06-29 20:03:00.661174
77069	34	23	8	2013-06-29 20:03:00.662164	2013-06-29 20:03:00.662164
77070	34	24	8	2013-06-29 20:03:00.663041	2013-06-29 20:03:00.663041
77071	34	25	8	2013-06-29 20:03:00.663875	2013-06-29 20:03:00.663875
77072	34	26	8	2013-06-29 20:03:00.664603	2013-06-29 20:03:00.664603
77073	34	27	8	2013-06-29 20:03:00.665425	2013-06-29 20:03:00.665425
77074	34	28	8	2013-06-29 20:03:00.666287	2013-06-29 20:03:00.666287
77075	34	29	8	2013-06-29 20:03:00.666995	2013-06-29 20:03:00.666995
77076	34	30	8	2013-06-29 20:03:00.667662	2013-06-29 20:03:00.667662
77077	34	31	8	2013-06-29 20:03:00.66832	2013-06-29 20:03:00.66832
77078	34	32	8	2013-06-29 20:03:00.668991	2013-06-29 20:03:00.668991
77079	34	33	8	2013-06-29 20:03:00.669725	2013-06-29 20:03:00.669725
77080	34	34	8	2013-06-29 20:03:00.670443	2013-06-29 20:03:00.670443
77081	34	35	8	2013-06-29 20:03:00.671109	2013-06-29 20:03:00.671109
77082	34	6	9	2013-06-29 20:03:00.671783	2013-06-29 20:03:00.671783
77083	34	7	9	2013-06-29 20:03:00.672473	2013-06-29 20:03:00.672473
77084	34	6	10	2013-06-29 20:03:00.674886	2013-06-29 20:03:00.674886
77085	34	7	10	2013-06-29 20:03:00.675696	2013-06-29 20:03:00.675696
77086	34	6	11	2013-06-29 20:03:00.677678	2013-06-29 20:03:00.677678
77087	34	7	11	2013-06-29 20:03:00.678694	2013-06-29 20:03:00.678694
77088	34	6	12	2013-06-29 20:03:00.680662	2013-06-29 20:03:00.680662
77089	34	7	12	2013-06-29 20:03:00.681475	2013-06-29 20:03:00.681475
77090	34	6	13	2013-06-29 20:03:00.683267	2013-06-29 20:03:00.683267
77091	34	7	13	2013-06-29 20:03:00.684173	2013-06-29 20:03:00.684173
77092	34	8	13	2013-06-29 20:03:00.685013	2013-06-29 20:03:00.685013
77093	34	9	13	2013-06-29 20:03:00.685721	2013-06-29 20:03:00.685721
77094	34	10	13	2013-06-29 20:03:00.68641	2013-06-29 20:03:00.68641
77095	34	11	13	2013-06-29 20:03:00.687152	2013-06-29 20:03:00.687152
77096	34	12	13	2013-06-29 20:03:00.687932	2013-06-29 20:03:00.687932
77097	34	13	13	2013-06-29 20:03:00.688651	2013-06-29 20:03:00.688651
77098	34	14	13	2013-06-29 20:03:00.689326	2013-06-29 20:03:00.689326
77099	34	15	13	2013-06-29 20:03:00.690024	2013-06-29 20:03:00.690024
77100	34	16	13	2013-06-29 20:03:00.690702	2013-06-29 20:03:00.690702
77101	34	6	14	2013-06-29 20:03:00.693774	2013-06-29 20:03:00.693774
77102	34	7	14	2013-06-29 20:03:00.694529	2013-06-29 20:03:00.694529
77103	34	8	14	2013-06-29 20:03:00.695292	2013-06-29 20:03:00.695292
77104	34	9	14	2013-06-29 20:03:00.696207	2013-06-29 20:03:00.696207
77105	34	10	14	2013-06-29 20:03:00.696985	2013-06-29 20:03:00.696985
77106	34	11	14	2013-06-29 20:03:00.697669	2013-06-29 20:03:00.697669
77107	34	12	14	2013-06-29 20:03:00.698514	2013-06-29 20:03:00.698514
77108	34	13	14	2013-06-29 20:03:00.69944	2013-06-29 20:03:00.69944
77109	34	14	14	2013-06-29 20:03:00.700159	2013-06-29 20:03:00.700159
77110	34	15	14	2013-06-29 20:03:00.700856	2013-06-29 20:03:00.700856
77111	34	16	14	2013-06-29 20:03:00.701535	2013-06-29 20:03:00.701535
77112	34	10	15	2013-06-29 20:03:00.703179	2013-06-29 20:03:00.703179
77113	34	11	15	2013-06-29 20:03:00.703916	2013-06-29 20:03:00.703916
77114	34	12	15	2013-06-29 20:03:00.704578	2013-06-29 20:03:00.704578
77115	34	13	15	2013-06-29 20:03:00.705303	2013-06-29 20:03:00.705303
77116	34	14	15	2013-06-29 20:03:00.706053	2013-06-29 20:03:00.706053
77117	34	15	15	2013-06-29 20:03:00.706809	2013-06-29 20:03:00.706809
77118	34	16	15	2013-06-29 20:03:00.707633	2013-06-29 20:03:00.707633
77119	34	10	16	2013-06-29 20:03:00.708578	2013-06-29 20:03:00.708578
77120	34	11	16	2013-06-29 20:03:00.709436	2013-06-29 20:03:00.709436
77121	34	12	16	2013-06-29 20:03:00.710322	2013-06-29 20:03:00.710322
77122	34	13	16	2013-06-29 20:03:00.711114	2013-06-29 20:03:00.711114
77123	34	14	16	2013-06-29 20:03:00.712015	2013-06-29 20:03:00.712015
77124	34	15	16	2013-06-29 20:03:00.71308	2013-06-29 20:03:00.71308
77125	34	16	16	2013-06-29 20:03:00.713917	2013-06-29 20:03:00.713917
77126	34	17	16	2013-06-29 20:03:00.714605	2013-06-29 20:03:00.714605
77127	34	18	16	2013-06-29 20:03:00.715284	2013-06-29 20:03:00.715284
77128	34	19	16	2013-06-29 20:03:00.715945	2013-06-29 20:03:00.715945
77129	34	20	16	2013-06-29 20:03:00.716654	2013-06-29 20:03:00.716654
77130	34	10	17	2013-06-29 20:03:00.7201	2013-06-29 20:03:00.7201
77131	34	11	17	2013-06-29 20:03:00.720859	2013-06-29 20:03:00.720859
77132	34	12	17	2013-06-29 20:03:00.721654	2013-06-29 20:03:00.721654
77133	34	13	17	2013-06-29 20:03:00.72237	2013-06-29 20:03:00.72237
77134	34	14	17	2013-06-29 20:03:00.723166	2013-06-29 20:03:00.723166
77135	34	15	17	2013-06-29 20:03:00.724035	2013-06-29 20:03:00.724035
77136	34	16	17	2013-06-29 20:03:00.724981	2013-06-29 20:03:00.724981
77137	34	17	17	2013-06-29 20:03:00.725811	2013-06-29 20:03:00.725811
77138	34	18	17	2013-06-29 20:03:00.726607	2013-06-29 20:03:00.726607
77139	34	19	17	2013-06-29 20:03:00.727516	2013-06-29 20:03:00.727516
77140	34	20	17	2013-06-29 20:03:00.728441	2013-06-29 20:03:00.728441
77141	34	15	18	2013-06-29 20:03:00.729296	2013-06-29 20:03:00.729296
77142	34	16	18	2013-06-29 20:03:00.730037	2013-06-29 20:03:00.730037
77143	34	17	18	2013-06-29 20:03:00.730748	2013-06-29 20:03:00.730748
77144	34	18	18	2013-06-29 20:03:00.731408	2013-06-29 20:03:00.731408
77145	34	19	18	2013-06-29 20:03:00.732181	2013-06-29 20:03:00.732181
77146	34	20	18	2013-06-29 20:03:00.733434	2013-06-29 20:03:00.733434
77147	34	15	19	2013-06-29 20:03:00.735754	2013-06-29 20:03:00.735754
77148	34	16	19	2013-06-29 20:03:00.73652	2013-06-29 20:03:00.73652
77149	34	17	19	2013-06-29 20:03:00.737322	2013-06-29 20:03:00.737322
77150	34	18	19	2013-06-29 20:03:00.738252	2013-06-29 20:03:00.738252
77151	34	19	19	2013-06-29 20:03:00.738962	2013-06-29 20:03:00.738962
77152	34	20	19	2013-06-29 20:03:00.739671	2013-06-29 20:03:00.739671
77153	34	15	20	2013-06-29 20:03:00.741409	2013-06-29 20:03:00.741409
77154	34	16	20	2013-06-29 20:03:00.742299	2013-06-29 20:03:00.742299
77155	34	17	20	2013-06-29 20:03:00.743246	2013-06-29 20:03:00.743246
77156	34	18	20	2013-06-29 20:03:00.744072	2013-06-29 20:03:00.744072
77157	34	19	20	2013-06-29 20:03:00.744883	2013-06-29 20:03:00.744883
77158	34	20	20	2013-06-29 20:03:00.745707	2013-06-29 20:03:00.745707
77159	34	15	21	2013-06-29 20:03:00.746782	2013-06-29 20:03:00.746782
77160	34	16	21	2013-06-29 20:03:00.747523	2013-06-29 20:03:00.747523
77161	34	17	21	2013-06-29 20:03:00.748244	2013-06-29 20:03:00.748244
77162	34	18	21	2013-06-29 20:03:00.748963	2013-06-29 20:03:00.748963
77163	34	19	21	2013-06-29 20:03:00.749841	2013-06-29 20:03:00.749841
77164	34	20	21	2013-06-29 20:03:00.750804	2013-06-29 20:03:00.750804
78361	89	7	0	2013-06-29 20:25:33.155174	2013-06-29 20:25:33.155174
78362	89	8	0	2013-06-29 20:25:33.156142	2013-06-29 20:25:33.156142
78363	89	9	0	2013-06-29 20:25:33.156827	2013-06-29 20:25:33.156827
78364	89	7	1	2013-06-29 20:25:33.157579	2013-06-29 20:25:33.157579
78365	89	8	1	2013-06-29 20:25:33.15829	2013-06-29 20:25:33.15829
78366	89	9	1	2013-06-29 20:25:33.158957	2013-06-29 20:25:33.158957
78367	89	7	2	2013-06-29 20:25:33.15978	2013-06-29 20:25:33.15978
78368	89	8	2	2013-06-29 20:25:33.16051	2013-06-29 20:25:33.16051
78369	89	9	2	2013-06-29 20:25:33.161597	2013-06-29 20:25:33.161597
78370	89	10	2	2013-06-29 20:25:33.16234	2013-06-29 20:25:33.16234
78371	89	11	2	2013-06-29 20:25:33.163074	2013-06-29 20:25:33.163074
78372	89	12	2	2013-06-29 20:25:33.16374	2013-06-29 20:25:33.16374
78373	89	13	2	2013-06-29 20:25:33.164439	2013-06-29 20:25:33.164439
78374	89	14	2	2013-06-29 20:25:33.165117	2013-06-29 20:25:33.165117
78375	89	15	2	2013-06-29 20:25:33.16579	2013-06-29 20:25:33.16579
78376	89	16	2	2013-06-29 20:25:33.166622	2013-06-29 20:25:33.166622
78377	89	17	2	2013-06-29 20:25:33.167337	2013-06-29 20:25:33.167337
78378	89	18	2	2013-06-29 20:25:33.168017	2013-06-29 20:25:33.168017
78379	89	19	2	2013-06-29 20:25:33.168671	2013-06-29 20:25:33.168671
78380	89	7	3	2013-06-29 20:25:33.169371	2013-06-29 20:25:33.169371
78381	89	8	3	2013-06-29 20:25:33.170036	2013-06-29 20:25:33.170036
78382	89	9	3	2013-06-29 20:25:33.170721	2013-06-29 20:25:33.170721
78383	89	10	3	2013-06-29 20:25:33.171691	2013-06-29 20:25:33.171691
78384	89	11	3	2013-06-29 20:25:33.172618	2013-06-29 20:25:33.172618
78385	89	12	3	2013-06-29 20:25:33.173455	2013-06-29 20:25:33.173455
78386	89	13	3	2013-06-29 20:25:33.174202	2013-06-29 20:25:33.174202
78387	89	14	3	2013-06-29 20:25:33.17492	2013-06-29 20:25:33.17492
78388	89	15	3	2013-06-29 20:25:33.175647	2013-06-29 20:25:33.175647
78389	89	16	3	2013-06-29 20:25:33.176326	2013-06-29 20:25:33.176326
78390	89	17	3	2013-06-29 20:25:33.177123	2013-06-29 20:25:33.177123
78391	89	18	3	2013-06-29 20:25:33.177967	2013-06-29 20:25:33.177967
78392	89	19	3	2013-06-29 20:25:33.178655	2013-06-29 20:25:33.178655
78393	89	7	4	2013-06-29 20:25:33.182546	2013-06-29 20:25:33.182546
78394	89	8	4	2013-06-29 20:25:33.183227	2013-06-29 20:25:33.183227
78395	89	9	4	2013-06-29 20:25:33.183902	2013-06-29 20:25:33.183902
78396	89	10	4	2013-06-29 20:25:33.184611	2013-06-29 20:25:33.184611
78397	89	11	4	2013-06-29 20:25:33.185412	2013-06-29 20:25:33.185412
78398	89	12	4	2013-06-29 20:25:33.186214	2013-06-29 20:25:33.186214
78399	89	13	4	2013-06-29 20:25:33.187036	2013-06-29 20:25:33.187036
78400	89	14	4	2013-06-29 20:25:33.187868	2013-06-29 20:25:33.187868
78401	89	15	4	2013-06-29 20:25:33.188811	2013-06-29 20:25:33.188811
78402	89	16	4	2013-06-29 20:25:33.189711	2013-06-29 20:25:33.189711
78403	89	17	4	2013-06-29 20:25:33.190496	2013-06-29 20:25:33.190496
78404	89	18	4	2013-06-29 20:25:33.191198	2013-06-29 20:25:33.191198
78405	89	19	4	2013-06-29 20:25:33.191891	2013-06-29 20:25:33.191891
78406	89	7	5	2013-06-29 20:25:33.192634	2013-06-29 20:25:33.192634
78407	89	8	5	2013-06-29 20:25:33.193512	2013-06-29 20:25:33.193512
78408	89	9	5	2013-06-29 20:25:33.194248	2013-06-29 20:25:33.194248
78409	89	17	5	2013-06-29 20:25:33.194932	2013-06-29 20:25:33.194932
78410	89	18	5	2013-06-29 20:25:33.195619	2013-06-29 20:25:33.195619
78411	89	19	5	2013-06-29 20:25:33.196317	2013-06-29 20:25:33.196317
78412	89	7	6	2013-06-29 20:25:33.197056	2013-06-29 20:25:33.197056
78413	89	8	6	2013-06-29 20:25:33.197747	2013-06-29 20:25:33.197747
78414	89	9	6	2013-06-29 20:25:33.198571	2013-06-29 20:25:33.198571
78415	89	17	6	2013-06-29 20:25:33.201944	2013-06-29 20:25:33.201944
78416	89	18	6	2013-06-29 20:25:33.202633	2013-06-29 20:25:33.202633
78417	89	19	6	2013-06-29 20:25:33.203304	2013-06-29 20:25:33.203304
78418	89	7	7	2013-06-29 20:25:33.204029	2013-06-29 20:25:33.204029
78419	89	8	7	2013-06-29 20:25:33.204749	2013-06-29 20:25:33.204749
78420	89	9	7	2013-06-29 20:25:33.205645	2013-06-29 20:25:33.205645
78421	89	17	7	2013-06-29 20:25:33.206536	2013-06-29 20:25:33.206536
78422	89	18	7	2013-06-29 20:25:33.207344	2013-06-29 20:25:33.207344
78423	89	19	7	2013-06-29 20:25:33.208031	2013-06-29 20:25:33.208031
78424	89	7	8	2013-06-29 20:25:33.209672	2013-06-29 20:25:33.209672
78425	89	8	8	2013-06-29 20:25:33.210421	2013-06-29 20:25:33.210421
78426	89	9	8	2013-06-29 20:25:33.211157	2013-06-29 20:25:33.211157
78427	89	17	8	2013-06-29 20:25:33.211899	2013-06-29 20:25:33.211899
78428	89	18	8	2013-06-29 20:25:33.212635	2013-06-29 20:25:33.212635
78429	89	19	8	2013-06-29 20:25:33.21333	2013-06-29 20:25:33.21333
78430	89	3	9	2013-06-29 20:25:33.21501	2013-06-29 20:25:33.21501
78431	89	4	9	2013-06-29 20:25:33.215935	2013-06-29 20:25:33.215935
78432	89	5	9	2013-06-29 20:25:33.2167	2013-06-29 20:25:33.2167
78433	89	6	9	2013-06-29 20:25:33.2174	2013-06-29 20:25:33.2174
78434	89	7	9	2013-06-29 20:25:33.218069	2013-06-29 20:25:33.218069
78435	89	8	9	2013-06-29 20:25:33.218787	2013-06-29 20:25:33.218787
78436	89	9	9	2013-06-29 20:25:33.219457	2013-06-29 20:25:33.219457
78437	89	17	9	2013-06-29 20:25:33.220118	2013-06-29 20:25:33.220118
78438	89	18	9	2013-06-29 20:25:33.220794	2013-06-29 20:25:33.220794
78439	89	19	9	2013-06-29 20:25:33.22147	2013-06-29 20:25:33.22147
78440	89	20	9	2013-06-29 20:25:33.222141	2013-06-29 20:25:33.222141
78441	89	21	9	2013-06-29 20:25:33.222929	2013-06-29 20:25:33.222929
78442	89	22	9	2013-06-29 20:25:33.223649	2013-06-29 20:25:33.223649
78443	89	23	9	2013-06-29 20:25:33.224311	2013-06-29 20:25:33.224311
78444	89	24	9	2013-06-29 20:25:33.224974	2013-06-29 20:25:33.224974
78445	89	25	9	2013-06-29 20:25:33.225645	2013-06-29 20:25:33.225645
78446	89	26	9	2013-06-29 20:25:33.226512	2013-06-29 20:25:33.226512
78447	89	27	9	2013-06-29 20:25:33.227259	2013-06-29 20:25:33.227259
78448	89	28	9	2013-06-29 20:25:33.227959	2013-06-29 20:25:33.227959
78449	89	29	9	2013-06-29 20:25:33.228641	2013-06-29 20:25:33.228641
78450	89	3	10	2013-06-29 20:25:33.229336	2013-06-29 20:25:33.229336
78451	89	4	10	2013-06-29 20:25:33.230022	2013-06-29 20:25:33.230022
78452	89	17	10	2013-06-29 20:25:33.232014	2013-06-29 20:25:33.232014
78453	89	18	10	2013-06-29 20:25:33.232896	2013-06-29 20:25:33.232896
78454	89	27	10	2013-06-29 20:25:33.233722	2013-06-29 20:25:33.233722
78455	89	28	10	2013-06-29 20:25:33.234541	2013-06-29 20:25:33.234541
78456	89	29	10	2013-06-29 20:25:33.235431	2013-06-29 20:25:33.235431
78457	89	3	11	2013-06-29 20:25:33.237198	2013-06-29 20:25:33.237198
78458	89	4	11	2013-06-29 20:25:33.237978	2013-06-29 20:25:33.237978
78459	89	17	11	2013-06-29 20:25:33.238741	2013-06-29 20:25:33.238741
78460	89	18	11	2013-06-29 20:25:33.239439	2013-06-29 20:25:33.239439
78461	89	27	11	2013-06-29 20:25:33.24101	2013-06-29 20:25:33.24101
78462	89	28	11	2013-06-29 20:25:33.241752	2013-06-29 20:25:33.241752
78463	89	29	11	2013-06-29 20:25:33.242606	2013-06-29 20:25:33.242606
78464	89	3	12	2013-06-29 20:25:33.244231	2013-06-29 20:25:33.244231
78465	89	4	12	2013-06-29 20:25:33.245042	2013-06-29 20:25:33.245042
78466	89	17	12	2013-06-29 20:25:33.246683	2013-06-29 20:25:33.246683
78467	89	18	12	2013-06-29 20:25:33.247582	2013-06-29 20:25:33.247582
78468	89	27	12	2013-06-29 20:25:33.248428	2013-06-29 20:25:33.248428
78469	89	28	12	2013-06-29 20:25:33.249191	2013-06-29 20:25:33.249191
78470	89	29	12	2013-06-29 20:25:33.249909	2013-06-29 20:25:33.249909
78471	89	3	13	2013-06-29 20:25:33.250643	2013-06-29 20:25:33.250643
78472	89	4	13	2013-06-29 20:25:33.251493	2013-06-29 20:25:33.251493
78473	89	10	13	2013-06-29 20:25:33.284723	2013-06-29 20:25:33.284723
78474	89	11	13	2013-06-29 20:25:33.285497	2013-06-29 20:25:33.285497
78475	89	12	13	2013-06-29 20:25:33.286217	2013-06-29 20:25:33.286217
78476	89	13	13	2013-06-29 20:25:33.286983	2013-06-29 20:25:33.286983
78477	89	14	13	2013-06-29 20:25:33.287786	2013-06-29 20:25:33.287786
78478	89	15	13	2013-06-29 20:25:33.288669	2013-06-29 20:25:33.288669
78479	89	16	13	2013-06-29 20:25:33.28954	2013-06-29 20:25:33.28954
78480	89	17	13	2013-06-29 20:25:33.29089	2013-06-29 20:25:33.29089
78481	89	18	13	2013-06-29 20:25:33.291994	2013-06-29 20:25:33.291994
78482	89	27	13	2013-06-29 20:25:33.294887	2013-06-29 20:25:33.294887
78483	89	28	13	2013-06-29 20:25:33.295773	2013-06-29 20:25:33.295773
78484	89	29	13	2013-06-29 20:25:33.296594	2013-06-29 20:25:33.296594
78485	89	3	14	2013-06-29 20:25:33.297356	2013-06-29 20:25:33.297356
78486	89	4	14	2013-06-29 20:25:33.298269	2013-06-29 20:25:33.298269
78487	89	10	14	2013-06-29 20:25:33.299327	2013-06-29 20:25:33.299327
78488	89	18	14	2013-06-29 20:25:33.300146	2013-06-29 20:25:33.300146
78489	89	22	14	2013-06-29 20:25:33.300843	2013-06-29 20:25:33.300843
78490	89	23	14	2013-06-29 20:25:33.301645	2013-06-29 20:25:33.301645
78491	89	24	14	2013-06-29 20:25:33.302314	2013-06-29 20:25:33.302314
78492	89	25	14	2013-06-29 20:25:33.303062	2013-06-29 20:25:33.303062
78493	89	26	14	2013-06-29 20:25:33.303792	2013-06-29 20:25:33.303792
78494	89	27	14	2013-06-29 20:25:33.304453	2013-06-29 20:25:33.304453
78495	89	28	14	2013-06-29 20:25:33.305125	2013-06-29 20:25:33.305125
78496	89	29	14	2013-06-29 20:25:33.305919	2013-06-29 20:25:33.305919
78497	89	10	15	2013-06-29 20:25:33.307739	2013-06-29 20:25:33.307739
78498	89	18	15	2013-06-29 20:25:33.310037	2013-06-29 20:25:33.310037
78499	89	22	15	2013-06-29 20:25:33.310819	2013-06-29 20:25:33.310819
78500	89	23	15	2013-06-29 20:25:33.311865	2013-06-29 20:25:33.311865
78501	89	24	15	2013-06-29 20:25:33.312693	2013-06-29 20:25:33.312693
78502	89	25	15	2013-06-29 20:25:33.313471	2013-06-29 20:25:33.313471
78503	89	26	15	2013-06-29 20:25:33.314205	2013-06-29 20:25:33.314205
78504	89	27	15	2013-06-29 20:25:33.315032	2013-06-29 20:25:33.315032
78505	89	28	15	2013-06-29 20:25:33.315742	2013-06-29 20:25:33.315742
78506	89	29	15	2013-06-29 20:25:33.316422	2013-06-29 20:25:33.316422
78507	89	10	16	2013-06-29 20:25:33.31711	2013-06-29 20:25:33.31711
78508	89	18	16	2013-06-29 20:25:33.317851	2013-06-29 20:25:33.317851
78509	89	22	16	2013-06-29 20:25:33.318587	2013-06-29 20:25:33.318587
78510	89	23	16	2013-06-29 20:25:33.31927	2013-06-29 20:25:33.31927
78511	89	28	16	2013-06-29 20:25:33.319993	2013-06-29 20:25:33.319993
78512	89	29	16	2013-06-29 20:25:33.320724	2013-06-29 20:25:33.320724
78513	89	10	17	2013-06-29 20:25:33.321502	2013-06-29 20:25:33.321502
78514	89	18	17	2013-06-29 20:25:33.323285	2013-06-29 20:25:33.323285
78515	89	22	17	2013-06-29 20:25:33.325333	2013-06-29 20:25:33.325333
78516	89	23	17	2013-06-29 20:25:33.326029	2013-06-29 20:25:33.326029
78517	89	28	17	2013-06-29 20:25:33.329841	2013-06-29 20:25:33.329841
78518	89	29	17	2013-06-29 20:25:33.330696	2013-06-29 20:25:33.330696
78519	89	18	18	2013-06-29 20:25:33.331594	2013-06-29 20:25:33.331594
78520	89	22	18	2013-06-29 20:25:33.332309	2013-06-29 20:25:33.332309
78521	89	23	18	2013-06-29 20:25:33.333033	2013-06-29 20:25:33.333033
78522	89	28	18	2013-06-29 20:25:33.333802	2013-06-29 20:25:33.333802
78523	89	29	18	2013-06-29 20:25:33.334486	2013-06-29 20:25:33.334486
78524	89	18	19	2013-06-29 20:25:33.335324	2013-06-29 20:25:33.335324
78525	89	0	20	2013-06-29 20:25:33.336045	2013-06-29 20:25:33.336045
78526	89	1	20	2013-06-29 20:25:33.336752	2013-06-29 20:25:33.336752
78527	89	34	20	2013-06-29 20:25:33.337498	2013-06-29 20:25:33.337498
78528	89	35	20	2013-06-29 20:25:33.338339	2013-06-29 20:25:33.338339
78529	89	0	21	2013-06-29 20:25:33.339039	2013-06-29 20:25:33.339039
78530	89	1	21	2013-06-29 20:25:33.3397	2013-06-29 20:25:33.3397
78531	89	34	21	2013-06-29 20:25:33.34413	2013-06-29 20:25:33.34413
78532	89	35	21	2013-06-29 20:25:33.345447	2013-06-29 20:25:33.345447
78945	90	7	4	2013-06-29 22:02:26.314208	2013-06-29 22:02:26.314208
78946	90	8	4	2013-06-29 22:02:26.314934	2013-06-29 22:02:26.314934
78947	90	9	4	2013-06-29 22:02:26.315634	2013-06-29 22:02:26.315634
78948	90	10	4	2013-06-29 22:02:26.316365	2013-06-29 22:02:26.316365
78949	90	15	4	2013-06-29 22:02:26.317131	2013-06-29 22:02:26.317131
78950	90	16	4	2013-06-29 22:02:26.317942	2013-06-29 22:02:26.317942
78951	90	17	4	2013-06-29 22:02:26.318748	2013-06-29 22:02:26.318748
78952	90	18	4	2013-06-29 22:02:26.319541	2013-06-29 22:02:26.319541
78953	90	19	4	2013-06-29 22:02:26.320225	2013-06-29 22:02:26.320225
78954	90	5	5	2013-06-29 22:02:26.32099	2013-06-29 22:02:26.32099
78955	90	6	5	2013-06-29 22:02:26.321719	2013-06-29 22:02:26.321719
78956	90	7	5	2013-06-29 22:02:26.322379	2013-06-29 22:02:26.322379
78957	90	8	5	2013-06-29 22:02:26.323084	2013-06-29 22:02:26.323084
78958	90	9	5	2013-06-29 22:02:26.323848	2013-06-29 22:02:26.323848
78959	90	10	5	2013-06-29 22:02:26.324752	2013-06-29 22:02:26.324752
78960	90	11	5	2013-06-29 22:02:26.326108	2013-06-29 22:02:26.326108
78961	90	12	5	2013-06-29 22:02:26.327113	2013-06-29 22:02:26.327113
78962	90	13	5	2013-06-29 22:02:26.328481	2013-06-29 22:02:26.328481
78963	90	14	5	2013-06-29 22:02:26.329491	2013-06-29 22:02:26.329491
78964	90	15	5	2013-06-29 22:02:26.33021	2013-06-29 22:02:26.33021
78965	90	16	5	2013-06-29 22:02:26.330982	2013-06-29 22:02:26.330982
78966	90	17	5	2013-06-29 22:02:26.331673	2013-06-29 22:02:26.331673
78967	90	18	5	2013-06-29 22:02:26.332375	2013-06-29 22:02:26.332375
78968	90	19	5	2013-06-29 22:02:26.333076	2013-06-29 22:02:26.333076
78969	90	20	5	2013-06-29 22:02:26.333738	2013-06-29 22:02:26.333738
78970	90	21	5	2013-06-29 22:02:26.334413	2013-06-29 22:02:26.334413
78971	90	22	5	2013-06-29 22:02:26.335248	2013-06-29 22:02:26.335248
78972	90	3	6	2013-06-29 22:02:26.336138	2013-06-29 22:02:26.336138
78973	90	4	6	2013-06-29 22:02:26.337078	2013-06-29 22:02:26.337078
78974	90	5	6	2013-06-29 22:02:26.337926	2013-06-29 22:02:26.337926
78975	90	6	6	2013-06-29 22:02:26.338647	2013-06-29 22:02:26.338647
78976	90	7	6	2013-06-29 22:02:26.339337	2013-06-29 22:02:26.339337
78977	90	11	6	2013-06-29 22:02:26.340546	2013-06-29 22:02:26.340546
78978	90	12	6	2013-06-29 22:02:26.341478	2013-06-29 22:02:26.341478
78979	90	13	6	2013-06-29 22:02:26.342323	2013-06-29 22:02:26.342323
78980	90	14	6	2013-06-29 22:02:26.343033	2013-06-29 22:02:26.343033
78981	90	15	6	2013-06-29 22:02:26.344089	2013-06-29 22:02:26.344089
78982	90	16	6	2013-06-29 22:02:26.345074	2013-06-29 22:02:26.345074
78983	90	17	6	2013-06-29 22:02:26.345954	2013-06-29 22:02:26.345954
78984	90	20	6	2013-06-29 22:02:26.346784	2013-06-29 22:02:26.346784
78985	90	21	6	2013-06-29 22:02:26.347489	2013-06-29 22:02:26.347489
78986	90	22	6	2013-06-29 22:02:26.348381	2013-06-29 22:02:26.348381
78987	90	23	6	2013-06-29 22:02:26.349135	2013-06-29 22:02:26.349135
78988	90	24	6	2013-06-29 22:02:26.349812	2013-06-29 22:02:26.349812
78989	90	25	6	2013-06-29 22:02:26.350491	2013-06-29 22:02:26.350491
78990	90	26	6	2013-06-29 22:02:26.351157	2013-06-29 22:02:26.351157
78991	90	3	7	2013-06-29 22:02:26.352062	2013-06-29 22:02:26.352062
78992	90	4	7	2013-06-29 22:02:26.352924	2013-06-29 22:02:26.352924
78993	90	5	7	2013-06-29 22:02:26.353936	2013-06-29 22:02:26.353936
78994	90	12	7	2013-06-29 22:02:26.354733	2013-06-29 22:02:26.354733
78995	90	13	7	2013-06-29 22:02:26.355486	2013-06-29 22:02:26.355486
78996	90	14	7	2013-06-29 22:02:26.356175	2013-06-29 22:02:26.356175
78997	90	15	7	2013-06-29 22:02:26.357299	2013-06-29 22:02:26.357299
78998	90	16	7	2013-06-29 22:02:26.358739	2013-06-29 22:02:26.358739
78999	90	17	7	2013-06-29 22:02:26.359863	2013-06-29 22:02:26.359863
79000	90	18	7	2013-06-29 22:02:26.360646	2013-06-29 22:02:26.360646
79001	90	19	7	2013-06-29 22:02:26.361516	2013-06-29 22:02:26.361516
79002	90	24	7	2013-06-29 22:02:26.362328	2013-06-29 22:02:26.362328
79003	90	25	7	2013-06-29 22:02:26.363093	2013-06-29 22:02:26.363093
79004	90	26	7	2013-06-29 22:02:26.363898	2013-06-29 22:02:26.363898
79005	90	27	7	2013-06-29 22:02:26.364958	2013-06-29 22:02:26.364958
79006	90	28	7	2013-06-29 22:02:26.365757	2013-06-29 22:02:26.365757
79007	90	29	7	2013-06-29 22:02:26.366427	2013-06-29 22:02:26.366427
79008	90	2	8	2013-06-29 22:02:26.367271	2013-06-29 22:02:26.367271
79009	90	3	8	2013-06-29 22:02:26.368014	2013-06-29 22:02:26.368014
79010	90	9	8	2013-06-29 22:02:26.368754	2013-06-29 22:02:26.368754
79011	90	10	8	2013-06-29 22:02:26.369467	2013-06-29 22:02:26.369467
79012	90	11	8	2013-06-29 22:02:26.370189	2013-06-29 22:02:26.370189
79013	90	12	8	2013-06-29 22:02:26.370866	2013-06-29 22:02:26.370866
79014	90	13	8	2013-06-29 22:02:26.371541	2013-06-29 22:02:26.371541
79015	90	14	8	2013-06-29 22:02:26.372207	2013-06-29 22:02:26.372207
79016	90	15	8	2013-06-29 22:02:26.372998	2013-06-29 22:02:26.372998
79017	90	18	8	2013-06-29 22:02:26.374084	2013-06-29 22:02:26.374084
79018	90	19	8	2013-06-29 22:02:26.374934	2013-06-29 22:02:26.374934
79019	90	20	8	2013-06-29 22:02:26.375776	2013-06-29 22:02:26.375776
79020	90	21	8	2013-06-29 22:02:26.376561	2013-06-29 22:02:26.376561
79021	90	27	8	2013-06-29 22:02:26.377477	2013-06-29 22:02:26.377477
79022	90	28	8	2013-06-29 22:02:26.378341	2013-06-29 22:02:26.378341
79023	90	29	8	2013-06-29 22:02:26.37903	2013-06-29 22:02:26.37903
79024	90	30	8	2013-06-29 22:02:26.379859	2013-06-29 22:02:26.379859
79025	90	31	8	2013-06-29 22:02:26.380726	2013-06-29 22:02:26.380726
79026	90	2	9	2013-06-29 22:02:26.381554	2013-06-29 22:02:26.381554
79027	90	7	9	2013-06-29 22:02:26.382276	2013-06-29 22:02:26.382276
79028	90	8	9	2013-06-29 22:02:26.383011	2013-06-29 22:02:26.383011
79029	90	9	9	2013-06-29 22:02:26.383695	2013-06-29 22:02:26.383695
79030	90	10	9	2013-06-29 22:02:26.384385	2013-06-29 22:02:26.384385
79031	90	15	9	2013-06-29 22:02:26.385123	2013-06-29 22:02:26.385123
79032	90	16	9	2013-06-29 22:02:26.385797	2013-06-29 22:02:26.385797
79033	90	20	9	2013-06-29 22:02:26.386481	2013-06-29 22:02:26.386481
79034	90	21	9	2013-06-29 22:02:26.387335	2013-06-29 22:02:26.387335
79035	90	22	9	2013-06-29 22:02:26.388066	2013-06-29 22:02:26.388066
79036	90	31	9	2013-06-29 22:02:26.388784	2013-06-29 22:02:26.388784
79037	90	6	10	2013-06-29 22:02:26.390876	2013-06-29 22:02:26.390876
79038	90	7	10	2013-06-29 22:02:26.391703	2013-06-29 22:02:26.391703
79039	90	8	10	2013-06-29 22:02:26.392427	2013-06-29 22:02:26.392427
79040	90	16	10	2013-06-29 22:02:26.393102	2013-06-29 22:02:26.393102
79041	90	17	10	2013-06-29 22:02:26.393858	2013-06-29 22:02:26.393858
79042	90	22	10	2013-06-29 22:02:26.394706	2013-06-29 22:02:26.394706
79043	90	23	10	2013-06-29 22:02:26.395409	2013-06-29 22:02:26.395409
79044	90	24	10	2013-06-29 22:02:26.396081	2013-06-29 22:02:26.396081
79045	90	6	11	2013-06-29 22:02:26.397634	2013-06-29 22:02:26.397634
79046	90	7	11	2013-06-29 22:02:26.398453	2013-06-29 22:02:26.398453
79047	90	16	11	2013-06-29 22:02:26.39929	2013-06-29 22:02:26.39929
79048	90	17	11	2013-06-29 22:02:26.399991	2013-06-29 22:02:26.399991
79049	90	24	11	2013-06-29 22:02:26.400727	2013-06-29 22:02:26.400727
79050	90	25	11	2013-06-29 22:02:26.401412	2013-06-29 22:02:26.401412
79051	90	6	12	2013-06-29 22:02:26.402114	2013-06-29 22:02:26.402114
79052	90	17	12	2013-06-29 22:02:26.402845	2013-06-29 22:02:26.402845
79053	90	18	12	2013-06-29 22:02:26.403525	2013-06-29 22:02:26.403525
79054	90	25	12	2013-06-29 22:02:26.404214	2013-06-29 22:02:26.404214
79055	90	17	13	2013-06-29 22:02:26.405816	2013-06-29 22:02:26.405816
79056	90	18	13	2013-06-29 22:02:26.406781	2013-06-29 22:02:26.406781
79057	90	17	14	2013-06-29 22:02:26.408933	2013-06-29 22:02:26.408933
79058	90	18	14	2013-06-29 22:02:26.409879	2013-06-29 22:02:26.409879
79059	90	17	15	2013-06-29 22:02:26.410699	2013-06-29 22:02:26.410699
79060	90	18	15	2013-06-29 22:02:26.411535	2013-06-29 22:02:26.411535
79061	90	16	16	2013-06-29 22:02:26.412323	2013-06-29 22:02:26.412323
79062	90	17	16	2013-06-29 22:02:26.413008	2013-06-29 22:02:26.413008
79063	90	18	16	2013-06-29 22:02:26.413708	2013-06-29 22:02:26.413708
79064	90	16	17	2013-06-29 22:02:26.416873	2013-06-29 22:02:26.416873
79065	90	17	17	2013-06-29 22:02:26.417663	2013-06-29 22:02:26.417663
79066	90	18	17	2013-06-29 22:02:26.418454	2013-06-29 22:02:26.418454
79067	90	26	17	2013-06-29 22:02:26.419129	2013-06-29 22:02:26.419129
79068	90	27	17	2013-06-29 22:02:26.419953	2013-06-29 22:02:26.419953
79069	90	28	17	2013-06-29 22:02:26.420767	2013-06-29 22:02:26.420767
79070	90	29	17	2013-06-29 22:02:26.421499	2013-06-29 22:02:26.421499
79071	90	30	17	2013-06-29 22:02:26.422236	2013-06-29 22:02:26.422236
79072	90	31	17	2013-06-29 22:02:26.423008	2013-06-29 22:02:26.423008
79073	90	32	17	2013-06-29 22:02:26.423901	2013-06-29 22:02:26.423901
79074	90	33	17	2013-06-29 22:02:26.424912	2013-06-29 22:02:26.424912
79075	90	34	17	2013-06-29 22:02:26.425845	2013-06-29 22:02:26.425845
79076	90	35	17	2013-06-29 22:02:26.426829	2013-06-29 22:02:26.426829
79077	90	16	18	2013-06-29 22:02:26.428373	2013-06-29 22:02:26.428373
79078	90	17	18	2013-06-29 22:02:26.429748	2013-06-29 22:02:26.429748
79079	90	26	18	2013-06-29 22:02:26.431015	2013-06-29 22:02:26.431015
79080	90	29	18	2013-06-29 22:02:26.432174	2013-06-29 22:02:26.432174
79081	90	16	19	2013-06-29 22:02:26.433056	2013-06-29 22:02:26.433056
79082	90	17	19	2013-06-29 22:02:26.433744	2013-06-29 22:02:26.433744
79083	90	26	19	2013-06-29 22:02:26.434531	2013-06-29 22:02:26.434531
79084	90	29	19	2013-06-29 22:02:26.435265	2013-06-29 22:02:26.435265
79085	90	16	20	2013-06-29 22:02:26.436006	2013-06-29 22:02:26.436006
79086	90	17	20	2013-06-29 22:02:26.436739	2013-06-29 22:02:26.436739
79087	90	26	20	2013-06-29 22:02:26.43748	2013-06-29 22:02:26.43748
79088	90	29	20	2013-06-29 22:02:26.438243	2013-06-29 22:02:26.438243
79089	90	14	21	2013-06-29 22:02:26.439043	2013-06-29 22:02:26.439043
79090	90	15	21	2013-06-29 22:02:26.439725	2013-06-29 22:02:26.439725
79091	90	16	21	2013-06-29 22:02:26.440633	2013-06-29 22:02:26.440633
79092	90	17	21	2013-06-29 22:02:26.441626	2013-06-29 22:02:26.441626
79093	90	18	21	2013-06-29 22:02:26.44248	2013-06-29 22:02:26.44248
79094	90	26	21	2013-06-29 22:02:26.443367	2013-06-29 22:02:26.443367
79095	85	15	0	2013-06-29 22:16:43.533465	2013-06-29 22:16:43.533465
79096	85	16	0	2013-06-29 22:16:43.534951	2013-06-29 22:16:43.534951
79097	85	26	0	2013-06-29 22:16:43.538061	2013-06-29 22:16:43.538061
79098	85	27	0	2013-06-29 22:16:43.53911	2013-06-29 22:16:43.53911
79099	85	15	1	2013-06-29 22:16:43.541859	2013-06-29 22:16:43.541859
79100	85	16	1	2013-06-29 22:16:43.542909	2013-06-29 22:16:43.542909
79101	85	26	1	2013-06-29 22:16:43.543851	2013-06-29 22:16:43.543851
79102	85	27	1	2013-06-29 22:16:43.544737	2013-06-29 22:16:43.544737
79103	85	15	2	2013-06-29 22:16:43.545721	2013-06-29 22:16:43.545721
79104	85	16	2	2013-06-29 22:16:43.546482	2013-06-29 22:16:43.546482
79105	85	26	2	2013-06-29 22:16:43.547209	2013-06-29 22:16:43.547209
79106	85	27	2	2013-06-29 22:16:43.547947	2013-06-29 22:16:43.547947
79107	85	15	3	2013-06-29 22:16:43.548719	2013-06-29 22:16:43.548719
79108	85	16	3	2013-06-29 22:16:43.54943	2013-06-29 22:16:43.54943
79109	85	15	4	2013-06-29 22:16:43.551748	2013-06-29 22:16:43.551748
79110	85	16	4	2013-06-29 22:16:43.55267	2013-06-29 22:16:43.55267
79111	85	15	9	2013-06-29 22:16:43.557721	2013-06-29 22:16:43.557721
79112	85	16	9	2013-06-29 22:16:43.55846	2013-06-29 22:16:43.55846
79113	85	17	9	2013-06-29 22:16:43.559188	2013-06-29 22:16:43.559188
79114	85	18	9	2013-06-29 22:16:43.560016	2013-06-29 22:16:43.560016
79115	85	19	9	2013-06-29 22:16:43.560874	2013-06-29 22:16:43.560874
79116	85	20	9	2013-06-29 22:16:43.561869	2013-06-29 22:16:43.561869
79117	85	21	9	2013-06-29 22:16:43.562651	2013-06-29 22:16:43.562651
79118	85	22	9	2013-06-29 22:16:43.563342	2013-06-29 22:16:43.563342
79119	85	23	9	2013-06-29 22:16:43.564013	2013-06-29 22:16:43.564013
79120	85	24	9	2013-06-29 22:16:43.564669	2013-06-29 22:16:43.564669
79121	85	25	9	2013-06-29 22:16:43.565395	2013-06-29 22:16:43.565395
79122	85	26	9	2013-06-29 22:16:43.566189	2013-06-29 22:16:43.566189
79123	85	27	9	2013-06-29 22:16:43.567117	2013-06-29 22:16:43.567117
79124	85	28	9	2013-06-29 22:16:43.567975	2013-06-29 22:16:43.567975
79125	85	29	9	2013-06-29 22:16:43.568838	2013-06-29 22:16:43.568838
79126	85	30	9	2013-06-29 22:16:43.569543	2013-06-29 22:16:43.569543
79127	85	31	9	2013-06-29 22:16:43.570248	2013-06-29 22:16:43.570248
79128	85	32	9	2013-06-29 22:16:43.571264	2013-06-29 22:16:43.571264
79129	85	33	9	2013-06-29 22:16:43.57279	2013-06-29 22:16:43.57279
79130	85	34	9	2013-06-29 22:16:43.574278	2013-06-29 22:16:43.574278
79131	85	35	9	2013-06-29 22:16:43.575098	2013-06-29 22:16:43.575098
79132	85	15	10	2013-06-29 22:16:43.575837	2013-06-29 22:16:43.575837
79133	85	16	10	2013-06-29 22:16:43.576569	2013-06-29 22:16:43.576569
79134	85	17	10	2013-06-29 22:16:43.577405	2013-06-29 22:16:43.577405
79135	85	18	10	2013-06-29 22:16:43.5783	2013-06-29 22:16:43.5783
79136	85	19	10	2013-06-29 22:16:43.579122	2013-06-29 22:16:43.579122
79137	85	20	10	2013-06-29 22:16:43.5799	2013-06-29 22:16:43.5799
79138	85	21	10	2013-06-29 22:16:43.580589	2013-06-29 22:16:43.580589
79139	85	22	10	2013-06-29 22:16:43.581284	2013-06-29 22:16:43.581284
79140	85	23	10	2013-06-29 22:16:43.581972	2013-06-29 22:16:43.581972
79141	85	24	10	2013-06-29 22:16:43.582799	2013-06-29 22:16:43.582799
79142	85	25	10	2013-06-29 22:16:43.583515	2013-06-29 22:16:43.583515
79143	85	26	10	2013-06-29 22:16:43.584364	2013-06-29 22:16:43.584364
79144	85	27	10	2013-06-29 22:16:43.585118	2013-06-29 22:16:43.585118
79145	85	28	10	2013-06-29 22:16:43.585794	2013-06-29 22:16:43.585794
79146	85	29	10	2013-06-29 22:16:43.586836	2013-06-29 22:16:43.586836
79147	85	30	10	2013-06-29 22:16:43.588213	2013-06-29 22:16:43.588213
79148	85	31	10	2013-06-29 22:16:43.589381	2013-06-29 22:16:43.589381
79149	85	32	10	2013-06-29 22:16:43.59021	2013-06-29 22:16:43.59021
79150	85	33	10	2013-06-29 22:16:43.590967	2013-06-29 22:16:43.590967
79151	85	34	10	2013-06-29 22:16:43.59185	2013-06-29 22:16:43.59185
79152	85	35	10	2013-06-29 22:16:43.592601	2013-06-29 22:16:43.592601
79153	85	20	11	2013-06-29 22:16:43.594469	2013-06-29 22:16:43.594469
79154	85	11	15	2013-06-29 22:16:43.598495	2013-06-29 22:16:43.598495
79155	85	12	15	2013-06-29 22:16:43.599204	2013-06-29 22:16:43.599204
79156	85	13	15	2013-06-29 22:16:43.599861	2013-06-29 22:16:43.599861
79157	85	14	15	2013-06-29 22:16:43.600637	2013-06-29 22:16:43.600637
79158	85	15	15	2013-06-29 22:16:43.601577	2013-06-29 22:16:43.601577
79159	85	16	15	2013-06-29 22:16:43.602322	2013-06-29 22:16:43.602322
79160	85	17	15	2013-06-29 22:16:43.603039	2013-06-29 22:16:43.603039
79161	85	11	16	2013-06-29 22:16:43.605312	2013-06-29 22:16:43.605312
79162	85	12	16	2013-06-29 22:16:43.606227	2013-06-29 22:16:43.606227
79163	85	13	16	2013-06-29 22:16:43.606961	2013-06-29 22:16:43.606961
79164	85	14	16	2013-06-29 22:16:43.607677	2013-06-29 22:16:43.607677
79165	85	15	16	2013-06-29 22:16:43.608401	2013-06-29 22:16:43.608401
79166	85	16	16	2013-06-29 22:16:43.609129	2013-06-29 22:16:43.609129
79167	85	17	16	2013-06-29 22:16:43.609825	2013-06-29 22:16:43.609825
79168	85	11	17	2013-06-29 22:16:43.611407	2013-06-29 22:16:43.611407
79169	85	12	17	2013-06-29 22:16:43.612144	2013-06-29 22:16:43.612144
79170	85	13	17	2013-06-29 22:16:43.612821	2013-06-29 22:16:43.612821
79171	85	14	17	2013-06-29 22:16:43.613528	2013-06-29 22:16:43.613528
79172	85	15	17	2013-06-29 22:16:43.614194	2013-06-29 22:16:43.614194
79173	85	16	17	2013-06-29 22:16:43.6149	2013-06-29 22:16:43.6149
79174	85	17	17	2013-06-29 22:16:43.615594	2013-06-29 22:16:43.615594
79175	85	11	18	2013-06-29 22:16:43.618625	2013-06-29 22:16:43.618625
79176	85	12	18	2013-06-29 22:16:43.619429	2013-06-29 22:16:43.619429
79177	85	13	18	2013-06-29 22:16:43.620116	2013-06-29 22:16:43.620116
79178	85	14	18	2013-06-29 22:16:43.620886	2013-06-29 22:16:43.620886
79179	85	15	18	2013-06-29 22:16:43.621827	2013-06-29 22:16:43.621827
79180	85	16	18	2013-06-29 22:16:43.622621	2013-06-29 22:16:43.622621
79181	85	17	18	2013-06-29 22:16:43.623315	2013-06-29 22:16:43.623315
79182	85	11	19	2013-06-29 22:16:43.624073	2013-06-29 22:16:43.624073
79183	85	12	19	2013-06-29 22:16:43.624754	2013-06-29 22:16:43.624754
79184	85	13	19	2013-06-29 22:16:43.625428	2013-06-29 22:16:43.625428
79185	85	14	19	2013-06-29 22:16:43.626101	2013-06-29 22:16:43.626101
79186	85	15	19	2013-06-29 22:16:43.626769	2013-06-29 22:16:43.626769
79187	85	16	19	2013-06-29 22:16:43.627482	2013-06-29 22:16:43.627482
79188	85	17	19	2013-06-29 22:16:43.628298	2013-06-29 22:16:43.628298
79189	85	11	20	2013-06-29 22:16:43.629233	2013-06-29 22:16:43.629233
79190	85	12	20	2013-06-29 22:16:43.630006	2013-06-29 22:16:43.630006
79191	85	13	20	2013-06-29 22:16:43.630684	2013-06-29 22:16:43.630684
79192	85	14	20	2013-06-29 22:16:43.631375	2013-06-29 22:16:43.631375
79193	85	11	21	2013-06-29 22:16:43.632117	2013-06-29 22:16:43.632117
79194	85	12	21	2013-06-29 22:16:43.632869	2013-06-29 22:16:43.632869
79195	85	13	21	2013-06-29 22:16:43.633629	2013-06-29 22:16:43.633629
79196	85	14	21	2013-06-29 22:16:43.634358	2013-06-29 22:16:43.634358
79441	63	13	0	2013-06-29 23:10:45.387593	2013-06-29 23:10:45.387593
79442	63	14	0	2013-06-29 23:10:45.388418	2013-06-29 23:10:45.388418
79443	63	15	0	2013-06-29 23:10:45.389187	2013-06-29 23:10:45.389187
79444	63	13	1	2013-06-29 23:10:45.392261	2013-06-29 23:10:45.392261
79445	63	14	1	2013-06-29 23:10:45.3932	2013-06-29 23:10:45.3932
79446	63	15	1	2013-06-29 23:10:45.393941	2013-06-29 23:10:45.393941
79447	63	22	20	2013-06-29 23:10:45.404798	2013-06-29 23:10:45.404798
79448	63	23	20	2013-06-29 23:10:45.405588	2013-06-29 23:10:45.405588
79449	63	24	20	2013-06-29 23:10:45.406542	2013-06-29 23:10:45.406542
79450	63	22	21	2013-06-29 23:10:45.409317	2013-06-29 23:10:45.409317
79451	63	23	21	2013-06-29 23:10:45.410048	2013-06-29 23:10:45.410048
79452	63	24	21	2013-06-29 23:10:45.410746	2013-06-29 23:10:45.410746
80023	91	0	1	2013-06-30 21:01:24.575969	2013-06-30 21:01:24.575969
80024	91	1	1	2013-06-30 21:01:24.577101	2013-06-30 21:01:24.577101
80025	91	34	1	2013-06-30 21:01:24.57828	2013-06-30 21:01:24.57828
80026	91	35	1	2013-06-30 21:01:24.579733	2013-06-30 21:01:24.579733
80027	91	0	2	2013-06-30 21:01:24.58112	2013-06-30 21:01:24.58112
80028	91	1	2	2013-06-30 21:01:24.581953	2013-06-30 21:01:24.581953
80029	91	34	2	2013-06-30 21:01:24.582697	2013-06-30 21:01:24.582697
80030	91	35	2	2013-06-30 21:01:24.583506	2013-06-30 21:01:24.583506
80031	91	0	18	2013-06-30 21:01:24.608412	2013-06-30 21:01:24.608412
80032	91	1	18	2013-06-30 21:01:24.609195	2013-06-30 21:01:24.609195
80033	91	34	18	2013-06-30 21:01:24.610011	2013-06-30 21:01:24.610011
80034	91	35	18	2013-06-30 21:01:24.610811	2013-06-30 21:01:24.610811
80035	91	0	19	2013-06-30 21:01:24.612275	2013-06-30 21:01:24.612275
80036	91	1	19	2013-06-30 21:01:24.61321	2013-06-30 21:01:24.61321
80037	91	34	19	2013-06-30 21:01:24.615674	2013-06-30 21:01:24.615674
80038	91	35	19	2013-06-30 21:01:24.616376	2013-06-30 21:01:24.616376
81985	61	7	11	2013-07-05 18:13:16.181648	2013-07-05 18:13:16.181648
81986	61	8	11	2013-07-05 18:13:16.182828	2013-07-05 18:13:16.182828
81987	61	9	11	2013-07-05 18:13:16.183496	2013-07-05 18:13:16.183496
81988	61	10	11	2013-07-05 18:13:16.184183	2013-07-05 18:13:16.184183
81989	61	24	11	2013-07-05 18:13:16.184863	2013-07-05 18:13:16.184863
81990	61	25	11	2013-07-05 18:13:16.186025	2013-07-05 18:13:16.186025
81991	61	26	11	2013-07-05 18:13:16.186984	2013-07-05 18:13:16.186984
81992	61	27	11	2013-07-05 18:13:16.187779	2013-07-05 18:13:16.187779
81993	61	7	12	2013-07-05 18:13:16.188587	2013-07-05 18:13:16.188587
81994	61	8	12	2013-07-05 18:13:16.189342	2013-07-05 18:13:16.189342
81995	61	9	12	2013-07-05 18:13:16.19003	2013-07-05 18:13:16.19003
81996	61	10	12	2013-07-05 18:13:16.190831	2013-07-05 18:13:16.190831
81997	61	24	12	2013-07-05 18:13:16.191566	2013-07-05 18:13:16.191566
81998	61	25	12	2013-07-05 18:13:16.192208	2013-07-05 18:13:16.192208
81999	61	26	12	2013-07-05 18:13:16.192844	2013-07-05 18:13:16.192844
82000	61	27	12	2013-07-05 18:13:16.193479	2013-07-05 18:13:16.193479
82001	61	7	13	2013-07-05 18:13:16.194136	2013-07-05 18:13:16.194136
82002	61	8	13	2013-07-05 18:13:16.194771	2013-07-05 18:13:16.194771
82003	61	9	13	2013-07-05 18:13:16.195504	2013-07-05 18:13:16.195504
82004	61	10	13	2013-07-05 18:13:16.19616	2013-07-05 18:13:16.19616
82005	61	24	13	2013-07-05 18:13:16.197914	2013-07-05 18:13:16.197914
82006	61	25	13	2013-07-05 18:13:16.198576	2013-07-05 18:13:16.198576
82007	61	26	13	2013-07-05 18:13:16.19932	2013-07-05 18:13:16.19932
82008	61	27	13	2013-07-05 18:13:16.200162	2013-07-05 18:13:16.200162
82009	61	9	14	2013-07-05 18:13:16.200859	2013-07-05 18:13:16.200859
82010	61	10	14	2013-07-05 18:13:16.201537	2013-07-05 18:13:16.201537
82011	61	24	14	2013-07-05 18:13:16.204255	2013-07-05 18:13:16.204255
82012	61	25	14	2013-07-05 18:13:16.20492	2013-07-05 18:13:16.20492
82013	61	9	15	2013-07-05 18:13:16.205586	2013-07-05 18:13:16.205586
82014	61	10	15	2013-07-05 18:13:16.20622	2013-07-05 18:13:16.20622
82015	61	24	15	2013-07-05 18:13:16.206875	2013-07-05 18:13:16.206875
82016	61	25	15	2013-07-05 18:13:16.207531	2013-07-05 18:13:16.207531
82017	61	9	16	2013-07-05 18:13:16.210139	2013-07-05 18:13:16.210139
82018	61	10	16	2013-07-05 18:13:16.21083	2013-07-05 18:13:16.21083
82019	61	24	16	2013-07-05 18:13:16.212247	2013-07-05 18:13:16.212247
82020	61	25	16	2013-07-05 18:13:16.212889	2013-07-05 18:13:16.212889
82021	61	9	17	2013-07-05 18:13:16.215055	2013-07-05 18:13:16.215055
82022	61	10	17	2013-07-05 18:13:16.215708	2013-07-05 18:13:16.215708
82023	61	24	17	2013-07-05 18:13:16.216446	2013-07-05 18:13:16.216446
82024	61	25	17	2013-07-05 18:13:16.217221	2013-07-05 18:13:16.217221
82025	61	9	18	2013-07-05 18:13:16.218071	2013-07-05 18:13:16.218071
82026	61	10	18	2013-07-05 18:13:16.218838	2013-07-05 18:13:16.218838
82027	61	24	18	2013-07-05 18:13:16.220022	2013-07-05 18:13:16.220022
82028	61	25	18	2013-07-05 18:13:16.220787	2013-07-05 18:13:16.220787
82029	61	9	19	2013-07-05 18:13:16.221481	2013-07-05 18:13:16.221481
82030	61	10	19	2013-07-05 18:13:16.222159	2013-07-05 18:13:16.222159
82031	61	24	19	2013-07-05 18:13:16.222816	2013-07-05 18:13:16.222816
82032	61	25	19	2013-07-05 18:13:16.223495	2013-07-05 18:13:16.223495
82033	61	9	20	2013-07-05 18:13:16.224176	2013-07-05 18:13:16.224176
82034	61	10	20	2013-07-05 18:13:16.224838	2013-07-05 18:13:16.224838
82035	61	24	20	2013-07-05 18:13:16.225564	2013-07-05 18:13:16.225564
82036	61	25	20	2013-07-05 18:13:16.226208	2013-07-05 18:13:16.226208
82037	61	9	21	2013-07-05 18:13:16.226883	2013-07-05 18:13:16.226883
82038	61	10	21	2013-07-05 18:13:16.227518	2013-07-05 18:13:16.227518
82039	61	24	21	2013-07-05 18:13:16.229938	2013-07-05 18:13:16.229938
82040	61	25	21	2013-07-05 18:13:16.230733	2013-07-05 18:13:16.230733
82041	76	25	0	2013-07-05 21:10:24.160008	2013-07-05 21:10:24.160008
82042	76	26	0	2013-07-05 21:10:24.1613	2013-07-05 21:10:24.1613
82043	76	27	0	2013-07-05 21:10:24.162233	2013-07-05 21:10:24.162233
82044	76	28	0	2013-07-05 21:10:24.163167	2013-07-05 21:10:24.163167
82045	76	29	0	2013-07-05 21:10:24.164298	2013-07-05 21:10:24.164298
82046	76	30	0	2013-07-05 21:10:24.165339	2013-07-05 21:10:24.165339
82047	76	31	0	2013-07-05 21:10:24.16616	2013-07-05 21:10:24.16616
82048	76	32	0	2013-07-05 21:10:24.166848	2013-07-05 21:10:24.166848
82049	76	33	0	2013-07-05 21:10:24.167548	2013-07-05 21:10:24.167548
82050	76	34	0	2013-07-05 21:10:24.168405	2013-07-05 21:10:24.168405
82051	76	35	0	2013-07-05 21:10:24.169402	2013-07-05 21:10:24.169402
82052	76	25	1	2013-07-05 21:10:24.170368	2013-07-05 21:10:24.170368
82053	76	26	1	2013-07-05 21:10:24.171108	2013-07-05 21:10:24.171108
82054	76	27	1	2013-07-05 21:10:24.171945	2013-07-05 21:10:24.171945
82055	76	28	1	2013-07-05 21:10:24.172866	2013-07-05 21:10:24.172866
82056	76	29	1	2013-07-05 21:10:24.173626	2013-07-05 21:10:24.173626
82057	76	30	1	2013-07-05 21:10:24.174353	2013-07-05 21:10:24.174353
82058	76	31	1	2013-07-05 21:10:24.175084	2013-07-05 21:10:24.175084
82059	76	32	1	2013-07-05 21:10:24.175924	2013-07-05 21:10:24.175924
82060	76	33	1	2013-07-05 21:10:24.176636	2013-07-05 21:10:24.176636
82061	76	34	1	2013-07-05 21:10:24.177283	2013-07-05 21:10:24.177283
82062	76	35	1	2013-07-05 21:10:24.177947	2013-07-05 21:10:24.177947
82063	76	25	2	2013-07-05 21:10:24.178697	2013-07-05 21:10:24.178697
82064	76	26	2	2013-07-05 21:10:24.17954	2013-07-05 21:10:24.17954
82065	76	27	2	2013-07-05 21:10:24.180682	2013-07-05 21:10:24.180682
82066	76	28	2	2013-07-05 21:10:24.181816	2013-07-05 21:10:24.181816
82067	76	29	2	2013-07-05 21:10:24.182666	2013-07-05 21:10:24.182666
82068	76	30	2	2013-07-05 21:10:24.1834	2013-07-05 21:10:24.1834
82069	76	31	2	2013-07-05 21:10:24.184123	2013-07-05 21:10:24.184123
82070	76	32	2	2013-07-05 21:10:24.184962	2013-07-05 21:10:24.184962
82071	76	33	2	2013-07-05 21:10:24.185691	2013-07-05 21:10:24.185691
82072	76	34	2	2013-07-05 21:10:24.186412	2013-07-05 21:10:24.186412
82073	76	35	2	2013-07-05 21:10:24.187179	2013-07-05 21:10:24.187179
82074	76	25	3	2013-07-05 21:10:24.187871	2013-07-05 21:10:24.187871
82075	76	26	3	2013-07-05 21:10:24.188624	2013-07-05 21:10:24.188624
82076	76	27	3	2013-07-05 21:10:24.189383	2013-07-05 21:10:24.189383
82077	76	28	3	2013-07-05 21:10:24.190131	2013-07-05 21:10:24.190131
82078	76	29	3	2013-07-05 21:10:24.190804	2013-07-05 21:10:24.190804
82079	76	30	3	2013-07-05 21:10:24.191451	2013-07-05 21:10:24.191451
82080	76	31	3	2013-07-05 21:10:24.192145	2013-07-05 21:10:24.192145
82081	76	32	3	2013-07-05 21:10:24.193054	2013-07-05 21:10:24.193054
82082	76	33	3	2013-07-05 21:10:24.194019	2013-07-05 21:10:24.194019
82083	76	34	3	2013-07-05 21:10:24.19496	2013-07-05 21:10:24.19496
82084	76	35	3	2013-07-05 21:10:24.195676	2013-07-05 21:10:24.195676
82085	76	25	4	2013-07-05 21:10:24.196596	2013-07-05 21:10:24.196596
82086	76	26	4	2013-07-05 21:10:24.197624	2013-07-05 21:10:24.197624
82087	76	27	4	2013-07-05 21:10:24.198536	2013-07-05 21:10:24.198536
82088	76	28	4	2013-07-05 21:10:24.199341	2013-07-05 21:10:24.199341
82089	76	29	4	2013-07-05 21:10:24.200106	2013-07-05 21:10:24.200106
82090	76	30	4	2013-07-05 21:10:24.200877	2013-07-05 21:10:24.200877
82091	76	31	4	2013-07-05 21:10:24.201783	2013-07-05 21:10:24.201783
82092	76	32	4	2013-07-05 21:10:24.202695	2013-07-05 21:10:24.202695
82093	76	33	4	2013-07-05 21:10:24.20344	2013-07-05 21:10:24.20344
82094	76	34	4	2013-07-05 21:10:24.20413	2013-07-05 21:10:24.20413
82095	76	35	4	2013-07-05 21:10:24.204853	2013-07-05 21:10:24.204853
82096	76	25	5	2013-07-05 21:10:24.205615	2013-07-05 21:10:24.205615
82097	76	26	5	2013-07-05 21:10:24.206317	2013-07-05 21:10:24.206317
82098	76	27	5	2013-07-05 21:10:24.206995	2013-07-05 21:10:24.206995
82099	76	28	5	2013-07-05 21:10:24.207668	2013-07-05 21:10:24.207668
82100	76	29	5	2013-07-05 21:10:24.208318	2013-07-05 21:10:24.208318
82101	76	30	5	2013-07-05 21:10:24.208999	2013-07-05 21:10:24.208999
82102	76	31	5	2013-07-05 21:10:24.209768	2013-07-05 21:10:24.209768
82103	76	32	5	2013-07-05 21:10:24.210469	2013-07-05 21:10:24.210469
82104	76	33	5	2013-07-05 21:10:24.211125	2013-07-05 21:10:24.211125
82105	76	34	5	2013-07-05 21:10:24.211793	2013-07-05 21:10:24.211793
82106	76	35	5	2013-07-05 21:10:24.21266	2013-07-05 21:10:24.21266
82107	76	25	6	2013-07-05 21:10:24.213651	2013-07-05 21:10:24.213651
82108	76	26	6	2013-07-05 21:10:24.214967	2013-07-05 21:10:24.214967
82109	76	27	6	2013-07-05 21:10:24.215993	2013-07-05 21:10:24.215993
82110	76	28	6	2013-07-05 21:10:24.216695	2013-07-05 21:10:24.216695
82111	76	29	6	2013-07-05 21:10:24.217454	2013-07-05 21:10:24.217454
82112	76	30	6	2013-07-05 21:10:24.218442	2013-07-05 21:10:24.218442
82113	76	31	6	2013-07-05 21:10:24.219196	2013-07-05 21:10:24.219196
82114	76	32	6	2013-07-05 21:10:24.220079	2013-07-05 21:10:24.220079
82115	76	33	6	2013-07-05 21:10:24.220824	2013-07-05 21:10:24.220824
82116	76	34	6	2013-07-05 21:10:24.22156	2013-07-05 21:10:24.22156
82117	76	35	6	2013-07-05 21:10:24.222381	2013-07-05 21:10:24.222381
82118	76	25	7	2013-07-05 21:10:24.223079	2013-07-05 21:10:24.223079
82119	76	26	7	2013-07-05 21:10:24.22375	2013-07-05 21:10:24.22375
82120	76	27	7	2013-07-05 21:10:24.224461	2013-07-05 21:10:24.224461
82121	76	28	7	2013-07-05 21:10:24.22515	2013-07-05 21:10:24.22515
82122	76	29	7	2013-07-05 21:10:24.225925	2013-07-05 21:10:24.225925
82123	76	30	7	2013-07-05 21:10:24.226577	2013-07-05 21:10:24.226577
82124	76	31	7	2013-07-05 21:10:24.227245	2013-07-05 21:10:24.227245
82125	76	32	7	2013-07-05 21:10:24.227946	2013-07-05 21:10:24.227946
82126	76	33	7	2013-07-05 21:10:24.228592	2013-07-05 21:10:24.228592
82127	76	34	7	2013-07-05 21:10:24.229265	2013-07-05 21:10:24.229265
82128	76	35	7	2013-07-05 21:10:24.230053	2013-07-05 21:10:24.230053
82129	76	0	14	2013-07-05 21:10:24.237149	2013-07-05 21:10:24.237149
82130	76	1	14	2013-07-05 21:10:24.237868	2013-07-05 21:10:24.237868
82131	76	2	14	2013-07-05 21:10:24.238548	2013-07-05 21:10:24.238548
82132	76	3	14	2013-07-05 21:10:24.239216	2013-07-05 21:10:24.239216
82133	76	4	14	2013-07-05 21:10:24.239908	2013-07-05 21:10:24.239908
82134	76	5	14	2013-07-05 21:10:24.240646	2013-07-05 21:10:24.240646
82135	76	6	14	2013-07-05 21:10:24.241308	2013-07-05 21:10:24.241308
82136	76	7	14	2013-07-05 21:10:24.241975	2013-07-05 21:10:24.241975
82137	76	8	14	2013-07-05 21:10:24.24262	2013-07-05 21:10:24.24262
82138	76	9	14	2013-07-05 21:10:24.243344	2013-07-05 21:10:24.243344
82139	76	10	14	2013-07-05 21:10:24.244091	2013-07-05 21:10:24.244091
82140	76	25	14	2013-07-05 21:10:24.244855	2013-07-05 21:10:24.244855
82141	76	26	14	2013-07-05 21:10:24.245541	2013-07-05 21:10:24.245541
82142	76	27	14	2013-07-05 21:10:24.24618	2013-07-05 21:10:24.24618
82143	76	28	14	2013-07-05 21:10:24.246865	2013-07-05 21:10:24.246865
82144	76	29	14	2013-07-05 21:10:24.247809	2013-07-05 21:10:24.247809
82145	76	30	14	2013-07-05 21:10:24.248618	2013-07-05 21:10:24.248618
82146	76	31	14	2013-07-05 21:10:24.249322	2013-07-05 21:10:24.249322
82147	76	32	14	2013-07-05 21:10:24.249997	2013-07-05 21:10:24.249997
82148	76	33	14	2013-07-05 21:10:24.250695	2013-07-05 21:10:24.250695
82149	76	34	14	2013-07-05 21:10:24.251432	2013-07-05 21:10:24.251432
82150	76	35	14	2013-07-05 21:10:24.252085	2013-07-05 21:10:24.252085
82151	76	0	15	2013-07-05 21:10:24.252746	2013-07-05 21:10:24.252746
82152	76	1	15	2013-07-05 21:10:24.253387	2013-07-05 21:10:24.253387
82153	76	2	15	2013-07-05 21:10:24.25417	2013-07-05 21:10:24.25417
82154	76	3	15	2013-07-05 21:10:24.254898	2013-07-05 21:10:24.254898
82155	76	4	15	2013-07-05 21:10:24.25556	2013-07-05 21:10:24.25556
82156	76	5	15	2013-07-05 21:10:24.256357	2013-07-05 21:10:24.256357
82157	76	6	15	2013-07-05 21:10:24.257005	2013-07-05 21:10:24.257005
82158	76	7	15	2013-07-05 21:10:24.257662	2013-07-05 21:10:24.257662
82159	76	8	15	2013-07-05 21:10:24.258435	2013-07-05 21:10:24.258435
82160	76	9	15	2013-07-05 21:10:24.259104	2013-07-05 21:10:24.259104
82161	76	10	15	2013-07-05 21:10:24.259768	2013-07-05 21:10:24.259768
82162	76	25	15	2013-07-05 21:10:24.260445	2013-07-05 21:10:24.260445
82163	76	26	15	2013-07-05 21:10:24.261157	2013-07-05 21:10:24.261157
82164	76	27	15	2013-07-05 21:10:24.261913	2013-07-05 21:10:24.261913
82165	76	28	15	2013-07-05 21:10:24.2627	2013-07-05 21:10:24.2627
82166	76	29	15	2013-07-05 21:10:24.264282	2013-07-05 21:10:24.264282
82167	76	30	15	2013-07-05 21:10:24.26558	2013-07-05 21:10:24.26558
82168	76	31	15	2013-07-05 21:10:24.266955	2013-07-05 21:10:24.266955
82169	76	32	15	2013-07-05 21:10:24.268159	2013-07-05 21:10:24.268159
82170	76	33	15	2013-07-05 21:10:24.268931	2013-07-05 21:10:24.268931
82171	76	34	15	2013-07-05 21:10:24.269611	2013-07-05 21:10:24.269611
82172	76	35	15	2013-07-05 21:10:24.270381	2013-07-05 21:10:24.270381
82173	76	0	16	2013-07-05 21:10:24.271418	2013-07-05 21:10:24.271418
82174	76	1	16	2013-07-05 21:10:24.272343	2013-07-05 21:10:24.272343
82175	76	2	16	2013-07-05 21:10:24.273084	2013-07-05 21:10:24.273084
82176	76	3	16	2013-07-05 21:10:24.27377	2013-07-05 21:10:24.27377
82177	76	6	16	2013-07-05 21:10:24.274611	2013-07-05 21:10:24.274611
82178	76	7	16	2013-07-05 21:10:24.275428	2013-07-05 21:10:24.275428
82179	76	8	16	2013-07-05 21:10:24.276172	2013-07-05 21:10:24.276172
82180	76	9	16	2013-07-05 21:10:24.276926	2013-07-05 21:10:24.276926
82181	76	10	16	2013-07-05 21:10:24.277654	2013-07-05 21:10:24.277654
82182	76	25	16	2013-07-05 21:10:24.278371	2013-07-05 21:10:24.278371
82183	76	26	16	2013-07-05 21:10:24.279067	2013-07-05 21:10:24.279067
82184	76	27	16	2013-07-05 21:10:24.279986	2013-07-05 21:10:24.279986
82185	76	28	16	2013-07-05 21:10:24.280935	2013-07-05 21:10:24.280935
82186	76	29	16	2013-07-05 21:10:24.2824	2013-07-05 21:10:24.2824
82187	76	30	16	2013-07-05 21:10:24.283294	2013-07-05 21:10:24.283294
82188	76	31	16	2013-07-05 21:10:24.283969	2013-07-05 21:10:24.283969
82189	76	32	16	2013-07-05 21:10:24.284676	2013-07-05 21:10:24.284676
82190	76	33	16	2013-07-05 21:10:24.285475	2013-07-05 21:10:24.285475
82191	76	34	16	2013-07-05 21:10:24.286179	2013-07-05 21:10:24.286179
82192	76	35	16	2013-07-05 21:10:24.286864	2013-07-05 21:10:24.286864
82193	76	0	17	2013-07-05 21:10:24.2876	2013-07-05 21:10:24.2876
82194	76	1	17	2013-07-05 21:10:24.288405	2013-07-05 21:10:24.288405
82195	76	2	17	2013-07-05 21:10:24.289084	2013-07-05 21:10:24.289084
82196	76	3	17	2013-07-05 21:10:24.289779	2013-07-05 21:10:24.289779
82197	76	6	17	2013-07-05 21:10:24.290455	2013-07-05 21:10:24.290455
82198	76	7	17	2013-07-05 21:10:24.291179	2013-07-05 21:10:24.291179
82199	76	8	17	2013-07-05 21:10:24.291953	2013-07-05 21:10:24.291953
82200	76	9	17	2013-07-05 21:10:24.292656	2013-07-05 21:10:24.292656
82201	76	10	17	2013-07-05 21:10:24.29334	2013-07-05 21:10:24.29334
82202	76	25	17	2013-07-05 21:10:24.294033	2013-07-05 21:10:24.294033
82203	76	26	17	2013-07-05 21:10:24.294752	2013-07-05 21:10:24.294752
82204	76	27	17	2013-07-05 21:10:24.295459	2013-07-05 21:10:24.295459
82205	76	28	17	2013-07-05 21:10:24.296348	2013-07-05 21:10:24.296348
82206	76	29	17	2013-07-05 21:10:24.29728	2013-07-05 21:10:24.29728
82207	76	30	17	2013-07-05 21:10:24.298118	2013-07-05 21:10:24.298118
82208	76	31	17	2013-07-05 21:10:24.298779	2013-07-05 21:10:24.298779
82209	76	32	17	2013-07-05 21:10:24.299484	2013-07-05 21:10:24.299484
82210	76	33	17	2013-07-05 21:10:24.300171	2013-07-05 21:10:24.300171
82211	76	34	17	2013-07-05 21:10:24.300852	2013-07-05 21:10:24.300852
82212	76	35	17	2013-07-05 21:10:24.301732	2013-07-05 21:10:24.301732
82213	76	0	18	2013-07-05 21:10:24.302609	2013-07-05 21:10:24.302609
82214	76	1	18	2013-07-05 21:10:24.303277	2013-07-05 21:10:24.303277
82215	76	8	18	2013-07-05 21:10:24.303943	2013-07-05 21:10:24.303943
82216	76	9	18	2013-07-05 21:10:24.305029	2013-07-05 21:10:24.305029
82217	76	10	18	2013-07-05 21:10:24.306289	2013-07-05 21:10:24.306289
82218	76	25	18	2013-07-05 21:10:24.307549	2013-07-05 21:10:24.307549
82219	76	26	18	2013-07-05 21:10:24.308614	2013-07-05 21:10:24.308614
82220	76	27	18	2013-07-05 21:10:24.309721	2013-07-05 21:10:24.309721
82221	76	34	18	2013-07-05 21:10:24.310774	2013-07-05 21:10:24.310774
82222	76	35	18	2013-07-05 21:10:24.311485	2013-07-05 21:10:24.311485
82223	76	0	19	2013-07-05 21:10:24.312247	2013-07-05 21:10:24.312247
82224	76	1	19	2013-07-05 21:10:24.313085	2013-07-05 21:10:24.313085
82225	76	8	19	2013-07-05 21:10:24.31386	2013-07-05 21:10:24.31386
82226	76	9	19	2013-07-05 21:10:24.314578	2013-07-05 21:10:24.314578
82227	76	10	19	2013-07-05 21:10:24.315301	2013-07-05 21:10:24.315301
82228	76	25	19	2013-07-05 21:10:24.317801	2013-07-05 21:10:24.317801
82229	76	26	19	2013-07-05 21:10:24.318637	2013-07-05 21:10:24.318637
82230	76	27	19	2013-07-05 21:10:24.319349	2013-07-05 21:10:24.319349
82231	76	34	19	2013-07-05 21:10:24.320039	2013-07-05 21:10:24.320039
82232	76	35	19	2013-07-05 21:10:24.320777	2013-07-05 21:10:24.320777
82233	76	0	20	2013-07-05 21:10:24.321503	2013-07-05 21:10:24.321503
82234	76	1	20	2013-07-05 21:10:24.322196	2013-07-05 21:10:24.322196
82235	76	2	20	2013-07-05 21:10:24.323084	2013-07-05 21:10:24.323084
82236	76	3	20	2013-07-05 21:10:24.323973	2013-07-05 21:10:24.323973
82237	76	6	20	2013-07-05 21:10:24.32491	2013-07-05 21:10:24.32491
82238	76	7	20	2013-07-05 21:10:24.325641	2013-07-05 21:10:24.325641
82239	76	8	20	2013-07-05 21:10:24.326309	2013-07-05 21:10:24.326309
82240	76	9	20	2013-07-05 21:10:24.326947	2013-07-05 21:10:24.326947
82241	76	10	20	2013-07-05 21:10:24.32761	2013-07-05 21:10:24.32761
82242	76	25	20	2013-07-05 21:10:24.328271	2013-07-05 21:10:24.328271
82243	76	26	20	2013-07-05 21:10:24.328986	2013-07-05 21:10:24.328986
82244	76	27	20	2013-07-05 21:10:24.329686	2013-07-05 21:10:24.329686
82245	76	28	20	2013-07-05 21:10:24.330398	2013-07-05 21:10:24.330398
82246	76	29	20	2013-07-05 21:10:24.331078	2013-07-05 21:10:24.331078
82247	76	30	20	2013-07-05 21:10:24.331865	2013-07-05 21:10:24.331865
82248	76	31	20	2013-07-05 21:10:24.332538	2013-07-05 21:10:24.332538
82249	76	32	20	2013-07-05 21:10:24.333423	2013-07-05 21:10:24.333423
82250	76	33	20	2013-07-05 21:10:24.334222	2013-07-05 21:10:24.334222
82251	76	34	20	2013-07-05 21:10:24.335041	2013-07-05 21:10:24.335041
82252	76	35	20	2013-07-05 21:10:24.335832	2013-07-05 21:10:24.335832
82253	76	0	21	2013-07-05 21:10:24.336525	2013-07-05 21:10:24.336525
82254	76	1	21	2013-07-05 21:10:24.337189	2013-07-05 21:10:24.337189
82255	76	2	21	2013-07-05 21:10:24.33786	2013-07-05 21:10:24.33786
82256	76	3	21	2013-07-05 21:10:24.338609	2013-07-05 21:10:24.338609
82257	76	6	21	2013-07-05 21:10:24.339306	2013-07-05 21:10:24.339306
82258	76	7	21	2013-07-05 21:10:24.340005	2013-07-05 21:10:24.340005
82259	76	8	21	2013-07-05 21:10:24.340709	2013-07-05 21:10:24.340709
82260	76	9	21	2013-07-05 21:10:24.341354	2013-07-05 21:10:24.341354
82261	76	10	21	2013-07-05 21:10:24.34203	2013-07-05 21:10:24.34203
82262	76	25	21	2013-07-05 21:10:24.343803	2013-07-05 21:10:24.343803
82263	76	26	21	2013-07-05 21:10:24.344624	2013-07-05 21:10:24.344624
82264	76	27	21	2013-07-05 21:10:24.345314	2013-07-05 21:10:24.345314
82265	76	28	21	2013-07-05 21:10:24.346023	2013-07-05 21:10:24.346023
82266	76	29	21	2013-07-05 21:10:24.346738	2013-07-05 21:10:24.346738
82267	76	30	21	2013-07-05 21:10:24.347532	2013-07-05 21:10:24.347532
82268	76	31	21	2013-07-05 21:10:24.34822	2013-07-05 21:10:24.34822
82269	76	32	21	2013-07-05 21:10:24.348916	2013-07-05 21:10:24.348916
82270	76	33	21	2013-07-05 21:10:24.349615	2013-07-05 21:10:24.349615
82271	76	34	21	2013-07-05 21:10:24.35027	2013-07-05 21:10:24.35027
82272	76	35	21	2013-07-05 21:10:24.350986	2013-07-05 21:10:24.350986
95447	101	4	0	2013-07-06 06:57:42.596669	2013-07-06 06:57:42.596669
95448	101	5	0	2013-07-06 06:57:42.597599	2013-07-06 06:57:42.597599
95449	101	6	0	2013-07-06 06:57:42.598418	2013-07-06 06:57:42.598418
95450	101	7	0	2013-07-06 06:57:42.599097	2013-07-06 06:57:42.599097
95451	101	4	1	2013-07-06 06:57:42.599816	2013-07-06 06:57:42.599816
95452	101	5	1	2013-07-06 06:57:42.600485	2013-07-06 06:57:42.600485
95453	101	6	1	2013-07-06 06:57:42.601442	2013-07-06 06:57:42.601442
95454	101	7	1	2013-07-06 06:57:42.602274	2013-07-06 06:57:42.602274
95455	101	4	2	2013-07-06 06:57:42.604844	2013-07-06 06:57:42.604844
95456	101	5	2	2013-07-06 06:57:42.605511	2013-07-06 06:57:42.605511
95457	101	6	2	2013-07-06 06:57:42.606248	2013-07-06 06:57:42.606248
95458	101	7	2	2013-07-06 06:57:42.606942	2013-07-06 06:57:42.606942
95459	101	12	2	2013-07-06 06:57:42.607597	2013-07-06 06:57:42.607597
95460	101	13	2	2013-07-06 06:57:42.608266	2013-07-06 06:57:42.608266
95461	101	14	2	2013-07-06 06:57:42.608966	2013-07-06 06:57:42.608966
95462	101	15	2	2013-07-06 06:57:42.609628	2013-07-06 06:57:42.609628
95463	101	16	2	2013-07-06 06:57:42.610304	2013-07-06 06:57:42.610304
95464	101	17	2	2013-07-06 06:57:42.611023	2013-07-06 06:57:42.611023
95465	101	18	2	2013-07-06 06:57:42.611715	2013-07-06 06:57:42.611715
95466	101	19	2	2013-07-06 06:57:42.612362	2013-07-06 06:57:42.612362
95467	101	20	2	2013-07-06 06:57:42.613151	2013-07-06 06:57:42.613151
95468	101	21	2	2013-07-06 06:57:42.614003	2013-07-06 06:57:42.614003
95469	101	22	2	2013-07-06 06:57:42.614798	2013-07-06 06:57:42.614798
95470	101	23	2	2013-07-06 06:57:42.615605	2013-07-06 06:57:42.615605
95471	101	24	2	2013-07-06 06:57:42.616352	2013-07-06 06:57:42.616352
95472	101	25	2	2013-07-06 06:57:42.617057	2013-07-06 06:57:42.617057
95473	101	26	2	2013-07-06 06:57:42.617739	2013-07-06 06:57:42.617739
95474	101	27	2	2013-07-06 06:57:42.618649	2013-07-06 06:57:42.618649
95475	101	28	2	2013-07-06 06:57:42.619628	2013-07-06 06:57:42.619628
95476	101	29	2	2013-07-06 06:57:42.620364	2013-07-06 06:57:42.620364
95477	101	30	2	2013-07-06 06:57:42.62112	2013-07-06 06:57:42.62112
95478	101	31	2	2013-07-06 06:57:42.62197	2013-07-06 06:57:42.62197
95479	101	32	2	2013-07-06 06:57:42.622833	2013-07-06 06:57:42.622833
95480	101	33	2	2013-07-06 06:57:42.623628	2013-07-06 06:57:42.623628
95481	101	34	2	2013-07-06 06:57:42.624293	2013-07-06 06:57:42.624293
95482	101	35	2	2013-07-06 06:57:42.624965	2013-07-06 06:57:42.624965
95483	101	4	3	2013-07-06 06:57:42.625647	2013-07-06 06:57:42.625647
95484	101	5	3	2013-07-06 06:57:42.626336	2013-07-06 06:57:42.626336
95485	101	6	3	2013-07-06 06:57:42.627025	2013-07-06 06:57:42.627025
95486	101	7	3	2013-07-06 06:57:42.627829	2013-07-06 06:57:42.627829
95487	101	12	3	2013-07-06 06:57:42.628548	2013-07-06 06:57:42.628548
95488	101	13	3	2013-07-06 06:57:42.629304	2013-07-06 06:57:42.629304
95489	101	14	3	2013-07-06 06:57:42.630206	2013-07-06 06:57:42.630206
95490	101	15	3	2013-07-06 06:57:42.631127	2013-07-06 06:57:42.631127
95491	101	16	3	2013-07-06 06:57:42.632175	2013-07-06 06:57:42.632175
95492	101	17	3	2013-07-06 06:57:42.632931	2013-07-06 06:57:42.632931
95493	101	18	3	2013-07-06 06:57:42.63361	2013-07-06 06:57:42.63361
95494	101	19	3	2013-07-06 06:57:42.634309	2013-07-06 06:57:42.634309
95495	101	20	3	2013-07-06 06:57:42.635041	2013-07-06 06:57:42.635041
95496	101	21	3	2013-07-06 06:57:42.635822	2013-07-06 06:57:42.635822
95497	101	22	3	2013-07-06 06:57:42.636664	2013-07-06 06:57:42.636664
95498	101	23	3	2013-07-06 06:57:42.637438	2013-07-06 06:57:42.637438
95499	101	24	3	2013-07-06 06:57:42.638145	2013-07-06 06:57:42.638145
95500	101	25	3	2013-07-06 06:57:42.638894	2013-07-06 06:57:42.638894
95501	101	26	3	2013-07-06 06:57:42.639704	2013-07-06 06:57:42.639704
95502	101	27	3	2013-07-06 06:57:42.640417	2013-07-06 06:57:42.640417
95503	101	28	3	2013-07-06 06:57:42.641172	2013-07-06 06:57:42.641172
95504	101	29	3	2013-07-06 06:57:42.641866	2013-07-06 06:57:42.641866
95505	101	30	3	2013-07-06 06:57:42.64261	2013-07-06 06:57:42.64261
95506	101	31	3	2013-07-06 06:57:42.643323	2013-07-06 06:57:42.643323
95507	101	32	3	2013-07-06 06:57:42.644063	2013-07-06 06:57:42.644063
95508	101	33	3	2013-07-06 06:57:42.64474	2013-07-06 06:57:42.64474
95509	101	34	3	2013-07-06 06:57:42.645442	2013-07-06 06:57:42.645442
95510	101	35	3	2013-07-06 06:57:42.64616	2013-07-06 06:57:42.64616
95511	101	4	4	2013-07-06 06:57:42.646895	2013-07-06 06:57:42.646895
95512	101	5	4	2013-07-06 06:57:42.647845	2013-07-06 06:57:42.647845
95513	101	6	4	2013-07-06 06:57:42.648706	2013-07-06 06:57:42.648706
95514	101	7	4	2013-07-06 06:57:42.649423	2013-07-06 06:57:42.649423
95515	101	12	4	2013-07-06 06:57:42.650091	2013-07-06 06:57:42.650091
95516	101	13	4	2013-07-06 06:57:42.650797	2013-07-06 06:57:42.650797
95517	101	14	4	2013-07-06 06:57:42.651605	2013-07-06 06:57:42.651605
95518	101	15	4	2013-07-06 06:57:42.652305	2013-07-06 06:57:42.652305
95519	101	4	5	2013-07-06 06:57:42.653026	2013-07-06 06:57:42.653026
95520	101	5	5	2013-07-06 06:57:42.65375	2013-07-06 06:57:42.65375
95521	101	6	5	2013-07-06 06:57:42.654451	2013-07-06 06:57:42.654451
95522	101	7	5	2013-07-06 06:57:42.655122	2013-07-06 06:57:42.655122
95523	101	12	5	2013-07-06 06:57:42.655811	2013-07-06 06:57:42.655811
95524	101	13	5	2013-07-06 06:57:42.656491	2013-07-06 06:57:42.656491
95525	101	14	5	2013-07-06 06:57:42.657171	2013-07-06 06:57:42.657171
95526	101	15	5	2013-07-06 06:57:42.65785	2013-07-06 06:57:42.65785
95527	101	4	6	2013-07-06 06:57:42.659507	2013-07-06 06:57:42.659507
95528	101	5	6	2013-07-06 06:57:42.660665	2013-07-06 06:57:42.660665
95529	101	6	6	2013-07-06 06:57:42.661606	2013-07-06 06:57:42.661606
95530	101	7	6	2013-07-06 06:57:42.662478	2013-07-06 06:57:42.662478
95531	101	12	6	2013-07-06 06:57:42.66326	2013-07-06 06:57:42.66326
95532	101	13	6	2013-07-06 06:57:42.664451	2013-07-06 06:57:42.664451
95533	101	14	6	2013-07-06 06:57:42.665797	2013-07-06 06:57:42.665797
95534	101	15	6	2013-07-06 06:57:42.666577	2013-07-06 06:57:42.666577
95535	101	20	6	2013-07-06 06:57:42.66742	2013-07-06 06:57:42.66742
95536	101	21	6	2013-07-06 06:57:42.668211	2013-07-06 06:57:42.668211
95537	101	22	6	2013-07-06 06:57:42.668923	2013-07-06 06:57:42.668923
95538	101	23	6	2013-07-06 06:57:42.669736	2013-07-06 06:57:42.669736
95539	101	24	6	2013-07-06 06:57:42.670469	2013-07-06 06:57:42.670469
95540	101	25	6	2013-07-06 06:57:42.671174	2013-07-06 06:57:42.671174
95541	101	26	6	2013-07-06 06:57:42.67193	2013-07-06 06:57:42.67193
95542	101	27	6	2013-07-06 06:57:42.672648	2013-07-06 06:57:42.672648
95543	101	28	6	2013-07-06 06:57:42.673322	2013-07-06 06:57:42.673322
95544	101	29	6	2013-07-06 06:57:42.67403	2013-07-06 06:57:42.67403
95545	101	30	6	2013-07-06 06:57:42.67476	2013-07-06 06:57:42.67476
95546	101	31	6	2013-07-06 06:57:42.675422	2013-07-06 06:57:42.675422
95547	101	4	7	2013-07-06 06:57:42.67613	2013-07-06 06:57:42.67613
95548	101	5	7	2013-07-06 06:57:42.677011	2013-07-06 06:57:42.677011
95549	101	6	7	2013-07-06 06:57:42.677751	2013-07-06 06:57:42.677751
95550	101	7	7	2013-07-06 06:57:42.678439	2013-07-06 06:57:42.678439
95551	101	12	7	2013-07-06 06:57:42.67913	2013-07-06 06:57:42.67913
95552	101	13	7	2013-07-06 06:57:42.67995	2013-07-06 06:57:42.67995
95553	101	14	7	2013-07-06 06:57:42.681071	2013-07-06 06:57:42.681071
95554	101	15	7	2013-07-06 06:57:42.682304	2013-07-06 06:57:42.682304
95555	101	20	7	2013-07-06 06:57:42.683239	2013-07-06 06:57:42.683239
95556	101	21	7	2013-07-06 06:57:42.684082	2013-07-06 06:57:42.684082
95557	101	22	7	2013-07-06 06:57:42.685167	2013-07-06 06:57:42.685167
95558	101	23	7	2013-07-06 06:57:42.685908	2013-07-06 06:57:42.685908
95559	101	24	7	2013-07-06 06:57:42.686597	2013-07-06 06:57:42.686597
95560	101	25	7	2013-07-06 06:57:42.687256	2013-07-06 06:57:42.687256
95561	101	26	7	2013-07-06 06:57:42.687955	2013-07-06 06:57:42.687955
95562	101	27	7	2013-07-06 06:57:42.688655	2013-07-06 06:57:42.688655
95563	101	28	7	2013-07-06 06:57:42.689328	2013-07-06 06:57:42.689328
95564	101	29	7	2013-07-06 06:57:42.689999	2013-07-06 06:57:42.689999
95565	101	30	7	2013-07-06 06:57:42.69085	2013-07-06 06:57:42.69085
95566	101	31	7	2013-07-06 06:57:42.691591	2013-07-06 06:57:42.691591
95567	101	4	8	2013-07-06 06:57:42.692263	2013-07-06 06:57:42.692263
95568	101	5	8	2013-07-06 06:57:42.693018	2013-07-06 06:57:42.693018
95569	101	6	8	2013-07-06 06:57:42.693702	2013-07-06 06:57:42.693702
95570	101	7	8	2013-07-06 06:57:42.694429	2013-07-06 06:57:42.694429
95571	101	12	8	2013-07-06 06:57:42.696029	2013-07-06 06:57:42.696029
95572	101	13	8	2013-07-06 06:57:42.69688	2013-07-06 06:57:42.69688
95573	101	14	8	2013-07-06 06:57:42.698218	2013-07-06 06:57:42.698218
95574	101	15	8	2013-07-06 06:57:42.699001	2013-07-06 06:57:42.699001
95575	101	28	8	2013-07-06 06:57:42.701965	2013-07-06 06:57:42.701965
95576	101	29	8	2013-07-06 06:57:42.702778	2013-07-06 06:57:42.702778
95577	101	30	8	2013-07-06 06:57:42.703553	2013-07-06 06:57:42.703553
95578	101	31	8	2013-07-06 06:57:42.704273	2013-07-06 06:57:42.704273
95579	101	4	9	2013-07-06 06:57:42.704939	2013-07-06 06:57:42.704939
95580	101	5	9	2013-07-06 06:57:42.705636	2013-07-06 06:57:42.705636
95581	101	6	9	2013-07-06 06:57:42.706366	2013-07-06 06:57:42.706366
95582	101	7	9	2013-07-06 06:57:42.707046	2013-07-06 06:57:42.707046
95583	101	12	9	2013-07-06 06:57:42.707846	2013-07-06 06:57:42.707846
95584	101	13	9	2013-07-06 06:57:42.70861	2013-07-06 06:57:42.70861
95585	101	14	9	2013-07-06 06:57:42.709315	2013-07-06 06:57:42.709315
95586	101	15	9	2013-07-06 06:57:42.709978	2013-07-06 06:57:42.709978
95587	101	28	9	2013-07-06 06:57:42.711774	2013-07-06 06:57:42.711774
95588	101	29	9	2013-07-06 06:57:42.712527	2013-07-06 06:57:42.712527
95589	101	30	9	2013-07-06 06:57:42.713344	2013-07-06 06:57:42.713344
95590	101	31	9	2013-07-06 06:57:42.714588	2013-07-06 06:57:42.714588
95591	101	4	10	2013-07-06 06:57:42.715398	2013-07-06 06:57:42.715398
95592	101	5	10	2013-07-06 06:57:42.716088	2013-07-06 06:57:42.716088
95593	101	6	10	2013-07-06 06:57:42.717016	2013-07-06 06:57:42.717016
95594	101	7	10	2013-07-06 06:57:42.717884	2013-07-06 06:57:42.717884
95595	101	12	10	2013-07-06 06:57:42.718721	2013-07-06 06:57:42.718721
95596	101	13	10	2013-07-06 06:57:42.719471	2013-07-06 06:57:42.719471
95597	101	14	10	2013-07-06 06:57:42.720208	2013-07-06 06:57:42.720208
95598	101	15	10	2013-07-06 06:57:42.720902	2013-07-06 06:57:42.720902
95599	101	20	10	2013-07-06 06:57:42.721579	2013-07-06 06:57:42.721579
95600	101	21	10	2013-07-06 06:57:42.722238	2013-07-06 06:57:42.722238
95601	101	22	10	2013-07-06 06:57:42.723011	2013-07-06 06:57:42.723011
95602	101	23	10	2013-07-06 06:57:42.723732	2013-07-06 06:57:42.723732
95603	101	28	10	2013-07-06 06:57:42.724444	2013-07-06 06:57:42.724444
95604	101	29	10	2013-07-06 06:57:42.725119	2013-07-06 06:57:42.725119
95605	101	30	10	2013-07-06 06:57:42.725831	2013-07-06 06:57:42.725831
95606	101	31	10	2013-07-06 06:57:42.726568	2013-07-06 06:57:42.726568
95607	101	4	11	2013-07-06 06:57:42.727284	2013-07-06 06:57:42.727284
95608	101	5	11	2013-07-06 06:57:42.728044	2013-07-06 06:57:42.728044
95609	101	6	11	2013-07-06 06:57:42.728757	2013-07-06 06:57:42.728757
95610	101	7	11	2013-07-06 06:57:42.729443	2013-07-06 06:57:42.729443
95611	101	12	11	2013-07-06 06:57:42.73147	2013-07-06 06:57:42.73147
95612	101	13	11	2013-07-06 06:57:42.732316	2013-07-06 06:57:42.732316
95613	101	14	11	2013-07-06 06:57:42.733037	2013-07-06 06:57:42.733037
95614	101	15	11	2013-07-06 06:57:42.733868	2013-07-06 06:57:42.733868
95615	101	20	11	2013-07-06 06:57:42.734751	2013-07-06 06:57:42.734751
95616	101	21	11	2013-07-06 06:57:42.735559	2013-07-06 06:57:42.735559
95617	101	22	11	2013-07-06 06:57:42.736509	2013-07-06 06:57:42.736509
95618	101	23	11	2013-07-06 06:57:42.737857	2013-07-06 06:57:42.737857
95619	101	28	11	2013-07-06 06:57:42.739596	2013-07-06 06:57:42.739596
95620	101	29	11	2013-07-06 06:57:42.740358	2013-07-06 06:57:42.740358
95621	101	30	11	2013-07-06 06:57:42.741098	2013-07-06 06:57:42.741098
95622	101	31	11	2013-07-06 06:57:42.741789	2013-07-06 06:57:42.741789
95623	101	4	12	2013-07-06 06:57:42.743348	2013-07-06 06:57:42.743348
95624	101	5	12	2013-07-06 06:57:42.744153	2013-07-06 06:57:42.744153
95625	101	6	12	2013-07-06 06:57:42.744885	2013-07-06 06:57:42.744885
95626	101	7	12	2013-07-06 06:57:42.74559	2013-07-06 06:57:42.74559
95627	101	20	12	2013-07-06 06:57:42.747337	2013-07-06 06:57:42.747337
95628	101	21	12	2013-07-06 06:57:42.74828	2013-07-06 06:57:42.74828
95629	101	22	12	2013-07-06 06:57:42.74933	2013-07-06 06:57:42.74933
95630	101	23	12	2013-07-06 06:57:42.750193	2013-07-06 06:57:42.750193
95631	101	28	12	2013-07-06 06:57:42.751088	2013-07-06 06:57:42.751088
95632	101	29	12	2013-07-06 06:57:42.751809	2013-07-06 06:57:42.751809
95633	101	30	12	2013-07-06 06:57:42.752534	2013-07-06 06:57:42.752534
95634	101	31	12	2013-07-06 06:57:42.75324	2013-07-06 06:57:42.75324
95635	101	4	13	2013-07-06 06:57:42.754254	2013-07-06 06:57:42.754254
95636	101	5	13	2013-07-06 06:57:42.754975	2013-07-06 06:57:42.754975
95637	101	6	13	2013-07-06 06:57:42.755684	2013-07-06 06:57:42.755684
95638	101	7	13	2013-07-06 06:57:42.756422	2013-07-06 06:57:42.756422
95639	101	20	13	2013-07-06 06:57:42.758768	2013-07-06 06:57:42.758768
95640	101	21	13	2013-07-06 06:57:42.759483	2013-07-06 06:57:42.759483
95641	101	22	13	2013-07-06 06:57:42.760204	2013-07-06 06:57:42.760204
95642	101	23	13	2013-07-06 06:57:42.760966	2013-07-06 06:57:42.760966
95643	101	28	13	2013-07-06 06:57:42.762535	2013-07-06 06:57:42.762535
95644	101	29	13	2013-07-06 06:57:42.763326	2013-07-06 06:57:42.763326
95645	101	30	13	2013-07-06 06:57:42.764175	2013-07-06 06:57:42.764175
95646	101	31	13	2013-07-06 06:57:42.765138	2013-07-06 06:57:42.765138
95647	101	4	14	2013-07-06 06:57:42.766028	2013-07-06 06:57:42.766028
95648	101	5	14	2013-07-06 06:57:42.766756	2013-07-06 06:57:42.766756
95649	101	6	14	2013-07-06 06:57:42.767548	2013-07-06 06:57:42.767548
95650	101	7	14	2013-07-06 06:57:42.76846	2013-07-06 06:57:42.76846
95651	101	8	14	2013-07-06 06:57:42.769478	2013-07-06 06:57:42.769478
95652	101	9	14	2013-07-06 06:57:42.770293	2013-07-06 06:57:42.770293
95653	101	10	14	2013-07-06 06:57:42.770977	2013-07-06 06:57:42.770977
95654	101	11	14	2013-07-06 06:57:42.77168	2013-07-06 06:57:42.77168
95655	101	12	14	2013-07-06 06:57:42.772431	2013-07-06 06:57:42.772431
95656	101	13	14	2013-07-06 06:57:42.773153	2013-07-06 06:57:42.773153
95657	101	14	14	2013-07-06 06:57:42.773876	2013-07-06 06:57:42.773876
95658	101	15	14	2013-07-06 06:57:42.774596	2013-07-06 06:57:42.774596
95659	101	20	14	2013-07-06 06:57:42.77533	2013-07-06 06:57:42.77533
95660	101	21	14	2013-07-06 06:57:42.776025	2013-07-06 06:57:42.776025
95661	101	22	14	2013-07-06 06:57:42.776745	2013-07-06 06:57:42.776745
95662	101	23	14	2013-07-06 06:57:42.777445	2013-07-06 06:57:42.777445
95663	101	28	14	2013-07-06 06:57:42.778157	2013-07-06 06:57:42.778157
95664	101	29	14	2013-07-06 06:57:42.77887	2013-07-06 06:57:42.77887
95665	101	30	14	2013-07-06 06:57:42.779524	2013-07-06 06:57:42.779524
95666	101	31	14	2013-07-06 06:57:42.780348	2013-07-06 06:57:42.780348
95667	101	4	15	2013-07-06 06:57:42.781226	2013-07-06 06:57:42.781226
95668	101	5	15	2013-07-06 06:57:42.782014	2013-07-06 06:57:42.782014
95669	101	6	15	2013-07-06 06:57:42.782773	2013-07-06 06:57:42.782773
95670	101	7	15	2013-07-06 06:57:42.783797	2013-07-06 06:57:42.783797
95671	101	8	15	2013-07-06 06:57:42.784876	2013-07-06 06:57:42.784876
95672	101	9	15	2013-07-06 06:57:42.785665	2013-07-06 06:57:42.785665
95673	101	10	15	2013-07-06 06:57:42.786378	2013-07-06 06:57:42.786378
95674	101	11	15	2013-07-06 06:57:42.787067	2013-07-06 06:57:42.787067
95675	101	12	15	2013-07-06 06:57:42.787739	2013-07-06 06:57:42.787739
95676	101	13	15	2013-07-06 06:57:42.788428	2013-07-06 06:57:42.788428
95677	101	14	15	2013-07-06 06:57:42.789229	2013-07-06 06:57:42.789229
95678	101	15	15	2013-07-06 06:57:42.789927	2013-07-06 06:57:42.789927
95679	101	20	15	2013-07-06 06:57:42.790631	2013-07-06 06:57:42.790631
95680	101	21	15	2013-07-06 06:57:42.791387	2013-07-06 06:57:42.791387
95681	101	22	15	2013-07-06 06:57:42.792086	2013-07-06 06:57:42.792086
95682	101	23	15	2013-07-06 06:57:42.79275	2013-07-06 06:57:42.79275
95683	101	28	15	2013-07-06 06:57:42.793456	2013-07-06 06:57:42.793456
95684	101	29	15	2013-07-06 06:57:42.794262	2013-07-06 06:57:42.794262
95685	101	30	15	2013-07-06 06:57:42.794936	2013-07-06 06:57:42.794936
95686	101	31	15	2013-07-06 06:57:42.79563	2013-07-06 06:57:42.79563
95687	101	20	16	2013-07-06 06:57:42.797354	2013-07-06 06:57:42.797354
95688	101	21	16	2013-07-06 06:57:42.798297	2013-07-06 06:57:42.798297
95689	101	22	16	2013-07-06 06:57:42.799164	2013-07-06 06:57:42.799164
95690	101	23	16	2013-07-06 06:57:42.799906	2013-07-06 06:57:42.799906
95691	101	28	16	2013-07-06 06:57:42.800741	2013-07-06 06:57:42.800741
95692	101	29	16	2013-07-06 06:57:42.801547	2013-07-06 06:57:42.801547
95693	101	30	16	2013-07-06 06:57:42.802261	2013-07-06 06:57:42.802261
95694	101	31	16	2013-07-06 06:57:42.803026	2013-07-06 06:57:42.803026
95695	101	20	17	2013-07-06 06:57:42.803738	2013-07-06 06:57:42.803738
95696	101	21	17	2013-07-06 06:57:42.804436	2013-07-06 06:57:42.804436
95697	101	22	17	2013-07-06 06:57:42.805156	2013-07-06 06:57:42.805156
95698	101	23	17	2013-07-06 06:57:42.805898	2013-07-06 06:57:42.805898
95699	101	28	17	2013-07-06 06:57:42.80664	2013-07-06 06:57:42.80664
95700	101	29	17	2013-07-06 06:57:42.807377	2013-07-06 06:57:42.807377
95701	101	30	17	2013-07-06 06:57:42.808079	2013-07-06 06:57:42.808079
95702	101	31	17	2013-07-06 06:57:42.808756	2013-07-06 06:57:42.808756
95703	101	0	18	2013-07-06 06:57:42.809468	2013-07-06 06:57:42.809468
95704	101	1	18	2013-07-06 06:57:42.810207	2013-07-06 06:57:42.810207
95705	101	2	18	2013-07-06 06:57:42.810896	2013-07-06 06:57:42.810896
95706	101	3	18	2013-07-06 06:57:42.811581	2013-07-06 06:57:42.811581
95707	101	4	18	2013-07-06 06:57:42.812335	2013-07-06 06:57:42.812335
95708	101	5	18	2013-07-06 06:57:42.813106	2013-07-06 06:57:42.813106
95709	101	6	18	2013-07-06 06:57:42.813859	2013-07-06 06:57:42.813859
95710	101	7	18	2013-07-06 06:57:42.81515	2013-07-06 06:57:42.81515
95711	101	8	18	2013-07-06 06:57:42.816124	2013-07-06 06:57:42.816124
95712	101	9	18	2013-07-06 06:57:42.816939	2013-07-06 06:57:42.816939
95713	101	10	18	2013-07-06 06:57:42.817733	2013-07-06 06:57:42.817733
95714	101	11	18	2013-07-06 06:57:42.819144	2013-07-06 06:57:42.819144
95715	101	12	18	2013-07-06 06:57:42.820005	2013-07-06 06:57:42.820005
95716	101	13	18	2013-07-06 06:57:42.82069	2013-07-06 06:57:42.82069
95717	101	14	18	2013-07-06 06:57:42.821449	2013-07-06 06:57:42.821449
95718	101	15	18	2013-07-06 06:57:42.822198	2013-07-06 06:57:42.822198
95719	101	16	18	2013-07-06 06:57:42.822921	2013-07-06 06:57:42.822921
95720	101	17	18	2013-07-06 06:57:42.823787	2013-07-06 06:57:42.823787
95721	101	18	18	2013-07-06 06:57:42.824472	2013-07-06 06:57:42.824472
95722	101	19	18	2013-07-06 06:57:42.825208	2013-07-06 06:57:42.825208
95723	101	20	18	2013-07-06 06:57:42.825915	2013-07-06 06:57:42.825915
95724	101	21	18	2013-07-06 06:57:42.826636	2013-07-06 06:57:42.826636
95725	101	22	18	2013-07-06 06:57:42.827348	2013-07-06 06:57:42.827348
95726	101	23	18	2013-07-06 06:57:42.828187	2013-07-06 06:57:42.828187
95727	101	28	18	2013-07-06 06:57:42.828964	2013-07-06 06:57:42.828964
95728	101	29	18	2013-07-06 06:57:42.829653	2013-07-06 06:57:42.829653
95729	101	30	18	2013-07-06 06:57:42.830461	2013-07-06 06:57:42.830461
95730	101	31	18	2013-07-06 06:57:42.831307	2013-07-06 06:57:42.831307
95731	101	0	19	2013-07-06 06:57:42.832035	2013-07-06 06:57:42.832035
95732	101	1	19	2013-07-06 06:57:42.832804	2013-07-06 06:57:42.832804
95733	101	2	19	2013-07-06 06:57:42.833616	2013-07-06 06:57:42.833616
95734	101	3	19	2013-07-06 06:57:42.834429	2013-07-06 06:57:42.834429
95735	101	4	19	2013-07-06 06:57:42.835121	2013-07-06 06:57:42.835121
95736	101	5	19	2013-07-06 06:57:42.835802	2013-07-06 06:57:42.835802
95737	101	6	19	2013-07-06 06:57:42.836578	2013-07-06 06:57:42.836578
95738	101	7	19	2013-07-06 06:57:42.837304	2013-07-06 06:57:42.837304
95739	101	8	19	2013-07-06 06:57:42.837979	2013-07-06 06:57:42.837979
95740	101	9	19	2013-07-06 06:57:42.838667	2013-07-06 06:57:42.838667
95741	101	10	19	2013-07-06 06:57:42.839343	2013-07-06 06:57:42.839343
95742	101	11	19	2013-07-06 06:57:42.840056	2013-07-06 06:57:42.840056
95743	101	12	19	2013-07-06 06:57:42.840706	2013-07-06 06:57:42.840706
95744	101	13	19	2013-07-06 06:57:42.841594	2013-07-06 06:57:42.841594
95745	101	14	19	2013-07-06 06:57:42.84236	2013-07-06 06:57:42.84236
95746	101	15	19	2013-07-06 06:57:42.843118	2013-07-06 06:57:42.843118
95747	101	16	19	2013-07-06 06:57:42.843812	2013-07-06 06:57:42.843812
95748	101	17	19	2013-07-06 06:57:42.844955	2013-07-06 06:57:42.844955
95749	101	18	19	2013-07-06 06:57:42.845715	2013-07-06 06:57:42.845715
95750	101	19	19	2013-07-06 06:57:42.846526	2013-07-06 06:57:42.846526
95751	101	20	19	2013-07-06 06:57:42.847432	2013-07-06 06:57:42.847432
95752	101	21	19	2013-07-06 06:57:42.848439	2013-07-06 06:57:42.848439
95753	101	22	19	2013-07-06 06:57:42.849227	2013-07-06 06:57:42.849227
95754	101	23	19	2013-07-06 06:57:42.850026	2013-07-06 06:57:42.850026
95755	101	28	19	2013-07-06 06:57:42.850823	2013-07-06 06:57:42.850823
95756	101	29	19	2013-07-06 06:57:42.851671	2013-07-06 06:57:42.851671
95757	101	30	19	2013-07-06 06:57:42.852606	2013-07-06 06:57:42.852606
95758	101	31	19	2013-07-06 06:57:42.853356	2013-07-06 06:57:42.853356
95759	101	28	20	2013-07-06 06:57:42.854091	2013-07-06 06:57:42.854091
95760	101	29	20	2013-07-06 06:57:42.854756	2013-07-06 06:57:42.854756
95761	101	30	20	2013-07-06 06:57:42.855495	2013-07-06 06:57:42.855495
95762	101	31	20	2013-07-06 06:57:42.856211	2013-07-06 06:57:42.856211
95763	101	28	21	2013-07-06 06:57:42.859631	2013-07-06 06:57:42.859631
95764	101	29	21	2013-07-06 06:57:42.860374	2013-07-06 06:57:42.860374
95765	101	30	21	2013-07-06 06:57:42.861055	2013-07-06 06:57:42.861055
95766	101	31	21	2013-07-06 06:57:42.86181	2013-07-06 06:57:42.86181
95863	60	16	0	2013-07-06 19:26:11.300403	2013-07-06 19:26:11.300403
95864	60	17	0	2013-07-06 19:26:11.301911	2013-07-06 19:26:11.301911
95865	60	27	0	2013-07-06 19:26:11.302768	2013-07-06 19:26:11.302768
95866	60	28	0	2013-07-06 19:26:11.303502	2013-07-06 19:26:11.303502
95867	60	16	1	2013-07-06 19:26:11.304299	2013-07-06 19:26:11.304299
95868	60	17	1	2013-07-06 19:26:11.30502	2013-07-06 19:26:11.30502
95869	60	27	1	2013-07-06 19:26:11.305692	2013-07-06 19:26:11.305692
95870	60	28	1	2013-07-06 19:26:11.306412	2013-07-06 19:26:11.306412
95871	60	16	2	2013-07-06 19:26:11.307146	2013-07-06 19:26:11.307146
95872	60	17	2	2013-07-06 19:26:11.307811	2013-07-06 19:26:11.307811
95873	60	27	2	2013-07-06 19:26:11.308495	2013-07-06 19:26:11.308495
95874	60	28	2	2013-07-06 19:26:11.309176	2013-07-06 19:26:11.309176
95875	60	16	3	2013-07-06 19:26:11.309908	2013-07-06 19:26:11.309908
95876	60	17	3	2013-07-06 19:26:11.310605	2013-07-06 19:26:11.310605
95877	60	27	3	2013-07-06 19:26:11.313613	2013-07-06 19:26:11.313613
95878	60	28	3	2013-07-06 19:26:11.314407	2013-07-06 19:26:11.314407
95879	60	16	4	2013-07-06 19:26:11.317761	2013-07-06 19:26:11.317761
95880	60	17	4	2013-07-06 19:26:11.318598	2013-07-06 19:26:11.318598
95881	60	27	4	2013-07-06 19:26:11.319525	2013-07-06 19:26:11.319525
95882	60	28	4	2013-07-06 19:26:11.320483	2013-07-06 19:26:11.320483
95883	60	16	5	2013-07-06 19:26:11.321285	2013-07-06 19:26:11.321285
95884	60	17	5	2013-07-06 19:26:11.321959	2013-07-06 19:26:11.321959
95885	60	27	5	2013-07-06 19:26:11.322737	2013-07-06 19:26:11.322737
95886	60	28	5	2013-07-06 19:26:11.323414	2013-07-06 19:26:11.323414
95887	60	16	6	2013-07-06 19:26:11.324204	2013-07-06 19:26:11.324204
95888	60	17	6	2013-07-06 19:26:11.324938	2013-07-06 19:26:11.324938
95889	60	27	6	2013-07-06 19:26:11.325699	2013-07-06 19:26:11.325699
95890	60	28	6	2013-07-06 19:26:11.326701	2013-07-06 19:26:11.326701
95891	82	12	0	2013-07-06 20:02:29.037198	2013-07-06 20:02:29.037198
95892	82	13	0	2013-07-06 20:02:29.038361	2013-07-06 20:02:29.038361
95893	82	14	0	2013-07-06 20:02:29.03914	2013-07-06 20:02:29.03914
95894	82	15	0	2013-07-06 20:02:29.040066	2013-07-06 20:02:29.040066
95895	82	16	0	2013-07-06 20:02:29.040944	2013-07-06 20:02:29.040944
95896	82	17	0	2013-07-06 20:02:29.041773	2013-07-06 20:02:29.041773
95897	82	18	0	2013-07-06 20:02:29.042585	2013-07-06 20:02:29.042585
95898	82	19	0	2013-07-06 20:02:29.043242	2013-07-06 20:02:29.043242
95899	82	20	0	2013-07-06 20:02:29.043909	2013-07-06 20:02:29.043909
95900	82	21	0	2013-07-06 20:02:29.044686	2013-07-06 20:02:29.044686
95901	82	22	0	2013-07-06 20:02:29.045608	2013-07-06 20:02:29.045608
95902	82	23	0	2013-07-06 20:02:29.046399	2013-07-06 20:02:29.046399
95903	82	12	1	2013-07-06 20:02:29.047087	2013-07-06 20:02:29.047087
95904	82	13	1	2013-07-06 20:02:29.047773	2013-07-06 20:02:29.047773
95905	82	14	1	2013-07-06 20:02:29.048442	2013-07-06 20:02:29.048442
95906	82	15	1	2013-07-06 20:02:29.049113	2013-07-06 20:02:29.049113
95907	82	16	1	2013-07-06 20:02:29.049779	2013-07-06 20:02:29.049779
95908	82	17	1	2013-07-06 20:02:29.050533	2013-07-06 20:02:29.050533
95909	82	18	1	2013-07-06 20:02:29.051214	2013-07-06 20:02:29.051214
95910	82	19	1	2013-07-06 20:02:29.051973	2013-07-06 20:02:29.051973
95911	82	20	1	2013-07-06 20:02:29.052762	2013-07-06 20:02:29.052762
95912	82	21	1	2013-07-06 20:02:29.053466	2013-07-06 20:02:29.053466
95913	82	22	1	2013-07-06 20:02:29.054114	2013-07-06 20:02:29.054114
95914	82	23	1	2013-07-06 20:02:29.05477	2013-07-06 20:02:29.05477
95915	82	14	2	2013-07-06 20:02:29.055497	2013-07-06 20:02:29.055497
95916	82	15	2	2013-07-06 20:02:29.056189	2013-07-06 20:02:29.056189
95917	82	16	2	2013-07-06 20:02:29.056866	2013-07-06 20:02:29.056866
95918	82	17	2	2013-07-06 20:02:29.057661	2013-07-06 20:02:29.057661
95919	82	18	2	2013-07-06 20:02:29.05838	2013-07-06 20:02:29.05838
95920	82	19	2	2013-07-06 20:02:29.059057	2013-07-06 20:02:29.059057
95921	82	20	2	2013-07-06 20:02:29.059708	2013-07-06 20:02:29.059708
95922	82	21	2	2013-07-06 20:02:29.060377	2013-07-06 20:02:29.060377
95923	82	22	2	2013-07-06 20:02:29.061066	2013-07-06 20:02:29.061066
95924	82	23	2	2013-07-06 20:02:29.061915	2013-07-06 20:02:29.061915
95925	82	14	3	2013-07-06 20:02:29.062717	2013-07-06 20:02:29.062717
95926	82	15	3	2013-07-06 20:02:29.06338	2013-07-06 20:02:29.06338
95927	82	16	3	2013-07-06 20:02:29.064024	2013-07-06 20:02:29.064024
95928	82	17	3	2013-07-06 20:02:29.0647	2013-07-06 20:02:29.0647
95929	82	18	3	2013-07-06 20:02:29.065448	2013-07-06 20:02:29.065448
95930	82	19	3	2013-07-06 20:02:29.06648	2013-07-06 20:02:29.06648
95931	82	20	3	2013-07-06 20:02:29.067434	2013-07-06 20:02:29.067434
95932	82	21	3	2013-07-06 20:02:29.068605	2013-07-06 20:02:29.068605
95933	82	22	3	2013-07-06 20:02:29.069991	2013-07-06 20:02:29.069991
95934	82	23	3	2013-07-06 20:02:29.071029	2013-07-06 20:02:29.071029
95935	82	16	4	2013-07-06 20:02:29.071827	2013-07-06 20:02:29.071827
95936	82	17	4	2013-07-06 20:02:29.07255	2013-07-06 20:02:29.07255
95937	82	18	4	2013-07-06 20:02:29.073457	2013-07-06 20:02:29.073457
95938	82	19	4	2013-07-06 20:02:29.074218	2013-07-06 20:02:29.074218
95939	82	20	4	2013-07-06 20:02:29.074885	2013-07-06 20:02:29.074885
95940	82	21	4	2013-07-06 20:02:29.075551	2013-07-06 20:02:29.075551
95941	82	22	4	2013-07-06 20:02:29.076273	2013-07-06 20:02:29.076273
95942	82	23	4	2013-07-06 20:02:29.076922	2013-07-06 20:02:29.076922
95943	82	16	5	2013-07-06 20:02:29.077746	2013-07-06 20:02:29.077746
95944	82	17	5	2013-07-06 20:02:29.078611	2013-07-06 20:02:29.078611
95945	82	18	5	2013-07-06 20:02:29.079305	2013-07-06 20:02:29.079305
95946	82	19	5	2013-07-06 20:02:29.079979	2013-07-06 20:02:29.079979
95947	82	20	5	2013-07-06 20:02:29.08065	2013-07-06 20:02:29.08065
95948	82	21	5	2013-07-06 20:02:29.081331	2013-07-06 20:02:29.081331
95949	82	22	5	2013-07-06 20:02:29.082016	2013-07-06 20:02:29.082016
95950	82	23	5	2013-07-06 20:02:29.082964	2013-07-06 20:02:29.082964
95951	82	18	6	2013-07-06 20:02:29.084021	2013-07-06 20:02:29.084021
95952	82	19	6	2013-07-06 20:02:29.085023	2013-07-06 20:02:29.085023
95953	82	20	6	2013-07-06 20:02:29.085776	2013-07-06 20:02:29.085776
95954	82	21	6	2013-07-06 20:02:29.086453	2013-07-06 20:02:29.086453
95955	82	22	6	2013-07-06 20:02:29.087122	2013-07-06 20:02:29.087122
95956	82	23	6	2013-07-06 20:02:29.087806	2013-07-06 20:02:29.087806
95957	82	18	7	2013-07-06 20:02:29.08853	2013-07-06 20:02:29.08853
95958	82	19	7	2013-07-06 20:02:29.089193	2013-07-06 20:02:29.089193
95959	82	20	7	2013-07-06 20:02:29.089953	2013-07-06 20:02:29.089953
95960	82	21	7	2013-07-06 20:02:29.09066	2013-07-06 20:02:29.09066
95961	82	22	7	2013-07-06 20:02:29.091352	2013-07-06 20:02:29.091352
95962	82	23	7	2013-07-06 20:02:29.092032	2013-07-06 20:02:29.092032
95963	82	20	8	2013-07-06 20:02:29.092898	2013-07-06 20:02:29.092898
95964	82	21	8	2013-07-06 20:02:29.093627	2013-07-06 20:02:29.093627
95965	82	22	8	2013-07-06 20:02:29.094416	2013-07-06 20:02:29.094416
95966	82	23	8	2013-07-06 20:02:29.095218	2013-07-06 20:02:29.095218
95967	82	20	9	2013-07-06 20:02:29.095959	2013-07-06 20:02:29.095959
95968	82	21	9	2013-07-06 20:02:29.09663	2013-07-06 20:02:29.09663
95969	82	22	9	2013-07-06 20:02:29.097334	2013-07-06 20:02:29.097334
95970	82	23	9	2013-07-06 20:02:29.097978	2013-07-06 20:02:29.097978
95971	82	22	10	2013-07-06 20:02:29.098788	2013-07-06 20:02:29.098788
95972	82	23	10	2013-07-06 20:02:29.099752	2013-07-06 20:02:29.099752
95973	82	22	11	2013-07-06 20:02:29.100699	2013-07-06 20:02:29.100699
95974	82	23	11	2013-07-06 20:02:29.10165	2013-07-06 20:02:29.10165
95975	82	34	20	2013-07-06 20:02:29.108262	2013-07-06 20:02:29.108262
95976	82	35	20	2013-07-06 20:02:29.109073	2013-07-06 20:02:29.109073
95977	82	34	21	2013-07-06 20:02:29.111404	2013-07-06 20:02:29.111404
95978	82	35	21	2013-07-06 20:02:29.11233	2013-07-06 20:02:29.11233
96102	86	10	0	2013-07-06 20:44:06.16549	2013-07-06 20:44:06.16549
96103	86	11	0	2013-07-06 20:44:06.166577	2013-07-06 20:44:06.166577
96104	86	12	0	2013-07-06 20:44:06.167595	2013-07-06 20:44:06.167595
96105	86	10	1	2013-07-06 20:44:06.168474	2013-07-06 20:44:06.168474
96106	86	11	1	2013-07-06 20:44:06.169427	2013-07-06 20:44:06.169427
96107	86	12	1	2013-07-06 20:44:06.170247	2013-07-06 20:44:06.170247
96108	86	10	2	2013-07-06 20:44:06.171852	2013-07-06 20:44:06.171852
96109	86	11	2	2013-07-06 20:44:06.172627	2013-07-06 20:44:06.172627
96110	86	12	2	2013-07-06 20:44:06.173557	2013-07-06 20:44:06.173557
96111	86	10	5	2013-07-06 20:44:06.179013	2013-07-06 20:44:06.179013
96112	86	11	5	2013-07-06 20:44:06.180173	2013-07-06 20:44:06.180173
96113	86	12	5	2013-07-06 20:44:06.181188	2013-07-06 20:44:06.181188
96114	86	10	6	2013-07-06 20:44:06.185755	2013-07-06 20:44:06.185755
96115	86	11	6	2013-07-06 20:44:06.186494	2013-07-06 20:44:06.186494
96116	86	12	6	2013-07-06 20:44:06.187243	2013-07-06 20:44:06.187243
96117	86	10	7	2013-07-06 20:44:06.188074	2013-07-06 20:44:06.188074
96118	86	11	7	2013-07-06 20:44:06.188793	2013-07-06 20:44:06.188793
96119	86	12	7	2013-07-06 20:44:06.189501	2013-07-06 20:44:06.189501
96120	86	10	8	2013-07-06 20:44:06.192016	2013-07-06 20:44:06.192016
96121	86	11	8	2013-07-06 20:44:06.193918	2013-07-06 20:44:06.193918
96122	86	12	8	2013-07-06 20:44:06.196097	2013-07-06 20:44:06.196097
96123	86	23	8	2013-07-06 20:44:06.197387	2013-07-06 20:44:06.197387
96124	86	24	8	2013-07-06 20:44:06.198419	2013-07-06 20:44:06.198419
96125	86	25	8	2013-07-06 20:44:06.199348	2013-07-06 20:44:06.199348
96126	86	0	9	2013-07-06 20:44:06.200204	2013-07-06 20:44:06.200204
96127	86	1	9	2013-07-06 20:44:06.201019	2013-07-06 20:44:06.201019
96128	86	2	9	2013-07-06 20:44:06.202322	2013-07-06 20:44:06.202322
96129	86	3	9	2013-07-06 20:44:06.203152	2013-07-06 20:44:06.203152
96130	86	4	9	2013-07-06 20:44:06.203883	2013-07-06 20:44:06.203883
96131	86	5	9	2013-07-06 20:44:06.204581	2013-07-06 20:44:06.204581
96132	86	6	9	2013-07-06 20:44:06.205404	2013-07-06 20:44:06.205404
96133	86	7	9	2013-07-06 20:44:06.206089	2013-07-06 20:44:06.206089
96134	86	8	9	2013-07-06 20:44:06.206776	2013-07-06 20:44:06.206776
96135	86	9	9	2013-07-06 20:44:06.207613	2013-07-06 20:44:06.207613
96136	86	10	9	2013-07-06 20:44:06.208331	2013-07-06 20:44:06.208331
96137	86	11	9	2013-07-06 20:44:06.209271	2013-07-06 20:44:06.209271
96138	86	12	9	2013-07-06 20:44:06.210607	2013-07-06 20:44:06.210607
96139	86	23	9	2013-07-06 20:44:06.211587	2013-07-06 20:44:06.211587
96140	86	24	9	2013-07-06 20:44:06.212256	2013-07-06 20:44:06.212256
96141	86	25	9	2013-07-06 20:44:06.213329	2013-07-06 20:44:06.213329
96142	86	0	10	2013-07-06 20:44:06.214521	2013-07-06 20:44:06.214521
96143	86	1	10	2013-07-06 20:44:06.215324	2013-07-06 20:44:06.215324
96144	86	2	10	2013-07-06 20:44:06.216117	2013-07-06 20:44:06.216117
96145	86	3	10	2013-07-06 20:44:06.216918	2013-07-06 20:44:06.216918
96146	86	4	10	2013-07-06 20:44:06.217872	2013-07-06 20:44:06.217872
96147	86	5	10	2013-07-06 20:44:06.2188	2013-07-06 20:44:06.2188
96148	86	6	10	2013-07-06 20:44:06.21956	2013-07-06 20:44:06.21956
96149	86	7	10	2013-07-06 20:44:06.220231	2013-07-06 20:44:06.220231
96150	86	8	10	2013-07-06 20:44:06.220916	2013-07-06 20:44:06.220916
96151	86	9	10	2013-07-06 20:44:06.221595	2013-07-06 20:44:06.221595
96152	86	10	10	2013-07-06 20:44:06.222305	2013-07-06 20:44:06.222305
96153	86	11	10	2013-07-06 20:44:06.223325	2013-07-06 20:44:06.223325
96154	86	12	10	2013-07-06 20:44:06.224131	2013-07-06 20:44:06.224131
96155	86	23	10	2013-07-06 20:44:06.22495	2013-07-06 20:44:06.22495
96156	86	24	10	2013-07-06 20:44:06.225786	2013-07-06 20:44:06.225786
96157	86	25	10	2013-07-06 20:44:06.227903	2013-07-06 20:44:06.227903
96158	86	33	10	2013-07-06 20:44:06.231065	2013-07-06 20:44:06.231065
96159	86	34	10	2013-07-06 20:44:06.232244	2013-07-06 20:44:06.232244
96160	86	35	10	2013-07-06 20:44:06.233217	2013-07-06 20:44:06.233217
96161	86	6	11	2013-07-06 20:44:06.234171	2013-07-06 20:44:06.234171
96162	86	7	11	2013-07-06 20:44:06.234998	2013-07-06 20:44:06.234998
96163	86	8	11	2013-07-06 20:44:06.235788	2013-07-06 20:44:06.235788
96164	86	23	11	2013-07-06 20:44:06.236618	2013-07-06 20:44:06.236618
96165	86	24	11	2013-07-06 20:44:06.23737	2013-07-06 20:44:06.23737
96166	86	25	11	2013-07-06 20:44:06.238085	2013-07-06 20:44:06.238085
96167	86	33	11	2013-07-06 20:44:06.238795	2013-07-06 20:44:06.238795
96168	86	34	11	2013-07-06 20:44:06.239464	2013-07-06 20:44:06.239464
96169	86	35	11	2013-07-06 20:44:06.240132	2013-07-06 20:44:06.240132
96170	86	6	12	2013-07-06 20:44:06.240952	2013-07-06 20:44:06.240952
96171	86	7	12	2013-07-06 20:44:06.241672	2013-07-06 20:44:06.241672
96172	86	8	12	2013-07-06 20:44:06.242465	2013-07-06 20:44:06.242465
96173	86	23	12	2013-07-06 20:44:06.243713	2013-07-06 20:44:06.243713
96174	86	24	12	2013-07-06 20:44:06.245289	2013-07-06 20:44:06.245289
96175	86	25	12	2013-07-06 20:44:06.246173	2013-07-06 20:44:06.246173
96176	86	33	12	2013-07-06 20:44:06.248222	2013-07-06 20:44:06.248222
96177	86	34	12	2013-07-06 20:44:06.248934	2013-07-06 20:44:06.248934
96178	86	35	12	2013-07-06 20:44:06.24972	2013-07-06 20:44:06.24972
96179	86	6	13	2013-07-06 20:44:06.25045	2013-07-06 20:44:06.25045
96180	86	7	13	2013-07-06 20:44:06.251147	2013-07-06 20:44:06.251147
96181	86	8	13	2013-07-06 20:44:06.251931	2013-07-06 20:44:06.251931
96182	86	9	13	2013-07-06 20:44:06.252665	2013-07-06 20:44:06.252665
96183	86	10	13	2013-07-06 20:44:06.253363	2013-07-06 20:44:06.253363
96184	86	11	13	2013-07-06 20:44:06.254136	2013-07-06 20:44:06.254136
96185	86	12	13	2013-07-06 20:44:06.254793	2013-07-06 20:44:06.254793
96186	86	13	13	2013-07-06 20:44:06.255467	2013-07-06 20:44:06.255467
96187	86	14	13	2013-07-06 20:44:06.2564	2013-07-06 20:44:06.2564
96188	86	15	13	2013-07-06 20:44:06.257176	2013-07-06 20:44:06.257176
96189	86	16	13	2013-07-06 20:44:06.257943	2013-07-06 20:44:06.257943
96190	86	17	13	2013-07-06 20:44:06.259388	2013-07-06 20:44:06.259388
96191	86	18	13	2013-07-06 20:44:06.261268	2013-07-06 20:44:06.261268
96192	86	19	13	2013-07-06 20:44:06.262674	2013-07-06 20:44:06.262674
96193	86	20	13	2013-07-06 20:44:06.264514	2013-07-06 20:44:06.264514
96194	86	21	13	2013-07-06 20:44:06.26601	2013-07-06 20:44:06.26601
96195	86	22	13	2013-07-06 20:44:06.267254	2013-07-06 20:44:06.267254
96196	86	23	13	2013-07-06 20:44:06.268189	2013-07-06 20:44:06.268189
96197	86	24	13	2013-07-06 20:44:06.268948	2013-07-06 20:44:06.268948
96198	86	25	13	2013-07-06 20:44:06.269621	2013-07-06 20:44:06.269621
96199	86	33	13	2013-07-06 20:44:06.270294	2013-07-06 20:44:06.270294
96200	86	34	13	2013-07-06 20:44:06.271025	2013-07-06 20:44:06.271025
96201	86	35	13	2013-07-06 20:44:06.271729	2013-07-06 20:44:06.271729
96202	86	6	14	2013-07-06 20:44:06.272384	2013-07-06 20:44:06.272384
96203	86	7	14	2013-07-06 20:44:06.273096	2013-07-06 20:44:06.273096
96204	86	8	14	2013-07-06 20:44:06.273794	2013-07-06 20:44:06.273794
96205	86	9	14	2013-07-06 20:44:06.274604	2013-07-06 20:44:06.274604
96206	86	10	14	2013-07-06 20:44:06.275695	2013-07-06 20:44:06.275695
96207	86	11	14	2013-07-06 20:44:06.277398	2013-07-06 20:44:06.277398
96208	86	12	14	2013-07-06 20:44:06.278968	2013-07-06 20:44:06.278968
96209	86	13	14	2013-07-06 20:44:06.280388	2013-07-06 20:44:06.280388
96210	86	14	14	2013-07-06 20:44:06.281581	2013-07-06 20:44:06.281581
96211	86	15	14	2013-07-06 20:44:06.282341	2013-07-06 20:44:06.282341
96212	86	16	14	2013-07-06 20:44:06.283041	2013-07-06 20:44:06.283041
96213	86	17	14	2013-07-06 20:44:06.283798	2013-07-06 20:44:06.283798
96214	86	18	14	2013-07-06 20:44:06.285079	2013-07-06 20:44:06.285079
96215	86	19	14	2013-07-06 20:44:06.28615	2013-07-06 20:44:06.28615
96216	86	20	14	2013-07-06 20:44:06.286892	2013-07-06 20:44:06.286892
96217	86	21	14	2013-07-06 20:44:06.287602	2013-07-06 20:44:06.287602
96218	86	22	14	2013-07-06 20:44:06.288444	2013-07-06 20:44:06.288444
96219	86	23	14	2013-07-06 20:44:06.289149	2013-07-06 20:44:06.289149
96220	86	24	14	2013-07-06 20:44:06.290014	2013-07-06 20:44:06.290014
96221	86	25	14	2013-07-06 20:44:06.290722	2013-07-06 20:44:06.290722
96222	86	33	14	2013-07-06 20:44:06.291454	2013-07-06 20:44:06.291454
96223	86	34	14	2013-07-06 20:44:06.292287	2013-07-06 20:44:06.292287
96224	86	35	14	2013-07-06 20:44:06.293884	2013-07-06 20:44:06.293884
96225	86	22	15	2013-07-06 20:44:06.297025	2013-07-06 20:44:06.297025
96307	33	16	0	2013-07-06 21:10:03.956513	2013-07-06 21:10:03.956513
96308	33	17	0	2013-07-06 21:10:03.957752	2013-07-06 21:10:03.957752
96309	33	16	1	2013-07-06 21:10:03.958825	2013-07-06 21:10:03.958825
96310	33	17	1	2013-07-06 21:10:03.959733	2013-07-06 21:10:03.959733
96311	33	16	2	2013-07-06 21:10:03.960964	2013-07-06 21:10:03.960964
96312	33	17	2	2013-07-06 21:10:03.961787	2013-07-06 21:10:03.961787
96313	33	16	3	2013-07-06 21:10:03.962823	2013-07-06 21:10:03.962823
96314	33	17	3	2013-07-06 21:10:03.963646	2013-07-06 21:10:03.963646
96315	33	16	4	2013-07-06 21:10:03.964464	2013-07-06 21:10:03.964464
96316	33	17	4	2013-07-06 21:10:03.9652	2013-07-06 21:10:03.9652
96317	33	16	5	2013-07-06 21:10:03.965964	2013-07-06 21:10:03.965964
96318	33	17	5	2013-07-06 21:10:03.966664	2013-07-06 21:10:03.966664
96319	33	16	6	2013-07-06 21:10:03.967477	2013-07-06 21:10:03.967477
96320	33	17	6	2013-07-06 21:10:03.96829	2013-07-06 21:10:03.96829
96321	33	16	7	2013-07-06 21:10:03.96906	2013-07-06 21:10:03.96906
96322	33	17	7	2013-07-06 21:10:03.969887	2013-07-06 21:10:03.969887
96323	33	23	7	2013-07-06 21:10:03.971622	2013-07-06 21:10:03.971622
96324	33	24	7	2013-07-06 21:10:03.972341	2013-07-06 21:10:03.972341
96325	33	16	8	2013-07-06 21:10:03.973079	2013-07-06 21:10:03.973079
96326	33	17	8	2013-07-06 21:10:03.973776	2013-07-06 21:10:03.973776
96327	33	23	8	2013-07-06 21:10:03.974443	2013-07-06 21:10:03.974443
96328	33	24	8	2013-07-06 21:10:03.97525	2013-07-06 21:10:03.97525
96329	33	16	9	2013-07-06 21:10:03.976085	2013-07-06 21:10:03.976085
96330	33	17	9	2013-07-06 21:10:03.976785	2013-07-06 21:10:03.976785
96331	33	18	9	2013-07-06 21:10:03.97768	2013-07-06 21:10:03.97768
96332	33	19	9	2013-07-06 21:10:03.978564	2013-07-06 21:10:03.978564
96333	33	20	9	2013-07-06 21:10:03.979369	2013-07-06 21:10:03.979369
96334	33	21	9	2013-07-06 21:10:03.980113	2013-07-06 21:10:03.980113
96335	33	22	9	2013-07-06 21:10:03.980836	2013-07-06 21:10:03.980836
96336	33	23	9	2013-07-06 21:10:03.981979	2013-07-06 21:10:03.981979
96337	33	24	9	2013-07-06 21:10:03.982753	2013-07-06 21:10:03.982753
96338	33	22	10	2013-07-06 21:10:03.983543	2013-07-06 21:10:03.983543
96339	33	23	10	2013-07-06 21:10:03.984365	2013-07-06 21:10:03.984365
96340	33	24	10	2013-07-06 21:10:03.985324	2013-07-06 21:10:03.985324
96341	33	8	11	2013-07-06 21:10:03.986105	2013-07-06 21:10:03.986105
96342	33	9	11	2013-07-06 21:10:03.986869	2013-07-06 21:10:03.986869
96343	33	22	11	2013-07-06 21:10:03.987585	2013-07-06 21:10:03.987585
96344	33	23	11	2013-07-06 21:10:03.988311	2013-07-06 21:10:03.988311
96345	33	24	11	2013-07-06 21:10:03.989005	2013-07-06 21:10:03.989005
96346	33	8	12	2013-07-06 21:10:03.989715	2013-07-06 21:10:03.989715
96347	33	9	12	2013-07-06 21:10:03.990441	2013-07-06 21:10:03.990441
96348	33	22	12	2013-07-06 21:10:03.99118	2013-07-06 21:10:03.99118
96349	33	23	12	2013-07-06 21:10:03.991902	2013-07-06 21:10:03.991902
96350	33	24	12	2013-07-06 21:10:03.992695	2013-07-06 21:10:03.992695
96351	33	8	13	2013-07-06 21:10:03.994563	2013-07-06 21:10:03.994563
96352	33	9	13	2013-07-06 21:10:03.995437	2013-07-06 21:10:03.995437
96353	33	22	13	2013-07-06 21:10:03.997939	2013-07-06 21:10:03.997939
96354	33	23	13	2013-07-06 21:10:03.999404	2013-07-06 21:10:03.999404
96355	33	24	13	2013-07-06 21:10:04.000726	2013-07-06 21:10:04.000726
96356	33	25	13	2013-07-06 21:10:04.001992	2013-07-06 21:10:04.001992
96357	33	26	13	2013-07-06 21:10:04.003449	2013-07-06 21:10:04.003449
96358	33	27	13	2013-07-06 21:10:04.004846	2013-07-06 21:10:04.004846
96359	33	28	13	2013-07-06 21:10:04.005927	2013-07-06 21:10:04.005927
96360	33	30	13	2013-07-06 21:10:04.007234	2013-07-06 21:10:04.007234
96361	33	31	13	2013-07-06 21:10:04.008202	2013-07-06 21:10:04.008202
96362	33	32	13	2013-07-06 21:10:04.008932	2013-07-06 21:10:04.008932
96363	33	33	13	2013-07-06 21:10:04.009625	2013-07-06 21:10:04.009625
96364	33	34	13	2013-07-06 21:10:04.010305	2013-07-06 21:10:04.010305
96365	33	35	13	2013-07-06 21:10:04.011012	2013-07-06 21:10:04.011012
96366	33	8	14	2013-07-06 21:10:04.011808	2013-07-06 21:10:04.011808
96367	33	9	14	2013-07-06 21:10:04.012488	2013-07-06 21:10:04.012488
96368	33	8	15	2013-07-06 21:10:04.013355	2013-07-06 21:10:04.013355
96369	33	9	15	2013-07-06 21:10:04.014324	2013-07-06 21:10:04.014324
96370	33	10	15	2013-07-06 21:10:04.015479	2013-07-06 21:10:04.015479
96371	33	11	15	2013-07-06 21:10:04.016302	2013-07-06 21:10:04.016302
96372	33	12	15	2013-07-06 21:10:04.01713	2013-07-06 21:10:04.01713
96373	33	13	15	2013-07-06 21:10:04.018124	2013-07-06 21:10:04.018124
96374	33	14	15	2013-07-06 21:10:04.01892	2013-07-06 21:10:04.01892
96375	33	15	15	2013-07-06 21:10:04.019609	2013-07-06 21:10:04.019609
96376	33	14	16	2013-07-06 21:10:04.020454	2013-07-06 21:10:04.020454
96377	33	15	16	2013-07-06 21:10:04.021291	2013-07-06 21:10:04.021291
96378	33	14	17	2013-07-06 21:10:04.022176	2013-07-06 21:10:04.022176
96379	33	15	17	2013-07-06 21:10:04.022906	2013-07-06 21:10:04.022906
96380	33	14	18	2013-07-06 21:10:04.02362	2013-07-06 21:10:04.02362
96381	33	15	18	2013-07-06 21:10:04.024264	2013-07-06 21:10:04.024264
96382	33	14	19	2013-07-06 21:10:04.025987	2013-07-06 21:10:04.025987
96383	33	15	19	2013-07-06 21:10:04.026886	2013-07-06 21:10:04.026886
96384	33	14	20	2013-07-06 21:10:04.02768	2013-07-06 21:10:04.02768
96385	33	15	20	2013-07-06 21:10:04.028363	2013-07-06 21:10:04.028363
96386	33	14	21	2013-07-06 21:10:04.029114	2013-07-06 21:10:04.029114
96387	33	15	21	2013-07-06 21:10:04.029809	2013-07-06 21:10:04.029809
96388	88	16	0	2013-07-06 22:30:42.096244	2013-07-06 22:30:42.096244
96389	88	17	0	2013-07-06 22:30:42.097478	2013-07-06 22:30:42.097478
96390	88	18	0	2013-07-06 22:30:42.098181	2013-07-06 22:30:42.098181
96391	88	19	0	2013-07-06 22:30:42.098889	2013-07-06 22:30:42.098889
96392	88	16	1	2013-07-06 22:30:42.100176	2013-07-06 22:30:42.100176
96393	88	17	1	2013-07-06 22:30:42.10129	2013-07-06 22:30:42.10129
96394	88	18	1	2013-07-06 22:30:42.102014	2013-07-06 22:30:42.102014
96395	88	19	1	2013-07-06 22:30:42.102762	2013-07-06 22:30:42.102762
96396	88	16	2	2013-07-06 22:30:42.103618	2013-07-06 22:30:42.103618
96397	88	17	2	2013-07-06 22:30:42.104322	2013-07-06 22:30:42.104322
96398	88	18	2	2013-07-06 22:30:42.104983	2013-07-06 22:30:42.104983
96399	88	19	2	2013-07-06 22:30:42.10564	2013-07-06 22:30:42.10564
96400	88	16	3	2013-07-06 22:30:42.106328	2013-07-06 22:30:42.106328
96401	88	17	3	2013-07-06 22:30:42.107152	2013-07-06 22:30:42.107152
96402	88	18	3	2013-07-06 22:30:42.107933	2013-07-06 22:30:42.107933
96403	88	19	3	2013-07-06 22:30:42.108605	2013-07-06 22:30:42.108605
96404	88	16	4	2013-07-06 22:30:42.109351	2013-07-06 22:30:42.109351
96405	88	17	4	2013-07-06 22:30:42.110087	2013-07-06 22:30:42.110087
96406	88	18	4	2013-07-06 22:30:42.110758	2013-07-06 22:30:42.110758
96407	88	19	4	2013-07-06 22:30:42.111788	2013-07-06 22:30:42.111788
96408	88	16	5	2013-07-06 22:30:42.11271	2013-07-06 22:30:42.11271
96409	88	17	5	2013-07-06 22:30:42.113406	2013-07-06 22:30:42.113406
96410	88	18	5	2013-07-06 22:30:42.114053	2013-07-06 22:30:42.114053
96411	88	19	5	2013-07-06 22:30:42.114715	2013-07-06 22:30:42.114715
96412	88	16	6	2013-07-06 22:30:42.115421	2013-07-06 22:30:42.115421
96413	88	17	6	2013-07-06 22:30:42.116069	2013-07-06 22:30:42.116069
96414	88	18	6	2013-07-06 22:30:42.116752	2013-07-06 22:30:42.116752
96415	88	19	6	2013-07-06 22:30:42.117898	2013-07-06 22:30:42.117898
96416	88	16	7	2013-07-06 22:30:42.120203	2013-07-06 22:30:42.120203
96417	88	17	7	2013-07-06 22:30:42.121173	2013-07-06 22:30:42.121173
96418	88	18	7	2013-07-06 22:30:42.121987	2013-07-06 22:30:42.121987
96419	88	19	7	2013-07-06 22:30:42.122816	2013-07-06 22:30:42.122816
96420	88	16	8	2013-07-06 22:30:42.124758	2013-07-06 22:30:42.124758
96421	88	17	8	2013-07-06 22:30:42.125666	2013-07-06 22:30:42.125666
96422	88	18	8	2013-07-06 22:30:42.126509	2013-07-06 22:30:42.126509
96423	88	19	8	2013-07-06 22:30:42.127413	2013-07-06 22:30:42.127413
96424	88	16	9	2013-07-06 22:30:42.128357	2013-07-06 22:30:42.128357
96425	88	17	9	2013-07-06 22:30:42.129329	2013-07-06 22:30:42.129329
96426	88	18	9	2013-07-06 22:30:42.130059	2013-07-06 22:30:42.130059
96427	88	19	9	2013-07-06 22:30:42.130795	2013-07-06 22:30:42.130795
96428	88	0	10	2013-07-06 22:30:42.131562	2013-07-06 22:30:42.131562
96429	88	1	10	2013-07-06 22:30:42.132269	2013-07-06 22:30:42.132269
96430	88	2	10	2013-07-06 22:30:42.132961	2013-07-06 22:30:42.132961
96431	88	33	10	2013-07-06 22:30:42.13451	2013-07-06 22:30:42.13451
96432	88	34	10	2013-07-06 22:30:42.135231	2013-07-06 22:30:42.135231
96433	88	35	10	2013-07-06 22:30:42.135916	2013-07-06 22:30:42.135916
96434	88	0	11	2013-07-06 22:30:42.136588	2013-07-06 22:30:42.136588
96435	88	1	11	2013-07-06 22:30:42.13725	2013-07-06 22:30:42.13725
96436	88	2	11	2013-07-06 22:30:42.137894	2013-07-06 22:30:42.137894
96437	88	33	11	2013-07-06 22:30:42.141148	2013-07-06 22:30:42.141148
96438	88	34	11	2013-07-06 22:30:42.141822	2013-07-06 22:30:42.141822
96439	88	35	11	2013-07-06 22:30:42.142524	2013-07-06 22:30:42.142524
96440	88	16	12	2013-07-06 22:30:42.143202	2013-07-06 22:30:42.143202
96441	88	17	12	2013-07-06 22:30:42.143862	2013-07-06 22:30:42.143862
96442	88	18	12	2013-07-06 22:30:42.144518	2013-07-06 22:30:42.144518
96443	88	19	12	2013-07-06 22:30:42.145161	2013-07-06 22:30:42.145161
96444	88	16	13	2013-07-06 22:30:42.146076	2013-07-06 22:30:42.146076
96445	88	17	13	2013-07-06 22:30:42.146845	2013-07-06 22:30:42.146845
96446	88	18	13	2013-07-06 22:30:42.147539	2013-07-06 22:30:42.147539
96447	88	19	13	2013-07-06 22:30:42.148416	2013-07-06 22:30:42.148416
96448	88	16	14	2013-07-06 22:30:42.151534	2013-07-06 22:30:42.151534
96449	88	17	14	2013-07-06 22:30:42.152257	2013-07-06 22:30:42.152257
96450	88	18	14	2013-07-06 22:30:42.152921	2013-07-06 22:30:42.152921
96451	88	19	14	2013-07-06 22:30:42.153615	2013-07-06 22:30:42.153615
96452	88	16	15	2013-07-06 22:30:42.155143	2013-07-06 22:30:42.155143
96453	88	17	15	2013-07-06 22:30:42.155845	2013-07-06 22:30:42.155845
96454	88	18	15	2013-07-06 22:30:42.156527	2013-07-06 22:30:42.156527
96455	88	19	15	2013-07-06 22:30:42.157523	2013-07-06 22:30:42.157523
96456	88	16	16	2013-07-06 22:30:42.160923	2013-07-06 22:30:42.160923
96457	88	17	16	2013-07-06 22:30:42.161611	2013-07-06 22:30:42.161611
96458	88	18	16	2013-07-06 22:30:42.162416	2013-07-06 22:30:42.162416
96459	88	19	16	2013-07-06 22:30:42.163163	2013-07-06 22:30:42.163163
96460	88	16	17	2013-07-06 22:30:42.16387	2013-07-06 22:30:42.16387
96461	88	17	17	2013-07-06 22:30:42.164548	2013-07-06 22:30:42.164548
96462	88	18	17	2013-07-06 22:30:42.165367	2013-07-06 22:30:42.165367
96463	88	19	17	2013-07-06 22:30:42.16635	2013-07-06 22:30:42.16635
96464	88	16	18	2013-07-06 22:30:42.167338	2013-07-06 22:30:42.167338
96465	88	17	18	2013-07-06 22:30:42.168093	2013-07-06 22:30:42.168093
96466	88	18	18	2013-07-06 22:30:42.168809	2013-07-06 22:30:42.168809
96467	88	19	18	2013-07-06 22:30:42.169455	2013-07-06 22:30:42.169455
96468	88	16	19	2013-07-06 22:30:42.171385	2013-07-06 22:30:42.171385
96469	88	17	19	2013-07-06 22:30:42.172066	2013-07-06 22:30:42.172066
96470	88	18	19	2013-07-06 22:30:42.172737	2013-07-06 22:30:42.172737
96471	88	19	19	2013-07-06 22:30:42.173393	2013-07-06 22:30:42.173393
96472	88	16	20	2013-07-06 22:30:42.174256	2013-07-06 22:30:42.174256
96473	88	17	20	2013-07-06 22:30:42.175124	2013-07-06 22:30:42.175124
96474	88	18	20	2013-07-06 22:30:42.176037	2013-07-06 22:30:42.176037
96475	88	19	20	2013-07-06 22:30:42.177073	2013-07-06 22:30:42.177073
96476	88	16	21	2013-07-06 22:30:42.178142	2013-07-06 22:30:42.178142
96477	88	17	21	2013-07-06 22:30:42.178998	2013-07-06 22:30:42.178998
96478	88	18	21	2013-07-06 22:30:42.179697	2013-07-06 22:30:42.179697
96479	88	19	21	2013-07-06 22:30:42.180387	2013-07-06 22:30:42.180387
96671	94	11	0	2013-07-07 04:24:29.929743	2013-07-07 04:24:29.929743
96672	94	12	0	2013-07-07 04:24:29.930759	2013-07-07 04:24:29.930759
96673	94	24	0	2013-07-07 04:24:29.931586	2013-07-07 04:24:29.931586
96674	94	25	0	2013-07-07 04:24:29.932436	2013-07-07 04:24:29.932436
96675	94	11	1	2013-07-07 04:24:29.933211	2013-07-07 04:24:29.933211
96676	94	12	1	2013-07-07 04:24:29.933936	2013-07-07 04:24:29.933936
96677	94	24	1	2013-07-07 04:24:29.934664	2013-07-07 04:24:29.934664
96678	94	25	1	2013-07-07 04:24:29.935488	2013-07-07 04:24:29.935488
96679	94	11	2	2013-07-07 04:24:29.938532	2013-07-07 04:24:29.938532
96680	94	12	2	2013-07-07 04:24:29.939327	2013-07-07 04:24:29.939327
96681	94	24	2	2013-07-07 04:24:29.940219	2013-07-07 04:24:29.940219
96682	94	25	2	2013-07-07 04:24:29.941213	2013-07-07 04:24:29.941213
96683	94	11	3	2013-07-07 04:24:29.942151	2013-07-07 04:24:29.942151
96684	94	12	3	2013-07-07 04:24:29.942963	2013-07-07 04:24:29.942963
96685	94	24	3	2013-07-07 04:24:29.943738	2013-07-07 04:24:29.943738
96686	94	25	3	2013-07-07 04:24:29.944504	2013-07-07 04:24:29.944504
96687	94	11	4	2013-07-07 04:24:29.946606	2013-07-07 04:24:29.946606
96688	94	12	4	2013-07-07 04:24:29.947449	2013-07-07 04:24:29.947449
96689	94	24	4	2013-07-07 04:24:29.948198	2013-07-07 04:24:29.948198
96690	94	25	4	2013-07-07 04:24:29.948942	2013-07-07 04:24:29.948942
96691	94	11	5	2013-07-07 04:24:29.9497	2013-07-07 04:24:29.9497
96692	94	12	5	2013-07-07 04:24:29.950429	2013-07-07 04:24:29.950429
96693	94	24	5	2013-07-07 04:24:29.95124	2013-07-07 04:24:29.95124
96694	94	25	5	2013-07-07 04:24:29.952211	2013-07-07 04:24:29.952211
96695	94	11	6	2013-07-07 04:24:29.955258	2013-07-07 04:24:29.955258
96696	94	12	6	2013-07-07 04:24:29.956275	2013-07-07 04:24:29.956275
96697	94	24	6	2013-07-07 04:24:29.958721	2013-07-07 04:24:29.958721
96698	94	25	6	2013-07-07 04:24:29.959605	2013-07-07 04:24:29.959605
96699	94	0	7	2013-07-07 04:24:29.96145	2013-07-07 04:24:29.96145
96700	94	1	7	2013-07-07 04:24:29.9623	2013-07-07 04:24:29.9623
96701	94	2	7	2013-07-07 04:24:29.963119	2013-07-07 04:24:29.963119
96702	94	3	7	2013-07-07 04:24:29.963892	2013-07-07 04:24:29.963892
96703	94	4	7	2013-07-07 04:24:29.964684	2013-07-07 04:24:29.964684
96704	94	5	7	2013-07-07 04:24:29.965415	2013-07-07 04:24:29.965415
96705	94	6	7	2013-07-07 04:24:29.966427	2013-07-07 04:24:29.966427
96706	94	7	7	2013-07-07 04:24:29.967202	2013-07-07 04:24:29.967202
96707	94	8	7	2013-07-07 04:24:29.967911	2013-07-07 04:24:29.967911
96708	94	9	7	2013-07-07 04:24:29.968707	2013-07-07 04:24:29.968707
96709	94	24	7	2013-07-07 04:24:29.969974	2013-07-07 04:24:29.969974
96710	94	25	7	2013-07-07 04:24:29.97074	2013-07-07 04:24:29.97074
96711	94	0	8	2013-07-07 04:24:29.971558	2013-07-07 04:24:29.971558
96712	94	1	8	2013-07-07 04:24:29.972368	2013-07-07 04:24:29.972368
96713	94	2	8	2013-07-07 04:24:29.973294	2013-07-07 04:24:29.973294
96714	94	3	8	2013-07-07 04:24:29.974124	2013-07-07 04:24:29.974124
96715	94	4	8	2013-07-07 04:24:29.975015	2013-07-07 04:24:29.975015
96716	94	5	8	2013-07-07 04:24:29.975764	2013-07-07 04:24:29.975764
96717	94	6	8	2013-07-07 04:24:29.976452	2013-07-07 04:24:29.976452
96718	94	7	8	2013-07-07 04:24:29.977122	2013-07-07 04:24:29.977122
96719	94	8	8	2013-07-07 04:24:29.977821	2013-07-07 04:24:29.977821
96720	94	9	8	2013-07-07 04:24:29.978554	2013-07-07 04:24:29.978554
96721	94	24	8	2013-07-07 04:24:29.980244	2013-07-07 04:24:29.980244
96722	94	25	8	2013-07-07 04:24:29.980935	2013-07-07 04:24:29.980935
96723	94	24	9	2013-07-07 04:24:29.982451	2013-07-07 04:24:29.982451
96724	94	25	9	2013-07-07 04:24:29.983138	2013-07-07 04:24:29.983138
96725	94	24	10	2013-07-07 04:24:29.983892	2013-07-07 04:24:29.983892
96726	94	25	10	2013-07-07 04:24:29.984558	2013-07-07 04:24:29.984558
96727	94	26	10	2013-07-07 04:24:29.985795	2013-07-07 04:24:29.985795
96728	94	24	11	2013-07-07 04:24:29.991432	2013-07-07 04:24:29.991432
96729	94	25	11	2013-07-07 04:24:29.992976	2013-07-07 04:24:29.992976
96730	94	24	12	2013-07-07 04:24:29.994596	2013-07-07 04:24:29.994596
96731	94	25	12	2013-07-07 04:24:29.995797	2013-07-07 04:24:29.995797
96732	94	24	13	2013-07-07 04:24:29.997749	2013-07-07 04:24:29.997749
96733	94	25	13	2013-07-07 04:24:29.998542	2013-07-07 04:24:29.998542
96734	94	0	14	2013-07-07 04:24:29.999358	2013-07-07 04:24:29.999358
96735	94	1	14	2013-07-07 04:24:30.00006	2013-07-07 04:24:30.00006
96736	94	2	14	2013-07-07 04:24:30.000822	2013-07-07 04:24:30.000822
96737	94	3	14	2013-07-07 04:24:30.001535	2013-07-07 04:24:30.001535
96738	94	4	14	2013-07-07 04:24:30.002459	2013-07-07 04:24:30.002459
96739	94	5	14	2013-07-07 04:24:30.003554	2013-07-07 04:24:30.003554
96740	94	6	14	2013-07-07 04:24:30.004649	2013-07-07 04:24:30.004649
96741	94	7	14	2013-07-07 04:24:30.005602	2013-07-07 04:24:30.005602
96742	94	8	14	2013-07-07 04:24:30.006478	2013-07-07 04:24:30.006478
96743	94	9	14	2013-07-07 04:24:30.007327	2013-07-07 04:24:30.007327
96744	94	10	14	2013-07-07 04:24:30.008705	2013-07-07 04:24:30.008705
96745	94	11	14	2013-07-07 04:24:30.010349	2013-07-07 04:24:30.010349
96746	94	12	14	2013-07-07 04:24:30.011904	2013-07-07 04:24:30.011904
96747	94	13	14	2013-07-07 04:24:30.013448	2013-07-07 04:24:30.013448
96748	94	14	14	2013-07-07 04:24:30.014593	2013-07-07 04:24:30.014593
96749	94	15	14	2013-07-07 04:24:30.015718	2013-07-07 04:24:30.015718
96750	94	16	14	2013-07-07 04:24:30.016631	2013-07-07 04:24:30.016631
96751	94	17	14	2013-07-07 04:24:30.017455	2013-07-07 04:24:30.017455
96752	94	18	14	2013-07-07 04:24:30.018464	2013-07-07 04:24:30.018464
96753	94	19	14	2013-07-07 04:24:30.020089	2013-07-07 04:24:30.020089
96754	94	20	14	2013-07-07 04:24:30.021603	2013-07-07 04:24:30.021603
96755	94	21	14	2013-07-07 04:24:30.023072	2013-07-07 04:24:30.023072
96756	94	22	14	2013-07-07 04:24:30.024659	2013-07-07 04:24:30.024659
96757	94	0	15	2013-07-07 04:24:30.027224	2013-07-07 04:24:30.027224
96758	94	1	15	2013-07-07 04:24:30.028317	2013-07-07 04:24:30.028317
96759	94	2	15	2013-07-07 04:24:30.029275	2013-07-07 04:24:30.029275
96760	94	3	15	2013-07-07 04:24:30.030201	2013-07-07 04:24:30.030201
96761	94	4	15	2013-07-07 04:24:30.031346	2013-07-07 04:24:30.031346
96762	94	5	15	2013-07-07 04:24:30.03303	2013-07-07 04:24:30.03303
96763	94	6	15	2013-07-07 04:24:30.034457	2013-07-07 04:24:30.034457
96764	94	7	15	2013-07-07 04:24:30.036266	2013-07-07 04:24:30.036266
96765	94	8	15	2013-07-07 04:24:30.037453	2013-07-07 04:24:30.037453
96766	94	9	15	2013-07-07 04:24:30.038375	2013-07-07 04:24:30.038375
96767	94	10	15	2013-07-07 04:24:30.039214	2013-07-07 04:24:30.039214
96768	94	11	15	2013-07-07 04:24:30.039981	2013-07-07 04:24:30.039981
96769	94	12	15	2013-07-07 04:24:30.040871	2013-07-07 04:24:30.040871
96770	94	13	15	2013-07-07 04:24:30.041715	2013-07-07 04:24:30.041715
96771	94	14	15	2013-07-07 04:24:30.042482	2013-07-07 04:24:30.042482
96772	94	15	15	2013-07-07 04:24:30.043319	2013-07-07 04:24:30.043319
96773	94	16	15	2013-07-07 04:24:30.044052	2013-07-07 04:24:30.044052
96774	94	17	15	2013-07-07 04:24:30.044783	2013-07-07 04:24:30.044783
96775	94	18	15	2013-07-07 04:24:30.045608	2013-07-07 04:24:30.045608
96776	94	19	15	2013-07-07 04:24:30.046335	2013-07-07 04:24:30.046335
96777	94	20	15	2013-07-07 04:24:30.047082	2013-07-07 04:24:30.047082
96778	94	21	15	2013-07-07 04:24:30.047793	2013-07-07 04:24:30.047793
96779	94	22	15	2013-07-07 04:24:30.048493	2013-07-07 04:24:30.048493
96780	95	0	2	2013-07-07 04:32:56.215095	2013-07-07 04:32:56.215095
96781	95	1	2	2013-07-07 04:32:56.215817	2013-07-07 04:32:56.215817
96782	95	2	2	2013-07-07 04:32:56.21657	2013-07-07 04:32:56.21657
96783	95	3	2	2013-07-07 04:32:56.217261	2013-07-07 04:32:56.217261
96784	95	3	3	2013-07-07 04:32:56.218058	2013-07-07 04:32:56.218058
96785	95	0	6	2013-07-07 04:32:56.221016	2013-07-07 04:32:56.221016
96786	95	1	6	2013-07-07 04:32:56.222062	2013-07-07 04:32:56.222062
96787	95	2	6	2013-07-07 04:32:56.222841	2013-07-07 04:32:56.222841
96788	95	3	6	2013-07-07 04:32:56.223723	2013-07-07 04:32:56.223723
96789	95	4	6	2013-07-07 04:32:56.22459	2013-07-07 04:32:56.22459
96790	95	5	6	2013-07-07 04:32:56.225295	2013-07-07 04:32:56.225295
96791	95	6	6	2013-07-07 04:32:56.226074	2013-07-07 04:32:56.226074
96792	95	7	6	2013-07-07 04:32:56.226789	2013-07-07 04:32:56.226789
96793	95	8	6	2013-07-07 04:32:56.227465	2013-07-07 04:32:56.227465
96794	95	9	6	2013-07-07 04:32:56.228135	2013-07-07 04:32:56.228135
96795	95	10	6	2013-07-07 04:32:56.228787	2013-07-07 04:32:56.228787
96796	95	10	7	2013-07-07 04:32:56.230541	2013-07-07 04:32:56.230541
96797	95	0	10	2013-07-07 04:32:56.234917	2013-07-07 04:32:56.234917
96798	95	1	10	2013-07-07 04:32:56.235605	2013-07-07 04:32:56.235605
96799	95	2	10	2013-07-07 04:32:56.236389	2013-07-07 04:32:56.236389
96800	95	3	10	2013-07-07 04:32:56.237233	2013-07-07 04:32:56.237233
96801	95	4	10	2013-07-07 04:32:56.237984	2013-07-07 04:32:56.237984
96802	95	5	10	2013-07-07 04:32:56.238716	2013-07-07 04:32:56.238716
96803	95	6	10	2013-07-07 04:32:56.239393	2013-07-07 04:32:56.239393
96804	95	7	10	2013-07-07 04:32:56.24015	2013-07-07 04:32:56.24015
96805	95	8	10	2013-07-07 04:32:56.240906	2013-07-07 04:32:56.240906
96806	95	9	10	2013-07-07 04:32:56.24164	2013-07-07 04:32:56.24164
96807	95	10	10	2013-07-07 04:32:56.242329	2013-07-07 04:32:56.242329
96808	95	11	10	2013-07-07 04:32:56.242984	2013-07-07 04:32:56.242984
96809	95	12	10	2013-07-07 04:32:56.243629	2013-07-07 04:32:56.243629
96810	95	13	10	2013-07-07 04:32:56.244312	2013-07-07 04:32:56.244312
96811	95	14	10	2013-07-07 04:32:56.244954	2013-07-07 04:32:56.244954
96812	95	15	10	2013-07-07 04:32:56.245655	2013-07-07 04:32:56.245655
96813	95	16	10	2013-07-07 04:32:56.246387	2013-07-07 04:32:56.246387
96814	95	17	10	2013-07-07 04:32:56.247038	2013-07-07 04:32:56.247038
96815	95	17	11	2013-07-07 04:32:56.249582	2013-07-07 04:32:56.249582
96816	95	0	14	2013-07-07 04:32:56.252749	2013-07-07 04:32:56.252749
96817	95	1	14	2013-07-07 04:32:56.253405	2013-07-07 04:32:56.253405
96818	95	2	14	2013-07-07 04:32:56.254167	2013-07-07 04:32:56.254167
96819	95	3	14	2013-07-07 04:32:56.255096	2013-07-07 04:32:56.255096
96820	95	4	14	2013-07-07 04:32:56.256046	2013-07-07 04:32:56.256046
96821	95	5	14	2013-07-07 04:32:56.256822	2013-07-07 04:32:56.256822
96822	95	6	14	2013-07-07 04:32:56.2575	2013-07-07 04:32:56.2575
96823	95	7	14	2013-07-07 04:32:56.258172	2013-07-07 04:32:56.258172
96824	95	8	14	2013-07-07 04:32:56.258866	2013-07-07 04:32:56.258866
96825	95	9	14	2013-07-07 04:32:56.259571	2013-07-07 04:32:56.259571
96826	95	10	14	2013-07-07 04:32:56.260292	2013-07-07 04:32:56.260292
96827	95	11	14	2013-07-07 04:32:56.261005	2013-07-07 04:32:56.261005
96828	95	12	14	2013-07-07 04:32:56.261664	2013-07-07 04:32:56.261664
96829	95	13	14	2013-07-07 04:32:56.262314	2013-07-07 04:32:56.262314
96830	95	14	14	2013-07-07 04:32:56.263076	2013-07-07 04:32:56.263076
96831	95	15	14	2013-07-07 04:32:56.263729	2013-07-07 04:32:56.263729
96832	95	16	14	2013-07-07 04:32:56.264434	2013-07-07 04:32:56.264434
96833	95	17	14	2013-07-07 04:32:56.265166	2013-07-07 04:32:56.265166
96834	95	18	14	2013-07-07 04:32:56.265817	2013-07-07 04:32:56.265817
96835	95	19	14	2013-07-07 04:32:56.266518	2013-07-07 04:32:56.266518
96836	95	20	14	2013-07-07 04:32:56.267172	2013-07-07 04:32:56.267172
96837	95	21	14	2013-07-07 04:32:56.267867	2013-07-07 04:32:56.267867
96838	95	22	14	2013-07-07 04:32:56.26855	2013-07-07 04:32:56.26855
96839	95	23	14	2013-07-07 04:32:56.269348	2013-07-07 04:32:56.269348
96840	95	24	14	2013-07-07 04:32:56.270018	2013-07-07 04:32:56.270018
96841	95	24	15	2013-07-07 04:32:56.271586	2013-07-07 04:32:56.271586
96842	96	18	0	2013-07-07 04:46:57.77027	2013-07-07 04:46:57.77027
96843	96	18	1	2013-07-07 04:46:57.773756	2013-07-07 04:46:57.773756
96844	96	18	2	2013-07-07 04:46:57.776901	2013-07-07 04:46:57.776901
96845	96	17	3	2013-07-07 04:46:57.77772	2013-07-07 04:46:57.77772
96846	96	18	3	2013-07-07 04:46:57.778399	2013-07-07 04:46:57.778399
96847	96	19	3	2013-07-07 04:46:57.779127	2013-07-07 04:46:57.779127
96848	96	17	4	2013-07-07 04:46:57.779841	2013-07-07 04:46:57.779841
96849	96	18	4	2013-07-07 04:46:57.780528	2013-07-07 04:46:57.780528
96850	96	19	4	2013-07-07 04:46:57.781256	2013-07-07 04:46:57.781256
96851	96	15	8	2013-07-07 04:46:57.784191	2013-07-07 04:46:57.784191
96852	96	16	8	2013-07-07 04:46:57.784894	2013-07-07 04:46:57.784894
96853	96	17	8	2013-07-07 04:46:57.785638	2013-07-07 04:46:57.785638
96854	96	18	8	2013-07-07 04:46:57.786482	2013-07-07 04:46:57.786482
96855	96	19	8	2013-07-07 04:46:57.787478	2013-07-07 04:46:57.787478
96856	96	20	8	2013-07-07 04:46:57.78837	2013-07-07 04:46:57.78837
96857	96	21	8	2013-07-07 04:46:57.789056	2013-07-07 04:46:57.789056
96858	96	15	9	2013-07-07 04:46:57.78976	2013-07-07 04:46:57.78976
96859	96	16	9	2013-07-07 04:46:57.790436	2013-07-07 04:46:57.790436
96860	96	17	9	2013-07-07 04:46:57.791126	2013-07-07 04:46:57.791126
96861	96	18	9	2013-07-07 04:46:57.791986	2013-07-07 04:46:57.791986
96862	96	19	9	2013-07-07 04:46:57.792773	2013-07-07 04:46:57.792773
96863	96	20	9	2013-07-07 04:46:57.793485	2013-07-07 04:46:57.793485
96864	96	21	9	2013-07-07 04:46:57.794166	2013-07-07 04:46:57.794166
96865	96	15	10	2013-07-07 04:46:57.795806	2013-07-07 04:46:57.795806
96866	96	16	10	2013-07-07 04:46:57.796529	2013-07-07 04:46:57.796529
96867	96	17	10	2013-07-07 04:46:57.797205	2013-07-07 04:46:57.797205
96868	96	18	10	2013-07-07 04:46:57.797869	2013-07-07 04:46:57.797869
96869	96	19	10	2013-07-07 04:46:57.798638	2013-07-07 04:46:57.798638
96870	96	20	10	2013-07-07 04:46:57.799469	2013-07-07 04:46:57.799469
96871	96	21	10	2013-07-07 04:46:57.800283	2013-07-07 04:46:57.800283
96872	96	15	11	2013-07-07 04:46:57.803087	2013-07-07 04:46:57.803087
96873	96	16	11	2013-07-07 04:46:57.803983	2013-07-07 04:46:57.803983
96874	96	17	11	2013-07-07 04:46:57.804661	2013-07-07 04:46:57.804661
96875	96	18	11	2013-07-07 04:46:57.805342	2013-07-07 04:46:57.805342
96876	96	19	11	2013-07-07 04:46:57.806028	2013-07-07 04:46:57.806028
96877	96	20	11	2013-07-07 04:46:57.80685	2013-07-07 04:46:57.80685
96878	96	21	11	2013-07-07 04:46:57.807527	2013-07-07 04:46:57.807527
96879	96	15	12	2013-07-07 04:46:57.809068	2013-07-07 04:46:57.809068
96880	96	16	12	2013-07-07 04:46:57.809771	2013-07-07 04:46:57.809771
96881	96	17	12	2013-07-07 04:46:57.810523	2013-07-07 04:46:57.810523
96882	96	18	12	2013-07-07 04:46:57.811194	2013-07-07 04:46:57.811194
96883	96	19	12	2013-07-07 04:46:57.811877	2013-07-07 04:46:57.811877
96884	96	20	12	2013-07-07 04:46:57.812593	2013-07-07 04:46:57.812593
96885	96	21	12	2013-07-07 04:46:57.813249	2013-07-07 04:46:57.813249
96886	96	15	13	2013-07-07 04:46:57.813949	2013-07-07 04:46:57.813949
96887	96	16	13	2013-07-07 04:46:57.814686	2013-07-07 04:46:57.814686
96888	96	17	13	2013-07-07 04:46:57.815558	2013-07-07 04:46:57.815558
96889	96	18	13	2013-07-07 04:46:57.816425	2013-07-07 04:46:57.816425
96890	96	19	13	2013-07-07 04:46:57.817151	2013-07-07 04:46:57.817151
96891	96	20	13	2013-07-07 04:46:57.817917	2013-07-07 04:46:57.817917
96892	96	21	13	2013-07-07 04:46:57.818756	2013-07-07 04:46:57.818756
96893	96	18	14	2013-07-07 04:46:57.820703	2013-07-07 04:46:57.820703
96894	96	18	15	2013-07-07 04:46:57.822986	2013-07-07 04:46:57.822986
96895	96	18	16	2013-07-07 04:46:57.823714	2013-07-07 04:46:57.823714
96896	96	18	17	2013-07-07 04:46:57.825504	2013-07-07 04:46:57.825504
96897	96	18	18	2013-07-07 04:46:57.827072	2013-07-07 04:46:57.827072
96898	96	18	19	2013-07-07 04:46:57.828614	2013-07-07 04:46:57.828614
96899	96	18	20	2013-07-07 04:46:57.829325	2013-07-07 04:46:57.829325
96900	96	18	21	2013-07-07 04:46:57.830106	2013-07-07 04:46:57.830106
96901	97	13	0	2013-07-07 21:36:30.843519	2013-07-07 21:36:30.843519
96902	97	14	0	2013-07-07 21:36:30.845074	2013-07-07 21:36:30.845074
96903	97	15	0	2013-07-07 21:36:30.84602	2013-07-07 21:36:30.84602
96904	97	16	0	2013-07-07 21:36:30.846913	2013-07-07 21:36:30.846913
96905	97	17	0	2013-07-07 21:36:30.848323	2013-07-07 21:36:30.848323
96906	97	18	0	2013-07-07 21:36:30.849403	2013-07-07 21:36:30.849403
96907	97	19	0	2013-07-07 21:36:30.850496	2013-07-07 21:36:30.850496
96908	97	20	0	2013-07-07 21:36:30.85201	2013-07-07 21:36:30.85201
96909	97	13	1	2013-07-07 21:36:30.856231	2013-07-07 21:36:30.856231
96910	97	14	1	2013-07-07 21:36:30.857046	2013-07-07 21:36:30.857046
96911	97	15	1	2013-07-07 21:36:30.857877	2013-07-07 21:36:30.857877
96912	97	16	1	2013-07-07 21:36:30.858683	2013-07-07 21:36:30.858683
96913	97	17	1	2013-07-07 21:36:30.859481	2013-07-07 21:36:30.859481
96914	97	18	1	2013-07-07 21:36:30.860785	2013-07-07 21:36:30.860785
96915	97	19	1	2013-07-07 21:36:30.861751	2013-07-07 21:36:30.861751
96916	97	20	1	2013-07-07 21:36:30.862444	2013-07-07 21:36:30.862444
96917	97	13	2	2013-07-07 21:36:30.863156	2013-07-07 21:36:30.863156
96918	97	14	2	2013-07-07 21:36:30.863893	2013-07-07 21:36:30.863893
96919	97	15	2	2013-07-07 21:36:30.864809	2013-07-07 21:36:30.864809
96920	97	16	2	2013-07-07 21:36:30.865731	2013-07-07 21:36:30.865731
96921	97	17	2	2013-07-07 21:36:30.866461	2013-07-07 21:36:30.866461
96922	97	18	2	2013-07-07 21:36:30.867139	2013-07-07 21:36:30.867139
96923	97	19	2	2013-07-07 21:36:30.868058	2013-07-07 21:36:30.868058
96924	97	20	2	2013-07-07 21:36:30.869128	2013-07-07 21:36:30.869128
96925	97	13	3	2013-07-07 21:36:30.869951	2013-07-07 21:36:30.869951
96926	97	14	3	2013-07-07 21:36:30.870717	2013-07-07 21:36:30.870717
96927	97	15	3	2013-07-07 21:36:30.871428	2013-07-07 21:36:30.871428
96928	97	16	3	2013-07-07 21:36:30.872114	2013-07-07 21:36:30.872114
96929	97	17	3	2013-07-07 21:36:30.872799	2013-07-07 21:36:30.872799
96930	97	18	3	2013-07-07 21:36:30.873662	2013-07-07 21:36:30.873662
96931	97	19	3	2013-07-07 21:36:30.874384	2013-07-07 21:36:30.874384
96932	97	20	3	2013-07-07 21:36:30.875525	2013-07-07 21:36:30.875525
96933	97	16	4	2013-07-07 21:36:30.876496	2013-07-07 21:36:30.876496
96934	97	17	4	2013-07-07 21:36:30.877278	2013-07-07 21:36:30.877278
96935	97	16	5	2013-07-07 21:36:30.878202	2013-07-07 21:36:30.878202
96936	97	17	5	2013-07-07 21:36:30.878937	2013-07-07 21:36:30.878937
96937	97	16	6	2013-07-07 21:36:30.879678	2013-07-07 21:36:30.879678
96938	97	17	6	2013-07-07 21:36:30.880476	2013-07-07 21:36:30.880476
96939	97	16	7	2013-07-07 21:36:30.88223	2013-07-07 21:36:30.88223
96940	97	17	7	2013-07-07 21:36:30.882914	2013-07-07 21:36:30.882914
96941	97	16	8	2013-07-07 21:36:30.885351	2013-07-07 21:36:30.885351
96942	97	17	8	2013-07-07 21:36:30.886158	2013-07-07 21:36:30.886158
96943	97	16	9	2013-07-07 21:36:30.887707	2013-07-07 21:36:30.887707
96944	97	17	9	2013-07-07 21:36:30.888421	2013-07-07 21:36:30.888421
96945	97	16	10	2013-07-07 21:36:30.889152	2013-07-07 21:36:30.889152
96946	97	17	10	2013-07-07 21:36:30.889899	2013-07-07 21:36:30.889899
100048	98	5	0	2013-07-08 21:32:20.84614	2013-07-08 21:32:20.84614
100049	98	6	0	2013-07-08 21:32:20.84692	2013-07-08 21:32:20.84692
100050	98	7	0	2013-07-08 21:32:20.847618	2013-07-08 21:32:20.847618
100051	98	8	0	2013-07-08 21:32:20.848484	2013-07-08 21:32:20.848484
100052	98	9	0	2013-07-08 21:32:20.849193	2013-07-08 21:32:20.849193
100053	98	10	0	2013-07-08 21:32:20.850074	2013-07-08 21:32:20.850074
100054	98	11	0	2013-07-08 21:32:20.850758	2013-07-08 21:32:20.850758
100055	98	12	0	2013-07-08 21:32:20.851564	2013-07-08 21:32:20.851564
100056	98	13	0	2013-07-08 21:32:20.852306	2013-07-08 21:32:20.852306
100057	98	14	0	2013-07-08 21:32:20.853007	2013-07-08 21:32:20.853007
100058	98	15	0	2013-07-08 21:32:20.853676	2013-07-08 21:32:20.853676
100059	98	16	0	2013-07-08 21:32:20.854369	2013-07-08 21:32:20.854369
100060	98	17	0	2013-07-08 21:32:20.855125	2013-07-08 21:32:20.855125
100061	98	18	0	2013-07-08 21:32:20.855809	2013-07-08 21:32:20.855809
100062	98	19	0	2013-07-08 21:32:20.856985	2013-07-08 21:32:20.856985
100063	98	20	0	2013-07-08 21:32:20.85811	2013-07-08 21:32:20.85811
100064	98	21	0	2013-07-08 21:32:20.859244	2013-07-08 21:32:20.859244
100065	98	22	0	2013-07-08 21:32:20.860215	2013-07-08 21:32:20.860215
100066	98	23	0	2013-07-08 21:32:20.861283	2013-07-08 21:32:20.861283
100067	98	24	0	2013-07-08 21:32:20.862101	2013-07-08 21:32:20.862101
100068	98	25	0	2013-07-08 21:32:20.862843	2013-07-08 21:32:20.862843
100069	98	26	0	2013-07-08 21:32:20.863558	2013-07-08 21:32:20.863558
100070	98	27	0	2013-07-08 21:32:20.86424	2013-07-08 21:32:20.86424
100071	98	28	0	2013-07-08 21:32:20.864945	2013-07-08 21:32:20.864945
100072	98	29	0	2013-07-08 21:32:20.865834	2013-07-08 21:32:20.865834
100073	98	30	0	2013-07-08 21:32:20.866548	2013-07-08 21:32:20.866548
100074	98	31	0	2013-07-08 21:32:20.867257	2013-07-08 21:32:20.867257
100075	98	32	0	2013-07-08 21:32:20.867989	2013-07-08 21:32:20.867989
100076	98	33	0	2013-07-08 21:32:20.868678	2013-07-08 21:32:20.868678
100077	98	34	0	2013-07-08 21:32:20.869504	2013-07-08 21:32:20.869504
100078	98	35	0	2013-07-08 21:32:20.870355	2013-07-08 21:32:20.870355
100079	98	5	1	2013-07-08 21:32:20.872203	2013-07-08 21:32:20.872203
100080	98	6	1	2013-07-08 21:32:20.873239	2013-07-08 21:32:20.873239
100081	98	7	1	2013-07-08 21:32:20.874411	2013-07-08 21:32:20.874411
100082	98	8	1	2013-07-08 21:32:20.875416	2013-07-08 21:32:20.875416
100083	98	9	1	2013-07-08 21:32:20.876298	2013-07-08 21:32:20.876298
100084	98	10	1	2013-07-08 21:32:20.87708	2013-07-08 21:32:20.87708
100085	98	19	1	2013-07-08 21:32:20.879035	2013-07-08 21:32:20.879035
100086	98	20	1	2013-07-08 21:32:20.879777	2013-07-08 21:32:20.879777
100087	98	0	2	2013-07-08 21:32:20.884067	2013-07-08 21:32:20.884067
100088	98	1	2	2013-07-08 21:32:20.884851	2013-07-08 21:32:20.884851
100089	98	2	2	2013-07-08 21:32:20.885556	2013-07-08 21:32:20.885556
100090	98	6	2	2013-07-08 21:32:20.88797	2013-07-08 21:32:20.88797
100091	98	7	2	2013-07-08 21:32:20.888772	2013-07-08 21:32:20.888772
100092	98	8	2	2013-07-08 21:32:20.88985	2013-07-08 21:32:20.88985
100093	98	9	2	2013-07-08 21:32:20.891074	2013-07-08 21:32:20.891074
100094	98	10	2	2013-07-08 21:32:20.892088	2013-07-08 21:32:20.892088
100095	98	19	2	2013-07-08 21:32:20.894976	2013-07-08 21:32:20.894976
100096	98	20	2	2013-07-08 21:32:20.89584	2013-07-08 21:32:20.89584
100097	98	21	2	2013-07-08 21:32:20.896603	2013-07-08 21:32:20.896603
100098	98	22	2	2013-07-08 21:32:20.897363	2013-07-08 21:32:20.897363
100099	98	23	2	2013-07-08 21:32:20.898207	2013-07-08 21:32:20.898207
100100	98	24	2	2013-07-08 21:32:20.898983	2013-07-08 21:32:20.898983
100101	98	25	2	2013-07-08 21:32:20.899688	2013-07-08 21:32:20.899688
100102	98	26	2	2013-07-08 21:32:20.900546	2013-07-08 21:32:20.900546
100103	98	0	3	2013-07-08 21:32:20.903715	2013-07-08 21:32:20.903715
100104	98	1	3	2013-07-08 21:32:20.9048	2013-07-08 21:32:20.9048
100105	98	2	3	2013-07-08 21:32:20.905802	2013-07-08 21:32:20.905802
100106	98	6	3	2013-07-08 21:32:20.908488	2013-07-08 21:32:20.908488
100107	98	7	3	2013-07-08 21:32:20.910184	2013-07-08 21:32:20.910184
100108	98	8	3	2013-07-08 21:32:20.911457	2013-07-08 21:32:20.911457
100109	98	9	3	2013-07-08 21:32:20.912335	2013-07-08 21:32:20.912335
100110	98	10	3	2013-07-08 21:32:20.913359	2013-07-08 21:32:20.913359
100111	98	14	3	2013-07-08 21:32:20.915883	2013-07-08 21:32:20.915883
100112	98	15	3	2013-07-08 21:32:20.916688	2013-07-08 21:32:20.916688
100113	98	16	3	2013-07-08 21:32:20.917506	2013-07-08 21:32:20.917506
100114	98	19	3	2013-07-08 21:32:20.919097	2013-07-08 21:32:20.919097
100115	98	20	3	2013-07-08 21:32:20.920134	2013-07-08 21:32:20.920134
100116	98	21	3	2013-07-08 21:32:20.921003	2013-07-08 21:32:20.921003
100117	98	22	3	2013-07-08 21:32:20.921831	2013-07-08 21:32:20.921831
100118	98	23	3	2013-07-08 21:32:20.922658	2013-07-08 21:32:20.922658
100119	98	32	3	2013-07-08 21:32:20.926832	2013-07-08 21:32:20.926832
100120	98	33	3	2013-07-08 21:32:20.927784	2013-07-08 21:32:20.927784
100121	98	34	3	2013-07-08 21:32:20.928812	2013-07-08 21:32:20.928812
100122	98	35	3	2013-07-08 21:32:20.929674	2013-07-08 21:32:20.929674
100123	98	0	4	2013-07-08 21:32:20.930411	2013-07-08 21:32:20.930411
100124	98	1	4	2013-07-08 21:32:20.931244	2013-07-08 21:32:20.931244
100125	98	2	4	2013-07-08 21:32:20.932357	2013-07-08 21:32:20.932357
100126	98	3	4	2013-07-08 21:32:20.933833	2013-07-08 21:32:20.933833
100127	98	6	4	2013-07-08 21:32:20.935992	2013-07-08 21:32:20.935992
100128	98	7	4	2013-07-08 21:32:20.936774	2013-07-08 21:32:20.936774
100129	98	8	4	2013-07-08 21:32:20.937584	2013-07-08 21:32:20.937584
100130	98	9	4	2013-07-08 21:32:20.938385	2013-07-08 21:32:20.938385
100131	98	10	4	2013-07-08 21:32:20.939228	2013-07-08 21:32:20.939228
100132	98	11	4	2013-07-08 21:32:20.94057	2013-07-08 21:32:20.94057
100133	98	15	4	2013-07-08 21:32:20.944261	2013-07-08 21:32:20.944261
100134	98	16	4	2013-07-08 21:32:20.946076	2013-07-08 21:32:20.946076
100135	98	19	4	2013-07-08 21:32:20.947234	2013-07-08 21:32:20.947234
100136	98	20	4	2013-07-08 21:32:20.948151	2013-07-08 21:32:20.948151
100137	98	21	4	2013-07-08 21:32:20.948937	2013-07-08 21:32:20.948937
100138	98	22	4	2013-07-08 21:32:20.950015	2013-07-08 21:32:20.950015
100139	98	23	4	2013-07-08 21:32:20.950749	2013-07-08 21:32:20.950749
100140	98	32	4	2013-07-08 21:32:20.95233	2013-07-08 21:32:20.95233
100141	98	33	4	2013-07-08 21:32:20.953099	2013-07-08 21:32:20.953099
100142	98	34	4	2013-07-08 21:32:20.953819	2013-07-08 21:32:20.953819
100143	98	35	4	2013-07-08 21:32:20.954584	2013-07-08 21:32:20.954584
100144	98	0	5	2013-07-08 21:32:20.955295	2013-07-08 21:32:20.955295
100145	98	1	5	2013-07-08 21:32:20.956467	2013-07-08 21:32:20.956467
100146	98	2	5	2013-07-08 21:32:20.957229	2013-07-08 21:32:20.957229
100147	98	3	5	2013-07-08 21:32:20.957942	2013-07-08 21:32:20.957942
100148	98	6	5	2013-07-08 21:32:20.959503	2013-07-08 21:32:20.959503
100149	98	7	5	2013-07-08 21:32:20.960571	2013-07-08 21:32:20.960571
100150	98	8	5	2013-07-08 21:32:20.961377	2013-07-08 21:32:20.961377
100151	98	9	5	2013-07-08 21:32:20.962049	2013-07-08 21:32:20.962049
100152	98	10	5	2013-07-08 21:32:20.962768	2013-07-08 21:32:20.962768
100153	98	11	5	2013-07-08 21:32:20.963484	2013-07-08 21:32:20.963484
100154	98	15	5	2013-07-08 21:32:20.965121	2013-07-08 21:32:20.965121
100155	98	16	5	2013-07-08 21:32:20.965822	2013-07-08 21:32:20.965822
100156	98	19	5	2013-07-08 21:32:20.966558	2013-07-08 21:32:20.966558
100157	98	20	5	2013-07-08 21:32:20.96726	2013-07-08 21:32:20.96726
100158	98	21	5	2013-07-08 21:32:20.967939	2013-07-08 21:32:20.967939
100159	98	22	5	2013-07-08 21:32:20.968623	2013-07-08 21:32:20.968623
100160	98	26	5	2013-07-08 21:32:20.970469	2013-07-08 21:32:20.970469
100161	98	27	5	2013-07-08 21:32:20.971472	2013-07-08 21:32:20.971472
100162	98	28	5	2013-07-08 21:32:20.972628	2013-07-08 21:32:20.972628
100163	98	33	5	2013-07-08 21:32:20.976707	2013-07-08 21:32:20.976707
100164	98	34	5	2013-07-08 21:32:20.978273	2013-07-08 21:32:20.978273
100165	98	35	5	2013-07-08 21:32:20.97922	2013-07-08 21:32:20.97922
100166	98	0	6	2013-07-08 21:32:20.979971	2013-07-08 21:32:20.979971
100167	98	1	6	2013-07-08 21:32:20.980707	2013-07-08 21:32:20.980707
100168	98	2	6	2013-07-08 21:32:20.98151	2013-07-08 21:32:20.98151
100169	98	3	6	2013-07-08 21:32:20.982234	2013-07-08 21:32:20.982234
100170	98	6	6	2013-07-08 21:32:20.982939	2013-07-08 21:32:20.982939
100171	98	7	6	2013-07-08 21:32:20.983614	2013-07-08 21:32:20.983614
100172	98	8	6	2013-07-08 21:32:20.984419	2013-07-08 21:32:20.984419
100173	98	9	6	2013-07-08 21:32:20.985096	2013-07-08 21:32:20.985096
100174	98	10	6	2013-07-08 21:32:20.985801	2013-07-08 21:32:20.985801
100175	98	11	6	2013-07-08 21:32:20.986519	2013-07-08 21:32:20.986519
100176	98	12	6	2013-07-08 21:32:20.987494	2013-07-08 21:32:20.987494
100177	98	15	6	2013-07-08 21:32:20.988324	2013-07-08 21:32:20.988324
100178	98	16	6	2013-07-08 21:32:20.989223	2013-07-08 21:32:20.989223
100179	98	19	6	2013-07-08 21:32:20.989989	2013-07-08 21:32:20.989989
100180	98	20	6	2013-07-08 21:32:20.990704	2013-07-08 21:32:20.990704
100181	98	21	6	2013-07-08 21:32:20.991436	2013-07-08 21:32:20.991436
100182	98	22	6	2013-07-08 21:32:20.992138	2013-07-08 21:32:20.992138
100183	98	26	6	2013-07-08 21:32:20.993966	2013-07-08 21:32:20.993966
100184	98	27	6	2013-07-08 21:32:20.994718	2013-07-08 21:32:20.994718
100185	98	28	6	2013-07-08 21:32:20.995452	2013-07-08 21:32:20.995452
100186	98	33	6	2013-07-08 21:32:20.998021	2013-07-08 21:32:20.998021
100187	98	34	6	2013-07-08 21:32:20.998764	2013-07-08 21:32:20.998764
100188	98	35	6	2013-07-08 21:32:20.999457	2013-07-08 21:32:20.999457
100189	98	0	7	2013-07-08 21:32:21.000151	2013-07-08 21:32:21.000151
100190	98	1	7	2013-07-08 21:32:21.00081	2013-07-08 21:32:21.00081
100191	98	2	7	2013-07-08 21:32:21.001565	2013-07-08 21:32:21.001565
100192	98	3	7	2013-07-08 21:32:21.002242	2013-07-08 21:32:21.002242
100193	98	8	7	2013-07-08 21:32:21.004486	2013-07-08 21:32:21.004486
100194	98	9	7	2013-07-08 21:32:21.005209	2013-07-08 21:32:21.005209
100195	98	10	7	2013-07-08 21:32:21.005947	2013-07-08 21:32:21.005947
100196	98	11	7	2013-07-08 21:32:21.007107	2013-07-08 21:32:21.007107
100197	98	12	7	2013-07-08 21:32:21.008185	2013-07-08 21:32:21.008185
100198	98	15	7	2013-07-08 21:32:21.011052	2013-07-08 21:32:21.011052
100199	98	16	7	2013-07-08 21:32:21.011822	2013-07-08 21:32:21.011822
100200	98	20	7	2013-07-08 21:32:21.014423	2013-07-08 21:32:21.014423
100201	98	21	7	2013-07-08 21:32:21.015497	2013-07-08 21:32:21.015497
100202	98	22	7	2013-07-08 21:32:21.016254	2013-07-08 21:32:21.016254
100203	98	26	7	2013-07-08 21:32:21.017566	2013-07-08 21:32:21.017566
100204	98	27	7	2013-07-08 21:32:21.018371	2013-07-08 21:32:21.018371
100205	98	28	7	2013-07-08 21:32:21.01907	2013-07-08 21:32:21.01907
100206	98	29	7	2013-07-08 21:32:21.019762	2013-07-08 21:32:21.019762
100207	98	33	7	2013-07-08 21:32:21.020459	2013-07-08 21:32:21.020459
100208	98	34	7	2013-07-08 21:32:21.02124	2013-07-08 21:32:21.02124
100209	98	35	7	2013-07-08 21:32:21.021936	2013-07-08 21:32:21.021936
100210	98	0	8	2013-07-08 21:32:21.022689	2013-07-08 21:32:21.022689
100211	98	1	8	2013-07-08 21:32:21.023435	2013-07-08 21:32:21.023435
100212	98	2	8	2013-07-08 21:32:21.024098	2013-07-08 21:32:21.024098
100213	98	3	8	2013-07-08 21:32:21.024803	2013-07-08 21:32:21.024803
100214	98	10	8	2013-07-08 21:32:21.028406	2013-07-08 21:32:21.028406
100215	98	11	8	2013-07-08 21:32:21.029128	2013-07-08 21:32:21.029128
100216	98	12	8	2013-07-08 21:32:21.029842	2013-07-08 21:32:21.029842
100217	98	15	8	2013-07-08 21:32:21.030674	2013-07-08 21:32:21.030674
100218	98	16	8	2013-07-08 21:32:21.031507	2013-07-08 21:32:21.031507
100219	98	20	8	2013-07-08 21:32:21.033303	2013-07-08 21:32:21.033303
100220	98	21	8	2013-07-08 21:32:21.034122	2013-07-08 21:32:21.034122
100221	98	22	8	2013-07-08 21:32:21.034918	2013-07-08 21:32:21.034918
100222	98	26	8	2013-07-08 21:32:21.036523	2013-07-08 21:32:21.036523
100223	98	27	8	2013-07-08 21:32:21.037567	2013-07-08 21:32:21.037567
100224	98	28	8	2013-07-08 21:32:21.038421	2013-07-08 21:32:21.038421
100225	98	29	8	2013-07-08 21:32:21.039182	2013-07-08 21:32:21.039182
100226	98	34	8	2013-07-08 21:32:21.041574	2013-07-08 21:32:21.041574
100227	98	35	8	2013-07-08 21:32:21.042282	2013-07-08 21:32:21.042282
100228	98	0	9	2013-07-08 21:32:21.042981	2013-07-08 21:32:21.042981
100229	98	1	9	2013-07-08 21:32:21.043781	2013-07-08 21:32:21.043781
100230	98	2	9	2013-07-08 21:32:21.044493	2013-07-08 21:32:21.044493
100231	98	3	9	2013-07-08 21:32:21.045183	2013-07-08 21:32:21.045183
100232	98	4	9	2013-07-08 21:32:21.045925	2013-07-08 21:32:21.045925
100233	98	5	9	2013-07-08 21:32:21.046666	2013-07-08 21:32:21.046666
100234	98	6	9	2013-07-08 21:32:21.0474	2013-07-08 21:32:21.0474
100235	98	15	9	2013-07-08 21:32:21.049163	2013-07-08 21:32:21.049163
100236	98	16	9	2013-07-08 21:32:21.049979	2013-07-08 21:32:21.049979
100237	98	20	9	2013-07-08 21:32:21.050683	2013-07-08 21:32:21.050683
100238	98	21	9	2013-07-08 21:32:21.051411	2013-07-08 21:32:21.051411
100239	98	22	9	2013-07-08 21:32:21.052146	2013-07-08 21:32:21.052146
100240	98	24	9	2013-07-08 21:32:21.052836	2013-07-08 21:32:21.052836
100241	98	25	9	2013-07-08 21:32:21.053591	2013-07-08 21:32:21.053591
100242	98	26	9	2013-07-08 21:32:21.054368	2013-07-08 21:32:21.054368
100243	98	27	9	2013-07-08 21:32:21.055068	2013-07-08 21:32:21.055068
100244	98	28	9	2013-07-08 21:32:21.055813	2013-07-08 21:32:21.055813
100245	98	29	9	2013-07-08 21:32:21.056597	2013-07-08 21:32:21.056597
100246	98	34	9	2013-07-08 21:32:21.059144	2013-07-08 21:32:21.059144
100247	98	35	9	2013-07-08 21:32:21.059858	2013-07-08 21:32:21.059858
100248	98	0	10	2013-07-08 21:32:21.060584	2013-07-08 21:32:21.060584
100249	98	1	10	2013-07-08 21:32:21.061279	2013-07-08 21:32:21.061279
100250	98	2	10	2013-07-08 21:32:21.062011	2013-07-08 21:32:21.062011
100251	98	3	10	2013-07-08 21:32:21.062695	2013-07-08 21:32:21.062695
100252	98	4	10	2013-07-08 21:32:21.063398	2013-07-08 21:32:21.063398
100253	98	5	10	2013-07-08 21:32:21.064104	2013-07-08 21:32:21.064104
100254	98	6	10	2013-07-08 21:32:21.064865	2013-07-08 21:32:21.064865
100255	98	15	10	2013-07-08 21:32:21.067672	2013-07-08 21:32:21.067672
100256	98	16	10	2013-07-08 21:32:21.068689	2013-07-08 21:32:21.068689
100257	98	20	10	2013-07-08 21:32:21.069592	2013-07-08 21:32:21.069592
100258	98	21	10	2013-07-08 21:32:21.070608	2013-07-08 21:32:21.070608
100259	98	22	10	2013-07-08 21:32:21.104328	2013-07-08 21:32:21.104328
100260	98	24	10	2013-07-08 21:32:21.105728	2013-07-08 21:32:21.105728
100261	98	25	10	2013-07-08 21:32:21.106673	2013-07-08 21:32:21.106673
100262	98	26	10	2013-07-08 21:32:21.10749	2013-07-08 21:32:21.10749
100263	98	27	10	2013-07-08 21:32:21.108174	2013-07-08 21:32:21.108174
100264	98	28	10	2013-07-08 21:32:21.109023	2013-07-08 21:32:21.109023
100265	98	29	10	2013-07-08 21:32:21.109868	2013-07-08 21:32:21.109868
100266	98	30	10	2013-07-08 21:32:21.110806	2013-07-08 21:32:21.110806
100267	98	31	10	2013-07-08 21:32:21.111522	2013-07-08 21:32:21.111522
100268	98	34	10	2013-07-08 21:32:21.112245	2013-07-08 21:32:21.112245
100269	98	35	10	2013-07-08 21:32:21.112964	2013-07-08 21:32:21.112964
100270	98	0	11	2013-07-08 21:32:21.11368	2013-07-08 21:32:21.11368
100271	98	1	11	2013-07-08 21:32:21.114383	2013-07-08 21:32:21.114383
100272	98	2	11	2013-07-08 21:32:21.11514	2013-07-08 21:32:21.11514
100273	98	3	11	2013-07-08 21:32:21.11586	2013-07-08 21:32:21.11586
100274	98	4	11	2013-07-08 21:32:21.116606	2013-07-08 21:32:21.116606
100275	98	5	11	2013-07-08 21:32:21.117363	2013-07-08 21:32:21.117363
100276	98	6	11	2013-07-08 21:32:21.118052	2013-07-08 21:32:21.118052
100277	98	7	11	2013-07-08 21:32:21.118742	2013-07-08 21:32:21.118742
100278	98	8	11	2013-07-08 21:32:21.11965	2013-07-08 21:32:21.11965
100279	98	9	11	2013-07-08 21:32:21.120365	2013-07-08 21:32:21.120365
100280	98	10	11	2013-07-08 21:32:21.121165	2013-07-08 21:32:21.121165
100281	98	11	11	2013-07-08 21:32:21.121912	2013-07-08 21:32:21.121912
100282	98	15	11	2013-07-08 21:32:21.124385	2013-07-08 21:32:21.124385
100283	98	16	11	2013-07-08 21:32:21.125095	2013-07-08 21:32:21.125095
100284	98	21	11	2013-07-08 21:32:21.127646	2013-07-08 21:32:21.127646
100285	98	22	11	2013-07-08 21:32:21.128512	2013-07-08 21:32:21.128512
100286	98	24	11	2013-07-08 21:32:21.130702	2013-07-08 21:32:21.130702
100287	98	25	11	2013-07-08 21:32:21.131738	2013-07-08 21:32:21.131738
100288	98	26	11	2013-07-08 21:32:21.132504	2013-07-08 21:32:21.132504
100289	98	27	11	2013-07-08 21:32:21.13321	2013-07-08 21:32:21.13321
100290	98	28	11	2013-07-08 21:32:21.133924	2013-07-08 21:32:21.133924
100291	98	29	11	2013-07-08 21:32:21.13465	2013-07-08 21:32:21.13465
100292	98	30	11	2013-07-08 21:32:21.135378	2013-07-08 21:32:21.135378
100293	98	31	11	2013-07-08 21:32:21.136057	2013-07-08 21:32:21.136057
100294	98	35	11	2013-07-08 21:32:21.13838	2013-07-08 21:32:21.13838
100295	98	0	12	2013-07-08 21:32:21.139181	2013-07-08 21:32:21.139181
100296	98	11	12	2013-07-08 21:32:21.141828	2013-07-08 21:32:21.141828
100297	98	12	12	2013-07-08 21:32:21.142598	2013-07-08 21:32:21.142598
100298	98	13	12	2013-07-08 21:32:21.143285	2013-07-08 21:32:21.143285
100299	98	14	12	2013-07-08 21:32:21.14399	2013-07-08 21:32:21.14399
100300	98	15	12	2013-07-08 21:32:21.144688	2013-07-08 21:32:21.144688
100301	98	16	12	2013-07-08 21:32:21.145396	2013-07-08 21:32:21.145396
100302	98	17	12	2013-07-08 21:32:21.146278	2013-07-08 21:32:21.146278
100303	98	18	12	2013-07-08 21:32:21.147099	2013-07-08 21:32:21.147099
100304	98	19	12	2013-07-08 21:32:21.147799	2013-07-08 21:32:21.147799
100305	98	21	12	2013-07-08 21:32:21.149481	2013-07-08 21:32:21.149481
100306	98	22	12	2013-07-08 21:32:21.150233	2013-07-08 21:32:21.150233
100307	98	24	12	2013-07-08 21:32:21.151784	2013-07-08 21:32:21.151784
100308	98	25	12	2013-07-08 21:32:21.152517	2013-07-08 21:32:21.152517
100309	98	26	12	2013-07-08 21:32:21.153197	2013-07-08 21:32:21.153197
100310	98	27	12	2013-07-08 21:32:21.153926	2013-07-08 21:32:21.153926
100311	98	28	12	2013-07-08 21:32:21.154629	2013-07-08 21:32:21.154629
100312	98	29	12	2013-07-08 21:32:21.155298	2013-07-08 21:32:21.155298
100313	98	30	12	2013-07-08 21:32:21.15605	2013-07-08 21:32:21.15605
100314	98	31	12	2013-07-08 21:32:21.157243	2013-07-08 21:32:21.157243
100315	98	35	12	2013-07-08 21:32:21.15924	2013-07-08 21:32:21.15924
100316	98	0	13	2013-07-08 21:32:21.159934	2013-07-08 21:32:21.159934
100317	98	11	13	2013-07-08 21:32:21.161466	2013-07-08 21:32:21.161466
100318	98	12	13	2013-07-08 21:32:21.162174	2013-07-08 21:32:21.162174
100319	98	13	13	2013-07-08 21:32:21.162905	2013-07-08 21:32:21.162905
100320	98	14	13	2013-07-08 21:32:21.163652	2013-07-08 21:32:21.163652
100321	98	15	13	2013-07-08 21:32:21.164448	2013-07-08 21:32:21.164448
100322	98	16	13	2013-07-08 21:32:21.165205	2013-07-08 21:32:21.165205
100323	98	17	13	2013-07-08 21:32:21.165955	2013-07-08 21:32:21.165955
100324	98	18	13	2013-07-08 21:32:21.166638	2013-07-08 21:32:21.166638
100325	98	19	13	2013-07-08 21:32:21.167292	2013-07-08 21:32:21.167292
100326	98	21	13	2013-07-08 21:32:21.170758	2013-07-08 21:32:21.170758
100327	98	22	13	2013-07-08 21:32:21.172039	2013-07-08 21:32:21.172039
100328	98	24	13	2013-07-08 21:32:21.172894	2013-07-08 21:32:21.172894
100329	98	25	13	2013-07-08 21:32:21.174192	2013-07-08 21:32:21.174192
100330	98	26	13	2013-07-08 21:32:21.175822	2013-07-08 21:32:21.175822
100331	98	27	13	2013-07-08 21:32:21.177555	2013-07-08 21:32:21.177555
100332	98	35	13	2013-07-08 21:32:21.180636	2013-07-08 21:32:21.180636
100333	98	0	14	2013-07-08 21:32:21.182104	2013-07-08 21:32:21.182104
100334	98	2	14	2013-07-08 21:32:21.183518	2013-07-08 21:32:21.183518
100335	98	3	14	2013-07-08 21:32:21.184882	2013-07-08 21:32:21.184882
100336	98	4	14	2013-07-08 21:32:21.186116	2013-07-08 21:32:21.186116
100337	98	5	14	2013-07-08 21:32:21.187193	2013-07-08 21:32:21.187193
100338	98	6	14	2013-07-08 21:32:21.188845	2013-07-08 21:32:21.188845
100339	98	7	14	2013-07-08 21:32:21.190416	2013-07-08 21:32:21.190416
100340	98	8	14	2013-07-08 21:32:21.192046	2013-07-08 21:32:21.192046
100341	98	9	14	2013-07-08 21:32:21.193887	2013-07-08 21:32:21.193887
100342	98	10	14	2013-07-08 21:32:21.195481	2013-07-08 21:32:21.195481
100343	98	11	14	2013-07-08 21:32:21.197033	2013-07-08 21:32:21.197033
100344	98	12	14	2013-07-08 21:32:21.198349	2013-07-08 21:32:21.198349
100345	98	13	14	2013-07-08 21:32:21.19984	2013-07-08 21:32:21.19984
100346	98	21	14	2013-07-08 21:32:21.20364	2013-07-08 21:32:21.20364
100347	98	22	14	2013-07-08 21:32:21.205443	2013-07-08 21:32:21.205443
100348	98	24	14	2013-07-08 21:32:21.20685	2013-07-08 21:32:21.20685
100349	98	25	14	2013-07-08 21:32:21.208251	2013-07-08 21:32:21.208251
100350	98	26	14	2013-07-08 21:32:21.209771	2013-07-08 21:32:21.209771
100351	98	27	14	2013-07-08 21:32:21.211119	2013-07-08 21:32:21.211119
100352	98	35	14	2013-07-08 21:32:21.213403	2013-07-08 21:32:21.213403
100353	98	0	15	2013-07-08 21:32:21.214869	2013-07-08 21:32:21.214869
100354	98	2	15	2013-07-08 21:32:21.21756	2013-07-08 21:32:21.21756
100355	98	3	15	2013-07-08 21:32:21.218743	2013-07-08 21:32:21.218743
100356	98	4	15	2013-07-08 21:32:21.219929	2013-07-08 21:32:21.219929
100357	98	5	15	2013-07-08 21:32:21.220989	2013-07-08 21:32:21.220989
100358	98	6	15	2013-07-08 21:32:21.221864	2013-07-08 21:32:21.221864
100359	98	7	15	2013-07-08 21:32:21.222841	2013-07-08 21:32:21.222841
100360	98	8	15	2013-07-08 21:32:21.223827	2013-07-08 21:32:21.223827
100361	98	9	15	2013-07-08 21:32:21.225162	2013-07-08 21:32:21.225162
100362	98	10	15	2013-07-08 21:32:21.226036	2013-07-08 21:32:21.226036
100363	98	11	15	2013-07-08 21:32:21.227014	2013-07-08 21:32:21.227014
100364	98	12	15	2013-07-08 21:32:21.227819	2013-07-08 21:32:21.227819
100365	98	13	15	2013-07-08 21:32:21.228515	2013-07-08 21:32:21.228515
100366	98	21	15	2013-07-08 21:32:21.231666	2013-07-08 21:32:21.231666
100367	98	22	15	2013-07-08 21:32:21.232963	2013-07-08 21:32:21.232963
100368	98	24	15	2013-07-08 21:32:21.233936	2013-07-08 21:32:21.233936
100369	98	25	15	2013-07-08 21:32:21.234793	2013-07-08 21:32:21.234793
100370	98	26	15	2013-07-08 21:32:21.235596	2013-07-08 21:32:21.235596
100371	98	27	15	2013-07-08 21:32:21.236286	2013-07-08 21:32:21.236286
100372	98	28	15	2013-07-08 21:32:21.236975	2013-07-08 21:32:21.236975
100373	98	29	15	2013-07-08 21:32:21.237706	2013-07-08 21:32:21.237706
100374	98	30	15	2013-07-08 21:32:21.238386	2013-07-08 21:32:21.238386
100375	98	31	15	2013-07-08 21:32:21.239145	2013-07-08 21:32:21.239145
100376	98	32	15	2013-07-08 21:32:21.239852	2013-07-08 21:32:21.239852
100377	98	33	15	2013-07-08 21:32:21.240564	2013-07-08 21:32:21.240564
100378	98	34	15	2013-07-08 21:32:21.241323	2013-07-08 21:32:21.241323
100379	98	35	15	2013-07-08 21:32:21.24215	2013-07-08 21:32:21.24215
100380	98	0	16	2013-07-08 21:32:21.243356	2013-07-08 21:32:21.243356
100381	98	2	16	2013-07-08 21:32:21.244683	2013-07-08 21:32:21.244683
100382	98	3	16	2013-07-08 21:32:21.246125	2013-07-08 21:32:21.246125
100383	98	4	16	2013-07-08 21:32:21.247581	2013-07-08 21:32:21.247581
100384	98	5	16	2013-07-08 21:32:21.248891	2013-07-08 21:32:21.248891
100385	98	16	16	2013-07-08 21:32:21.254174	2013-07-08 21:32:21.254174
100386	98	17	16	2013-07-08 21:32:21.255133	2013-07-08 21:32:21.255133
100387	98	18	16	2013-07-08 21:32:21.256384	2013-07-08 21:32:21.256384
100388	98	19	16	2013-07-08 21:32:21.257197	2013-07-08 21:32:21.257197
100389	98	20	16	2013-07-08 21:32:21.258189	2013-07-08 21:32:21.258189
100390	98	21	16	2013-07-08 21:32:21.258952	2013-07-08 21:32:21.258952
100391	98	22	16	2013-07-08 21:32:21.259768	2013-07-08 21:32:21.259768
100392	98	27	16	2013-07-08 21:32:21.262149	2013-07-08 21:32:21.262149
100393	98	28	16	2013-07-08 21:32:21.263212	2013-07-08 21:32:21.263212
100394	98	29	16	2013-07-08 21:32:21.264337	2013-07-08 21:32:21.264337
100395	98	30	16	2013-07-08 21:32:21.265184	2013-07-08 21:32:21.265184
100396	98	31	16	2013-07-08 21:32:21.265921	2013-07-08 21:32:21.265921
100397	98	32	16	2013-07-08 21:32:21.266955	2013-07-08 21:32:21.266955
100398	98	33	16	2013-07-08 21:32:21.267971	2013-07-08 21:32:21.267971
100399	98	34	16	2013-07-08 21:32:21.268785	2013-07-08 21:32:21.268785
100400	98	35	16	2013-07-08 21:32:21.269519	2013-07-08 21:32:21.269519
100401	98	0	17	2013-07-08 21:32:21.270496	2013-07-08 21:32:21.270496
100402	98	0	18	2013-07-08 21:32:21.275575	2013-07-08 21:32:21.275575
100403	98	0	19	2013-07-08 21:32:21.277465	2013-07-08 21:32:21.277465
100404	98	2	19	2013-07-08 21:32:21.279632	2013-07-08 21:32:21.279632
100405	98	0	20	2013-07-08 21:32:21.282098	2013-07-08 21:32:21.282098
100406	98	2	20	2013-07-08 21:32:21.283693	2013-07-08 21:32:21.283693
100407	98	0	21	2013-07-08 21:32:21.285442	2013-07-08 21:32:21.285442
100408	98	2	21	2013-07-08 21:32:21.287211	2013-07-08 21:32:21.287211
100409	92	3	0	2013-07-08 21:34:17.187215	2013-07-08 21:34:17.187215
100410	92	4	0	2013-07-08 21:34:17.188184	2013-07-08 21:34:17.188184
100411	92	3	1	2013-07-08 21:34:17.191426	2013-07-08 21:34:17.191426
100412	92	4	1	2013-07-08 21:34:17.192149	2013-07-08 21:34:17.192149
100413	92	3	2	2013-07-08 21:34:17.193799	2013-07-08 21:34:17.193799
100414	92	4	2	2013-07-08 21:34:17.19456	2013-07-08 21:34:17.19456
100415	92	3	3	2013-07-08 21:34:17.195278	2013-07-08 21:34:17.195278
100416	92	4	3	2013-07-08 21:34:17.195976	2013-07-08 21:34:17.195976
100417	92	5	3	2013-07-08 21:34:17.196636	2013-07-08 21:34:17.196636
100418	92	6	3	2013-07-08 21:34:17.197322	2013-07-08 21:34:17.197322
100419	92	7	3	2013-07-08 21:34:17.197987	2013-07-08 21:34:17.197987
100420	92	8	3	2013-07-08 21:34:17.198701	2013-07-08 21:34:17.198701
100421	92	9	3	2013-07-08 21:34:17.199395	2013-07-08 21:34:17.199395
100422	92	10	3	2013-07-08 21:34:17.200047	2013-07-08 21:34:17.200047
100423	92	11	3	2013-07-08 21:34:17.200834	2013-07-08 21:34:17.200834
100424	92	12	3	2013-07-08 21:34:17.201576	2013-07-08 21:34:17.201576
100425	92	13	3	2013-07-08 21:34:17.202284	2013-07-08 21:34:17.202284
100426	92	14	3	2013-07-08 21:34:17.203003	2013-07-08 21:34:17.203003
100427	92	15	3	2013-07-08 21:34:17.20373	2013-07-08 21:34:17.20373
100428	92	16	3	2013-07-08 21:34:17.204395	2013-07-08 21:34:17.204395
100429	92	17	3	2013-07-08 21:34:17.205064	2013-07-08 21:34:17.205064
100430	92	18	3	2013-07-08 21:34:17.205717	2013-07-08 21:34:17.205717
100431	92	19	3	2013-07-08 21:34:17.206376	2013-07-08 21:34:17.206376
100432	92	20	3	2013-07-08 21:34:17.207053	2013-07-08 21:34:17.207053
100433	92	24	3	2013-07-08 21:34:17.207774	2013-07-08 21:34:17.207774
100434	92	25	3	2013-07-08 21:34:17.208445	2013-07-08 21:34:17.208445
100435	92	26	3	2013-07-08 21:34:17.209115	2013-07-08 21:34:17.209115
100436	92	27	3	2013-07-08 21:34:17.209782	2013-07-08 21:34:17.209782
100437	92	28	3	2013-07-08 21:34:17.210466	2013-07-08 21:34:17.210466
100438	92	29	3	2013-07-08 21:34:17.211128	2013-07-08 21:34:17.211128
100439	92	30	3	2013-07-08 21:34:17.211868	2013-07-08 21:34:17.211868
100440	92	31	3	2013-07-08 21:34:17.212644	2013-07-08 21:34:17.212644
100441	92	32	3	2013-07-08 21:34:17.213317	2013-07-08 21:34:17.213317
100442	92	33	3	2013-07-08 21:34:17.214089	2013-07-08 21:34:17.214089
100443	92	34	3	2013-07-08 21:34:17.214862	2013-07-08 21:34:17.214862
100444	92	35	3	2013-07-08 21:34:17.215623	2013-07-08 21:34:17.215623
100445	92	3	4	2013-07-08 21:34:17.216306	2013-07-08 21:34:17.216306
100446	92	4	4	2013-07-08 21:34:17.217014	2013-07-08 21:34:17.217014
100447	92	16	4	2013-07-08 21:34:17.217727	2013-07-08 21:34:17.217727
100448	92	17	4	2013-07-08 21:34:17.218394	2013-07-08 21:34:17.218394
100449	92	18	4	2013-07-08 21:34:17.219046	2013-07-08 21:34:17.219046
100450	92	19	4	2013-07-08 21:34:17.21976	2013-07-08 21:34:17.21976
100451	92	20	4	2013-07-08 21:34:17.220425	2013-07-08 21:34:17.220425
100452	92	24	4	2013-07-08 21:34:17.222994	2013-07-08 21:34:17.222994
100453	92	25	4	2013-07-08 21:34:17.223685	2013-07-08 21:34:17.223685
100454	92	3	5	2013-07-08 21:34:17.224369	2013-07-08 21:34:17.224369
100455	92	4	5	2013-07-08 21:34:17.225021	2013-07-08 21:34:17.225021
100456	92	16	5	2013-07-08 21:34:17.225722	2013-07-08 21:34:17.225722
100457	92	17	5	2013-07-08 21:34:17.226389	2013-07-08 21:34:17.226389
100458	92	18	5	2013-07-08 21:34:17.227043	2013-07-08 21:34:17.227043
100459	92	19	5	2013-07-08 21:34:17.227748	2013-07-08 21:34:17.227748
100460	92	20	5	2013-07-08 21:34:17.228403	2013-07-08 21:34:17.228403
100461	92	24	5	2013-07-08 21:34:17.229116	2013-07-08 21:34:17.229116
100462	92	25	5	2013-07-08 21:34:17.229778	2013-07-08 21:34:17.229778
100463	92	3	6	2013-07-08 21:34:17.23053	2013-07-08 21:34:17.23053
100464	92	4	6	2013-07-08 21:34:17.231239	2013-07-08 21:34:17.231239
100465	92	5	6	2013-07-08 21:34:17.231915	2013-07-08 21:34:17.231915
100466	92	6	6	2013-07-08 21:34:17.232605	2013-07-08 21:34:17.232605
100467	92	7	6	2013-07-08 21:34:17.233334	2013-07-08 21:34:17.233334
100468	92	8	6	2013-07-08 21:34:17.233997	2013-07-08 21:34:17.233997
100469	92	9	6	2013-07-08 21:34:17.234789	2013-07-08 21:34:17.234789
100470	92	10	6	2013-07-08 21:34:17.235489	2013-07-08 21:34:17.235489
100471	92	11	6	2013-07-08 21:34:17.236132	2013-07-08 21:34:17.236132
100472	92	12	6	2013-07-08 21:34:17.236787	2013-07-08 21:34:17.236787
100473	92	18	6	2013-07-08 21:34:17.237437	2013-07-08 21:34:17.237437
100474	92	19	6	2013-07-08 21:34:17.238109	2013-07-08 21:34:17.238109
100475	92	20	6	2013-07-08 21:34:17.239034	2013-07-08 21:34:17.239034
100476	92	24	6	2013-07-08 21:34:17.239818	2013-07-08 21:34:17.239818
100477	92	25	6	2013-07-08 21:34:17.240523	2013-07-08 21:34:17.240523
100478	92	10	7	2013-07-08 21:34:17.242469	2013-07-08 21:34:17.242469
100479	92	11	7	2013-07-08 21:34:17.243439	2013-07-08 21:34:17.243439
100480	92	12	7	2013-07-08 21:34:17.24427	2013-07-08 21:34:17.24427
100481	92	13	7	2013-07-08 21:34:17.245088	2013-07-08 21:34:17.245088
100482	92	14	7	2013-07-08 21:34:17.245821	2013-07-08 21:34:17.245821
100483	92	18	7	2013-07-08 21:34:17.24657	2013-07-08 21:34:17.24657
100484	92	19	7	2013-07-08 21:34:17.247326	2013-07-08 21:34:17.247326
100485	92	20	7	2013-07-08 21:34:17.248021	2013-07-08 21:34:17.248021
100486	92	22	7	2013-07-08 21:34:17.248719	2013-07-08 21:34:17.248719
100487	92	23	7	2013-07-08 21:34:17.249406	2013-07-08 21:34:17.249406
100488	92	24	7	2013-07-08 21:34:17.250127	2013-07-08 21:34:17.250127
100489	92	25	7	2013-07-08 21:34:17.250873	2013-07-08 21:34:17.250873
100490	92	33	7	2013-07-08 21:34:17.251576	2013-07-08 21:34:17.251576
100491	92	34	7	2013-07-08 21:34:17.252252	2013-07-08 21:34:17.252252
100492	92	13	8	2013-07-08 21:34:17.254013	2013-07-08 21:34:17.254013
100493	92	14	8	2013-07-08 21:34:17.254966	2013-07-08 21:34:17.254966
100494	92	18	8	2013-07-08 21:34:17.255745	2013-07-08 21:34:17.255745
100495	92	19	8	2013-07-08 21:34:17.256411	2013-07-08 21:34:17.256411
100496	92	20	8	2013-07-08 21:34:17.257054	2013-07-08 21:34:17.257054
100497	92	22	8	2013-07-08 21:34:17.257751	2013-07-08 21:34:17.257751
100498	92	23	8	2013-07-08 21:34:17.258417	2013-07-08 21:34:17.258417
100499	92	24	8	2013-07-08 21:34:17.259144	2013-07-08 21:34:17.259144
100500	92	33	8	2013-07-08 21:34:17.260056	2013-07-08 21:34:17.260056
100501	92	34	8	2013-07-08 21:34:17.260873	2013-07-08 21:34:17.260873
100502	92	1	9	2013-07-08 21:34:17.261553	2013-07-08 21:34:17.261553
100503	92	2	9	2013-07-08 21:34:17.262254	2013-07-08 21:34:17.262254
100504	92	13	9	2013-07-08 21:34:17.262971	2013-07-08 21:34:17.262971
100505	92	14	9	2013-07-08 21:34:17.263794	2013-07-08 21:34:17.263794
100506	92	18	9	2013-07-08 21:34:17.264737	2013-07-08 21:34:17.264737
100507	92	19	9	2013-07-08 21:34:17.265634	2013-07-08 21:34:17.265634
100508	92	20	9	2013-07-08 21:34:17.266351	2013-07-08 21:34:17.266351
100509	92	22	9	2013-07-08 21:34:17.267274	2013-07-08 21:34:17.267274
100510	92	23	9	2013-07-08 21:34:17.268129	2013-07-08 21:34:17.268129
100511	92	24	9	2013-07-08 21:34:17.268799	2013-07-08 21:34:17.268799
100512	92	33	9	2013-07-08 21:34:17.270427	2013-07-08 21:34:17.270427
100513	92	34	9	2013-07-08 21:34:17.271174	2013-07-08 21:34:17.271174
100514	92	1	10	2013-07-08 21:34:17.273486	2013-07-08 21:34:17.273486
100515	92	2	10	2013-07-08 21:34:17.274192	2013-07-08 21:34:17.274192
100516	92	13	10	2013-07-08 21:34:17.276609	2013-07-08 21:34:17.276609
100517	92	14	10	2013-07-08 21:34:17.277505	2013-07-08 21:34:17.277505
100518	92	23	10	2013-07-08 21:34:17.278396	2013-07-08 21:34:17.278396
100519	92	24	10	2013-07-08 21:34:17.279218	2013-07-08 21:34:17.279218
100520	92	33	10	2013-07-08 21:34:17.281344	2013-07-08 21:34:17.281344
100521	92	34	10	2013-07-08 21:34:17.282062	2013-07-08 21:34:17.282062
100522	92	1	11	2013-07-08 21:34:17.28276	2013-07-08 21:34:17.28276
100523	92	2	11	2013-07-08 21:34:17.283555	2013-07-08 21:34:17.283555
100524	92	3	11	2013-07-08 21:34:17.28429	2013-07-08 21:34:17.28429
100525	92	4	11	2013-07-08 21:34:17.285002	2013-07-08 21:34:17.285002
100526	92	5	11	2013-07-08 21:34:17.285693	2013-07-08 21:34:17.285693
100527	92	6	11	2013-07-08 21:34:17.286443	2013-07-08 21:34:17.286443
100528	92	7	11	2013-07-08 21:34:17.287164	2013-07-08 21:34:17.287164
100529	92	8	11	2013-07-08 21:34:17.287807	2013-07-08 21:34:17.287807
100530	92	13	11	2013-07-08 21:34:17.288479	2013-07-08 21:34:17.288479
100531	92	14	11	2013-07-08 21:34:17.28918	2013-07-08 21:34:17.28918
100532	92	23	11	2013-07-08 21:34:17.289842	2013-07-08 21:34:17.289842
100533	92	24	11	2013-07-08 21:34:17.290557	2013-07-08 21:34:17.290557
100534	92	27	11	2013-07-08 21:34:17.291227	2013-07-08 21:34:17.291227
100535	92	28	11	2013-07-08 21:34:17.291867	2013-07-08 21:34:17.291867
100536	92	29	11	2013-07-08 21:34:17.292522	2013-07-08 21:34:17.292522
100537	92	30	11	2013-07-08 21:34:17.293228	2013-07-08 21:34:17.293228
100538	92	31	11	2013-07-08 21:34:17.29389	2013-07-08 21:34:17.29389
100539	92	32	11	2013-07-08 21:34:17.294649	2013-07-08 21:34:17.294649
100540	92	33	11	2013-07-08 21:34:17.295378	2013-07-08 21:34:17.295378
100541	92	34	11	2013-07-08 21:34:17.296084	2013-07-08 21:34:17.296084
100542	92	7	12	2013-07-08 21:34:17.298671	2013-07-08 21:34:17.298671
100543	92	8	12	2013-07-08 21:34:17.299374	2013-07-08 21:34:17.299374
100544	92	13	12	2013-07-08 21:34:17.300872	2013-07-08 21:34:17.300872
100545	92	14	12	2013-07-08 21:34:17.301573	2013-07-08 21:34:17.301573
100546	92	15	12	2013-07-08 21:34:17.302269	2013-07-08 21:34:17.302269
100547	92	16	12	2013-07-08 21:34:17.303016	2013-07-08 21:34:17.303016
100548	92	17	12	2013-07-08 21:34:17.303715	2013-07-08 21:34:17.303715
100549	92	21	12	2013-07-08 21:34:17.304664	2013-07-08 21:34:17.304664
100550	92	22	12	2013-07-08 21:34:17.305551	2013-07-08 21:34:17.305551
100551	92	23	12	2013-07-08 21:34:17.306299	2013-07-08 21:34:17.306299
100552	92	24	12	2013-07-08 21:34:17.306953	2013-07-08 21:34:17.306953
100553	92	27	12	2013-07-08 21:34:17.307599	2013-07-08 21:34:17.307599
100554	92	28	12	2013-07-08 21:34:17.308254	2013-07-08 21:34:17.308254
100555	92	7	13	2013-07-08 21:34:17.310648	2013-07-08 21:34:17.310648
100556	92	8	13	2013-07-08 21:34:17.311385	2013-07-08 21:34:17.311385
100557	92	27	13	2013-07-08 21:34:17.314134	2013-07-08 21:34:17.314134
100558	92	28	13	2013-07-08 21:34:17.315028	2013-07-08 21:34:17.315028
100559	92	7	14	2013-07-08 21:34:17.315812	2013-07-08 21:34:17.315812
100560	92	8	14	2013-07-08 21:34:17.316486	2013-07-08 21:34:17.316486
100561	92	9	14	2013-07-08 21:34:17.317148	2013-07-08 21:34:17.317148
100562	92	10	14	2013-07-08 21:34:17.317814	2013-07-08 21:34:17.317814
100563	92	11	14	2013-07-08 21:34:17.318662	2013-07-08 21:34:17.318662
100564	92	12	14	2013-07-08 21:34:17.319412	2013-07-08 21:34:17.319412
100565	92	13	14	2013-07-08 21:34:17.320379	2013-07-08 21:34:17.320379
100566	92	14	14	2013-07-08 21:34:17.321134	2013-07-08 21:34:17.321134
100567	92	15	14	2013-07-08 21:34:17.321824	2013-07-08 21:34:17.321824
100568	92	16	14	2013-07-08 21:34:17.32247	2013-07-08 21:34:17.32247
100569	92	27	14	2013-07-08 21:34:17.324061	2013-07-08 21:34:17.324061
100570	92	28	14	2013-07-08 21:34:17.324726	2013-07-08 21:34:17.324726
100571	92	14	15	2013-07-08 21:34:17.325456	2013-07-08 21:34:17.325456
100572	92	15	15	2013-07-08 21:34:17.326348	2013-07-08 21:34:17.326348
100573	92	16	15	2013-07-08 21:34:17.327191	2013-07-08 21:34:17.327191
100574	92	27	15	2013-07-08 21:34:17.328661	2013-07-08 21:34:17.328661
100575	92	28	15	2013-07-08 21:34:17.329522	2013-07-08 21:34:17.329522
100576	92	14	16	2013-07-08 21:34:17.330553	2013-07-08 21:34:17.330553
100577	92	15	16	2013-07-08 21:34:17.331322	2013-07-08 21:34:17.331322
100578	92	16	16	2013-07-08 21:34:17.331994	2013-07-08 21:34:17.331994
100579	92	17	16	2013-07-08 21:34:17.332786	2013-07-08 21:34:17.332786
100580	92	18	16	2013-07-08 21:34:17.333698	2013-07-08 21:34:17.333698
100581	92	19	16	2013-07-08 21:34:17.334608	2013-07-08 21:34:17.334608
100582	92	20	16	2013-07-08 21:34:17.335531	2013-07-08 21:34:17.335531
100583	92	21	16	2013-07-08 21:34:17.336428	2013-07-08 21:34:17.336428
100584	92	22	16	2013-07-08 21:34:17.337245	2013-07-08 21:34:17.337245
100585	92	23	16	2013-07-08 21:34:17.33792	2013-07-08 21:34:17.33792
100586	92	24	16	2013-07-08 21:34:17.338664	2013-07-08 21:34:17.338664
100587	92	25	16	2013-07-08 21:34:17.339378	2013-07-08 21:34:17.339378
100588	92	26	16	2013-07-08 21:34:17.340103	2013-07-08 21:34:17.340103
100589	92	27	16	2013-07-08 21:34:17.340809	2013-07-08 21:34:17.340809
100590	92	28	16	2013-07-08 21:34:17.341686	2013-07-08 21:34:17.341686
100591	92	14	17	2013-07-08 21:34:17.343046	2013-07-08 21:34:17.343046
100592	92	15	17	2013-07-08 21:34:17.344016	2013-07-08 21:34:17.344016
100593	92	16	17	2013-07-08 21:34:17.344828	2013-07-08 21:34:17.344828
100594	92	17	17	2013-07-08 21:34:17.345557	2013-07-08 21:34:17.345557
100595	92	18	17	2013-07-08 21:34:17.346792	2013-07-08 21:34:17.346792
100596	92	16	18	2013-07-08 21:34:17.350637	2013-07-08 21:34:17.350637
100597	92	17	18	2013-07-08 21:34:17.351585	2013-07-08 21:34:17.351585
100598	92	18	18	2013-07-08 21:34:17.352551	2013-07-08 21:34:17.352551
100599	92	16	19	2013-07-08 21:34:17.355107	2013-07-08 21:34:17.355107
100600	92	17	19	2013-07-08 21:34:17.355827	2013-07-08 21:34:17.355827
100601	92	18	19	2013-07-08 21:34:17.356708	2013-07-08 21:34:17.356708
100602	92	16	20	2013-07-08 21:34:17.357559	2013-07-08 21:34:17.357559
100603	92	17	20	2013-07-08 21:34:17.358295	2013-07-08 21:34:17.358295
100604	92	18	20	2013-07-08 21:34:17.359026	2013-07-08 21:34:17.359026
100605	92	19	20	2013-07-08 21:34:17.359797	2013-07-08 21:34:17.359797
100606	92	20	20	2013-07-08 21:34:17.360552	2013-07-08 21:34:17.360552
100607	92	16	21	2013-07-08 21:34:17.363836	2013-07-08 21:34:17.363836
100608	92	17	21	2013-07-08 21:34:17.394622	2013-07-08 21:34:17.394622
100609	92	18	21	2013-07-08 21:34:17.395694	2013-07-08 21:34:17.395694
100610	92	19	21	2013-07-08 21:34:17.396958	2013-07-08 21:34:17.396958
100611	92	20	21	2013-07-08 21:34:17.397998	2013-07-08 21:34:17.397998
100612	93	14	1	2013-07-08 21:37:58.015844	2013-07-08 21:37:58.015844
100613	93	14	2	2013-07-08 21:37:58.01665	2013-07-08 21:37:58.01665
100614	93	3	3	2013-07-08 21:37:58.017432	2013-07-08 21:37:58.017432
100615	93	7	3	2013-07-08 21:37:58.018131	2013-07-08 21:37:58.018131
100616	93	8	3	2013-07-08 21:37:58.018829	2013-07-08 21:37:58.018829
100617	93	9	3	2013-07-08 21:37:58.019498	2013-07-08 21:37:58.019498
100618	93	10	3	2013-07-08 21:37:58.020286	2013-07-08 21:37:58.020286
100619	93	11	3	2013-07-08 21:37:58.020987	2013-07-08 21:37:58.020987
100620	93	12	3	2013-07-08 21:37:58.021712	2013-07-08 21:37:58.021712
100621	93	13	3	2013-07-08 21:37:58.022388	2013-07-08 21:37:58.022388
100622	93	14	3	2013-07-08 21:37:58.023056	2013-07-08 21:37:58.023056
100623	93	15	3	2013-07-08 21:37:58.023754	2013-07-08 21:37:58.023754
100624	93	16	3	2013-07-08 21:37:58.024548	2013-07-08 21:37:58.024548
100625	93	2	4	2013-07-08 21:37:58.027092	2013-07-08 21:37:58.027092
100626	93	3	4	2013-07-08 21:37:58.027785	2013-07-08 21:37:58.027785
100627	93	4	4	2013-07-08 21:37:58.028594	2013-07-08 21:37:58.028594
100628	93	5	4	2013-07-08 21:37:58.029296	2013-07-08 21:37:58.029296
100629	93	6	4	2013-07-08 21:37:58.03001	2013-07-08 21:37:58.03001
100630	93	7	4	2013-07-08 21:37:58.030735	2013-07-08 21:37:58.030735
100631	93	14	4	2013-07-08 21:37:58.031489	2013-07-08 21:37:58.031489
100632	93	25	4	2013-07-08 21:37:58.03219	2013-07-08 21:37:58.03219
100633	93	26	4	2013-07-08 21:37:58.03288	2013-07-08 21:37:58.03288
100634	93	27	4	2013-07-08 21:37:58.033563	2013-07-08 21:37:58.033563
100635	93	28	4	2013-07-08 21:37:58.03422	2013-07-08 21:37:58.03422
100636	93	3	5	2013-07-08 21:37:58.034935	2013-07-08 21:37:58.034935
100637	93	7	5	2013-07-08 21:37:58.035578	2013-07-08 21:37:58.035578
100638	93	8	5	2013-07-08 21:37:58.036357	2013-07-08 21:37:58.036357
100639	93	13	5	2013-07-08 21:37:58.03734	2013-07-08 21:37:58.03734
100640	93	14	5	2013-07-08 21:37:58.038109	2013-07-08 21:37:58.038109
100641	93	25	5	2013-07-08 21:37:58.038901	2013-07-08 21:37:58.038901
100642	93	26	5	2013-07-08 21:37:58.039637	2013-07-08 21:37:58.039637
100643	93	27	5	2013-07-08 21:37:58.040368	2013-07-08 21:37:58.040368
100644	93	28	5	2013-07-08 21:37:58.041183	2013-07-08 21:37:58.041183
100645	93	7	6	2013-07-08 21:37:58.041948	2013-07-08 21:37:58.041948
100646	93	25	6	2013-07-08 21:37:58.042651	2013-07-08 21:37:58.042651
100647	93	26	6	2013-07-08 21:37:58.043319	2013-07-08 21:37:58.043319
100648	93	27	6	2013-07-08 21:37:58.044068	2013-07-08 21:37:58.044068
100649	93	28	6	2013-07-08 21:37:58.044734	2013-07-08 21:37:58.044734
100650	93	5	7	2013-07-08 21:37:58.045422	2013-07-08 21:37:58.045422
100651	93	6	7	2013-07-08 21:37:58.046089	2013-07-08 21:37:58.046089
100652	93	7	7	2013-07-08 21:37:58.046738	2013-07-08 21:37:58.046738
100653	93	25	7	2013-07-08 21:37:58.047431	2013-07-08 21:37:58.047431
100654	93	26	7	2013-07-08 21:37:58.048142	2013-07-08 21:37:58.048142
100655	93	27	7	2013-07-08 21:37:58.048933	2013-07-08 21:37:58.048933
100656	93	28	7	2013-07-08 21:37:58.049596	2013-07-08 21:37:58.049596
100657	93	5	8	2013-07-08 21:37:58.050294	2013-07-08 21:37:58.050294
100658	93	25	8	2013-07-08 21:37:58.051873	2013-07-08 21:37:58.051873
100659	93	26	8	2013-07-08 21:37:58.052702	2013-07-08 21:37:58.052702
100660	93	27	8	2013-07-08 21:37:58.053401	2013-07-08 21:37:58.053401
100661	93	28	8	2013-07-08 21:37:58.054044	2013-07-08 21:37:58.054044
100662	93	0	9	2013-07-08 21:37:58.055566	2013-07-08 21:37:58.055566
100663	93	1	9	2013-07-08 21:37:58.056221	2013-07-08 21:37:58.056221
100664	93	2	9	2013-07-08 21:37:58.05693	2013-07-08 21:37:58.05693
100665	93	3	9	2013-07-08 21:37:58.057595	2013-07-08 21:37:58.057595
100666	93	4	9	2013-07-08 21:37:58.058235	2013-07-08 21:37:58.058235
100667	93	5	9	2013-07-08 21:37:58.058907	2013-07-08 21:37:58.058907
100668	93	25	9	2013-07-08 21:37:58.061349	2013-07-08 21:37:58.061349
100669	93	26	9	2013-07-08 21:37:58.062036	2013-07-08 21:37:58.062036
100670	93	27	9	2013-07-08 21:37:58.062686	2013-07-08 21:37:58.062686
100671	93	28	9	2013-07-08 21:37:58.063368	2013-07-08 21:37:58.063368
100672	93	3	10	2013-07-08 21:37:58.064046	2013-07-08 21:37:58.064046
100673	93	25	10	2013-07-08 21:37:58.064792	2013-07-08 21:37:58.064792
100674	93	26	10	2013-07-08 21:37:58.065506	2013-07-08 21:37:58.065506
100675	93	27	10	2013-07-08 21:37:58.066188	2013-07-08 21:37:58.066188
100676	93	28	10	2013-07-08 21:37:58.066931	2013-07-08 21:37:58.066931
100677	93	29	10	2013-07-08 21:37:58.068215	2013-07-08 21:37:58.068215
100678	93	30	10	2013-07-08 21:37:58.069397	2013-07-08 21:37:58.069397
100679	93	31	10	2013-07-08 21:37:58.070339	2013-07-08 21:37:58.070339
100680	93	32	10	2013-07-08 21:37:58.07147	2013-07-08 21:37:58.07147
100681	93	33	10	2013-07-08 21:37:58.072257	2013-07-08 21:37:58.072257
100682	93	34	10	2013-07-08 21:37:58.072912	2013-07-08 21:37:58.072912
100683	93	35	10	2013-07-08 21:37:58.073589	2013-07-08 21:37:58.073589
100684	93	3	11	2013-07-08 21:37:58.07426	2013-07-08 21:37:58.07426
100685	93	4	11	2013-07-08 21:37:58.074911	2013-07-08 21:37:58.074911
100686	93	25	11	2013-07-08 21:37:58.075664	2013-07-08 21:37:58.075664
100687	93	26	11	2013-07-08 21:37:58.076497	2013-07-08 21:37:58.076497
100688	93	27	11	2013-07-08 21:37:58.077513	2013-07-08 21:37:58.077513
100689	93	28	11	2013-07-08 21:37:58.078599	2013-07-08 21:37:58.078599
100690	93	29	11	2013-07-08 21:37:58.079374	2013-07-08 21:37:58.079374
100691	93	30	11	2013-07-08 21:37:58.080042	2013-07-08 21:37:58.080042
100692	93	31	11	2013-07-08 21:37:58.080748	2013-07-08 21:37:58.080748
100693	93	32	11	2013-07-08 21:37:58.081508	2013-07-08 21:37:58.081508
100694	93	33	11	2013-07-08 21:37:58.082174	2013-07-08 21:37:58.082174
100695	93	34	11	2013-07-08 21:37:58.082814	2013-07-08 21:37:58.082814
100696	93	35	11	2013-07-08 21:37:58.083482	2013-07-08 21:37:58.083482
100697	93	31	12	2013-07-08 21:37:58.084657	2013-07-08 21:37:58.084657
100698	93	32	12	2013-07-08 21:37:58.085595	2013-07-08 21:37:58.085595
100699	93	33	12	2013-07-08 21:37:58.086893	2013-07-08 21:37:58.086893
100700	93	34	12	2013-07-08 21:37:58.088012	2013-07-08 21:37:58.088012
100701	93	35	12	2013-07-08 21:37:58.088734	2013-07-08 21:37:58.088734
100702	93	31	13	2013-07-08 21:37:58.089517	2013-07-08 21:37:58.089517
100703	93	32	13	2013-07-08 21:37:58.090198	2013-07-08 21:37:58.090198
100704	93	33	13	2013-07-08 21:37:58.091058	2013-07-08 21:37:58.091058
100705	93	34	13	2013-07-08 21:37:58.092077	2013-07-08 21:37:58.092077
100706	93	35	13	2013-07-08 21:37:58.092948	2013-07-08 21:37:58.092948
100707	93	3	14	2013-07-08 21:37:58.093691	2013-07-08 21:37:58.093691
100708	93	12	14	2013-07-08 21:37:58.094395	2013-07-08 21:37:58.094395
100709	93	13	14	2013-07-08 21:37:58.095042	2013-07-08 21:37:58.095042
100710	93	14	14	2013-07-08 21:37:58.095736	2013-07-08 21:37:58.095736
100711	93	15	14	2013-07-08 21:37:58.096423	2013-07-08 21:37:58.096423
100712	93	16	14	2013-07-08 21:37:58.097087	2013-07-08 21:37:58.097087
100713	93	31	14	2013-07-08 21:37:58.098	2013-07-08 21:37:58.098
100714	93	32	14	2013-07-08 21:37:58.0987	2013-07-08 21:37:58.0987
100715	93	33	14	2013-07-08 21:37:58.099346	2013-07-08 21:37:58.099346
100716	93	34	14	2013-07-08 21:37:58.10013	2013-07-08 21:37:58.10013
100717	93	35	14	2013-07-08 21:37:58.101078	2013-07-08 21:37:58.101078
100718	93	2	15	2013-07-08 21:37:58.101937	2013-07-08 21:37:58.101937
100719	93	3	15	2013-07-08 21:37:58.102772	2013-07-08 21:37:58.102772
100720	93	4	15	2013-07-08 21:37:58.103642	2013-07-08 21:37:58.103642
100721	93	8	15	2013-07-08 21:37:58.104696	2013-07-08 21:37:58.104696
100722	93	9	15	2013-07-08 21:37:58.105386	2013-07-08 21:37:58.105386
100723	93	10	15	2013-07-08 21:37:58.106128	2013-07-08 21:37:58.106128
100724	93	11	15	2013-07-08 21:37:58.106821	2013-07-08 21:37:58.106821
100725	93	12	15	2013-07-08 21:37:58.107585	2013-07-08 21:37:58.107585
100726	93	31	15	2013-07-08 21:37:58.110231	2013-07-08 21:37:58.110231
100727	93	32	15	2013-07-08 21:37:58.111011	2013-07-08 21:37:58.111011
100728	93	33	15	2013-07-08 21:37:58.111713	2013-07-08 21:37:58.111713
100729	93	34	15	2013-07-08 21:37:58.112357	2013-07-08 21:37:58.112357
100730	93	35	15	2013-07-08 21:37:58.113151	2013-07-08 21:37:58.113151
100731	93	0	16	2013-07-08 21:37:58.113834	2013-07-08 21:37:58.113834
100732	93	1	16	2013-07-08 21:37:58.114496	2013-07-08 21:37:58.114496
100733	93	2	16	2013-07-08 21:37:58.115241	2013-07-08 21:37:58.115241
100734	93	3	16	2013-07-08 21:37:58.116037	2013-07-08 21:37:58.116037
100735	93	4	16	2013-07-08 21:37:58.116867	2013-07-08 21:37:58.116867
100736	93	5	16	2013-07-08 21:37:58.117689	2013-07-08 21:37:58.117689
100737	93	6	16	2013-07-08 21:37:58.118543	2013-07-08 21:37:58.118543
100738	93	7	16	2013-07-08 21:37:58.119472	2013-07-08 21:37:58.119472
100739	93	8	16	2013-07-08 21:37:58.120506	2013-07-08 21:37:58.120506
100740	93	9	16	2013-07-08 21:37:58.121751	2013-07-08 21:37:58.121751
100741	93	10	16	2013-07-08 21:37:58.122772	2013-07-08 21:37:58.122772
100742	93	31	16	2013-07-08 21:37:58.12356	2013-07-08 21:37:58.12356
100743	93	32	16	2013-07-08 21:37:58.12462	2013-07-08 21:37:58.12462
100744	93	33	16	2013-07-08 21:37:58.125414	2013-07-08 21:37:58.125414
100745	93	34	16	2013-07-08 21:37:58.126106	2013-07-08 21:37:58.126106
100746	93	35	16	2013-07-08 21:37:58.126792	2013-07-08 21:37:58.126792
100747	93	3	17	2013-07-08 21:37:58.127634	2013-07-08 21:37:58.127634
100748	93	9	17	2013-07-08 21:37:58.128404	2013-07-08 21:37:58.128404
100749	93	10	17	2013-07-08 21:37:58.129087	2013-07-08 21:37:58.129087
100750	93	11	17	2013-07-08 21:37:58.129817	2013-07-08 21:37:58.129817
100751	93	31	17	2013-07-08 21:37:58.130551	2013-07-08 21:37:58.130551
100752	93	32	17	2013-07-08 21:37:58.131219	2013-07-08 21:37:58.131219
100753	93	33	17	2013-07-08 21:37:58.132048	2013-07-08 21:37:58.132048
100754	93	34	17	2013-07-08 21:37:58.13283	2013-07-08 21:37:58.13283
100755	93	35	17	2013-07-08 21:37:58.133531	2013-07-08 21:37:58.133531
100756	93	0	18	2013-07-08 21:37:58.13435	2013-07-08 21:37:58.13435
100757	93	1	18	2013-07-08 21:37:58.135018	2013-07-08 21:37:58.135018
100758	93	7	18	2013-07-08 21:37:58.135781	2013-07-08 21:37:58.135781
100759	93	8	18	2013-07-08 21:37:58.13677	2013-07-08 21:37:58.13677
100760	93	9	18	2013-07-08 21:37:58.137589	2013-07-08 21:37:58.137589
100761	93	10	18	2013-07-08 21:37:58.138342	2013-07-08 21:37:58.138342
100762	93	31	18	2013-07-08 21:37:58.139099	2013-07-08 21:37:58.139099
100763	93	32	18	2013-07-08 21:37:58.139775	2013-07-08 21:37:58.139775
100764	93	33	18	2013-07-08 21:37:58.14064	2013-07-08 21:37:58.14064
100765	93	34	18	2013-07-08 21:37:58.141419	2013-07-08 21:37:58.141419
100766	93	35	18	2013-07-08 21:37:58.142186	2013-07-08 21:37:58.142186
100767	93	0	19	2013-07-08 21:37:58.142923	2013-07-08 21:37:58.142923
100768	93	8	19	2013-07-08 21:37:58.144918	2013-07-08 21:37:58.144918
100769	93	9	19	2013-07-08 21:37:58.145813	2013-07-08 21:37:58.145813
100770	93	10	19	2013-07-08 21:37:58.146473	2013-07-08 21:37:58.146473
100771	93	11	19	2013-07-08 21:37:58.147143	2013-07-08 21:37:58.147143
100772	93	12	19	2013-07-08 21:37:58.147883	2013-07-08 21:37:58.147883
100773	93	0	20	2013-07-08 21:37:58.148708	2013-07-08 21:37:58.148708
100774	93	5	20	2013-07-08 21:37:58.149387	2013-07-08 21:37:58.149387
100775	93	9	20	2013-07-08 21:37:58.150045	2013-07-08 21:37:58.150045
100776	93	10	20	2013-07-08 21:37:58.150718	2013-07-08 21:37:58.150718
100777	93	2	21	2013-07-08 21:37:58.151425	2013-07-08 21:37:58.151425
100778	93	5	21	2013-07-08 21:37:58.152155	2013-07-08 21:37:58.152155
100779	100	5	0	2013-07-08 21:40:47.241564	2013-07-08 21:40:47.241564
100780	100	6	0	2013-07-08 21:40:47.242693	2013-07-08 21:40:47.242693
100781	100	7	0	2013-07-08 21:40:47.243423	2013-07-08 21:40:47.243423
100782	100	8	0	2013-07-08 21:40:47.244083	2013-07-08 21:40:47.244083
100783	100	9	0	2013-07-08 21:40:47.244782	2013-07-08 21:40:47.244782
100784	100	10	0	2013-07-08 21:40:47.245487	2013-07-08 21:40:47.245487
100785	100	11	0	2013-07-08 21:40:47.246208	2013-07-08 21:40:47.246208
100786	100	12	0	2013-07-08 21:40:47.246964	2013-07-08 21:40:47.246964
100787	100	13	0	2013-07-08 21:40:47.247615	2013-07-08 21:40:47.247615
100788	100	14	0	2013-07-08 21:40:47.248271	2013-07-08 21:40:47.248271
100789	100	15	0	2013-07-08 21:40:47.249014	2013-07-08 21:40:47.249014
100790	100	16	0	2013-07-08 21:40:47.249802	2013-07-08 21:40:47.249802
100791	100	17	0	2013-07-08 21:40:47.250784	2013-07-08 21:40:47.250784
100792	100	18	0	2013-07-08 21:40:47.251599	2013-07-08 21:40:47.251599
100793	100	19	0	2013-07-08 21:40:47.252462	2013-07-08 21:40:47.252462
100794	100	20	0	2013-07-08 21:40:47.253317	2013-07-08 21:40:47.253317
100795	100	21	0	2013-07-08 21:40:47.254324	2013-07-08 21:40:47.254324
100796	100	22	0	2013-07-08 21:40:47.255379	2013-07-08 21:40:47.255379
100797	100	23	0	2013-07-08 21:40:47.256102	2013-07-08 21:40:47.256102
100798	100	24	0	2013-07-08 21:40:47.256785	2013-07-08 21:40:47.256785
100799	100	25	0	2013-07-08 21:40:47.25762	2013-07-08 21:40:47.25762
100800	100	26	0	2013-07-08 21:40:47.258285	2013-07-08 21:40:47.258285
100801	100	27	0	2013-07-08 21:40:47.259006	2013-07-08 21:40:47.259006
100802	100	28	0	2013-07-08 21:40:47.259667	2013-07-08 21:40:47.259667
100803	100	29	0	2013-07-08 21:40:47.260422	2013-07-08 21:40:47.260422
100804	100	30	0	2013-07-08 21:40:47.261096	2013-07-08 21:40:47.261096
100805	100	5	1	2013-07-08 21:40:47.262926	2013-07-08 21:40:47.262926
100806	100	6	1	2013-07-08 21:40:47.263618	2013-07-08 21:40:47.263618
100807	100	7	1	2013-07-08 21:40:47.264267	2013-07-08 21:40:47.264267
100808	100	8	1	2013-07-08 21:40:47.264998	2013-07-08 21:40:47.264998
100809	100	9	1	2013-07-08 21:40:47.26572	2013-07-08 21:40:47.26572
100810	100	10	1	2013-07-08 21:40:47.26657	2013-07-08 21:40:47.26657
100811	100	11	1	2013-07-08 21:40:47.267601	2013-07-08 21:40:47.267601
100812	100	12	1	2013-07-08 21:40:47.268445	2013-07-08 21:40:47.268445
100813	100	13	1	2013-07-08 21:40:47.269425	2013-07-08 21:40:47.269425
100814	100	14	1	2013-07-08 21:40:47.270349	2013-07-08 21:40:47.270349
100815	100	15	1	2013-07-08 21:40:47.271257	2013-07-08 21:40:47.271257
100816	100	16	1	2013-07-08 21:40:47.272004	2013-07-08 21:40:47.272004
100817	100	17	1	2013-07-08 21:40:47.272746	2013-07-08 21:40:47.272746
100818	100	18	1	2013-07-08 21:40:47.273511	2013-07-08 21:40:47.273511
100819	100	19	1	2013-07-08 21:40:47.27418	2013-07-08 21:40:47.27418
100820	100	20	1	2013-07-08 21:40:47.274891	2013-07-08 21:40:47.274891
100821	100	21	1	2013-07-08 21:40:47.275563	2013-07-08 21:40:47.275563
100822	100	22	1	2013-07-08 21:40:47.276203	2013-07-08 21:40:47.276203
100823	100	23	1	2013-07-08 21:40:47.276869	2013-07-08 21:40:47.276869
100824	100	24	1	2013-07-08 21:40:47.277664	2013-07-08 21:40:47.277664
100825	100	25	1	2013-07-08 21:40:47.278382	2013-07-08 21:40:47.278382
100826	100	26	1	2013-07-08 21:40:47.27906	2013-07-08 21:40:47.27906
100827	100	27	1	2013-07-08 21:40:47.279722	2013-07-08 21:40:47.279722
100828	100	28	1	2013-07-08 21:40:47.280365	2013-07-08 21:40:47.280365
100829	100	29	1	2013-07-08 21:40:47.281144	2013-07-08 21:40:47.281144
100830	100	30	1	2013-07-08 21:40:47.281848	2013-07-08 21:40:47.281848
100831	100	7	2	2013-07-08 21:40:47.283553	2013-07-08 21:40:47.283553
100832	100	8	2	2013-07-08 21:40:47.284234	2013-07-08 21:40:47.284234
100833	100	9	2	2013-07-08 21:40:47.285044	2013-07-08 21:40:47.285044
100834	100	25	2	2013-07-08 21:40:47.28768	2013-07-08 21:40:47.28768
100835	100	26	2	2013-07-08 21:40:47.288467	2013-07-08 21:40:47.288467
100836	100	7	3	2013-07-08 21:40:47.290996	2013-07-08 21:40:47.290996
100837	100	8	3	2013-07-08 21:40:47.291889	2013-07-08 21:40:47.291889
100838	100	9	3	2013-07-08 21:40:47.292969	2013-07-08 21:40:47.292969
100839	100	16	3	2013-07-08 21:40:47.295024	2013-07-08 21:40:47.295024
100840	100	17	3	2013-07-08 21:40:47.29584	2013-07-08 21:40:47.29584
100841	100	25	3	2013-07-08 21:40:47.297441	2013-07-08 21:40:47.297441
100842	100	26	3	2013-07-08 21:40:47.298134	2013-07-08 21:40:47.298134
100843	100	0	4	2013-07-08 21:40:47.298807	2013-07-08 21:40:47.298807
100844	100	1	4	2013-07-08 21:40:47.299656	2013-07-08 21:40:47.299656
100845	100	7	4	2013-07-08 21:40:47.30226	2013-07-08 21:40:47.30226
100846	100	8	4	2013-07-08 21:40:47.303154	2013-07-08 21:40:47.303154
100847	100	9	4	2013-07-08 21:40:47.304059	2013-07-08 21:40:47.304059
100848	100	16	4	2013-07-08 21:40:47.305999	2013-07-08 21:40:47.305999
100849	100	17	4	2013-07-08 21:40:47.306684	2013-07-08 21:40:47.306684
100850	100	25	4	2013-07-08 21:40:47.308254	2013-07-08 21:40:47.308254
100851	100	26	4	2013-07-08 21:40:47.308953	2013-07-08 21:40:47.308953
100852	100	0	5	2013-07-08 21:40:47.309677	2013-07-08 21:40:47.309677
100853	100	1	5	2013-07-08 21:40:47.310497	2013-07-08 21:40:47.310497
100854	100	7	5	2013-07-08 21:40:47.31118	2013-07-08 21:40:47.31118
100855	100	8	5	2013-07-08 21:40:47.311846	2013-07-08 21:40:47.311846
100856	100	9	5	2013-07-08 21:40:47.3125	2013-07-08 21:40:47.3125
100857	100	13	5	2013-07-08 21:40:47.314118	2013-07-08 21:40:47.314118
100858	100	14	5	2013-07-08 21:40:47.314777	2013-07-08 21:40:47.314777
100859	100	15	5	2013-07-08 21:40:47.315471	2013-07-08 21:40:47.315471
100860	100	16	5	2013-07-08 21:40:47.316252	2013-07-08 21:40:47.316252
100861	100	17	5	2013-07-08 21:40:47.316912	2013-07-08 21:40:47.316912
100862	100	25	5	2013-07-08 21:40:47.31972	2013-07-08 21:40:47.31972
100863	100	26	5	2013-07-08 21:40:47.320437	2013-07-08 21:40:47.320437
100864	100	0	6	2013-07-08 21:40:47.321209	2013-07-08 21:40:47.321209
100865	100	1	6	2013-07-08 21:40:47.321907	2013-07-08 21:40:47.321907
100866	100	7	6	2013-07-08 21:40:47.323837	2013-07-08 21:40:47.323837
100867	100	8	6	2013-07-08 21:40:47.324743	2013-07-08 21:40:47.324743
100868	100	9	6	2013-07-08 21:40:47.3255	2013-07-08 21:40:47.3255
100869	100	13	6	2013-07-08 21:40:47.326235	2013-07-08 21:40:47.326235
100870	100	14	6	2013-07-08 21:40:47.326914	2013-07-08 21:40:47.326914
100871	100	15	6	2013-07-08 21:40:47.327606	2013-07-08 21:40:47.327606
100872	100	16	6	2013-07-08 21:40:47.328272	2013-07-08 21:40:47.328272
100873	100	17	6	2013-07-08 21:40:47.32899	2013-07-08 21:40:47.32899
100874	100	18	6	2013-07-08 21:40:47.329715	2013-07-08 21:40:47.329715
100875	100	19	6	2013-07-08 21:40:47.33037	2013-07-08 21:40:47.33037
100876	100	20	6	2013-07-08 21:40:47.331062	2013-07-08 21:40:47.331062
100877	100	21	6	2013-07-08 21:40:47.331698	2013-07-08 21:40:47.331698
100878	100	25	6	2013-07-08 21:40:47.334516	2013-07-08 21:40:47.334516
100879	100	26	6	2013-07-08 21:40:47.335357	2013-07-08 21:40:47.335357
100880	100	0	7	2013-07-08 21:40:47.336083	2013-07-08 21:40:47.336083
100881	100	1	7	2013-07-08 21:40:47.336785	2013-07-08 21:40:47.336785
100882	100	7	7	2013-07-08 21:40:47.338783	2013-07-08 21:40:47.338783
100883	100	8	7	2013-07-08 21:40:47.339835	2013-07-08 21:40:47.339835
100884	100	9	7	2013-07-08 21:40:47.340837	2013-07-08 21:40:47.340837
100885	100	17	7	2013-07-08 21:40:47.342693	2013-07-08 21:40:47.342693
100886	100	18	7	2013-07-08 21:40:47.343418	2013-07-08 21:40:47.343418
100887	100	19	7	2013-07-08 21:40:47.344095	2013-07-08 21:40:47.344095
100888	100	20	7	2013-07-08 21:40:47.344821	2013-07-08 21:40:47.344821
100889	100	21	7	2013-07-08 21:40:47.345615	2013-07-08 21:40:47.345615
100890	100	25	7	2013-07-08 21:40:47.346292	2013-07-08 21:40:47.346292
100891	100	26	7	2013-07-08 21:40:47.347003	2013-07-08 21:40:47.347003
100892	100	0	8	2013-07-08 21:40:47.347726	2013-07-08 21:40:47.347726
100893	100	1	8	2013-07-08 21:40:47.348439	2013-07-08 21:40:47.348439
100894	100	2	8	2013-07-08 21:40:47.349093	2013-07-08 21:40:47.349093
100895	100	3	8	2013-07-08 21:40:47.349806	2013-07-08 21:40:47.349806
100896	100	7	8	2013-07-08 21:40:47.351625	2013-07-08 21:40:47.351625
100897	100	8	8	2013-07-08 21:40:47.352748	2013-07-08 21:40:47.352748
100898	100	9	8	2013-07-08 21:40:47.353659	2013-07-08 21:40:47.353659
100899	100	17	8	2013-07-08 21:40:47.356403	2013-07-08 21:40:47.356403
100900	100	18	8	2013-07-08 21:40:47.357184	2013-07-08 21:40:47.357184
100901	100	25	8	2013-07-08 21:40:47.359306	2013-07-08 21:40:47.359306
100902	100	26	8	2013-07-08 21:40:47.360243	2013-07-08 21:40:47.360243
100903	100	0	9	2013-07-08 21:40:47.361105	2013-07-08 21:40:47.361105
100904	100	1	9	2013-07-08 21:40:47.361987	2013-07-08 21:40:47.361987
100905	100	2	9	2013-07-08 21:40:47.362813	2013-07-08 21:40:47.362813
100906	100	3	9	2013-07-08 21:40:47.36348	2013-07-08 21:40:47.36348
100907	100	7	9	2013-07-08 21:40:47.365075	2013-07-08 21:40:47.365075
100908	100	8	9	2013-07-08 21:40:47.365863	2013-07-08 21:40:47.365863
100909	100	9	9	2013-07-08 21:40:47.366572	2013-07-08 21:40:47.366572
100910	100	13	9	2013-07-08 21:40:47.367518	2013-07-08 21:40:47.367518
100911	100	14	9	2013-07-08 21:40:47.368391	2013-07-08 21:40:47.368391
100912	100	15	9	2013-07-08 21:40:47.370409	2013-07-08 21:40:47.370409
100913	100	16	9	2013-07-08 21:40:47.371764	2013-07-08 21:40:47.371764
100914	100	17	9	2013-07-08 21:40:47.372706	2013-07-08 21:40:47.372706
100915	100	18	9	2013-07-08 21:40:47.373473	2013-07-08 21:40:47.373473
100916	100	23	9	2013-07-08 21:40:47.376062	2013-07-08 21:40:47.376062
100917	100	24	9	2013-07-08 21:40:47.37683	2013-07-08 21:40:47.37683
100918	100	25	9	2013-07-08 21:40:47.377606	2013-07-08 21:40:47.377606
100919	100	26	9	2013-07-08 21:40:47.378308	2013-07-08 21:40:47.378308
100920	100	27	9	2013-07-08 21:40:47.379029	2013-07-08 21:40:47.379029
100921	100	28	9	2013-07-08 21:40:47.379916	2013-07-08 21:40:47.379916
100922	100	29	9	2013-07-08 21:40:47.380627	2013-07-08 21:40:47.380627
100923	100	30	9	2013-07-08 21:40:47.38132	2013-07-08 21:40:47.38132
100924	100	0	10	2013-07-08 21:40:47.382058	2013-07-08 21:40:47.382058
100925	100	1	10	2013-07-08 21:40:47.382768	2013-07-08 21:40:47.382768
100926	100	7	10	2013-07-08 21:40:47.383788	2013-07-08 21:40:47.383788
100927	100	8	10	2013-07-08 21:40:47.384645	2013-07-08 21:40:47.384645
100928	100	9	10	2013-07-08 21:40:47.386042	2013-07-08 21:40:47.386042
100929	100	17	10	2013-07-08 21:40:47.388426	2013-07-08 21:40:47.388426
100930	100	18	10	2013-07-08 21:40:47.38919	2013-07-08 21:40:47.38919
100931	100	23	10	2013-07-08 21:40:47.38991	2013-07-08 21:40:47.38991
100932	100	24	10	2013-07-08 21:40:47.390601	2013-07-08 21:40:47.390601
100933	100	25	10	2013-07-08 21:40:47.391378	2013-07-08 21:40:47.391378
100934	100	26	10	2013-07-08 21:40:47.39209	2013-07-08 21:40:47.39209
100935	100	27	10	2013-07-08 21:40:47.392997	2013-07-08 21:40:47.392997
100936	100	28	10	2013-07-08 21:40:47.393811	2013-07-08 21:40:47.393811
100937	100	29	10	2013-07-08 21:40:47.394564	2013-07-08 21:40:47.394564
100938	100	30	10	2013-07-08 21:40:47.395231	2013-07-08 21:40:47.395231
100939	100	0	11	2013-07-08 21:40:47.396879	2013-07-08 21:40:47.396879
100940	100	1	11	2013-07-08 21:40:47.39767	2013-07-08 21:40:47.39767
100941	100	7	11	2013-07-08 21:40:47.39969	2013-07-08 21:40:47.39969
100942	100	8	11	2013-07-08 21:40:47.400832	2013-07-08 21:40:47.400832
100943	100	9	11	2013-07-08 21:40:47.40214	2013-07-08 21:40:47.40214
100944	100	17	11	2013-07-08 21:40:47.402975	2013-07-08 21:40:47.402975
100945	100	18	11	2013-07-08 21:40:47.404105	2013-07-08 21:40:47.404105
100946	100	23	11	2013-07-08 21:40:47.406116	2013-07-08 21:40:47.406116
100947	100	24	11	2013-07-08 21:40:47.406926	2013-07-08 21:40:47.406926
100948	100	25	11	2013-07-08 21:40:47.407674	2013-07-08 21:40:47.407674
100949	100	26	11	2013-07-08 21:40:47.408445	2013-07-08 21:40:47.408445
100950	100	27	11	2013-07-08 21:40:47.409251	2013-07-08 21:40:47.409251
100951	100	28	11	2013-07-08 21:40:47.409945	2013-07-08 21:40:47.409945
100952	100	29	11	2013-07-08 21:40:47.410668	2013-07-08 21:40:47.410668
100953	100	0	12	2013-07-08 21:40:47.411387	2013-07-08 21:40:47.411387
100954	100	1	12	2013-07-08 21:40:47.412071	2013-07-08 21:40:47.412071
100955	100	16	12	2013-07-08 21:40:47.416157	2013-07-08 21:40:47.416157
100956	100	17	12	2013-07-08 21:40:47.417332	2013-07-08 21:40:47.417332
100957	100	18	12	2013-07-08 21:40:47.418553	2013-07-08 21:40:47.418553
100958	100	23	12	2013-07-08 21:40:47.41941	2013-07-08 21:40:47.41941
100959	100	24	12	2013-07-08 21:40:47.420125	2013-07-08 21:40:47.420125
100960	100	28	12	2013-07-08 21:40:47.422922	2013-07-08 21:40:47.422922
100961	100	29	12	2013-07-08 21:40:47.423783	2013-07-08 21:40:47.423783
100962	100	0	13	2013-07-08 21:40:47.424534	2013-07-08 21:40:47.424534
100963	100	1	13	2013-07-08 21:40:47.425472	2013-07-08 21:40:47.425472
100964	100	15	13	2013-07-08 21:40:47.427848	2013-07-08 21:40:47.427848
100965	100	16	13	2013-07-08 21:40:47.428574	2013-07-08 21:40:47.428574
100966	100	23	13	2013-07-08 21:40:47.43034	2013-07-08 21:40:47.43034
100967	100	24	13	2013-07-08 21:40:47.431128	2013-07-08 21:40:47.431128
100968	100	0	14	2013-07-08 21:40:47.432905	2013-07-08 21:40:47.432905
100969	100	1	14	2013-07-08 21:40:47.434172	2013-07-08 21:40:47.434172
100970	100	15	14	2013-07-08 21:40:47.437182	2013-07-08 21:40:47.437182
100971	100	16	14	2013-07-08 21:40:47.438215	2013-07-08 21:40:47.438215
100972	100	21	14	2013-07-08 21:40:47.440194	2013-07-08 21:40:47.440194
100973	100	22	14	2013-07-08 21:40:47.441282	2013-07-08 21:40:47.441282
100974	100	23	14	2013-07-08 21:40:47.442349	2013-07-08 21:40:47.442349
100975	100	24	14	2013-07-08 21:40:47.443206	2013-07-08 21:40:47.443206
100976	100	28	14	2013-07-08 21:40:47.443944	2013-07-08 21:40:47.443944
100977	100	29	14	2013-07-08 21:40:47.444672	2013-07-08 21:40:47.444672
100978	100	0	15	2013-07-08 21:40:47.445354	2013-07-08 21:40:47.445354
100979	100	1	15	2013-07-08 21:40:47.446059	2013-07-08 21:40:47.446059
100980	100	2	15	2013-07-08 21:40:47.446751	2013-07-08 21:40:47.446751
100981	100	3	15	2013-07-08 21:40:47.44747	2013-07-08 21:40:47.44747
100982	100	4	15	2013-07-08 21:40:47.448198	2013-07-08 21:40:47.448198
100983	100	5	15	2013-07-08 21:40:47.448993	2013-07-08 21:40:47.448993
100984	100	6	15	2013-07-08 21:40:47.449782	2013-07-08 21:40:47.449782
100985	100	7	15	2013-07-08 21:40:47.450481	2013-07-08 21:40:47.450481
100986	100	8	15	2013-07-08 21:40:47.451557	2013-07-08 21:40:47.451557
100987	100	9	15	2013-07-08 21:40:47.452468	2013-07-08 21:40:47.452468
100988	100	10	15	2013-07-08 21:40:47.453147	2013-07-08 21:40:47.453147
100989	100	11	15	2013-07-08 21:40:47.453905	2013-07-08 21:40:47.453905
100990	100	12	15	2013-07-08 21:40:47.454834	2013-07-08 21:40:47.454834
100991	100	13	15	2013-07-08 21:40:47.455773	2013-07-08 21:40:47.455773
100992	100	14	15	2013-07-08 21:40:47.456704	2013-07-08 21:40:47.456704
100993	100	15	15	2013-07-08 21:40:47.457969	2013-07-08 21:40:47.457969
100994	100	16	15	2013-07-08 21:40:47.458824	2013-07-08 21:40:47.458824
100995	100	21	15	2013-07-08 21:40:47.460475	2013-07-08 21:40:47.460475
100996	100	22	15	2013-07-08 21:40:47.461226	2013-07-08 21:40:47.461226
100997	100	23	15	2013-07-08 21:40:47.461929	2013-07-08 21:40:47.461929
100998	100	24	15	2013-07-08 21:40:47.462729	2013-07-08 21:40:47.462729
100999	100	28	15	2013-07-08 21:40:47.464404	2013-07-08 21:40:47.464404
101000	100	29	15	2013-07-08 21:40:47.465205	2013-07-08 21:40:47.465205
101001	100	15	16	2013-07-08 21:40:47.465983	2013-07-08 21:40:47.465983
101002	100	16	16	2013-07-08 21:40:47.466763	2013-07-08 21:40:47.466763
101003	100	28	16	2013-07-08 21:40:47.470041	2013-07-08 21:40:47.470041
101004	100	29	16	2013-07-08 21:40:47.471016	2013-07-08 21:40:47.471016
101005	100	15	17	2013-07-08 21:40:47.473479	2013-07-08 21:40:47.473479
101006	100	16	17	2013-07-08 21:40:47.474812	2013-07-08 21:40:47.474812
101007	100	28	17	2013-07-08 21:40:47.47758	2013-07-08 21:40:47.47758
101008	100	29	17	2013-07-08 21:40:47.478316	2013-07-08 21:40:47.478316
101009	100	15	18	2013-07-08 21:40:47.479844	2013-07-08 21:40:47.479844
101010	100	16	18	2013-07-08 21:40:47.480564	2013-07-08 21:40:47.480564
101011	100	17	18	2013-07-08 21:40:47.48141	2013-07-08 21:40:47.48141
101012	100	18	18	2013-07-08 21:40:47.482129	2013-07-08 21:40:47.482129
101013	100	19	18	2013-07-08 21:40:47.482963	2013-07-08 21:40:47.482963
101014	100	20	18	2013-07-08 21:40:47.483747	2013-07-08 21:40:47.483747
101015	100	21	18	2013-07-08 21:40:47.484483	2013-07-08 21:40:47.484483
101016	100	22	18	2013-07-08 21:40:47.485187	2013-07-08 21:40:47.485187
101017	100	23	18	2013-07-08 21:40:47.485856	2013-07-08 21:40:47.485856
101018	100	24	18	2013-07-08 21:40:47.48656	2013-07-08 21:40:47.48656
101019	100	25	18	2013-07-08 21:40:47.487488	2013-07-08 21:40:47.487488
101020	100	26	18	2013-07-08 21:40:47.488195	2013-07-08 21:40:47.488195
101021	100	27	18	2013-07-08 21:40:47.488908	2013-07-08 21:40:47.488908
101022	100	28	18	2013-07-08 21:40:47.489655	2013-07-08 21:40:47.489655
101023	100	29	18	2013-07-08 21:40:47.490389	2013-07-08 21:40:47.490389
101024	100	22	19	2013-07-08 21:40:47.491146	2013-07-08 21:40:47.491146
101025	100	23	19	2013-07-08 21:40:47.491823	2013-07-08 21:40:47.491823
101026	100	17	21	2013-07-08 21:40:47.493501	2013-07-08 21:40:47.493501
101027	100	18	21	2013-07-08 21:40:47.494247	2013-07-08 21:40:47.494247
101028	100	26	21	2013-07-08 21:40:47.495011	2013-07-08 21:40:47.495011
101029	100	27	21	2013-07-08 21:40:47.495715	2013-07-08 21:40:47.495715
101030	99	6	0	2013-07-08 21:43:22.394114	2013-07-08 21:43:22.394114
101031	99	7	0	2013-07-08 21:43:22.395067	2013-07-08 21:43:22.395067
101032	99	8	0	2013-07-08 21:43:22.395789	2013-07-08 21:43:22.395789
101033	99	24	0	2013-07-08 21:43:22.397777	2013-07-08 21:43:22.397777
101034	99	25	0	2013-07-08 21:43:22.398777	2013-07-08 21:43:22.398777
101035	99	26	0	2013-07-08 21:43:22.39949	2013-07-08 21:43:22.39949
101036	99	6	1	2013-07-08 21:43:22.400999	2013-07-08 21:43:22.400999
101037	99	7	1	2013-07-08 21:43:22.401662	2013-07-08 21:43:22.401662
101038	99	8	1	2013-07-08 21:43:22.402302	2013-07-08 21:43:22.402302
101039	99	24	1	2013-07-08 21:43:22.403874	2013-07-08 21:43:22.403874
101040	99	25	1	2013-07-08 21:43:22.404682	2013-07-08 21:43:22.404682
101041	99	26	1	2013-07-08 21:43:22.405397	2013-07-08 21:43:22.405397
101042	99	30	1	2013-07-08 21:43:22.406112	2013-07-08 21:43:22.406112
101043	99	31	1	2013-07-08 21:43:22.406777	2013-07-08 21:43:22.406777
101044	99	32	1	2013-07-08 21:43:22.40742	2013-07-08 21:43:22.40742
101045	99	6	2	2013-07-08 21:43:22.408095	2013-07-08 21:43:22.408095
101046	99	7	2	2013-07-08 21:43:22.408753	2013-07-08 21:43:22.408753
101047	99	8	2	2013-07-08 21:43:22.409412	2013-07-08 21:43:22.409412
101048	99	24	2	2013-07-08 21:43:22.411152	2013-07-08 21:43:22.411152
101049	99	25	2	2013-07-08 21:43:22.411985	2013-07-08 21:43:22.411985
101050	99	26	2	2013-07-08 21:43:22.413091	2013-07-08 21:43:22.413091
101051	99	30	2	2013-07-08 21:43:22.413857	2013-07-08 21:43:22.413857
101052	99	31	2	2013-07-08 21:43:22.414663	2013-07-08 21:43:22.414663
101053	99	32	2	2013-07-08 21:43:22.415626	2013-07-08 21:43:22.415626
101054	99	6	3	2013-07-08 21:43:22.416443	2013-07-08 21:43:22.416443
101055	99	7	3	2013-07-08 21:43:22.417162	2013-07-08 21:43:22.417162
101056	99	8	3	2013-07-08 21:43:22.417916	2013-07-08 21:43:22.417916
101057	99	24	3	2013-07-08 21:43:22.419557	2013-07-08 21:43:22.419557
101058	99	25	3	2013-07-08 21:43:22.420419	2013-07-08 21:43:22.420419
101059	99	26	3	2013-07-08 21:43:22.42116	2013-07-08 21:43:22.42116
101060	99	30	3	2013-07-08 21:43:22.421913	2013-07-08 21:43:22.421913
101061	99	31	3	2013-07-08 21:43:22.422679	2013-07-08 21:43:22.422679
101062	99	32	3	2013-07-08 21:43:22.423341	2013-07-08 21:43:22.423341
101063	99	6	4	2013-07-08 21:43:22.424016	2013-07-08 21:43:22.424016
101064	99	7	4	2013-07-08 21:43:22.42467	2013-07-08 21:43:22.42467
101065	99	8	4	2013-07-08 21:43:22.425409	2013-07-08 21:43:22.425409
101066	99	24	4	2013-07-08 21:43:22.426222	2013-07-08 21:43:22.426222
101067	99	25	4	2013-07-08 21:43:22.426885	2013-07-08 21:43:22.426885
101068	99	26	4	2013-07-08 21:43:22.427568	2013-07-08 21:43:22.427568
101069	99	30	4	2013-07-08 21:43:22.428308	2013-07-08 21:43:22.428308
101070	99	31	4	2013-07-08 21:43:22.429015	2013-07-08 21:43:22.429015
101071	99	32	4	2013-07-08 21:43:22.430066	2013-07-08 21:43:22.430066
101072	99	6	5	2013-07-08 21:43:22.430742	2013-07-08 21:43:22.430742
101073	99	7	5	2013-07-08 21:43:22.431413	2013-07-08 21:43:22.431413
101074	99	8	5	2013-07-08 21:43:22.432178	2013-07-08 21:43:22.432178
101075	99	15	5	2013-07-08 21:43:22.433437	2013-07-08 21:43:22.433437
101076	99	16	5	2013-07-08 21:43:22.434514	2013-07-08 21:43:22.434514
101077	99	17	5	2013-07-08 21:43:22.435302	2013-07-08 21:43:22.435302
101078	99	24	5	2013-07-08 21:43:22.437236	2013-07-08 21:43:22.437236
101079	99	25	5	2013-07-08 21:43:22.438058	2013-07-08 21:43:22.438058
101080	99	26	5	2013-07-08 21:43:22.438833	2013-07-08 21:43:22.438833
101081	99	30	5	2013-07-08 21:43:22.439727	2013-07-08 21:43:22.439727
101082	99	31	5	2013-07-08 21:43:22.440502	2013-07-08 21:43:22.440502
101083	99	32	5	2013-07-08 21:43:22.44142	2013-07-08 21:43:22.44142
101084	99	6	6	2013-07-08 21:43:22.442373	2013-07-08 21:43:22.442373
101085	99	7	6	2013-07-08 21:43:22.443271	2013-07-08 21:43:22.443271
101086	99	8	6	2013-07-08 21:43:22.443946	2013-07-08 21:43:22.443946
101087	99	15	6	2013-07-08 21:43:22.445462	2013-07-08 21:43:22.445462
101088	99	16	6	2013-07-08 21:43:22.446177	2013-07-08 21:43:22.446177
101089	99	17	6	2013-07-08 21:43:22.446877	2013-07-08 21:43:22.446877
101090	99	24	6	2013-07-08 21:43:22.448246	2013-07-08 21:43:22.448246
101091	99	25	6	2013-07-08 21:43:22.449204	2013-07-08 21:43:22.449204
101092	99	26	6	2013-07-08 21:43:22.449931	2013-07-08 21:43:22.449931
101093	99	30	6	2013-07-08 21:43:22.45085	2013-07-08 21:43:22.45085
101094	99	31	6	2013-07-08 21:43:22.451659	2013-07-08 21:43:22.451659
101095	99	32	6	2013-07-08 21:43:22.452818	2013-07-08 21:43:22.452818
101096	99	6	7	2013-07-08 21:43:22.453565	2013-07-08 21:43:22.453565
101097	99	7	7	2013-07-08 21:43:22.454219	2013-07-08 21:43:22.454219
101098	99	8	7	2013-07-08 21:43:22.454891	2013-07-08 21:43:22.454891
101099	99	15	7	2013-07-08 21:43:22.455575	2013-07-08 21:43:22.455575
101100	99	16	7	2013-07-08 21:43:22.456243	2013-07-08 21:43:22.456243
101101	99	17	7	2013-07-08 21:43:22.456908	2013-07-08 21:43:22.456908
101102	99	24	7	2013-07-08 21:43:22.457605	2013-07-08 21:43:22.457605
101103	99	25	7	2013-07-08 21:43:22.458342	2013-07-08 21:43:22.458342
101104	99	26	7	2013-07-08 21:43:22.459112	2013-07-08 21:43:22.459112
101105	99	30	7	2013-07-08 21:43:22.459813	2013-07-08 21:43:22.459813
101106	99	31	7	2013-07-08 21:43:22.460481	2013-07-08 21:43:22.460481
101107	99	32	7	2013-07-08 21:43:22.461233	2013-07-08 21:43:22.461233
101108	99	6	8	2013-07-08 21:43:22.463388	2013-07-08 21:43:22.463388
101109	99	7	8	2013-07-08 21:43:22.464378	2013-07-08 21:43:22.464378
101110	99	8	8	2013-07-08 21:43:22.465758	2013-07-08 21:43:22.465758
101111	99	15	8	2013-07-08 21:43:22.467987	2013-07-08 21:43:22.467987
101112	99	16	8	2013-07-08 21:43:22.468961	2013-07-08 21:43:22.468961
101113	99	17	8	2013-07-08 21:43:22.469764	2013-07-08 21:43:22.469764
101114	99	24	8	2013-07-08 21:43:22.4705	2013-07-08 21:43:22.4705
101115	99	25	8	2013-07-08 21:43:22.471162	2013-07-08 21:43:22.471162
101116	99	26	8	2013-07-08 21:43:22.47182	2013-07-08 21:43:22.47182
101117	99	30	8	2013-07-08 21:43:22.473309	2013-07-08 21:43:22.473309
101118	99	31	8	2013-07-08 21:43:22.474009	2013-07-08 21:43:22.474009
101119	99	32	8	2013-07-08 21:43:22.474945	2013-07-08 21:43:22.474945
101120	99	6	9	2013-07-08 21:43:22.477217	2013-07-08 21:43:22.477217
101121	99	7	9	2013-07-08 21:43:22.477877	2013-07-08 21:43:22.477877
101122	99	8	9	2013-07-08 21:43:22.478597	2013-07-08 21:43:22.478597
101123	99	15	9	2013-07-08 21:43:22.479286	2013-07-08 21:43:22.479286
101124	99	16	9	2013-07-08 21:43:22.480193	2013-07-08 21:43:22.480193
101125	99	17	9	2013-07-08 21:43:22.481155	2013-07-08 21:43:22.481155
101126	99	24	9	2013-07-08 21:43:22.483979	2013-07-08 21:43:22.483979
101127	99	25	9	2013-07-08 21:43:22.48505	2013-07-08 21:43:22.48505
101128	99	26	9	2013-07-08 21:43:22.486023	2013-07-08 21:43:22.486023
101129	99	30	9	2013-07-08 21:43:22.487848	2013-07-08 21:43:22.487848
101130	99	31	9	2013-07-08 21:43:22.488522	2013-07-08 21:43:22.488522
101131	99	32	9	2013-07-08 21:43:22.489205	2013-07-08 21:43:22.489205
101132	99	6	10	2013-07-08 21:43:22.489894	2013-07-08 21:43:22.489894
101133	99	7	10	2013-07-08 21:43:22.490735	2013-07-08 21:43:22.490735
101134	99	8	10	2013-07-08 21:43:22.491457	2013-07-08 21:43:22.491457
101135	99	15	10	2013-07-08 21:43:22.492131	2013-07-08 21:43:22.492131
101136	99	16	10	2013-07-08 21:43:22.492804	2013-07-08 21:43:22.492804
101137	99	17	10	2013-07-08 21:43:22.493483	2013-07-08 21:43:22.493483
101138	99	24	10	2013-07-08 21:43:22.494206	2013-07-08 21:43:22.494206
101139	99	25	10	2013-07-08 21:43:22.494964	2013-07-08 21:43:22.494964
101140	99	26	10	2013-07-08 21:43:22.49564	2013-07-08 21:43:22.49564
101141	99	30	10	2013-07-08 21:43:22.496376	2013-07-08 21:43:22.496376
101142	99	31	10	2013-07-08 21:43:22.497147	2013-07-08 21:43:22.497147
101143	99	32	10	2013-07-08 21:43:22.498066	2013-07-08 21:43:22.498066
101144	99	6	11	2013-07-08 21:43:22.499041	2013-07-08 21:43:22.499041
101145	99	7	11	2013-07-08 21:43:22.499768	2013-07-08 21:43:22.499768
101146	99	8	11	2013-07-08 21:43:22.50072	2013-07-08 21:43:22.50072
101147	99	15	11	2013-07-08 21:43:22.501595	2013-07-08 21:43:22.501595
101148	99	16	11	2013-07-08 21:43:22.502383	2013-07-08 21:43:22.502383
101149	99	17	11	2013-07-08 21:43:22.503039	2013-07-08 21:43:22.503039
101150	99	24	11	2013-07-08 21:43:22.503771	2013-07-08 21:43:22.503771
101151	99	25	11	2013-07-08 21:43:22.504439	2013-07-08 21:43:22.504439
101152	99	26	11	2013-07-08 21:43:22.505137	2013-07-08 21:43:22.505137
101153	99	30	11	2013-07-08 21:43:22.506179	2013-07-08 21:43:22.506179
101154	99	31	11	2013-07-08 21:43:22.506947	2013-07-08 21:43:22.506947
101155	99	32	11	2013-07-08 21:43:22.507639	2013-07-08 21:43:22.507639
101156	99	6	12	2013-07-08 21:43:22.508322	2013-07-08 21:43:22.508322
101157	99	7	12	2013-07-08 21:43:22.509096	2013-07-08 21:43:22.509096
101158	99	8	12	2013-07-08 21:43:22.509857	2013-07-08 21:43:22.509857
101159	99	15	12	2013-07-08 21:43:22.510579	2013-07-08 21:43:22.510579
101160	99	16	12	2013-07-08 21:43:22.511255	2013-07-08 21:43:22.511255
101161	99	17	12	2013-07-08 21:43:22.511959	2013-07-08 21:43:22.511959
101162	99	24	12	2013-07-08 21:43:22.512642	2013-07-08 21:43:22.512642
101163	99	25	12	2013-07-08 21:43:22.513293	2013-07-08 21:43:22.513293
101164	99	26	12	2013-07-08 21:43:22.514179	2013-07-08 21:43:22.514179
101165	99	30	12	2013-07-08 21:43:22.515273	2013-07-08 21:43:22.515273
101166	99	31	12	2013-07-08 21:43:22.516062	2013-07-08 21:43:22.516062
101167	99	32	12	2013-07-08 21:43:22.516748	2013-07-08 21:43:22.516748
101168	99	6	13	2013-07-08 21:43:22.51747	2013-07-08 21:43:22.51747
101169	99	7	13	2013-07-08 21:43:22.518155	2013-07-08 21:43:22.518155
101170	99	8	13	2013-07-08 21:43:22.518854	2013-07-08 21:43:22.518854
101171	99	15	13	2013-07-08 21:43:22.519547	2013-07-08 21:43:22.519547
101172	99	16	13	2013-07-08 21:43:22.520193	2013-07-08 21:43:22.520193
101173	99	17	13	2013-07-08 21:43:22.520971	2013-07-08 21:43:22.520971
101174	99	24	13	2013-07-08 21:43:22.522717	2013-07-08 21:43:22.522717
101175	99	25	13	2013-07-08 21:43:22.523407	2013-07-08 21:43:22.523407
101176	99	26	13	2013-07-08 21:43:22.524115	2013-07-08 21:43:22.524115
101177	99	30	13	2013-07-08 21:43:22.524783	2013-07-08 21:43:22.524783
101178	99	31	13	2013-07-08 21:43:22.525429	2013-07-08 21:43:22.525429
101179	99	32	13	2013-07-08 21:43:22.526156	2013-07-08 21:43:22.526156
101180	99	6	14	2013-07-08 21:43:22.526842	2013-07-08 21:43:22.526842
101181	99	7	14	2013-07-08 21:43:22.527509	2013-07-08 21:43:22.527509
101182	99	8	14	2013-07-08 21:43:22.528174	2013-07-08 21:43:22.528174
101183	99	15	14	2013-07-08 21:43:22.531336	2013-07-08 21:43:22.531336
101184	99	16	14	2013-07-08 21:43:22.532477	2013-07-08 21:43:22.532477
101185	99	17	14	2013-07-08 21:43:22.533378	2013-07-08 21:43:22.533378
101186	99	24	14	2013-07-08 21:43:22.534095	2013-07-08 21:43:22.534095
101187	99	25	14	2013-07-08 21:43:22.534751	2013-07-08 21:43:22.534751
101188	99	26	14	2013-07-08 21:43:22.535497	2013-07-08 21:43:22.535497
101189	99	30	14	2013-07-08 21:43:22.536224	2013-07-08 21:43:22.536224
101190	99	31	14	2013-07-08 21:43:22.536907	2013-07-08 21:43:22.536907
101191	99	32	14	2013-07-08 21:43:22.537613	2013-07-08 21:43:22.537613
101192	99	6	15	2013-07-08 21:43:22.539698	2013-07-08 21:43:22.539698
101193	99	7	15	2013-07-08 21:43:22.540448	2013-07-08 21:43:22.540448
101194	99	8	15	2013-07-08 21:43:22.541144	2013-07-08 21:43:22.541144
101195	99	15	15	2013-07-08 21:43:22.541868	2013-07-08 21:43:22.541868
101196	99	16	15	2013-07-08 21:43:22.542848	2013-07-08 21:43:22.542848
101197	99	17	15	2013-07-08 21:43:22.543674	2013-07-08 21:43:22.543674
101198	99	24	15	2013-07-08 21:43:22.544448	2013-07-08 21:43:22.544448
101199	99	25	15	2013-07-08 21:43:22.545216	2013-07-08 21:43:22.545216
101200	99	26	15	2013-07-08 21:43:22.545925	2013-07-08 21:43:22.545925
101201	99	30	15	2013-07-08 21:43:22.546883	2013-07-08 21:43:22.546883
101202	99	31	15	2013-07-08 21:43:22.547946	2013-07-08 21:43:22.547946
101203	99	32	15	2013-07-08 21:43:22.548854	2013-07-08 21:43:22.548854
101204	99	6	16	2013-07-08 21:43:22.550531	2013-07-08 21:43:22.550531
101205	99	7	16	2013-07-08 21:43:22.551354	2013-07-08 21:43:22.551354
101206	99	8	16	2013-07-08 21:43:22.552085	2013-07-08 21:43:22.552085
101207	99	15	16	2013-07-08 21:43:22.552831	2013-07-08 21:43:22.552831
101208	99	16	16	2013-07-08 21:43:22.553544	2013-07-08 21:43:22.553544
101209	99	17	16	2013-07-08 21:43:22.554343	2013-07-08 21:43:22.554343
101210	99	24	16	2013-07-08 21:43:22.555121	2013-07-08 21:43:22.555121
101211	99	25	16	2013-07-08 21:43:22.555843	2013-07-08 21:43:22.555843
101212	99	26	16	2013-07-08 21:43:22.556568	2013-07-08 21:43:22.556568
101213	99	30	16	2013-07-08 21:43:22.557361	2013-07-08 21:43:22.557361
101214	99	31	16	2013-07-08 21:43:22.558044	2013-07-08 21:43:22.558044
101215	99	32	16	2013-07-08 21:43:22.558762	2013-07-08 21:43:22.558762
101216	99	15	17	2013-07-08 21:43:22.559599	2013-07-08 21:43:22.559599
101217	99	16	17	2013-07-08 21:43:22.560997	2013-07-08 21:43:22.560997
101218	99	17	17	2013-07-08 21:43:22.562315	2013-07-08 21:43:22.562315
101219	99	30	17	2013-07-08 21:43:22.564599	2013-07-08 21:43:22.564599
101220	99	31	17	2013-07-08 21:43:22.565735	2013-07-08 21:43:22.565735
101221	99	32	17	2013-07-08 21:43:22.566612	2013-07-08 21:43:22.566612
101222	99	15	18	2013-07-08 21:43:22.569468	2013-07-08 21:43:22.569468
101223	99	16	18	2013-07-08 21:43:22.570226	2013-07-08 21:43:22.570226
101224	99	17	18	2013-07-08 21:43:22.570975	2013-07-08 21:43:22.570975
101225	99	30	18	2013-07-08 21:43:22.573104	2013-07-08 21:43:22.573104
101226	99	31	18	2013-07-08 21:43:22.573937	2013-07-08 21:43:22.573937
101227	99	32	18	2013-07-08 21:43:22.574753	2013-07-08 21:43:22.574753
101228	99	15	19	2013-07-08 21:43:22.575574	2013-07-08 21:43:22.575574
101229	99	16	19	2013-07-08 21:43:22.576775	2013-07-08 21:43:22.576775
101230	99	17	19	2013-07-08 21:43:22.609484	2013-07-08 21:43:22.609484
101231	99	30	19	2013-07-08 21:43:22.611324	2013-07-08 21:43:22.611324
101232	99	31	19	2013-07-08 21:43:22.61209	2013-07-08 21:43:22.61209
101233	99	32	19	2013-07-08 21:43:22.612823	2013-07-08 21:43:22.612823
101234	99	15	20	2013-07-08 21:43:22.613597	2013-07-08 21:43:22.613597
101235	99	16	20	2013-07-08 21:43:22.614518	2013-07-08 21:43:22.614518
101236	99	17	20	2013-07-08 21:43:22.615418	2013-07-08 21:43:22.615418
101237	99	24	20	2013-07-08 21:43:22.616154	2013-07-08 21:43:22.616154
101238	99	25	20	2013-07-08 21:43:22.616997	2013-07-08 21:43:22.616997
101239	99	26	20	2013-07-08 21:43:22.617796	2013-07-08 21:43:22.617796
101240	99	30	20	2013-07-08 21:43:22.618666	2013-07-08 21:43:22.618666
101241	99	31	20	2013-07-08 21:43:22.619415	2013-07-08 21:43:22.619415
101242	99	32	20	2013-07-08 21:43:22.620086	2013-07-08 21:43:22.620086
101243	99	15	21	2013-07-08 21:43:22.622975	2013-07-08 21:43:22.622975
101244	99	16	21	2013-07-08 21:43:22.623706	2013-07-08 21:43:22.623706
101245	99	17	21	2013-07-08 21:43:22.624471	2013-07-08 21:43:22.624471
101246	99	24	21	2013-07-08 21:43:22.627117	2013-07-08 21:43:22.627117
101247	99	25	21	2013-07-08 21:43:22.627843	2013-07-08 21:43:22.627843
101248	99	26	21	2013-07-08 21:43:22.628519	2013-07-08 21:43:22.628519
101249	99	30	21	2013-07-08 21:43:22.629226	2013-07-08 21:43:22.629226
101250	99	31	21	2013-07-08 21:43:22.629932	2013-07-08 21:43:22.629932
101251	99	32	21	2013-07-08 21:43:22.630725	2013-07-08 21:43:22.630725
102531	102	7	2	2013-07-08 21:58:01.793795	2013-07-08 21:58:01.793795
102532	102	8	2	2013-07-08 21:58:01.794653	2013-07-08 21:58:01.794653
102533	102	9	2	2013-07-08 21:58:01.795528	2013-07-08 21:58:01.795528
102534	102	10	2	2013-07-08 21:58:01.796243	2013-07-08 21:58:01.796243
102535	102	11	2	2013-07-08 21:58:01.796961	2013-07-08 21:58:01.796961
102536	102	12	2	2013-07-08 21:58:01.797627	2013-07-08 21:58:01.797627
102537	102	3	3	2013-07-08 21:58:01.798362	2013-07-08 21:58:01.798362
102538	102	4	3	2013-07-08 21:58:01.799064	2013-07-08 21:58:01.799064
102539	102	5	3	2013-07-08 21:58:01.799723	2013-07-08 21:58:01.799723
102540	102	6	3	2013-07-08 21:58:01.800432	2013-07-08 21:58:01.800432
102541	102	7	3	2013-07-08 21:58:01.801242	2013-07-08 21:58:01.801242
102542	102	11	3	2013-07-08 21:58:01.802007	2013-07-08 21:58:01.802007
102543	102	12	3	2013-07-08 21:58:01.802724	2013-07-08 21:58:01.802724
102544	102	13	3	2013-07-08 21:58:01.803379	2013-07-08 21:58:01.803379
102545	102	14	3	2013-07-08 21:58:01.804039	2013-07-08 21:58:01.804039
102546	102	15	3	2013-07-08 21:58:01.804711	2013-07-08 21:58:01.804711
102547	102	16	3	2013-07-08 21:58:01.805389	2013-07-08 21:58:01.805389
102548	102	17	3	2013-07-08 21:58:01.806067	2013-07-08 21:58:01.806067
102549	102	18	3	2013-07-08 21:58:01.806733	2013-07-08 21:58:01.806733
102550	102	19	3	2013-07-08 21:58:01.808081	2013-07-08 21:58:01.808081
102551	102	20	3	2013-07-08 21:58:01.809359	2013-07-08 21:58:01.809359
102552	102	21	3	2013-07-08 21:58:01.81016	2013-07-08 21:58:01.81016
102553	102	22	3	2013-07-08 21:58:01.81098	2013-07-08 21:58:01.81098
102554	102	23	3	2013-07-08 21:58:01.811744	2013-07-08 21:58:01.811744
102555	102	24	3	2013-07-08 21:58:01.812594	2013-07-08 21:58:01.812594
102556	102	25	3	2013-07-08 21:58:01.813279	2013-07-08 21:58:01.813279
102557	102	26	3	2013-07-08 21:58:01.813928	2013-07-08 21:58:01.813928
102558	102	27	3	2013-07-08 21:58:01.814589	2013-07-08 21:58:01.814589
102559	102	28	3	2013-07-08 21:58:01.815298	2013-07-08 21:58:01.815298
102560	102	29	3	2013-07-08 21:58:01.815949	2013-07-08 21:58:01.815949
102561	102	30	3	2013-07-08 21:58:01.816608	2013-07-08 21:58:01.816608
102562	102	31	3	2013-07-08 21:58:01.817541	2013-07-08 21:58:01.817541
102563	102	2	4	2013-07-08 21:58:01.818476	2013-07-08 21:58:01.818476
102564	102	3	4	2013-07-08 21:58:01.819393	2013-07-08 21:58:01.819393
102565	102	31	4	2013-07-08 21:58:01.821912	2013-07-08 21:58:01.821912
102566	102	32	4	2013-07-08 21:58:01.822765	2013-07-08 21:58:01.822765
102567	102	2	5	2013-07-08 21:58:01.823583	2013-07-08 21:58:01.823583
102568	102	31	5	2013-07-08 21:58:01.82451	2013-07-08 21:58:01.82451
102569	102	32	5	2013-07-08 21:58:01.825223	2013-07-08 21:58:01.825223
102570	102	8	6	2013-07-08 21:58:01.825983	2013-07-08 21:58:01.825983
102571	102	9	6	2013-07-08 21:58:01.826703	2013-07-08 21:58:01.826703
102572	102	10	6	2013-07-08 21:58:01.827411	2013-07-08 21:58:01.827411
102573	102	11	6	2013-07-08 21:58:01.828108	2013-07-08 21:58:01.828108
102574	102	12	6	2013-07-08 21:58:01.828769	2013-07-08 21:58:01.828769
102575	102	13	6	2013-07-08 21:58:01.82942	2013-07-08 21:58:01.82942
102576	102	14	6	2013-07-08 21:58:01.830092	2013-07-08 21:58:01.830092
102577	102	20	6	2013-07-08 21:58:01.830786	2013-07-08 21:58:01.830786
102578	102	21	6	2013-07-08 21:58:01.831444	2013-07-08 21:58:01.831444
102579	102	22	6	2013-07-08 21:58:01.832127	2013-07-08 21:58:01.832127
102580	102	23	6	2013-07-08 21:58:01.832825	2013-07-08 21:58:01.832825
102581	102	24	6	2013-07-08 21:58:01.833596	2013-07-08 21:58:01.833596
102582	102	25	6	2013-07-08 21:58:01.834384	2013-07-08 21:58:01.834384
102583	102	26	6	2013-07-08 21:58:01.835074	2013-07-08 21:58:01.835074
102584	102	30	6	2013-07-08 21:58:01.835749	2013-07-08 21:58:01.835749
102585	102	31	6	2013-07-08 21:58:01.836493	2013-07-08 21:58:01.836493
102586	102	32	6	2013-07-08 21:58:01.837491	2013-07-08 21:58:01.837491
102587	102	5	7	2013-07-08 21:58:01.83829	2013-07-08 21:58:01.83829
102588	102	6	7	2013-07-08 21:58:01.839074	2013-07-08 21:58:01.839074
102589	102	7	7	2013-07-08 21:58:01.839812	2013-07-08 21:58:01.839812
102590	102	8	7	2013-07-08 21:58:01.84054	2013-07-08 21:58:01.84054
102591	102	9	7	2013-07-08 21:58:01.841204	2013-07-08 21:58:01.841204
102592	102	14	7	2013-07-08 21:58:01.841902	2013-07-08 21:58:01.841902
102593	102	15	7	2013-07-08 21:58:01.842566	2013-07-08 21:58:01.842566
102594	102	16	7	2013-07-08 21:58:01.843221	2013-07-08 21:58:01.843221
102595	102	17	7	2013-07-08 21:58:01.843877	2013-07-08 21:58:01.843877
102596	102	18	7	2013-07-08 21:58:01.844719	2013-07-08 21:58:01.844719
102597	102	19	7	2013-07-08 21:58:01.845407	2013-07-08 21:58:01.845407
102598	102	20	7	2013-07-08 21:58:01.846059	2013-07-08 21:58:01.846059
102599	102	21	7	2013-07-08 21:58:01.846706	2013-07-08 21:58:01.846706
102600	102	25	7	2013-07-08 21:58:01.847464	2013-07-08 21:58:01.847464
102601	102	26	7	2013-07-08 21:58:01.848156	2013-07-08 21:58:01.848156
102602	102	27	7	2013-07-08 21:58:01.848847	2013-07-08 21:58:01.848847
102603	102	28	7	2013-07-08 21:58:01.849545	2013-07-08 21:58:01.849545
102604	102	29	7	2013-07-08 21:58:01.850209	2013-07-08 21:58:01.850209
102605	102	30	7	2013-07-08 21:58:01.850874	2013-07-08 21:58:01.850874
102606	102	31	7	2013-07-08 21:58:01.851549	2013-07-08 21:58:01.851549
102607	102	4	8	2013-07-08 21:58:01.852221	2013-07-08 21:58:01.852221
102608	102	5	8	2013-07-08 21:58:01.852945	2013-07-08 21:58:01.852945
102609	102	14	8	2013-07-08 21:58:01.853692	2013-07-08 21:58:01.853692
102610	102	15	8	2013-07-08 21:58:01.854388	2013-07-08 21:58:01.854388
102611	102	4	9	2013-07-08 21:58:01.855256	2013-07-08 21:58:01.855256
102612	102	14	9	2013-07-08 21:58:01.856952	2013-07-08 21:58:01.856952
102613	102	15	9	2013-07-08 21:58:01.857641	2013-07-08 21:58:01.857641
102614	102	4	10	2013-07-08 21:58:01.858398	2013-07-08 21:58:01.858398
102615	102	5	10	2013-07-08 21:58:01.859049	2013-07-08 21:58:01.859049
102616	102	6	10	2013-07-08 21:58:01.859708	2013-07-08 21:58:01.859708
102617	102	7	10	2013-07-08 21:58:01.860403	2013-07-08 21:58:01.860403
102618	102	14	10	2013-07-08 21:58:01.861079	2013-07-08 21:58:01.861079
102619	102	20	10	2013-07-08 21:58:01.861756	2013-07-08 21:58:01.861756
102620	102	21	10	2013-07-08 21:58:01.862503	2013-07-08 21:58:01.862503
102621	102	22	10	2013-07-08 21:58:01.863176	2013-07-08 21:58:01.863176
102622	102	23	10	2013-07-08 21:58:01.863937	2013-07-08 21:58:01.863937
102623	102	24	10	2013-07-08 21:58:01.864619	2013-07-08 21:58:01.864619
102624	102	25	10	2013-07-08 21:58:01.865322	2013-07-08 21:58:01.865322
102625	102	26	10	2013-07-08 21:58:01.866013	2013-07-08 21:58:01.866013
102626	102	27	10	2013-07-08 21:58:01.866656	2013-07-08 21:58:01.866656
102627	102	28	10	2013-07-08 21:58:01.867446	2013-07-08 21:58:01.867446
102628	102	7	11	2013-07-08 21:58:01.868273	2013-07-08 21:58:01.868273
102629	102	8	11	2013-07-08 21:58:01.869106	2013-07-08 21:58:01.869106
102630	102	9	11	2013-07-08 21:58:01.869818	2013-07-08 21:58:01.869818
102631	102	14	11	2013-07-08 21:58:01.870498	2013-07-08 21:58:01.870498
102632	102	20	11	2013-07-08 21:58:01.871148	2013-07-08 21:58:01.871148
102633	102	21	11	2013-07-08 21:58:01.871905	2013-07-08 21:58:01.871905
102634	102	24	11	2013-07-08 21:58:01.872603	2013-07-08 21:58:01.872603
102635	102	25	11	2013-07-08 21:58:01.873437	2013-07-08 21:58:01.873437
102636	102	26	11	2013-07-08 21:58:01.874373	2013-07-08 21:58:01.874373
102637	102	27	11	2013-07-08 21:58:01.875331	2013-07-08 21:58:01.875331
102638	102	28	11	2013-07-08 21:58:01.876051	2013-07-08 21:58:01.876051
102639	102	29	11	2013-07-08 21:58:01.876761	2013-07-08 21:58:01.876761
102640	102	9	12	2013-07-08 21:58:01.877472	2013-07-08 21:58:01.877472
102641	102	14	12	2013-07-08 21:58:01.878251	2013-07-08 21:58:01.878251
102642	102	15	12	2013-07-08 21:58:01.878989	2013-07-08 21:58:01.878989
102643	102	19	12	2013-07-08 21:58:01.879751	2013-07-08 21:58:01.879751
102644	102	20	12	2013-07-08 21:58:01.880608	2013-07-08 21:58:01.880608
102645	102	29	12	2013-07-08 21:58:01.8814	2013-07-08 21:58:01.8814
102646	102	30	12	2013-07-08 21:58:01.882107	2013-07-08 21:58:01.882107
102647	102	31	12	2013-07-08 21:58:01.882811	2013-07-08 21:58:01.882811
102648	102	9	13	2013-07-08 21:58:01.884679	2013-07-08 21:58:01.884679
102649	102	10	13	2013-07-08 21:58:01.885827	2013-07-08 21:58:01.885827
102650	102	15	13	2013-07-08 21:58:01.887011	2013-07-08 21:58:01.887011
102651	102	19	13	2013-07-08 21:58:01.888042	2013-07-08 21:58:01.888042
102652	102	20	13	2013-07-08 21:58:01.889394	2013-07-08 21:58:01.889394
102653	102	27	13	2013-07-08 21:58:01.89174	2013-07-08 21:58:01.89174
102654	102	28	13	2013-07-08 21:58:01.892483	2013-07-08 21:58:01.892483
102655	102	29	13	2013-07-08 21:58:01.893183	2013-07-08 21:58:01.893183
102656	102	30	13	2013-07-08 21:58:01.893832	2013-07-08 21:58:01.893832
102657	102	31	13	2013-07-08 21:58:01.894569	2013-07-08 21:58:01.894569
102658	102	8	14	2013-07-08 21:58:01.895466	2013-07-08 21:58:01.895466
102659	102	9	14	2013-07-08 21:58:01.896269	2013-07-08 21:58:01.896269
102660	102	19	14	2013-07-08 21:58:01.896975	2013-07-08 21:58:01.896975
102661	102	20	14	2013-07-08 21:58:01.897709	2013-07-08 21:58:01.897709
102662	102	27	14	2013-07-08 21:58:01.898403	2013-07-08 21:58:01.898403
102663	102	28	14	2013-07-08 21:58:01.899056	2013-07-08 21:58:01.899056
102664	102	7	15	2013-07-08 21:58:01.899776	2013-07-08 21:58:01.899776
102665	102	8	15	2013-07-08 21:58:01.90044	2013-07-08 21:58:01.90044
102666	102	19	15	2013-07-08 21:58:01.901149	2013-07-08 21:58:01.901149
102667	102	20	15	2013-07-08 21:58:01.902066	2013-07-08 21:58:01.902066
102668	102	26	15	2013-07-08 21:58:01.903009	2013-07-08 21:58:01.903009
102669	102	27	15	2013-07-08 21:58:01.903928	2013-07-08 21:58:01.903928
102670	102	4	16	2013-07-08 21:58:01.905098	2013-07-08 21:58:01.905098
102671	102	5	16	2013-07-08 21:58:01.905904	2013-07-08 21:58:01.905904
102672	102	6	16	2013-07-08 21:58:01.907074	2013-07-08 21:58:01.907074
102673	102	7	16	2013-07-08 21:58:01.908123	2013-07-08 21:58:01.908123
102674	102	8	16	2013-07-08 21:58:01.908891	2013-07-08 21:58:01.908891
102675	102	9	16	2013-07-08 21:58:01.90977	2013-07-08 21:58:01.90977
102676	102	17	16	2013-07-08 21:58:01.910537	2013-07-08 21:58:01.910537
102677	102	18	16	2013-07-08 21:58:01.911227	2013-07-08 21:58:01.911227
102678	102	19	16	2013-07-08 21:58:01.91187	2013-07-08 21:58:01.91187
102679	102	20	16	2013-07-08 21:58:01.912536	2013-07-08 21:58:01.912536
102680	102	26	16	2013-07-08 21:58:01.913241	2013-07-08 21:58:01.913241
102681	102	27	16	2013-07-08 21:58:01.913928	2013-07-08 21:58:01.913928
102682	102	5	17	2013-07-08 21:58:01.914673	2013-07-08 21:58:01.914673
102683	102	6	17	2013-07-08 21:58:01.915415	2013-07-08 21:58:01.915415
102684	102	9	17	2013-07-08 21:58:01.91609	2013-07-08 21:58:01.91609
102685	102	10	17	2013-07-08 21:58:01.917054	2013-07-08 21:58:01.917054
102686	102	11	17	2013-07-08 21:58:01.917986	2013-07-08 21:58:01.917986
102687	102	14	17	2013-07-08 21:58:01.918691	2013-07-08 21:58:01.918691
102688	102	15	17	2013-07-08 21:58:01.919503	2013-07-08 21:58:01.919503
102689	102	16	17	2013-07-08 21:58:01.920258	2013-07-08 21:58:01.920258
102690	102	17	17	2013-07-08 21:58:01.921312	2013-07-08 21:58:01.921312
102691	102	18	17	2013-07-08 21:58:01.922194	2013-07-08 21:58:01.922194
102692	102	26	17	2013-07-08 21:58:01.922918	2013-07-08 21:58:01.922918
102693	102	27	17	2013-07-08 21:58:01.923592	2013-07-08 21:58:01.923592
102694	102	3	18	2013-07-08 21:58:01.924367	2013-07-08 21:58:01.924367
102695	102	4	18	2013-07-08 21:58:01.925211	2013-07-08 21:58:01.925211
102696	102	5	18	2013-07-08 21:58:01.926164	2013-07-08 21:58:01.926164
102697	102	11	18	2013-07-08 21:58:01.926915	2013-07-08 21:58:01.926915
102698	102	12	18	2013-07-08 21:58:01.927708	2013-07-08 21:58:01.927708
102699	102	13	18	2013-07-08 21:58:01.92855	2013-07-08 21:58:01.92855
102700	102	14	18	2013-07-08 21:58:01.929313	2013-07-08 21:58:01.929313
102701	102	15	18	2013-07-08 21:58:01.929969	2013-07-08 21:58:01.929969
102702	102	27	18	2013-07-08 21:58:01.93068	2013-07-08 21:58:01.93068
102703	102	28	18	2013-07-08 21:58:01.931407	2013-07-08 21:58:01.931407
102704	102	3	19	2013-07-08 21:58:01.93298	2013-07-08 21:58:01.93298
102705	102	4	19	2013-07-08 21:58:01.933663	2013-07-08 21:58:01.933663
102706	102	14	19	2013-07-08 21:58:01.935847	2013-07-08 21:58:01.935847
102707	102	15	19	2013-07-08 21:58:01.937138	2013-07-08 21:58:01.937138
102708	102	27	19	2013-07-08 21:58:01.938135	2013-07-08 21:58:01.938135
102709	102	28	19	2013-07-08 21:58:01.93889	2013-07-08 21:58:01.93889
102710	102	27	20	2013-07-08 21:58:01.939659	2013-07-08 21:58:01.939659
102711	102	28	20	2013-07-08 21:58:01.94033	2013-07-08 21:58:01.94033
102712	102	27	21	2013-07-08 21:58:01.942117	2013-07-08 21:58:01.942117
102713	102	28	21	2013-07-08 21:58:01.942873	2013-07-08 21:58:01.942873
102742	103	0	3	2013-07-08 22:50:13.908855	2013-07-08 22:50:13.908855
102743	103	1	3	2013-07-08 22:50:13.909735	2013-07-08 22:50:13.909735
102744	103	2	3	2013-07-08 22:50:13.910396	2013-07-08 22:50:13.910396
102745	103	3	3	2013-07-08 22:50:13.911062	2013-07-08 22:50:13.911062
102746	103	4	3	2013-07-08 22:50:13.911846	2013-07-08 22:50:13.911846
102747	103	5	3	2013-07-08 22:50:13.912643	2013-07-08 22:50:13.912643
102748	103	6	3	2013-07-08 22:50:13.913354	2013-07-08 22:50:13.913354
102749	103	7	3	2013-07-08 22:50:13.914012	2013-07-08 22:50:13.914012
102750	103	8	3	2013-07-08 22:50:13.914681	2013-07-08 22:50:13.914681
102751	103	9	3	2013-07-08 22:50:13.915434	2013-07-08 22:50:13.915434
102752	103	10	3	2013-07-08 22:50:13.91615	2013-07-08 22:50:13.91615
102753	103	11	3	2013-07-08 22:50:13.916839	2013-07-08 22:50:13.916839
102754	103	12	3	2013-07-08 22:50:13.917502	2013-07-08 22:50:13.917502
102755	103	13	3	2013-07-08 22:50:13.918163	2013-07-08 22:50:13.918163
102756	103	14	3	2013-07-08 22:50:13.918807	2013-07-08 22:50:13.918807
102757	103	15	3	2013-07-08 22:50:13.91947	2013-07-08 22:50:13.91947
102758	103	16	3	2013-07-08 22:50:13.92019	2013-07-08 22:50:13.92019
102759	103	17	3	2013-07-08 22:50:13.920974	2013-07-08 22:50:13.920974
102760	103	18	3	2013-07-08 22:50:13.921654	2013-07-08 22:50:13.921654
102761	103	19	3	2013-07-08 22:50:13.922315	2013-07-08 22:50:13.922315
102762	103	20	3	2013-07-08 22:50:13.922984	2013-07-08 22:50:13.922984
102763	103	21	3	2013-07-08 22:50:13.923633	2013-07-08 22:50:13.923633
102764	103	22	3	2013-07-08 22:50:13.924288	2013-07-08 22:50:13.924288
102765	103	23	3	2013-07-08 22:50:13.924984	2013-07-08 22:50:13.924984
102766	103	24	3	2013-07-08 22:50:13.925622	2013-07-08 22:50:13.925622
102767	103	25	3	2013-07-08 22:50:13.926281	2013-07-08 22:50:13.926281
102768	103	26	3	2013-07-08 22:50:13.926936	2013-07-08 22:50:13.926936
102769	103	27	3	2013-07-08 22:50:13.927718	2013-07-08 22:50:13.927718
102770	103	28	3	2013-07-08 22:50:13.928389	2013-07-08 22:50:13.928389
102771	103	29	3	2013-07-08 22:50:13.929052	2013-07-08 22:50:13.929052
102772	103	30	3	2013-07-08 22:50:13.929731	2013-07-08 22:50:13.929731
102773	103	31	3	2013-07-08 22:50:13.930388	2013-07-08 22:50:13.930388
102774	103	32	3	2013-07-08 22:50:13.931038	2013-07-08 22:50:13.931038
102775	103	33	3	2013-07-08 22:50:13.931679	2013-07-08 22:50:13.931679
102776	103	34	3	2013-07-08 22:50:13.932603	2013-07-08 22:50:13.932603
102777	103	35	3	2013-07-08 22:50:13.933447	2013-07-08 22:50:13.933447
102778	103	0	4	2013-07-08 22:50:13.934241	2013-07-08 22:50:13.934241
102779	103	4	4	2013-07-08 22:50:13.934931	2013-07-08 22:50:13.934931
102780	103	6	4	2013-07-08 22:50:13.935585	2013-07-08 22:50:13.935585
102781	103	8	4	2013-07-08 22:50:13.936288	2013-07-08 22:50:13.936288
102782	103	9	4	2013-07-08 22:50:13.936954	2013-07-08 22:50:13.936954
102783	103	10	4	2013-07-08 22:50:13.937621	2013-07-08 22:50:13.937621
102784	103	12	4	2013-07-08 22:50:13.938366	2013-07-08 22:50:13.938366
102785	103	13	4	2013-07-08 22:50:13.939031	2013-07-08 22:50:13.939031
102786	103	14	4	2013-07-08 22:50:13.939709	2013-07-08 22:50:13.939709
102787	103	15	4	2013-07-08 22:50:13.940376	2013-07-08 22:50:13.940376
102788	103	16	4	2013-07-08 22:50:13.941043	2013-07-08 22:50:13.941043
102789	103	17	4	2013-07-08 22:50:13.941683	2013-07-08 22:50:13.941683
102790	103	21	4	2013-07-08 22:50:13.942367	2013-07-08 22:50:13.942367
102791	103	22	4	2013-07-08 22:50:13.943211	2013-07-08 22:50:13.943211
102792	103	26	4	2013-07-08 22:50:13.943906	2013-07-08 22:50:13.943906
102793	103	27	4	2013-07-08 22:50:13.944569	2013-07-08 22:50:13.944569
102794	103	28	4	2013-07-08 22:50:13.945352	2013-07-08 22:50:13.945352
102795	103	29	4	2013-07-08 22:50:13.946096	2013-07-08 22:50:13.946096
102796	103	30	4	2013-07-08 22:50:13.946741	2013-07-08 22:50:13.946741
102797	103	31	4	2013-07-08 22:50:13.947578	2013-07-08 22:50:13.947578
102798	103	32	4	2013-07-08 22:50:13.948316	2013-07-08 22:50:13.948316
102799	103	33	4	2013-07-08 22:50:13.948981	2013-07-08 22:50:13.948981
102800	103	34	4	2013-07-08 22:50:13.949638	2013-07-08 22:50:13.949638
102801	103	35	4	2013-07-08 22:50:13.950278	2013-07-08 22:50:13.950278
102802	103	0	5	2013-07-08 22:50:13.95093	2013-07-08 22:50:13.95093
102803	103	1	5	2013-07-08 22:50:13.951621	2013-07-08 22:50:13.951621
102804	103	3	5	2013-07-08 22:50:13.952277	2013-07-08 22:50:13.952277
102805	103	4	5	2013-07-08 22:50:13.952935	2013-07-08 22:50:13.952935
102806	103	6	5	2013-07-08 22:50:13.95372	2013-07-08 22:50:13.95372
102807	103	8	5	2013-07-08 22:50:13.954377	2013-07-08 22:50:13.954377
102808	103	9	5	2013-07-08 22:50:13.95512	2013-07-08 22:50:13.95512
102809	103	10	5	2013-07-08 22:50:13.955771	2013-07-08 22:50:13.955771
102810	103	12	5	2013-07-08 22:50:13.956477	2013-07-08 22:50:13.956477
102811	103	13	5	2013-07-08 22:50:13.957151	2013-07-08 22:50:13.957151
102812	103	14	5	2013-07-08 22:50:13.957925	2013-07-08 22:50:13.957925
102813	103	15	5	2013-07-08 22:50:13.958605	2013-07-08 22:50:13.958605
102814	103	16	5	2013-07-08 22:50:13.959255	2013-07-08 22:50:13.959255
102815	103	17	5	2013-07-08 22:50:13.959954	2013-07-08 22:50:13.959954
102816	103	19	5	2013-07-08 22:50:13.96067	2013-07-08 22:50:13.96067
102817	103	20	5	2013-07-08 22:50:13.961315	2013-07-08 22:50:13.961315
102818	103	22	5	2013-07-08 22:50:13.962156	2013-07-08 22:50:13.962156
102819	103	24	5	2013-07-08 22:50:13.963012	2013-07-08 22:50:13.963012
102820	103	25	5	2013-07-08 22:50:13.963812	2013-07-08 22:50:13.963812
102821	103	26	5	2013-07-08 22:50:13.964485	2013-07-08 22:50:13.964485
102822	103	27	5	2013-07-08 22:50:13.96515	2013-07-08 22:50:13.96515
102823	103	28	5	2013-07-08 22:50:13.965833	2013-07-08 22:50:13.965833
102824	103	29	5	2013-07-08 22:50:13.966509	2013-07-08 22:50:13.966509
102825	103	30	5	2013-07-08 22:50:13.967205	2013-07-08 22:50:13.967205
102826	103	31	5	2013-07-08 22:50:13.967881	2013-07-08 22:50:13.967881
102827	103	32	5	2013-07-08 22:50:13.968545	2013-07-08 22:50:13.968545
102828	103	33	5	2013-07-08 22:50:13.969235	2013-07-08 22:50:13.969235
102829	103	34	5	2013-07-08 22:50:13.970075	2013-07-08 22:50:13.970075
102830	103	35	5	2013-07-08 22:50:13.97073	2013-07-08 22:50:13.97073
102831	103	0	6	2013-07-08 22:50:13.971394	2013-07-08 22:50:13.971394
102832	103	1	6	2013-07-08 22:50:13.972037	2013-07-08 22:50:13.972037
102833	103	3	6	2013-07-08 22:50:13.972779	2013-07-08 22:50:13.972779
102834	103	4	6	2013-07-08 22:50:13.973468	2013-07-08 22:50:13.973468
102835	103	5	6	2013-07-08 22:50:13.974246	2013-07-08 22:50:13.974246
102836	103	6	6	2013-07-08 22:50:13.975084	2013-07-08 22:50:13.975084
102837	103	8	6	2013-07-08 22:50:13.975884	2013-07-08 22:50:13.975884
102838	103	9	6	2013-07-08 22:50:13.97665	2013-07-08 22:50:13.97665
102839	103	10	6	2013-07-08 22:50:13.977349	2013-07-08 22:50:13.977349
102840	103	12	6	2013-07-08 22:50:13.978151	2013-07-08 22:50:13.978151
102841	103	13	6	2013-07-08 22:50:13.978935	2013-07-08 22:50:13.978935
102842	103	14	6	2013-07-08 22:50:13.979748	2013-07-08 22:50:13.979748
102843	103	15	6	2013-07-08 22:50:13.980568	2013-07-08 22:50:13.980568
102844	103	16	6	2013-07-08 22:50:13.981373	2013-07-08 22:50:13.981373
102845	103	17	6	2013-07-08 22:50:13.982051	2013-07-08 22:50:13.982051
102846	103	21	6	2013-07-08 22:50:13.982699	2013-07-08 22:50:13.982699
102847	103	22	6	2013-07-08 22:50:13.983407	2013-07-08 22:50:13.983407
102848	103	25	6	2013-07-08 22:50:13.984068	2013-07-08 22:50:13.984068
102849	103	26	6	2013-07-08 22:50:13.98471	2013-07-08 22:50:13.98471
102850	103	27	6	2013-07-08 22:50:13.985378	2013-07-08 22:50:13.985378
102851	103	28	6	2013-07-08 22:50:13.986093	2013-07-08 22:50:13.986093
102852	103	29	6	2013-07-08 22:50:13.987065	2013-07-08 22:50:13.987065
102853	103	30	6	2013-07-08 22:50:13.987813	2013-07-08 22:50:13.987813
102854	103	31	6	2013-07-08 22:50:13.988461	2013-07-08 22:50:13.988461
102855	103	32	6	2013-07-08 22:50:13.989127	2013-07-08 22:50:13.989127
102856	103	33	6	2013-07-08 22:50:13.989961	2013-07-08 22:50:13.989961
102857	103	34	6	2013-07-08 22:50:13.99098	2013-07-08 22:50:13.99098
102858	103	35	6	2013-07-08 22:50:13.991769	2013-07-08 22:50:13.991769
102859	103	0	7	2013-07-08 22:50:13.992517	2013-07-08 22:50:13.992517
102860	103	1	7	2013-07-08 22:50:13.993292	2013-07-08 22:50:13.993292
102861	103	3	7	2013-07-08 22:50:13.99397	2013-07-08 22:50:13.99397
102862	103	4	7	2013-07-08 22:50:13.994619	2013-07-08 22:50:13.994619
102863	103	5	7	2013-07-08 22:50:13.995289	2013-07-08 22:50:13.995289
102864	103	6	7	2013-07-08 22:50:13.995975	2013-07-08 22:50:13.995975
102865	103	8	7	2013-07-08 22:50:13.996866	2013-07-08 22:50:13.996866
102866	103	9	7	2013-07-08 22:50:13.997727	2013-07-08 22:50:13.997727
102867	103	10	7	2013-07-08 22:50:13.998415	2013-07-08 22:50:13.998415
102868	103	12	7	2013-07-08 22:50:13.99929	2013-07-08 22:50:13.99929
102869	103	13	7	2013-07-08 22:50:13.999965	2013-07-08 22:50:13.999965
102870	103	14	7	2013-07-08 22:50:14.000635	2013-07-08 22:50:14.000635
102871	103	15	7	2013-07-08 22:50:14.001366	2013-07-08 22:50:14.001366
102872	103	16	7	2013-07-08 22:50:14.002063	2013-07-08 22:50:14.002063
102873	103	17	7	2013-07-08 22:50:14.002796	2013-07-08 22:50:14.002796
102874	103	19	7	2013-07-08 22:50:14.00348	2013-07-08 22:50:14.00348
102875	103	20	7	2013-07-08 22:50:14.00415	2013-07-08 22:50:14.00415
102876	103	22	7	2013-07-08 22:50:14.004813	2013-07-08 22:50:14.004813
102877	103	24	7	2013-07-08 22:50:14.005478	2013-07-08 22:50:14.005478
102878	103	25	7	2013-07-08 22:50:14.006275	2013-07-08 22:50:14.006275
102879	103	26	7	2013-07-08 22:50:14.007059	2013-07-08 22:50:14.007059
102880	103	27	7	2013-07-08 22:50:14.007794	2013-07-08 22:50:14.007794
102881	103	28	7	2013-07-08 22:50:14.008463	2013-07-08 22:50:14.008463
102882	103	29	7	2013-07-08 22:50:14.009104	2013-07-08 22:50:14.009104
102883	103	30	7	2013-07-08 22:50:14.009819	2013-07-08 22:50:14.009819
102884	103	31	7	2013-07-08 22:50:14.010506	2013-07-08 22:50:14.010506
102885	103	32	7	2013-07-08 22:50:14.011304	2013-07-08 22:50:14.011304
102886	103	33	7	2013-07-08 22:50:14.01197	2013-07-08 22:50:14.01197
102887	103	34	7	2013-07-08 22:50:14.01261	2013-07-08 22:50:14.01261
102888	103	35	7	2013-07-08 22:50:14.013267	2013-07-08 22:50:14.013267
102889	103	0	8	2013-07-08 22:50:14.013939	2013-07-08 22:50:14.013939
102890	103	4	8	2013-07-08 22:50:14.014921	2013-07-08 22:50:14.014921
102891	103	5	8	2013-07-08 22:50:14.015605	2013-07-08 22:50:14.015605
102892	103	6	8	2013-07-08 22:50:14.01631	2013-07-08 22:50:14.01631
102893	103	10	8	2013-07-08 22:50:14.017285	2013-07-08 22:50:14.017285
102894	103	14	8	2013-07-08 22:50:14.018054	2013-07-08 22:50:14.018054
102895	103	15	8	2013-07-08 22:50:14.018791	2013-07-08 22:50:14.018791
102896	103	16	8	2013-07-08 22:50:14.019832	2013-07-08 22:50:14.019832
102897	103	17	8	2013-07-08 22:50:14.020712	2013-07-08 22:50:14.020712
102898	103	21	8	2013-07-08 22:50:14.021451	2013-07-08 22:50:14.021451
102899	103	22	8	2013-07-08 22:50:14.022166	2013-07-08 22:50:14.022166
102900	103	26	8	2013-07-08 22:50:14.022997	2013-07-08 22:50:14.022997
102901	103	27	8	2013-07-08 22:50:14.02383	2013-07-08 22:50:14.02383
102902	103	28	8	2013-07-08 22:50:14.024538	2013-07-08 22:50:14.024538
102903	103	29	8	2013-07-08 22:50:14.025209	2013-07-08 22:50:14.025209
102904	103	30	8	2013-07-08 22:50:14.025873	2013-07-08 22:50:14.025873
102905	103	31	8	2013-07-08 22:50:14.026519	2013-07-08 22:50:14.026519
102906	103	32	8	2013-07-08 22:50:14.02721	2013-07-08 22:50:14.02721
102907	103	33	8	2013-07-08 22:50:14.027874	2013-07-08 22:50:14.027874
102908	103	34	8	2013-07-08 22:50:14.02875	2013-07-08 22:50:14.02875
102909	103	35	8	2013-07-08 22:50:14.029481	2013-07-08 22:50:14.029481
102910	103	0	9	2013-07-08 22:50:14.030128	2013-07-08 22:50:14.030128
102911	103	1	9	2013-07-08 22:50:14.030805	2013-07-08 22:50:14.030805
102912	103	2	9	2013-07-08 22:50:14.03153	2013-07-08 22:50:14.03153
102913	103	3	9	2013-07-08 22:50:14.032237	2013-07-08 22:50:14.032237
102914	103	4	9	2013-07-08 22:50:14.033007	2013-07-08 22:50:14.033007
102915	103	5	9	2013-07-08 22:50:14.033695	2013-07-08 22:50:14.033695
102916	103	6	9	2013-07-08 22:50:14.034357	2013-07-08 22:50:14.034357
102917	103	7	9	2013-07-08 22:50:14.035019	2013-07-08 22:50:14.035019
102918	103	8	9	2013-07-08 22:50:14.035677	2013-07-08 22:50:14.035677
102919	103	9	9	2013-07-08 22:50:14.036351	2013-07-08 22:50:14.036351
102920	103	10	9	2013-07-08 22:50:14.037048	2013-07-08 22:50:14.037048
102921	103	11	9	2013-07-08 22:50:14.037723	2013-07-08 22:50:14.037723
102922	103	12	9	2013-07-08 22:50:14.038372	2013-07-08 22:50:14.038372
102923	103	13	9	2013-07-08 22:50:14.039116	2013-07-08 22:50:14.039116
102924	103	14	9	2013-07-08 22:50:14.039799	2013-07-08 22:50:14.039799
102925	103	15	9	2013-07-08 22:50:14.040595	2013-07-08 22:50:14.040595
102926	103	16	9	2013-07-08 22:50:14.041607	2013-07-08 22:50:14.041607
102927	103	17	9	2013-07-08 22:50:14.042478	2013-07-08 22:50:14.042478
102928	103	18	9	2013-07-08 22:50:14.04328	2013-07-08 22:50:14.04328
102929	103	19	9	2013-07-08 22:50:14.044072	2013-07-08 22:50:14.044072
102930	103	20	9	2013-07-08 22:50:14.044859	2013-07-08 22:50:14.044859
102931	103	21	9	2013-07-08 22:50:14.04567	2013-07-08 22:50:14.04567
102932	103	22	9	2013-07-08 22:50:14.046491	2013-07-08 22:50:14.046491
102933	103	23	9	2013-07-08 22:50:14.047405	2013-07-08 22:50:14.047405
102934	103	24	9	2013-07-08 22:50:14.048235	2013-07-08 22:50:14.048235
102935	103	25	9	2013-07-08 22:50:14.049034	2013-07-08 22:50:14.049034
102936	103	26	9	2013-07-08 22:50:14.049829	2013-07-08 22:50:14.049829
102937	103	27	9	2013-07-08 22:50:14.050561	2013-07-08 22:50:14.050561
102938	103	28	9	2013-07-08 22:50:14.051385	2013-07-08 22:50:14.051385
102939	103	29	9	2013-07-08 22:50:14.052424	2013-07-08 22:50:14.052424
102940	103	30	9	2013-07-08 22:50:14.053745	2013-07-08 22:50:14.053745
102941	103	31	9	2013-07-08 22:50:14.054657	2013-07-08 22:50:14.054657
102942	103	32	9	2013-07-08 22:50:14.055428	2013-07-08 22:50:14.055428
102943	103	33	9	2013-07-08 22:50:14.056379	2013-07-08 22:50:14.056379
102944	103	34	9	2013-07-08 22:50:14.057349	2013-07-08 22:50:14.057349
102945	103	35	9	2013-07-08 22:50:14.058375	2013-07-08 22:50:14.058375
102946	103	0	10	2013-07-08 22:50:14.059341	2013-07-08 22:50:14.059341
102947	103	1	10	2013-07-08 22:50:14.060162	2013-07-08 22:50:14.060162
102948	103	2	10	2013-07-08 22:50:14.060999	2013-07-08 22:50:14.060999
102949	103	3	10	2013-07-08 22:50:14.061932	2013-07-08 22:50:14.061932
102950	103	4	10	2013-07-08 22:50:14.062752	2013-07-08 22:50:14.062752
102951	103	5	10	2013-07-08 22:50:14.063674	2013-07-08 22:50:14.063674
102952	103	6	10	2013-07-08 22:50:14.064512	2013-07-08 22:50:14.064512
102953	103	7	10	2013-07-08 22:50:14.065386	2013-07-08 22:50:14.065386
102954	103	8	10	2013-07-08 22:50:14.066233	2013-07-08 22:50:14.066233
102955	103	9	10	2013-07-08 22:50:14.06696	2013-07-08 22:50:14.06696
102956	103	10	10	2013-07-08 22:50:14.067736	2013-07-08 22:50:14.067736
102957	103	11	10	2013-07-08 22:50:14.068446	2013-07-08 22:50:14.068446
102958	103	12	10	2013-07-08 22:50:14.069155	2013-07-08 22:50:14.069155
102959	103	13	10	2013-07-08 22:50:14.06997	2013-07-08 22:50:14.06997
102960	103	14	10	2013-07-08 22:50:14.070649	2013-07-08 22:50:14.070649
102961	103	15	10	2013-07-08 22:50:14.07142	2013-07-08 22:50:14.07142
102962	103	16	10	2013-07-08 22:50:14.072186	2013-07-08 22:50:14.072186
102963	103	17	10	2013-07-08 22:50:14.073658	2013-07-08 22:50:14.073658
102964	103	18	10	2013-07-08 22:50:14.075097	2013-07-08 22:50:14.075097
102965	103	19	10	2013-07-08 22:50:14.076541	2013-07-08 22:50:14.076541
102966	103	20	10	2013-07-08 22:50:14.077685	2013-07-08 22:50:14.077685
102967	103	21	10	2013-07-08 22:50:14.07859	2013-07-08 22:50:14.07859
102968	103	22	10	2013-07-08 22:50:14.079504	2013-07-08 22:50:14.079504
102969	103	23	10	2013-07-08 22:50:14.080293	2013-07-08 22:50:14.080293
102970	103	24	10	2013-07-08 22:50:14.081182	2013-07-08 22:50:14.081182
102971	103	25	10	2013-07-08 22:50:14.082717	2013-07-08 22:50:14.082717
102972	103	26	10	2013-07-08 22:50:14.084002	2013-07-08 22:50:14.084002
102973	103	27	10	2013-07-08 22:50:14.085418	2013-07-08 22:50:14.085418
102974	103	28	10	2013-07-08 22:50:14.08659	2013-07-08 22:50:14.08659
102975	103	29	10	2013-07-08 22:50:14.087939	2013-07-08 22:50:14.087939
102976	103	30	10	2013-07-08 22:50:14.088843	2013-07-08 22:50:14.088843
102977	103	31	10	2013-07-08 22:50:14.089669	2013-07-08 22:50:14.089669
102978	103	32	10	2013-07-08 22:50:14.091116	2013-07-08 22:50:14.091116
102979	103	33	10	2013-07-08 22:50:14.092163	2013-07-08 22:50:14.092163
102980	103	34	10	2013-07-08 22:50:14.093083	2013-07-08 22:50:14.093083
102981	103	35	10	2013-07-08 22:50:14.093881	2013-07-08 22:50:14.093881
102982	103	0	11	2013-07-08 22:50:14.094651	2013-07-08 22:50:14.094651
102983	103	1	11	2013-07-08 22:50:14.09543	2013-07-08 22:50:14.09543
102984	103	2	11	2013-07-08 22:50:14.096148	2013-07-08 22:50:14.096148
102985	103	3	11	2013-07-08 22:50:14.096874	2013-07-08 22:50:14.096874
102986	103	4	11	2013-07-08 22:50:14.097573	2013-07-08 22:50:14.097573
102987	103	5	11	2013-07-08 22:50:14.098319	2013-07-08 22:50:14.098319
102988	103	6	11	2013-07-08 22:50:14.098997	2013-07-08 22:50:14.098997
102989	103	7	11	2013-07-08 22:50:14.099678	2013-07-08 22:50:14.099678
102990	103	8	11	2013-07-08 22:50:14.100368	2013-07-08 22:50:14.100368
102991	103	9	11	2013-07-08 22:50:14.101046	2013-07-08 22:50:14.101046
102992	103	10	11	2013-07-08 22:50:14.101737	2013-07-08 22:50:14.101737
102993	103	11	11	2013-07-08 22:50:14.102463	2013-07-08 22:50:14.102463
102994	103	12	11	2013-07-08 22:50:14.103333	2013-07-08 22:50:14.103333
102995	103	13	11	2013-07-08 22:50:14.104091	2013-07-08 22:50:14.104091
102996	103	14	11	2013-07-08 22:50:14.104842	2013-07-08 22:50:14.104842
102997	103	15	11	2013-07-08 22:50:14.105599	2013-07-08 22:50:14.105599
102998	103	16	11	2013-07-08 22:50:14.106541	2013-07-08 22:50:14.106541
102999	103	17	11	2013-07-08 22:50:14.107766	2013-07-08 22:50:14.107766
103000	103	18	11	2013-07-08 22:50:14.108639	2013-07-08 22:50:14.108639
103001	103	19	11	2013-07-08 22:50:14.109434	2013-07-08 22:50:14.109434
103002	103	20	11	2013-07-08 22:50:14.110198	2013-07-08 22:50:14.110198
103003	103	21	11	2013-07-08 22:50:14.111121	2013-07-08 22:50:14.111121
103004	103	22	11	2013-07-08 22:50:14.11207	2013-07-08 22:50:14.11207
103005	103	23	11	2013-07-08 22:50:14.113205	2013-07-08 22:50:14.113205
103006	103	24	11	2013-07-08 22:50:14.114027	2013-07-08 22:50:14.114027
103007	103	25	11	2013-07-08 22:50:14.114737	2013-07-08 22:50:14.114737
103008	103	26	11	2013-07-08 22:50:14.115595	2013-07-08 22:50:14.115595
103009	103	27	11	2013-07-08 22:50:14.116313	2013-07-08 22:50:14.116313
103010	103	28	11	2013-07-08 22:50:14.117036	2013-07-08 22:50:14.117036
103011	103	29	11	2013-07-08 22:50:14.11783	2013-07-08 22:50:14.11783
103012	103	30	11	2013-07-08 22:50:14.118524	2013-07-08 22:50:14.118524
103013	103	31	11	2013-07-08 22:50:14.119315	2013-07-08 22:50:14.119315
103014	103	32	11	2013-07-08 22:50:14.120111	2013-07-08 22:50:14.120111
103015	103	33	11	2013-07-08 22:50:14.120813	2013-07-08 22:50:14.120813
103016	103	34	11	2013-07-08 22:50:14.121509	2013-07-08 22:50:14.121509
103017	103	35	11	2013-07-08 22:50:14.12224	2013-07-08 22:50:14.12224
103018	103	0	12	2013-07-08 22:50:14.123122	2013-07-08 22:50:14.123122
103019	103	4	12	2013-07-08 22:50:14.124412	2013-07-08 22:50:14.124412
103020	103	5	12	2013-07-08 22:50:14.125311	2013-07-08 22:50:14.125311
103021	103	6	12	2013-07-08 22:50:14.12606	2013-07-08 22:50:14.12606
103022	103	9	12	2013-07-08 22:50:14.126914	2013-07-08 22:50:14.126914
103023	103	10	12	2013-07-08 22:50:14.127972	2013-07-08 22:50:14.127972
103024	103	14	12	2013-07-08 22:50:14.128734	2013-07-08 22:50:14.128734
103025	103	15	12	2013-07-08 22:50:14.129438	2013-07-08 22:50:14.129438
103026	103	17	12	2013-07-08 22:50:14.130111	2013-07-08 22:50:14.130111
103027	103	18	12	2013-07-08 22:50:14.13084	2013-07-08 22:50:14.13084
103028	103	20	12	2013-07-08 22:50:14.131587	2013-07-08 22:50:14.131587
103029	103	21	12	2013-07-08 22:50:14.132273	2013-07-08 22:50:14.132273
103030	103	22	12	2013-07-08 22:50:14.133027	2013-07-08 22:50:14.133027
103031	103	23	12	2013-07-08 22:50:14.133743	2013-07-08 22:50:14.133743
103032	103	24	12	2013-07-08 22:50:14.134414	2013-07-08 22:50:14.134414
103033	103	25	12	2013-07-08 22:50:14.135266	2013-07-08 22:50:14.135266
103034	103	26	12	2013-07-08 22:50:14.136129	2013-07-08 22:50:14.136129
103035	103	27	12	2013-07-08 22:50:14.136924	2013-07-08 22:50:14.136924
103036	103	28	12	2013-07-08 22:50:14.137698	2013-07-08 22:50:14.137698
103037	103	29	12	2013-07-08 22:50:14.138413	2013-07-08 22:50:14.138413
103038	103	30	12	2013-07-08 22:50:14.139182	2013-07-08 22:50:14.139182
103039	103	31	12	2013-07-08 22:50:14.139902	2013-07-08 22:50:14.139902
103040	103	32	12	2013-07-08 22:50:14.14068	2013-07-08 22:50:14.14068
103041	103	33	12	2013-07-08 22:50:14.141601	2013-07-08 22:50:14.141601
103042	103	34	12	2013-07-08 22:50:14.142432	2013-07-08 22:50:14.142432
103043	103	35	12	2013-07-08 22:50:14.143245	2013-07-08 22:50:14.143245
103044	103	0	13	2013-07-08 22:50:14.144148	2013-07-08 22:50:14.144148
103045	103	2	13	2013-07-08 22:50:14.145471	2013-07-08 22:50:14.145471
103046	103	3	13	2013-07-08 22:50:14.14636	2013-07-08 22:50:14.14636
103047	103	5	13	2013-07-08 22:50:14.147121	2013-07-08 22:50:14.147121
103048	103	7	13	2013-07-08 22:50:14.147835	2013-07-08 22:50:14.147835
103049	103	8	13	2013-07-08 22:50:14.148559	2013-07-08 22:50:14.148559
103050	103	10	13	2013-07-08 22:50:14.149391	2013-07-08 22:50:14.149391
103051	103	12	13	2013-07-08 22:50:14.180284	2013-07-08 22:50:14.180284
103052	103	13	13	2013-07-08 22:50:14.181341	2013-07-08 22:50:14.181341
103053	103	15	13	2013-07-08 22:50:14.182048	2013-07-08 22:50:14.182048
103054	103	17	13	2013-07-08 22:50:14.182711	2013-07-08 22:50:14.182711
103055	103	19	13	2013-07-08 22:50:14.183649	2013-07-08 22:50:14.183649
103056	103	20	13	2013-07-08 22:50:14.184429	2013-07-08 22:50:14.184429
103057	103	21	13	2013-07-08 22:50:14.185119	2013-07-08 22:50:14.185119
103058	103	22	13	2013-07-08 22:50:14.18581	2013-07-08 22:50:14.18581
103059	103	23	13	2013-07-08 22:50:14.186674	2013-07-08 22:50:14.186674
103060	103	24	13	2013-07-08 22:50:14.187426	2013-07-08 22:50:14.187426
103061	103	25	13	2013-07-08 22:50:14.188109	2013-07-08 22:50:14.188109
103062	103	26	13	2013-07-08 22:50:14.188803	2013-07-08 22:50:14.188803
103063	103	27	13	2013-07-08 22:50:14.189572	2013-07-08 22:50:14.189572
103064	103	28	13	2013-07-08 22:50:14.190397	2013-07-08 22:50:14.190397
103065	103	29	13	2013-07-08 22:50:14.191407	2013-07-08 22:50:14.191407
103066	103	30	13	2013-07-08 22:50:14.192251	2013-07-08 22:50:14.192251
103067	103	31	13	2013-07-08 22:50:14.193063	2013-07-08 22:50:14.193063
103068	103	32	13	2013-07-08 22:50:14.193808	2013-07-08 22:50:14.193808
103069	103	33	13	2013-07-08 22:50:14.194671	2013-07-08 22:50:14.194671
103070	103	34	13	2013-07-08 22:50:14.195539	2013-07-08 22:50:14.195539
103071	103	35	13	2013-07-08 22:50:14.196252	2013-07-08 22:50:14.196252
103072	103	0	14	2013-07-08 22:50:14.196919	2013-07-08 22:50:14.196919
103073	103	4	14	2013-07-08 22:50:14.197582	2013-07-08 22:50:14.197582
103074	103	5	14	2013-07-08 22:50:14.198283	2013-07-08 22:50:14.198283
103075	103	10	14	2013-07-08 22:50:14.199025	2013-07-08 22:50:14.199025
103076	103	12	14	2013-07-08 22:50:14.199817	2013-07-08 22:50:14.199817
103077	103	13	14	2013-07-08 22:50:14.200532	2013-07-08 22:50:14.200532
103078	103	14	14	2013-07-08 22:50:14.201183	2013-07-08 22:50:14.201183
103079	103	15	14	2013-07-08 22:50:14.20184	2013-07-08 22:50:14.20184
103080	103	18	14	2013-07-08 22:50:14.202541	2013-07-08 22:50:14.202541
103081	103	19	14	2013-07-08 22:50:14.203292	2013-07-08 22:50:14.203292
103082	103	20	14	2013-07-08 22:50:14.203963	2013-07-08 22:50:14.203963
103083	103	21	14	2013-07-08 22:50:14.204643	2013-07-08 22:50:14.204643
103084	103	22	14	2013-07-08 22:50:14.205355	2013-07-08 22:50:14.205355
103085	103	23	14	2013-07-08 22:50:14.206022	2013-07-08 22:50:14.206022
103086	103	24	14	2013-07-08 22:50:14.20716	2013-07-08 22:50:14.20716
103087	103	25	14	2013-07-08 22:50:14.208097	2013-07-08 22:50:14.208097
103088	103	26	14	2013-07-08 22:50:14.208889	2013-07-08 22:50:14.208889
103089	103	27	14	2013-07-08 22:50:14.209742	2013-07-08 22:50:14.209742
103090	103	28	14	2013-07-08 22:50:14.211116	2013-07-08 22:50:14.211116
103091	103	29	14	2013-07-08 22:50:14.212446	2013-07-08 22:50:14.212446
103092	103	30	14	2013-07-08 22:50:14.213341	2013-07-08 22:50:14.213341
103093	103	31	14	2013-07-08 22:50:14.21402	2013-07-08 22:50:14.21402
103094	103	32	14	2013-07-08 22:50:14.214694	2013-07-08 22:50:14.214694
103095	103	33	14	2013-07-08 22:50:14.215557	2013-07-08 22:50:14.215557
103096	103	34	14	2013-07-08 22:50:14.216362	2013-07-08 22:50:14.216362
103097	103	35	14	2013-07-08 22:50:14.217091	2013-07-08 22:50:14.217091
103098	103	0	15	2013-07-08 22:50:14.21778	2013-07-08 22:50:14.21778
103099	103	2	15	2013-07-08 22:50:14.218436	2013-07-08 22:50:14.218436
103100	103	3	15	2013-07-08 22:50:14.219219	2013-07-08 22:50:14.219219
103101	103	5	15	2013-07-08 22:50:14.220009	2013-07-08 22:50:14.220009
103102	103	7	15	2013-07-08 22:50:14.220691	2013-07-08 22:50:14.220691
103103	103	8	15	2013-07-08 22:50:14.221414	2013-07-08 22:50:14.221414
103104	103	10	15	2013-07-08 22:50:14.222102	2013-07-08 22:50:14.222102
103105	103	12	15	2013-07-08 22:50:14.22282	2013-07-08 22:50:14.22282
103106	103	13	15	2013-07-08 22:50:14.223883	2013-07-08 22:50:14.223883
103107	103	15	15	2013-07-08 22:50:14.224652	2013-07-08 22:50:14.224652
103108	103	17	15	2013-07-08 22:50:14.225329	2013-07-08 22:50:14.225329
103109	103	19	15	2013-07-08 22:50:14.226118	2013-07-08 22:50:14.226118
103110	103	20	15	2013-07-08 22:50:14.22701	2013-07-08 22:50:14.22701
103111	103	21	15	2013-07-08 22:50:14.228103	2013-07-08 22:50:14.228103
103112	103	22	15	2013-07-08 22:50:14.229116	2013-07-08 22:50:14.229116
103113	103	23	15	2013-07-08 22:50:14.229999	2013-07-08 22:50:14.229999
103114	103	24	15	2013-07-08 22:50:14.230712	2013-07-08 22:50:14.230712
103115	103	25	15	2013-07-08 22:50:14.231503	2013-07-08 22:50:14.231503
103116	103	26	15	2013-07-08 22:50:14.232271	2013-07-08 22:50:14.232271
103117	103	27	15	2013-07-08 22:50:14.232986	2013-07-08 22:50:14.232986
103118	103	28	15	2013-07-08 22:50:14.233657	2013-07-08 22:50:14.233657
103119	103	29	15	2013-07-08 22:50:14.2343	2013-07-08 22:50:14.2343
103120	103	30	15	2013-07-08 22:50:14.235009	2013-07-08 22:50:14.235009
103121	103	31	15	2013-07-08 22:50:14.235684	2013-07-08 22:50:14.235684
103122	103	32	15	2013-07-08 22:50:14.236418	2013-07-08 22:50:14.236418
103123	103	33	15	2013-07-08 22:50:14.237143	2013-07-08 22:50:14.237143
103124	103	34	15	2013-07-08 22:50:14.237823	2013-07-08 22:50:14.237823
103125	103	35	15	2013-07-08 22:50:14.238577	2013-07-08 22:50:14.238577
103126	103	0	16	2013-07-08 22:50:14.239486	2013-07-08 22:50:14.239486
103127	103	4	16	2013-07-08 22:50:14.240577	2013-07-08 22:50:14.240577
103128	103	5	16	2013-07-08 22:50:14.241647	2013-07-08 22:50:14.241647
103129	103	7	16	2013-07-08 22:50:14.242689	2013-07-08 22:50:14.242689
103130	103	8	16	2013-07-08 22:50:14.244058	2013-07-08 22:50:14.244058
103131	103	10	16	2013-07-08 22:50:14.245481	2013-07-08 22:50:14.245481
103132	103	14	16	2013-07-08 22:50:14.246381	2013-07-08 22:50:14.246381
103133	103	15	16	2013-07-08 22:50:14.247184	2013-07-08 22:50:14.247184
103134	103	17	16	2013-07-08 22:50:14.247891	2013-07-08 22:50:14.247891
103135	103	18	16	2013-07-08 22:50:14.248739	2013-07-08 22:50:14.248739
103136	103	20	16	2013-07-08 22:50:14.249547	2013-07-08 22:50:14.249547
103137	103	21	16	2013-07-08 22:50:14.250269	2013-07-08 22:50:14.250269
103138	103	22	16	2013-07-08 22:50:14.250945	2013-07-08 22:50:14.250945
103139	103	23	16	2013-07-08 22:50:14.251642	2013-07-08 22:50:14.251642
103140	103	24	16	2013-07-08 22:50:14.252338	2013-07-08 22:50:14.252338
103141	103	25	16	2013-07-08 22:50:14.253143	2013-07-08 22:50:14.253143
103142	103	26	16	2013-07-08 22:50:14.253883	2013-07-08 22:50:14.253883
103143	103	27	16	2013-07-08 22:50:14.254641	2013-07-08 22:50:14.254641
103144	103	28	16	2013-07-08 22:50:14.255407	2013-07-08 22:50:14.255407
103145	103	29	16	2013-07-08 22:50:14.256206	2013-07-08 22:50:14.256206
103146	103	30	16	2013-07-08 22:50:14.257066	2013-07-08 22:50:14.257066
103147	103	31	16	2013-07-08 22:50:14.25791	2013-07-08 22:50:14.25791
103148	103	32	16	2013-07-08 22:50:14.258628	2013-07-08 22:50:14.258628
103149	103	33	16	2013-07-08 22:50:14.259387	2013-07-08 22:50:14.259387
103150	103	34	16	2013-07-08 22:50:14.260241	2013-07-08 22:50:14.260241
103151	103	35	16	2013-07-08 22:50:14.261281	2013-07-08 22:50:14.261281
103152	103	0	17	2013-07-08 22:50:14.262038	2013-07-08 22:50:14.262038
103153	103	1	17	2013-07-08 22:50:14.262738	2013-07-08 22:50:14.262738
103154	103	2	17	2013-07-08 22:50:14.263541	2013-07-08 22:50:14.263541
103155	103	3	17	2013-07-08 22:50:14.264226	2013-07-08 22:50:14.264226
103156	103	4	17	2013-07-08 22:50:14.26494	2013-07-08 22:50:14.26494
103157	103	5	17	2013-07-08 22:50:14.265633	2013-07-08 22:50:14.265633
103158	103	6	17	2013-07-08 22:50:14.266335	2013-07-08 22:50:14.266335
103159	103	7	17	2013-07-08 22:50:14.266994	2013-07-08 22:50:14.266994
103160	103	8	17	2013-07-08 22:50:14.267728	2013-07-08 22:50:14.267728
103161	103	9	17	2013-07-08 22:50:14.268426	2013-07-08 22:50:14.268426
103162	103	10	17	2013-07-08 22:50:14.269118	2013-07-08 22:50:14.269118
103163	103	11	17	2013-07-08 22:50:14.269818	2013-07-08 22:50:14.269818
103164	103	12	17	2013-07-08 22:50:14.270513	2013-07-08 22:50:14.270513
103165	103	13	17	2013-07-08 22:50:14.271216	2013-07-08 22:50:14.271216
103166	103	14	17	2013-07-08 22:50:14.271946	2013-07-08 22:50:14.271946
103167	103	15	17	2013-07-08 22:50:14.27274	2013-07-08 22:50:14.27274
103168	103	16	17	2013-07-08 22:50:14.273594	2013-07-08 22:50:14.273594
103169	103	17	17	2013-07-08 22:50:14.274391	2013-07-08 22:50:14.274391
103170	103	18	17	2013-07-08 22:50:14.275155	2013-07-08 22:50:14.275155
103171	103	19	17	2013-07-08 22:50:14.276053	2013-07-08 22:50:14.276053
103172	103	20	17	2013-07-08 22:50:14.277045	2013-07-08 22:50:14.277045
103173	103	21	17	2013-07-08 22:50:14.278071	2013-07-08 22:50:14.278071
103174	103	22	17	2013-07-08 22:50:14.279115	2013-07-08 22:50:14.279115
103175	103	23	17	2013-07-08 22:50:14.280081	2013-07-08 22:50:14.280081
103176	103	24	17	2013-07-08 22:50:14.28093	2013-07-08 22:50:14.28093
103177	103	25	17	2013-07-08 22:50:14.281819	2013-07-08 22:50:14.281819
103178	103	26	17	2013-07-08 22:50:14.282589	2013-07-08 22:50:14.282589
103179	103	27	17	2013-07-08 22:50:14.283441	2013-07-08 22:50:14.283441
103180	103	28	17	2013-07-08 22:50:14.284479	2013-07-08 22:50:14.284479
103181	103	29	17	2013-07-08 22:50:14.285254	2013-07-08 22:50:14.285254
103182	103	30	17	2013-07-08 22:50:14.285962	2013-07-08 22:50:14.285962
103183	103	31	17	2013-07-08 22:50:14.286663	2013-07-08 22:50:14.286663
103184	103	32	17	2013-07-08 22:50:14.287396	2013-07-08 22:50:14.287396
103185	103	33	17	2013-07-08 22:50:14.288071	2013-07-08 22:50:14.288071
103186	103	34	17	2013-07-08 22:50:14.288802	2013-07-08 22:50:14.288802
103187	103	35	17	2013-07-08 22:50:14.289505	2013-07-08 22:50:14.289505
\.


--
-- Name: level_tiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: standup75
--

SELECT pg_catalog.setval('level_tiles_id_seq', 5, true);


--
-- Data for Name: levels; Type: TABLE DATA; Schema: public; Owner: standup75
--

COPY levels (id, slug, name, tile_count_x, tile_count_y, world_id, set, created_at, updated_at, level_index, speed) FROM stdin;
13	the-centipede	The Centipede	36	22	2	0	2012-12-15 19:59:39.974937	2013-07-08 22:59:57.302495	1	50
14	the-centipede-and-the-ladybug--2	The Centipede and the Ladybug	36	22	2	0	2012-12-15 19:59:40.21619	2013-07-08 22:59:57.32185	4	60
15	stars-in-the-middle	Stars in the middle	36	22	2	0	2012-12-15 19:59:40.358693	2013-07-08 22:59:57.327761	5	60
16	4-centipedes	4 Centipedes	36	22	2	0	2012-12-15 19:59:40.537445	2013-07-08 22:59:57.356335	9	70
17	beach-volley	Beach volley	36	22	2	0	2012-12-15 19:59:40.681198	2013-07-08 22:59:57.333665	6	60
18	the-ladybug-infestation	The Ladybug infestation	36	22	5	0	2012-12-15 19:59:40.83745	2013-05-25 00:41:02.009888	5	70
19	tetrissy	Tetrissy	36	22	2	0	2012-12-15 19:59:40.981202	2013-07-08 22:59:57.367873	11	80
21	the-centipedes	The Centipedes	36	22	2	0	2012-12-15 19:59:41.400724	2013-07-08 22:59:57.361775	10	80
22	there-is-no-touching-the-walls	There is no touching the walls	36	22	3	0	2012-12-15 19:59:41.548733	2013-06-29 22:18:00.704824	5	80
23	run-for-your-life	Run for your life	36	22	2	0	2013-01-16 23:14:40.091019	2013-07-08 22:59:57.383527	13	80
24	yay-centistache	Yay! Centistache!	36	22	2	1	2013-01-19 01:33:14.292758	2013-02-09 01:01:49.792106	\N	100
25	get-them-all-at-once	Get Them All At Once	36	22	5	0	2013-01-31 00:49:37.413311	2013-05-26 04:31:30.787648	6	70
28	the-centipede-and-the-skulls	The Centipede and the Skulls	36	22	2	0	2013-02-20 00:49:28.627339	2013-07-08 22:59:57.309498	2	60
29	3-centipedes	3 Centipedes	36	22	2	0	2013-02-21 02:29:02.120755	2013-07-08 22:59:57.339103	7	70
30	the-biggest-centipedes	the biggest Centipedes	36	22	2	0	2013-02-25 02:16:58.38597	2013-07-08 22:59:57.43513	21	80
32	ladybugs-coming-at-ya	Ladybugs coming at ya	36	22	2	0	2013-04-06 19:20:15.565096	2013-07-08 22:59:57.34995	8	70
33	catching-the-stars--2	Catching the Stars	36	22	2	0	2013-04-09 00:08:30.06265	2013-07-08 22:59:57.314825	3	50
34	small-bugs	Small bugs	36	22	2	0	2013-04-11 03:23:24.351413	2013-07-08 22:59:57.428878	20	80
35	the-high-column	The High Column	36	22	5	0	2013-04-20 19:28:28.602232	2013-05-26 04:49:15.34399	9	70
36	stars-on-the-branches	Stars on the Branches	36	22	5	0	2013-04-20 19:28:33.977217	2013-05-25 00:41:02.044187	10	70
37	the-tower	The Tower	36	22	5	0	2013-05-04 19:28:06.520077	2013-05-26 05:02:51.404262	11	70
38	s-s-getting-real	S***'s Getting Real	36	22	5	0	2013-05-04 19:51:22.084624	2013-05-25 00:41:02.003703	4	70
39	3-branches	3 Branches	36	22	5	0	2013-05-04 21:02:55.871466	2013-05-25 00:41:02.021575	7	70
40	column-of-death	Column of Death	36	22	5	0	2013-05-05 13:57:23.836349	2013-05-25 00:41:02.030473	8	70
45	bonus-stage-numero-un	Bonus Stage Numero Un	36	22	2	0	2013-05-05 17:39:19.23696	2013-07-08 22:59:57.373414	12	80
46	deadly-zone	Deadly Zone	36	22	2	0	2013-05-17 00:42:37.450892	2013-05-17 00:43:14.218613	\N	100
47	fall	Fall	36	22	5	0	2013-05-18 23:18:25.057015	2013-05-25 00:41:02.058515	12	70
48	centipede-lair	Centipede Lair	36	22	5	0	2013-05-18 23:34:10.392665	2013-05-25 00:41:02.064985	13	70
49	centistache-s-turn	Centistache's turn	36	22	5	1	2013-05-23 02:58:57.610578	2013-05-25 00:20:31.031105	\N	70
50	stalagmites	Stalagmites	36	22	10	0	2013-05-24 23:35:57.166048	2013-06-22 22:05:44.793643	6	70
51	platforms	Platforms	36	22	5	0	2013-05-24 23:41:37.652033	2013-05-25 00:44:09.046771	2	70
52	the-centipede-suicide	The Centipede Suicide	36	22	5	0	2013-05-24 23:55:15.994089	2013-05-25 00:41:01.996708	3	70
53	the-branch	The Branch	36	22	5	0	2013-05-25 00:04:50.299527	2013-05-25 00:41:01.983553	1	70
54	jungle	Jungle	36	22	5	0	2013-05-25 00:09:07.913472	2013-05-25 00:41:02.071583	14	70
55	grotto	Grotto	36	22	5	0	2013-05-25 00:21:49.822574	2013-05-25 00:41:02.078025	15	70
56	ice	Ice	36	22	10	0	2013-06-01 21:53:15.12053	2013-06-22 22:05:44.756972	1	80
57	icy-walls	Icy walls	36	22	10	0	2013-06-02 18:16:20.787251	2013-06-22 22:05:44.763835	2	80
58	crevice	Crevice	36	22	10	0	2013-06-02 19:05:18.799723	2013-06-22 22:05:44.772724	3	80
59	stealth	Stealth	36	22	10	0	2013-06-10 04:10:27.39836	2013-06-22 22:05:44.779259	4	80
60	test	test	36	22	2	0	2013-06-19 22:35:17.555829	2013-07-06 01:26:28.328186	\N	70
61	the-ladybug-nest	The Ladybug Nest	36	22	10	0	2013-06-21 19:02:21.626478	2013-07-05 18:13:16.086371	5	80
62	nests	Nests	36	22	10	0	2013-06-21 22:29:09.645748	2013-06-22 22:05:44.807419	8	70
63	no-walls	No Walls	36	22	10	0	2013-06-21 22:37:37.835937	2013-06-22 23:24:05.244262	7	80
64	iceland	Iceland	36	22	10	0	2013-06-21 23:07:35.333288	2013-06-22 22:05:44.814035	9	80
65	the-lake	The lake	36	22	10	0	2013-06-22 18:59:14.812594	2013-06-22 22:05:44.820638	10	80
66	centipede-mountain-hive	Centipede Mountain Hive	36	22	10	0	2013-06-22 19:07:55.318981	2013-06-22 22:05:44.827043	11	80
67	centipede-mountain-hive-v2	Centipede Mountain Hive v2	36	22	10	0	2013-06-22 19:42:09.075022	2013-06-22 22:05:44.850038	14	80
68	don-t-choose-the-easy-route	Don't choose the easy route	36	22	10	0	2013-06-22 20:25:24.778704	2013-06-22 22:05:44.840694	13	80
69	chilly	Chilly	36	22	10	0	2013-06-22 20:25:35.638427	2013-06-22 22:05:44.83359	12	80
70	such-a-maze	Such a maze	36	22	10	1	2013-06-22 21:35:58.947473	2013-06-22 21:56:19.423154	\N	80
71	10-platforms	10 platforms	36	22	2	0	2013-06-22 23:40:00.094792	2013-07-08 22:59:57.410717	17	100
72	spiral	Spiral	36	22	2	0	2013-06-23 19:30:32.217944	2013-07-08 22:59:57.389518	14	80
73	frozen-corridors	Frozen corridors	36	22	2	0	2013-06-23 19:43:59.882847	2013-07-08 22:59:57.395169	15	80
74	crazy-centipedes	Crazy Centipedes	36	22	2	0	2013-06-24 17:13:57.107093	2013-07-08 22:59:57.401652	16	100
75	introducing-the-flies	Introducing: the Flies	36	22	3	0	2013-06-27 15:46:06.727854	2013-06-29 22:18:00.676132	1	80
76	high-security	High Security	36	22	3	0	2013-06-27 20:32:13.605137	2013-06-29 22:18:00.690304	3	80
77	electricity	Electricity	36	22	3	0	2013-06-28 15:56:54.558819	2013-06-29 22:18:00.682654	2	80
78	protected-nest	Protected Nest	36	22	3	0	2013-06-28 16:05:12.012361	2013-06-29 22:18:00.697524	4	80
79	frozen-beach	Frozen Beach	36	22	3	0	2013-06-28 19:26:53.315211	2013-06-29 22:18:00.712361	6	80
80	tower-of-hanoi	Tower of Hanoi	36	22	3	0	2013-06-28 19:48:44.393583	2013-06-29 22:18:00.720007	7	80
81	something-must-stink	Something must stink	36	22	3	0	2013-06-28 20:11:52.972654	2013-06-29 22:18:00.75495	11	80
82	a-triangle	A Triangle	36	22	3	0	2013-06-28 21:38:50.205063	2013-06-29 22:18:00.735114	9	80
84	bonus-stage-2	Bonus Stage #2	36	22	3	0	2013-06-28 22:46:58.776064	2013-06-29 22:18:00.746893	10	80
85	melting-pot-1	Melting pot 1	36	22	3	0	2013-06-28 22:54:19.669734	2013-06-29 22:18:00.728527	8	80
86	wake-up	Wake up!	36	22	2	0	2013-06-29 00:37:52.133335	2013-07-08 22:59:57.416886	18	80
88	narrow-path	Narrow Path	36	22	2	0	2013-06-29 20:09:12.656444	2013-07-08 22:59:57.422904	19	80
89	weeping-willow	Weeping willow	36	22	2	0	2013-06-29 20:14:51.97742	2013-07-08 22:59:57.44386	22	80
90	centistache-fruits-and-beach	Centistache, Fruits and Beach	36	22	3	1	2013-06-29 21:55:17.026352	2013-06-29 22:02:26.240197	\N	80
91	froggery	Froggery	36	22	2	0	2013-06-30 16:32:59.267027	2013-07-08 22:59:57.451199	23	80
92	roaches-are-gross	Roaches are gross	36	22	6	0	2013-06-30 17:30:44.278835	2013-07-08 22:39:02.847211	1	90
93	meet-the-angry-cave-butterflies	Meet the angry cave butterflies	36	22	6	0	2013-06-30 22:34:38.926206	2013-07-08 22:39:02.853788	2	90
94	3-zones	3 Zones	36	22	6	0	2013-07-02 16:18:17.644259	2013-07-08 22:39:02.860237	3	90
95	hurdles	Hurdles	36	22	6	0	2013-07-02 16:33:02.831539	2013-07-08 22:39:02.866422	4	90
96	branches-and-roaches	Branches and roaches	36	22	6	0	2013-07-02 16:52:09.114523	2013-07-08 22:39:02.872366	5	90
97	ladybugs-are-back	Ladybugs are back	36	22	6	0	2013-07-05 22:02:06.935718	2013-07-08 22:39:02.896759	9	90
98	diverticulum	Diverticulum	36	22	6	0	2013-07-06 00:02:30.967888	2013-07-08 22:39:02.905154	10	90
99	galleries	Galleries	36	22	6	0	2013-07-06 01:47:17.49904	2013-07-08 22:39:02.891202	8	90
100	slalom	Slalom	36	22	6	0	2013-07-06 06:20:27.18641	2013-07-08 22:39:02.885534	7	90
101	4-hooks	4 hooks	36	22	6	0	2013-07-06 06:41:07.617423	2013-07-08 22:39:02.879118	6	90
102	fruits-in-the-cave	Fruits in the cave	36	22	6	1	2013-07-08 21:45:14.590637	2013-07-08 21:50:18.581958	\N	90
103	end-of-beta	End Of Beta	36	22	2	0	2013-07-08 22:42:41.747884	2013-07-08 22:59:57.457969	24	70
\.


--
-- Name: levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: standup75
--

SELECT pg_catalog.setval('levels_id_seq', 1, false);


--
-- Data for Name: options; Type: TABLE DATA; Schema: public; Owner: standup75
--

COPY options (id, sprite_id, label, content, created_at, updated_at, bonu_id, level_id) FROM stdin;
3730	\N	clockwise	1	2012-12-20 22:20:57.083341	2012-12-20 22:20:57.083341	\N	\N
3733	\N	clockwise	-1	2012-12-20 22:39:24.806699	2012-12-20 22:39:24.806699	\N	\N
3736	21	clockwise	1	2013-01-04 18:46:39.989168	2013-01-04 18:46:39.989168	\N	\N
3738	22	clockwise	-1	2013-01-04 18:47:29.733013	2013-01-04 18:47:29.733013	\N	\N
3740	\N	index	1	2013-01-19 23:43:18.184655	2013-01-19 23:43:18.184655	14	\N
3741	\N	value	200	2013-01-19 23:43:18.417669	2013-01-19 23:43:18.417669	14	\N
3746	\N	index	2	2013-01-19 23:44:27.67163	2013-01-19 23:44:27.67163	15	\N
3747	\N	value	500	2013-01-19 23:44:27.810638	2013-01-19 23:44:27.810638	15	\N
3750	\N	index	3	2013-01-19 23:45:07.584913	2013-01-19 23:45:07.584913	16	\N
3751	\N	value	700	2013-01-19 23:45:07.749922	2013-01-19 23:45:07.749922	16	\N
3752	\N	index	4	2013-01-19 23:45:45.718094	2013-01-19 23:45:45.718094	17	\N
3753	\N	value	1000	2013-01-19 23:45:46.063113	2013-01-19 23:45:46.063113	17	\N
3754	\N	index	5	2013-01-19 23:46:27.395478	2013-01-19 23:46:27.395478	18	\N
3755	\N	value	2000	2013-01-19 23:46:27.533485	2013-01-19 23:46:27.533485	18	\N
3756	\N	index	6	2013-01-19 23:46:58.165237	2013-01-19 23:46:58.165237	19	\N
3757	\N	value	5000	2013-01-19 23:46:58.37925	2013-01-19 23:46:58.37925	19	\N
3795	\N	speed	6	2013-06-21 21:33:05.321485	2013-06-21 21:33:05.321485	\N	\N
3796	\N	speed	6	2013-06-21 21:33:05.32508	2013-06-21 21:33:05.32508	\N	\N
3797	\N	speed	6	2013-06-21 21:36:22.332566	2013-06-21 21:36:22.332566	\N	45
3798	\N	speed	6	2013-06-21 21:36:22.335316	2013-06-21 21:36:22.335316	\N	45
3799	\N	speed	6	2013-06-21 21:37:59.238103	2013-06-21 21:37:59.238103	\N	\N
3800	\N	speed	6	2013-06-21 21:37:59.240807	2013-06-21 21:37:59.240807	\N	\N
3804	31	speed	4	2013-06-21 21:43:39.369874	2013-06-21 21:43:39.369874	\N	\N
3805	31	clockwise	1	2013-06-21 21:43:39.372833	2013-06-21 21:43:39.372833	\N	\N
3806	32	speed	4	2013-06-21 21:43:58.478731	2013-06-21 21:43:58.478731	\N	\N
3807	32	clockwise	-1	2013-06-21 21:43:58.481952	2013-06-21 21:43:58.481952	\N	\N
3808	38	speed	5	2013-06-21 21:44:14.544493	2013-06-21 21:44:14.544493	\N	\N
3809	38	clockwise	1	2013-06-21 21:44:14.546934	2013-06-21 21:44:14.546934	\N	\N
3810	39	speed	5	2013-06-21 21:44:30.823061	2013-06-21 21:44:30.823061	\N	\N
3811	39	clockwise	-1	2013-06-21 21:44:30.825563	2013-06-21 21:44:30.825563	\N	\N
3813	36	speed	9	2013-06-21 21:45:38.794652	2013-06-21 21:45:38.794652	\N	\N
3815	37	speed	8	2013-06-21 22:40:29.588287	2013-06-21 22:40:29.588287	\N	\N
3816	40	frequency	40	2013-06-22 00:17:56.313824	2013-06-22 00:17:56.313824	\N	\N
3817	40	frequency	40	2013-06-22 00:24:47.279124	2013-06-22 00:24:47.279124	\N	\N
3818	40	speedRangeMax	6	2013-06-22 00:24:47.281945	2013-06-22 00:24:47.281945	\N	\N
3821	41	clockwise	1	2013-06-22 20:56:29.614967	2013-06-22 20:56:29.614967	\N	\N
3822	42	clockwise	-1	2013-06-22 20:56:45.259497	2013-06-22 20:56:45.259497	\N	\N
3823	40	frequency	40	2013-06-22 22:13:46.751358	2013-06-22 22:13:46.751358	\N	\N
3824	40	speedRangeMax	6	2013-06-22 22:13:46.754158	2013-06-22 22:13:46.754158	\N	\N
3827	\N	speed	6	2013-06-23 19:27:52.754509	2013-06-23 19:27:52.754509	\N	\N
3828	\N	speed	6	2013-06-23 19:27:52.757531	2013-06-23 19:27:52.757531	\N	\N
3829	\N	speed	6	2013-06-23 19:44:44.884669	2013-06-23 19:44:44.884669	\N	23
3830	\N	speed	6	2013-06-23 19:44:44.887339	2013-06-23 19:44:44.887339	\N	23
3860	8	speed	13	2013-06-27 20:19:16.209187	2013-06-27 20:19:16.209187	\N	74
3861	8	podCount	10	2013-06-27 20:19:16.212207	2013-06-27 20:19:16.212207	\N	74
3862	8	maxAngleDiff	1.05	2013-06-27 20:19:16.214686	2013-06-27 20:19:16.214686	\N	74
3881	36	speed	10	2013-06-28 23:05:14.041923	2013-06-28 23:05:14.041923	\N	22
3882	9	scale	0.5	2013-06-29 00:13:43.113638	2013-06-29 00:13:43.113638	\N	84
3885	9	scale	0.5	2013-06-29 00:32:06.615328	2013-06-29 00:32:06.615328	\N	81
3886	9	speed	9	2013-06-29 00:32:06.62032	2013-06-29 00:32:06.62032	\N	81
3899	\N	speed	6	2013-06-29 20:02:42.652799	2013-06-29 20:02:42.652799	\N	30
3900	\N	speed	6	2013-06-29 20:02:42.655352	2013-06-29 20:02:42.655352	\N	30
3901	8	podCount	32	2013-06-29 20:02:42.657893	2013-06-29 20:02:42.657893	\N	30
3902	9	scale	0.5	2013-06-29 20:03:00.764988	2013-06-29 20:03:00.764988	\N	34
3907	40	frequency	40	2013-06-29 23:10:45.419355	2013-06-29 23:10:45.419355	\N	63
3908	40	speedRangeMax	6	2013-06-29 23:10:45.422354	2013-06-29 23:10:45.422354	\N	63
3986	\N	frequency	40	2013-06-30 20:32:49.727446	2013-06-30 20:32:49.727446	\N	\N
3987	\N	frequency	40	2013-06-30 20:32:49.730417	2013-06-30 20:32:49.730417	\N	\N
3988	\N	speedRangeMax	6	2013-06-30 20:32:49.73359	2013-06-30 20:32:49.73359	\N	\N
3989	\N	frequency	40	2013-06-30 20:32:49.73605	2013-06-30 20:32:49.73605	\N	\N
3990	\N	speedRangeMax	6	2013-06-30 20:32:49.738631	2013-06-30 20:32:49.738631	\N	\N
3991	\N	frequency	40	2013-06-30 20:32:49.74127	2013-06-30 20:32:49.74127	\N	63
3992	\N	speedRangeMax	6	2013-06-30 20:32:49.744367	2013-06-30 20:32:49.744367	\N	63
3993	43	frequency	40	2013-06-30 20:33:09.653354	2013-06-30 20:33:09.653354	\N	\N
3994	43	frequency	40	2013-06-30 20:33:09.655974	2013-06-30 20:33:09.655974	\N	\N
3995	43	speedRangeMax	6	2013-06-30 20:33:09.658779	2013-06-30 20:33:09.658779	\N	\N
3996	43	frequency	40	2013-06-30 20:33:09.662256	2013-06-30 20:33:09.662256	\N	\N
3997	43	speedRangeMax	6	2013-06-30 20:33:09.712442	2013-06-30 20:33:09.712442	\N	\N
3998	43	frequency	40	2013-06-30 20:33:09.715167	2013-06-30 20:33:09.715167	\N	\N
3999	43	speedRangeMax	6	2013-06-30 20:33:09.717567	2013-06-30 20:33:09.717567	\N	\N
4040	8	maxAngleDiff	0	2013-06-30 21:01:24.626904	2013-06-30 21:01:24.626904	\N	91
4041	8	speed	13	2013-06-30 21:01:24.629696	2013-06-30 21:01:24.629696	\N	91
4042	36	maxAngleDiff	0	2013-06-30 21:01:24.632336	2013-06-30 21:01:24.632336	\N	91
4043	36	speed	18	2013-06-30 21:01:24.634808	2013-06-30 21:01:24.634808	\N	91
4044	36	podCount	40	2013-06-30 21:01:24.637929	2013-06-30 21:01:24.637929	\N	91
4045	30	maxAngleDiff	0	2013-06-30 21:01:24.640463	2013-06-30 21:01:24.640463	\N	91
4046	37	maxAngleDiff	0	2013-06-30 21:01:24.64374	2013-06-30 21:01:24.64374	\N	91
4047	30	speed	9	2013-06-30 21:01:24.646649	2013-06-30 21:01:24.646649	\N	91
4048	37	speed	14	2013-06-30 21:01:24.649304	2013-06-30 21:01:24.649304	\N	91
4049	9	maxAngleDiff	0	2013-06-30 21:01:24.651773	2013-06-30 21:01:24.651773	\N	91
4113	9	scale	0.5	2013-07-06 06:57:42.883554	2013-07-06 06:57:42.883554	\N	101
4114	40	frequency	40	2013-07-06 06:57:42.887114	2013-07-06 06:57:42.887114	\N	101
4115	43	frequency	40	2013-07-06 06:57:42.889749	2013-07-06 06:57:42.889749	\N	101
4118	9	scale	0.7	2013-07-06 20:44:06.317537	2013-07-06 20:44:06.317537	\N	86
4119	9	speed	10	2013-07-06 20:44:06.320739	2013-07-06 20:44:06.320739	\N	86
4125	9	scale	0.5	2013-07-07 04:24:30.066572	2013-07-07 04:24:30.066572	\N	94
4126	9	speed	10	2013-07-07 04:24:30.069463	2013-07-07 04:24:30.069463	\N	94
4156	36	speed	13	2013-07-08 21:32:21.313727	2013-07-08 21:32:21.313727	\N	98
4157	43	frequency	120	2013-07-08 21:32:21.316254	2013-07-08 21:32:21.316254	\N	98
4158	9	scale	0.5	2013-07-08 21:34:17.417482	2013-07-08 21:34:17.417482	\N	92
4159	43	frequency	120	2013-07-08 21:34:17.419953	2013-07-08 21:34:17.419953	\N	92
4160	9	speed	10	2013-07-08 21:34:17.422702	2013-07-08 21:34:17.422702	\N	92
4161	21	speed	3	2013-07-08 21:40:47.515535	2013-07-08 21:40:47.515535	\N	100
4162	22	speed	3	2013-07-08 21:40:47.518241	2013-07-08 21:40:47.518241	\N	100
4163	9	scale	0.5	2013-07-08 21:43:22.647988	2013-07-08 21:43:22.647988	\N	99
4164	43	frequency	160	2013-07-08 21:43:22.650791	2013-07-08 21:43:22.650791	\N	99
4165	19	scale	0.7	2013-07-08 21:43:22.653582	2013-07-08 21:43:22.653582	\N	99
4166	9	speed	8	2013-07-08 21:43:22.656132	2013-07-08 21:43:22.656132	\N	99
4167	19	speed	10	2013-07-08 21:43:22.659158	2013-07-08 21:43:22.659158	\N	99
4168	11	clockwise	1	2013-07-09 19:50:41.348222	2013-07-09 19:50:41.348222	\N	\N
4169	17	clockwise	-1	2013-07-09 19:50:55.195231	2013-07-09 19:50:55.195231	\N	\N
\.


--
-- Name: options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: standup75
--

SELECT pg_catalog.setval('options_id_seq', 1, false);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: standup75
--

COPY roles (id, slug, name, description, created_at, updated_at) FROM stdin;
7	admin	admin	Can do everything, including managing users	2012-12-15 19:59:38.936166	2012-12-15 19:59:38.936166
8	editor	editor	\N	2012-12-15 19:59:39.342677	2012-12-15 19:59:39.342677
9	player	player	Just any player, no special privilege	2013-07-09 16:40:02.894344	2013-07-09 16:40:02.894344
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: standup75
--

SELECT pg_catalog.setval('roles_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: standup75
--

COPY schema_migrations (version) FROM stdin;
20120917213331
20120918142805
20120918154712
20120918155314
20120918184837
20120918184909
20120918184933
20120918185030
20120921175644
20120921175653
20120921175702
20120926200347
20121012020034
20121012020315
20121012021406
20121013180726
20121018010423
20121018022852
20121019203227
20121020145244
20121024202517
20121025202642
20121025214958
20121105173451
20121110200932
20121209210510
20121220195435
20121221172502
20121221221501
20130114185622
20130119230333
20130119232954
20130203175417
20130207025300
20130209004403
20130209010738
20130226024201
20130411013415
20130413203955
20130517001957
20130621192010
20130621192803
20130709145259
20130709204520
20130710210017
20130710211650
20130710221256
20130710231420
20130719145608
20130719152010
\.


--
-- Data for Name: sprites; Type: TABLE DATA; Schema: public; Owner: standup75
--

COPY sprites (id, slug, name, family, set, created_at, updated_at, helping_sprite_id) FROM stdin;
8	centipede	Centipede	Centipede	0	2012-12-15 19:59:41.738744	2012-12-15 19:59:41.738744	\N
9	fly	Fly	Fly	0	2012-12-15 19:59:41.903753	2012-12-15 19:59:41.903753	\N
10	leaf	Leaf	Leaf	0	2012-12-15 19:59:42.081763	2012-12-18 20:54:00.8825	\N
11	ladybug-clockwise	Ladybug Clockwise	Ladybug	0	2012-12-15 19:59:42.36978	2012-12-15 19:59:42.36978	\N
13	branch	Branch	Branch	0	2012-12-18 20:54:24.107828	2012-12-18 20:54:24.107828	\N
17	ladybug-counter-clockwise	Ladybug Counter Clockwise	Ladybug	0	2012-12-20 22:37:18.9355	2012-12-20 22:39:24.551684	\N
19	butterfly	Butterfly	Butterfly	0	2012-12-27 17:22:43.572465	2012-12-27 17:22:43.572465	\N
20	dragonfly	Dragonfly	Dragonfly	0	2012-12-27 22:21:42.048262	2012-12-27 22:21:42.048262	\N
21	roach-clockwise	Roach Clockwise	Roach	0	2013-01-04 18:46:07.51131	2013-01-04 18:46:39.67915	\N
22	roach-counter-clockwise	Roach Counter Clockwise	Roach	0	2013-01-04 18:46:55.904078	2013-01-04 18:47:29.471998	\N
23	electricity	Electricity	Electricity	0	2013-01-05 14:43:34.26078	2013-01-05 14:43:34.26078	\N
24	chameleon	Chameleon	Chameleon	0	2013-01-06 21:20:37.874649	2013-01-06 21:20:37.874649	\N
25	centistache	Centistache	Centistache	1	2013-01-19 01:32:07.959964	2013-01-19 20:59:54.286491	\N
29	ice	Ice	Ice	0	2013-04-05 02:04:52.172156	2013-04-05 02:05:05.487505	\N
30	baby-centipede	Baby Centipede	BabyCentipede	0	2013-04-06 19:49:20.684571	2013-04-06 19:49:20.684571	\N
31	ladybug-v2	Ladybug v2	Ladybug	0	2013-05-04 18:58:34.664417	2013-06-21 21:43:39.362469	\N
32	ladybug-v2-cc	Ladybug v2 CC	Ladybug	0	2013-05-04 18:59:45.377699	2013-06-21 21:43:58.471592	\N
33	deadly-zone	Deadly Zone	DeadlyZone	0	2013-05-16 02:10:16.430053	2013-05-16 02:10:16.430053	\N
34	orange-leaf	Orange Leaf	OrangeLeaf	0	2013-05-16 02:51:32.376053	2013-05-16 02:51:32.376053	\N
35	deadly-zone-fence	Deadly Zone Fence	-	0	2013-05-17 00:41:52.948817	2013-05-17 00:41:52.948817	33
36	centipede-v2	Centipede v2	Centipede	0	2013-06-01 21:50:47.192198	2013-06-21 21:45:38.787568	\N
37	baby-centipede-v2	Baby Centipede v2	BabyCentipede	0	2013-06-01 21:51:27.120336	2013-06-21 21:44:57.512931	\N
38	ladybug-v3	Ladybug v3	Ladybug	0	2013-06-02 18:48:35.650055	2013-06-21 21:44:14.537612	\N
39	ladybug-v3-cc	Ladybug v3 CC	Ladybug	0	2013-06-02 18:49:06.947076	2013-06-21 21:44:30.816292	\N
40	nest	Nest	Nest	0	2013-06-11 01:50:36.397425	2013-06-11 01:50:36.397425	\N
41	ladybugtest-c	LadybugTest C	LadybugTest	0	2013-06-22 20:43:50.535446	2013-06-22 20:56:29.609595	\N
42	ladybugtest-cc	LadybugTest CC	LadybugTest	0	2013-06-22 20:53:47.941806	2013-06-22 20:56:45.252431	\N
43	roach-nest	Roach Nest	RoachNest	0	2013-06-30 20:32:49.695456	2013-06-30 20:33:09.646499	\N
\.


--
-- Name: sprites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: standup75
--

SELECT pg_catalog.setval('sprites_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: standup75
--

COPY users (id, name, email, slug, password_digest, high_score, high_level, role_id, created_at, updated_at, game_progress, highscore) FROM stdin;
10	\N	standup75@hotmail.com	\N	$2a$10$p8LorL.7FVjSDRpM1Ed/8.JIad71vgAp8O7hK6COwRvQQTxuZMREe	\N	\N	7	2013-07-09 17:21:10.801609	2013-07-19 18:58:36.905923	{"score":60560,"lastCheckpoints":[16,1,2],"stars":[[null,null,0,0,3,3,3,3,3,null,3,3,3,3,3,null,3],[null,3],[null,3,3]],"unlockWorlds":[],"mustaches":[],"email":"standup75@hotmail.com"}	0
1	\N	toto@toto.com	\N	$2a$10$z0CmNy0bZPBRiTEbAFeiP.IOWxnW4r0B9/Rk1ZZqP6d13zCYPHcW2	\N	\N	9	2013-07-11 16:11:11.097734	2013-07-11 16:11:11.097734	\N	0
2	\N	stanislas.duprey@gmail.com	\N	$2a$10$6bUUA4arU3pCqEFlftBkSOeML3pNOgVkzlzksJFSZxgt5E6VoxBLC	\N	\N	9	2013-07-11 18:55:03.60233	2013-07-11 23:18:22.557287	{"score":22195,"lastCheckpoints":[8,1],"stars":[[null,null,0,0,3,3,3,3,3],[null,3]],"unlockWorlds":[],"mustaches":[]}	0
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: standup75
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- Data for Name: worlds; Type: TABLE DATA; Schema: public; Owner: standup75
--

COPY worlds (id, slug, name, game_id, created_at, updated_at, grid_width, grid_height, world_index, background_color, hint) FROM stdin;
2	main	Main	4	2012-12-15 19:59:39.751183	2013-05-19 00:10:44.163935	40	40	0	#4f9ba3	kill;him;on;stage;1
3	beach	Beach	4	2013-01-26 19:52:08.78353	2013-06-29 22:06:05.414843	40	40	3	#4d9ca3	Don't;kill;the;nest;on;level;3
5	woods	Woods	4	2013-02-21 04:13:49.212254	2013-05-25 00:41:01.926234	40	40	1	#90a86d	Let;the;Ladybugs;live;on;stage;4
6	cave	Cave	4	2013-02-21 04:14:59.25926	2013-07-08 22:39:02.75112	40	40	4	#cab79b	Win;by;massacre;on;level;2
7	flying-dutchman	Flying Dutchman	4	2013-02-21 04:15:41.600682	2013-04-20 22:49:37.79971	20	20	6	#000	
8	hell	Hell	4	2013-02-21 04:16:14.157544	2013-04-20 22:49:19.571497	20	20	7	#000	
9	color-hills	Color Hills	4	2013-02-21 04:16:49.630573	2013-04-27 01:57:31.932725	20	20	5	#000	
10	mountain	Mountain	4	2013-02-23 21:00:50.619717	2013-06-22 22:05:44.668621	40	40	2	#eaecec	kill;all;Centipedes;on;level;7
\.


--
-- Name: worlds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: standup75
--

SELECT pg_catalog.setval('worlds_id_seq', 1, false);


--
-- Name: bonus_pkey; Type: CONSTRAINT; Schema: public; Owner: standup75; Tablespace: 
--

ALTER TABLE ONLY bonus
    ADD CONSTRAINT bonus_pkey PRIMARY KEY (id);


--
-- Name: checkpoints_pkey; Type: CONSTRAINT; Schema: public; Owner: standup75; Tablespace: 
--

ALTER TABLE ONLY checkpoints
    ADD CONSTRAINT checkpoints_pkey PRIMARY KEY (id);


--
-- Name: feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: standup75; Tablespace: 
--

ALTER TABLE ONLY feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- Name: game_data_pkey; Type: CONSTRAINT; Schema: public; Owner: standup75; Tablespace: 
--

ALTER TABLE ONLY game_data
    ADD CONSTRAINT game_data_pkey PRIMARY KEY (id);


--
-- Name: games_pkey; Type: CONSTRAINT; Schema: public; Owner: standup75; Tablespace: 
--

ALTER TABLE ONLY games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: level_bonus_pkey; Type: CONSTRAINT; Schema: public; Owner: standup75; Tablespace: 
--

ALTER TABLE ONLY level_bonus
    ADD CONSTRAINT level_bonus_pkey PRIMARY KEY (id);


--
-- Name: level_sprites_pkey; Type: CONSTRAINT; Schema: public; Owner: standup75; Tablespace: 
--

ALTER TABLE ONLY level_sprites
    ADD CONSTRAINT level_sprites_pkey PRIMARY KEY (id);


--
-- Name: level_tiles_pkey; Type: CONSTRAINT; Schema: public; Owner: standup75; Tablespace: 
--

ALTER TABLE ONLY level_tiles
    ADD CONSTRAINT level_tiles_pkey PRIMARY KEY (id);


--
-- Name: levels_pkey; Type: CONSTRAINT; Schema: public; Owner: standup75; Tablespace: 
--

ALTER TABLE ONLY levels
    ADD CONSTRAINT levels_pkey PRIMARY KEY (id);


--
-- Name: options_pkey; Type: CONSTRAINT; Schema: public; Owner: standup75; Tablespace: 
--

ALTER TABLE ONLY options
    ADD CONSTRAINT options_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: standup75; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: sprites_pkey; Type: CONSTRAINT; Schema: public; Owner: standup75; Tablespace: 
--

ALTER TABLE ONLY sprites
    ADD CONSTRAINT sprites_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: standup75; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: worlds_pkey; Type: CONSTRAINT; Schema: public; Owner: standup75; Tablespace: 
--

ALTER TABLE ONLY worlds
    ADD CONSTRAINT worlds_pkey PRIMARY KEY (id);


--
-- Name: index_bonus_on_slug; Type: INDEX; Schema: public; Owner: standup75; Tablespace: 
--

CREATE UNIQUE INDEX index_bonus_on_slug ON bonus USING btree (slug);


--
-- Name: index_games_on_slug; Type: INDEX; Schema: public; Owner: standup75; Tablespace: 
--

CREATE UNIQUE INDEX index_games_on_slug ON games USING btree (slug);


--
-- Name: index_levels_on_slug; Type: INDEX; Schema: public; Owner: standup75; Tablespace: 
--

CREATE UNIQUE INDEX index_levels_on_slug ON levels USING btree (slug);


--
-- Name: index_roles_on_slug; Type: INDEX; Schema: public; Owner: standup75; Tablespace: 
--

CREATE UNIQUE INDEX index_roles_on_slug ON roles USING btree (slug);


--
-- Name: index_sprites_on_slug; Type: INDEX; Schema: public; Owner: standup75; Tablespace: 
--

CREATE UNIQUE INDEX index_sprites_on_slug ON sprites USING btree (slug);


--
-- Name: index_users_on_slug; Type: INDEX; Schema: public; Owner: standup75; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_slug ON users USING btree (slug);


--
-- Name: index_worlds_on_slug; Type: INDEX; Schema: public; Owner: standup75; Tablespace: 
--

CREATE UNIQUE INDEX index_worlds_on_slug ON worlds USING btree (slug);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: standup75; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: standup75
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM standup75;
GRANT ALL ON SCHEMA public TO standup75;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

