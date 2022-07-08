package com.siemens.osa.data.cs.entity;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ResultInfo {
    private Timestamp timestamp;
    private Integer id;
    private String os;
    private String rule_id;
    private String server_ip;
    private String host_ip;
    private String expected;
    private String actual;
    private String status;

    public ResultInfo() {
    }

    public ResultInfo(Timestamp timestamp, Integer id, String os, String ruleId, String serverIp, String hostIp, String expected, String actual, String status) {
        this.timestamp = timestamp;
        this.id = id;
        this.os = os;
        this.rule_id = ruleId;
        this.server_ip = serverIp;
        this.host_ip = hostIp;
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
        return rule_id;
    }

    public void setRuleId(String ruleId) {
        this.rule_id = ruleId;
    }

    public String getServerIp() {
        return server_ip;
    }

    public void setServerIp(String serverIp) {
        this.server_ip = serverIp;
    }

    public String getHostIp() {
        return host_ip;
    }

    public void setHostIp(String hostIp) {
        this.host_ip = hostIp;
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
                ", ruleId='" + rule_id + '\'' +
                ", serverIp='" + server_ip + '\'' +
                ", hostIp='" + host_ip + '\'' +
                ", expected='" + expected + '\'' +
                ", actual='" + actual + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
