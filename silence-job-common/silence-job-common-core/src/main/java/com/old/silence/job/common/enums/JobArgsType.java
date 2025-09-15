package com.old.silence.job.common.enums;


import com.old.silence.core.enums.DescribedEnumValue;

public enum JobArgsType implements DescribedEnumValue<Byte> {
    TEXT(1, "文本"),
    JSON(2, "JSON");

    private final Byte value;
    private final String description;

    JobArgsType(int value, String description) {
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
