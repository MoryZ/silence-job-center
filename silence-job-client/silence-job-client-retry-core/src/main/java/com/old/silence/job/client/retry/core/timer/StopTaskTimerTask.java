package com.old.silence.job.client.retry.timer;

import io.netty.util.Timeout;
import io.netty.util.TimerTask;
import com.old.silence.job.client.cache.FutureCache;

import java.math.BigInteger;


public class StopTaskTimerTask implements TimerTask {

    private BigInteger retryTaskId;

    public StopTaskTimerTask(BigInteger retryTaskId) {
        this.retryTaskId = retryTaskId;
    }

    @Override
    public void run(Timeout timeout) throws Exception {
        FutureCache.remove(retryTaskId);
    }
}
