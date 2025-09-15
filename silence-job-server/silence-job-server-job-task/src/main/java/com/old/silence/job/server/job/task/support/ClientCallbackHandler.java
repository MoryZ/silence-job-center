package com.old.silence.job.server.job.task.support;

import com.old.silence.platform.job.common.core.enums.JobTaskType;
import com.old.silence.platform.job.server.job.task.support.callback.ClientCallbackContext;


public interface ClientCallbackHandler {

    JobTaskType getTaskInstanceType();

    void callback(ClientCallbackContext context);
}
