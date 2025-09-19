package com.old.silence.job.client.starter;

import org.aopalliance.intercept.MethodInterceptor;
import org.springframework.aop.Advisor;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.Ordered;
import org.springframework.env.StandardEnvironment;
import com.old.silence.job.client.annotation.Retryable;
import com.old.silence.job.client.intercepter.SilenceRetryInterceptor;
import com.old.silence.job.client.intercepter.SilenceRetryPointcutAdvisor;
import com.old.silence.job.client.strategy.RetryStrategy;

@Configuration
@Role(BeanDefinition.ROLE_INFRASTRUCTURE)
@ConditionalOnClass(Retryable.class)
@ComponentScan({"com.old.silence.job.client.core", "com.old.silence.job.client.common"})
@ConditionalOnProperty(prefix = "silence-job", name = "enabled", havingValue = "true")
public class SilenceJobClientRetryCoreAutoConfiguration {

    @Bean
    @Role(BeanDefinition.ROLE_INFRASTRUCTURE)
    public Advisor silenceJobPointcutAdvisor(MethodInterceptor silenceJobInterceptor) {
        return new SilenceRetryPointcutAdvisor(silenceJobInterceptor);
    }

    @Bean
    @Role(BeanDefinition.ROLE_INFRASTRUCTURE)
    public MethodInterceptor silenceJobInterceptor(StandardEnvironment standardEnvironment,
                                                 @Lazy RetryStrategy localRetryStrategies) {
        Integer order = standardEnvironment
                .getProperty(SilenceJobClientsRegistrar.AOP_ORDER_CONFIG, Integer.class, Ordered.HIGHEST_PRECEDENCE);

        return new SilenceRetryInterceptor(order, localRetryStrategies);
    }

}
