package com.old.silence.job.common.enums;

import com.old.silence.core.enums.EnumValue;

/**
 * 执行器类型枚举
 *
 */
public enum ExecutorType implements EnumValue<Byte> {

    JAVA(1),
    PYTHON(2),
    GO(3),
    ;

    private final Byte value;

    ExecutorType(int value) {
        this.value = (byte) value;
    }

    @Override
    public Byte getValue() {
        return value;
    }
}
