package com.siemens.osa.module.cs.service.getCS.impl;

import com.siemens.osa.data.cs.entity.ConfigInfo;
import com.siemens.osa.data.cs.module.ConfigService;
import com.siemens.osa.module.cs.service.getCS.IGetConfigService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GetConfigServiceImpl implements IGetConfigService {
    private ConfigService configService;

    public GetConfigServiceImpl() {
    }

    public GetConfigServiceImpl(ConfigService configService) {
        this.configService = configService;
    }

    @Override
    public List<ConfigInfo> getConfig() {
        return configService.GetAllConfig();
    }
}
