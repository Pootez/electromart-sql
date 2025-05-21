--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-05-21 13:16:30

SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16618)
-- Name: brand; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.brand (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


--
-- TOC entry 218 (class 1259 OID 16623)
-- Name: brand_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 218
-- Name: brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.brand_id_seq OWNED BY public.brand.id;


--
-- TOC entry 219 (class 1259 OID 16624)
-- Name: category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.category (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


--
-- TOC entry 220 (class 1259 OID 16629)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 220
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 221 (class 1259 OID 16630)
-- Name: orderitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orderitem (
    id bigint NOT NULL,
    orderid bigint NOT NULL,
    productid bigint NOT NULL,
    quantity bigint NOT NULL,
    subtotal numeric(10,2) NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 16633)
-- Name: orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 222
-- Name: orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orderitem_id_seq OWNED BY public.orderitem.id;


--
-- TOC entry 223 (class 1259 OID 16634)
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    userid bigint NOT NULL,
    totalamount numeric(10,2) NOT NULL,
    orderdate timestamp with time zone NOT NULL,
    address character varying(255) NOT NULL,
    status character varying(30) DEFAULT 'pending'::character varying NOT NULL,
    CONSTRAINT orders_status_check CHECK (((status)::text = ANY (ARRAY[('pending'::character varying)::text, ('processing'::character varying)::text, ('shipped'::character varying)::text, ('delivered'::character varying)::text, ('cancelled'::character varying)::text, ('returned'::character varying)::text])))
);


--
-- TOC entry 224 (class 1259 OID 16639)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 224
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 225 (class 1259 OID 16640)
-- Name: payment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payment (
    id bigint NOT NULL,
    orderid bigint NOT NULL,
    amount numeric(10,2) NOT NULL,
    paymentdate timestamp with time zone NOT NULL,
    status character varying(30) DEFAULT 'pending'::character varying NOT NULL,
    method character varying(30) DEFAULT 'Vipps'::character varying NOT NULL,
    CONSTRAINT payment_method_check CHECK (((method)::text = ANY ((ARRAY['Credit Card'::character varying, 'Vipps'::character varying, 'Klarna'::character varying])::text[]))),
    CONSTRAINT payment_status_check CHECK (((status)::text = ANY (ARRAY[('pending'::character varying)::text, ('paid'::character varying)::text, ('failed'::character varying)::text, ('refunded'::character varying)::text])))
);


--
-- TOC entry 226 (class 1259 OID 16645)
-- Name: payment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 226
-- Name: payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payment_id_seq OWNED BY public.payment.id;


--
-- TOC entry 227 (class 1259 OID 16646)
-- Name: product; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 228 (class 1259 OID 16651)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 228
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 229 (class 1259 OID 16652)
-- Name: users; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 230 (class 1259 OID 16655)
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 230
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- TOC entry 4772 (class 2604 OID 16656)
-- Name: brand id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.brand ALTER COLUMN id SET DEFAULT nextval('public.brand_id_seq'::regclass);


--
-- TOC entry 4773 (class 2604 OID 16657)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 4774 (class 2604 OID 16658)
-- Name: orderitem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderitem ALTER COLUMN id SET DEFAULT nextval('public.orderitem_id_seq'::regclass);


--
-- TOC entry 4775 (class 2604 OID 16659)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 4777 (class 2604 OID 16660)
-- Name: payment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment ALTER COLUMN id SET DEFAULT nextval('public.payment_id_seq'::regclass);


--
-- TOC entry 4780 (class 2604 OID 16661)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 4781 (class 2604 OID 16662)
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- TOC entry 4957 (class 0 OID 16618)
-- Dependencies: 217
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.brand VALUES (1, 'Samsung', 'Consumer electronics');
INSERT INTO public.brand VALUES (2, 'Apple', 'Mainly smartphones');


--
-- TOC entry 4959 (class 0 OID 16624)
-- Dependencies: 219
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.category VALUES (1, 'Smartphones', 'All smartphones');
INSERT INTO public.category VALUES (2, 'Tablets', 'All tablets');


--
-- TOC entry 4961 (class 0 OID 16630)
-- Dependencies: 221
-- Data for Name: orderitem; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.orderitem VALUES (1, 2, 3, 1, 9999.00);
INSERT INTO public.orderitem VALUES (2, 3, 1, 1, 8999.00);
INSERT INTO public.orderitem VALUES (3, 1, 2, 1, 12999.00);


--
-- TOC entry 4963 (class 0 OID 16634)
-- Dependencies: 223
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.orders VALUES (1, 3, 8999.00, '2025-01-01 00:00:00+01', 'Lillegata 33', 'pending');
INSERT INTO public.orders VALUES (2, 2, 12999.00, '2025-02-02 00:00:00+01', 'Storgata 22', 'pending');
INSERT INTO public.orders VALUES (3, 1, 9999.00, '2025-03-03 00:00:00+01', 'Kongeveien 1', 'pending');


--
-- TOC entry 4965 (class 0 OID 16640)
-- Dependencies: 225
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.payment VALUES (1, 2, 12999.00, '2025-02-02 00:00:00+01', 'pending', 'Vipps');
INSERT INTO public.payment VALUES (2, 1, 8999.00, '2025-01-01 00:00:00+01', 'pending', 'Vipps');
INSERT INTO public.payment VALUES (3, 3, 9999.00, '2025-03-03 00:00:00+01', 'pending', 'Vipps');


--
-- TOC entry 4967 (class 0 OID 16646)
-- Dependencies: 227
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.product VALUES (1, 'Galaxy S25', 'Flagship-phone', 8999.00, 56, 1, 1);
INSERT INTO public.product VALUES (2, 'iPad 13 gen', '11" tablet', 12999.00, 33, 2, 2);
INSERT INTO public.product VALUES (3, 'iPad 16', 'Flagship-Apple', 9999.00, 48, 1, 1);


--
-- TOC entry 4969 (class 0 OID 16652)
-- Dependencies: 229
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'ola@nord.no', 'e43b4a66', 'Ola', 'Nordmann', '47880403', false);
INSERT INTO public.users VALUES (2, 'kari@nord.no', 'e3ec8fbb', 'Kari', 'Nordmann', '92988565', true);
INSERT INTO public.users VALUES (3, 'lise@nord.no', 'effddd46', 'Lise', 'Nordmann', '98674085', false);


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 218
-- Name: brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.brand_id_seq', 2, true);


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 220
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.category_id_seq', 2, true);


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 222
-- Name: orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orderitem_id_seq', 3, true);


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 224
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orders_id_seq', 3, true);


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 226
-- Name: payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.payment_id_seq', 3, true);


--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 228
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_id_seq', 3, true);


--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 230
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_userid_seq', 3, true);


--
-- TOC entry 4786 (class 2606 OID 16664)
-- Name: brand idx_16424_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT idx_16424_primary PRIMARY KEY (id);


--
-- TOC entry 4788 (class 2606 OID 16666)
-- Name: category idx_16431_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT idx_16431_primary PRIMARY KEY (id);


--
-- TOC entry 4791 (class 2606 OID 16668)
-- Name: orderitem idx_16438_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderitem
    ADD CONSTRAINT idx_16438_primary PRIMARY KEY (id);


--
-- TOC entry 4794 (class 2606 OID 16670)
-- Name: orders idx_16443_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT idx_16443_primary PRIMARY KEY (id);


--
-- TOC entry 4798 (class 2606 OID 16672)
-- Name: payment idx_16448_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT idx_16448_primary PRIMARY KEY (id);


--
-- TOC entry 4802 (class 2606 OID 16674)
-- Name: product idx_16453_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT idx_16453_primary PRIMARY KEY (id);


--
-- TOC entry 4805 (class 2606 OID 16676)
-- Name: users idx_16460_primary; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT idx_16460_primary PRIMARY KEY (userid);


--
-- TOC entry 4789 (class 1259 OID 16677)
-- Name: idx_16438_orderid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_16438_orderid ON public.orderitem USING btree (orderid);


--
-- TOC entry 4792 (class 1259 OID 16678)
-- Name: idx_16438_productid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_16438_productid ON public.orderitem USING btree (productid);


--
-- TOC entry 4795 (class 1259 OID 16679)
-- Name: idx_16443_userid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_16443_userid ON public.orders USING btree (userid);


--
-- TOC entry 4796 (class 1259 OID 16680)
-- Name: idx_16448_orderid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_16448_orderid ON public.payment USING btree (orderid);


--
-- TOC entry 4799 (class 1259 OID 16681)
-- Name: idx_16453_brandid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_16453_brandid ON public.product USING btree (brandid);


--
-- TOC entry 4800 (class 1259 OID 16682)
-- Name: idx_16453_categoryid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_16453_categoryid ON public.product USING btree (categoryid);


--
-- TOC entry 4803 (class 1259 OID 16683)
-- Name: idx_16460_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_16460_email ON public.users USING btree (email);


--
-- TOC entry 4806 (class 2606 OID 16684)
-- Name: orderitem orderitem_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderitem
    ADD CONSTRAINT orderitem_ibfk_1 FOREIGN KEY (orderid) REFERENCES public.orders(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4807 (class 2606 OID 16689)
-- Name: orderitem orderitem_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderitem
    ADD CONSTRAINT orderitem_ibfk_2 FOREIGN KEY (productid) REFERENCES public.product(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4808 (class 2606 OID 16694)
-- Name: orders orders_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY (userid) REFERENCES public.users(userid) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4809 (class 2606 OID 16699)
-- Name: payment payment_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_ibfk_1 FOREIGN KEY (orderid) REFERENCES public.orders(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4810 (class 2606 OID 16704)
-- Name: product product_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_ibfk_1 FOREIGN KEY (brandid) REFERENCES public.brand(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4811 (class 2606 OID 16709)
-- Name: product product_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_ibfk_2 FOREIGN KEY (categoryid) REFERENCES public.category(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2025-05-21 13:16:31

--
-- PostgreSQL database dump complete
--

