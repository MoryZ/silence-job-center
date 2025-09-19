package com.old.silence.job.common.enums;


import java.util.List;

import com.old.silence.core.enums.DescribedEnumValue;

/**
 * 标识某个操作的具体原因
 *
 */
public enum JobOperationReason implements DescribedEnumValue<Byte> {

    NONE(0, ""),
    TASK_EXECUTION_TIMEOUT(1, "任务执行超时"),
    NOT_CLIENT(2, "无客户端节点"),
    JOB_CLOSED(3, "JOB已关闭"),
    JOB_DISCARD(4, "任务丢弃"),
    JOB_OVERLAY(5, "任务被覆盖"),
    NOT_EXECUTION_TASK(6, "无可执行任务项"),
    TASK_EXECUTION_ERROR(7, "任务执行期间发生非预期异常"),
    MANNER_STOP(8, "手动停止"),
    WORKFLOW_CONDITION_NODE_EXECUTION_ERROR(9, "条件节点执行异常"),
    JOB_TASK_INTERRUPTED(10, "任务中断"),
    WORKFLOW_CALLBACK_NODE_EXECUTION_ERROR(11, "回调节点执行异常"),
    WORKFLOW_NODE_NO_REQUIRED(12, "无需处理"),
    WORKFLOW_NODE_CLOSED_SKIP_EXECUTION(13, "节点关闭跳过执行"),
    WORKFLOW_DECISION_FAILED(14, "判定未通过"),


    ;

    private final Byte value;
    private final String description;

    JobOperationReason(int value, String description) {
        this.value = (byte) value;
        this.description = description;
    }

    /**
     * 工作流后续节点跳过执行配置
     */
    public static final List<JobOperationReason> WORKFLOW_SUCCESSOR_SKIP_EXECUTION = List.of(
            WORKFLOW_NODE_NO_REQUIRED, WORKFLOW_DECISION_FAILED,
            WORKFLOW_CONDITION_NODE_EXECUTION_ERROR);

    public Byte getValue() {
        return value;
    }

    public String getDescription() {
        return description;
    }
}
