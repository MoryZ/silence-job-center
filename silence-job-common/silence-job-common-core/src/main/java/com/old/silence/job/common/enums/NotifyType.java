package com.old.silence.job.common.enums;


import com.old.silence.core.enums.DescribedEnumValue;

/**
 * 通知场景枚举
 *
 */
public enum NotifyType implements DescribedEnumValue<Byte> {

    /********************************Job****************************************/
    DING_DING(1, "钉钉"),
    EMAIL(2, "邮件"),
    WE_COM(3, "企业微信"),
    LARK(4, "飞书"),
    WEBHOOK(5, "webhook"),
    ;


    /**
     * 通知类型
     */
    private final Byte value;

    /**
     * 描述
     */
    private final String description;

    NotifyType(int value, String description) {
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
