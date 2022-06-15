package com.siemens.osa.data.cs.repository;

import com.siemens.osa.data.cs.entity.ConfigInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ConfigInfoRepository extends JpaRepository<ConfigInfo, String> {
    @Query(value = "select * from config", nativeQuery = true)
    List<ConfigInfo> getAllConfig();
}
