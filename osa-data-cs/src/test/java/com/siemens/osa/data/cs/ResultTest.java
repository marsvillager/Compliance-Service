package com.siemens.osa.data.cs;

import com.siemens.osa.data.cs.entity.ResultInfo;
import com.siemens.osa.data.cs.mapper.ResultInfoMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class ResultTest {

    @Autowired
    ResultInfoMapper resultInfoMapper;

    @Test
    void contextLoads() {
    }

    @Test
    public void testGetAllConfig(){
        List<ResultInfo> allResult = resultInfoMapper.getAllResult();
        for (ResultInfo resultInfo : allResult) {
            System.out.println(resultInfo);
        }
    }
}
