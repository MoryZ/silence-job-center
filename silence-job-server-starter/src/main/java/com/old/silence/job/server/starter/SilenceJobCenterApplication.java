package com.old.silence.job.server.starter;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author moryzang
 */

@SpringBootApplication
public class SilenceJobCenterApplication {

    public static void main(String[] args) {
        SpringApplication.run(SilenceJobCenterApplication.class, args);
    }

}
