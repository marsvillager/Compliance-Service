package com.siemens.osa.module.cs.service.getCS.impl;

import com.siemens.osa.data.cs.mapper.ResultInfoMapper;
import com.siemens.osa.module.cs.service.getCS.IUpdateResult;

public class UpdateResultServiceImpl implements IUpdateResult {
    private ResultInfoMapper resultInfoMapper;

    public UpdateResultServiceImpl() {
    }

    public UpdateResultServiceImpl(ResultInfoMapper resultInfoMapper) {
        this.resultInfoMapper = resultInfoMapper;
    }

    @Override
    public void updateResult(Integer id, String ruleId, String[] actual, String status) {
        resultInfoMapper.updateResult(id, ruleId, actual, status);
    }
}
