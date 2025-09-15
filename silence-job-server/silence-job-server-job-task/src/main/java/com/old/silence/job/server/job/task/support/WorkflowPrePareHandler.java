package com.old.silence.job.server.job.task.support;

import com.old.silence.platform.job.common.core.enums.JobTaskBatchStatus;
import com.old.silence.platform.job.server.job.task.dto.WorkflowTaskPrepareDTO;

public interface WorkflowPrePareHandler {

    boolean matches(JobTaskBatchStatus status);

    void handler(WorkflowTaskPrepareDTO workflowTaskPrepareDTO);
}
