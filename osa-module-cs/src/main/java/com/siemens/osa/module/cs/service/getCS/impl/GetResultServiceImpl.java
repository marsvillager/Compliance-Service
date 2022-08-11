package com.siemens.osa.module.cs.service.getCS.impl;

import com.siemens.osa.data.cs.entity.ResultInfo;
import com.siemens.osa.data.cs.module.ResultService;
import com.siemens.osa.module.cs.service.getCS.IGetResultService;
import org.springframework.stereotype.Service;

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
    public List<ResultInfo> getResult() {
        return resultService.GetAllResult();
    }

    @Override
    public List<ResultInfo> getResultById(Integer id) {
        return resultService.GetResultById(id);
    }

//    @Override
//    public Map<String, ResultInfo> GetResultMapById(Integer id) {
//        return resultService.GetResultMapById(id);
//    }
}
