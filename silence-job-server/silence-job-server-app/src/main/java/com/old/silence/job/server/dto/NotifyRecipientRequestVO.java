package com.old.silence.job.server.dto;



import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;



public class NotifyRecipientRequestVO {

    private Long id;

    /**
     * 接收人名称
     */
    @NotBlank(message = "接收人名称不能为空")
    private String recipientName;

    /**
     * 通知类型 1、钉钉 2、邮件 3、企业微信 4 飞书
     */
    @NotNull(message = "通知类型不能为空")
    private Integer notifyType;

    /**
     * 配置属性
     */
    @NotBlank(message = "配置属性不能为空")
    private String notifyAttribute;

    /**
     * 描述
     */
    private String description;
}
