package com.old.silence.job.common.alarm.attribute;



import com.old.silence.job.common.enums.ContentType;


public class WebhookAttribute {

    /**
     * webhook
     */
    private String webhookUrl;

    /**
     * 请求类型
     */
    private ContentType contentType;

    /**
     * 秘钥
     */
    private String secret;

    public String getWebhookUrl() {
        return webhookUrl;
    }

    public void setWebhookUrl(String webhookUrl) {
        this.webhookUrl = webhookUrl;
    }

    public ContentType getContentType() {
        return contentType;
    }

    public void setContentType(ContentType contentType) {
        this.contentType = contentType;
    }

    public String getSecret() {
        return secret;
    }

    public void setSecret(String secret) {
        this.secret = secret;
    }
}
