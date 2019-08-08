--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

-- Started on 2019-08-08 00:44:25

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

SET default_with_oids = false;

--
-- TOC entry 233 (class 1259 OID 18282)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    parent_id integer,
    "order" integer DEFAULT 1 NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 18280)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 232
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 213 (class 1259 OID 18109)
-- Name: data_rows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_rows (
    id integer NOT NULL,
    data_type_id integer NOT NULL,
    field character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    display_name character varying(255) NOT NULL,
    required boolean DEFAULT false NOT NULL,
    browse boolean DEFAULT true NOT NULL,
    read boolean DEFAULT true NOT NULL,
    edit boolean DEFAULT true NOT NULL,
    add boolean DEFAULT true NOT NULL,
    delete boolean DEFAULT true NOT NULL,
    details text,
    "order" integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.data_rows OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 18107)
-- Name: data_rows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.data_rows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_rows_id_seq OWNER TO postgres;

--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 212
-- Name: data_rows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.data_rows_id_seq OWNED BY public.data_rows.id;


--
-- TOC entry 211 (class 1259 OID 18093)
-- Name: data_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_types (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    display_name_singular character varying(255) NOT NULL,
    display_name_plural character varying(255) NOT NULL,
    icon character varying(255),
    model_name character varying(255),
    description character varying(255),
    generate_permissions boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    server_side smallint DEFAULT '0'::smallint NOT NULL,
    controller character varying(255),
    policy_name character varying(255),
    details text
);


ALTER TABLE public.data_types OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 18091)
-- Name: data_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.data_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_types_id_seq OWNER TO postgres;

--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 210
-- Name: data_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.data_types_id_seq OWNED BY public.data_types.id;


--
-- TOC entry 217 (class 1259 OID 18141)
-- Name: menu_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_items (
    id integer NOT NULL,
    menu_id integer,
    title character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    target character varying(255) DEFAULT '_self'::character varying NOT NULL,
    icon_class character varying(255),
    color character varying(255),
    parent_id integer,
    "order" integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    route character varying(255),
    parameters text
);


ALTER TABLE public.menu_items OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 18139)
-- Name: menu_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_items_id_seq OWNER TO postgres;

--
-- TOC entry 3098 (class 0 OID 0)
-- Dependencies: 216
-- Name: menu_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_items_id_seq OWNED BY public.menu_items.id;


--
-- TOC entry 215 (class 1259 OID 18131)
-- Name: menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menus (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.menus OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 18129)
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menus_id_seq OWNER TO postgres;

--
-- TOC entry 3099 (class 0 OID 0)
-- Dependencies: 214
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menus_id_seq OWNED BY public.menus.id;


--
-- TOC entry 197 (class 1259 OID 16443)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16441)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3100 (class 0 OID 0)
-- Dependencies: 196
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 202 (class 1259 OID 18042)
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_access_tokens (
    id character varying(100) NOT NULL,
    user_id integer,
    client_id integer NOT NULL,
    name character varying(255),
    scopes text,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_access_tokens OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 18034)
-- Name: oauth_auth_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_auth_codes (
    id character varying(100) NOT NULL,
    user_id integer NOT NULL,
    client_id integer NOT NULL,
    scopes text,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_auth_codes OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 18059)
-- Name: oauth_clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_clients (
    id integer NOT NULL,
    user_id integer,
    name character varying(255) NOT NULL,
    secret character varying(100) NOT NULL,
    redirect text NOT NULL,
    personal_access_client boolean NOT NULL,
    password_client boolean NOT NULL,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_clients OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 18057)
-- Name: oauth_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_clients_id_seq OWNER TO postgres;

--
-- TOC entry 3101 (class 0 OID 0)
-- Dependencies: 204
-- Name: oauth_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_clients_id_seq OWNED BY public.oauth_clients.id;


--
-- TOC entry 207 (class 1259 OID 18071)
-- Name: oauth_personal_access_clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_personal_access_clients (
    id integer NOT NULL,
    client_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_personal_access_clients OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 18069)
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_personal_access_clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_personal_access_clients_id_seq OWNER TO postgres;

--
-- TOC entry 3102 (class 0 OID 0)
-- Dependencies: 206
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_personal_access_clients_id_seq OWNED BY public.oauth_personal_access_clients.id;


--
-- TOC entry 203 (class 1259 OID 18051)
-- Name: oauth_refresh_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_refresh_tokens (
    id character varying(100) NOT NULL,
    access_token_id character varying(100) NOT NULL,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_refresh_tokens OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 18251)
-- Name: pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    author_id integer NOT NULL,
    title character varying(255) NOT NULL,
    excerpt text,
    body text,
    image character varying(255),
    slug character varying(255) NOT NULL,
    meta_description text,
    meta_keywords text,
    status character varying(255) DEFAULT 'INACTIVE'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT pages_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'INACTIVE'::character varying])::text[])))
);


ALTER TABLE public.pages OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 18249)
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO postgres;

--
-- TOC entry 3103 (class 0 OID 0)
-- Dependencies: 228
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- TOC entry 200 (class 1259 OID 18027)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 18195)
-- Name: permission_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permission_role (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.permission_role OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18185)
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    key character varying(255) NOT NULL,
    table_name character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 18183)
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 222
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- TOC entry 231 (class 1259 OID 18266)
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    author_id integer NOT NULL,
    category_id integer,
    title character varying(255) NOT NULL,
    seo_title character varying(255),
    excerpt text,
    body text NOT NULL,
    image character varying(255),
    slug character varying(255) NOT NULL,
    meta_description text,
    meta_keywords text,
    status character varying(255) DEFAULT 'DRAFT'::character varying NOT NULL,
    featured boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT posts_status_check CHECK (((status)::text = ANY ((ARRAY['PUBLISHED'::character varying, 'DRAFT'::character varying, 'PENDING'::character varying])::text[])))
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 18264)
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO postgres;

--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 230
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- TOC entry 219 (class 1259 OID 18158)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    display_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 18156)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 218
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 221 (class 1259 OID 18171)
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    key character varying(255) NOT NULL,
    display_name character varying(255) NOT NULL,
    value text,
    details text,
    type character varying(255) NOT NULL,
    "order" integer DEFAULT 1 NOT NULL,
    "group" character varying(255)
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18169)
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO postgres;

--
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 220
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- TOC entry 209 (class 1259 OID 18080)
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    id bigint NOT NULL,
    user_uid character varying(255) NOT NULL,
    amount double precision NOT NULL,
    transaction_type character varying(255) NOT NULL,
    transaction_uid character varying(255) NOT NULL,
    month character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    payment_data json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 18078)
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO postgres;

--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 208
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- TOC entry 226 (class 1259 OID 18215)
-- Name: translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.translations (
    id integer NOT NULL,
    table_name character varying(255) NOT NULL,
    column_name character varying(255) NOT NULL,
    foreign_key integer NOT NULL,
    locale character varying(255) NOT NULL,
    value text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.translations OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18213)
-- Name: translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translations_id_seq OWNER TO postgres;

--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 225
-- Name: translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.translations_id_seq OWNED BY public.translations.id;


--
-- TOC entry 227 (class 1259 OID 18232)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 18014)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone_no character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    user_uid character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    meter_number character varying(255),
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    avatar character varying(255) DEFAULT 'users/default.png'::character varying,
    role_id bigint,
    settings text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 18012)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 198
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2847 (class 2604 OID 18285)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 2824 (class 2604 OID 18112)
-- Name: data_rows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_rows ALTER COLUMN id SET DEFAULT nextval('public.data_rows_id_seq'::regclass);


--
-- TOC entry 2821 (class 2604 OID 18096)
-- Name: data_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_types ALTER COLUMN id SET DEFAULT nextval('public.data_types_id_seq'::regclass);


--
-- TOC entry 2833 (class 2604 OID 18144)
-- Name: menu_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items ALTER COLUMN id SET DEFAULT nextval('public.menu_items_id_seq'::regclass);


--
-- TOC entry 2832 (class 2604 OID 18134)
-- Name: menus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus ALTER COLUMN id SET DEFAULT nextval('public.menus_id_seq'::regclass);


--
-- TOC entry 2815 (class 2604 OID 16446)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 2818 (class 2604 OID 18062)
-- Name: oauth_clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_clients ALTER COLUMN id SET DEFAULT nextval('public.oauth_clients_id_seq'::regclass);


--
-- TOC entry 2819 (class 2604 OID 18074)
-- Name: oauth_personal_access_clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_personal_access_clients ALTER COLUMN id SET DEFAULT nextval('public.oauth_personal_access_clients_id_seq'::regclass);


--
-- TOC entry 2840 (class 2604 OID 18254)
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- TOC entry 2838 (class 2604 OID 18188)
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- TOC entry 2843 (class 2604 OID 18269)
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- TOC entry 2835 (class 2604 OID 18161)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 2836 (class 2604 OID 18174)
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- TOC entry 2820 (class 2604 OID 18083)
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- TOC entry 2839 (class 2604 OID 18218)
-- Name: translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translations ALTER COLUMN id SET DEFAULT nextval('public.translations_id_seq'::regclass);


--
-- TOC entry 2816 (class 2604 OID 18017)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3089 (class 0 OID 18282)
-- Dependencies: 233
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, parent_id, "order", name, slug, created_at, updated_at) FROM stdin;
1	\N	1	Category 1	category-1	2019-08-05 07:08:55	2019-08-05 07:08:55
2	\N	1	Category 2	category-2	2019-08-05 07:08:55	2019-08-05 07:08:55
\.


--
-- TOC entry 3069 (class 0 OID 18109)
-- Dependencies: 213
-- Data for Name: data_rows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_rows (id, data_type_id, field, type, display_name, required, browse, read, edit, add, delete, details, "order") FROM stdin;
12	2	id	number	ID	t	f	f	f	f	f	\N	1
13	2	name	text	Name	t	t	t	t	t	t	\N	2
14	2	created_at	timestamp	Created At	f	f	f	f	f	f	\N	3
15	2	updated_at	timestamp	Updated At	f	f	f	f	f	f	\N	4
16	3	id	number	ID	t	f	f	f	f	f	\N	1
17	3	name	text	Name	t	t	t	t	t	t	\N	2
18	3	created_at	timestamp	Created At	f	f	f	f	f	f	\N	3
19	3	updated_at	timestamp	Updated At	f	f	f	f	f	f	\N	4
20	3	display_name	text	Display Name	t	t	t	t	t	t	\N	5
22	4	id	number	ID	t	f	f	f	f	f	\N	1
23	4	parent_id	select_dropdown	Parent	f	f	t	t	t	t	{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}	2
24	4	order	text	Order	t	t	t	t	t	t	{"default":1}	3
25	4	name	text	Name	t	t	t	t	t	t	\N	4
26	4	slug	text	Slug	t	t	t	t	t	t	{"slugify":{"origin":"name"}}	5
27	4	created_at	timestamp	Created At	f	f	t	f	f	f	\N	6
28	4	updated_at	timestamp	Updated At	f	f	f	f	f	f	\N	7
29	5	id	number	ID	t	f	f	f	f	f	\N	1
30	5	author_id	text	Author	t	f	t	t	f	t	\N	2
31	5	category_id	text	Category	t	f	t	t	t	f	\N	3
32	5	title	text	Title	t	t	t	t	t	t	\N	4
33	5	excerpt	text_area	Excerpt	t	f	t	t	t	t	\N	5
34	5	body	rich_text_box	Body	t	f	t	t	t	t	\N	6
35	5	image	image	Post Image	f	t	t	t	t	t	{"resize":{"width":"1000","height":"null"},"quality":"70%","upsize":true,"thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}	7
36	5	slug	text	Slug	t	f	t	t	t	t	{"slugify":{"origin":"title","forceUpdate":true},"validation":{"rule":"unique:posts,slug"}}	8
37	5	meta_description	text_area	Meta Description	t	f	t	t	t	t	\N	9
38	5	meta_keywords	text_area	Meta Keywords	t	f	t	t	t	t	\N	10
39	5	status	select_dropdown	Status	t	t	t	t	t	t	{"default":"DRAFT","options":{"PUBLISHED":"published","DRAFT":"draft","PENDING":"pending"}}	11
40	5	created_at	timestamp	Created At	f	t	t	f	f	f	\N	12
41	5	updated_at	timestamp	Updated At	f	f	f	f	f	f	\N	13
42	5	seo_title	text	SEO Title	f	t	t	t	t	t	\N	14
43	5	featured	checkbox	Featured	t	t	t	t	t	t	\N	15
44	6	id	number	ID	t	f	f	f	f	f	\N	1
45	6	author_id	text	Author	t	f	f	f	f	f	\N	2
46	6	title	text	Title	t	t	t	t	t	t	\N	3
47	6	excerpt	text_area	Excerpt	t	f	t	t	t	t	\N	4
48	6	body	rich_text_box	Body	t	f	t	t	t	t	\N	5
49	6	slug	text	Slug	t	f	t	t	t	t	{"slugify":{"origin":"title"},"validation":{"rule":"unique:pages,slug"}}	6
50	6	meta_description	text	Meta Description	t	f	t	t	t	t	\N	7
51	6	meta_keywords	text	Meta Keywords	t	f	t	t	t	t	\N	8
52	6	status	select_dropdown	Status	t	t	t	t	t	t	{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}	9
53	6	created_at	timestamp	Created At	t	t	t	f	f	f	\N	10
54	6	updated_at	timestamp	Updated At	t	f	f	f	f	f	\N	11
55	6	image	image	Page Image	f	t	t	t	t	t	\N	12
56	7	id	text	Id	t	f	f	f	f	f	{}	1
57	7	user_uid	text	User Uid	t	t	t	t	t	t	{}	2
58	7	amount	text	Amount	t	t	t	t	t	t	{}	3
59	7	transaction_type	text	Transaction Type	t	t	t	t	t	t	{}	4
60	7	transaction_uid	text	Transaction Uid	t	t	t	t	t	t	{}	5
61	7	month	text	Month	t	t	t	t	t	t	{}	6
62	7	status	text	Status	t	t	t	f	f	f	{}	7
63	7	payment_data	text	Payment Data	f	t	t	f	t	f	{}	8
64	7	created_at	timestamp	Created At	f	f	f	f	f	f	{}	9
65	7	updated_at	timestamp	Updated At	f	f	f	f	f	f	{}	10
66	7	transaction_belongsto_user_relationship	relationship	users	f	t	t	t	t	t	{"model":"App\\\\User","table":"users","type":"belongsTo","column":"user_uid","key":"user_uid","label":"user_uid","pivot_table":"migrations","pivot":"0","taggable":"0"}	11
1	1	id	number	ID	t	f	f	f	f	f	{}	1
67	1	firstname	text	Firstname	t	t	t	t	t	t	{}	3
68	1	lastname	text	Lastname	t	t	t	t	t	t	{}	4
3	1	email	text	Email	t	t	t	t	t	t	{}	3
69	1	phone_no	text	Phone No	t	t	t	t	t	t	{}	6
70	1	email_verified_at	timestamp	Email Verified At	f	t	t	t	t	t	{}	7
71	1	user_uid	text	User Uid	t	t	t	t	t	t	{}	8
4	1	password	password	Password	t	f	f	t	t	f	{}	4
72	1	meter_number	text	Meter Number	f	t	t	t	t	t	{}	10
5	1	remember_token	text	Remember Token	f	f	f	f	f	f	{}	5
6	1	created_at	timestamp	Created At	f	t	t	f	f	f	{}	6
7	1	updated_at	timestamp	Updated At	f	f	f	f	f	f	{}	7
8	1	avatar	image	Avatar	f	t	t	t	t	t	{}	8
21	1	role_id	text	Role	f	f	f	f	f	f	{}	9
11	1	settings	hidden	Settings	f	f	f	f	f	f	{}	12
73	1	user_belongsto_role_relationship	relationship	Role	f	t	t	t	t	f	{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":"0"}	13
\.


--
-- TOC entry 3067 (class 0 OID 18093)
-- Dependencies: 211
-- Data for Name: data_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_types (id, name, slug, display_name_singular, display_name_plural, icon, model_name, description, generate_permissions, created_at, updated_at, server_side, controller, policy_name, details) FROM stdin;
2	menus	menus	Menu	Menus	voyager-list	TCG\\Voyager\\Models\\Menu		t	2019-08-05 07:08:54	2019-08-05 07:08:54	0		\N	\N
3	roles	roles	Role	Roles	voyager-lock	TCG\\Voyager\\Models\\Role		t	2019-08-05 07:08:54	2019-08-05 07:08:54	0		\N	\N
4	categories	categories	Category	Categories	voyager-categories	TCG\\Voyager\\Models\\Category		t	2019-08-05 07:08:55	2019-08-05 07:08:55	0		\N	\N
5	posts	posts	Post	Posts	voyager-news	TCG\\Voyager\\Models\\Post		t	2019-08-05 07:16:20	2019-08-05 07:16:20	0		TCG\\Voyager\\Policies\\PostPolicy	\N
6	pages	pages	Page	Pages	voyager-file-text	TCG\\Voyager\\Models\\Page		t	2019-08-05 07:16:20	2019-08-05 07:16:20	0		\N	\N
1	users	users	User	Users	voyager-person	TCG\\Voyager\\Models\\User	\N	t	2019-08-05 07:08:54	2019-08-07 12:02:24	0	TCG\\Voyager\\Http\\Controllers\\VoyagerUserController	TCG\\Voyager\\Policies\\UserPolicy	{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null,"scope":null}
7	transactions	transactions	Transaction	Transactions	voyager-receipt	App\\Transaction	All transactions made by users	t	2019-08-06 22:23:17	2019-08-07 14:06:07	1	\N	\N	{"order_column":"id","order_display_column":"id","order_direction":"asc","default_search_key":"transaction_uid","scope":null}
\.


--
-- TOC entry 3073 (class 0 OID 18141)
-- Dependencies: 217
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_items (id, menu_id, title, url, target, icon_class, color, parent_id, "order", created_at, updated_at, route, parameters) FROM stdin;
1	1	Dashboard		_self	voyager-boat	\N	\N	1	2019-08-05 07:08:54	2019-08-05 07:08:54	voyager.dashboard	\N
2	1	Media		_self	voyager-images	\N	\N	5	2019-08-05 07:08:54	2019-08-05 07:08:54	voyager.media.index	\N
3	1	Users		_self	voyager-person	\N	\N	3	2019-08-05 07:08:54	2019-08-05 07:08:54	voyager.users.index	\N
4	1	Roles		_self	voyager-lock	\N	\N	2	2019-08-05 07:08:54	2019-08-05 07:08:54	voyager.roles.index	\N
5	1	Tools		_self	voyager-tools	\N	\N	9	2019-08-05 07:08:54	2019-08-05 07:08:54	\N	\N
6	1	Menu Builder		_self	voyager-list	\N	5	10	2019-08-05 07:08:54	2019-08-05 07:08:54	voyager.menus.index	\N
7	1	Database		_self	voyager-data	\N	5	11	2019-08-05 07:08:54	2019-08-05 07:08:54	voyager.database.index	\N
8	1	Compass		_self	voyager-compass	\N	5	12	2019-08-05 07:08:54	2019-08-05 07:08:54	voyager.compass.index	\N
9	1	BREAD		_self	voyager-bread	\N	5	13	2019-08-05 07:08:54	2019-08-05 07:08:54	voyager.bread.index	\N
10	1	Settings		_self	voyager-settings	\N	\N	14	2019-08-05 07:08:54	2019-08-05 07:08:54	voyager.settings.index	\N
14	1	Hooks		_self	voyager-hook	\N	5	13	2019-08-05 07:16:20	2019-08-05 07:16:20	voyager.hooks	\N
15	1	Transactions		_self	voyager-receipt	\N	\N	15	2019-08-06 22:23:17	2019-08-06 22:23:17	voyager.transactions.index	\N
\.


--
-- TOC entry 3071 (class 0 OID 18131)
-- Dependencies: 215
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menus (id, name, created_at, updated_at) FROM stdin;
1	admin	2019-08-05 07:08:54	2019-08-05 07:08:54
\.


--
-- TOC entry 3053 (class 0 OID 16443)
-- Dependencies: 197
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
160	2014_10_12_000000_create_users_table	1
161	2014_10_12_100000_create_password_resets_table	1
162	2016_06_01_000001_create_oauth_auth_codes_table	1
163	2016_06_01_000002_create_oauth_access_tokens_table	1
164	2016_06_01_000003_create_oauth_refresh_tokens_table	1
165	2016_06_01_000004_create_oauth_clients_table	1
166	2016_06_01_000005_create_oauth_personal_access_clients_table	1
167	2019_07_15_131519_create_transactions_table	1
168	2016_01_01_000000_add_voyager_user_fields	2
169	2016_01_01_000000_create_data_types_table	2
170	2016_05_19_173453_create_menu_table	2
171	2016_10_21_190000_create_roles_table	2
172	2016_10_21_190000_create_settings_table	2
173	2016_11_30_135954_create_permission_table	2
174	2016_11_30_141208_create_permission_role_table	2
175	2016_12_26_201236_data_types__add__server_side	2
176	2017_01_13_000000_add_route_to_menu_items_table	2
177	2017_01_14_005015_create_translations_table	2
178	2017_01_15_000000_make_table_name_nullable_in_permissions_table	2
179	2017_03_06_000000_add_controller_to_data_types_table	2
180	2017_04_21_000000_add_order_to_data_rows_table	2
181	2017_07_05_210000_add_policyname_to_data_types_table	2
182	2017_08_05_000000_add_group_to_settings_table	2
183	2017_11_26_013050_add_user_role_relationship	2
184	2017_11_26_015000_create_user_roles_table	2
185	2018_03_11_000000_add_user_settings	2
186	2018_03_14_000000_add_details_to_data_types_table	2
187	2018_03_16_000000_make_settings_value_nullable	2
188	2016_01_01_000000_create_pages_table	3
189	2016_01_01_000000_create_posts_table	3
190	2016_02_15_204651_create_categories_table	3
191	2017_04_11_000000_alter_post_nullable_fields_table	3
\.


--
-- TOC entry 3058 (class 0 OID 18042)
-- Dependencies: 202
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_access_tokens (id, user_id, client_id, name, scopes, revoked, created_at, updated_at, expires_at) FROM stdin;
460a6cc26f80c0b24bf34db7203329359f162a57ee019b272b8e8ac0542ae77f09f296349a857486	1	7	\N	[]	f	2019-08-04 22:41:24	2019-08-04 22:41:24	2019-09-03 22:41:24
c499f2265385652a41bf332d2527bd43088f8e76053f744fb1da8f6f2c4eb9f116da935784b7adb1	1	7	\N	[]	f	2019-08-04 22:42:55	2019-08-04 22:42:55	2019-09-03 22:42:55
cde66211005dba1305062d707e922146b2125abdc8b2f715ee72b07dd4f78fcc2b345951493afc81	1	7	\N	[]	f	2019-08-04 22:58:31	2019-08-04 22:58:31	2019-09-03 22:58:31
da68adc73ca6b62f95cb8e4434f9abb0697905eb513532dffc3b69872e3e73f6e6fc69f0b6f5a90d	1	7	\N	[]	f	2019-08-05 04:20:38	2019-08-05 04:20:38	2019-09-04 04:20:34
0a3cb11226ff2838ac159a0d048644aea911d84c9bcd84836c1e9d06116b64c1c7d504b1c3e2324f	1	7	\N	[]	f	2019-08-05 04:22:58	2019-08-05 04:22:58	2019-09-04 04:22:58
814ef7bd63582fbe160852d20055d9b8f044a1733fdda2408fd2627154c85845873fe91f69094e76	1	7	\N	[]	f	2019-08-05 04:25:05	2019-08-05 04:25:05	2019-09-04 04:25:03
4ded5cc5717a5ef611c9adc412db238cc80f8a257a24f0e56a55516e06dd678dbb6d15a90503b23d	1	7	\N	[]	f	2019-08-05 04:26:51	2019-08-05 04:26:51	2019-09-04 04:26:47
643a81dce6f9c50db7e13e48a0417af84c11e71a1a4a05642cc03034c9fd02de68519ca6795444e5	1	7	\N	[]	f	2019-08-05 04:45:31	2019-08-05 04:45:31	2019-09-04 04:45:28
b533909d64d2053eec74d8f25094750ce2fb965bc0fe6bdddf2fab6f8f09279a3515f0705a7b5518	1	7	\N	[]	f	2019-08-05 04:47:46	2019-08-05 04:47:46	2019-09-04 04:47:44
4cd6a551907be94a81887e9763c841e0ad2a0e5592dff11b4595f05e91731230084966544892287a	1	7	\N	[]	f	2019-08-05 04:49:38	2019-08-05 04:49:38	2019-09-04 04:49:35
fe4a9e4fde96da3f15946f802ab190c748410df8484d7cd4c0393ca4abb4d5dc09e4748a837eee7e	1	7	\N	[]	f	2019-08-05 05:15:36	2019-08-05 05:15:36	2019-09-04 05:15:30
393ddd156ab41ac7557d3db18648288c45d537efe2fdb0adbe771625fbbf270ac0d9e9f5aa31e57a	1	7	\N	[]	f	2019-08-05 05:17:00	2019-08-05 05:17:00	2019-09-04 05:16:57
fedf14f4164098e5d9fc8ec7f400a25c3cb1ba01fa8d9fc0bccf36560925c87757a87c7f2886a638	1	7	\N	[]	f	2019-08-05 06:23:15	2019-08-05 06:23:15	2019-09-04 06:23:12
\.


--
-- TOC entry 3057 (class 0 OID 18034)
-- Dependencies: 201
-- Data for Name: oauth_auth_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_auth_codes (id, user_id, client_id, scopes, revoked, expires_at) FROM stdin;
\.


--
-- TOC entry 3061 (class 0 OID 18059)
-- Dependencies: 205
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_clients (id, user_id, name, secret, redirect, personal_access_client, password_client, revoked, created_at, updated_at) FROM stdin;
1	\N	Laravel Password Grant Client	VJku3sH7LsQOaHRyZaT3YbTDyBGH3rDWtx8UuOJl	http://localhost	f	t	f	2019-08-04 20:27:57	2019-08-04 20:27:57
3	\N	Laravel ClientCredentials Grant Client	ulr9HCBdMXqXtyeteCgE6BW3SqDWk6xCUJJmJ2lh		f	f	f	2019-08-04 20:29:01	2019-08-04 20:29:01
4	\N	Laravel Personal Access Client	PEgsgZBCubyZGJZ738UBhsjwivUNBXATtrWqLivT	http://localhost	t	f	f	2019-08-04 21:56:26	2019-08-04 21:56:26
5	\N	Laravel Password Grant Client	0fv1i7SgDJwvBXI6DFhYOxVHH8lajN5c4vdowwNP	http://localhost	f	t	f	2019-08-04 21:56:26	2019-08-04 21:56:26
6	\N	Laravel Personal Access Client	zL2QQ5gkmCCN7HU1jRTIkZeDU3RadI5pzalFRZGs	http://localhost	t	f	f	2019-08-04 21:56:43	2019-08-04 21:56:43
7	\N	Laravel Password Grant Client	PeGNzJeyEtFS1DRmq5KAyf0p0Ks400NIJx9Mw6AA	http://localhost	f	t	f	2019-08-04 21:56:43	2019-08-04 21:56:43
\.


--
-- TOC entry 3063 (class 0 OID 18071)
-- Dependencies: 207
-- Data for Name: oauth_personal_access_clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_personal_access_clients (id, client_id, created_at, updated_at) FROM stdin;
1	4	2019-08-04 21:56:26	2019-08-04 21:56:26
2	6	2019-08-04 21:56:43	2019-08-04 21:56:43
\.


--
-- TOC entry 3059 (class 0 OID 18051)
-- Dependencies: 203
-- Data for Name: oauth_refresh_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_refresh_tokens (id, access_token_id, revoked, expires_at) FROM stdin;
d574c2c88c11317446fb4ea3472733faf0977a06f92058f30a88bf59be61f6ce57bda90219a291a8	460a6cc26f80c0b24bf34db7203329359f162a57ee019b272b8e8ac0542ae77f09f296349a857486	f	2020-08-04 22:41:24
17c9f39408b93f1b9549d9ce336d7b4f9485f1721f80cedbb12eb5314f067d61914a028c8bd2a97d	c499f2265385652a41bf332d2527bd43088f8e76053f744fb1da8f6f2c4eb9f116da935784b7adb1	f	2020-08-04 22:42:55
7aa6cb76c5782ec4121b003532bf53762becf174559d1b46e1e11613bcd4c8e2f9e58ca5b52e2865	cde66211005dba1305062d707e922146b2125abdc8b2f715ee72b07dd4f78fcc2b345951493afc81	f	2020-08-04 22:58:31
a88b7b5b169e6ce28355d0aac39da6a4a03e7c601d823c0bcfee523c1f86c7e6e146b39a7f8f6a30	da68adc73ca6b62f95cb8e4434f9abb0697905eb513532dffc3b69872e3e73f6e6fc69f0b6f5a90d	f	2020-08-05 04:20:38
8f21420dd46040aad02ffe0aca18a81614f1c460b5d14997e70f5a7dc8827c4dc21c015f99e429e4	0a3cb11226ff2838ac159a0d048644aea911d84c9bcd84836c1e9d06116b64c1c7d504b1c3e2324f	f	2020-08-05 04:22:58
f424f4ab38df1bf77b1e9ef9e07a2152ec517444943c1032c5bf7731bed03d4133ff48b16108553d	814ef7bd63582fbe160852d20055d9b8f044a1733fdda2408fd2627154c85845873fe91f69094e76	f	2020-08-05 04:25:05
26bcd3c699a4ad19714ef24bf0f38bb1bdfd0847af7cf50d7916e5320fd813133b469d6b72e5cb70	4ded5cc5717a5ef611c9adc412db238cc80f8a257a24f0e56a55516e06dd678dbb6d15a90503b23d	f	2020-08-05 04:26:51
a5952eb4c069986d37cb9f16117b5dfcb5822820903fba208e44868fd31e56c066358bc139d070bb	643a81dce6f9c50db7e13e48a0417af84c11e71a1a4a05642cc03034c9fd02de68519ca6795444e5	f	2020-08-05 04:45:31
f5bbae2ab77df0e2da54d03b25ec54c7cc922eead4a7cc159a7f2f4fd9789cc197a5d134557b45a2	b533909d64d2053eec74d8f25094750ce2fb965bc0fe6bdddf2fab6f8f09279a3515f0705a7b5518	f	2020-08-05 04:47:46
0aafe2c0ff401f3e565ba5ba881741cc371a5ab6633485674f05df6a14fff5b59f80d3118fb06b08	4cd6a551907be94a81887e9763c841e0ad2a0e5592dff11b4595f05e91731230084966544892287a	f	2020-08-05 04:49:38
9c50def43afc2d877407e81e6e229b67c24ffb6823473ddaf438b77c9a1fd25bc8d1c0100c3cfb1e	fe4a9e4fde96da3f15946f802ab190c748410df8484d7cd4c0393ca4abb4d5dc09e4748a837eee7e	f	2020-08-05 05:15:36
730776c1edb1a2e83e121b28773aff4fd65968279a1c0b6dae279c33363908860c31002926204b69	393ddd156ab41ac7557d3db18648288c45d537efe2fdb0adbe771625fbbf270ac0d9e9f5aa31e57a	f	2020-08-05 05:17:00
6e3b7035862ac82dd611079af6a4d422e62808006517f81b15d5916e74d9ff912eae046fff201d01	fedf14f4164098e5d9fc8ec7f400a25c3cb1ba01fa8d9fc0bccf36560925c87757a87c7f2886a638	f	2020-08-05 06:23:15
\.


--
-- TOC entry 3085 (class 0 OID 18251)
-- Dependencies: 229
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages (id, author_id, title, excerpt, body, image, slug, meta_description, meta_keywords, status, created_at, updated_at) FROM stdin;
1	0	Hello World	Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.	<p>Hello World. Scallywag grog swab Cat o'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>	pages/page1.jpg	hello-world	Yar Meta Description	Keyword1, Keyword2	ACTIVE	2019-08-05 07:16:20	2019-08-05 07:16:20
\.


--
-- TOC entry 3056 (class 0 OID 18027)
-- Dependencies: 200
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 3080 (class 0 OID 18195)
-- Dependencies: 224
-- Data for Name: permission_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permission_role (permission_id, role_id) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
43	1
44	1
45	1
46	1
3	3
4	3
7	3
16	3
17	3
18	3
19	3
42	3
43	3
1	3
6	3
44	3
45	3
\.


--
-- TOC entry 3079 (class 0 OID 18185)
-- Dependencies: 223
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (id, key, table_name, created_at, updated_at) FROM stdin;
1	browse_admin	\N	2019-08-05 07:08:54	2019-08-05 07:08:54
2	browse_bread	\N	2019-08-05 07:08:54	2019-08-05 07:08:54
3	browse_database	\N	2019-08-05 07:08:54	2019-08-05 07:08:54
4	browse_media	\N	2019-08-05 07:08:54	2019-08-05 07:08:54
5	browse_compass	\N	2019-08-05 07:08:54	2019-08-05 07:08:54
6	browse_menus	menus	2019-08-05 07:08:54	2019-08-05 07:08:54
7	read_menus	menus	2019-08-05 07:08:54	2019-08-05 07:08:54
8	edit_menus	menus	2019-08-05 07:08:54	2019-08-05 07:08:54
9	add_menus	menus	2019-08-05 07:08:54	2019-08-05 07:08:54
10	delete_menus	menus	2019-08-05 07:08:54	2019-08-05 07:08:54
11	browse_roles	roles	2019-08-05 07:08:54	2019-08-05 07:08:54
12	read_roles	roles	2019-08-05 07:08:54	2019-08-05 07:08:54
13	edit_roles	roles	2019-08-05 07:08:54	2019-08-05 07:08:54
14	add_roles	roles	2019-08-05 07:08:54	2019-08-05 07:08:54
15	delete_roles	roles	2019-08-05 07:08:54	2019-08-05 07:08:54
16	browse_users	users	2019-08-05 07:08:54	2019-08-05 07:08:54
17	read_users	users	2019-08-05 07:08:54	2019-08-05 07:08:54
18	edit_users	users	2019-08-05 07:08:54	2019-08-05 07:08:54
19	add_users	users	2019-08-05 07:08:54	2019-08-05 07:08:54
20	delete_users	users	2019-08-05 07:08:54	2019-08-05 07:08:54
21	browse_settings	settings	2019-08-05 07:08:54	2019-08-05 07:08:54
22	read_settings	settings	2019-08-05 07:08:54	2019-08-05 07:08:54
23	edit_settings	settings	2019-08-05 07:08:54	2019-08-05 07:08:54
24	add_settings	settings	2019-08-05 07:08:54	2019-08-05 07:08:54
25	delete_settings	settings	2019-08-05 07:08:54	2019-08-05 07:08:54
26	browse_categories	categories	2019-08-05 07:08:55	2019-08-05 07:08:55
27	read_categories	categories	2019-08-05 07:08:55	2019-08-05 07:08:55
28	edit_categories	categories	2019-08-05 07:08:55	2019-08-05 07:08:55
29	add_categories	categories	2019-08-05 07:08:55	2019-08-05 07:08:55
30	delete_categories	categories	2019-08-05 07:08:55	2019-08-05 07:08:55
31	browse_posts	posts	2019-08-05 07:16:20	2019-08-05 07:16:20
32	read_posts	posts	2019-08-05 07:16:20	2019-08-05 07:16:20
33	edit_posts	posts	2019-08-05 07:16:20	2019-08-05 07:16:20
34	add_posts	posts	2019-08-05 07:16:20	2019-08-05 07:16:20
35	delete_posts	posts	2019-08-05 07:16:20	2019-08-05 07:16:20
36	browse_pages	pages	2019-08-05 07:16:20	2019-08-05 07:16:20
37	read_pages	pages	2019-08-05 07:16:20	2019-08-05 07:16:20
38	edit_pages	pages	2019-08-05 07:16:20	2019-08-05 07:16:20
39	add_pages	pages	2019-08-05 07:16:20	2019-08-05 07:16:20
40	delete_pages	pages	2019-08-05 07:16:20	2019-08-05 07:16:20
41	browse_hooks	\N	2019-08-05 07:16:20	2019-08-05 07:16:20
42	browse_transactions	transactions	2019-08-06 22:23:17	2019-08-06 22:23:17
43	read_transactions	transactions	2019-08-06 22:23:17	2019-08-06 22:23:17
44	edit_transactions	transactions	2019-08-06 22:23:17	2019-08-06 22:23:17
45	add_transactions	transactions	2019-08-06 22:23:17	2019-08-06 22:23:17
46	delete_transactions	transactions	2019-08-06 22:23:17	2019-08-06 22:23:17
\.


--
-- TOC entry 3087 (class 0 OID 18266)
-- Dependencies: 231
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, author_id, category_id, title, seo_title, excerpt, body, image, slug, meta_description, meta_keywords, status, featured, created_at, updated_at) FROM stdin;
1	0	\N	Lorem Ipsum Post	\N	This is the excerpt for the Lorem Ipsum Post	<p>This is the body of the lorem ipsum post</p>	posts/post1.jpg	lorem-ipsum-post	This is the meta description	keyword1, keyword2, keyword3	PUBLISHED	f	2019-08-05 07:16:20	2019-08-05 07:16:20
2	0	\N	My Sample Post	\N	This is the excerpt for the sample Post	<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>	posts/post2.jpg	my-sample-post	Meta Description for sample post	keyword1, keyword2, keyword3	PUBLISHED	f	2019-08-05 07:16:20	2019-08-05 07:16:20
3	0	\N	Latest Post	\N	This is the excerpt for the latest post	<p>This is the body for the latest post</p>	posts/post3.jpg	latest-post	This is the meta description	keyword1, keyword2, keyword3	PUBLISHED	f	2019-08-05 07:16:20	2019-08-05 07:16:20
4	0	\N	Yarr Post	\N	Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.	<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>	posts/post4.jpg	yarr-post	this be a meta descript	keyword1, keyword2, keyword3	PUBLISHED	f	2019-08-05 07:16:20	2019-08-05 07:16:20
\.


--
-- TOC entry 3075 (class 0 OID 18158)
-- Dependencies: 219
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, display_name, created_at, updated_at) FROM stdin;
1	admin	Administrator	2019-08-05 07:08:54	2019-08-05 07:08:54
2	user	Normal User	2019-08-05 07:08:54	2019-08-05 07:08:54
3	support	Support	2019-08-06 22:36:19	2019-08-06 22:36:19
\.


--
-- TOC entry 3077 (class 0 OID 18171)
-- Dependencies: 221
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, key, display_name, value, details, type, "order", "group") FROM stdin;
1	site.title	Site Title	Site Title		text	1	Site
2	site.description	Site Description	Site Description		text	2	Site
10	admin.google_analytics_client_id	Google Analytics Client ID (used for admin dashboard)	\N		text	1	Admin
6	admin.title	Admin Title	QuVendi		text	1	Admin
3	site.logo	Site Logo	settings\\August2019\\EFlaT9IL0BQZcYbZ44jP.png		image	3	Site
7	admin.description	Admin Description	An energy utility billing platform.		text	2	Admin
8	admin.loader	Admin Loader	settings\\August2019\\AypZmsX7ZlSe0GZvyTBs.png		image	3	Admin
5	site.bg_image	Admin Background Image	settings\\August2019\\xlGALEmQbXujGwq0IP2s.jpg		image	4	Site
4	site.google_analytics_tracking_id	Google Analytics Tracking ID	\N		text	5	Site
13	admin.bg_image	Admin background	settings\\August2019\\Fy5rZFiamTc9L3xEkbYm.jpg	\N	image	6	Admin
9	admin.icon_image	Admin Icon Image	settings\\August2019\\NJPsJ8gC2XOVld2gHgpY.png		image	4	Admin
\.


--
-- TOC entry 3065 (class 0 OID 18080)
-- Dependencies: 209
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (id, user_uid, amount, transaction_type, transaction_uid, month, status, payment_data, created_at, updated_at) FROM stdin;
1	SN6L-CH4V-QV44	2042.30999999999995	Bill paymanent	2EJN-1XU3-QF28	03	completed	\N	2019-08-04 18:03:44	2019-08-04 18:03:44
2	8AAR-5OBA-OR4S	9579.25	Bill paymanent	COAW-EDGN-B08W	02	completed	\N	2019-08-04 18:03:44	2019-08-04 18:03:44
3	TLV0-37HN-4CG4	2985.80999999999995	Bill paymanent	JN4I-MY0L-NVSO	07	completed	\N	2019-08-04 18:03:44	2019-08-04 18:03:44
4	QNRL-ZGEK-UY8O	6500.4399999999996	Bill paymanent	GART-SV51-PHC0	08	completed	\N	2019-08-04 18:03:44	2019-08-04 18:03:44
5	KT61-HWNU-O2OK	2251.09999999999991	Bill paymanent	QQVL-2D3V-KBKG	03	completed	\N	2019-08-04 18:03:44	2019-08-04 18:03:44
6	D6U0-MKVK-BH4C	3803.38999999999987	Bill paymanent	RW3Z-YLJ7-TK0K	06	completed	\N	2019-08-04 18:03:44	2019-08-04 18:03:44
7	514M-62OR-1B40	245.689999999999998	Bill paymanent	KUBY-F2FW-228S	05	completed	\N	2019-08-04 18:03:44	2019-08-04 18:03:44
8	D6U0-MKVK-BH4C	2465.61000000000013	Bill paymanent	HHWF-FTI2-VJSW	06	completed	\N	2019-08-04 18:03:44	2019-08-04 18:03:44
9	SN6L-CH4V-QV44	6937.34000000000015	Bill paymanent	30TY-K2JM-C24G	12	completed	\N	2019-08-04 18:03:44	2019-08-04 18:03:44
10	QNRL-ZGEK-UY8O	3706.05000000000018	Bill paymanent	DIOJ-UIFU-80OC	02	completed	\N	2019-08-04 18:03:44	2019-08-04 18:03:44
11	QNRL-ZGEK-UY8O	257.470000000000027	Bill paymanent	AZ0N-F3JZ-S7C4	03	completed	\N	2019-08-04 18:03:44	2019-08-04 18:03:44
12	4FNR-E4EP-ZBI8	6826.86999999999989	Bill paymanent	FTYU-72CQ-NNWO	11	completed	\N	2019-08-04 18:03:44	2019-08-04 18:03:44
13	SN6L-CH4V-QV44	2617.21000000000004	Bill paymanent	GGD4-629F-Y2O0	06	completed	\N	2019-08-04 18:03:44	2019-08-04 18:03:44
14	QNRL-ZGEK-UY8O	7414.09000000000015	Bill paymanent	C8PO-GRG7-E0GS	02	completed	\N	2019-08-04 18:03:44	2019-08-04 18:03:44
15	E95N-1MBD-X3C4	8474.54999999999927	Bill paymanent	A7VD-O78W-9Y0C	02	completed	\N	2019-08-04 18:03:44	2019-08-04 18:03:44
16	514M-62OR-1B40	561.549999999999955	Bill paymanent	3GFZ-RW6E-PZGG	01	completed	\N	2019-08-04 18:03:44	2019-08-04 18:03:44
17	QNRL-ZGEK-UY8O	1731.6099999999999	Bill paymanent	PBKA-T4DN-BNK4	10	completed	\N	2019-08-04 18:03:44	2019-08-04 18:03:44
18	4FNR-E4EP-ZBI8	8934.20999999999913	Bill paymanent	TT1U-DOIC-CB4C	10	completed	\N	2019-08-04 18:03:44	2019-08-04 18:03:44
19	QNRL-ZGEK-UY8O	312.269999999999982	Bill paymanent	725V-EQLP-3V0O	02	completed	\N	2019-08-04 18:03:44	2019-08-04 18:03:44
20	EH0Z-VO0T-YZCC	3889.96000000000004	Bill paymanent	I3R6-GGWQ-8W00	11	completed	\N	2019-08-04 18:03:44	2019-08-04 18:03:44
\.


--
-- TOC entry 3082 (class 0 OID 18215)
-- Dependencies: 226
-- Data for Name: translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.translations (id, table_name, column_name, foreign_key, locale, value, created_at, updated_at) FROM stdin;
1	data_types	display_name_singular	5	pt	Post	2019-08-05 07:16:20	2019-08-05 07:16:20
2	data_types	display_name_singular	6	pt	Página	2019-08-05 07:16:20	2019-08-05 07:16:20
3	data_types	display_name_singular	1	pt	Utilizador	2019-08-05 07:16:20	2019-08-05 07:16:20
4	data_types	display_name_singular	4	pt	Categoria	2019-08-05 07:16:20	2019-08-05 07:16:20
5	data_types	display_name_singular	2	pt	Menu	2019-08-05 07:16:20	2019-08-05 07:16:20
6	data_types	display_name_singular	3	pt	Função	2019-08-05 07:16:20	2019-08-05 07:16:20
7	data_types	display_name_plural	5	pt	Posts	2019-08-05 07:16:20	2019-08-05 07:16:20
8	data_types	display_name_plural	6	pt	Páginas	2019-08-05 07:16:20	2019-08-05 07:16:20
9	data_types	display_name_plural	1	pt	Utilizadores	2019-08-05 07:16:20	2019-08-05 07:16:20
10	data_types	display_name_plural	4	pt	Categorias	2019-08-05 07:16:20	2019-08-05 07:16:20
11	data_types	display_name_plural	2	pt	Menus	2019-08-05 07:16:20	2019-08-05 07:16:20
12	data_types	display_name_plural	3	pt	Funções	2019-08-05 07:16:20	2019-08-05 07:16:20
13	categories	slug	1	pt	categoria-1	2019-08-05 07:16:20	2019-08-05 07:16:20
14	categories	name	1	pt	Categoria 1	2019-08-05 07:16:20	2019-08-05 07:16:20
15	categories	slug	2	pt	categoria-2	2019-08-05 07:16:20	2019-08-05 07:16:20
16	categories	name	2	pt	Categoria 2	2019-08-05 07:16:20	2019-08-05 07:16:20
17	pages	title	1	pt	Olá Mundo	2019-08-05 07:16:20	2019-08-05 07:16:20
18	pages	slug	1	pt	ola-mundo	2019-08-05 07:16:20	2019-08-05 07:16:20
19	pages	body	1	pt	<p>Olá Mundo. Scallywag grog swab Cat o'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>	2019-08-05 07:16:20	2019-08-05 07:16:20
20	menu_items	title	1	pt	Painel de Controle	2019-08-05 07:16:20	2019-08-05 07:16:20
21	menu_items	title	2	pt	Media	2019-08-05 07:16:20	2019-08-05 07:16:20
22	menu_items	title	12	pt	Publicações	2019-08-05 07:16:20	2019-08-05 07:16:20
23	menu_items	title	3	pt	Utilizadores	2019-08-05 07:16:20	2019-08-05 07:16:20
24	menu_items	title	11	pt	Categorias	2019-08-05 07:16:20	2019-08-05 07:16:20
25	menu_items	title	13	pt	Páginas	2019-08-05 07:16:20	2019-08-05 07:16:20
26	menu_items	title	4	pt	Funções	2019-08-05 07:16:20	2019-08-05 07:16:20
27	menu_items	title	5	pt	Ferramentas	2019-08-05 07:16:20	2019-08-05 07:16:20
28	menu_items	title	6	pt	Menus	2019-08-05 07:16:20	2019-08-05 07:16:20
29	menu_items	title	7	pt	Base de dados	2019-08-05 07:16:20	2019-08-05 07:16:20
30	menu_items	title	10	pt	Configurações	2019-08-05 07:16:20	2019-08-05 07:16:20
\.


--
-- TOC entry 3083 (class 0 OID 18232)
-- Dependencies: 227
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (user_id, role_id) FROM stdin;
\.


--
-- TOC entry 3055 (class 0 OID 18014)
-- Dependencies: 199
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, firstname, lastname, email, phone_no, email_verified_at, user_uid, password, meter_number, remember_token, created_at, updated_at, avatar, role_id, settings) FROM stdin;
4	Sophie	O'Hara	sandy51@example.net	0908546337	2019-08-04 18:03:44	E95N-1MBD-X3C4	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	f4diSHq6Tp	2019-08-04 18:03:44	2019-08-04 18:03:44	users/default.png	\N	\N
5	Kelsi	Cormier	sherwood41@example.net	0908557802	2019-08-04 18:03:44	KT61-HWNU-O2OK	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	BU3k6rozc1	2019-08-04 18:03:44	2019-08-04 18:03:44	users/default.png	\N	\N
6	Leta	Rutherford	estel87@example.org	0906167723	2019-08-04 18:03:44	EH0Z-VO0T-YZCC	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	HFZgSGk3ka	2019-08-04 18:03:44	2019-08-04 18:03:44	users/default.png	\N	\N
7	Alden	Ortiz	balistreri.ben@example.org	0901424664	2019-08-04 18:03:44	SN6L-CH4V-QV44	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	Zz4jFdPUXX	2019-08-04 18:03:44	2019-08-04 18:03:44	users/default.png	\N	\N
8	Rebekah	Moore	ocassin@example.net	090957422	2019-08-04 18:03:44	8AAR-5OBA-OR4S	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	E5mPwH6aDE	2019-08-04 18:03:44	2019-08-04 18:03:44	users/default.png	\N	\N
9	Marques	Reinger	hildegard25@example.net	0902967604	2019-08-04 18:03:44	410O-FGO4-XGIS	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	kUta8tSCO1	2019-08-04 18:03:44	2019-08-04 18:03:44	users/default.png	\N	\N
10	Jerome	Mante	guiseppe21@example.org	0903118330	2019-08-04 18:03:44	514M-62OR-1B40	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	eFcNyU2n6d	2019-08-04 18:03:44	2019-08-04 18:03:44	users/default.png	\N	\N
13	username	lastname	useremail@gmail.com	0809875432	2019-08-05 07:16:19	R9O5-5W6W-E2OW	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	Tc6HMNjEdM	2019-08-05 07:16:19	2019-08-05 07:16:19	users/default.png	2	\N
14	Sabrina	Steuber	kailyn63@example.org	0903464638	2019-08-05 07:16:19	44ON-8NAH-CUQS	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	zeS96oPHzh	2019-08-05 07:16:19	2019-08-05 07:16:19	users/default.png	2	\N
15	Keaton	D'Amore	nolan.schaefer@example.org	090245387	2019-08-05 07:16:19	6DDJ-ESZ2-KCG0	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	Sd6m6tEiZV	2019-08-05 07:16:19	2019-08-05 07:16:19	users/default.png	2	\N
16	Nils	Walter	nwillms@example.com	0909760917	2019-08-05 07:16:19	90GT-0O7N-FI0W	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	DwIVxWe9R2	2019-08-05 07:16:19	2019-08-05 07:16:19	users/default.png	2	\N
17	Winston	Goyette	marilie.beer@example.net	090797234	2019-08-05 07:16:19	5XXD-6IWT-0084	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	Ixc2IouL0q	2019-08-05 07:16:19	2019-08-05 07:16:19	users/default.png	2	\N
18	Kaia	Stehr	jmaggio@example.com	0907912738	2019-08-05 07:16:19	G199-O7TG-A8OC	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	iHtAIXR2uH	2019-08-05 07:16:19	2019-08-05 07:16:19	users/default.png	2	\N
19	Armand	Swaniawski	maryjane59@example.org	0907798994	2019-08-05 07:16:19	HPGS-G7O5-4XWG	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	PCRISI6jul	2019-08-05 07:16:19	2019-08-05 07:16:19	users/default.png	2	\N
20	Isaias	Paucek	elvera.trantow@example.org	0908493535	2019-08-05 07:16:19	9JEN-I54P-DVS4	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	StVIbWmpUl	2019-08-05 07:16:19	2019-08-05 07:16:19	users/default.png	2	\N
2	Genovevad	Hesseld	roslyn.lesch@example.netd	09012580973	\N	TLV0-37HN-4CG5	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	38Lq9gjJ6O	2019-08-04 18:03:44	2019-08-07 05:07:59	users\\August2019\\PZga8xb3ITTj0WLZyEI7.PNG	\N	{"locale":"en"}
23	Assunta	Mills	jazmin79@example.net	0902580181	\N	FI3D-0X6Z-OYOK	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	cSgZq8BADlKAWT3DgJCtu0UJ670kGjIaP68phgj3PriegjbVsTl1o0RoJauc	2019-08-05 07:16:20	2019-08-07 05:53:33	users/default.png	2	{"locale":"en"}
11	Burnice	Schulist	mills.elroy@example.net	0907345418	2019-08-04 18:03:44	4FNR-E4EP-ZBI8	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	U3rm5q1CfJQUL6jdvufhgmV0tI53rCOGwvUx2v9zoayPYir5ZlVa5Kyq4ezx	2019-08-04 18:03:44	2019-08-04 18:03:44	users/default.png	\N	\N
3	support	support	support@support.com	0901339808	2019-08-04 18:03:44	QNRL-ZGEK-UY8O	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	kINLoPFvZv7u87Ez9Pp7Zl075EJYlefM2fq55JQN0HNtTaj2pbOS3eB9d6UF	2019-08-04 18:03:44	2019-08-04 18:03:44	users/default.png	3	\N
1	admin\n	adminLastname	admin@admin.com	0809875432	2019-08-04 18:03:44	D6U0-MKVK-BH4C	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	zVjYQhJ3Y3JqFjsQYosobGfoK6Quzq240MsVg7nSziMry5qQ0z95tw2z8P9G	2019-08-04 18:03:44	2019-08-06 13:13:13	users/default.png	1	\N
21	Genesis	Herzog	rae04@example.net	0901523367	\N	15SC-D2LC-MT1C	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	AwEBTGTwb3	2019-08-05 07:16:20	2019-08-07 04:58:06	users/default.png	2	{"locale":"en"}
22	Vaughn	Kovacek	sterry@example.com	0901223380	\N	O3Z0-DIHL-5HC0	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	\N	Tz3rrkUa22	2019-08-05 07:16:20	2019-08-07 05:01:36	users/default.png	2	{"locale":"en"}
\.


--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 232
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 2, true);


--
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 212
-- Name: data_rows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.data_rows_id_seq', 73, true);


--
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 210
-- Name: data_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.data_types_id_seq', 7, true);


--
-- TOC entry 3114 (class 0 OID 0)
-- Dependencies: 216
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_items_id_seq', 15, true);


--
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 214
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menus_id_seq', 1, true);


--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 196
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 191, true);


--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 204
-- Name: oauth_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_clients_id_seq', 7, true);


--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 206
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_personal_access_clients_id_seq', 2, true);


--
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 228
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pages_id_seq', 1, true);


--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 222
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 46, true);


--
-- TOC entry 3121 (class 0 OID 0)
-- Dependencies: 230
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 4, true);


--
-- TOC entry 3122 (class 0 OID 0)
-- Dependencies: 218
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- TOC entry 3123 (class 0 OID 0)
-- Dependencies: 220
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 13, true);


--
-- TOC entry 3124 (class 0 OID 0)
-- Dependencies: 208
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_id_seq', 20, true);


--
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 225
-- Name: translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.translations_id_seq', 30, true);


--
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 198
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 24, true);


--
-- TOC entry 2920 (class 2606 OID 18291)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 2922 (class 2606 OID 18298)
-- Name: categories categories_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_slug_unique UNIQUE (slug);


--
-- TOC entry 2881 (class 2606 OID 18123)
-- Name: data_rows data_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_rows
    ADD CONSTRAINT data_rows_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 18104)
-- Name: data_types data_types_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_types
    ADD CONSTRAINT data_types_name_unique UNIQUE (name);


--
-- TOC entry 2877 (class 2606 OID 18102)
-- Name: data_types data_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_types
    ADD CONSTRAINT data_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 18106)
-- Name: data_types data_types_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_types
    ADD CONSTRAINT data_types_slug_unique UNIQUE (slug);


--
-- TOC entry 2887 (class 2606 OID 18150)
-- Name: menu_items menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- TOC entry 2883 (class 2606 OID 18138)
-- Name: menus menus_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_name_unique UNIQUE (name);


--
-- TOC entry 2885 (class 2606 OID 18136)
-- Name: menus menus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 16448)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 18049)
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 2859 (class 2606 OID 18041)
-- Name: oauth_auth_codes oauth_auth_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_auth_codes
    ADD CONSTRAINT oauth_auth_codes_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 18067)
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 18076)
-- Name: oauth_personal_access_clients oauth_personal_access_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_personal_access_clients
    ADD CONSTRAINT oauth_personal_access_clients_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 18055)
-- Name: oauth_refresh_tokens oauth_refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_refresh_tokens
    ADD CONSTRAINT oauth_refresh_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 2912 (class 2606 OID 18261)
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- TOC entry 2914 (class 2606 OID 18263)
-- Name: pages pages_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_slug_unique UNIQUE (slug);


--
-- TOC entry 2901 (class 2606 OID 18209)
-- Name: permission_role permission_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_pkey PRIMARY KEY (permission_id, role_id);


--
-- TOC entry 2898 (class 2606 OID 18193)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2916 (class 2606 OID 18277)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- TOC entry 2918 (class 2606 OID 18279)
-- Name: posts posts_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_slug_unique UNIQUE (slug);


--
-- TOC entry 2889 (class 2606 OID 18168)
-- Name: roles roles_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_unique UNIQUE (name);


--
-- TOC entry 2891 (class 2606 OID 18166)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 18182)
-- Name: settings settings_key_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_key_unique UNIQUE (key);


--
-- TOC entry 2895 (class 2606 OID 18180)
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- TOC entry 2873 (class 2606 OID 18088)
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 2904 (class 2606 OID 18223)
-- Name: translations translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translations
    ADD CONSTRAINT translations_pkey PRIMARY KEY (id);


--
-- TOC entry 2906 (class 2606 OID 18225)
-- Name: translations translations_table_name_column_name_foreign_key_locale_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translations
    ADD CONSTRAINT translations_table_name_column_name_foreign_key_locale_unique UNIQUE (table_name, column_name, foreign_key, locale);


--
-- TOC entry 2908 (class 2606 OID 18246)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2852 (class 2606 OID 18024)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 2854 (class 2606 OID 18022)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 18026)
-- Name: users users_user_uid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_uid_unique UNIQUE (user_uid);


--
-- TOC entry 2862 (class 1259 OID 18050)
-- Name: oauth_access_tokens_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth_access_tokens_user_id_index ON public.oauth_access_tokens USING btree (user_id);


--
-- TOC entry 2868 (class 1259 OID 18068)
-- Name: oauth_clients_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth_clients_user_id_index ON public.oauth_clients USING btree (user_id);


--
-- TOC entry 2869 (class 1259 OID 18077)
-- Name: oauth_personal_access_clients_client_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth_personal_access_clients_client_id_index ON public.oauth_personal_access_clients USING btree (client_id);


--
-- TOC entry 2863 (class 1259 OID 18056)
-- Name: oauth_refresh_tokens_access_token_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth_refresh_tokens_access_token_id_index ON public.oauth_refresh_tokens USING btree (access_token_id);


--
-- TOC entry 2857 (class 1259 OID 18033)
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- TOC entry 2899 (class 1259 OID 18210)
-- Name: permission_role_permission_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX permission_role_permission_id_index ON public.permission_role USING btree (permission_id);


--
-- TOC entry 2902 (class 1259 OID 18211)
-- Name: permission_role_role_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX permission_role_role_id_index ON public.permission_role USING btree (role_id);


--
-- TOC entry 2896 (class 1259 OID 18194)
-- Name: permissions_key_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX permissions_key_index ON public.permissions USING btree (key);


--
-- TOC entry 2909 (class 1259 OID 18248)
-- Name: user_roles_role_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_roles_role_id_index ON public.user_roles USING btree (role_id);


--
-- TOC entry 2910 (class 1259 OID 18247)
-- Name: user_roles_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_roles_user_id_index ON public.user_roles USING btree (user_id);


--
-- TOC entry 2930 (class 2606 OID 18292)
-- Name: categories categories_parent_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2924 (class 2606 OID 18124)
-- Name: data_rows data_rows_data_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_rows
    ADD CONSTRAINT data_rows_data_type_id_foreign FOREIGN KEY (data_type_id) REFERENCES public.data_types(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2925 (class 2606 OID 18151)
-- Name: menu_items menu_items_menu_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;


--
-- TOC entry 2926 (class 2606 OID 18198)
-- Name: permission_role permission_role_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 2927 (class 2606 OID 18203)
-- Name: permission_role permission_role_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 2929 (class 2606 OID 18240)
-- Name: user_roles user_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 2928 (class 2606 OID 18235)
-- Name: user_roles user_roles_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2923 (class 2606 OID 18227)
-- Name: users users_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id);


-- Completed on 2019-08-08 00:44:26

--
-- PostgreSQL database dump complete
--

