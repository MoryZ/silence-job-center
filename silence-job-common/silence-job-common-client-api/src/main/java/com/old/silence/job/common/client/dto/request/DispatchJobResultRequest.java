package com.old.silence.job.common.client.dto.request;

import com.old.silence.job.common.client.dto.ExecuteResult;
import com.old.silence.job.common.enums.JobTaskStatus;
import com.old.silence.job.common.enums.JobTaskType;

import java.math.BigInteger;



public class DispatchJobResultRequest {

    private BigInteger jobId;

    private BigInteger taskBatchId;

    private BigInteger workflowTaskBatchId;

    private BigInteger workflowNodeId;

    private BigInteger taskId;

    /**
     * 任务类型
     */
    private JobTaskType taskType;

    private String groupName;

    private JobTaskStatus taskStatus;

    private ExecuteResult executeResult;

    /**
     * 重试场景 auto、manual
     */
    private Integer retryScene;

    /**
     * 是否是重试流量
     */
    @Deprecated
    private boolean isRetry;

    /**
     * 是否是重试流量
     */
    private Boolean retryStatus = Boolean.FALSE;

    /**
     * 工作流上下文
     */
    private String wfContext;

    public BigInteger getJobId() {
        return jobId;
    }

    public void setJobId(BigInteger jobId) {
        this.jobId = jobId;
    }

    public BigInteger getTaskBatchId() {
        return taskBatchId;
    }

    public void setTaskBatchId(BigInteger taskBatchId) {
        this.taskBatchId = taskBatchId;
    }

    public BigInteger getWorkflowTaskBatchId() {
        return workflowTaskBatchId;
    }

    public void setWorkflowTaskBatchId(BigInteger workflowTaskBatchId) {
        this.workflowTaskBatchId = workflowTaskBatchId;
    }

    public BigInteger getWorkflowNodeId() {
        return workflowNodeId;
    }

    public void setWorkflowNodeId(BigInteger workflowNodeId) {
        this.workflowNodeId = workflowNodeId;
    }

    public BigInteger getTaskId() {
        return taskId;
    }

    public void setTaskId(BigInteger taskId) {
        this.taskId = taskId;
    }

    public JobTaskType getTaskType() {
        return taskType;
    }

    public void setTaskType(JobTaskType taskType) {
        this.taskType = taskType;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public JobTaskStatus getTaskStatus() {
        return taskStatus;
    }

    public void setTaskStatus(JobTaskStatus taskStatus) {
        this.taskStatus = taskStatus;
    }

    public ExecuteResult getExecuteResult() {
        return executeResult;
    }

    public void setExecuteResult(ExecuteResult executeResult) {
        this.executeResult = executeResult;
    }

    public Integer getRetryScene() {
        return retryScene;
    }

    public void setRetryScene(Integer retryScene) {
        this.retryScene = retryScene;
    }

    public boolean isRetry() {
        return isRetry;
    }

    public void setRetry(boolean retry) {
        isRetry = retry;
    }

    public Boolean getRetryStatus() {
        return retryStatus;
    }

    public void setRetryStatus(Boolean retryStatus) {
        this.retryStatus = retryStatus;
    }

    public String getWfContext() {
        return wfContext;
    }

    public void setWfContext(String wfContext) {
        this.wfContext = wfContext;
    }
}
