package com.siemens.osa.data.cs.mapper;

import com.siemens.osa.data.cs.entity.ConfigInfo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ConfigInfoMapper {
    List<ConfigInfo> getAllConfig();
}
