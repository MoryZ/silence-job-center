package com.old.silence.job.common.enums;


import com.old.silence.core.enums.EnumValue;

public enum MapReduceStage implements EnumValue<Byte> {
    MAP(1),
    REDUCE(2),
    MERGE_REDUCE(3);

    private final Byte value;

    MapReduceStage(int value) {
        this.value = (byte) value;
    }

    @Override
    public Byte getValue() {
        return value;
    }
}
