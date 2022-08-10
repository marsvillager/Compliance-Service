package com.siemens.osa.module.cs.service.getCS;

import com.siemens.osa.data.cs.entity.ConfigInfo;

import java.util.List;

public interface IGetConfigService {
    List<ConfigInfo> getConfig();
}
