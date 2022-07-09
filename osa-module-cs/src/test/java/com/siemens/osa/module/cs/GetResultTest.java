package com.siemens.osa.module.cs;

import com.siemens.osa.data.cs.entity.ResultInfo;
import com.siemens.osa.data.cs.mapper.ResultInfoMapper;
import com.siemens.osa.module.cs.service.getCS.impl.GetResultServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Map;

@SpringBootTest
public class GetResultTest {
    @Autowired
    ResultInfoMapper resultInfoMapper;

    @Test
    public void testGetAllResult() {
        GetResultServiceImpl getResultService = new GetResultServiceImpl(resultInfoMapper);
        List<ResultInfo> resultInfoList = getResultService.getResult();
        for (ResultInfo resultInfo: resultInfoList) {
            System.out.println(resultInfo);
        }
    }

    @Test
    public void testGetResultById(){
        int id = 2;
        GetResultServiceImpl getResultService = new GetResultServiceImpl(resultInfoMapper);
        Map<String, ResultInfo> resultInfoMap = getResultService.getResultById(id);
        ResultInfo resultInfo = resultInfoMap.get("BL999_6629");
        System.out.println(resultInfo);
        String[] expected = resultInfo.getExpected();
        for (String s : expected) {
            System.out.println(s);
        }
    }
}
