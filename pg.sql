--
-- PostgreSQL database dump
--

-- Dumped from database version 13.7
-- Dumped by pg_dump version 13.7

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
-- Name: config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.config (
    "timestamp" timestamp with time zone NOT NULL,
    id integer NOT NULL,
    os text,
    rule_id text,
    data text[],
    type integer,
    param text[]
);


ALTER TABLE public.config OWNER TO postgres;

--
-- Name: result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.result (
    "timestamp" timestamp with time zone NOT NULL,
    id integer NOT NULL,
    os text,
    sever_ip inet,
    host_ip inet,
    rule_id text,
    expected text[],
    actual text[],
    status text
);


ALTER TABLE public.result OWNER TO postgres;

--
-- Data for Name: config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.config ("timestamp", id, os, rule_id, data, type, param) FROM stdin;
2022-07-05 17:40:27.19112+08	2	windows10	BL696_0461	{0}	0	{"Xbox Live 网络服务"}
2022-07-05 17:56:24.686603+08	2	windows10	BL696_0086	{1}	0	{"Machine\\\\System\\\\CurrentControlSet\\\\Control\\\\SCMConfig:EnableSvchostMitigationPolicy"}
2022-07-05 17:56:35.588643+08	2	windows10	BL696-0711	{0}	0	{"Machine\\\\Software\\\\Policies\\\\Microsoft\\\\Windows\\\\PowerShell:EnableScripts","Machine\\\\Software\\\\Policies\\\\Microsoft\\\\Windows\\\\PowerShell:ExecutionPolicy"}
2022-07-05 17:56:48.169855+08	2	debain10	BL999_8949	{masked}	0	{"systemctl is-enabled ctrl-alt-del.target"}
2022-07-05 17:57:27.191144+08	2	debain10	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	0	{"sysctl fs.protected_symlinks","sysctl fs.protected_hardlinks"}
2022-07-05 17:57:31.251354+08	2	debain10	BL999_6629	{0664,0,0}	0	{"stat /etc/issue"}
\.


--
-- Data for Name: result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.result ("timestamp", id, os, sever_ip, host_ip, rule_id, expected, actual, status) FROM stdin;
2022-07-05 17:40:27.19112+08	2	windows10	192.168.1.155	192.168.1.150	BL696_0461	{1}	{1}	pass
\.


--
-- Name: config config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY ("timestamp", id);


--
-- Name: result result_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.result
    ADD CONSTRAINT result_pkey PRIMARY KEY ("timestamp", id);


--
-- PostgreSQL database dump complete
--

