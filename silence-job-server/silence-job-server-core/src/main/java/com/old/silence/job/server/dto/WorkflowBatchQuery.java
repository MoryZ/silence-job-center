package com.old.silence.job.server.dto;


import java.math.BigInteger;

import com.old.silence.job.common.enums.JobTaskBatchStatus;

public class WorkflowBatchQuery {
    private String groupName;
    private String workflowName;
    private BigInteger workflowId;
    private JobTaskBatchStatus taskBatchStatus;

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getWorkflowName() {
        return workflowName;
    }

    public void setWorkflowName(String workflowName) {
        this.workflowName = workflowName;
    }

    public BigInteger getWorkflowId() {
        return workflowId;
    }

    public void setWorkflowId(BigInteger workflowId) {
        this.workflowId = workflowId;
    }

    public JobTaskBatchStatus getTaskBatchStatus() {
        return taskBatchStatus;
    }

    public void setTaskBatchStatus(JobTaskBatchStatus taskBatchStatus) {
        this.taskBatchStatus = taskBatchStatus;
    }
}
