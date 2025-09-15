package com.old.silence.job.common.server.dto;




import java.math.BigInteger;



public class JobLogTaskDTO extends LogTaskDTO {

    /**
     * 任务信息id
     */
    private BigInteger jobId;

    /**
     * 任务实例id
     */
    private BigInteger taskBatchId;

    /**
     * 调度任务id
     */
    private BigInteger taskId;

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

    public BigInteger getTaskId() {
        return taskId;
    }

    public void setTaskId(BigInteger taskId) {
        this.taskId = taskId;
    }
}
