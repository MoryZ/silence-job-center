package com.old.silence.job.common.model;

import com.old.silence.job.common.constant.SystemConstants;


/**
 * silence-job 请求头信息
 *
 */

public class SilenceJobHeaders {

    /**
     * 是否是重试流量
     */
    private boolean isRetry;

    /**
     * 重试下发的ID
     */
    private String retryId;

    /**
     * 调用链超时时间 单位毫秒(ms)
     */
    private long ddl = SystemConstants.DEFAULT_DDL;

    public boolean isRetry() {
        return isRetry;
    }

    public void setRetry(boolean retry) {
        isRetry = retry;
    }

    public String getRetryId() {
        return retryId;
    }

    public void setRetryId(String retryId) {
        this.retryId = retryId;
    }

    public long getDdl() {
        return ddl;
    }

    public void setDdl(long ddl) {
        this.ddl = ddl;
    }
}
