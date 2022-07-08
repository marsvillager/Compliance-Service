package com.siemens.osa.module.cs.service.getCS.impl;

import com.siemens.osa.data.cs.mapper.ResultInfoMapper;
import com.siemens.osa.module.cs.service.getCS.IUpdateResultService;

public class UpdateResultServiceServiceImpl implements IUpdateResultService {
    private ResultInfoMapper resultInfoMapper;

    public UpdateResultServiceServiceImpl() {
    }

    public UpdateResultServiceServiceImpl(ResultInfoMapper resultInfoMapper) {
        this.resultInfoMapper = resultInfoMapper;
    }

    @Override
    public void updateResult(Integer id, String ruleId, String[] actual, String status) {
        resultInfoMapper.updateResult(id, ruleId, actual, status);
    }
}
