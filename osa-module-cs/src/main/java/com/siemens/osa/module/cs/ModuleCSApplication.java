package com.siemens.osa.module.cs;

import com.siemens.osa.data.cs.mapper.ConfigInfoMapper;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan({"com.siemens.osa.data.cs", "com.siemens.osa.module.cs"})
@EnableJpaRepositories(basePackageClasses = ConfigInfoMapper.class)
@EntityScan("com.siemens.osa.data.cs.entity")
public class ModuleCSApplication {
    public static void main(String[] args) {
        SpringApplication.run(ModuleCSApplication.class, args);
    }
}
