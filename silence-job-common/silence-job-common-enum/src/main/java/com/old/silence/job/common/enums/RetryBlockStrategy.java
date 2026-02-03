package com.old.silence.job.common.enums;

import com.old.silence.core.enums.EnumValue;

/**
 * 阻塞策略针对处于待处理 or 运行中的重试任务做了一种异常容错策略
 *
 */

public enum RetryBlockStrategy implements EnumValue<Byte> {

    /**
     * 不创建新的重试任务，等待当前重试任务执行完成
     */
    DISCARD(1),
    /**
     * 停止当前的重试任务，然后新增一个新的重试任务
     */
    OVERLAY(2),
    /**
     * 每次都创建一个新的重试任务
     */
    CONCURRENCY(3),
    ;

    private final Byte value;

    RetryBlockStrategy(int value) {
        this.value = (byte) value;
    }

    @Override
    public Byte getValue() {
        return value;
    }
}
