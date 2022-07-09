package com.siemens.osa.data.cs;

import com.siemens.osa.data.cs.entity.ConfigInfo;
import com.siemens.osa.data.cs.mapper.ConfigInfoMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Map;

@SpringBootTest
public class ConfigTest {
    @Autowired
    ConfigInfoMapper configInfoMapper;

    @Test
    public void testGetAllConfig(){
        List<ConfigInfo> allConfig = configInfoMapper.getAllConfig();
        for (ConfigInfo configInfo : allConfig) {
            System.out.println(configInfo);
        }
    }

    @Test
    public void testGetConfigById(){
        int id = 2;
        Map<String, ConfigInfo> configInfoMap = configInfoMapper.getConfigById(id);
        ConfigInfo configInfo = configInfoMap.get("BL696-0711");
        String[] data = configInfo.getData();
        for (String datum : data) {
            System.out.println(datum);
        }
    }

    @Test
    public void testGetConfigListById(){
        int id = 2;
        List<String> result = configInfoMapper.getConfigListById(id, "BL696_0461");
        for (String res: result) {
            System.out.println(res);
        }
    }
}
