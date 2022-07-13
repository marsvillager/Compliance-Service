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
    private String ruleId;
    private String serverIp;
    private String hostIp;
    private String[] expected;
    private String[] actual;
    private String status;

    public ResultInfo() {
    }

    public ResultInfo(long cid, Timestamp timestamp, Integer id, String os, String lang, String ruleId,
                      String serverIp, String hostIp, String[] expected, String[] actual, String status) {
        this.cid = cid;
        this.timestamp = timestamp;
        this.id = id;
        this.os = os;
        this.lang = lang;
        this.ruleId = ruleId;
        this.serverIp = serverIp;
        this.hostIp = hostIp;
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

    public String getRuleId() {
        return ruleId;
    }

    public void setRuleId(String ruleId) {
        this.ruleId = ruleId;
    }

    public String getServerIp() {
        return serverIp;
    }

    public void setServerIp(String serverIp) {
        this.serverIp = serverIp;
    }

    public String getHostIp() {
        return hostIp;
    }

    public void setHostIp(String hostIp) {
        this.hostIp = hostIp;
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
                + ", rule_id='" + ruleId + '\''
                + ", server_ip='" + serverIp + '\''
                + ", host_ip='" + hostIp + '\''
                + ", expected=" + Arrays.toString(expected)
                + ", actual=" + Arrays.toString(actual)
                + ", status='" + status + '\'' + '}';
    }
}
