package com.old.silence.job.common.util;

import com.old.silence.job.common.context.SilenceSpringContext;

import java.util.Objects;

import org.springframework.core.env.Environment;

/**
 * 获取环境信息
 *
 */
public class EnvironmentUtils {
    public static final String DEFAULT_ENV = "default ";

    /**
     * 获取日志状态
     *
     */
    public static Boolean getLogStatus() {

        Environment environment = SilenceSpringContext.getBean(Environment.class);
        if (Objects.nonNull(environment)) {
            return environment.getProperty("silence.job.log.status", Boolean.class, Boolean.TRUE);
        }

        return Boolean.TRUE;
    }

    /**
     * 获取环境
     *
     * @return DEV、FAT、UAT、PROD
     */
    public static String getActiveProfile() {

        Environment environment = SilenceSpringContext.getBean(Environment.class);
        if (Objects.isNull(environment)) {
            return DEFAULT_ENV;
        }

        String[] activeProfiles = environment.getActiveProfiles();
        if (activeProfiles.length == 0) {
            return DEFAULT_ENV;
        }

        StringBuilder envs = new StringBuilder();
        for (String activeProfile : activeProfiles) {
            envs.append(activeProfile).append(" ");
        }
        return envs.toString();
    }

}
