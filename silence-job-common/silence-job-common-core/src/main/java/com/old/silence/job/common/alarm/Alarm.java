package com.old.silence.job.common.alarm;

import com.old.silence.job.common.enums.NotifyType;

import java.util.List;


public interface Alarm<T> {

    NotifyType getAlarmType();

    boolean asyncSendMessage(T t);

    boolean syncSendMessage(T t);

    boolean asyncSendMessage(List<T> ts);
}
