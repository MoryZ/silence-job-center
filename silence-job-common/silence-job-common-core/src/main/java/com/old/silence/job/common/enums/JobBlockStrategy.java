package com.old.silence.job.common.enums;

import com.old.silence.core.enums.EnumValue;

/**
 * 阻塞策略针对处于待处理 or 运行中的批次做了一种异常容错策略
 *
 */

public enum JobBlockStrategy implements EnumValue<Byte> {

    /**
     * 不创建新的批次，等待当前批次执行完成
     */
    DISCARD(1),
    /**
     * 停止当前的批次，然后新增一个新的批次
     */
    OVERLAY(2),
    /**
     * 每次都创建一个新的批次
     */
    CONCURRENCY(3),
    /**
     * 不创建新的批次, 重新执行当前的批次中已经失败的任务
     * (若是工作流。则是重新触发工作流节点)
     */
    RECOVERY(4)
    ;

    private final Byte value;

    JobBlockStrategy(int value) {
        this.value = (byte) value;
    }

    public static JobBlockStrategy valueOf(int blockStrategy) {
        for (JobBlockStrategy blockStrategyEnum : JobBlockStrategy.values()) {
            if (blockStrategyEnum.value.intValue() == blockStrategy) {
                return blockStrategyEnum;
            }
        }

        return null;
    }

    public Byte getValue() {
        return value;
    }
}
