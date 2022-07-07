package com.siemens.osa.module.cs.service.getCS.impl;

import com.siemens.osa.data.cs.entity.ConfigInfo;
import com.siemens.osa.data.cs.mapper.ConfigInfoMapper;
import com.siemens.osa.module.cs.service.getCS.IGetConfigService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GetConfigServiceImpl implements IGetConfigService {
    private ConfigInfoMapper configInfoMapper;

    public GetConfigServiceImpl() {
    }

    public GetConfigServiceImpl(ConfigInfoMapper configInfoMapper) {
        this.configInfoMapper = configInfoMapper;
    }

    @Override
    public List<ConfigInfo> getConfig() {
        return configInfoMapper.getAllConfig();
    }
}
