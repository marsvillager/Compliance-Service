package com.siemens.osa.module.cs;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"com.siemens.osa.data.cs", "com.siemens.osa.data.es", "com.siemens.osa.module.cs"})
public class ModuleCSApplication {
    public static void main(String[] args) {
        SpringApplication.run(ModuleCSApplication.class, args);
    }
}
