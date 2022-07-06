package com.siemens.osa.data.cs;

import com.siemens.osa.data.cs.entity.ConfigInfo;
import com.siemens.osa.data.cs.mapper.ConfigInfoMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class ConfigTest {

    @Autowired
    ConfigInfoMapper configInfoMapper;

    @Test
    void contextLoads() {
    }

    @Test
    public void testGetAllConfig(){
        List<ConfigInfo> allConfig = configInfoMapper.getAllConfig();
        for (ConfigInfo configInfo : allConfig) {
            System.out.println(configInfo);
        }
    }
}
