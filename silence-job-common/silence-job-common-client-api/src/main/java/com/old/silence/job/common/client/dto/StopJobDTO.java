package com.old.silence.job.common.client.dto;



import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.math.BigInteger;


public class StopJobDTO {

    @NotNull(message = "jobId 不能为空")
    private BigInteger jobId;

    @NotNull(message = "taskBatchId 不能为空")
    private BigInteger taskBatchId;

    @NotBlank(message = "group 不能为空")
    private String groupName;

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

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }
}
