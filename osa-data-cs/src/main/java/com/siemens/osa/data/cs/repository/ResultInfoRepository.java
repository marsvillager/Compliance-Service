package com.siemens.osa.data.cs.repository;

import com.siemens.osa.data.cs.entity.ResultInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

@Repository
public interface ResultInfoRepository extends JpaRepository<ResultInfo, Long> {
    @Query(value = "select * from result", nativeQuery = true)
    List<ResultInfo> getAllResult();

    @Query(value = "select * from result where id = :id", nativeQuery = true)
    List<ResultInfo> getResultById(@Param("id") Integer id);

    @Query(value = "select * from result where timestamp = (select max(timestamp) from result)", nativeQuery = true)
    List<ResultInfo> getRecentResult();

    @Query(value = "select * from result where host_ip = inet(:hostIp) and timestamp = :collectTime",
            nativeQuery = true)
    List<ResultInfo> getResultByHostIpTime(@Param("hostIp") String hostIp, @Param("collectTime") Timestamp collectTime);

    @Query(value = "select * from result where timestamp = (select max(timestamp) from result where " +
            "timestamp >= :beginTime and timestamp < :endTime)", nativeQuery = true)
    List<ResultInfo> getRecentResultWithZone(@Param("beginTime") Timestamp beginTime,
                                             @Param("endTime") Timestamp endTime);

    @Query(value = "insert into result(timestamp, id, os, lang, server_ip, host_ip, rule_id, status) values(" +
            ":timestamp, :id, :os, :lang, inet(:serverIp), inet(:hostIp), :ruleId, :status)", nativeQuery = true)
    void addResult(@Param("timestamp") Timestamp timestamp, @Param("id") Integer id, @Param("os") String os,
                   @Param("lang") String lang, @Param("serverIp") String serverIp, @Param("hostIp") String hostIp,
                   @Param("ruleId") String ruleId, @Param("status") String status);
}
