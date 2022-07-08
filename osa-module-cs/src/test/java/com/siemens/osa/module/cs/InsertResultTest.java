package com.siemens.osa.module.cs;

import com.siemens.osa.data.cs.mapper.ResultInfoMapper;
import com.siemens.osa.module.cs.service.getCS.impl.InsertResultServiceServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@SpringBootTest
public class InsertResultTest {
    @Autowired
    ResultInfoMapper resultInfoMapper;

    @Test
    public void testUpdateResult() {
        InsertResultServiceServiceImpl updateResultService = new InsertResultServiceServiceImpl(resultInfoMapper);

        List<String> expected = new ArrayList<>();
        expected.add("0");
        expected.add("1");
        List<String> actual = new ArrayList<>();
        actual.add("0");
        actual.add("2");
        try {
            updateResultService.insertResult(new Timestamp(System.currentTimeMillis()), 2, "win", InetAddress.getLocalHost().getHostAddress(),
                    "192.168.1.155", "BL696_0461", expected, actual, "failed");
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
    }
}
