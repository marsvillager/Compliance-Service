package com.siemens.osa.module.cs;

import com.siemens.osa.data.cs.entity.ConfigInfo;
import com.siemens.osa.data.cs.module.ConfigService;
import com.siemens.osa.module.cs.service.getCS.impl.GetCSServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class GetCSTest {
    @Autowired
    private ConfigService service;

    @Test
    public void show() {
        System.out.println("before test");
        GetCSServiceImpl getCSService = new GetCSServiceImpl(service);
        List<ConfigInfo> configInfoList = getCSService.getCS();
        for (ConfigInfo config: configInfoList) {
            System.out.println(config.getParams());
        }
        System.out.println("after test");
    }
}
