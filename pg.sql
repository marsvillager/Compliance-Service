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
-- Name: COLUMN config."timestamp"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.config."timestamp" IS '时间戳，标记存储的时间（主键）';


--
-- Name: COLUMN config.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.config.id IS '配置文件 ID，方便读取（主键）';


--
-- Name: COLUMN config.os; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.config.os IS '标记分发的系统
';


--
-- Name: COLUMN config.rule_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.config.rule_id IS '检查项 ID';


--
-- Name: COLUMN config.data; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.config.data IS '检查预期值';


--
-- Name: COLUMN config.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.config.type IS '比对类型（0直接比对，1需要进行文本处理）';


--
-- Name: COLUMN config.param; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.config.param IS '字符数组类型，存储多个命令行或 path';


--
-- Name: result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.result (
    "timestamp" timestamp with time zone NOT NULL,
    id integer NOT NULL,
    os text,
    server_ip inet,
    host_ip inet,
    rule_id text,
    expected text[],
    actual text[],
    status text
);


ALTER TABLE public.result OWNER TO postgres;

--
-- Name: COLUMN result."timestamp"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.result."timestamp" IS '时间戳，标记存储的时间';


--
-- Name: COLUMN result.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.result.id IS '配置文件 ID，方便读取';


--
-- Name: COLUMN result.os; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.result.os IS '标记系统类型';


--
-- Name: COLUMN result.server_ip; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.result.server_ip IS '标记负责比对的主机';


--
-- Name: COLUMN result.host_ip; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.result.host_ip IS '标记被比对的主机';


--
-- Name: COLUMN result.rule_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.result.rule_id IS '标记是哪个检查项';


--
-- Name: COLUMN result.expected; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.result.expected IS '查询结果的预期值';


--
-- Name: COLUMN result.actual; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.result.actual IS '查询结果的实际值';


--
-- Name: COLUMN result.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.result.status IS '比对的结果（pass/failed）';


--
-- Data for Name: config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.config ("timestamp", id, os, rule_id, data, type, param) FROM stdin;
2022-07-05 17:56:24.686603+08	2	windows10	BL696_0086	{1}	0	{"Machine\\\\System\\\\CurrentControlSet\\\\Control\\\\SCMConfig:EnableSvchostMitigationPolicy"}
2022-07-05 17:56:48.169855+08	2	debain10	BL999_8949	{masked}	0	{"systemctl is-enabled ctrl-alt-del.target"}
2022-07-05 17:57:27.191144+08	2	debain10	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	0	{"sysctl fs.protected_symlinks","sysctl fs.protected_hardlinks"}
2022-07-05 17:57:31.251354+08	2	debain10	BL999_6629	{0664,0,0}	0	{"stat /etc/issue"}
2022-07-05 17:56:36.89954+08	2	windows10	BL696_7921	{1,2}	0	{"Software\\\\Policies\\\\Microsoft\\\\Windows\\\\SettingSync:DisableCredentialsSettingSync","Software\\\\Policies\\\\Microsoft\\\\Windows\\\\SettingSync:DisableCredentialsSettingSyncUserOverride"}
2022-07-05 17:56:35.588643+08	2	windows10	BL696-0711	{1,AllSigned}	0	{"Machine\\\\Software\\\\Policies\\\\Microsoft\\\\Windows\\\\PowerShell:EnableScripts","Machine\\\\Software\\\\Policies\\\\Microsoft\\\\Windows\\\\PowerShell:ExecutionPolicy"}
2022-07-05 17:40:27.19112+08	2	windows10	BL696_0461	\N	0	{"Xbox Live 网络服务"}
\.


--
-- Data for Name: result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.result ("timestamp", id, os, server_ip, host_ip, rule_id, expected, actual, status) FROM stdin;
2022-07-09 20:33:54.901+08	2	debain10	222.20.75.121	10.16.146.226	BL999_8949	{masked}	{masked}	pass
2022-07-09 20:33:55.53+08	2	debain10	222.20.75.121	10.16.146.226	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-09 20:33:55.533+08	2	debain10	222.20.75.121	10.16.146.226	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-09 20:33:55.537+08	2	debain10	222.20.75.121	10.16.146.226	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-","文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-09 20:33:55.541+08	2	debain10	222.20.75.121	10.16.146.226	BL999_4000	{}	{}	pass
2022-07-09 20:33:55.543+08	2	debain10	222.20.75.121	10.16.146.226	BL999_8949	{masked}	{masked}	pass
2022-07-09 20:33:55.545+08	2	debain10	222.20.75.121	10.16.146.226	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-09 20:33:55.546+08	2	debain10	222.20.75.121	10.16.146.226	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-09 20:33:55.548+08	2	debain10	222.20.75.121	10.16.146.226	BL999_4000	{}	{}	pass
2022-07-09 20:33:55.551+08	2	debain10	222.20.75.121	10.16.146.226	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-10 01:41:51.267+08	2	windows10	172.17.208.1	192.168.199.185	BL696-0711	{1,AllSigned}	\N	failed
2022-07-10 01:41:51.367+08	2	windows10	172.17.208.1	192.168.199.185	BL696_7921	{1,2}	\N	failed
2022-07-10 01:41:51.372+08	2	windows10	172.17.208.1	192.168.199.185	BL696-0711	{1,AllSigned}	{1,AllSigned}	pass
2022-07-10 01:41:51.38+08	2	windows10	172.17.208.1	192.168.199.185	BL696_0461	\N	{1}	failed
2022-07-10 01:41:51.385+08	2	windows10	172.17.208.1	192.168.199.185	BL696_0461	\N	\N	pass
2022-07-10 01:41:51.388+08	2	windows10	172.17.208.1	192.168.199.185	BL696_0086	{1}	\N	failed
2022-07-10 01:41:51.392+08	2	windows10	172.17.208.1	192.168.199.185	BL696-0711	{1,AllSigned}	\N	failed
2022-07-10 01:41:51.396+08	2	windows10	172.17.208.1	192.168.199.185	BL696_0086	{1}	\N	failed
2022-07-10 01:41:51.399+08	2	windows10	172.17.208.1	192.168.199.185	BL696_7921	{1,2}	\N	failed
2022-07-10 01:41:51.403+08	2	windows10	172.17.208.1	192.168.199.185	BL696_0086	{1}	\N	failed
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

