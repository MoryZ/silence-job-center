package com.old.silence.job.common.server.dto;



import java.io.Serializable;

/**
 * 重试上报DTO
 *
 */

public class RetryTaskDTO implements Serializable {

    /**
     * groupName
     */
    private String groupName;

    /**
     * sceneName
     */
    private String sceneName;

    /**
     * 业务唯一id
     */
    private String idempotentId;

    /**
     * 执行器名称
     */
    private String executorName;

    /**
     * 业务唯一编号
     */
    private String bizNo;

    /**
     * 客户端上报参数
     */
    private String argsStr;

    /**
     * 额外扩展参数
     */
    private String extAttrs;

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getSceneName() {
        return sceneName;
    }

    public void setSceneName(String sceneName) {
        this.sceneName = sceneName;
    }

    public String getIdempotentId() {
        return idempotentId;
    }

    public void setIdempotentId(String idempotentId) {
        this.idempotentId = idempotentId;
    }

    public String getExecutorName() {
        return executorName;
    }

    public void setExecutorName(String executorName) {
        this.executorName = executorName;
    }

    public String getBizNo() {
        return bizNo;
    }

    public void setBizNo(String bizNo) {
        this.bizNo = bizNo;
    }

    public String getArgsStr() {
        return argsStr;
    }

    public void setArgsStr(String argsStr) {
        this.argsStr = argsStr;
    }

    public String getExtAttrs() {
        return extAttrs;
    }

    public void setExtAttrs(String extAttrs) {
        this.extAttrs = extAttrs;
    }
}
