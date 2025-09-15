package com.old.silence.job.common.enums;

import com.old.silence.core.enums.EnumValue;

import java.util.List;

/**
 * 重试状态终态枚举
 *
 */
public enum RetryStatus implements EnumValue<Byte> {

    /**
     * 重试中
     */
    RUNNING(0),

    /**
     * 重试完成
     */
    FINISH(1),

    /**
     * 到达最大次数
     */
    MAX_COUNT(2),

    /**
     * 暂停重试
     */
    SUSPEND(3);

    private final Byte value;

    RetryStatus(int value) {
        this.value = (byte) value;
    }

    public static final List<RetryStatus> ALLOW_DELETE_STATUS =
            List.of(RetryStatus.FINISH, RetryStatus.MAX_COUNT, RetryStatus.SUSPEND);


    public Byte getValue() {
        return value;
    }
}
