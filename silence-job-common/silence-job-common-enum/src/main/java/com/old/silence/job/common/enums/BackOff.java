package com.old.silence.job.common.enums;


import java.util.Objects;

import com.old.silence.core.enums.DescribedEnumValue;


public enum BackOff implements DescribedEnumValue<Byte> {

    DEFAULT_LEVEL(1, "默认等级"),
    FIXED_INTERVAL_TIME(2, "固定间隔时间"),
    CRON_EXPRESSION(3, "CRON 表达式"),
    RANDOM(4, "随机");

    private final Byte value;
    private final String description;

    BackOff(int value, String description) {
        this.value = (byte) value;
        this.description = description;
    }

    public static BackOff valueOf(Integer code) {
        for (BackOff failStrategy : BackOff.values()) {
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
