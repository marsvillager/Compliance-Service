package com.siemens.osa.data.cs.repository;

import com.siemens.osa.data.cs.entity.ResultInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ResultInfoRepository extends JpaRepository<ResultInfo, Long> {
    @Query(value = "select * from result", nativeQuery = true)
    List<ResultInfo> getAllResult();

    @Query(value = "select * from result where id = :id", nativeQuery = true)
    List<ResultInfo> getResultById(@Param("id") Integer id);
}
