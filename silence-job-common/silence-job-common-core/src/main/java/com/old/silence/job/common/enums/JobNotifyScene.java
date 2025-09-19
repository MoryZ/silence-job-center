package com.old.silence.job.common.enums;


import com.old.silence.core.enums.DescribedEnumValue;

/**
 * 通知场景枚举
 *
 */
public enum JobNotifyScene implements DescribedEnumValue<Byte> {

    /********************************Job****************************************/
    NONE(0, "", NodeType.SERVER),
    JOB_TASK_ERROR(1, "JOB任务执行失败", NodeType.SERVER),
    JOB_CLIENT_ERROR(2, "客户端执行失败", NodeType.CLIENT),
    JOB_NO_CLIENT_NODES_ERROR(3, "没有可执行的客户端节点", NodeType.SERVER),

    RETRY_TASK_FAIL_ERROR(5, "任务重试失败", NodeType.SERVER),
    RETRY_NO_CLIENT_NODES_ERROR(7, "任务重试失败（没有可执行的客户端节点）", NodeType.SERVER),


    /********************************Workflow****************************************/
    WORKFLOW_TASK_ERROR(100, "Workflow任务执行失败", NodeType.SERVER);

    /**
     * 通知场景
     */
    private final Byte value;

    /**
     * 描述
     */
    private final String description;

    /**
     * 触发通知节点类型
     */
    private final NodeType nodeType;

    JobNotifyScene(int value, String description, NodeType nodeType) {
        this.value = (byte) value;
        this.description = description;
        this.nodeType = nodeType;
    }

    public Byte getValue() {
        return value;
    }

    public String getDescription() {
        return description;
    }

    public NodeType getNodeType() {
        return nodeType;
    }
}
