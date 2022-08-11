package com.siemens.osa.module.cs.service.getCS;

import com.siemens.osa.data.cs.entity.ResultInfo;

import java.util.List;
import java.util.Map;

public interface IGetResultService {
    List<ResultInfo> getResult();

    List<ResultInfo> getResultById(Integer id);

//    Map<String, ResultInfo> GetResultMapById(Integer id);
}
