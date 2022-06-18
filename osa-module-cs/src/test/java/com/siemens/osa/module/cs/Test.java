package com.siemens.osa.module.cs;

import com.siemens.osa.data.cs.entity.ConfigInfo;
import com.siemens.osa.data.cs.module.ConfigService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class Test{
    @Autowired
    private ConfigService service;

    @org.junit.Test
    public void show() {
        System.out.println("before test");
        List<ConfigInfo> configInfoList = service.GetAllConfig();
        for (ConfigInfo config: configInfoList) {
            System.out.println(config.getParams());
        }
        System.out.println("after test");
    }
}
