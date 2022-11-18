--
-- PostgreSQL database dump
--

-- Dumped from database version 13.8 (Debian 13.8-1.pgdg110+1)
-- Dumped by pg_dump version 13.8 (Debian 13.8-1.pgdg110+1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: app_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO app_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: app_user
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO app_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: app_user
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO app_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: app_user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO app_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: app_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO app_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: app_user
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO app_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: app_user
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO app_user;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: app_user
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO app_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: app_user
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO app_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_user
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: app_user
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO app_user;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_user
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: app_user
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO app_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: app_user
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO app_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_user
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: app_user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO app_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: app_user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO app_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: app_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO app_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: app_user
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO app_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: app_user
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO app_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: app_user
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO app_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: app_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO app_user;

--
-- Name: translations_historicaltranslation; Type: TABLE; Schema: public; Owner: app_user
--

CREATE TABLE public.translations_historicaltranslation (
    id bigint NOT NULL,
    txt_original text NOT NULL,
    txt_translation text,
    status smallint NOT NULL,
    qa_comment text,
    due timestamp with time zone,
    history_id integer NOT NULL,
    history_date timestamp with time zone NOT NULL,
    history_change_reason character varying(100),
    history_type character varying(1) NOT NULL,
    history_user_id integer,
    user_qa_id integer,
    user_translator_id integer
);


ALTER TABLE public.translations_historicaltranslation OWNER TO app_user;

--
-- Name: translations_historicaltranslation_history_id_seq; Type: SEQUENCE; Schema: public; Owner: app_user
--

CREATE SEQUENCE public.translations_historicaltranslation_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translations_historicaltranslation_history_id_seq OWNER TO app_user;

--
-- Name: translations_historicaltranslation_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_user
--

ALTER SEQUENCE public.translations_historicaltranslation_history_id_seq OWNED BY public.translations_historicaltranslation.history_id;


--
-- Name: translations_translation; Type: TABLE; Schema: public; Owner: app_user
--

CREATE TABLE public.translations_translation (
    id bigint NOT NULL,
    txt_original text NOT NULL,
    txt_translation text,
    status smallint NOT NULL,
    qa_comment text,
    user_qa_id integer,
    user_translator_id integer,
    due timestamp with time zone
);


ALTER TABLE public.translations_translation OWNER TO app_user;

--
-- Name: translations_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: app_user
--

CREATE SEQUENCE public.translations_translation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translations_translation_id_seq OWNER TO app_user;

--
-- Name: translations_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_user
--

ALTER SEQUENCE public.translations_translation_id_seq OWNED BY public.translations_translation.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: translations_historicaltranslation history_id; Type: DEFAULT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.translations_historicaltranslation ALTER COLUMN history_id SET DEFAULT nextval('public.translations_historicaltranslation_history_id_seq'::regclass);


--
-- Name: translations_translation id; Type: DEFAULT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.translations_translation ALTER COLUMN id SET DEFAULT nextval('public.translations_translation_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: app_user
--

COPY public.auth_group (id, name) FROM stdin;
2	QA
1	Translators
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: app_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	49
2	1	29
4	2	39
5	2	41
6	2	43
7	2	44
8	2	48
9	2	50
10	1	28
11	2	28
12	1	38
13	1	33
14	1	39
15	1	34
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: app_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add translation	7	add_translation
26	Can change translation	7	change_translation
27	Can delete translation	7	delete_translation
28	Can view translation	7	view_translation
29	Can move from In Queue to In Process	7	can_move_from_10_to_20
30	Can move from In Queue to Translated	7	can_move_from_10_to_30
31	Can move from In Queue to Checking	7	can_move_from_10_to_40
32	Can move from In Queue to Checked	7	can_move_from_10_to_50
33	Can move from In Process to In Queue	7	can_move_from_20_to_10
34	Can move from In Process to Translated	7	can_move_from_20_to_30
35	Can move from In Process to Checking	7	can_move_from_20_to_40
36	Can move from In Process to Checked	7	can_move_from_20_to_50
37	Can move from Translated to In Queue	7	can_move_from_30_to_10
38	Can move from Translated to In Process	7	can_move_from_30_to_20
39	Can move from Translated to Checking	7	can_move_from_30_to_40
40	Can move from Translated to Checked	7	can_move_from_30_to_50
41	Can move from Checking to In Queue	7	can_move_from_40_to_10
42	Can move from Checking to In Process	7	can_move_from_40_to_20
43	Can move from Checking to Translated	7	can_move_from_40_to_30
44	Can move from Checking to Checked	7	can_move_from_40_to_50
45	Can move from Checked to In Queue	7	can_move_from_50_to_10
46	Can move from Checked to In Process	7	can_move_from_50_to_20
47	Can move from Checked to Translated	7	can_move_from_50_to_30
48	Can move from Checked to Checking	7	can_move_from_50_to_40
49	Can Change Translation	7	can_change_translation
50	Can Change QA Comment	7	can_change_qa_comment
51	Can add historical translation	8	add_historicaltranslation
52	Can change historical translation	8	change_historicaltranslation
53	Can delete historical translation	8	delete_historicaltranslation
54	Can view historical translation	8	view_historicaltranslation
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: app_user
-- translator and qa passwords are Occipital123
-- admin password is 1
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$260000$DrhyvyAck47yzYg99xbifL$UWkNA694iPftt1DXgX0W81Qnzo4dDEU97JLvbYxgiG0=	2022-09-14 09:29:32.679853+00	f	translator				t	t	2022-09-13 12:02:46+00
2	pbkdf2_sha256$260000$xR4c8sLx0501oAs9cPB2rD$z+6MdEgkaiDm7zC7PeZtcF/ulgjSHC3qH/oJjL34Qmw=	2022-09-14 14:52:03.646649+00	f	qa				t	t	2022-09-13 12:02:02+00
1	pbkdf2_sha256$260000$kG4D8WSajnz9OEjavJBIsq$tPfJ2uWJnrVKG+/zwi52Mbceyh31WOH3sptI1Jt0lnM=	2022-09-22 19:06:51.051118+00	t	admin			admin@occipital.com	t	t	2022-09-11 18:10:58.296539+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: app_user
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	2	2
2	3	1
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: app_user
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: app_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-09-13 11:54:38.572765+00	1	Translators	1	[{"added": {}}]	3	1
2	2022-09-13 12:00:14.584891+00	2	QA	1	[{"added": {}}]	3	1
3	2022-09-13 12:02:02.979043+00	2	qa	1	[{"added": {}}]	4	1
4	2022-09-13 12:02:17.022658+00	2	qa	2	[{"changed": {"fields": ["Staff status"]}}]	4	1
5	2022-09-13 12:02:24.533559+00	2	qa	2	[{"changed": {"fields": ["Groups"]}}]	4	1
6	2022-09-13 12:02:46.373035+00	3	translator	1	[{"added": {}}]	4	1
7	2022-09-13 12:02:56.714778+00	3	translator	2	[{"changed": {"fields": ["Groups"]}}]	4	1
8	2022-09-13 12:03:02.174927+00	3	translator	2	[{"changed": {"fields": ["Staff status"]}}]	4	1
9	2022-09-13 12:16:40.005562+00	1	Translators	2	[{"changed": {"fields": ["Permissions"]}}]	3	1
10	2022-09-13 12:16:47.941923+00	2	QA	2	[{"changed": {"fields": ["Permissions"]}}]	3	1
11	2022-09-13 12:38:57.584034+00	1	Translation object (1)	1	[{"added": {}}]	7	1
12	2022-09-14 09:30:18.656599+00	1	Translators	2	[{"changed": {"fields": ["Permissions"]}}]	3	1
13	2022-09-14 09:52:33.885203+00	1	Translators	2	[{"changed": {"fields": ["Permissions"]}}]	3	1
14	2022-09-14 10:04:57.655216+00	1	Original	2	[{"changed": {"fields": ["Status"]}}]	7	1
15	2022-09-14 10:07:04.416439+00	1	Original	2	[{"changed": {"fields": ["Status"]}}]	7	1
16	2022-09-14 14:51:18.328642+00	1	Translators	2	[{"changed": {"fields": ["Permissions"]}}]	3	1
17	2022-09-14 15:06:32.421027+00	1	Origin Text	1	[{"added": {}}]	7	1
18	2022-09-14 15:06:39.907969+00	2	Welcome	1	[{"added": {}}]	7	1
19	2022-09-14 15:06:45.301911+00	3	To	1	[{"added": {}}]	7	1
20	2022-09-14 15:06:52.229624+00	4	The Occipital	1	[{"added": {}}]	7	1
21	2022-09-14 15:06:55.933817+00	5	Team	1	[{"added": {}}]	7	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: app_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	translations	translation
8	translations	historicaltranslation
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: app_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-09-11 18:01:15.832132+00
2	auth	0001_initial	2022-09-11 18:01:15.91321+00
3	admin	0001_initial	2022-09-11 18:01:15.932617+00
4	admin	0002_logentry_remove_auto_add	2022-09-11 18:01:15.940707+00
5	admin	0003_logentry_add_action_flag_choices	2022-09-11 18:01:15.950279+00
6	contenttypes	0002_remove_content_type_name	2022-09-11 18:01:15.972956+00
7	auth	0002_alter_permission_name_max_length	2022-09-11 18:01:15.98465+00
8	auth	0003_alter_user_email_max_length	2022-09-11 18:01:15.995476+00
9	auth	0004_alter_user_username_opts	2022-09-11 18:01:16.007296+00
10	auth	0005_alter_user_last_login_null	2022-09-11 18:01:16.020277+00
11	auth	0006_require_contenttypes_0002	2022-09-11 18:01:16.023199+00
12	auth	0007_alter_validators_add_error_messages	2022-09-11 18:01:16.032345+00
13	auth	0008_alter_user_username_max_length	2022-09-11 18:01:16.046863+00
14	auth	0009_alter_user_last_name_max_length	2022-09-11 18:01:16.062204+00
15	auth	0010_alter_group_name_max_length	2022-09-11 18:01:16.074094+00
16	auth	0011_update_proxy_permissions	2022-09-11 18:01:16.084677+00
17	auth	0012_alter_user_first_name_max_length	2022-09-11 18:01:16.098973+00
18	sessions	0001_initial	2022-09-11 18:01:16.112225+00
23	translations	0001_initial	2022-09-14 15:02:40.239202+00
24	translations	0002_translation_due	2022-09-22 19:03:49.180819+00
25	translations	0003_historicaltranslation	2022-09-22 19:03:49.21453+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: app_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
cnyxbsjcf5g1yaojpih05e2l2wv4cqmd	.eJxVjEEOwiAQRe_C2hCYMRRcuvcMZAYGqRqalHbVeHdt0oVu_3vvbyrSutS4dpnjmNVFWXX63ZjSU9oO8oPafdJpass8st4VfdCub1OW1_Vw_w4q9fqt2VnvC7AEk2whScaIAIgnBGcYDWGAAoM4LOB9wDRYlDNzpsIMrN4f7344ew:1oY4on:FH_gESzWsflyyFh9y2r8TsfRh-7n_qQDgWdczb8Gews	2022-09-27 12:15:09.393957+00
61fpadahwki4nq7zj5i3ixzhaeoc8vak	.eJxVjMsOwiAQRf-FtSHDG1y69xvIUBipGkhKuzL-uzbpQrf3nHNfLOK21riNssQ5szNT7PS7JZwepe0g37HdOp96W5c58V3hBx382nN5Xg7376DiqN86echBB5JeoYSCHqSnIMhJZ0xGssmC08HqBCqRIxMUFQuZ0AlwIrD3B9GEN1g:1oY6Sy:4CICo98ESXENYN88XzHZb-fEyJcavXjsgUdn_OIhtNo	2022-09-27 14:00:44.154054+00
b01h56bneaere920kvcc19021wsda3q7	.eJxVjMsOwiAQRf-FtSHDG1y69xvIUBipGkhKuzL-uzbpQrf3nHNfLOK21riNssQ5szNT7PS7JZwepe0g37HdOp96W5c58V3hBx382nN5Xg7376DiqN86echBB5JeoYSCHqSnIMhJZ0xGssmC08HqBCqRIxMUFQuZ0AlwIrD3B9GEN1g:1oYOi4:2tRnA49Yu1pfdGQ4rQ-uena64k16_mhDelnZa6TRGJc	2022-09-28 09:29:32.685459+00
qmj1shhbo8jb41o03yjmpulngodc00ey	.eJxVjE0OgjAYBe_StWkoLQVcuucM5Pt5CmrahMLKeHclYaHbNzPvZUba1mncCpZxVnM2tTn9bkzyQNqB3indspWc1mVmuyv2oMUOWfG8HO7fwURl-ta9RIAcVVprC8jV1X0DzyqxV7RetEIIUUNDlY8QBTfcKTM4suuceX8AJAU5qQ:1oYTkB:9XFXz_sCcBnTHxYTY_YHEKfgeN3Z0-wpY90NwpI6G3E	2022-09-28 14:52:03.649202+00
owkn8nlgx8m9vx3j2uxlt626ugxo7zm4	.eJxVjEEOwiAQRe_C2hCYMRRcuvcMZAYGqRqalHbVeHdt0oVu_3vvbyrSutS4dpnjmNVFWXX63ZjSU9oO8oPafdJpass8st4VfdCub1OW1_Vw_w4q9fqt2VnvC7AEk2whScaIAIgnBGcYDWGAAoM4LOB9wDRYlDNzpsIMrN4f7344ew:1obRX9:6NJDDwhZ5t2Qqk1QMX36HCDHs-on5B68srX8KT0C6CA	2022-10-06 19:06:51.054079+00
\.


--
-- Data for Name: translations_historicaltranslation; Type: TABLE DATA; Schema: public; Owner: app_user
--

COPY public.translations_historicaltranslation (id, txt_original, txt_translation, status, qa_comment, due, history_id, history_date, history_change_reason, history_type, history_user_id, user_qa_id, user_translator_id) FROM stdin;
2	Welcome		10		\N	1	2022-09-22 19:04:15.307407+00		+	\N	\N	\N
3	To		10		\N	2	2022-09-22 19:04:15.307707+00		+	\N	\N	\N
5	Team		10		\N	3	2022-09-22 19:04:15.307887+00		+	\N	\N	\N
1	Origin Text	I like	20		\N	4	2022-09-22 19:04:15.308042+00		+	\N	\N	\N
4	The Occipital	OOO	30		\N	5	2022-09-22 19:04:15.308197+00		+	\N	\N	\N
\.


--
-- Data for Name: translations_translation; Type: TABLE DATA; Schema: public; Owner: app_user
--

COPY public.translations_translation (id, txt_original, txt_translation, status, qa_comment, user_qa_id, user_translator_id, due) FROM stdin;
2	Welcome		10		\N	\N	\N
3	To		10		\N	\N	\N
5	Team		10		\N	\N	\N
1	Origin Text	I like	20		\N	\N	\N
4	The Occipital	OOO	30		\N	\N	\N
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 15, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 54, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_user
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 2, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_user
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_user
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 21, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- Name: translations_historicaltranslation_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_user
--

SELECT pg_catalog.setval('public.translations_historicaltranslation_history_id_seq', 5, true);


--
-- Name: translations_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_user
--

SELECT pg_catalog.setval('public.translations_translation_id_seq', 5, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: translations_historicaltranslation translations_historicaltranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.translations_historicaltranslation
    ADD CONSTRAINT translations_historicaltranslation_pkey PRIMARY KEY (history_id);


--
-- Name: translations_translation translations_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.translations_translation
    ADD CONSTRAINT translations_translation_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: app_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: app_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: app_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: app_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: app_user
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: app_user
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: app_user
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: app_user
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: app_user
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: app_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: app_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: app_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: app_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: translations_historicaltranslation_history_date_ec77decc; Type: INDEX; Schema: public; Owner: app_user
--

CREATE INDEX translations_historicaltranslation_history_date_ec77decc ON public.translations_historicaltranslation USING btree (history_date);


--
-- Name: translations_historicaltranslation_history_user_id_2965e532; Type: INDEX; Schema: public; Owner: app_user
--

CREATE INDEX translations_historicaltranslation_history_user_id_2965e532 ON public.translations_historicaltranslation USING btree (history_user_id);


--
-- Name: translations_historicaltranslation_id_03c9a855; Type: INDEX; Schema: public; Owner: app_user
--

CREATE INDEX translations_historicaltranslation_id_03c9a855 ON public.translations_historicaltranslation USING btree (id);


--
-- Name: translations_historicaltranslation_user_qa_id_7c53f03b; Type: INDEX; Schema: public; Owner: app_user
--

CREATE INDEX translations_historicaltranslation_user_qa_id_7c53f03b ON public.translations_historicaltranslation USING btree (user_qa_id);


--
-- Name: translations_historicaltranslation_user_translator_id_48127a45; Type: INDEX; Schema: public; Owner: app_user
--

CREATE INDEX translations_historicaltranslation_user_translator_id_48127a45 ON public.translations_historicaltranslation USING btree (user_translator_id);


--
-- Name: translations_translation_user_qa_id_6eec28c4; Type: INDEX; Schema: public; Owner: app_user
--

CREATE INDEX translations_translation_user_qa_id_6eec28c4 ON public.translations_translation USING btree (user_qa_id);


--
-- Name: translations_translation_user_translator_id_9d96f6a0; Type: INDEX; Schema: public; Owner: app_user
--

CREATE INDEX translations_translation_user_translator_id_9d96f6a0 ON public.translations_translation USING btree (user_translator_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: translations_historicaltranslation translations_histori_history_user_id_2965e532_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.translations_historicaltranslation
    ADD CONSTRAINT translations_histori_history_user_id_2965e532_fk_auth_user FOREIGN KEY (history_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: translations_translation translations_transla_user_translator_id_9d96f6a0_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.translations_translation
    ADD CONSTRAINT translations_transla_user_translator_id_9d96f6a0_fk_auth_user FOREIGN KEY (user_translator_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: translations_translation translations_translation_user_qa_id_6eec28c4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: app_user
--

ALTER TABLE ONLY public.translations_translation
    ADD CONSTRAINT translations_translation_user_qa_id_6eec28c4_fk_auth_user_id FOREIGN KEY (user_qa_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

