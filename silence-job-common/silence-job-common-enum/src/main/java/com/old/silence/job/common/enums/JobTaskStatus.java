package com.old.silence.job.common.enums;

import com.old.silence.core.enums.EnumValue;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;


public enum JobTaskStatus implements EnumValue<Byte> {

    /**
     * 处理中
     */
    RUNNING(2),

    /**
     * 处理成功
     */
    SUCCESS(3),

    /**
     * 处理失败
     */
    FAIL(4),

    /**
     * 任务停止
     */
    STOP(5),

    /**
     * 取消
     */
    CANCEL(6),
    ;

    private final Byte value;

    JobTaskStatus(int value) {
        this.value = (byte) value;
    }

    public static final List<JobTaskStatus> NOT_COMPLETE = Collections.singletonList(RUNNING);

    public static final List<JobTaskStatus> COMPLETED = Arrays.asList(SUCCESS, FAIL, STOP);

    public static final List<JobTaskStatus> NOT_SUCCESS = Arrays.asList(FAIL, STOP);

    @Override
    public Byte getValue() {
        return value;
    }
}
