package com.old.silence.job.common.model;


import com.alibaba.fastjson2.JSON;

import java.util.concurrent.atomic.AtomicLong;


public class SilenceJobRequest {

    private static final AtomicLong REQUEST_ID = new AtomicLong(0);

    private long reqId;

    private Object[] args;

    public SilenceJobRequest(Object... args) {
        this.args = args;
        this.reqId = newId();
    }

    private static long newId() {
        return REQUEST_ID.getAndIncrement();
    }

    public SilenceJobRequest() {
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }

    public long getReqId() {
        return reqId;
    }

    public void setReqId(long reqId) {
        this.reqId = reqId;
    }

    public Object[] getArgs() {
        return args;
    }

    public void setArgs(Object[] args) {
        this.args = args;
    }
}
