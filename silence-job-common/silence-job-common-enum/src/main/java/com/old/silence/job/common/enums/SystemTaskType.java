package com.old.silence.job.common.enums;

import com.old.silence.core.enums.EnumValue;

/**
 * @author moryzang
 */
public enum SystemTaskType implements EnumValue<Byte> {
    RETRY(1),
    CALLBACK(2),
    JOB(3),
    WORKFLOW(4),
    ;


    private final Byte value;

    SystemTaskType(int value) {
        this.value = (byte) value;
    }

    public Byte getValue() {
        return value;
    }

}