package com.siemens.osa.module.cs.entity;

import java.sql.Timestamp;
import java.util.List;

public class resultReport {
    private Timestamp collectTime;
    private Integer failedHostNum;
    private Integer passHostNum;
    private List<hostResult> failedHost;
    private List<hostResult> passHost;

    public resultReport() {
        failedHostNum = 0;
        passHostNum = 0;
    }

    public resultReport(Timestamp collectTime, Integer failedHostNum, Integer passHostNum, List<hostResult> failedHost, List<hostResult> passHost) {
        this.collectTime = collectTime;
        this.failedHostNum = failedHostNum;
        this.passHostNum = passHostNum;
        this.failedHost = failedHost;
        this.passHost = passHost;
    }

    public Timestamp getCollectTime() {
        return collectTime;
    }

    public void setCollectTime(Timestamp collectTime) {
        this.collectTime = collectTime;
    }

    public Integer getFailedHostNum() {
        return failedHostNum;
    }

    public void setFailedHostNum(Integer failedHostNum) {
        this.failedHostNum = failedHostNum;
    }

    public Integer getPassHostNum() {
        return passHostNum;
    }

    public void setPassHostNum(Integer passHostNum) {
        this.passHostNum = passHostNum;
    }

    public List<hostResult> getFailedHost() {
        return failedHost;
    }

    public void setFailedHost(List<hostResult> failedHost) {
        this.failedHost = failedHost;
    }

    public List<hostResult> getPassHost() {
        return passHost;
    }

    public void setPassHost(List<hostResult> passHost) {
        this.passHost = passHost;
    }

    public void failedHostNumUp() {
        this.failedHostNum++;
    }

    public void passHostNumUp() {
        this.passHostNum++;
    }

    @Override
    public String toString() {
        return "resultReport{"
                + "collectTime=" + collectTime
                + ", failedHostNum=" + failedHostNum
                + ", passHostNum=" + passHostNum
                + ", failedHost=" + failedHost
                + ", passHost=" + passHost
                + '}';
    }
}
