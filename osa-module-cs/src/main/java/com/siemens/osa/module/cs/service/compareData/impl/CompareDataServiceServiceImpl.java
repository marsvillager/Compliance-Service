package com.siemens.osa.module.cs.service.compareData.impl;

import com.siemens.osa.data.cs.entity.ConfigInfo;
import com.siemens.osa.data.cs.mapper.ConfigInfoMapper;
import com.siemens.osa.data.es.Service.GetData.impl.GetESInfoServiceImpl;
import com.siemens.osa.data.es.entity.ESInfo;
import com.siemens.osa.module.cs.service.compareData.ICompareDataService;
import com.siemens.osa.module.cs.service.getCS.impl.GetConfigServiceImpl;
import com.siemens.osa.module.cs.service.getES.impl.GetESServiceImpl;

import java.util.List;
import java.util.Map;

public class CompareDataServiceServiceImpl implements ICompareDataService {
    private GetESInfoServiceImpl esInfoGetService;
    private ConfigInfoMapper configInfoMapper;

    public CompareDataServiceServiceImpl() {
    }

    public CompareDataServiceServiceImpl(ConfigInfoMapper configInfoMapper, GetESInfoServiceImpl esInfoGetService) {
        this.configInfoMapper = configInfoMapper;
        this.esInfoGetService = esInfoGetService;
    }

    @Override
    public void compareData() {
        GetESServiceImpl getESService = new GetESServiceImpl(esInfoGetService);
        GetConfigServiceImpl getConfigService = new GetConfigServiceImpl(configInfoMapper);

        // TODO 过滤时间
        List<ESInfo> esInfoList = getESService.getES();
        for (ESInfo esInfo: esInfoList) {
            Map<String, ConfigInfo> configInfoMap = getConfigService.getConfigById(esInfo.getID());
            System.out.println("before");
            System.out.println(configInfoMap.get(esInfo.getRuleID()));
            System.out.println(esInfo.getResult());
            System.out.println("after");
        }
    }
}
