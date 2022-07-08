package com.siemens.osa.data.cs.mapper;

import com.siemens.osa.data.cs.entity.ResultInfo;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface ResultInfoMapper {
    List<ResultInfo> getAllResult();

    @MapKey("rule_id")
    Map<String, ResultInfo> getResultById(@Param("id") Integer id);

    @MapKey("rule_id")
    List<String> getResultListById(@Param("id") Integer id, @Param("ruleId") String ruleId);

    void updateResult(@Param("id") Integer id, @Param("ruleId") String ruleId, @Param("actual") String[] actual, @Param("status") String status);
}
