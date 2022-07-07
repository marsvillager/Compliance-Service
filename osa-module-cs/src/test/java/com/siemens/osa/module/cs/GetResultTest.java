package com.siemens.osa.module.cs;

import com.siemens.osa.data.cs.entity.ResultInfo;
import com.siemens.osa.data.cs.mapper.ResultInfoMapper;
import com.siemens.osa.module.cs.service.getCS.impl.GetResultServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class GetResultTest {
    @Autowired
    ResultInfoMapper resultInfoMapper;

    @Test
    public void show() {
        GetResultServiceImpl getResultService = new GetResultServiceImpl(resultInfoMapper);
        List<ResultInfo> resultInfoList = getResultService.getResult();
        for (ResultInfo resultInfo: resultInfoList) {
            System.out.println(resultInfo);
        }
    }
}
