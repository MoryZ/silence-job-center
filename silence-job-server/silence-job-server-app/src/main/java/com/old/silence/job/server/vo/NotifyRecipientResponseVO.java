package com.old.silence.job.server.vo;



import java.time.Instant;



public class NotifyRecipientResponseVO {

    private Long id;

    /**
     * 接收人名称
     */
    private String recipientName;

    /**
     * 通知类型 1、钉钉 2、邮件 3、企业微信 4 飞书
     */
    private Integer notifyType;

    /**
     * 配置属性
     */
    private String notifyAttribute;

    /**
     * 描述
     */
    private String description;

    /**
     * 创建时间
     */
    private Instant createdDate;

}
