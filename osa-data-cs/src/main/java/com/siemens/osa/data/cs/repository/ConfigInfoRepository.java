package com.siemens.osa.data.cs.repository;

import com.siemens.osa.data.cs.entity.ConfigInfo;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ConfigInfoRepository extends JpaRepository<ConfigInfo, Long> {
    @Query(value = "select * from config", nativeQuery = true)
    List<ConfigInfo> getAllConfig();

    @Query(value = "select * from config where id = :id", nativeQuery = true)
    List<ConfigInfo> getConfigById(@Param("id") Integer id);
}
