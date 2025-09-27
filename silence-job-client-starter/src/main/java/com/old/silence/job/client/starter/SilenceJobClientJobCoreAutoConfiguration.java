package com.old.silence.job.client.starter;

import cn.hutool.core.util.StrUtil;

import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Role;
import com.old.silence.job.client.common.config.SilenceJobProperties;
import com.old.silence.job.client.core.annotation.JobExecutor;
import com.old.silence.job.common.util.SilenceJobNetworkUtils;
import com.old.silence.job.log.SilenceJobLog;

@Configuration
@Role(BeanDefinition.ROLE_INFRASTRUCTURE)
@ComponentScan({"com.old.silence.job.client.*", "com.old.silence.job.client.common.*"})
@ConditionalOnClass(JobExecutor.class)
@ConditionalOnProperty(prefix = "silence-job", name = "enabled", havingValue = "true")
public class SilenceJobClientJobCoreAutoConfiguration {

    private static final String SNAIL_JOB_CLIENT_HOST = "silence-job.host";

    @Bean
    public Object configureSnailJobHost(SilenceJobNetworkUtils networkUtils, SilenceJobProperties silenceJobProperties) {
        String host = silenceJobProperties.getHost();
        if (StrUtil.isBlank(host)) {
            host = System.getProperty(SNAIL_JOB_CLIENT_HOST);
            if (StrUtil.isNotBlank(host)) {
                silenceJobProperties.setHost(host);
            }
        }

        if (StrUtil.isBlank(host)) {
            // 获取首选IP地址
            host = networkUtils.findPreferredHostAddress();
            silenceJobProperties.setHost(host);
            System.setProperty(SNAIL_JOB_CLIENT_HOST, host);
        }

        SilenceJobLog.LOCAL.info("Snail-Job 客户端IP为: {}" , host);
        return null; // 不需要实际的bean实例，只是触发配置
    }

}
