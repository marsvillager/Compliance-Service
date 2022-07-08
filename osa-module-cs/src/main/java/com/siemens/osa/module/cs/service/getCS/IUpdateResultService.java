package com.siemens.osa.module.cs.service.getCS;

public interface IUpdateResultService {
    void updateResult(Integer id, String ruleId, String[] actual, String status);
}
