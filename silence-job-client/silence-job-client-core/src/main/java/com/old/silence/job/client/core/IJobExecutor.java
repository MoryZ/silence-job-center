package com.old.silence.job.client.core;


import com.old.silence.platform.job.common.core.model.JobContext;

/**
 * job执行者
 *
 */
public interface IJobExecutor {

    void jobExecute(JobContext jobContext);
}
