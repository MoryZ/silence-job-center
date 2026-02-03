package com.old.silence.job.common.enums;


import com.old.silence.core.enums.EnumValue;

/**
 * 服务节点类型
 *
 */
public enum NodeType implements EnumValue<Byte> {

    /**
     * 客户端
     */
    CLIENT(1),

    /**
     * 服务端
     */
    SERVER(2),
    ;

    private final Byte value;

    NodeType(int value) {
        this.value = (byte) value;
    }

    @Override
    public Byte getValue() {
        return value;
    }
}
