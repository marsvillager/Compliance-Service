package com.siemens.osa.data.es.Service.GetData.impl;

import com.siemens.osa.data.es.Service.GetData.IGetESInfoService;
import com.siemens.osa.data.es.entity.ESInfo;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Service
public class GetESInfoServiceImpl implements IGetESInfoService {

    private RestHighLevelClient client;

    private String index;

    public GetESInfoServiceImpl() {
    }

    public GetESInfoServiceImpl(RestHighLevelClient client, String index) {
        this.client = client;
        this.index = index;
    }

    @Override
    public List<ESInfo> getAllConfig() throws IOException {
        List<ESInfo> list = new LinkedList<>();

        SearchRequest searchRequest = new SearchRequest(index);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(QueryBuilders.matchAllQuery());

        searchRequest.source(searchSourceBuilder);

        SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);

        SearchHits hits = searchResponse.getHits();

        SearchHit[] searchHits = hits.getHits();
        for (SearchHit hit : searchHits) {
            Map<String, Object> sourceAsMap = hit.getSourceAsMap();
            String ID = (String) sourceAsMap.get("ID");
            String collectTime = (String) sourceAsMap.get("collectTime");
            String ruleId = (String) sourceAsMap.get("ruleId");
            List<String> result = (List<String>) sourceAsMap.get("result");
            String hostIP = (String) sourceAsMap.get("hostIP");

            list.add(new ESInfo(ID, collectTime, result, hostIP, ruleId));
        }
        return list;
    }

}
