package com.old.silence.job.common.dto;



import com.old.silence.job.log.dto.TaskLogFieldDTO;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;

/**
 * 日志上报DTO
 *
 */

public class LogTaskDTO implements Serializable {

    /**
     * 日志类型
     */
    private String logType;

    /**
     * 命名空间
     */
    private String namespaceId;

    /**
     * 组名称
     */
    private String groupName;

    /**
     * 任务信息id
     */
    @Deprecated
    private BigInteger jobId;

    /**
     * 任务实例id
     */
    @Deprecated
    private BigInteger taskBatchId;

    /**
     * 调度任务id
     */
    @Deprecated
    private BigInteger taskId;

//    /**
//     * 创建时间
//     */
//    private Instant createdDate;
//
//    /**
//     * 调度信息
//     */
//    private String message;

    /**
     * 上报时间
     */
    private Long realTime;

    /**
     * 日志模型集合
     */
    private List<TaskLogFieldDTO> fieldList;

    public String getLogType() {
        return logType;
    }

    public void setLogType(String logType) {
        this.logType = logType;
    }

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

    public Long getRealTime() {
        return realTime;
    }

    public void setRealTime(Long realTime) {
        this.realTime = realTime;
    }

    public List<TaskLogFieldDTO> getFieldList() {
        return fieldList;
    }

    public void setFieldList(List<TaskLogFieldDTO> fieldList) {
        this.fieldList = fieldList;
    }
}
