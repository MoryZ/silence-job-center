package com.old.silence.job.common.enums;


import com.old.silence.core.enums.DescribedEnumValue;

/**
 * 标识某个操作的具体原因
 *
 */

public enum RetryOperationReason implements DescribedEnumValue<Byte> {

    NONE(0, ""),
    TASK_EXECUTION_TIMEOUT(1, "任务执行超时"),
    NOT_CLIENT(2, "无客户端节点"),
    RETRY_SUSPEND(3, "重试已暂停"),
    RETRY_TASK_DISCARD(4, "任务丢弃"),
    RETRY_TASK_OVERLAY(5, "任务被覆盖"),
    TASK_EXECUTION_ERROR(6, "任务执行期间发生非预期异常"),
    MANNER_STOP(7, "手动停止"),
    NOT_RUNNING_RETRY(8, "当前重试非运行中"),
    SCENE_CLOSED(9, "当前场景已关闭"),
    RETRY_FAIL(10, "重试失败"),
    CLIENT_TRIGGER_RETRY_STOP(11, "客户端触发任务停止"),
    ;

    private final Byte value;
    private final String description;

    RetryOperationReason(int value, String description) {
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
