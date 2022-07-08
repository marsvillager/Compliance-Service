package com.siemens.osa.module.cs;

import com.siemens.osa.data.cs.mapper.ResultInfoMapper;
import com.siemens.osa.module.cs.service.getCS.impl.InsertResultServiceServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Timestamp;

@SpringBootTest
public class InsertResultTest {
    @Autowired
    ResultInfoMapper resultInfoMapper;

    @Test
    public void testUpdateResult() {
        InsertResultServiceServiceImpl updateResultService = new InsertResultServiceServiceImpl(resultInfoMapper);

        // expected 和 actual 转化为 String 后由于数据库中为 text[]，所以需要加上大括号
        try {
            updateResultService.insertResult(new Timestamp(System.currentTimeMillis()), 2, "win", InetAddress.getLocalHost().getHostAddress(),
                    "192.168.1.155", "BL696_0461", "{" + "0,1" + "}", "{" + "0,2" + "}", "failed");
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
    }
}
