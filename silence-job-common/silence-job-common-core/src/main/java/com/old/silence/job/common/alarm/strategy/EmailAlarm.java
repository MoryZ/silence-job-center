package com.old.silence.job.common.alarm.strategy;

import cn.hutool.core.util.ObjUtil;

import org.springframework.stereotype.Component;
import com.alibaba.fastjson2.JSON;
import com.old.silence.job.common.alarm.AlarmContext;
import com.old.silence.job.common.alarm.attribute.EmailAttribute;
import com.old.silence.job.common.alarm.email.MailAccount;
import com.old.silence.job.common.alarm.email.SilenceJobMailProperties;
import com.old.silence.job.common.enums.NotifyType;
import com.old.silence.job.common.util.MailUtils;
import com.old.silence.job.log.SilenceJobLog;

import java.util.List;
import java.util.Objects;
import java.util.Optional;


@Component
public class EmailAlarm extends AbstractAlarm<AlarmContext> {
    private final SilenceJobMailProperties silenceJobMailProperties;
    private MailAccount mailAccount;

    public EmailAlarm(SilenceJobMailProperties silenceJobMailProperties) {
        this.silenceJobMailProperties = silenceJobMailProperties;
    }

    @Override
    public NotifyType getAlarmType() {
        return NotifyType.EMAIL;
    }

    @Override
    public boolean syncSendMessage(AlarmContext alarmContext) {
        if (Objects.isNull(mailAccount)) {
            SilenceJobLog.LOCAL.warn("请检查邮件配置是否开启");
            return false;
        }

        try {
            String notifyAttribute = alarmContext.getNotifyAttribute();
            EmailAttribute emailAttribute = JSON.parseObject(notifyAttribute, EmailAttribute.class);
            String text = alarmContext.getText();
            text = text.replaceAll("\n", "<br/>");
            MailUtils.send(mailAccount, emailAttribute.getTos(), alarmContext.getTitle(), text, true);
        } catch (Exception e) {
            SilenceJobLog.LOCAL.error("发送email消息失败:", e);
            return false;
        }

        return true;
    }

    @Override
    public boolean asyncSendMessage(List<AlarmContext> alarmContexts) {
        for (AlarmContext alarmContext : alarmContexts) {
            asyncSendMessage(alarmContext);
        }

        return Boolean.TRUE;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        super.afterPropertiesSet();
        Boolean enabled = silenceJobMailProperties.getEnabled();
        if (Objects.isNull(enabled) || Boolean.FALSE.equals(enabled)) {
            return;
        }

        mailAccount = initMailAccount(silenceJobMailProperties);
        MailUtils.setMailAccount(mailAccount);
    }

    private MailAccount initMailAccount(SilenceJobMailProperties silenceJobMailProperties) {
        MailAccount account = new MailAccount();
        account.setHost(silenceJobMailProperties.getHost());
        account.setPort(silenceJobMailProperties.getPort());
        account.setAuth(Optional.ofNullable(silenceJobMailProperties.getAuth()).orElse(Boolean.FALSE));
        account.setFrom(silenceJobMailProperties.getFrom());
        account.setUser(silenceJobMailProperties.getUser());
        account.setPass(silenceJobMailProperties.getPass());
        account.setSocketFactoryPort(Optional.ofNullable(silenceJobMailProperties.getPort()).orElse(465));
        account.setStarttlsEnable(Optional.ofNullable(silenceJobMailProperties.getStarttlsEnable()).orElse(Boolean.FALSE));
        account.setSslEnable(Optional.ofNullable(silenceJobMailProperties.getSslEnable()).orElse(Boolean.FALSE));
        account.setTimeout(Optional.ofNullable(silenceJobMailProperties.getTimeout()).orElse(0L));
        account.setConnectionTimeout(Optional.ofNullable(silenceJobMailProperties.getConnectionTimeout()).orElse(0L));

        if (ObjUtil.isNotEmpty(silenceJobMailProperties.getProperties())) {
            silenceJobMailProperties.getProperties().forEach(account::setCustomProperty);
        }

        return account;
    }
}

