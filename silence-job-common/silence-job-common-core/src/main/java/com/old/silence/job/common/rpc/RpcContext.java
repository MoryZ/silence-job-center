package com.old.silence.job.common.rpc;

import io.netty.util.HashedWheelTimer;
import io.netty.util.Timeout;
import io.netty.util.TimerTask;
import org.springframework.scheduling.concurrent.CustomizableThreadFactory;
import com.old.silence.job.common.exception.SilenceJobRemotingTimeOutException;
import com.old.silence.job.common.model.ApiResult;
import com.old.silence.job.common.model.SilenceJobRpcResult;
import com.old.silence.job.log.SilenceJobLog;

import java.util.Objects;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.TimeUnit;

/**
 * 处理RPC超时和回调
 *
 */

public final class RpcContext {

    private RpcContext() {
    }

    private static final HashedWheelTimer WHEEL_TIMER;

    static {
        WHEEL_TIMER = new HashedWheelTimer(
                new CustomizableThreadFactory("silence-job-rpc-timeout-"), 1,
                TimeUnit.SECONDS, 1024);
    }

    private static final ConcurrentMap<Long, SilenceJobFuture> COMPLETABLE_FUTURE = new ConcurrentHashMap<>();

    public static void invoke(long requestId, SilenceJobRpcResult silenceJobRpcResult, boolean timeout) {

        try {
            // 同步请求同步返回
            Optional.ofNullable(COMPLETABLE_FUTURE.remove(requestId))
                    .ifPresent(future -> {
                        if (timeout) {
                            future.completeExceptionally(new SilenceJobRemotingTimeOutException("Request to remote interface timed out."));
                        } else {
                            future.complete(silenceJobRpcResult);
                        }
                    });

        } catch (Exception e) {
            SilenceJobLog.LOCAL.error("回调处理失败 requestId:[{}]", requestId, e);
        }
    }

    public static <R extends ApiResult<Object>> void setFuture(SilenceJobFuture<R> future) {
        if (Objects.nonNull(future)) {
            COMPLETABLE_FUTURE.put(future.getRequestId(), future);
        }

        // 放入时间轮
        WHEEL_TIMER.newTimeout(new TimeoutCheckTask(future.getRequestId()), future.getTimeout(), future.getUnit());
    }

    public static class TimeoutCheckTask implements TimerTask {

        private final long requestId;

        public TimeoutCheckTask(long requestId) {
            this.requestId = requestId;
        }

        @Override
        public void run(Timeout timeout) throws Exception {
            invoke(requestId, new SilenceJobRpcResult(500, "Request to remote interface timed out.", null, requestId), true);
        }
    }

}
