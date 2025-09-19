package com.old.silence.job.client.retry.strategy;

import org.springframework.stereotype.Component;
import com.github.rholder.retry.*;
import com.old.silence.job.client.RetryExecutor;
import com.old.silence.job.client.RetryExecutorParameter;
import com.old.silence.job.client.intercepter.RetrySiteSnapshot;
import com.old.silence.job.client.retryer.RetryType;
import com.old.silence.job.client.retryer.RetryerInfo;
import com.old.silence.job.client.retryer.RetryerResultContext;
import com.old.silence.job.common.enums.RetryResultStatus;
import com.old.silence.job.log.SilenceJobLog;

import java.util.Collections;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.TimeUnit;
import java.util.function.Consumer;

/**
 * 手动执行重试
 *
 */
@Component

public class ManualRetryStrategies extends AbstractRetryStrategies {

    @Override
    protected void setStage() {
        RetrySiteSnapshot.setStage(RetrySiteSnapshot.EnumStage.MANUAL_REPORT.getStage());
    }

    @Override
    protected Consumer<Object> doRetrySuccessConsumer(final RetryerResultContext context) {
        return o -> {
            SilenceJobLog.LOCAL.debug("ManualRetryStrategies doRetrySuccessConsumer ");
        };
    }

    @Override
    protected void error(final RetryerResultContext context) {
        context.setRetryResultStatus(RetryResultStatus.FAILURE);
    }

    @Override
    protected boolean preValidator(final RetryerInfo retryerInfo, final RetryerResultContext resultContext) {

        if (retryerInfo.isForceReport()) {
            return true;
        }

        if (RetrySiteSnapshot.isRunning()) {
            resultContext.setRetryResultStatus(RetryResultStatus.FAILURE);
            resultContext.setMessage("执行重试检验不通过 原因: 存在正在运行的重试任务");
            return false;
        }

        return true;
    }

    @Override
    protected void unexpectedError(final Exception e, final RetryerResultContext retryerResultContext) {
        retryerResultContext.setRetryResultStatus(RetryResultStatus.FAILURE);
    }

    @Override
    protected void success(final RetryerResultContext retryerResultContext) {
        retryerResultContext.setRetryResultStatus(RetryResultStatus.SUCCESS);
    }

    @Override
    protected Consumer<Throwable> doGetRetryErrorConsumer(final RetryerInfo retryerInfo, final Object[] params) {
        return throwable -> {
            SilenceJobLog.LOCAL.debug("ManualRetryStrategies doGetRetryErrorConsumer ");
        };
    }

    @Override
    protected Callable doGetCallable(final RetryExecutor<WaitStrategy, StopStrategy> retryExecutor, Object[] params) {
        RetryerInfo retryerInfo = retryExecutor.getRetryerInfo();
        return () -> doReport(retryerInfo, params);

    }

    @Override
    protected RetryExecutorParameter<WaitStrategy, StopStrategy> getRetryExecutorParameter(RetryerInfo retryerInfo) {
        return new RetryExecutorParameter<WaitStrategy, StopStrategy>() {

            @Override
            public WaitStrategy backOff() {
                return WaitStrategies.fixedWait(500, TimeUnit.MILLISECONDS);
            }

            @Override
            public StopStrategy stop() {
                return StopStrategies.stopAfterAttempt(5);
            }

            @Override
            public List<RetryListener> getRetryListeners() {
                return Collections.singletonList(new RetryListener() {
                    @Override
                    public <V> void onRetry(Attempt<V> attempt) {
                        if (attempt.hasResult()) {
                            SilenceJobLog.LOCAL.info("silence-job 手动创建重试数据成功，第[{}]次调度", attempt.getAttemptNumber());
                        }

                        if (attempt.hasException()) {
                            SilenceJobLog.LOCAL.error("silence-job 手动创建重试数据失败，第[{}]次调度 ", attempt.getAttemptNumber(),
                                    attempt.getExceptionCause());
                        }

                    }
                });
            }
        };
    }

    @Override
    public boolean supports(final int stage, final RetryType retryType) {
        return RetrySiteSnapshot.EnumStage.MANUAL_REPORT.getStage() == stage;
    }
}
