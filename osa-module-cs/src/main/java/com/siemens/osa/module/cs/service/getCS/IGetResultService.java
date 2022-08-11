package com.siemens.osa.module.cs.service.getCS;

import com.siemens.osa.data.cs.entity.ResultInfo;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

public interface IGetResultService {
    List<ResultInfo> GetResult();

    List<ResultInfo> GetResultById(Integer id);

//    Map<String, ResultInfo> GetResultMapById(Integer id);

    List<ResultInfo> GetRecentResult();

    List<ResultInfo> GetResultByHostIpTime(String hostIp, Timestamp collectTime);

    List<ResultInfo> GetRecentResultWithZone(Timestamp beginTime, Timestamp endTime);
}
