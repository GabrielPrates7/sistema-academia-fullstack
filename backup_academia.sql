--
-- PostgreSQL database dump
--

\restrict O3oaiOqEItaoX1RIivLb5RgbcluKL6ideKfKyJcnZALb2zzMe4VZCjoOhabhc7d

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2025-12-08 22:39:50

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
-- TOC entry 222 (class 1259 OID 16410)
-- Name: exercicios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercicios (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    grupo_id integer NOT NULL
);


ALTER TABLE public.exercicios OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16409)
-- Name: exercicios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exercicios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.exercicios_id_seq OWNER TO postgres;

--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 221
-- Name: exercicios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exercicios_id_seq OWNED BY public.exercicios.id;


--
-- TOC entry 220 (class 1259 OID 16399)
-- Name: grupos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grupos (
    id integer NOT NULL,
    nome character varying(255) NOT NULL
);


ALTER TABLE public.grupos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16398)
-- Name: grupos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grupos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grupos_id_seq OWNER TO postgres;

--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 219
-- Name: grupos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grupos_id_seq OWNED BY public.grupos.id;


--
-- TOC entry 4862 (class 2604 OID 16413)
-- Name: exercicios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercicios ALTER COLUMN id SET DEFAULT nextval('public.exercicios_id_seq'::regclass);


--
-- TOC entry 4861 (class 2604 OID 16402)
-- Name: grupos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupos ALTER COLUMN id SET DEFAULT nextval('public.grupos_id_seq'::regclass);


--
-- TOC entry 5021 (class 0 OID 16410)
-- Dependencies: 222
-- Data for Name: exercicios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.exercicios VALUES (1, 'Supino Reto', 1);
INSERT INTO public.exercicios VALUES (2, 'Supino Inclinado com Halteres', 1);
INSERT INTO public.exercicios VALUES (3, 'Crucifixo na Máquina', 1);
INSERT INTO public.exercicios VALUES (4, 'Flexão de Braço', 1);
INSERT INTO public.exercicios VALUES (5, 'Pullover', 1);
INSERT INTO public.exercicios VALUES (6, 'Barra Fixa (ou Puxada Alta)', 2);
INSERT INTO public.exercicios VALUES (7, 'Remada Curvada', 2);
INSERT INTO public.exercicios VALUES (8, 'Remada Unilateral (Serrote)', 2);
INSERT INTO public.exercicios VALUES (9, 'Pulldown na Polia', 2);
INSERT INTO public.exercicios VALUES (10, 'Agachamento Livre', 3);
INSERT INTO public.exercicios VALUES (11, 'Leg Press', 3);
INSERT INTO public.exercicios VALUES (12, 'Cadeira Extensora', 3);
INSERT INTO public.exercicios VALUES (13, 'Stiff', 3);
INSERT INTO public.exercicios VALUES (14, 'Panturrilha em Pé', 3);
INSERT INTO public.exercicios VALUES (15, 'Rosca Direta com Barra', 4);
INSERT INTO public.exercicios VALUES (16, 'Rosca Alternada com Halteres', 4);
INSERT INTO public.exercicios VALUES (17, 'Tríceps na Polia Alta', 4);
INSERT INTO public.exercicios VALUES (18, 'Tríceps Testa', 4);
INSERT INTO public.exercicios VALUES (19, 'Desenvolvimento Militar', 5);
INSERT INTO public.exercicios VALUES (20, 'Elevação Lateral', 5);
INSERT INTO public.exercicios VALUES (21, 'Elevação Frontal', 5);
INSERT INTO public.exercicios VALUES (22, 'Remada Alta', 5);


--
-- TOC entry 5019 (class 0 OID 16399)
-- Dependencies: 220
-- Data for Name: grupos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.grupos VALUES (1, 'Peito');
INSERT INTO public.grupos VALUES (2, 'Costas');
INSERT INTO public.grupos VALUES (3, 'Pernas');
INSERT INTO public.grupos VALUES (4, 'Braços');
INSERT INTO public.grupos VALUES (5, 'Ombro');


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 221
-- Name: exercicios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercicios_id_seq', 22, true);


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 219
-- Name: grupos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grupos_id_seq', 5, true);


--
-- TOC entry 4868 (class 2606 OID 16418)
-- Name: exercicios exercicios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercicios
    ADD CONSTRAINT exercicios_pkey PRIMARY KEY (id);


--
-- TOC entry 4864 (class 2606 OID 16426)
-- Name: grupos grupos_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_nome_key UNIQUE (nome);


--
-- TOC entry 4866 (class 2606 OID 16406)
-- Name: grupos grupos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_pkey PRIMARY KEY (id);


--
-- TOC entry 4869 (class 1259 OID 16424)
-- Name: idx_exercicios_grupo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_exercicios_grupo_id ON public.exercicios USING btree (grupo_id);


--
-- TOC entry 4870 (class 2606 OID 16419)
-- Name: exercicios fk_grupo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercicios
    ADD CONSTRAINT fk_grupo FOREIGN KEY (grupo_id) REFERENCES public.grupos(id) ON DELETE CASCADE;


-- Completed on 2025-12-08 22:39:50

--
-- PostgreSQL database dump complete
--

\unrestrict O3oaiOqEItaoX1RIivLb5RgbcluKL6ideKfKyJcnZALb2zzMe4VZCjoOhabhc7d

