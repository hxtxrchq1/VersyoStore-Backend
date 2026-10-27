\restrict bilCBC12jCb93hHqjhLMWzgu9vIpRzCMjgwSvSpo67Ohhy6EBNlD72SuM3vqzNz

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 49170)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it



--
-- TOC entry 5272 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 49171)
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);



--
-- TOC entry 221 (class 1259 OID 49189)
-- Name: carrito; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carrito (
    id integer NOT NULL,
    usuario_id integer,
    estado character varying(30) DEFAULT 'activo'::character varying,
    creado_en timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP,
    actualizado_en timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP
);



--
-- TOC entry 220 (class 1259 OID 49188)
-- Name: carrito_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carrito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5274 (class 0 OID 0)
-- Dependencies: 220
-- Name: carrito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carrito_id_seq OWNED BY public.carrito.id;


--
-- TOC entry 223 (class 1259 OID 49200)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    identificador character varying(100) NOT NULL,
    descripcion text
);



--
-- TOC entry 222 (class 1259 OID 49199)
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5275 (class 0 OID 0)
-- Dependencies: 222
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;


--
-- TOC entry 225 (class 1259 OID 49212)
-- Name: cupon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cupon (
    id integer NOT NULL,
    codigo character varying(50) NOT NULL,
    tipo_descuento character varying(20) NOT NULL,
    valor_descuento numeric(12,2) NOT NULL,
    monto_minimo numeric(12,2),
    descuento_maximo numeric(12,2),
    usos_maximos integer DEFAULT 1,
    usos_actuales integer DEFAULT 0 NOT NULL,
    fecha_inicio timestamp(6) with time zone,
    fecha_fin timestamp(6) with time zone,
    activo boolean DEFAULT true NOT NULL,
    creado_en timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);



--
-- TOC entry 224 (class 1259 OID 49211)
-- Name: cupon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cupon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5276 (class 0 OID 0)
-- Dependencies: 224
-- Name: cupon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cupon_id_seq OWNED BY public.cupon.id;


--
-- TOC entry 245 (class 1259 OID 49341)
-- Name: email_verification_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_verification_token (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    token character varying(255) NOT NULL,
    expira_en timestamp(6) with time zone NOT NULL,
    creado_en timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);



--
-- TOC entry 244 (class 1259 OID 49340)
-- Name: email_verification_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.email_verification_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5277 (class 0 OID 0)
-- Dependencies: 244
-- Name: email_verification_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.email_verification_token_id_seq OWNED BY public.email_verification_token.id;


--
-- TOC entry 227 (class 1259 OID 49230)
-- Name: item_carrito; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_carrito (
    id integer NOT NULL,
    carrito_id integer,
    producto_id integer,
    cantidad integer DEFAULT 1 NOT NULL,
    precio_unitario numeric(12,2) NOT NULL,
    variacion_id integer NOT NULL
);



--
-- TOC entry 226 (class 1259 OID 49229)
-- Name: item_carrito_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_carrito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5278 (class 0 OID 0)
-- Dependencies: 226
-- Name: item_carrito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_carrito_id_seq OWNED BY public.item_carrito.id;


--
-- TOC entry 229 (class 1259 OID 49242)
-- Name: item_pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_pedido (
    id integer NOT NULL,
    pedido_id integer,
    producto_id integer,
    cantidad integer NOT NULL,
    precio_unitario numeric(12,2) NOT NULL,
    variacion_id integer NOT NULL
);



--
-- TOC entry 228 (class 1259 OID 49241)
-- Name: item_pedido_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5279 (class 0 OID 0)
-- Dependencies: 228
-- Name: item_pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_pedido_id_seq OWNED BY public.item_pedido.id;


--
-- TOC entry 231 (class 1259 OID 49253)
-- Name: pago_simulado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pago_simulado (
    id integer NOT NULL,
    pedido_id integer,
    metodo character varying(50),
    estado_pago character varying(30),
    referencia character varying(200),
    creado_en timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP
);



--
-- TOC entry 230 (class 1259 OID 49252)
-- Name: pago_simulado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pago_simulado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5280 (class 0 OID 0)
-- Dependencies: 230
-- Name: pago_simulado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pago_simulado_id_seq OWNED BY public.pago_simulado.id;


--
-- TOC entry 247 (class 1259 OID 49354)
-- Name: password_reset_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_token (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    token character varying(255) NOT NULL,
    expira_en timestamp(6) with time zone NOT NULL,
    usado boolean DEFAULT false NOT NULL,
    creado_en timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);



--
-- TOC entry 246 (class 1259 OID 49353)
-- Name: password_reset_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.password_reset_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5281 (class 0 OID 0)
-- Dependencies: 246
-- Name: password_reset_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.password_reset_token_id_seq OWNED BY public.password_reset_token.id;


--
-- TOC entry 233 (class 1259 OID 49262)
-- Name: pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedido (
    id integer NOT NULL,
    usuario_id integer,
    total numeric(12,2) NOT NULL,
    estado character varying(30) DEFAULT 'pendiente'::character varying,
    nombre_receptor character varying(150),
    direccion_envio character varying(255),
    ciudad character varying(100),
    region character varying(100),
    pais character varying(100),
    telefono_contacto character varying(50),
    codigo_tracking character varying(100),
    agencia_envio character varying(100),
    tiempo_estimado_entrega character varying(100),
    cupon_id integer,
    creado_en timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP,
    metodo_pago character varying(50),
    notas text,
    voucher_url character varying(500)
);



--
-- TOC entry 232 (class 1259 OID 49261)
-- Name: pedido_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5282 (class 0 OID 0)
-- Dependencies: 232
-- Name: pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedido_id_seq OWNED BY public.pedido.id;


--
-- TOC entry 235 (class 1259 OID 49275)
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    id integer NOT NULL,
    nombre character varying(200) NOT NULL,
    descripcion text,
    precio numeric(12,2) DEFAULT 0 NOT NULL,
    imagenes jsonb,
    categoria_id integer,
    temporada_id integer,
    slug character varying(200),
    creado_en timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP,
    genero character varying(20) DEFAULT 'ambos'::character varying,
    activo boolean DEFAULT true NOT NULL,
    recomendado boolean DEFAULT false CONSTRAINT producto_destacado_not_null NOT NULL,
    precio_oferta numeric(12,2)
);



--
-- TOC entry 234 (class 1259 OID 49274)
-- Name: producto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5283 (class 0 OID 0)
-- Dependencies: 234
-- Name: producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_id_seq OWNED BY public.producto.id;


--
-- TOC entry 249 (class 1259 OID 49369)
-- Name: refresh_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refresh_token (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    token character varying(500) NOT NULL,
    expira_en timestamp(6) with time zone NOT NULL,
    revocado boolean DEFAULT false NOT NULL,
    creado_en timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);



--
-- TOC entry 248 (class 1259 OID 49368)
-- Name: refresh_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refresh_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5284 (class 0 OID 0)
-- Dependencies: 248
-- Name: refresh_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refresh_token_id_seq OWNED BY public.refresh_token.id;


--
-- TOC entry 251 (class 1259 OID 58761)
-- Name: solicitud_membresia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solicitud_membresia (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    email_solicitante character varying(200) NOT NULL,
    estado character varying(30) DEFAULT 'pendiente'::character varying NOT NULL,
    boleta_url character varying(500),
    comprobante_enviado boolean DEFAULT false NOT NULL,
    creado_en timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    procesado_en timestamp(6) with time zone
);



--
-- TOC entry 250 (class 1259 OID 58760)
-- Name: solicitud_membresia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solicitud_membresia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5285 (class 0 OID 0)
-- Dependencies: 250
-- Name: solicitud_membresia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solicitud_membresia_id_seq OWNED BY public.solicitud_membresia.id;


--
-- TOC entry 239 (class 1259 OID 49301)
-- Name: temporada; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temporada (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    descripcion text,
    activo boolean DEFAULT true,
    inicio date,
    fin date
);



--
-- TOC entry 238 (class 1259 OID 49300)
-- Name: temporada_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temporada_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5286 (class 0 OID 0)
-- Dependencies: 238
-- Name: temporada_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temporada_id_seq OWNED BY public.temporada.id;


--
-- TOC entry 241 (class 1259 OID 49313)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    email character varying(200) NOT NULL,
    contrasena character varying(255) NOT NULL,
    dni character varying(20),
    direccion character varying(255),
    email_verificado boolean DEFAULT false NOT NULL,
    rol character varying(20) DEFAULT 'cliente'::character varying NOT NULL,
    telefono character varying(50),
    creado_en timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    tiene_membresia boolean DEFAULT false NOT NULL,
    fecha_membresia timestamp(6) with time zone,
    apellido character varying(150),
    codigo_verificacion character varying(10),
    codigo_verificacion_exp timestamp(6) with time zone
);



--
-- TOC entry 240 (class 1259 OID 49312)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5287 (class 0 OID 0)
-- Dependencies: 240
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 237 (class 1259 OID 49289)
-- Name: variacion_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.variacion_producto (
    id integer NOT NULL,
    producto_id integer NOT NULL,
    talla character varying(20),
    color character varying(50),
    stock integer DEFAULT 0,
    sku character varying(100),
    codigo_color character varying(7),
    imagen_url character varying(500)
);



--
-- TOC entry 236 (class 1259 OID 49288)
-- Name: variacion_producto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.variacion_producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5288 (class 0 OID 0)
-- Dependencies: 236
-- Name: variacion_producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.variacion_producto_id_seq OWNED BY public.variacion_producto.id;


--
-- TOC entry 243 (class 1259 OID 49332)
-- Name: wishlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wishlist (
    id integer NOT NULL,
    usuario_id integer,
    producto_id integer,
    creado_en timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP
);



--
-- TOC entry 242 (class 1259 OID 49331)
-- Name: wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wishlist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 5289 (class 0 OID 0)
-- Dependencies: 242
-- Name: wishlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wishlist_id_seq OWNED BY public.wishlist.id;


--
-- TOC entry 4937 (class 2604 OID 49192)
-- Name: carrito id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito ALTER COLUMN id SET DEFAULT nextval('public.carrito_id_seq'::regclass);


--
-- TOC entry 4941 (class 2604 OID 49203)
-- Name: categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);


--
-- TOC entry 4942 (class 2604 OID 49215)
-- Name: cupon id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cupon ALTER COLUMN id SET DEFAULT nextval('public.cupon_id_seq'::regclass);


--
-- TOC entry 4972 (class 2604 OID 49344)
-- Name: email_verification_token id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_verification_token ALTER COLUMN id SET DEFAULT nextval('public.email_verification_token_id_seq'::regclass);


--
-- TOC entry 4947 (class 2604 OID 49233)
-- Name: item_carrito id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_carrito ALTER COLUMN id SET DEFAULT nextval('public.item_carrito_id_seq'::regclass);


--
-- TOC entry 4949 (class 2604 OID 49245)
-- Name: item_pedido id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_pedido ALTER COLUMN id SET DEFAULT nextval('public.item_pedido_id_seq'::regclass);


--
-- TOC entry 4950 (class 2604 OID 49256)
-- Name: pago_simulado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago_simulado ALTER COLUMN id SET DEFAULT nextval('public.pago_simulado_id_seq'::regclass);


--
-- TOC entry 4974 (class 2604 OID 49357)
-- Name: password_reset_token id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_token ALTER COLUMN id SET DEFAULT nextval('public.password_reset_token_id_seq'::regclass);


--
-- TOC entry 4952 (class 2604 OID 49265)
-- Name: pedido id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido ALTER COLUMN id SET DEFAULT nextval('public.pedido_id_seq'::regclass);


--
-- TOC entry 4955 (class 2604 OID 49278)
-- Name: producto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto ALTER COLUMN id SET DEFAULT nextval('public.producto_id_seq'::regclass);


--
-- TOC entry 4977 (class 2604 OID 49372)
-- Name: refresh_token id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_token ALTER COLUMN id SET DEFAULT nextval('public.refresh_token_id_seq'::regclass);


--
-- TOC entry 4980 (class 2604 OID 58764)
-- Name: solicitud_membresia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitud_membresia ALTER COLUMN id SET DEFAULT nextval('public.solicitud_membresia_id_seq'::regclass);


--
-- TOC entry 4963 (class 2604 OID 49304)
-- Name: temporada id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temporada ALTER COLUMN id SET DEFAULT nextval('public.temporada_id_seq'::regclass);


--
-- TOC entry 4965 (class 2604 OID 49316)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 4961 (class 2604 OID 49292)
-- Name: variacion_producto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variacion_producto ALTER COLUMN id SET DEFAULT nextval('public.variacion_producto_id_seq'::regclass);


--
-- TOC entry 4970 (class 2604 OID 49335)
-- Name: wishlist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist ALTER COLUMN id SET DEFAULT nextval('public.wishlist_id_seq'::regclass);


--
-- TOC entry 5233 (class 0 OID 49171)
-- Dependencies: 219
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
4e6e97e2-1859-4eaa-9699-c0500d0a64a7	487767e8d9644fdbefe2e70232c19c181eeaf6181ab00dce445b65d5aca46f13	2025-11-18 01:20:30.275548-05	20251118062029_initial_setup	\N	\N	2025-11-18 01:20:29.999567-05	1
44d11121-bd79-4ca4-a54d-d1ef6fae8922	c57d25330002197e84eec308b75eba143fd1c6ff7760a44c752ffce7a57791cb	2025-11-19 18:25:45.237081-05	20251119232544_add_membresia_system	\N	\N	2025-11-19 18:25:44.951817-05	1
2649523d-7047-4f34-affc-68fb372d1ae0	598f014f66e2f2f47fcda28f4c85891a56949f6e535b68377af82b5fe6eb12eb	2025-11-19 18:31:55.740467-05	20251119233155_add_membresia_system	\N	\N	2025-11-19 18:31:55.559759-05	1
61c688f4-3f7d-4eb5-bc0b-2310066319da	e4c4d6853bee8e63ffd59b55eec56f7733d5c5d00f6a29d55563d2c2cac70022	2025-11-21 20:53:37.995539-05	20251122015337_add_apellido_and_verification_code	\N	\N	2025-11-21 20:53:37.986975-05	1
0632622f-4867-44dd-b97e-9b00a9c548be	c645a8698b4f8148ab637678d4c5a335ba990929f433d21f75dcd69a4ab8095e	2025-11-21 20:56:49.68942-05	20251122015649_add_variation_image_and_color_code	\N	\N	2025-11-21 20:56:49.657552-05	1
65bab8ea-c925-4ee7-b046-965f9ac28be5	37140191c51cccf4c667b1377eff657fbc16a47c914c55bc0eee8de9d06076f5	2025-11-21 23:33:00.107917-05	20251122043300_add_genero_to_producto	\N	\N	2025-11-21 23:33:00.058842-05	1
05fa34cc-16ff-45c4-bed2-2c26cad01013	6733be11d8b509b7881f2541b89a8eb1512f62e22841d6fa0d400f28dd28708a	2025-11-22 18:54:36.439428-05	20251122235436_add_payment_voucher_fields	\N	\N	2025-11-22 18:54:36.428554-05	1
6579d337-5077-4020-9bd6-3caeacbd171e	122d743a0403e77ad7e0ed9447f5b8826f2fbdbc55612d936eff004dd13c2eec	2025-12-02 01:25:32.492957-05	20251123125247_add_activo_destacado_to_producto	\N	\N	2025-12-02 01:25:32.486862-05	1
\.


--
-- TOC entry 5235 (class 0 OID 49189)
-- Dependencies: 221
-- Data for Name: carrito; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carrito (id, usuario_id, estado, creado_en, actualizado_en) FROM stdin;
\.


--
-- TOC entry 5237 (class 0 OID 49200)
-- Dependencies: 223
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (id, nombre, identificador, descripcion) FROM stdin;
1	Polos	polos	\N
\.


--
-- TOC entry 5239 (class 0 OID 49212)
-- Dependencies: 225
-- Data for Name: cupon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cupon (id, codigo, tipo_descuento, valor_descuento, monto_minimo, descuento_maximo, usos_maximos, usos_actuales, fecha_inicio, fecha_fin, activo, creado_en) FROM stdin;
\.


--
-- TOC entry 5259 (class 0 OID 49341)
-- Dependencies: 245
-- Data for Name: email_verification_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email_verification_token (id, usuario_id, token, expira_en, creado_en) FROM stdin;
\.


--
-- TOC entry 5241 (class 0 OID 49230)
-- Dependencies: 227
-- Data for Name: item_carrito; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_carrito (id, carrito_id, producto_id, cantidad, precio_unitario, variacion_id) FROM stdin;
\.


--
-- TOC entry 5243 (class 0 OID 49242)
-- Dependencies: 229
-- Data for Name: item_pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_pedido (id, pedido_id, producto_id, cantidad, precio_unitario, variacion_id) FROM stdin;
\.


--
-- TOC entry 5245 (class 0 OID 49253)
-- Dependencies: 231
-- Data for Name: pago_simulado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pago_simulado (id, pedido_id, metodo, estado_pago, referencia, creado_en) FROM stdin;
\.


--
-- TOC entry 5261 (class 0 OID 49354)
-- Dependencies: 247
-- Data for Name: password_reset_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_token (id, usuario_id, token, expira_en, usado, creado_en) FROM stdin;
\.


--
-- TOC entry 5247 (class 0 OID 49262)
-- Dependencies: 233
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedido (id, usuario_id, total, estado, nombre_receptor, direccion_envio, ciudad, region, pais, telefono_contacto, codigo_tracking, agencia_envio, tiempo_estimado_entrega, cupon_id, creado_en, metodo_pago, notas, voucher_url) FROM stdin;
\.


--
-- TOC entry 5249 (class 0 OID 49275)
-- Dependencies: 235
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto (id, nombre, descripcion, precio, imagenes, categoria_id, temporada_id, slug, creado_en, genero, activo, recomendado, precio_oferta) FROM stdin;
1	OG Black	All Colors; All Variants\n100% algodÃ³n 30/1\n	40.00	["https://res.cloudinary.com/ddwohvsft/image/upload/v1763791238/versyo/productos/rgcxnjyl6p646qpbn2lf.jpg", "https://res.cloudinary.com/ddwohvsft/image/upload/v1763791237/versyo/productos/o8jxchh1qxorq5w7dmim.jpg", "https://res.cloudinary.com/ddwohvsft/image/upload/v1763791237/versyo/productos/jtwaxotzxpgygspn80pd.jpg"]	1	1	og-black	2025-11-22 01:01:24.707-05	ambos	t	t	\N
\.


--
-- TOC entry 5263 (class 0 OID 49369)
-- Dependencies: 249
-- Data for Name: refresh_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refresh_token (id, usuario_id, token, expira_en, revocado, creado_en) FROM stdin;
7	2	ba71d7bb07c9a8a7da6433bad9d6fac3d69ec8608a74358f5f2e242ee544d7c9ebc8d24ef14b26894a371e0921ac3e7d6b563958ae588fcea468fafe79acc8b2	2025-12-21 02:15:22.75-05	f	2025-11-21 02:15:22.752-05
9	2	5c23b3da7308f550797d54e4ffc5f5cde032e9edcd706f20eeb0a4b76f1ef9b190e0190a36f2ee82fbb4d321531ea9fbec5955a8aee5641309bbfa680010e5ed	2025-12-21 17:26:51.752-05	f	2025-11-21 17:26:51.753-05
42	2	1e261f28506da2c540e720055812a770158a9efa4ab844068c205038a67b9755372d5328f1339b516e2f871b376e1877a8a812778ac23ed6f5bf5c2ea929fa60	2025-12-21 17:43:00.998-05	f	2025-11-21 17:43:01-05
44	2	42abc9178f4e500310ec5b08934d3554409b1fe3b34fe3fbc2678bd2c8ed9356f1594b3565aa00ba8d24b035e4bf5b6b2727882f09ebc0eba49ec5136fe4bd19	2025-12-21 23:02:12.041-05	f	2025-11-21 23:02:12.042-05
46	2	0699266792df5bc7ff5b8d733e68d71a2353db09548dd695e976f6a8240af881ea4684306a5367018134057bc5db6c534149c1e8fd100f5c9ba3684ff6a0325d	2025-12-22 02:01:20.852-05	f	2025-11-22 02:01:20.854-05
47	2	b7368d3232fad4c10bf0602df37cdabaecdbed139478224c3738ce923c55ce1433c8cc135ca85ff74e908684735f293c3f2474c769657f2bcece04b91a73e67b	2025-12-22 02:06:16.326-05	f	2025-11-22 02:06:16.328-05
51	2	50bd7beb3a1f0a924cd2292254cda8a42fc2562ff2a533d3d9081e3b8928468e183f8f47ab001d2603026e821161288baf639bc819c7bd39bfa7c8129e085bf5	2025-12-23 01:49:50.598-05	f	2025-11-23 01:49:50.6-05
53	2	d068d819b5783e9e4f66db0aec09c4d220c35d9a4884d4614f6616743880bb1f8f3c643227dcba2edc73ae58415ec4e0a4815a425fd9aafa552fe5d2e9f8782c	2025-12-23 01:54:33.892-05	f	2025-11-23 01:54:33.894-05
54	2	6e6abf9666fda0d937f16f32418748c270726598ccafbdd2d4145f2591c9f7acd8f87c84eaa3f7b7894fd8850cdc642d52d50844ea75644dcf4051365d374214	2025-12-23 07:42:43.096-05	f	2025-11-23 07:42:43.099-05
56	2	b2364afa33daff7a5eff2871de13eb631c0acf17d09bc352c0801264ab5bb5d9c3c641adc3018309536a773eb2f23842fca184894369a05983159531454db2c4	2025-12-23 07:44:31.796-05	f	2025-11-23 07:44:31.798-05
57	2	beaef76de528530a8ce125200dfb3edfd11171321c1d9ba5915826cc78e0493a4b4e6926b3dbe064dc4a8ab3fb0c8388b0f938348c947a91c9c861f925a4326b	2025-12-23 08:02:58.94-05	t	2025-11-23 08:02:58.943-05
59	2	72abaf80289d42a65f75533457ea32f7791e3c4f94c91d8bde4e548bceb4e845a862cd2bee7f9886bac3ed5ec4d21de02a688b13c3169d8517c27422c9b3c18f	2026-01-01 01:23:59.483-05	f	2025-12-02 01:23:59.486-05
58	2	758bbd43ecd3bc08f345f5a4e16e47ca9eff03633d66a6a2d74e6ff52672b103568f8f8ca4a340b2afad70eab16e804af533983145da7fccc9685d20c9feef60	2026-01-01 01:23:59.484-05	f	2025-12-02 01:23:59.488-05
61	2	97f24e084e0292190bc14ed74b6914ab9f32d694035a479fae43a1107c61730808f9d9ac79ef028698f0c6d1d257e379cda5f4e74b80da4319935e483130b81d	2026-01-01 01:37:02.509-05	f	2025-12-02 01:37:02.51-05
\.


--
-- TOC entry 5265 (class 0 OID 58761)
-- Dependencies: 251
-- Data for Name: solicitud_membresia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solicitud_membresia (id, usuario_id, email_solicitante, estado, boleta_url, comprobante_enviado, creado_en, procesado_en) FROM stdin;
1	2	versyostore@gmail.com	pendiente	\N	f	2025-11-21 23:24:16.424-05	\N
\.


--
-- TOC entry 5253 (class 0 OID 49301)
-- Dependencies: 239
-- Data for Name: temporada; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temporada (id, nombre, descripcion, activo, inicio, fin) FROM stdin;
1	OGBlack	\N	t	\N	\N
\.


--
-- TOC entry 5255 (class 0 OID 49313)
-- Dependencies: 241
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id, nombre, email, contrasena, dni, direccion, email_verificado, rol, telefono, creado_en, tiene_membresia, fecha_membresia, apellido, codigo_verificacion, codigo_verificacion_exp) FROM stdin;
2	Versyo Store	versyostore@gmail.com	$2b$10$PSRUxuOlfFxL4vGvtTOSFOZSPjCnPpdmy1GE6YpeYFFMYP9Us2Pjm	99999999	Oficina Central Versyo	t	admin	+51999999999	2025-11-21 02:06:20.651-05	t	\N	Admin	\N	\N
\.


--
-- TOC entry 5251 (class 0 OID 49289)
-- Dependencies: 237
-- Data for Name: variacion_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.variacion_producto (id, producto_id, talla, color, stock, sku, codigo_color, imagen_url) FROM stdin;
35	1	S	Baby Rose	8	PRD-1-BAB-S	#f9ced7	https://res.cloudinary.com/ddwohvsft/image/upload/v1763854464/versyo/productos/jejvfbmemmmgqgju4mgv.jpg
36	1	XL	Baby Rose	6	PRD-1-BAB-XL	#f9ced7	https://res.cloudinary.com/ddwohvsft/image/upload/v1763854459/versyo/productos/snpgq9xbs4o8bbjaxifq.jpg
38	1	M	Black	24	PRD-1-BLK-M	#000000	https://res.cloudinary.com/ddwohvsft/image/upload/v1763854470/versyo/productos/rx8q7cnvobbyvnlue5yo.jpg
37	1	L	Black	16	PRD-1-BLK-L	#000000	https://res.cloudinary.com/ddwohvsft/image/upload/v1763853896/versyo/productos/yutf97ld7m67mjj792tn.jpg
33	1	L	Baby Rose	13	PRD-1-BAB-L	#f9ced7	https://res.cloudinary.com/ddwohvsft/image/upload/v1763854459/versyo/productos/snpgq9xbs4o8bbjaxifq.jpg
34	1	M	Baby Rose	15	PRD-1-BAB-M	#f9ced7	https://res.cloudinary.com/ddwohvsft/image/upload/v1763854459/versyo/productos/apkmcksh9ialy1t1dpho.jpg
39	1	S	Black	10	PRD-1-BLK-S	#000000	https://res.cloudinary.com/ddwohvsft/image/upload/v1763854471/versyo/productos/srxq1x4y927luhax2npv.jpg
40	1	XL	Black	8	PRD-1-BLK-XL	#000000	https://res.cloudinary.com/ddwohvsft/image/upload/v1763853896/versyo/productos/yutf97ld7m67mjj792tn.jpg
\.


--
-- TOC entry 5257 (class 0 OID 49332)
-- Dependencies: 243
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wishlist (id, usuario_id, producto_id, creado_en) FROM stdin;
\.


--
-- TOC entry 5290 (class 0 OID 0)
-- Dependencies: 220
-- Name: carrito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--



--
-- TOC entry 5291 (class 0 OID 0)
-- Dependencies: 222
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--



--
-- TOC entry 5292 (class 0 OID 0)
-- Dependencies: 224
-- Name: cupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--



--
-- TOC entry 5293 (class 0 OID 0)
-- Dependencies: 244
-- Name: email_verification_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--



--
-- TOC entry 5294 (class 0 OID 0)
-- Dependencies: 226
-- Name: item_carrito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--



--
-- TOC entry 5295 (class 0 OID 0)
-- Dependencies: 228
-- Name: item_pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--



--
-- TOC entry 5296 (class 0 OID 0)
-- Dependencies: 230
-- Name: pago_simulado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--



--
-- TOC entry 5297 (class 0 OID 0)
-- Dependencies: 246
-- Name: password_reset_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--



--
-- TOC entry 5298 (class 0 OID 0)
-- Dependencies: 232
-- Name: pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--



--
-- TOC entry 5299 (class 0 OID 0)
-- Dependencies: 234
-- Name: producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--



--
-- TOC entry 5300 (class 0 OID 0)
-- Dependencies: 248
-- Name: refresh_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--



--
-- TOC entry 5301 (class 0 OID 0)
-- Dependencies: 250
-- Name: solicitud_membresia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--



--
-- TOC entry 5302 (class 0 OID 0)
-- Dependencies: 238
-- Name: temporada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--



--
-- TOC entry 5303 (class 0 OID 0)
-- Dependencies: 240
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--



--
-- TOC entry 5304 (class 0 OID 0)
-- Dependencies: 236
-- Name: variacion_producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--



--
-- TOC entry 5305 (class 0 OID 0)
-- Dependencies: 242
-- Name: wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--



--
-- TOC entry 4985 (class 2606 OID 49184)
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4988 (class 2606 OID 49198)
-- Name: carrito carrito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_pkey PRIMARY KEY (id);


--
-- TOC entry 4992 (class 2606 OID 49210)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- TOC entry 4998 (class 2606 OID 49228)
-- Name: cupon cupon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cupon
    ADD CONSTRAINT cupon_pkey PRIMARY KEY (id);


--
-- TOC entry 5047 (class 2606 OID 49352)
-- Name: email_verification_token email_verification_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_verification_token
    ADD CONSTRAINT email_verification_token_pkey PRIMARY KEY (id);


--
-- TOC entry 5001 (class 2606 OID 49240)
-- Name: item_carrito item_carrito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_carrito
    ADD CONSTRAINT item_carrito_pkey PRIMARY KEY (id);


--
-- TOC entry 5006 (class 2606 OID 49251)
-- Name: item_pedido item_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT item_pedido_pkey PRIMARY KEY (id);


--
-- TOC entry 5010 (class 2606 OID 49260)
-- Name: pago_simulado pago_simulado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago_simulado
    ADD CONSTRAINT pago_simulado_pkey PRIMARY KEY (id);


--
-- TOC entry 5052 (class 2606 OID 49367)
-- Name: password_reset_token password_reset_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_token
    ADD CONSTRAINT password_reset_token_pkey PRIMARY KEY (id);


--
-- TOC entry 5015 (class 2606 OID 49273)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);


--
-- TOC entry 5022 (class 2606 OID 49287)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);


--
-- TOC entry 5058 (class 2606 OID 49384)
-- Name: refresh_token refresh_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_token
    ADD CONSTRAINT refresh_token_pkey PRIMARY KEY (id);


--
-- TOC entry 5065 (class 2606 OID 58777)
-- Name: solicitud_membresia solicitud_membresia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitud_membresia
    ADD CONSTRAINT solicitud_membresia_pkey PRIMARY KEY (id);


--
-- TOC entry 5032 (class 2606 OID 49311)
-- Name: temporada temporada_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temporada
    ADD CONSTRAINT temporada_pkey PRIMARY KEY (id);


--
-- TOC entry 5038 (class 2606 OID 49330)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 5027 (class 2606 OID 49299)
-- Name: variacion_producto variacion_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variacion_producto
    ADD CONSTRAINT variacion_producto_pkey PRIMARY KEY (id);


--
-- TOC entry 5042 (class 2606 OID 49339)
-- Name: wishlist wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pkey PRIMARY KEY (id);


--
-- TOC entry 4986 (class 1259 OID 49386)
-- Name: carrito_estado_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX carrito_estado_idx ON public.carrito USING btree (estado);


--
-- TOC entry 4989 (class 1259 OID 49385)
-- Name: carrito_usuario_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX carrito_usuario_id_idx ON public.carrito USING btree (usuario_id);


--
-- TOC entry 4990 (class 1259 OID 49387)
-- Name: categoria_identificador_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX categoria_identificador_key ON public.categoria USING btree (identificador);


--
-- TOC entry 4993 (class 1259 OID 49390)
-- Name: cupon_activo_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cupon_activo_idx ON public.cupon USING btree (activo);


--
-- TOC entry 4994 (class 1259 OID 49389)
-- Name: cupon_codigo_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cupon_codigo_idx ON public.cupon USING btree (codigo);


--
-- TOC entry 4995 (class 1259 OID 49388)
-- Name: cupon_codigo_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX cupon_codigo_key ON public.cupon USING btree (codigo);


--
-- TOC entry 4996 (class 1259 OID 49391)
-- Name: cupon_fecha_fin_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cupon_fecha_fin_idx ON public.cupon USING btree (fecha_fin);


--
-- TOC entry 5048 (class 1259 OID 49418)
-- Name: email_verification_token_token_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX email_verification_token_token_idx ON public.email_verification_token USING btree (token);


--
-- TOC entry 5049 (class 1259 OID 49417)
-- Name: email_verification_token_token_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX email_verification_token_token_key ON public.email_verification_token USING btree (token);


--
-- TOC entry 5050 (class 1259 OID 49419)
-- Name: email_verification_token_usuario_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX email_verification_token_usuario_id_idx ON public.email_verification_token USING btree (usuario_id);


--
-- TOC entry 4999 (class 1259 OID 49392)
-- Name: item_carrito_carrito_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX item_carrito_carrito_id_idx ON public.item_carrito USING btree (carrito_id);


--
-- TOC entry 5002 (class 1259 OID 49393)
-- Name: item_carrito_producto_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX item_carrito_producto_id_idx ON public.item_carrito USING btree (producto_id);


--
-- TOC entry 5003 (class 1259 OID 49394)
-- Name: item_carrito_variacion_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX item_carrito_variacion_id_idx ON public.item_carrito USING btree (variacion_id);


--
-- TOC entry 5004 (class 1259 OID 49395)
-- Name: item_pedido_pedido_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX item_pedido_pedido_id_idx ON public.item_pedido USING btree (pedido_id);


--
-- TOC entry 5007 (class 1259 OID 49396)
-- Name: item_pedido_producto_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX item_pedido_producto_id_idx ON public.item_pedido USING btree (producto_id);


--
-- TOC entry 5008 (class 1259 OID 49397)
-- Name: item_pedido_variacion_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX item_pedido_variacion_id_idx ON public.item_pedido USING btree (variacion_id);


--
-- TOC entry 5053 (class 1259 OID 49421)
-- Name: password_reset_token_token_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_reset_token_token_idx ON public.password_reset_token USING btree (token);


--
-- TOC entry 5054 (class 1259 OID 49420)
-- Name: password_reset_token_token_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX password_reset_token_token_key ON public.password_reset_token USING btree (token);


--
-- TOC entry 5055 (class 1259 OID 49422)
-- Name: password_reset_token_usuario_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_reset_token_usuario_id_idx ON public.password_reset_token USING btree (usuario_id);


--
-- TOC entry 5011 (class 1259 OID 49400)
-- Name: pedido_creado_en_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedido_creado_en_idx ON public.pedido USING btree (creado_en);


--
-- TOC entry 5012 (class 1259 OID 49401)
-- Name: pedido_cupon_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedido_cupon_id_idx ON public.pedido USING btree (cupon_id);


--
-- TOC entry 5013 (class 1259 OID 49399)
-- Name: pedido_estado_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedido_estado_idx ON public.pedido USING btree (estado);


--
-- TOC entry 5016 (class 1259 OID 49398)
-- Name: pedido_usuario_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pedido_usuario_id_idx ON public.pedido USING btree (usuario_id);


--
-- TOC entry 5017 (class 1259 OID 90116)
-- Name: producto_activo_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX producto_activo_idx ON public.producto USING btree (activo);


--
-- TOC entry 5018 (class 1259 OID 49403)
-- Name: producto_categoria_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX producto_categoria_id_idx ON public.producto USING btree (categoria_id);


--
-- TOC entry 5019 (class 1259 OID 49405)
-- Name: producto_creado_en_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX producto_creado_en_idx ON public.producto USING btree (creado_en);


--
-- TOC entry 5020 (class 1259 OID 67892)
-- Name: producto_genero_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX producto_genero_idx ON public.producto USING btree (genero);


--
-- TOC entry 5023 (class 1259 OID 91714)
-- Name: producto_recomendado_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX producto_recomendado_idx ON public.producto USING btree (recomendado);


--
-- TOC entry 5024 (class 1259 OID 49402)
-- Name: producto_slug_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX producto_slug_key ON public.producto USING btree (slug);


--
-- TOC entry 5025 (class 1259 OID 49404)
-- Name: producto_temporada_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX producto_temporada_id_idx ON public.producto USING btree (temporada_id);


--
-- TOC entry 5056 (class 1259 OID 49426)
-- Name: refresh_token_expira_en_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX refresh_token_expira_en_idx ON public.refresh_token USING btree (expira_en);


--
-- TOC entry 5059 (class 1259 OID 49424)
-- Name: refresh_token_token_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX refresh_token_token_idx ON public.refresh_token USING btree (token);


--
-- TOC entry 5060 (class 1259 OID 49423)
-- Name: refresh_token_token_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX refresh_token_token_key ON public.refresh_token USING btree (token);


--
-- TOC entry 5061 (class 1259 OID 49425)
-- Name: refresh_token_usuario_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX refresh_token_usuario_id_idx ON public.refresh_token USING btree (usuario_id);


--
-- TOC entry 5062 (class 1259 OID 58780)
-- Name: solicitud_membresia_email_solicitante_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solicitud_membresia_email_solicitante_idx ON public.solicitud_membresia USING btree (email_solicitante);


--
-- TOC entry 5063 (class 1259 OID 58779)
-- Name: solicitud_membresia_estado_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solicitud_membresia_estado_idx ON public.solicitud_membresia USING btree (estado);


--
-- TOC entry 5066 (class 1259 OID 58778)
-- Name: solicitud_membresia_usuario_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solicitud_membresia_usuario_id_idx ON public.solicitud_membresia USING btree (usuario_id);


--
-- TOC entry 5030 (class 1259 OID 49408)
-- Name: temporada_nombre_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX temporada_nombre_key ON public.temporada USING btree (nombre);


--
-- TOC entry 5033 (class 1259 OID 49412)
-- Name: usuario_dni_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuario_dni_idx ON public.usuario USING btree (dni);


--
-- TOC entry 5034 (class 1259 OID 49410)
-- Name: usuario_dni_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX usuario_dni_key ON public.usuario USING btree (dni);


--
-- TOC entry 5035 (class 1259 OID 49411)
-- Name: usuario_email_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuario_email_idx ON public.usuario USING btree (email);


--
-- TOC entry 5036 (class 1259 OID 49409)
-- Name: usuario_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX usuario_email_key ON public.usuario USING btree (email);


--
-- TOC entry 5039 (class 1259 OID 49413)
-- Name: usuario_rol_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuario_rol_idx ON public.usuario USING btree (rol);


--
-- TOC entry 5040 (class 1259 OID 58030)
-- Name: usuario_tiene_membresia_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuario_tiene_membresia_idx ON public.usuario USING btree (tiene_membresia);


--
-- TOC entry 5028 (class 1259 OID 49406)
-- Name: variacion_producto_producto_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX variacion_producto_producto_id_idx ON public.variacion_producto USING btree (producto_id);


--
-- TOC entry 5029 (class 1259 OID 67088)
-- Name: variacion_producto_sku_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX variacion_producto_sku_idx ON public.variacion_producto USING btree (sku);


--
-- TOC entry 5043 (class 1259 OID 49415)
-- Name: wishlist_producto_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wishlist_producto_id_idx ON public.wishlist USING btree (producto_id);


--
-- TOC entry 5044 (class 1259 OID 49414)
-- Name: wishlist_usuario_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wishlist_usuario_id_idx ON public.wishlist USING btree (usuario_id);


--
-- TOC entry 5045 (class 1259 OID 49416)
-- Name: wishlist_usuario_id_producto_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX wishlist_usuario_id_producto_id_key ON public.wishlist USING btree (usuario_id, producto_id);


--
-- TOC entry 5067 (class 2606 OID 49427)
-- Name: carrito carrito_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) ON DELETE CASCADE;


--
-- TOC entry 5082 (class 2606 OID 49502)
-- Name: email_verification_token email_verification_token_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_verification_token
    ADD CONSTRAINT email_verification_token_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) ON DELETE CASCADE;


--
-- TOC entry 5068 (class 2606 OID 49432)
-- Name: item_carrito fk_item_carrito_variacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_carrito
    ADD CONSTRAINT fk_item_carrito_variacion FOREIGN KEY (variacion_id) REFERENCES public.variacion_producto(id) ON DELETE CASCADE;


--
-- TOC entry 5071 (class 2606 OID 49447)
-- Name: item_pedido fk_item_pedido_variacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT fk_item_pedido_variacion FOREIGN KEY (variacion_id) REFERENCES public.variacion_producto(id) ON DELETE CASCADE;


--
-- TOC entry 5069 (class 2606 OID 49437)
-- Name: item_carrito item_carrito_carrito_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_carrito
    ADD CONSTRAINT item_carrito_carrito_id_fkey FOREIGN KEY (carrito_id) REFERENCES public.carrito(id) ON DELETE CASCADE;


--
-- TOC entry 5070 (class 2606 OID 49442)
-- Name: item_carrito item_carrito_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_carrito
    ADD CONSTRAINT item_carrito_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.producto(id) ON DELETE CASCADE;


--
-- TOC entry 5072 (class 2606 OID 49452)
-- Name: item_pedido item_pedido_pedido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT item_pedido_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedido(id) ON DELETE CASCADE;


--
-- TOC entry 5073 (class 2606 OID 49457)
-- Name: item_pedido item_pedido_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT item_pedido_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.producto(id) ON DELETE CASCADE;


--
-- TOC entry 5074 (class 2606 OID 49462)
-- Name: pago_simulado pago_simulado_pedido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago_simulado
    ADD CONSTRAINT pago_simulado_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedido(id) ON DELETE CASCADE;


--
-- TOC entry 5083 (class 2606 OID 49507)
-- Name: password_reset_token password_reset_token_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_token
    ADD CONSTRAINT password_reset_token_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) ON DELETE CASCADE;


--
-- TOC entry 5075 (class 2606 OID 49467)
-- Name: pedido pedido_cupon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_cupon_id_fkey FOREIGN KEY (cupon_id) REFERENCES public.cupon(id) ON DELETE SET NULL;


--
-- TOC entry 5076 (class 2606 OID 49472)
-- Name: pedido pedido_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) ON DELETE CASCADE;


--
-- TOC entry 5077 (class 2606 OID 49477)
-- Name: producto producto_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categoria(id) ON DELETE SET NULL;


--
-- TOC entry 5078 (class 2606 OID 49482)
-- Name: producto producto_temporada_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_temporada_id_fkey FOREIGN KEY (temporada_id) REFERENCES public.temporada(id) ON DELETE SET NULL;


--
-- TOC entry 5084 (class 2606 OID 49512)
-- Name: refresh_token refresh_token_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_token
    ADD CONSTRAINT refresh_token_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) ON DELETE CASCADE;


--
-- TOC entry 5085 (class 2606 OID 58781)
-- Name: solicitud_membresia solicitud_membresia_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitud_membresia
    ADD CONSTRAINT solicitud_membresia_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) ON DELETE CASCADE;


--
-- TOC entry 5079 (class 2606 OID 49487)
-- Name: variacion_producto variacion_producto_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variacion_producto
    ADD CONSTRAINT variacion_producto_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.producto(id) ON DELETE CASCADE;


--
-- TOC entry 5080 (class 2606 OID 49492)
-- Name: wishlist wishlist_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.producto(id) ON DELETE CASCADE;


--
-- TOC entry 5081 (class 2606 OID 49497)
-- Name: wishlist wishlist_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) ON DELETE CASCADE;


--
-- TOC entry 5273 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--



-- Completed on 2025-12-02 02:26:12

--
-- PostgreSQL database dump complete
--

\unrestrict bilCBC12jCb93hHqjhLMWzgu9vIpRzCMjgwSvSpo67Ohhy6EBNlD72SuM3vqzNz

-- Completed on 2025-12-02 02:26:12

--
-- PostgreSQL database cluster dump complete
--

