package com.old.silence.job.common.enums;

import com.old.silence.core.enums.EnumValue;

/**
 * id生成模式
 *
 */

public enum IdGeneratorMode implements EnumValue<Byte> {

    SEGMENT(1, "号段模式"),
    SNOWFLAKE(2, "雪花算法模式");

    private final Byte value;

    private final String description;

    IdGeneratorMode(int value, String description) {
        this.value = (byte) value;
        this.description = description;
    }

    @Override
    public Byte getValue() {
        return value;
    }

    public String getDescription() {
        return description;
    }
}
