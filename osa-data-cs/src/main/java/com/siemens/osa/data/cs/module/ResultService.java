package com.siemens.osa.data.cs.module;

import com.siemens.osa.data.cs.entity.ResultInfo;
import com.siemens.osa.data.cs.repository.ResultInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class ResultService {
    @Autowired
    private ResultInfoRepository resultInfoRepository;

    public List<ResultInfo> GetAllResult() {
        return resultInfoRepository.getAllResult();
    }

    public List<ResultInfo> GetResultById(Integer id) {
        return resultInfoRepository.getResultById(id);
    }

    public List<ResultInfo> GetRecentResult() {
        return resultInfoRepository.getRecentResult();
    }

    public List<ResultInfo> GetResultByHostIpTime(String hostIp, Timestamp collectTime) {
        return resultInfoRepository.getResultByHostIpTime(hostIp, collectTime);
    }

    public List<ResultInfo> GetRecentResultWithZone(Timestamp beginTime, Timestamp endTime) {
        return resultInfoRepository.getRecentResultWithZone(beginTime, endTime);
    }

    public void addResult(Timestamp timestamp, Integer id, String os, String lang, String serverIp, String hostIp,
                          String ruleId, String status) {
        resultInfoRepository.addResult(timestamp, id, os, lang, serverIp, hostIp, ruleId, status);
    }
}
