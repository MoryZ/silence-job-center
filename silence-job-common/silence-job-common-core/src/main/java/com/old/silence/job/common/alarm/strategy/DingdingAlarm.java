package com.old.silence.job.common.alarm.strategy;

import org.springframework.stereotype.Component;
import com.alibaba.fastjson2.JSON;
import com.old.silence.job.common.alarm.AlarmContext;
import com.old.silence.job.common.alarm.attribute.DingDingAttribute;
import com.old.silence.job.common.enums.NotifyType;
import com.old.silence.job.common.util.DingDingUtils;

import java.util.List;


@Component
public class DingdingAlarm extends AbstractAlarm<AlarmContext> {

    @Override
    public NotifyType getAlarmType() {
        return NotifyType.DING_DING;
    }

    @Override
    public boolean syncSendMessage(AlarmContext context) {
        DingDingAttribute dingDingAttribute = JSON.parseObject(context.getNotifyAttribute(), DingDingAttribute.class);
        return DingDingUtils.sendMessage(DingDingUtils.buildSendRequest(context.getTitle(), context.getText(), dingDingAttribute.getAts()), dingDingAttribute.getWebhookUrl());
    }

    @Override
    public boolean asyncSendMessage(List<AlarmContext> alarmContexts) {

        for (AlarmContext alarmContext : alarmContexts) {
            asyncSendMessage(alarmContext);
        }

        return Boolean.TRUE;
    }
}

