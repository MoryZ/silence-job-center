package com.old.silence.job.common.rpc;




import com.old.silence.job.common.model.ApiResult;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;


public class SilenceJobFuture<R extends ApiResult<Object>> extends CompletableFuture<R> {
    private final long requestId;
    private final long timeout;
    private final TimeUnit unit;



    public SilenceJobFuture(long requestId, long timeout, TimeUnit unit) {
        this.requestId = requestId;
        this.timeout = timeout;
        this.unit = unit;
    }

    public static <R extends ApiResult<Object>> SilenceJobFuture<R> newFuture(long requestId, long timeout, TimeUnit unit) {
        return new SilenceJobFuture<>(requestId, timeout, unit);
    }

    public long getRequestId() {
        return requestId;
    }

    public long getTimeout() {
        return timeout;
    }

    public TimeUnit getUnit() {
        return unit;
    }
}
