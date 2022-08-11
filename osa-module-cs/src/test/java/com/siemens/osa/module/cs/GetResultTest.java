package com.siemens.osa.module.cs;

import com.siemens.osa.data.cs.entity.ResultInfo;
import com.siemens.osa.data.cs.module.ResultService;
import com.siemens.osa.module.cs.service.getCS.impl.GetResultServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class GetResultTest {
    @Autowired
    private ResultService resultService;

    @Test
    public void testGetAllResult() {
        GetResultServiceImpl getResultService = new GetResultServiceImpl(resultService);
        List<ResultInfo> resultInfoList = getResultService.GetResult();
        for (ResultInfo resultInfo: resultInfoList) {
            System.out.println(resultInfo);
        }
    }

    @Test
    public void testGetResultById() {
        int id = 2;
        GetResultServiceImpl getResultService = new GetResultServiceImpl(resultService);
        List<ResultInfo> resultInfoList = getResultService.GetResultById(id);
        for (ResultInfo resultInfo: resultInfoList) {
            System.out.println(resultInfo);
        }
    }

//    @Test
//    public void testGetResultMapById() {
//        int id = 2;
//        GetResultServiceImpl getResultService = new GetResultServiceImpl(resultService);
//        Map<String, ResultInfo> resultInfoMap = getResultService.GetResultMapById(id);
//        ResultInfo resultInfo = resultInfoMap.get("BL696_0711");
//        System.out.println(resultInfo);
//        String[] expected = resultInfo.getExpected();
//        for (String s : expected) {
//            System.out.println(s);
//        }
//    }

    @Test
    public void testGetRecentResult() {
        GetResultServiceImpl getResultService = new GetResultServiceImpl(resultService);
        List<ResultInfo> resultInfoList = getResultService.GetRecentResult();
        for (ResultInfo resultInfo : resultInfoList) {
            System.out.println(resultInfo);
        }
    }

    @Test
    public void testGetRecentResultWithZone(){
        GetResultServiceImpl getResultService = new GetResultServiceImpl(resultService);
        String beginTimeStr = "2022-08-11 00:00:00";
        String endTimeStr = "2022-08-12 00:00:00";
        Timestamp beginTime = Timestamp.valueOf(beginTimeStr);
        Timestamp endTime = Timestamp.valueOf(endTimeStr);
        List<ResultInfo> resultInfoList = getResultService.GetRecentResultWithZone(beginTime, endTime);
        for (ResultInfo resultInfo : resultInfoList) {
            System.out.println(resultInfo);
        }
    }
}
