package com.old.silence.job.common.enums;


import com.old.silence.core.enums.EnumValue;

public enum JobTaskType implements EnumValue<Byte> {

    CLUSTER(1),
    BROADCAST(2),
    SHARDING(3),
    MAP(4),
    MAP_REDUCE(5),
    ;

    private final Byte value;

    JobTaskType(int value) {
        this.value = (byte) value;
    }

    @Override
    public Byte getValue() {
        return value;
    }
}
