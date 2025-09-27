package com.old.silence.job.server.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * @author moryzang
 */
@Configuration
@ComponentScan("com.old.silence.job.server.*")
@MapperScan("com.old.silence.job.server.infrastructure.persistence.dao")
public class SilenceJobTemplateAutoConfiguration {



}