package com.siemens.osa.module.cs.service.getCS;

import com.siemens.osa.data.cs.entity.ConfigInfo;

import java.util.List;
import java.util.Map;

public interface IGetConfigService {
    List<ConfigInfo> getConfig();

    List<ConfigInfo> getConfigById(Integer id);

    Map<String, ConfigInfo> GetConfigMapById(Integer id);
}
