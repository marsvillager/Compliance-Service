package com.siemens.osa.data.cs.entity;

import lombok.Data;

import java.sql.Timestamp;
import java.util.Arrays;

@Data
public class ResultInfo {
    private long cid;
    private Timestamp timestamp;
    private Integer id;
    private String os;
    private String lang;
    private String rule_id;
    private String server_ip;
    private String host_ip;
    private String[] expected;
    private String[] actual;
    private String status;

    public ResultInfo() {
    }

    public ResultInfo(long cid, Timestamp timestamp, Integer id, String os, String lang, String rule_id,
                      String server_ip, String host_ip, String[] expected, String[] actual, String status) {
        this.cid = cid;
        this.timestamp = timestamp;
        this.id = id;
        this.os = os;
        this.lang = lang;
        this.rule_id = rule_id;
        this.server_ip = server_ip;
        this.host_ip = host_ip;
        this.expected = expected;
        this.actual = actual;
        this.status = status;
    }

    public long getCid() {
        return cid;
    }

    public void setCid(long cid) {
        this.cid = cid;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOs() {
        return os;
    }

    public void setOs(String os) {
        this.os = os;
    }

    public String getLang() {
        return lang;
    }

    public void setLang(String lang) {
        this.lang = lang;
    }

    public String getRule_id() {
        return rule_id;
    }

    public void setRule_id(String rule_id) {
        this.rule_id = rule_id;
    }

    public String getServer_ip() {
        return server_ip;
    }

    public void setServer_ip(String server_ip) {
        this.server_ip = server_ip;
    }

    public String getHost_ip() {
        return host_ip;
    }

    public void setHost_ip(String host_ip) {
        this.host_ip = host_ip;
    }

    public String[] getExpected() {
        return expected;
    }

    public void setExpected(String[] expected) {
        this.expected = expected;
    }

    public String[] getActual() {
        return actual;
    }

    public void setActual(String[] actual) {
        this.actual = actual;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ResultInfo{"
                + "cid=" + cid
                + ", timestamp=" + timestamp
                + ", id=" + id
                + ", os='" + os + '\''
                + ", lang='" + lang + '\''
                + ", rule_id='" + rule_id + '\''
                + ", server_ip='" + server_ip + '\''
                + ", host_ip='" + host_ip + '\''
                + ", expected=" + Arrays.toString(expected)
                + ", actual=" + Arrays.toString(actual)
                + ", status='" + status + '\'' + '}';
    }
}
