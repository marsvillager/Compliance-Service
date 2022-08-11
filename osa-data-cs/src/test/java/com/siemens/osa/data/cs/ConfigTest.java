package com.siemens.osa.data.cs;

import com.siemens.osa.data.cs.entity.ConfigInfo;
import com.siemens.osa.data.cs.module.ConfigService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ConfigTest {
    @Autowired
    private ConfigService configService;

    @Test
    public void testGetAllConfig() {
        List<ConfigInfo> configInfoList = configService.GetAllConfig();
        for (ConfigInfo configInfo: configInfoList) {
            System.out.println(configInfo);
        }
    }

    @Test
    public void testGetConfigById() {
        int id = 2;
        List<ConfigInfo> configInfoList = configService.GetConfigById(id);
        for (ConfigInfo configInfo : configInfoList) {
            System.out.println(configInfo);
        }
    }

    @Test
    public void testGetConfigMapById() {
        int id = 2;
        Map<String, ConfigInfo> configInfoMap = configService.GetConfigMapById(id);
        ConfigInfo configInfo = configInfoMap.get("BL696_0711");
        String[] data = configInfo.getData();
        for (String datum : data) {
            System.out.println(datum);
        }
    }
}
