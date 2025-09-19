package com.old.silence.job.common.enums;


import com.old.silence.core.enums.DescribedEnumValue;

/**
 * 通知场景枚举
 *
 */
public enum JobNotifyType implements DescribedEnumValue<Byte> {

    /********************************Job****************************************/
    RETRY_TASK(1, "重试任务"),
    RETRY_CALLBACK(2, "重试回调"),
    JOB_TASK(3, "JOB任务"),
    WORKFLOW_TASK(4, "WORKFLOW 任务"),
    ;


    /**
     * 通知类型
     */
    private final Byte value;

    /**
     * 描述
     */
    private final String description;

    JobNotifyType(int value, String description) {
        this.value = (byte) value;
        this.description = description;
    }

    public Byte getValue() {
        return value;
    }

    public String getDescription() {
        return description;
    }


}
