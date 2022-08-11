package com.siemens.osa.data.cs;

import com.siemens.osa.data.cs.entity.ResultInfo;
import com.siemens.osa.data.cs.module.ResultService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ResultTest {
    @Autowired
    private ResultService resultService;

    @Test
    public void testGetAllResult() {
        List<ResultInfo> resultInfoList = resultService.GetAllResult();
        for(ResultInfo resultInfo: resultInfoList) {
            System.out.println(resultInfo.toString());
        }
    }

    @Test
    public void testGetResultById() {
        int id = 2;
        List<ResultInfo> resultInfoList = resultService.GetResultById(id);
        for (ResultInfo resultInfo : resultInfoList) {
            System.out.println(resultInfo);
        }
    }

//    @Test
//    public void testGetResultMapById() {
//        int id = 2;
//        Map<String, ResultInfo> resultInfoMap = resultService.GetResultMapById(id);
//        ResultInfo resultInfo = resultInfoMap.get("BL696_0711");
//        System.out.println(resultInfo);
//        String[] expected = resultInfo.getExpected();
//        for (String s : expected) {
//            System.out.println(s);
//        }
//    }

    @Test
    public void testGetRecentResult(){
        List<ResultInfo> recentResult = resultService.GetRecentResult();
        for (ResultInfo resultInfo : recentResult) {
            System.out.println(resultInfo);
        }
    }

    @Test
    public void testGetRecentResultWithZone(){
        String beginTimeStr = "2022-08-11 00:00:00";
        String endTimeStr = "2022-08-12 00:00:00";
        Timestamp beginTime = Timestamp.valueOf(beginTimeStr);
        Timestamp endTime = Timestamp.valueOf(endTimeStr);
        List<ResultInfo> recentResultWithZone = resultService.GetRecentResultWithZone(beginTime, endTime);
        for (ResultInfo resultInfo : recentResultWithZone) {
            System.out.println(resultInfo);
        }
    }

    @Test
    public void testAddResult() {
        List<String> expected = new ArrayList<>();
        expected.add("0");
        expected.add("1");
        List<String> actual = new ArrayList<>();
        actual.add("0");
        actual.add("2");
        //            resultService.addResult(new Timestamp(System.currentTimeMillis()), 2, "windows10", "Chinese",
//                    InetAddress.getLocalHost().getHostAddress(), "192.168.1.155", "BL696_0461",
//                     "failed");
        resultService.addResult(new Timestamp(System.currentTimeMillis()), 2, "windows10", "Chinese");
    }
}
