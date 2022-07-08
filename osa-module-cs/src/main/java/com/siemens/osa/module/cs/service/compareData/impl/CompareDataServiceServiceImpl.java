package com.siemens.osa.module.cs.service.compareData.impl;

import com.siemens.osa.data.cs.mapper.ResultInfoMapper;
import com.siemens.osa.data.es.Service.GetData.impl.GetESInfoServiceImpl;
import com.siemens.osa.data.es.entity.ESInfo;
import com.siemens.osa.module.cs.service.compareData.ICompareDataService;
import com.siemens.osa.module.cs.service.getCS.impl.GetResultServiceImpl;
import com.siemens.osa.module.cs.service.getES.impl.GetESServiceImpl;

import java.util.List;

public class CompareDataServiceServiceImpl implements ICompareDataService {
    private GetESInfoServiceImpl esInfoGetService;
    private ResultInfoMapper resultInfoMapper;

    public CompareDataServiceServiceImpl() {
    }

    public CompareDataServiceServiceImpl(ResultInfoMapper resultInfoMapper, GetESInfoServiceImpl esInfoGetService) {
        this.resultInfoMapper = resultInfoMapper;
        this.esInfoGetService = esInfoGetService;
    }

    @Override
    public void compareData() {
        GetESServiceImpl getESService = new GetESServiceImpl(esInfoGetService);
        GetResultServiceImpl getResultService = new GetResultServiceImpl(resultInfoMapper);

        // TODO 过滤时间
        List<ESInfo> esInfoList = getESService.getES();
        for (ESInfo esInfo: esInfoList) {
            List<String> resultInfo = getResultService.getResultListById(esInfo.getID(), esInfo.getRuleID());
            System.out.println("before");
            System.out.println(resultInfo);
            System.out.println(esInfo.getResult());
            System.out.println("after");
        }
    }
}
