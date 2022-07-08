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

//    @Test
//    public void testAddResult() {
//        // expected 和 actual 转化为 String 后由于数据库中为 text[]，所以需要加上大括号
//        try {
//            resultInfoMapper.addResult(new Timestamp(System.currentTimeMillis()), 2, "win", InetAddress.getLocalHost().getHostAddress(),
//                    "192.168.1.155", "BL696_0461", "{" + "0,1" + "}", "{" + "0,2" + "}", "failed");
//        } catch (UnknownHostException e) {
//            e.printStackTrace();
//        }
//    }
}
