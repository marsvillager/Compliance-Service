package com.siemens.osa.module.cs.service.getCS.impl;

import com.siemens.osa.data.cs.entity.ConfigInfo;
import com.siemens.osa.data.cs.module.ConfigService;
import com.siemens.osa.module.cs.service.getCS.IGetCSService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GetCSServiceImpl implements IGetCSService {
    private ConfigService service;

    public GetCSServiceImpl(ConfigService service) {
        this.service = service;
    }

    @Override
    public List<ConfigInfo> getCS() {
        return service.GetAllConfig();
    }
}
