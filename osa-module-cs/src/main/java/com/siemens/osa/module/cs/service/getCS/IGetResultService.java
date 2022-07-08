package com.siemens.osa.module.cs.service.getCS;

import com.siemens.osa.data.cs.entity.ResultInfo;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface IGetResultService {
    List<ResultInfo> getResult();

    Map<String, ResultInfo> getResultById(Integer id);
}
