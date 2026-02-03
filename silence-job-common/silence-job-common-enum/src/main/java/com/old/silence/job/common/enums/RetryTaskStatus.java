package com.old.silence.job.common.enums;

import org.springframework.lang.NonNull;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.Set;

import com.old.silence.core.enums.EnumValue;

/**
 * 重试任务状态终态枚举
 *
 */
public enum RetryTaskStatus implements EnumValue<Byte> {

    /**
     * 待处理
     */
    WAITING(1),

    /**
     * 重试中
     */
    RUNNING(2),

    /**
     * 重试完成
     */
    SUCCESS(3),

    /**
     * 重试失败
     */
    FAIL(4),

    /**
     * 任务停止
     */
    STOP(5),

    /**
     * 取消
     */
    CANCEL(6),
    ;

    private final Byte value;

    RetryTaskStatus(int value) {
        this.value = (byte) value;
    }

    public static final List<Byte> NOT_COMPLETE = Arrays.asList(WAITING.value, RUNNING.value);

    public static final Set<RetryTaskStatus> TERMINAL_STATUS_SET = Set.of(SUCCESS, FAIL,
            STOP, CANCEL);

    public static final Set<RetryTaskStatus> NOT_SUCCESS = Set.of(FAIL, STOP, CANCEL);

    public static RetryTaskStatus getByStatus(@NonNull RetryTaskStatus status) {
        for (RetryTaskStatus retryTaskStatus : RetryTaskStatus.values()) {
            if (Objects.equals(retryTaskStatus, status)) {
                return retryTaskStatus;
            }
        }
        return null;
    }

    @Override
    public Byte getValue() {
        return value;
    }
}
