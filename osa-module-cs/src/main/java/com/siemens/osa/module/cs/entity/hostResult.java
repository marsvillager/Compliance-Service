package com.siemens.osa.module.cs.entity;

public class hostResult {
    private String hostIp;
    private Integer passNum;
    private Integer failedNum;

    public hostResult() {
        passNum = 0;
        failedNum = 0;
    }

    public hostResult(String hostIp, Integer passNum, Integer failedNum) {
        this.hostIp = hostIp;
        this.passNum = passNum;
        this.failedNum = failedNum;
    }

    public String getHostIp() {
        return hostIp;
    }

    public void setHostIp(String hostIp) {
        this.hostIp = hostIp;
    }

    public Integer getPassNum() {
        return passNum;
    }

    public void setPassNum(Integer passNum) {
        this.passNum = passNum;
    }

    public Integer getFailedNum() {
        return failedNum;
    }

    public void setFailedNum(Integer failedNum) {
        this.failedNum = failedNum;
    }

    public void passNumUp() {
        this.passNum++;
    }

    public void failedNumUp() {
        this.failedNum++;
    }

    @Override
    public String toString() {
        return "resultReport{"
                + "hostIp='" + hostIp + '\''
                + ", passNum=" + passNum
                + ", failedNum=" + failedNum
                + '}';
    }
}
