package com.old.silence.job.common.model;


public class SilenceJobRpcResult extends ApiResult<Object> {

    private long reqId;

    public SilenceJobRpcResult(int status, String message, Object data, long reqId) {
        super(status, message, data);
        this.reqId = reqId;
    }

    public SilenceJobRpcResult() {
    }

    public SilenceJobRpcResult(Object data, long reqId) {
        super(data);
        this.reqId = reqId;
    }

    public long getReqId() {
        return reqId;
    }

    public void setReqId(long reqId) {
        this.reqId = reqId;
    }
}
