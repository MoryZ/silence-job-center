package com.old.silence.job.server.job.task.support.executor.job;

import org.springframework.stereotype.Component;
import com.old.silence.platform.job.common.core.enums.JobTaskType;


@Component
public class MapJobExecutor extends MapReduceJobExecutor {

    @Override
    public JobTaskType getTaskInstanceType() {
        return JobTaskType.MAP;
    }

    @Override
    protected void doExecute(final JobExecutorContext context) {
        super.doExecute(context);
    }
}
