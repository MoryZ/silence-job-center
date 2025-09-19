package com.old.silence.job.common.enums;


import com.old.silence.core.enums.EnumValue;

/**
 * 重试结果状态
 *
 */

public enum RetryResultStatus implements EnumValue<Byte> {

    SUCCESS(0),
    STOP(1),
    FAILURE(2);

    private final Byte value;

    RetryResultStatus(int value) {
        this.value = (byte) value;
    }

    @Override
    public Byte getValue() {
        return value;
    }
}
