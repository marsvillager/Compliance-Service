package com.siemens.osa.data.cs.entity;

import lombok.Data;

import java.sql.Timestamp;
import java.util.Arrays;

@Data
public class ConfigInfo {
    private long cid;
    private Timestamp timestamp;
    private Integer id;
    private String os;
    private String lang;
    private String ruleId;
    private String[] data;
    private Integer type;
    private String[] param;

    public ConfigInfo() {
    }

    public ConfigInfo(long cid, Timestamp timestamp, Integer id, String os, String lang, String ruleId, String[] data,
                      Integer type, String[] param) {
        this.cid = cid;
        this.timestamp = timestamp;
        this.id = id;
        this.os = os;
        this.lang = lang;
        this.ruleId = ruleId;
        this.data = data;
        this.type = type;
        this.param = param;
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

    public String[] getData() {
        return data;
    }

    public void setData(String[] data) {
        this.data = data;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String[] getParam() {
        return param;
    }

    public void setParam(String[] param) {
        this.param = param;
    }

    @Override
    public String toString() {
        return "ConfigInfo{"
                + "cid=" + cid
                + ", timestamp=" + timestamp
                + ", id=" + id
                + ", os='" + os + '\''
                + ", lang='" + lang + '\''
                + ", rule_id='" + ruleId + '\''
                + ", data=" + Arrays.toString(data)
                + ", type=" + type
                + ", param=" + Arrays.toString(param) + '}';
    }
}
