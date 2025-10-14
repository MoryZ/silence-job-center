package com.old.silence.job.common.client.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.math.BigInteger;


/**
 * 服务端调度重试入参
 *
 */

public class StopRetryRequest {
    @NotBlank(message = "namespaceId 不能为空")
    private String namespaceId;
    @NotBlank(message = "group 不能为空")
    private String groupName;
    @NotBlank(message = "scene 不能为空")
    private String scene;
    @NotNull(message = "retryTaskId 不能为空")
    private BigInteger retryTaskId;
    @NotNull(message = "retryId 不能为空")
    private BigInteger retryId;

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

    public String getScene() {
        return scene;
    }

    public void setScene(String scene) {
        this.scene = scene;
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
}
