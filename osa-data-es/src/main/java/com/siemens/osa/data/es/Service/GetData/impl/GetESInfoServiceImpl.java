package com.siemens.osa.data.es.Service.GetData.impl;

import com.siemens.osa.data.es.Service.GetData.IGetESInfoService;
import com.siemens.osa.data.es.entity.ESInfo;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchScrollRequest;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.unit.TimeValue;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.Scroll;
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
        final Scroll scroll = new Scroll(TimeValue.timeValueMinutes(1L));
        SearchRequest searchRequest = new SearchRequest(index);
        searchRequest.scroll(scroll);

        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        searchSourceBuilder.query(QueryBuilders.matchAllQuery());
        searchSourceBuilder.size(1000);

        searchRequest.source(searchSourceBuilder);

        SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);

        String scrollId = searchResponse.getScrollId();
        System.out.println("scrollId: " + scrollId);

        SearchHit[] SearchHits = searchResponse.getHits().getHits();
        while (SearchHits != null && SearchHits.length > 0) {
            SearchHits hits = searchResponse.getHits();

            SearchHit[] searchHits = hits.getHits();
            for (SearchHit hit: searchHits) {
                Map<String, Object> sourceAsMap = hit.getSourceAsMap();
                String ID = (String) sourceAsMap.get("ID");
                String collectTime = (String) sourceAsMap.get("collectTime");
                String ruleId = (String) sourceAsMap.get("ruleId");
                List<String> result = (List<String>) sourceAsMap.get("result");
                String hostIP = (String) sourceAsMap.get("hostIp");

                int id = Integer.parseInt(ID);

                list.add(new ESInfo(id, collectTime, result, hostIP, ruleId));
            }
            SearchScrollRequest searchScrollRequest = new SearchScrollRequest(scrollId);
            searchScrollRequest.scroll(scroll);
            searchResponse = client.scroll(searchScrollRequest, RequestOptions.DEFAULT);
            SearchHits = searchResponse.getHits().getHits();
        }
        return list;
    }

}
