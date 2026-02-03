package com.old.silence.job.common.enums;

/**
 * @author moryzang
 */

import com.old.silence.core.enums.DescribedEnumValue;

/**
 * 1、任务节点 2、条件节点 3、回调节点
 *
 */
public enum WorkflowNodeType implements DescribedEnumValue<Byte> {
    JOB_TASK(1, "JOB任务"),
    DECISION(2, "决策节点"),
    CALLBACK(3, "回调节点"),
    ;

    private final Byte value;
    private final String description;

    WorkflowNodeType(int value, String description) {
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