package com.old.silence.job.common.enums;


import java.util.Objects;

import com.old.silence.core.enums.DescribedEnumValue;


public enum FailStrategy implements DescribedEnumValue<Byte> {

    SKIP(1, "跳过"),
    BLOCK(2, "阻塞");

    private final Byte value;
    private final String description;

    FailStrategy(int value, String description) {
        this.value = (byte) value;
        this.description = description;
    }

    public static FailStrategy valueOf(Integer code) {
        for (FailStrategy failStrategy : FailStrategy.values()) {
            if (Objects.equals(failStrategy.value.intValue(), code)) {
                return failStrategy;
            }
        }

        return null;
    }

    @Override
    public Byte getValue() {
        return value;
    }

    @Override
    public String getDescription() {
        return description;
    }
}
