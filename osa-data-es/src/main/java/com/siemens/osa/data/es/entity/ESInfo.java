package com.siemens.osa.data.es.entity;

import java.util.List;

public class ESInfo {

    private String ID;

    private String collectTime;

    private List<String> result;

    private String hostIp;

    private String ruleID;

    public ESInfo() {
    }

    public ESInfo(String ID, String collectTime, List<String> result, String hostIp, String ruleID) {
        this.ID = ID;
        this.collectTime = collectTime;
        this.result = result;
        this.hostIp = hostIp;
        this.ruleID = ruleID;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
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

    public String getRuleID() {
        return ruleID;
    }

    public void setRuleID(String ruleID) {
        this.ruleID = ruleID;
    }

    @Override
    public String toString() {
        return "ESInfo{" + "ID=" + ID + ", collectTime='" + collectTime + '\'' + ", result=" + result + ", hostIp='"
                + hostIp + '\'' + ", ruleID='" + ruleID + '\'' + '}';
    }

}
