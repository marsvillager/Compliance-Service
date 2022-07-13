package com.siemens.osa.data.es.entity;

import java.util.List;

public class ESInfo {

    private Integer id;

    private String collectTime;

    private List<String> result;

    private String hostIp;

    private String ruleId;

    public ESInfo() {
    }

    public ESInfo(Integer id, String collectTime, List<String> result, String hostIp, String ruleId) {
        this.id = id;
        this.collectTime = collectTime;
        this.result = result;
        this.hostIp = hostIp;
        this.ruleId = ruleId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCollectTime() {
        return collectTime;
    }

    public void setCollectTime(String collectTime) {
        this.collectTime = collectTime;
    }

    public List<String> getResult() {
        return result;
    }

    public void setResult(List<String> result) {
        this.result = result;
    }

    public String getHostIp() {
        return hostIp;
    }

    public void setHostIp(String hostIp) {
        this.hostIp = hostIp;
    }

    public String getRuleId() {
        return ruleId;
    }

    public void setRuleId(String ruleId) {
        this.ruleId = ruleId;
    }

    @Override
    public String toString() {
        return "ESInfo{" + "id=" + id + ", collectTime='" + collectTime + '\'' + ", result=" + result + ", hostIp='"
                + hostIp + '\'' + ", ruleId='" + ruleId + '\'' + '}';
    }

}
