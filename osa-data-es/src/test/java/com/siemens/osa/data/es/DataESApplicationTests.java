package com.siemens.osa.data.es;

import com.siemens.osa.data.es.Service.GetData.impl.ESInfoGetServiceImpl;
import com.siemens.osa.data.es.entity.ESInfo;
import org.elasticsearch.client.RestHighLevelClient;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;
import java.util.List;

@SpringBootTest
public class DataESApplicationTests {
    @Autowired
    RestHighLevelClient client;

    @Value(value = "${es.index}")
    String index;

    @Test
    public void testGetES() throws IOException {
        ESInfoGetServiceImpl esInfoGetService = new ESInfoGetServiceImpl(client, index);
        List<ESInfo> esInfoList = esInfoGetService.getAllConfig();
        for (ESInfo esInfo : esInfoList) {
            System.out.println(esInfo);
        }
    }
}
