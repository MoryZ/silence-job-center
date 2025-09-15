package com.old.silence.job.client.retry.core.retryer;

import com.old.silence.platform.job.client.core.strategy.ExecutorMethod;
import com.old.silence.platform.job.client.core.strategy.ManualRetryStrategies;
import com.old.silence.platform.job.client.core.strategy.RetryStrategy;
import com.old.silence.platform.job.common.core.context.SilenceSpringContext;

/**
 * 构建重试模板对象
 *
 */
public class RetryTaskTemplateBuilder {

    private Class<? extends ExecutorMethod> executorMethodClass;
    private String scene;
    private Object[] params;

    public static RetryTaskTemplateBuilder newBuilder() {
        return new RetryTaskTemplateBuilder();
    }

    public RetryTaskTemplateBuilder withScene(String scene) {
        this.scene = scene;
        return this;
    }

    public RetryTaskTemplateBuilder withExecutorMethod(Class<? extends ExecutorMethod> executorMethod) {
        this.executorMethodClass = executorMethod;
        return this;
    }

    public RetryTaskTemplateBuilder withParam(Object params) {
        this.params = new Object[]{params};
        return this;
    }

    public SilenceJobTemplate build() {
        SilenceJobTemplate silenceJobTemplate = new SilenceJobTemplate();
        silenceJobTemplate.setParams(params);
        silenceJobTemplate.setExecutorMethodClass(executorMethodClass);
        silenceJobTemplate.setScene(scene);
        RetryStrategy retryStrategy = SilenceSpringContext.getBeanByType(ManualRetryStrategies.class);
        silenceJobTemplate.setRetryStrategy(retryStrategy);
        return silenceJobTemplate;
    }
}
