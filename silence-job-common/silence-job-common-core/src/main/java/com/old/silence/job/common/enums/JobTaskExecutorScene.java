package com.old.silence.job.common.enums;


import com.old.silence.core.enums.EnumValue;

/**
 * job 触发器类型枚举
 *
 */

public enum JobTaskExecutorScene implements EnumValue<Byte> {
    AUTO_JOB(1, SystemTaskType.JOB),
    MANUAL_JOB(2, SystemTaskType.JOB),
    AUTO_WORKFLOW(3, SystemTaskType.WORKFLOW),
    MANUAL_WORKFLOW(4, SystemTaskType.WORKFLOW),
    ;

    private final Byte value;
    private final SystemTaskType systemTaskType;

    JobTaskExecutorScene(int value, SystemTaskType systemTaskType) {
        this.value = (byte) value;
        this.systemTaskType = systemTaskType;
    }

    @Override
    public Byte getValue() {
        return value;
    }

    public SystemTaskType getSystemTaskType() {
        return systemTaskType;
    }
}
