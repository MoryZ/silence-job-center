package com.old.silence.job.common.alarm.strategy;

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.ContentType;
import cn.hutool.http.HttpRequest;
import cn.hutool.http.HttpResponse;
import cn.hutool.http.HttpUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import com.alibaba.fastjson2.JSON;
import com.old.silence.job.common.alarm.AlarmContext;
import com.old.silence.job.common.alarm.attribute.QiYeWechatAttribute;
import com.old.silence.job.common.enums.NotifyType;
import com.old.silence.job.common.util.DingDingUtils;
import com.old.silence.job.log.SilenceJobLog;

import java.util.List;
import java.util.Map;


/**
 * 企业微信通知
 *
 */
@Component
public class QiYeWechatAlarm extends AbstractAlarm<AlarmContext> {


    public static final String AT_LABEL = "<@{0}>";
    private static final Logger log = LoggerFactory.getLogger(QiYeWechatAlarm.class);

    @Override
    public NotifyType getAlarmType() {
        return NotifyType.WE_COM;
    }

    @Override
    public boolean syncSendMessage(AlarmContext context) {
        try {
            QiYeWechatAttribute qiYeWechatAttribute = JSON.parseObject(context.getNotifyAttribute(), QiYeWechatAttribute.class);
            String webhookUrl = qiYeWechatAttribute.getWebhookUrl();
            if (StrUtil.isBlank(webhookUrl)) {
                log.error("请先配置微信机器人 webhookUrl");
                return false;
            }
            Map<String, Object> map = MapUtil.newHashMap();
            QiYeWechatMessageContent messageContent = new QiYeWechatMessageContent();
            messageContent.setContent(StrUtil.sub(DingDingUtils.getAtText(qiYeWechatAttribute.getAts(), context.getText(), AT_LABEL), 0, 4096));
            map.put("msgtype", "markdown");
            map.put("markdown", messageContent);
            HttpRequest post = HttpUtil.createPost(webhookUrl);
            HttpRequest request = post.body(JSON.toJSONString(map), ContentType.JSON.toString());
            HttpResponse execute = request.execute();
            SilenceJobLog.LOCAL.debug(JSON.toJSONString(execute));
            if (execute.isOk()) {
                return true;
            }
            SilenceJobLog.LOCAL.error("发送企业微信消息失败:{}", execute.body());
            return false;
        } catch (Exception e) {
            log.error("发送企业微信消息失败", e);
            return false;
        }
    }

    @Override
    public boolean asyncSendMessage(List<AlarmContext> alarmContexts) {

        for (AlarmContext alarmContext : alarmContexts) {
            asyncSendMessage(alarmContext);
        }

        return Boolean.TRUE;
    }


    private static class QiYeWechatMessageContent {
        /**
         * markdown内容，最长不超过4096个字节，必须是utf8编码
         */
        private String content;

        public String getContent() {
            return content;
        }

        public void setContent(String content) {
            this.content = content;
        }
    }

}

