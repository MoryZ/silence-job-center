package com.old.silence.job.client.retry.strategy;

import com.old.silence.job.client.retryer.RetryType;
import com.old.silence.job.client.retryer.RetryerResultContext;


public interface RetryStrategy {

    boolean supports(int stage, RetryType retryType);

    RetryerResultContext openRetry(String sceneName, String executorClassName, Object[] params);

}
