package com.old.silence.job.common.enums;


import com.old.silence.core.enums.EnumValue;

public enum ExpressionTypeEnum implements EnumValue<Byte> {
    SPEL(1),
    AVIATOR(2),
    QL(3);

    private final Byte value;

    ExpressionTypeEnum(int value) {
        this.value = (byte) value;
    }

    @Override
    public Byte getValue() {
        return value;
    }
}
