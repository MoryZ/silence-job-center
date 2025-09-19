package com.old.silence.job.common.alarm.strategy;

import cn.hutool.http.HttpRequest;
import cn.hutool.http.HttpResponse;
import cn.hutool.http.HttpUtil;
import org.springframework.stereotype.Component;
import com.alibaba.fastjson2.JSON;
import com.old.silence.job.common.alarm.AlarmContext;
import com.old.silence.job.common.alarm.attribute.WebhookAttribute;
import com.old.silence.job.common.constant.SystemConstants;
import com.old.silence.job.common.enums.NotifyType;
import com.old.silence.job.log.SilenceJobLog;

import java.util.List;


@Component
public class WebhookAlarm extends AbstractAlarm<AlarmContext> {

    @Override
    public NotifyType getAlarmType() {
        return NotifyType.WEBHOOK;
    }

    @Override
    public boolean syncSendMessage(AlarmContext alarmContext) {

        WebhookAttribute webhookAttribute = JSON.parseObject(alarmContext.getNotifyAttribute(), WebhookAttribute.class);
        try {
            WebhookMessage webhookMessage = new WebhookMessage();
            webhookMessage.setText(alarmContext.getTitle());

            HttpRequest post = HttpUtil.createPost(webhookAttribute.getWebhookUrl());
            HttpRequest request = post.body(JSON.toJSONString(webhookMessage), webhookAttribute.getContentType().getMediaType().toString())
                    .header(SystemConstants.SECRET, webhookAttribute.getSecret());
            HttpResponse execute = request.execute();
            SilenceJobLog.LOCAL.info("发送Webhook告警结果. webHook:[{}]，结果: [{}]", webhookAttribute.getWebhookUrl(), execute.body());
            if (execute.isOk()) {
                return true;
            }
        } catch (Exception e) {
            SilenceJobLog.LOCAL.error("发送Webhook告警异常. webHook:[{}]", webhookAttribute, e);
            return false;
        }
        return true;
    }

    private static class WebhookMessage {

        private String text;

        public String getText() {
            return text;
        }

        public void setText(String text) {
            this.text = text;
        }
    }

    @Override
    public boolean asyncSendMessage(List<AlarmContext> alarmContexts) {
        for (AlarmContext alarmContext : alarmContexts) {
            asyncSendMessage(alarmContext);
        }

        return true;
    }
}
