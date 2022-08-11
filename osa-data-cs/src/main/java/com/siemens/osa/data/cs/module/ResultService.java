package com.siemens.osa.data.cs.module;

import com.siemens.osa.data.cs.entity.ResultInfo;
import com.siemens.osa.data.cs.repository.ResultInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

//    public Map<String, ResultInfo> GetResultMapById(Integer id) {
//        List<ResultInfo> resultInfoList = resultInfoRepository.getResultById(id);
//        return resultInfoList.stream().collect(Collectors.toMap(k -> k.getRuleId(), v -> v));
//    }
}
