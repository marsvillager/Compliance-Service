package com.siemens.osa.data.cs;

import com.siemens.osa.data.cs.entity.ResultInfo;
import com.siemens.osa.data.cs.mapper.ResultInfoMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Map;

@SpringBootTest
public class ResultTest {
    @Autowired
    ResultInfoMapper resultInfoMapper;

    @Test
    public void testGetAllResult(){
        List<ResultInfo> allResult = resultInfoMapper.getAllResult();
        for (ResultInfo resultInfo : allResult) {
            System.out.println(resultInfo);
        }
    }

    @Test
    public void testGetResultById(){
        int id = 2;
        Map<String, ResultInfo> resultInfoMap = resultInfoMapper.getResultById(id);
        System.out.println(resultInfoMap.get("BL696_0461"));
    }
}
