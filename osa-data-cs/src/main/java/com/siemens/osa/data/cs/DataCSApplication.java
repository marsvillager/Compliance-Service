package com.siemens.osa.data.cs;

import com.siemens.osa.data.cs.mapper.ConfigInfoMapper;
import com.siemens.osa.data.cs.mapper.ResultInfoMapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackageClasses = {ConfigInfoMapper.class, ResultInfoMapper.class})
public class DataCSApplication {
    public static void main(String[] args) {
        SpringApplication.run(DataCSApplication.class, args);
    }
}
