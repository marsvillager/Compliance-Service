package com.siemens.osa.data.cs.mapper;

import com.siemens.osa.data.cs.entity.ConfigInfo;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface ConfigInfoMapper {
    List<ConfigInfo> getAllConfig();

    @MapKey("ruleId")
    Map<String, ConfigInfo> getConfigById(@Param("id") Integer id);

    List<String> getConfigListById(@Param("id") Integer id, @Param("ruleId") String ruleId);
}
