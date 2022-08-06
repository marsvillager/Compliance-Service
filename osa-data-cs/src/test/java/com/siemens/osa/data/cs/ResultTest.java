package com.siemens.osa.data.cs;

import com.siemens.osa.data.cs.entity.ResultInfo;
import com.siemens.osa.data.cs.mapper.ResultInfoMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Timestamp;
import java.util.*;

@SpringBootTest
public class ResultTest {
    @Autowired
    ResultInfoMapper resultInfoMapper;

    @Test
    public void testGetRecentResult(){
        List<ResultInfo> recentResult = resultInfoMapper.getRecentResult();
        for (ResultInfo resultInfo : recentResult) {
            System.out.println(resultInfo);
        }
    }

    //    select * from result where timestamp = (select max(timestamp) from result where timestamp >= timestamp '2022-07-19' and timestamp < timestamp '2022-7-20')
    @Test
    public void testGetRecentResultWithZone(){
        String beginTimeStr = "2022-07-19 00:00:00";
        String endTimeStr = "2022-07-20 00:00:00";
        Timestamp beginTime = Timestamp.valueOf(beginTimeStr);
        Timestamp endTime = Timestamp.valueOf(endTimeStr);
        List<ResultInfo> recentResultWithZone = resultInfoMapper.getRecentResultWithZone(beginTime, endTime);
        for (ResultInfo resultInfo : recentResultWithZone) {
            System.out.println(resultInfo);
        }
    }

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
        ResultInfo resultInfo = resultInfoMap.get("BL999_6629");
        System.out.println(resultInfo);
        String[] expected = resultInfo.getExpected();
        for (String s : expected) {
            System.out.println(s);
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
        try {
            resultInfoMapper.addResult(new Timestamp(System.currentTimeMillis()), 2, "windows10", "Chinese",
                    InetAddress.getLocalHost().getHostAddress(), "192.168.1.155", "BL696_0461",
                    expected, actual, "failed");
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
    }
}
