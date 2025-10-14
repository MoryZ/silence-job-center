package com.old.silence.job.common.client.dto.request;

import com.old.silence.job.common.enums.RetryStatus;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.math.BigInteger;

/**
 * 服务端调度重试入参
 *
 */

public class RetryCallbackRequest {
    @NotBlank(message = "namespaceId 不能为空")
    private String namespaceId;

    @NotBlank(message = "groupName 不能为空")
    private String groupName;

    @NotBlank(message = "sceneName 不能为空")
    private String sceneName;

    @NotBlank(message = "参数 不能为空")
    private String argsStr;

    @NotBlank(message = "executorName 不能为空")
    private String executorName;

    @NotNull(message = "retryStatus 不能为空")
    private RetryStatus retryStatus;

    @NotNull(message = "retryTaskId 不能为空")
    private BigInteger retryTaskId;

    @NotNull(message = "retryId 不能为空")
    private BigInteger retryId;

    @NotNull(message = "executorTimeout 不能为空")
    private Integer executorTimeout;

    public String getNamespaceId() {
        return namespaceId;
    }

    public void setNamespaceId(String namespaceId) {
        this.namespaceId = namespaceId;
    }

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

    public String getArgsStr() {
        return argsStr;
    }

    public void setArgsStr(String argsStr) {
        this.argsStr = argsStr;
    }

    public String getExecutorName() {
        return executorName;
    }

    public void setExecutorName(String executorName) {
        this.executorName = executorName;
    }

    public RetryStatus getRetryStatus() {
        return retryStatus;
    }

    public void setRetryStatus(RetryStatus retryStatus) {
        this.retryStatus = retryStatus;
    }

    public BigInteger getRetryTaskId() {
        return retryTaskId;
    }

    public void setRetryTaskId(BigInteger retryTaskId) {
        this.retryTaskId = retryTaskId;
    }

    public BigInteger getRetryId() {
        return retryId;
    }

    public void setRetryId(BigInteger retryId) {
        this.retryId = retryId;
    }

    public Integer getExecutorTimeout() {
        return executorTimeout;
    }

    public void setExecutorTimeout(Integer executorTimeout) {
        this.executorTimeout = executorTimeout;
    }
}
