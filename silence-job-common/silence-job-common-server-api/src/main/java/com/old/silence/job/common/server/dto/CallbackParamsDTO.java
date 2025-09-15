package com.old.silence.job.common.server.dto;



/**
 * 工作流回调节点参数模型
 *
 */

public class CallbackParamsDTO {

    /**
     * 工作流上下文
     */
    private String wfContext;

    public String getWfContext() {
        return wfContext;
    }

    public void setWfContext(String wfContext) {
        this.wfContext = wfContext;
    }
}
