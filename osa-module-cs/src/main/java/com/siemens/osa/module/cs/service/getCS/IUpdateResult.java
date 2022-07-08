package com.siemens.osa.module.cs.service.getCS;

public interface IUpdateResult {
    void updateResult(Integer id, String ruleId, String[] actual, String status);
}
