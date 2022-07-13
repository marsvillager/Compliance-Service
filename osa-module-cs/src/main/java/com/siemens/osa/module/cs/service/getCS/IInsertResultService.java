package com.siemens.osa.module.cs.service.getCS;

import org.apache.ibatis.annotations.Param;

import java.sql.Timestamp;
import java.util.List;

public interface IInsertResultService {
    void insertResult(Timestamp timestamp, Integer id, String os, String lang, String server_ip, String host_ip,
                      String rule_id, List<String> expected, List<String> actual, String status);
    void insertResult0(Timestamp timestamp, Integer id, String os, String lang, String server_ip, String host_ip,
                       String rule_id, String status);
    void insertResult1(Timestamp timestamp, Integer id, String os, String lang, String server_ip, String host_ip,
                       String rule_id, List<String> expected, String status);

    void insertResult2(Timestamp timestamp, Integer id, String os, String lang, String server_ip, String host_ip,
                       String rule_id, List<String> actual, String status);
}
