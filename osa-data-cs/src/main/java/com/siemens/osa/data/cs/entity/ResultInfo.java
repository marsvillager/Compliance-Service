package com.siemens.osa.data.cs.entity;

import java.sql.Timestamp;

public class ResultInfo {
    private Timestamp timestamp;
    private Integer id;
    private String os;
    private String ruleId;
    private String serverIp;
    private String hostIp;
    private String expected;
    private String actual;
    private String status;

    public ResultInfo(Timestamp timestamp, Integer id, String os, String ruleId, String serverIp, String hostIp, String expected, String actual, String status) {
        this.timestamp = timestamp;
        this.id = id;
        this.os = os;
        this.ruleId = ruleId;
        this.serverIp = serverIp;
        this.hostIp = hostIp;
        this.expected = expected;
        this.actual = actual;
        this.status = status;
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

    public String getExpected() {
        return expected;
    }

    public void setExpected(String expected) {
        this.expected = expected;
    }

    public String getActual() {
        return actual;
    }

    public void setActual(String actual) {
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
        return "ResultInfo{" +
                "timestamp=" + timestamp +
                ", id=" + id +
                ", os='" + os + '\'' +
                ", ruleId='" + ruleId + '\'' +
                ", serverIp='" + serverIp + '\'' +
                ", hostIp='" + hostIp + '\'' +
                ", expected='" + expected + '\'' +
                ", actual='" + actual + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
