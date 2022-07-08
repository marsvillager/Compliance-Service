package com.siemens.osa.module.cs;

import com.siemens.osa.data.cs.mapper.ResultInfoMapper;
import com.siemens.osa.data.es.Service.GetData.impl.GetESInfoServiceImpl;
import com.siemens.osa.module.cs.service.compareData.impl.CompareDataServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class CompareDataTest {
    @Autowired
    @Qualifier("esInfo")
    GetESInfoServiceImpl esInfoGetService;

    @Autowired
    ResultInfoMapper resultInfoMapper;

    @Test
    public void testCompareData() {
        CompareDataServiceImpl compareDataService = new CompareDataServiceImpl(resultInfoMapper, esInfoGetService);
        compareDataService.compareData();
    }
}
