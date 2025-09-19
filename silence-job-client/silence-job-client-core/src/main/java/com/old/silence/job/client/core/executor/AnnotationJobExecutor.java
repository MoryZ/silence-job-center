package com.old.silence.job.client.executor;

import com.old.silence.job.client.cache.JobExecutorInfoCache;
import com.old.silence.job.client.dto.JobArgs;
import com.old.silence.job.client.dto.JobExecutorInfo;
import com.old.silence.job.client.model.ExecuteResult;
import org.springframework.stereotype.Component;
import org.springframework.util.ReflectionUtils;

/**
 * 基于注解的执行器
 *
 */
@Component
public class AnnotationJobExecutor extends AbstractJobExecutor {

    @Override
    protected ExecuteResult doJobExecute(JobArgs jobArgs) {
        JobExecutorInfo jobExecutorInfo = JobExecutorInfoCache.get(jobArgs.getExecutorInfo());
        Class<?>[] paramTypes = jobExecutorInfo.getMethod().getParameterTypes();

        if (paramTypes.length > 0) {
            return (ExecuteResult) ReflectionUtils.invokeMethod(jobExecutorInfo.getMethod(), jobExecutorInfo.getExecutor(), jobArgs);
        } else {
            return (ExecuteResult) ReflectionUtils.invokeMethod(jobExecutorInfo.getMethod(), jobExecutorInfo.getExecutor());
        }
    }
}
