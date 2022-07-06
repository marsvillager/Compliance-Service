package com.siemens.osa.data.es;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude= DataSourceAutoConfiguration.class)
public class DataESApplication {
    public static void main(String[] args) { SpringApplication.run(DataESApplication.class, args); }
}
