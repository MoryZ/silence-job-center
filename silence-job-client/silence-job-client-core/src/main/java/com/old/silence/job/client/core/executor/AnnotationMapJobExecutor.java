package com.old.silence.job.client.executor;

import com.old.silence.job.client.MapHandler;
import com.old.silence.job.client.dto.MapArgs;
import com.old.silence.job.client.executor.AbstractMapExecutor;
import com.old.silence.job.client.model.ExecuteResult;
import org.springframework.stereotype.Component;

/**
 * 基于注解的Map任务执行器
 *
 */
@Component
public class AnnotationMapJobExecutor extends AbstractMapExecutor {

    @Override
    public ExecuteResult doJobMapExecute(final MapArgs mapArgs, final MapHandler mapHandler) {
        return invokeMapExecute(mapArgs, mapHandler);
    }
}
