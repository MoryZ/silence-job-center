package com.old.silence.job.common.alarm.strategy;

import org.springframework.beans.factory.InitializingBean;
import com.old.silence.job.common.alarm.Alarm;
import com.old.silence.job.common.alarm.SilenceJobAlarmFactory;

import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;


public abstract class AbstractAlarm<T> implements Alarm<T>, InitializingBean {

    protected static ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(3, 10, 1, TimeUnit.SECONDS, new LinkedBlockingQueue<>());

    @Override
    public void afterPropertiesSet() throws Exception {
        SilenceJobAlarmFactory.register(this);
    }

    @Override
    public boolean asyncSendMessage(T t) {
        threadPoolExecutor.execute(() -> syncSendMessage(t));
        return true;
    }

}
