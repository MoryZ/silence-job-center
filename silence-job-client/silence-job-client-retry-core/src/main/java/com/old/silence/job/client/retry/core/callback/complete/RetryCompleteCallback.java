package com.old.silence.job.client.retry.callback.complete;


public interface RetryCompleteCallback {

    void doSuccessCallback(String sceneName, String executorName, Object[] params);

    void doMaxRetryCallback(String sceneName, String executorName, Object[] params);
}
