package com.siemens.osa.data.cs.entity;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ConfigInfo {
    private Timestamp timestamp;
    private Integer id;
    private String os;
    private String ruleId;
    private String data;
    private Integer type;
    private String param;

    public ConfigInfo() {
    }

    public ConfigInfo(Timestamp timestamp, Integer id, String os, String ruleId, String data, Integer type, String param) {
        this.timestamp = timestamp;
        this.id = id;
        this.os = os;
        this.ruleId = ruleId;
        this.data = data;
        this.type = type;
        this.param = param;
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

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
    }

    @Override
    public String toString() {
        return "ConfigInfo{" +
                "timestamp=" + timestamp +
                ", id=" + id +
                ", os='" + os + '\'' +
                ", ruleId='" + ruleId + '\'' +
                ", data=" + data +
                ", type=" + type +
                ", param=" + param +
                '}';
    }
}
