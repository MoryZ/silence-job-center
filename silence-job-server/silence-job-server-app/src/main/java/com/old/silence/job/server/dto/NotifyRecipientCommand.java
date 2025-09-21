package com.old.silence.job.server.dto;



import java.math.BigInteger;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.old.silence.job.common.enums.NotifyType;


public class NotifyRecipientCommand {

    private BigInteger id;

    /**
     * 接收人名称
     */
    @NotBlank(message = "接收人名称不能为空")
    private String recipientName;

    /**
     * 通知类型 1、钉钉 2、邮件 3、企业微信 4 飞书
     */
    @NotNull(message = "通知类型不能为空")
    private NotifyType notifyType;

    /**
     * 配置属性
     */
    @NotBlank(message = "配置属性不能为空")
    private String notifyAttribute;

    /**
     * 描述
     */
    private String description;

    public BigInteger getId() {
        return id;
    }

    public void setId(BigInteger id) {
        this.id = id;
    }

    public @NotBlank(message = "接收人名称不能为空") String getRecipientName() {
        return recipientName;
    }

    public void setRecipientName(@NotBlank(message = "接收人名称不能为空") String recipientName) {
        this.recipientName = recipientName;
    }

    public @NotNull(message = "通知类型不能为空") NotifyType getNotifyType() {
        return notifyType;
    }

    public void setNotifyType(@NotNull(message = "通知类型不能为空") NotifyType notifyType) {
        this.notifyType = notifyType;
    }

    public @NotBlank(message = "配置属性不能为空") String getNotifyAttribute() {
        return notifyAttribute;
    }

    public void setNotifyAttribute(@NotBlank(message = "配置属性不能为空") String notifyAttribute) {
        this.notifyAttribute = notifyAttribute;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
