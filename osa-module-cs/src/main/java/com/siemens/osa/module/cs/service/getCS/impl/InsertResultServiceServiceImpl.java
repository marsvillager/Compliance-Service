package com.siemens.osa.module.cs.service.getCS.impl;

import com.siemens.osa.data.cs.mapper.ResultInfoMapper;
import com.siemens.osa.module.cs.service.getCS.IInsertResultService;

import java.sql.Timestamp;

public class InsertResultServiceServiceImpl implements IInsertResultService {
    private ResultInfoMapper resultInfoMapper;

    public InsertResultServiceServiceImpl() {
    }

    public InsertResultServiceServiceImpl(ResultInfoMapper resultInfoMapper) {
        this.resultInfoMapper = resultInfoMapper;
    }

//    @Override
//    public void insertResult(Timestamp timestamp, Integer id, String os, String server_ip, String host_ip, String rule_id, String expected, String actual, String status) {
//        resultInfoMapper.addResult(timestamp, id, os, server_ip, host_ip, rule_id, expected, actual, status);
//    }
}
