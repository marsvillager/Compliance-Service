package com.siemens.osa.data.cs.entity;

import lombok.Data;

import java.sql.Timestamp;
import java.util.List;

@Data
public class ConfigInfo {
    private Timestamp timestamp;
    private Integer id;
    private String os;
    private String rule_id;
    private List<String> data;
    private Integer type;
    private List<String> param;

    public ConfigInfo() {
    }

    public ConfigInfo(Timestamp timestamp, Integer id, String os, String ruleId, List<String> data, Integer type, List<String> param) {
        this.timestamp = timestamp;
        this.id = id;
        this.os = os;
        this.rule_id = ruleId;
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
        return rule_id;
    }

    public void setRuleId(String ruleId) {
        this.rule_id = ruleId;
    }

    public List<String> getData() {
        return data;
    }

    public void setData(List<String> data) {
        this.data = data;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public List<String> getParam() {
        return param;
    }

    public void setParam(List<String> param) {
        this.param = param;
    }

    @Override
    public String toString() {
        return "ConfigInfo{" +
                "timestamp=" + timestamp +
                ", id=" + id +
                ", os='" + os + '\'' +
                ", ruleId='" + rule_id + '\'' +
                ", data=" + data +
                ", type=" + type +
                ", param=" + param +
                '}';
    }
}
