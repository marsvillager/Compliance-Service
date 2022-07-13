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
    cid bigint NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    id integer NOT NULL,
    os text,
    lang text,
    rule_id text,
    data text[],
    type integer,
    param text[]
);


ALTER TABLE public.config OWNER TO postgres;

--
-- Name: COLUMN config.cid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.config.cid IS '主键，自增';


--
-- Name: COLUMN config."timestamp"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.config."timestamp" IS '时间戳，标记存储的时间';


--
-- Name: COLUMN config.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.config.id IS '配置文件 ID，方便读取';


--
-- Name: COLUMN config.os; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.config.os IS '标记分发的系统';


--
-- Name: COLUMN config.lang; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.config.lang IS '标记系统语言';


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
-- Name: cid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cid OWNER TO postgres;

--
-- Name: cid; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cid OWNED BY public.config.cid;


--
-- Name: SEQUENCE cid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON SEQUENCE public.cid IS 'config 自增主键';


--
-- Name: result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.result (
    rid bigint,
    "timestamp" timestamp with time zone NOT NULL,
    id integer NOT NULL,
    os text,
    lang text,
    server_ip inet,
    host_ip inet,
    rule_id text,
    expected text[],
    actual text[],
    status text
);


ALTER TABLE public.result OWNER TO postgres;

--
-- Name: COLUMN result.rid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.result.rid IS '主键，自增';


--
-- Name: COLUMN result."timestamp"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.result."timestamp" IS '时间戳，标记采集的时间（统一）';


--
-- Name: COLUMN result.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.result.id IS '配置文件 ID，方便读取';


--
-- Name: COLUMN result.os; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.result.os IS '标记系统类型';


--
-- Name: COLUMN result.lang; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.result.lang IS '标记系统语言';


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
-- Name: rid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rid OWNER TO postgres;

--
-- Name: rid; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rid OWNED BY public.result.rid;


--
-- Name: SEQUENCE rid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON SEQUENCE public.rid IS 'result 主键自增';


--
-- Name: config cid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config ALTER COLUMN cid SET DEFAULT nextval('public.cid'::regclass);


--
-- Name: result rid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.result ALTER COLUMN rid SET DEFAULT nextval('public.rid'::regclass);


--
-- Data for Name: config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.config (cid, "timestamp", id, os, lang, rule_id, data, type, param) FROM stdin;
122	2022-07-14 00:08:38.965811+08	1	debain10	Chinese	BL999_8949	{masked}	0	{"systemctl is-enabled ctrl-alt-del.target"}
123	2022-07-14 00:08:38.965811+08	1	debain10	Chinese	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	0	{"sysctl fs.protected_symlinks","sysctl fs.protected_hardlinks"}
124	2022-07-14 00:08:38.965811+08	1	debain10	Chinese	BL999_3597	{""}	0	{"if echo $PATH | grep -q \\\\''::\\\\'' ; thenntecho \\\\''Empty Directory in PATH (::)\\\\''n  fin  if echo $PATH | grep -q \\\\'':$\\\\'' ; thenntecho \\\\''Trailing : in PATH\\\\''n  fin  for x in $(echo $PATH | tr \\\\'':\\\\'' \\\\'' \\\\'') ; dontif [ -d \\\\''$x\\\\'' ] ; thennt  ls -ldH \\\\''$x\\\\'' | awk nt  $9 == \\\\''.\\\\'' {print \\\\''PATH contains current working directory (.)\\\\''}nt  $3 != \\\\''root\\\\'' {print $9, \\\\''is not owned by root\\\\''}nt  substr($1,6,1) != \\\\''-\\\\'' {print $9, \\\\''is group writable\\\\''}nt  substr($1,9,1) != \\\\''-\\\\'' {print $9, \\\\''is world writable\\\\''} ntelsent  echo \\\\''$x is not a directory\\\\''ntfin  done"}
125	2022-07-14 00:08:38.965811+08	1	debain10	Chinese	BL999_4000	{""}	0	{"mount | grep -E '\\\\\\\\s/dev/shm\\\\\\\\s' | grep -v nosuid"}
126	2022-07-14 00:08:38.965811+08	1	debain10	Chinese	BL999_6629	{0644,0,0}	1	{"stat /etc/issue"}
127	2022-07-14 00:08:38.965811+08	1	windows10	Chinese	BL696_0086	{1}	0	{"Machine\\\\\\\\System\\\\\\\\CurrentControlSet\\\\\\\\Control\\\\\\\\SCMConfig:EnableSvchostMitigationPolicy"}
128	2022-07-14 00:08:38.965811+08	1	windows10	Chinese	BL696_7921	{1,2}	0	{"Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\PowerShell:EnableScripts","Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\PowerShell:ExecutionPolicy"}
129	2022-07-14 00:08:38.965811+08	1	windows10	Chinese	BL696_0461	{}	0	{"Xbox Live 网络服务"}
130	2022-07-14 00:08:38.965811+08	1	windows10	Chinese	BL696-0711	{1,AllSigned}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\PowerShell:EnableScripts","Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\PowerShell:ExecutionPolicy"}
\.


--
-- Data for Name: result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.result ("timestamp", id, os, server_ip, host_ip, rule_id, expected, actual, status, rid, lang) FROM stdin;
\.


--
-- Name: cid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cid', 130, true);


--
-- Name: rid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rid', 2, true);


--
-- Name: config config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (cid);


--
-- Name: result result_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.result
    ADD CONSTRAINT result_pkey PRIMARY KEY (rid);


--
-- PostgreSQL database dump complete
--

