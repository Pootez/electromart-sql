--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-05-20 11:32:35

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 16424)
-- Name: brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.brand OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16423)
-- Name: brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.brand_id_seq OWNER TO postgres;

--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 219
-- Name: brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brand_id_seq OWNED BY public.brand.id;


--
-- TOC entry 222 (class 1259 OID 16431)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16430)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 221
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 224 (class 1259 OID 16438)
-- Name: orderitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderitem (
    id bigint NOT NULL,
    orderid bigint NOT NULL,
    productid bigint NOT NULL,
    quantity bigint NOT NULL,
    subtotal numeric(10,2) NOT NULL
);


ALTER TABLE public.orderitem OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16437)
-- Name: orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderitem_id_seq OWNER TO postgres;

--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 223
-- Name: orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderitem_id_seq OWNED BY public.orderitem.id;


--
-- TOC entry 226 (class 1259 OID 16443)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    userid bigint NOT NULL,
    totalamount numeric(10,2) NOT NULL,
    orderdate timestamp with time zone NOT NULL,
    address character varying(255) NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16442)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 225
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 228 (class 1259 OID 16448)
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    id bigint NOT NULL,
    orderid bigint NOT NULL,
    amount numeric(10,2) NOT NULL,
    paymentdate timestamp with time zone NOT NULL
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16447)
-- Name: payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_id_seq OWNER TO postgres;

--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 227
-- Name: payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_id_seq OWNED BY public.payment.id;


--
-- TOC entry 230 (class 1259 OID 16453)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    stockquantity bigint NOT NULL,
    brandid bigint NOT NULL,
    categoryid bigint NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16452)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 229
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 232 (class 1259 OID 16460)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    userid bigint NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(100) NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    phonenumber character varying(20) NOT NULL,
    isadmin boolean NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16459)
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_userid_seq OWNER TO postgres;

--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 231
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- TOC entry 4774 (class 2604 OID 16427)
-- Name: brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand ALTER COLUMN id SET DEFAULT nextval('public.brand_id_seq'::regclass);


--
-- TOC entry 4775 (class 2604 OID 16434)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 4776 (class 2604 OID 16441)
-- Name: orderitem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitem ALTER COLUMN id SET DEFAULT nextval('public.orderitem_id_seq'::regclass);


--
-- TOC entry 4777 (class 2604 OID 16446)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 4778 (class 2604 OID 16451)
-- Name: payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN id SET DEFAULT nextval('public.payment_id_seq'::regclass);


--
-- TOC entry 4779 (class 2604 OID 16456)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 4780 (class 2604 OID 16463)
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- TOC entry 4954 (class 0 OID 16424)
-- Dependencies: 220
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brand (id, name, description) FROM stdin;
1	Samsung	Consumer electronics
2	Apple	Mainly smartphones
\.


--
-- TOC entry 4956 (class 0 OID 16431)
-- Dependencies: 222
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name, description) FROM stdin;
1	Smartphones	All smartphones
2	Tablets	All tablets
\.


--
-- TOC entry 4958 (class 0 OID 16438)
-- Dependencies: 224
-- Data for Name: orderitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderitem (id, orderid, productid, quantity, subtotal) FROM stdin;
1	2	3	1	9999.00
2	3	1	1	8999.00
3	1	2	1	12999.00
\.


--
-- TOC entry 4960 (class 0 OID 16443)
-- Dependencies: 226
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, userid, totalamount, orderdate, address) FROM stdin;
1	3	8999.00	2025-01-01 00:00:00+01	Lillegata 33
2	2	12999.00	2025-02-02 00:00:00+01	Storgata 22
3	1	9999.00	2025-03-03 00:00:00+01	Kongeveien 1
\.


--
-- TOC entry 4962 (class 0 OID 16448)
-- Dependencies: 228
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (id, orderid, amount, paymentdate) FROM stdin;
1	2	12999.00	2025-02-02 00:00:00+01
2	1	8999.00	2025-01-01 00:00:00+01
3	3	9999.00	2025-03-03 00:00:00+01
\.


--
-- TOC entry 4964 (class 0 OID 16453)
-- Dependencies: 230
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, name, description, price, stockquantity, brandid, categoryid) FROM stdin;
1	Galaxy S25	Flagship-phone	8999.00	56	1	1
2	iPad 13 gen	11" tablet	12999.00	33	2	2
3	iPad 16	Flagship-Apple	9999.00	48	1	1
\.


--
-- TOC entry 4966 (class 0 OID 16460)
-- Dependencies: 232
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (userid, email, password, firstname, lastname, phonenumber, isadmin) FROM stdin;
1	ola@nord.no	e43b4a66	Ola	Nordmann	47880403	f
2	kari@nord.no	e3ec8fbb	Kari	Nordmann	92988565	t
3	lise@nord.no	effddd46	Lise	Nordmann	98674085	f
\.


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 219
-- Name: brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_id_seq', 2, true);


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 221
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 2, true);


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 223
-- Name: orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderitem_id_seq', 3, true);


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 225
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 3, true);


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 227
-- Name: payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_id_seq', 3, true);


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 229
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 3, true);


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 231
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_userid_seq', 3, true);


--
-- TOC entry 4782 (class 2606 OID 16487)
-- Name: brand idx_16424_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT idx_16424_primary PRIMARY KEY (id);


--
-- TOC entry 4784 (class 2606 OID 16489)
-- Name: category idx_16431_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT idx_16431_primary PRIMARY KEY (id);


--
-- TOC entry 4787 (class 2606 OID 16484)
-- Name: orderitem idx_16438_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitem
    ADD CONSTRAINT idx_16438_primary PRIMARY KEY (id);


--
-- TOC entry 4790 (class 2606 OID 16483)
-- Name: orders idx_16443_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT idx_16443_primary PRIMARY KEY (id);


--
-- TOC entry 4794 (class 2606 OID 16485)
-- Name: payment idx_16448_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT idx_16448_primary PRIMARY KEY (id);


--
-- TOC entry 4798 (class 2606 OID 16486)
-- Name: product idx_16453_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT idx_16453_primary PRIMARY KEY (id);


--
-- TOC entry 4801 (class 2606 OID 16488)
-- Name: users idx_16460_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT idx_16460_primary PRIMARY KEY (userid);


--
-- TOC entry 4785 (class 1259 OID 16466)
-- Name: idx_16438_orderid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_16438_orderid ON public.orderitem USING btree (orderid);


--
-- TOC entry 4788 (class 1259 OID 16468)
-- Name: idx_16438_productid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_16438_productid ON public.orderitem USING btree (productid);


--
-- TOC entry 4791 (class 1259 OID 16465)
-- Name: idx_16443_userid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_16443_userid ON public.orders USING btree (userid);


--
-- TOC entry 4792 (class 1259 OID 16469)
-- Name: idx_16448_orderid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_16448_orderid ON public.payment USING btree (orderid);


--
-- TOC entry 4795 (class 1259 OID 16470)
-- Name: idx_16453_brandid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_16453_brandid ON public.product USING btree (brandid);


--
-- TOC entry 4796 (class 1259 OID 16472)
-- Name: idx_16453_categoryid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_16453_categoryid ON public.product USING btree (categoryid);


--
-- TOC entry 4799 (class 1259 OID 16475)
-- Name: idx_16460_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_16460_email ON public.users USING btree (email);


--
-- TOC entry 4802 (class 2606 OID 16490)
-- Name: orderitem orderitem_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitem
    ADD CONSTRAINT orderitem_ibfk_1 FOREIGN KEY (orderid) REFERENCES public.orders(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4803 (class 2606 OID 16495)
-- Name: orderitem orderitem_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitem
    ADD CONSTRAINT orderitem_ibfk_2 FOREIGN KEY (productid) REFERENCES public.product(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4804 (class 2606 OID 16500)
-- Name: orders orders_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY (userid) REFERENCES public.users(userid) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4805 (class 2606 OID 16505)
-- Name: payment payment_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_ibfk_1 FOREIGN KEY (orderid) REFERENCES public.orders(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4806 (class 2606 OID 16510)
-- Name: product product_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_ibfk_1 FOREIGN KEY (brandid) REFERENCES public.brand(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4807 (class 2606 OID 16515)
-- Name: product product_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_ibfk_2 FOREIGN KEY (categoryid) REFERENCES public.category(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2025-05-20 11:32:35

--
-- PostgreSQL database dump complete
--

