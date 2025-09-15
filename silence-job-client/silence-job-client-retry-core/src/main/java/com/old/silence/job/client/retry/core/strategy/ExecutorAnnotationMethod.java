package com.old.silence.job.client.retry.core.strategy;

import org.springframework.util.ReflectionUtils;
import com.alibaba.fastjson2.JSON;
import com.old.silence.platform.job.client.core.retryer.RetryerInfo;
import com.old.silence.platform.job.log.center.SilenceJobLog;



public class ExecutorAnnotationMethod implements ExecutorMethod {

    private RetryerInfo retryerInfo;

    public ExecutorAnnotationMethod(RetryerInfo retryerInfo) {
        this.retryerInfo = retryerInfo;
    }

    @Override
    public Object doExecute(Object params) {
        Class<?>[] paramTypes = retryerInfo.getMethod().getParameterTypes();
        SilenceJobLog.LOCAL.info("执行原重试方法：[{}],参数为：[{}]", retryerInfo.getExecutorClassName(), JSON.toJSONString(params));

        if (paramTypes.length > 0) {
            return ReflectionUtils.invokeMethod(retryerInfo.getMethod(), retryerInfo.getExecutor(), (Object[]) params);
        } else {
            return ReflectionUtils.invokeMethod(retryerInfo.getMethod(), retryerInfo.getExecutor());
        }
    }
}
