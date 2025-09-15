package com.old.silence.job.common.enums;

import com.old.silence.core.enums.EnumValue;

public enum TriggerType implements EnumValue<Byte> {

    SCHEDULED_TIME(2),
    CRON(3),
    WORK_FLOW(99);

    private final Byte value;

    TriggerType(int value) {
        this.value = (byte) value;
    }

    @Override
    public Byte getValue() {
        return value;
    }
}
