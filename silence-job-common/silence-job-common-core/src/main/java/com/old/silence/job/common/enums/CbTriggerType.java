package com.old.silence.job.common.enums;

import com.old.silence.core.enums.DescribedEnumValue;

public enum CbTriggerType implements DescribedEnumValue<Byte> {

    DELAY_LEVEL(1, "延迟等级"),
    FIX_TIME(2, "固定时间"),
    CRON(3, "CRON表达式"),
    RANDOM(4, "随机等待"),
    ;

    private final Byte value;
    private final String description;

    CbTriggerType(int value, String description) {
        this.value = (byte) value;
        this.description = description;
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
