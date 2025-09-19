package com.old.silence.job.client.executor;

import com.old.silence.job.client.IJobExecutor;
import com.old.silence.job.client.MapHandler;
import com.old.silence.job.client.cache.JobExecutorInfoCache;
import com.old.silence.job.client.dto.JobArgs;
import com.old.silence.job.client.dto.JobExecutorInfo;
import com.old.silence.job.client.dto.MapArgs;
import com.old.silence.job.client.model.ExecuteResult;

import com.old.silence.job.common.exception.SilenceJobMapReduceException;


import org.springframework.util.ReflectionUtils;

import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;



public abstract class AbstractMapExecutor extends AbstractJobExecutor implements IJobExecutor {

    @Override
    protected ExecuteResult doJobExecute(final JobArgs jobArgs) {
        if (jobArgs instanceof MapArgs) {
            return this.doJobMapExecute((MapArgs) jobArgs, getMapHandler());
        }

        throw new SilenceJobMapReduceException("For tasks that are not of type map or map reduce, please do not use the AbstractMapExecutor class.");
    }

    public abstract ExecuteResult doJobMapExecute(MapArgs mapArgs, final MapHandler mapHandler);

    private MapHandler getMapHandler() {
       return (MapHandler) Proxy.newProxyInstance(MapHandler.class.getClassLoader(),
            new Class[]{MapHandler.class}, new MapInvokeHandler());
    }

    protected ExecuteResult invokeMapExecute (MapArgs mapArgs, MapHandler mapHandler) {
        JobExecutorInfo jobExecutorInfo = JobExecutorInfoCache.get(mapArgs.getExecutorInfo());

        if (Objects.isNull(jobExecutorInfo)) {
            throw new SilenceJobMapReduceException("[{}] not found", mapArgs.getExecutorInfo());
        }

        Map<String, Method> mapExecutorMap = Optional.ofNullable(jobExecutorInfo.getMapExecutorMap())
            .orElse(new HashMap<>());
        Method method = mapExecutorMap.get(mapArgs.getTaskName());

        if (Objects.isNull(method)) {
            throw new SilenceJobMapReduceException(
                "[{}#{}] MapTask execution method not found. Please configure the @MapExecutor annotation",
                mapArgs.getExecutorInfo(), mapArgs.getTaskName());

        }

        Class<?>[] paramTypes = method.getParameterTypes();
        if (paramTypes.length == 1) {
            return (ExecuteResult) ReflectionUtils.invokeMethod(method, jobExecutorInfo.getExecutor(), mapArgs);
        } else if (paramTypes.length == 2) {
            return (ExecuteResult) ReflectionUtils.invokeMethod(method, jobExecutorInfo.getExecutor(), mapArgs,
                mapHandler);
        }

        throw new SilenceJobMapReduceException("Executor for [{}] not found", mapArgs.getTaskName());
    }
}
