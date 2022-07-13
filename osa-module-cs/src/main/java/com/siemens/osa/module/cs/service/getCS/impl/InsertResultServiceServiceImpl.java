package com.siemens.osa.module.cs.service.getCS.impl;

import com.siemens.osa.data.cs.mapper.ResultInfoMapper;
import com.siemens.osa.module.cs.service.getCS.IInsertResultService;

import java.sql.Timestamp;
import java.util.List;

public class InsertResultServiceServiceImpl implements IInsertResultService {
    private ResultInfoMapper resultInfoMapper;

    public InsertResultServiceServiceImpl() {
    }

    public InsertResultServiceServiceImpl(ResultInfoMapper resultInfoMapper) {
        this.resultInfoMapper = resultInfoMapper;
    }

    @Override
    public void insertResult(Timestamp timestamp, Integer id, String os, String lang, String server_ip, String host_ip,
                             String rule_id, List<String> expected, List<String> actual, String status) {
        resultInfoMapper.addResult(timestamp, id, os, lang, server_ip, host_ip, rule_id, expected, actual, status);
    }

    @Override
    public void insertResult0(Timestamp timestamp, Integer id, String os, String lang, String server_ip, String host_ip,
                              String rule_id, String status) {
        resultInfoMapper.addResult0(timestamp, id, os, lang, server_ip, host_ip, rule_id, status);
    }

    @Override
    public void insertResult1(Timestamp timestamp, Integer id, String os, String lang, String server_ip, String host_ip,
                              String rule_id, List<String> expected, String status) {
        resultInfoMapper.addResult1(timestamp, id, os, lang, server_ip, host_ip, rule_id, expected, status);
    }

    @Override
    public void insertResult2(Timestamp timestamp, Integer id, String os, String lang, String server_ip, String host_ip,
                              String rule_id, List<String> actual, String status) {
        resultInfoMapper.addResult2(timestamp, id, os, lang, server_ip, host_ip, rule_id, actual, status);
    }
}
