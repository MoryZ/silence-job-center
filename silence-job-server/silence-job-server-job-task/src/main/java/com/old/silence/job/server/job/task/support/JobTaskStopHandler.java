package com.old.silence.job.server.job.task.support;

import com.old.silence.platform.job.common.core.enums.JobTaskType;
import com.old.silence.platform.job.server.job.task.support.stop.TaskStopJobContext;


public interface JobTaskStopHandler {

    JobTaskType getTaskType();

    void stop(TaskStopJobContext context);

}
