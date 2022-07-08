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
}
