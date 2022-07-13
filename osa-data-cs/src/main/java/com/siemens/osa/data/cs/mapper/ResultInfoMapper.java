package com.siemens.osa.data.cs.mapper;

import com.siemens.osa.data.cs.entity.ResultInfo;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface ResultInfoMapper {
    List<ResultInfo> getAllResult();

    @MapKey("ruleId")
    Map<String, ResultInfo> getResultById(@Param("id") Integer id);

    void addResult(@Param("timestamp") Timestamp timestamp, @Param("id") Integer id, @Param("os") String os,
                   @Param("lang") String lang, @Param("serverIp") String serverIp, @Param("hostIp") String hostIp,
                   @Param("ruleId") String ruleId, @Param("expected") List<String> expected,
                   @Param("actual") List<String> actual, @Param("status") String status);

    void addResult0(@Param("timestamp") Timestamp timestamp, @Param("id") Integer id, @Param("os") String os,
                    @Param("lang") String lang, @Param("serverIp") String serverIp, @Param("hostIp") String hostIp,
                    @Param("ruleId") String ruleId, @Param("status") String status);

    void addResult1(@Param("timestamp") Timestamp timestamp, @Param("id") Integer id, @Param("os") String os,
                    @Param("lang") String lang, @Param("serverIp") String serverIp, @Param("hostIp") String hostIp,
                    @Param("ruleId") String ruleId, @Param("expected") List<String> expected,
                    @Param("status") String status);

    void addResult2(@Param("timestamp") Timestamp timestamp, @Param("id") Integer id, @Param("os") String os,
                    @Param("lang") String lang, @Param("serverIp") String server_ip, @Param("hostIp") String hostIp,
                    @Param("ruleId") String ruleId, @Param("actual") List<String> actual,
                    @Param("status") String status);
}
