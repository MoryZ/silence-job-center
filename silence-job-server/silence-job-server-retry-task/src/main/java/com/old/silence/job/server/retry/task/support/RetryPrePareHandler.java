package com.old.silence.job.server.retry.task.support;

import com.old.silence.platform.job.common.core.enums.RetryTaskStatus;
import com.old.silence.platform.job.server.retry.task.dto.RetryTaskPrepareDTO;


public interface RetryPrePareHandler {

    boolean matches(RetryTaskStatus status);

    void handle(RetryTaskPrepareDTO jobPrepareDTO);
}
