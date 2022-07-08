package com.siemens.osa.module.cs.service.getCS.impl;

import com.siemens.osa.data.cs.entity.ResultInfo;
import com.siemens.osa.data.cs.mapper.ResultInfoMapper;
import com.siemens.osa.module.cs.service.getCS.IGetResultService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class GetResultServiceImpl implements IGetResultService {
    private ResultInfoMapper resultInfoMapper;

    public GetResultServiceImpl() {
    }

    public GetResultServiceImpl(ResultInfoMapper resultInfoMapper) {
        this.resultInfoMapper = resultInfoMapper;
    }

    @Override
    public List<ResultInfo> getResult() {
        return resultInfoMapper.getAllResult();
    }

    @Override
    public Map<String, ResultInfo> getResultById(Integer id) {
        return resultInfoMapper.getResultById(id);
    }
}
