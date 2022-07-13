--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

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
2022-07-09 17:36:45.266602+08	2	debain10	BL999_3597	{""}	0	{"if echo $PATH | grep -q \\"::\\" ; thenntecho \\"Empty Directory in PATH (::)\\"n  fin  if echo $PATH | grep -q \\":$\\" ; thenntecho \\"Trailing : in PATH\\"n  fin  for x in $(echo $PATH | tr \\":\\" \\" \\") ; dontif [ -d \\"$x\\" ] ; thennt  ls -ldH \\"$x\\" | awk nt  $9 == \\".\\" {print \\"PATH contains current working directory (.)\\"}nt  $3 != \\"root\\" {print $9, \\"is not owned by root\\"}nt  substr($1,6,1) != \\"-\\" {print $9, \\"is group writable\\"}nt  substr($1,9,1) != \\"-\\" {print $9, \\"is world writable\\"} ntelsent  echo \\"$x is not a directory\\"ntfin  done"}
2022-07-09 17:46:15.150747+08	2	debain10	BL999_4000	{""}	0	{"mount | grep -E '\\\\s/dev/shm\\\\s' | grep -v nosuid"}
2022-07-05 17:57:31.251354+08	2	debain10	BL999_6629	{0644,0,0}	1	{"stat /etc/issue"}
2022-07-05 17:59:50.169855+08	2	windows10	BL696_7921	{1,2}	0	{"Software\\\\Policies\\\\Microsoft\\\\Windows\\\\PowerShell:EnableScripts","Software\\\\Policies\\\\Microsoft\\\\Windows\\\\PowerShell:ExecutionPolicy"}
2022-07-05 17:40:27.19112+08	2	windows10	BL696_0461	\N	0	{"Xbox Live 网络服务"}
2022-07-12 16:08:00.816858+08	2	windows10	BL696-0711	{1,AllSigned}	0	{"Machine\\\\Software\\\\Policies\\\\Microsoft\\\\Windows\\\\PowerShell:EnableScripts","Machine\\\\Software\\\\Policies\\\\Microsoft\\\\Windows\\\\PowerShell:ExecutionPolicy"}
\.


--
-- Data for Name: result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.result ("timestamp", id, os, server_ip, host_ip, rule_id, expected, actual, status) FROM stdin;
2022-07-12 17:09:47.891+08	2	windows10	172.22.144.1	192.168.1.232	BL696_7921	{1,2}	\N	failed
2022-07-12 17:09:47.923+08	2	windows10	172.22.144.1	192.168.1.232	BL696-0711	{1,AllSigned}	{1,AllSigned}	pass
2022-07-12 17:09:47.947+08	2	debain10	172.22.144.1	192.168.1.215	BL999_8949	{masked}	{masked}	pass
2022-07-12 17:09:48.007+08	2	debain10	172.22.144.1	192.168.1.215	BL999_8949	{masked}	{masked}	pass
2022-07-12 17:09:48.016+08	2	debain10	172.22.144.1	192.168.1.215	BL999_8949	{masked}	{masked}	pass
2022-07-12 17:09:48.029+08	2	debain10	172.22.144.1	192.168.1.215	BL999_8949	{masked}	{masked}	pass
2022-07-12 17:09:48.036+08	2	debain10	172.22.144.1	192.168.1.215	BL999_4000	{}	{}	pass
2022-07-12 17:09:48.064+08	2	debain10	172.22.144.1	192.168.1.215	BL999_4000	{}	{}	pass
2022-07-12 17:09:48.1+08	2	windows10	172.22.144.1	192.168.1.232	BL696-0711	{1,AllSigned}	{1,AllSigned}	pass
2022-07-12 17:09:48.118+08	2	debain10	172.22.144.1	192.168.1.215	BL999_4000	{}	{}	pass
2022-07-12 17:09:48.129+08	2	debain10	172.22.144.1	192.168.1.215	BL999_4000	{}	{}	pass
2022-07-12 17:09:48.137+08	2	windows10	172.22.144.1	192.168.1.232	BL696_0461	\N	\N	pass
2022-07-12 17:09:48.159+08	2	debain10	172.22.144.1	192.168.1.215	BL999_3597	{}	{}	pass
2022-07-12 17:09:48.172+08	2	debain10	172.22.144.1	192.168.1.215	BL999_8949	{masked}	{masked}	pass
2022-07-12 17:09:48.178+08	2	debain10	172.22.144.1	192.168.1.215	BL999_8949	{masked}	{masked}	pass
2022-07-12 17:09:48.189+08	2	debain10	172.22.144.1	192.168.1.215	BL999_3597	{}	{}	pass
2022-07-12 17:09:48.201+08	2	debain10	172.22.144.1	192.168.1.215	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-","文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-12 17:09:48.237+08	2	debain10	172.22.144.1	192.168.1.215	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-12 17:09:48.256+08	2	debain10	172.22.144.1	192.168.1.215	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-","文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-12 17:09:48.272+08	2	debain10	172.22.144.1	192.168.1.215	BL999_4000	{}	{}	pass
2022-07-12 17:09:48.278+08	2	debain10	172.22.144.1	192.168.1.215	BL999_8949	{masked}	{masked}	pass
2022-07-12 17:09:48.288+08	2	debain10	172.22.144.1	192.168.1.215	BL999_8949	{masked}	{masked}	pass
2022-07-12 17:09:48.298+08	2	debain10	172.22.144.1	192.168.1.215	BL999_4000	{}	{}	pass
2022-07-12 17:09:48.315+08	2	debain10	172.22.144.1	192.168.1.215	BL999_4000	{}	{}	pass
2022-07-12 17:09:48.328+08	2	debain10	172.22.144.1	192.168.1.215	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-","文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-12 17:09:48.34+08	2	debain10	172.22.144.1	192.168.1.215	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-","文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-12 17:09:48.353+08	2	debain10	172.22.144.1	192.168.1.215	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-12 17:09:48.363+08	2	debain10	172.22.144.1	192.168.1.215	BL999_4000	{}	{}	pass
2022-07-12 17:09:48.375+08	2	debain10	172.22.144.1	192.168.1.215	BL999_8949	{masked}	{masked}	pass
2022-07-12 17:09:48.381+08	2	debain10	172.22.144.1	192.168.1.215	BL999_3597	{}	{}	pass
2022-07-12 17:09:48.388+08	2	debain10	172.22.144.1	192.168.1.215	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-12 17:09:48.407+08	2	debain10	172.22.144.1	192.168.1.215	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-12 17:09:48.418+08	2	debain10	172.22.144.1	192.168.1.215	BL999_3597	{}	{}	pass
2022-07-12 17:09:48.428+08	2	debain10	172.22.144.1	192.168.1.215	BL999_4000	{}	{}	pass
2022-07-12 17:09:48.436+08	2	windows10	172.22.144.1	192.168.1.232	BL696_7921	{1,2}	\N	failed
2022-07-12 17:09:48.474+08	2	windows10	172.22.144.1	192.168.1.232	BL696_0461	\N	\N	pass
2022-07-12 17:09:48.485+08	2	windows10	172.22.144.1	192.168.1.232	BL696_0086	{1}	\N	failed
2022-07-12 17:09:48.498+08	2	debain10	172.22.144.1	192.168.1.215	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-","文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-12 17:09:48.508+08	2	debain10	172.22.144.1	192.168.1.215	BL999_8949	{masked}	{masked}	pass
2022-07-12 17:09:48.526+08	2	debain10	172.22.144.1	192.168.1.215	BL999_3597	{}	{}	pass
2022-07-12 17:09:48.532+08	2	debain10	172.22.144.1	192.168.1.215	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-","文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-12 17:09:48.537+08	2	debain10	172.22.144.1	192.168.1.215	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-","文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-12 17:09:48.545+08	2	debain10	172.22.144.1	192.168.1.215	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-12 17:09:48.561+08	2	debain10	172.22.144.1	192.168.1.215	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-","文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-12 17:09:48.581+08	2	debain10	172.22.144.1	192.168.1.215	BL999_3597	{}	{}	pass
2022-07-12 17:09:48.591+08	2	debain10	172.22.144.1	192.168.1.215	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-","文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-12 17:09:48.604+08	2	debain10	172.22.144.1	192.168.1.215	BL999_8949	{masked}	{masked}	pass
2022-07-12 17:09:48.625+08	2	debain10	172.22.144.1	192.168.1.215	BL999_8949	{masked}	{masked}	pass
2022-07-12 17:09:48.634+08	2	debain10	172.22.144.1	192.168.1.215	BL999_8949	{masked}	{masked}	pass
2022-07-12 17:09:48.64+08	2	debain10	172.22.144.1	192.168.1.215	BL999_3597	{}	{}	pass
2022-07-12 17:09:48.648+08	2	windows10	172.22.144.1	192.168.1.232	BL696_7921	{1,2}	\N	failed
2022-07-12 17:09:48.683+08	2	windows10	172.22.144.1	192.168.1.232	BL696_0086	{1}	\N	failed
2022-07-12 17:09:48.693+08	2	windows10	172.22.144.1	192.168.1.232	BL696_0086	{1}	\N	failed
2022-07-12 17:09:48.713+08	2	debain10	172.22.144.1	192.168.1.215	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-12 17:09:48.728+08	2	debain10	172.22.144.1	192.168.1.215	BL999_4000	{}	{}	pass
2022-07-12 17:09:48.745+08	2	debain10	172.22.144.1	192.168.1.215	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-12 17:09:48.766+08	2	debain10	172.22.144.1	192.168.1.215	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-","文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-12 17:09:48.782+08	2	debain10	172.22.144.1	192.168.1.215	BL999_4000	{}	{}	pass
2022-07-12 17:09:48.788+08	2	debain10	172.22.144.1	192.168.1.215	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-","文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-12 17:09:48.794+08	2	debain10	172.22.144.1	192.168.1.215	BL999_4000	{}	{}	pass
2022-07-12 17:09:48.802+08	2	debain10	172.22.144.1	192.168.1.215	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-12 17:09:48.814+08	2	debain10	172.22.144.1	192.168.1.215	BL999_4000	{}	{}	pass
2022-07-12 17:09:48.834+08	2	debain10	172.22.144.1	192.168.1.215	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-","文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-12 17:09:48.845+08	2	debain10	172.22.144.1	192.168.1.215	BL999_3597	{}	{}	pass
2022-07-12 17:09:48.853+08	2	debain10	172.22.144.1	192.168.1.215	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-12 17:09:48.883+08	2	debain10	172.22.144.1	192.168.1.215	BL999_8949	{masked}	{masked}	pass
2022-07-12 17:09:48.889+08	2	debain10	172.22.144.1	192.168.1.215	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-","文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-12 17:09:48.898+08	2	debain10	172.22.144.1	192.168.1.215	BL999_4000	{}	{}	pass
2022-07-12 17:09:48.906+08	2	debain10	172.22.144.1	192.168.1.215	BL999_8949	{masked}	{masked}	pass
2022-07-12 17:09:48.912+08	2	debain10	172.22.144.1	192.168.1.215	BL999_8949	{masked}	{masked}	pass
2022-07-12 17:09:48.933+08	2	debain10	172.22.144.1	192.168.1.215	BL999_4000	{}	{}	pass
2022-07-12 17:09:48.939+08	2	debain10	172.22.144.1	192.168.1.215	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-12 17:09:48.947+08	2	debain10	172.22.144.1	192.168.1.215	BL999_3597	{}	{}	pass
2022-07-12 17:09:48.954+08	2	debain10	172.22.144.1	192.168.1.215	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-12 17:09:48.983+08	2	debain10	172.22.144.1	192.168.1.215	BL999_4000	{}	{}	pass
2022-07-12 17:09:48.988+08	2	debain10	172.22.144.1	192.168.1.215	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-12 17:09:48.994+08	2	debain10	172.22.144.1	192.168.1.215	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-","文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-12 17:09:48.999+08	2	debain10	172.22.144.1	192.168.1.215	BL999_8949	{masked}	{masked}	pass
2022-07-12 17:09:49.005+08	2	debain10	172.22.144.1	192.168.1.215	BL999_4000	{}	{}	pass
2022-07-12 17:09:49.013+08	2	debain10	172.22.144.1	192.168.1.215	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-","文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-12 17:09:49.021+08	2	debain10	172.22.144.1	192.168.1.215	BL999_8949	{masked}	{masked}	pass
2022-07-12 17:09:49.038+08	2	debain10	172.22.144.1	192.168.1.215	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-12 17:09:49.045+08	2	debain10	172.22.144.1	192.168.1.215	BL999_3597	{}	{}	pass
2022-07-12 17:09:49.054+08	2	debain10	172.22.144.1	192.168.1.215	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-","文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-12 17:09:49.074+08	2	debain10	172.22.144.1	192.168.1.215	BL999_3597	{}	{}	pass
2022-07-12 17:09:49.093+08	2	debain10	172.22.144.1	192.168.1.215	BL999_8949	{masked}	{masked}	pass
2022-07-12 17:09:49.098+08	2	debain10	172.22.144.1	192.168.1.215	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-","文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-12 17:09:49.108+08	2	debain10	172.22.144.1	192.168.1.215	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-","文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-12 17:09:49.122+08	2	debain10	172.22.144.1	192.168.1.215	BL999_4000	{}	{}	pass
2022-07-12 17:09:49.132+08	2	debain10	172.22.144.1	192.168.1.215	BL999_3597	{}	{}	pass
2022-07-12 17:09:49.139+08	2	debain10	172.22.144.1	192.168.1.215	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-12 17:09:49.145+08	2	debain10	172.22.144.1	192.168.1.215	BL999_3597	{}	{}	pass
2022-07-12 17:09:49.152+08	2	debain10	172.22.144.1	192.168.1.215	BL999_3597	{}	{}	pass
2022-07-12 17:09:49.199+08	2	debain10	172.22.144.1	192.168.1.215	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-12 17:09:49.205+08	2	debain10	172.22.144.1	192.168.1.215	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-12 17:09:49.218+08	2	windows10	172.22.144.1	192.168.1.232	BL696-0711	{1,AllSigned}	{1,AllSigned}	pass
2022-07-12 17:09:49.239+08	2	debain10	172.22.144.1	192.168.1.215	BL999_3597	{}	{}	pass
2022-07-12 17:09:49.246+08	2	debain10	172.22.144.1	192.168.1.215	BL999_3597	{}	{}	pass
2022-07-12 17:09:49.251+08	2	debain10	172.22.144.1	192.168.1.215	BL999_3597	{}	{}	pass
2022-07-12 17:09:49.304+08	2	debain10	172.22.144.1	192.168.1.215	BL999_3597	{}	{}	pass
2022-07-12 17:09:49.314+08	2	windows10	172.22.144.1	192.168.1.232	BL696_0461	\N	\N	pass
2022-07-12 17:09:49.321+08	2	debain10	172.22.144.1	192.168.1.215	BL999_4000	{}	{}	pass
2022-07-12 17:09:49.337+08	2	debain10	172.22.144.1	192.168.1.215	BL999_6629	{0644,0,0}	{"文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-","文件：/etc/issue\n  大小：26        \t块：8          IO 块：4096   普通文件\n设备：801h/2049d\tInode：1835167     硬链接：1\n权限：(0644/-rw-r--r--)  Uid：(    0/    root)   Gid：(    0/    root)\n最近访问：2022-06-07 15:42:41.679758708 +0800\n最近更改：2021-09-06 18:47:40.000000000 +0800\n最近改动：2022-03-25 16:45:08.889985481 +0800\n创建时间：-"}	pass
2022-07-12 17:09:49.345+08	2	debain10	172.22.144.1	192.168.1.215	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-12 17:09:49.351+08	2	debain10	172.22.144.1	192.168.1.215	BL999_3597	{}	{}	pass
2022-07-12 17:09:49.365+08	2	debain10	172.22.144.1	192.168.1.215	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
2022-07-12 17:09:49.384+08	2	debain10	172.22.144.1	192.168.1.215	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	pass
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

