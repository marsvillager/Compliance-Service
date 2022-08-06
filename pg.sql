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
    rid bigint NOT NULL,
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
1	2022-07-14 02:28:42.950032+08	2	debain10	Chinese	BL999_8949	{masked}	0	{"systemctl is-enabled ctrl-alt-del.target"}
2	2022-07-14 02:28:42.950032+08	2	debain10	Chinese	BL999_7387	{"fs.protected_symlinks = 1","fs.protected_hardlinks = 1"}	0	{"sysctl fs.protected_symlinks","sysctl fs.protected_hardlinks"}
3	2022-07-14 02:28:42.950032+08	2	debain10	Chinese	BL999_3597	{""}	0	{"if echo $PATH | grep -q \\\\''::\\\\'' ; thenntecho \\\\''Empty Directory in PATH (::)\\\\''n  fin  if echo $PATH | grep -q \\\\'':$\\\\'' ; thenntecho \\\\''Trailing : in PATH\\\\''n  fin  for x in $(echo $PATH | tr \\\\'':\\\\'' \\\\'' \\\\'') ; dontif [ -d \\\\''$x\\\\'' ] ; thennt  ls -ldH \\\\''$x\\\\'' | awk nt  $9 == \\\\''.\\\\'' {print \\\\''PATH contains current working directory (.)\\\\''}nt  $3 != \\\\''root\\\\'' {print $9, \\\\''is not owned by root\\\\''}nt  substr($1,6,1) != \\\\''-\\\\'' {print $9, \\\\''is group writable\\\\''}nt  substr($1,9,1) != \\\\''-\\\\'' {print $9, \\\\''is world writable\\\\''} ntelsent  echo \\\\''$x is not a directory\\\\''ntfin  done"}
4	2022-07-14 02:28:42.950032+08	2	debain10	Chinese	BL999_4000	{""}	0	{"mount | grep -E '\\\\\\\\s/dev/shm\\\\\\\\s' | grep -v nosuid"}
5	2022-07-14 02:28:42.950032+08	2	debain10	Chinese	BL999_6629	{0644,0,0}	1	{"stat /etc/issue"}
6	2022-07-14 02:28:42.950032+08	2	windows10	Chinese	BL696_0086	{1}	0	{"Machine\\\\\\\\System\\\\\\\\CurrentControlSet\\\\\\\\Control\\\\\\\\SCMConfig:EnableSvchostMitigationPolicy"}
7	2022-07-14 02:28:42.950032+08	2	windows10	Chinese	BL696_7921	{1,2}	0	{"Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\PowerShell:EnableScripts","Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\PowerShell:ExecutionPolicy"}
8	2022-07-14 02:28:42.950032+08	2	windows10	Chinese	BL696_0461	\N	0	{"Xbox Live 网络服务"}
9	2022-07-14 02:28:42.950032+08	2	windows10	Chinese	BL696-0711	{1,AllSigned}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\PowerShell:EnableScripts","Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\PowerShell:ExecutionPolicy"}
10	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696_0461	\N	0	{XboxNetApiSvc}
11	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0946	\N	0	{XblGameSave}
12	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0416	\N	0	{XblAuthManager}
13	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0506	\N	0	{XboxGipSvc}
14	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0521	\N	0	{RasAuto}
15	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0961	\N	0	{MSiSCSI}
16	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0846	\N	0	{LxssManager}
17	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0386	\N	0	{lfsvc}
18	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0056	\N	0	{MapsBroker}
19	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0936	\N	0	{BTAGService}
20	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0636	\N	0	{bthserv}
21	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0951	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\PushNotifications:NoCloudApplicationNotification"}
22	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0926	{2}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\Windows Search:AllowCloudSearch"}
23	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0655	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CloudContent:DisableSoftLanding"}
24	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0303	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\Connect:AllowProjectionToPC"}
25	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0441	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\SecondaryAuthenticationFactor:AllowSecondaryAuthenticationDevice"}
26	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1831	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\FVE:RDVHardwareEncryption"}
27	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1416	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\FVE:OSHardwareEncryption"}
28	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1971	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\FVE:FDVHardwareEncryption"}
29	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1026	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\OneDrive:DisableFileSync"}
30	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0701	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\PassportForWork:Enabled"}
31	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-4537	{2}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender:PUAProtection"}
32	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-4754	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Spynet:LocalSettingOverrideSpynetReporting"}
33	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-3654	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Real-Time Protection:DisableRealtimeMonitoring"}
34	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-4876	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Real-Time Protection:LocalSettingOverrideDisableIOAVProtection"}
35	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-5871	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Signature Updates:UpdateOnStartUp"}
36	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-2053	{0,1,2,3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Signature Updates:ASSignatureDue"}
37	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-2033	{0,1,2,3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Signature Updates:AVSignatureDue"}
38	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-2754	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Signature Updates:DisableUpdateOnStartupWithoutEngine"}
39	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-6483	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Scan:DisablePackedExeScanning"}
40	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-6444	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Scan:DisableHeuristics"}
41	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-6476	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\NIS:DisableProtocolRecognition"}
42	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-5456	{2}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\MpEngine:MpCloudBlockLevel"}
43	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-3987	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Real-Time Protection:DisableScanOnRealtimeEnable"}
44	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-6489	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Real-Time Protection:DisableRawWriteNotification"}
45	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-3934	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Real-Time Protection:DisableOnAccessProtection"}
46	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-3958	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Real-Time Protection:RealtimeScanDirection"}
47	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-2096	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Real-Time Protection:LocalSettingOverrideDisableRealtimeMonitoring"}
48	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-2034	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Real-Time Protection:LocalSettingOverrideDisableBehaviorMonitoring"}
49	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-4653	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Real-Time Protection:LocalSettingOverrideRealtimeScanDirection"}
50	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-4652	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Real-Time Protection:LocalSettingOverrideDisableOnAccessProtection"}
51	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7345	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Remediation:Scan_ScheduleDay"}
52	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-6453	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Spynet:DisableBlockAtFirstSeen"}
53	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0136	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Windows Defender Exploit Guard\\\\\\\\Network Protection:EnableNetworkProtection"}
54	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0616	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Scan:CheckForSignaturesBeforeRunningScan"}
55	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0696	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Signature Updates:SignatureUpdateInterval"}
56	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0531	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Scan:DisableEmailScanning"}
57	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0426	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Scan:DisableRemovableDriveScanning"}
58	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0746	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Scan:DisableArchiveScanning"}
59	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0771	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Real-Time Protection:DisableBehaviorMonitoring"}
60	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0541	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Real-Time Protection:DisableIOAVProtection"}
61	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0076	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender\\\\\\\\Reporting:DisableGenericRePorts"}
62	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0981	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender:DisableAntiSpyware"}
63	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-3689	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender Security Center\\\\\\\\App and Browser protection:DisallowExploitProtectionOverride"}
64	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0486	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows Defender Security Center\\\\\\\\App and Browser protection:DisallowExploitProtectionOverride"}
65	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1421	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\System:EnableSmartScreen"}
66	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7896	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\1:1800"}
67	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7931	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:1607"}
68	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7556	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:1804"}
69	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7966	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:160A"}
70	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7561	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:2708"}
71	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7961	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:2709"}
72	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7266	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:2104"}
73	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7276	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:1800"}
74	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7356	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:1406"}
75	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7776	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1806"}
76	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7016	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1607"}
77	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7701	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1804"}
78	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7971	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:160A"}
79	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7351	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:2708"}
80	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7381	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:2709"}
81	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7951	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:2104"}
82	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7926	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1608"}
83	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7091	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1800"}
84	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7676	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1407"}
85	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7751	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:2300"}
86	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7261	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1406"}
87	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7496	{65536}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:1A00"}
88	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7876	{196608}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1A00"}
89	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7206	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:2500"}
90	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7156	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:2500"}
91	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7006	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:1A04"}
92	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7296	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:1609"}
93	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7986	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1601"}
94	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7316	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1601"}
95	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7916	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1609"}
96	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7271	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings:WarnOnBadCertRecving"}
97	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7196	{2688}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings:SecureProtocols"}
98	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7041	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:1809"}
99	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7151	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1809"}
100	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7161	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Internet Explorer\\\\\\\\Security:DisableSecuritySettingsCheck"}
101	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7461	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Internet Explorer\\\\\\\\PhishingFilter:EnabledV8"}
102	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7541	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Internet Explorer\\\\\\\\Main:DisableFirstRunCustomize"}
103	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7361	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Internet Explorer\\\\\\\\PhishingFilter:EnabledV9"}
104	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7231	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\2:2301"}
105	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7721	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\1:2301"}
106	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7086	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:2301"}
107	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7906	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:2301"}
108	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7346	{yes}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Internet Explorer\\\\\\\\Main:NoReportSiteProblems"}
109	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7596	{yes}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Internet Explorer\\\\\\\\Main:NoReportSiteProblems"}
110	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7871	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Internet Explorer\\\\\\\\Restrictions:NoCrashDetection"}
111	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7126	{2}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Internet Explorer\\\\\\\\Recovery:AutoRecover"}
112	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7191	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Internet Explorer\\\\\\\\SQM:DisableCustomerImprovementProgram"}
113	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7956	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Internet Explorer\\\\\\\\Suggested Sites:Enabled"}
114	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7121	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Internet Explorer:AllowServicePoweredQSA"}
115	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7726	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Internet Explorer\\\\\\\\FlipAhead:Enabled"}
116	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7766	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Internet Explorer\\\\\\\\Activities:NoActivities"}
117	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7426	{no}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Internet Explorer\\\\\\\\Main:Enable Browser Extensions"}
118	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7326	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\2:1409"}
119	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7526	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\1:1409"}
120	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7651	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:1409"}
121	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7616	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:2105"}
122	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7021	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:2103"}
123	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7631	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:2102"}
124	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7576	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:1206"}
125	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7976	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:1407"}
126	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7591	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:140C"}
127	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7806	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1409"}
128	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7731	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1402"}
129	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7571	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:2105"}
130	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7771	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:2103"}
131	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7981	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:2102"}
132	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7051	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1206"}
133	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7831	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1407"}
134	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7816	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:140C"}
135	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7581	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1400"}
136	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7481	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:2200"}
137	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7536	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:2200"}
138	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7586	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1604"}
139	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7146	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1803"}
140	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7641	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\2:120A"}
141	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7306	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\1:120A"}
142	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7501	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\1:1209"}
143	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7036	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:120A"}
144	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7681	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:1209"}
145	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7226	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:120A"}
146	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7566	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1209"}
147	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7301	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:2000"}
148	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7366	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\2:270C"}
149	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7881	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\1:1201"}
150	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7371	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\1:1004"}
151	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7786	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\1:270C"}
152	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7886	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:1201"}
153	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7781	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:1004"}
154	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7216	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:1001"}
155	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7026	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:270C"}
156	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7851	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:2201"}
157	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7066	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:120c"}
158	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7856	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:120b"}
159	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7246	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1405"}
160	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7286	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1200"}
161	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7211	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1201"}
162	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7411	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1004"}
163	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7546	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:1001"}
164	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7186	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:270C"}
165	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7866	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:2201"}
166	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7096	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:120c"}
167	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7801	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:120b"}
168	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7416	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\2:2600"}
169	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7446	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\1:2600"}
170	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7941	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:2600"}
171	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7626	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:2001"}
172	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7331	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\3:2004"}
173	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7761	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:2600"}
174	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7946	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:2001"}
175	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7101	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:2004"}
176	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7911	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:2401"}
177	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7011	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:2402"}
178	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7251	{3}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Internet Settings\\\\\\\\Zones\\\\\\\\4:2400"}
179	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7136	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Internet Explorer\\\\\\\\Feeds:AllowBasicAuthInClear"}
180	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7921	{2,1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\SettingSync:DisableCredentialsSettingSync","Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\SettingSync:DisableCredentialsSettingSyncUserOverride"}
181	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7111	{2,1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\SettingSync:DisableWebBrowserSettingSync","Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\SettingSync:DisableWebBrowserSettingSyncUserOverride"}
182	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0467	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\Appx:BlockNonAdminUserInstall"}
183	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0891	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\Messaging:AllowMessageSync"}
184	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1941	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\WCN\\\\\\\\UI:DisableWcnUi"}
185	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1036	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\WCN\\\\\\\\Registrars:DisableInBand802DOT11Registrar"}
186	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0086	{1}	0	{"Machine\\\\\\\\System\\\\\\\\CurrentControlSet\\\\\\\\Control\\\\\\\\SCMConfig:EnableSvchostMitigationPolicy"}
187	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0611	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\System:DisableLockScreenAppNotifications"}
188	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0181	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\System:EnableActivityFeed"}
189	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0194	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\System:EnableCdp"}
190	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1341	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows NT\\\\\\\\Terminal Services:fAllowUnsolicited"}
191	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1611	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows NT\\\\\\\\Terminal Services:fAllowToGetHelp"}
192	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1576	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CredentialsDelegation:AllowSavedCredentialsWhenNTLMOnly"}
193	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1596	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CredentialsDelegation:AllowSavedCredentials"}
194	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1491	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CredentialsDelegation:AllowSavedCredentials"}
195	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1696	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CredentialsDelegation:AllowFreshCredentialsWhenNTLMOnly"}
196	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1481	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CredentialsDelegation:AllowDefCredentialsWhenNTLMOnly"}
197	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1966	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CredentialsDelegation:AllowDefaultCredentials"}
198	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1526	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CredentialsDelegation:RestrictedRemoteAdministration"}
199	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1266	{1}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CredentialsDelegation:AllowProtectedCreds"}
200	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1821	{1}	0	{"Machine\\\\\\\\System\\\\\\\\CurrentControlSet\\\\\\\\Policies\\\\\\\\EarlyLaunch:DriverLoadPolicy"}
201	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0306	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\DriverInstall\\\\\\\\Restrictions:AllowUserDeviceClasses"}
202	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0081	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\StorageSense:AllowStorageSenseGlobal"}
203	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0141	{0}	0	{"Machine\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\System:AllowCrossDeviceClipboard"}
204	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1896	{1}	0	{"User\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CloudContent:DisableWindowsSpotlightOnSettings"}
205	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1251	{1}	0	{"User\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CloudContent:DisableWindowsSpotlightOnActionCenter"}
206	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1706	{1}	0	{"User\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CloudContent:DisableWindowsSpotlightWindowsWelcomeExperience"}
207	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1156	{1}	0	{"User\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CloudContent:DisableWindowsSpotlightFeatures"}
208	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1546	{1}	0	{"User\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CloudContent:DisableTailoredExperiencesWithDiagnosticData"}
209	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1711	{1}	0	{"User\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CloudContent:DisableThirdPartySuggestions"}
210	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-1066	{2}	0	{"User\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CloudContent:ConfigureWindowsSpotlight"}
211	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-0819	{1}	0	{"User\\\\\\\\Software\\\\\\\\Microsoft\\\\\\\\Windows\\\\\\\\CurrentVersion\\\\\\\\Policies\\\\\\\\Explorer:NoRecycleFiles"}
212	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7636	{1}	0	{"User\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\IEAK:NoAutomaticSignup"}
213	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7471	{no}	0	{"User\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Internet Explorer\\\\\\\\Main:FormSuggest Passwords"}
214	2022-08-05 14:28:00.314899+08	2	windows10	Chinese	BL696-7596	{1}	0	{"User\\\\\\\\Software\\\\\\\\Policies\\\\\\\\Microsoft\\\\\\\\Internet Explorer\\\\\\\\Restrictions:NoHelpItemSendFeedback"}
\.


--
-- Data for Name: result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.result (rid, "timestamp", id, os, lang, server_ip, host_ip, rule_id, expected, actual, status) FROM stdin;
1	2022-07-14 02:29:05.206+08	2	windows10	Chinese	172.23.192.1	192.168.199.185	BL696-0711	{1,AllSigned}	\N	failed
2	2022-07-14 02:29:05.206+08	2	windows10	Chinese	172.23.192.1	192.168.199.185	BL696_7921	{1,2}	\N	failed
3	2022-07-14 02:29:05.206+08	2	windows10	Chinese	172.23.192.1	192.168.199.185	BL696-0711	{1,AllSigned}	{1,AllSigned}	pass
4	2022-07-14 02:29:05.206+08	2	windows10	Chinese	172.23.192.1	192.168.199.185	BL696_0461	\N	{1}	failed
5	2022-07-14 02:29:05.206+08	2	windows10	Chinese	172.23.192.1	192.168.199.185	BL696_0461	\N	\N	pass
6	2022-07-14 02:29:05.206+08	2	windows10	Chinese	172.23.192.1	192.168.199.185	BL696_0086	{1}	\N	failed
7	2022-07-14 02:29:05.206+08	2	windows10	Chinese	172.23.192.1	192.168.199.185	BL696-0711	{1,AllSigned}	\N	failed
8	2022-07-14 02:29:05.206+08	2	windows10	Chinese	172.23.192.1	192.168.199.185	BL696_0086	{1}	\N	failed
9	2022-07-14 02:29:05.206+08	2	windows10	Chinese	172.23.192.1	192.168.199.185	BL696_7921	{1,2}	\N	failed
10	2022-07-14 02:29:05.206+08	2	windows10	Chinese	172.23.192.1	192.168.199.185	BL696_0086	{1}	\N	failed
11	2022-07-14 02:29:05.206+08	2	windows10	Chinese	172.23.192.1	192.168.199.185	BL696_7921	{1,2}	\N	failed
12	2022-07-14 02:29:05.206+08	2	windows10	Chinese	172.23.192.1	192.168.199.185	BL696_0461	\N	{1}	failed
\.


--
-- Name: cid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cid', 214, true);


--
-- Name: rid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rid', 12, true);


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

