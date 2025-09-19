package com.old.silence.job.common.enums;


import com.old.silence.core.enums.DescribedEnumValue;

/**
 * 通知场景枚举
 *
 */

public enum RetryNotifyScene implements DescribedEnumValue<Byte> {

    NONE(0, "", NodeType.SERVER),

    MAX_RETRY(1, "场景重试数量超过阈值", NodeType.SERVER),

    MAX_RETRY_ERROR(2, "场景重试失败数量超过阈值", NodeType.SERVER),

    CLIENT_REPORT_ERROR(3, "客户端上报失败", NodeType.CLIENT),

    CLIENT_COMPONENT_ERROR(4, "客户端组件异常", NodeType.CLIENT),

    RETRY_TASK_FAIL_ERROR(5, "任务重试失败", NodeType.SERVER),

    RETRY_TASK_ENTER_DEAD_LETTER(6, "任务重试失败进入死信队列", NodeType.SERVER),

    RETRY_NO_CLIENT_NODES_ERROR(7, "任务重试失败（没有可执行的客户端节点）", NodeType.SERVER)
    ;

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

    RetryNotifyScene(int value, String description, NodeType nodeType) {
        this.value = (byte) value;
        this.description = description;
        this.nodeType = nodeType;
    }

    public static RetryNotifyScene getNotifyScene(Byte value, NodeType nodeType) {
        for (RetryNotifyScene retryNotifyScene : values()) {
            if (retryNotifyScene.getValue().equals(value) && retryNotifyScene.getNodeType().equals(nodeType)) {
                return retryNotifyScene;
            }
        }
        return null;
    }

    @Override
    public Byte getValue() {
        return value;
    }

    @Override
    public String getDescription() {
        return description;
    }

    public NodeType getNodeType() {
        return nodeType;
    }
}
