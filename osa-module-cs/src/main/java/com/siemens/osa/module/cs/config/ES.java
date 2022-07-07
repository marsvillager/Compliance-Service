package com.siemens.osa.module.cs.config;

import com.siemens.osa.data.es.Service.GetData.impl.GetESInfoServiceImpl;
import org.apache.http.HttpHost;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ES {
    @Value("${elasticsearch.hostList}")
    private String hostList;

    @Value(value = "${es.index}")
    private String index;

    @Bean( "esInfo")
    public GetESInfoServiceImpl esInfoGetService(){
        String[] split = hostList.split(",");
        HttpHost[] httpHostsArray = new HttpHost[split.length];
        for (int i = 0; i < split.length; i++) {
            String item = split[i];
            httpHostsArray[i] = new HttpHost(item.split(":")[0], Integer.parseInt(item.split(":")[1]), "http");
        }
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(httpHostsArray));

        return new GetESInfoServiceImpl(client,index);
    }
}
