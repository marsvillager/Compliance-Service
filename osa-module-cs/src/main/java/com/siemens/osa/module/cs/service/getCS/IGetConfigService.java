package com.siemens.osa.module.cs.service.getCS;

import com.siemens.osa.data.cs.entity.ConfigInfo;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface IGetConfigService {
    List<ConfigInfo> getConfig();

    Map<String, ConfigInfo> getConfigById(Integer id);
}
