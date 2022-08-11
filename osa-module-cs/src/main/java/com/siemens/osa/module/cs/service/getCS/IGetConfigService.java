package com.siemens.osa.module.cs.service.getCS;

import com.siemens.osa.data.cs.entity.ConfigInfo;

import java.util.List;
import java.util.Map;

public interface IGetConfigService {
    List<ConfigInfo> GetConfig();

    List<ConfigInfo> GetConfigById(Integer id);

    Map<String, ConfigInfo> GetConfigMapById(Integer id);
}
