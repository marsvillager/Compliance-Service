package com.siemens.osa.data.cs.module;

import com.siemens.osa.data.cs.entity.ConfigInfo;
import com.siemens.osa.data.cs.repository.ConfigInfoRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class ConfigService {
    private ConfigInfoRepository configInfoRepository;

    public ConfigService(ConfigInfoRepository configInfoRepository) {
        this.configInfoRepository = configInfoRepository;
    }

    public List<ConfigInfo> GetAllConfig() {
        return configInfoRepository.getAllConfig();
    }

    public List<ConfigInfo> GetConfigById(Integer id) {
        return configInfoRepository.getConfigById(id);
    }

    public Map<String, ConfigInfo> GetConfigMapById(Integer id) {
        List<ConfigInfo> configInfoList = configInfoRepository.getConfigById(id);
        return configInfoList.stream().collect(Collectors.toMap(k -> k.getRuleId(), v -> v));
    }
}
