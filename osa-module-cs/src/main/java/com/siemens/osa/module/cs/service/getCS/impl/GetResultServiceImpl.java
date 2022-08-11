package com.siemens.osa.module.cs.service.getCS.impl;

import com.siemens.osa.data.cs.entity.ResultInfo;
import com.siemens.osa.data.cs.module.ResultService;
import com.siemens.osa.module.cs.service.getCS.IGetResultService;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

@Service
public class GetResultServiceImpl implements IGetResultService {
    private ResultService resultService;

    public GetResultServiceImpl() {
    }

    public GetResultServiceImpl(ResultService resultService) {
        this.resultService = resultService;
    }

    @Override
    public List<ResultInfo> GetResult() {
        return resultService.GetAllResult();
    }

    @Override
    public List<ResultInfo> GetResultById(Integer id) {
        return resultService.GetResultById(id);
    }

//    @Override
//    public Map<String, ResultInfo> GetResultMapById(Integer id) {
//        return resultService.GetResultMapById(id);
//    }

    @Override
    public List<ResultInfo> GetRecentResult() {
        return resultService.GetRecentResult();
    }

    @Override
    public List<ResultInfo> GetResultByHostIpTime(String hostIp, Timestamp collectTime) {
        return resultService.GetResultByHostIpTime(hostIp, collectTime);
    }

    @Override
    public List<ResultInfo> GetRecentResultWithZone(Timestamp beginTime, Timestamp endTime) {
        return resultService.GetRecentResultWithZone(beginTime, endTime);
    }
}
