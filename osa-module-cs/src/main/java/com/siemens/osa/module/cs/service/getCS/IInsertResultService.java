package com.siemens.osa.module.cs.service.getCS;

import org.apache.ibatis.annotations.Param;

import java.sql.Timestamp;
import java.util.List;

public interface IInsertResultService {
    void insertResult(Timestamp timestamp, Integer id,String os, String server_ip, String host_ip, String rule_id,
                      List<String> expected, List<String> actual, String status);
}
