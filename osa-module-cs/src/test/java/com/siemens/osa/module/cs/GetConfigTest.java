package com.siemens.osa.module.cs;

import com.siemens.osa.data.cs.entity.ConfigInfo;
import com.siemens.osa.data.cs.mapper.ConfigInfoMapper;
import com.siemens.osa.module.cs.service.getCS.impl.GetConfigServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class GetConfigTest {
    @Autowired
    ConfigInfoMapper configInfoMapper;

    @Test
    public void testGetAllConfig() {
        GetConfigServiceImpl getCSService = new GetConfigServiceImpl(configInfoMapper);
        List<ConfigInfo> configInfoList = getCSService.getConfig();
        for (ConfigInfo configInfo: configInfoList) {
            System.out.println(configInfo);
        }
    }
}
