package com.siemens.osa.data.cs.mapper;

import com.siemens.osa.data.cs.entity.ResultInfo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ResultInfoMapper {
    List<ResultInfo> getAllResult();
}
