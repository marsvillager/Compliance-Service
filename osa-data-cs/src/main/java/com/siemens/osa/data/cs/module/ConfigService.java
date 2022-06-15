package com.siemens.osa.data.cs.module;

import com.siemens.osa.data.cs.entity.ConfigInfo;
import com.siemens.osa.data.cs.repository.ConfigInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConfigService {
    @Autowired
    private ConfigInfoRepository configInfoRepository;

    public List<ConfigInfo> GetAllConfig() {
        return configInfoRepository.getAllConfig();
    }
}
