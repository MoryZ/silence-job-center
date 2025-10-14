package com.old.silence.job.common.client.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import java.math.BigInteger;
import java.util.List;



public class MapTaskRequest {

    @NotNull(message = "jobId 不能为空")
    private BigInteger jobId;

    @NotNull(message = "taskBatchId 不能为空")
    private BigInteger taskBatchId;

    @NotNull(message = "parentId 不能为空")
    private BigInteger parentId;

    private BigInteger workflowTaskBatchId;

    private BigInteger workflowNodeId;

    /**
     * 当前节点变更的工作流上下文
     */
    private String wfContext;

    @NotBlank(message = "taskName 不能为空")
    private String taskName;

    @NotEmpty(message = "subTask 不能为空")
    private List<Object> subTask;

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

    public BigInteger getParentId() {
        return parentId;
    }

    public void setParentId(BigInteger parentId) {
        this.parentId = parentId;
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

    public String getWfContext() {
        return wfContext;
    }

    public void setWfContext(String wfContext) {
        this.wfContext = wfContext;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public List<Object> getSubTask() {
        return subTask;
    }

    public void setSubTask(List<Object> subTask) {
        this.subTask = subTask;
    }
}
