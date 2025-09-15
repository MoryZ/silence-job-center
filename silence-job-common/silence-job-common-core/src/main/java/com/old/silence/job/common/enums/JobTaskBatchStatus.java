package com.old.silence.job.common.enums;


import com.old.silence.core.enums.EnumValue;

import java.util.List;


public enum JobTaskBatchStatus implements EnumValue<Byte> {

    /**
     * 待处理
     */
    WAITING(1),

    /**
     * 运行中
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

    /**
     * 工作流流转失败状态
     */
    WORKFLOW_DECISION_FAILED_STATUS(98),
    ;

    private final Byte value;

    JobTaskBatchStatus(int value) {
        this.value = (byte) value;
    }

    public static final List<JobTaskBatchStatus> NOT_COMPLETE = List.of(WAITING, RUNNING);

    public static final List<JobTaskBatchStatus> COMPLETED = List.of(SUCCESS, FAIL, STOP, CANCEL);

    public static final List<JobTaskBatchStatus> NOT_SUCCESS = List.of(FAIL, STOP, CANCEL);

    public Byte getValue() {
        return value;
    }
}
