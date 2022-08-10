package com.siemens.osa.data.cs;

import com.siemens.osa.data.cs.entity.ResultInfo;
import com.siemens.osa.data.cs.module.ResultService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ResultTest {
    @Autowired
    private ResultService resultService;

    @Test
    public void testGetRecentResult() {
        List<ResultInfo> resultInfoList = resultService.GetAllResult();
        for(ResultInfo resultInfo: resultInfoList) {
            System.out.println(resultInfo.toString());
        }
    }
}
