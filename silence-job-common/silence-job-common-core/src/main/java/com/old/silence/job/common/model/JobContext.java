package com.old.silence.job.common.model;

import com.old.silence.job.common.enums.JobTaskType;
import com.old.silence.job.common.enums.MapReduceStage;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;


public class JobContext {

    private BigInteger jobId;

    private BigInteger taskBatchId;

    private BigInteger workflowTaskBatchId;

    private BigInteger workflowNodeId;

    private BigInteger taskId;

    private String namespaceId;

    private String groupName;

    private String executorInfo;

    private JobTaskType taskType;

    private Integer parallelNum;

    private Integer shardingTotal;

    private Integer shardingIndex;

    private Integer executorTimeout;

    private String argsStr;

    /**
     * 重试场景 auto、manual
     */
    private Integer retryScene;

    /**
     * 是否是重试流量
     */
    private Boolean retryStatus = Boolean.FALSE;

    /**
     * Map集合列表
     */
    private List<Object> taskList;

    /**
     * Map名称
     */
    private String taskName;

    /**
     * 动态分片所处的阶段
     */
    private MapReduceStage mrStage;

    /**
     * 工作流全局上下文
     */
    private Map<String, Object> wfContext;

    /**
     * 新增或者改动的上下文
     */
    private Map<String, Object> changeWfContext;

    /**
     * 定时任务参数
     */
    private JobArgsHolder jobArgsHolder;

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

    public String getExecutorInfo() {
        return executorInfo;
    }

    public void setExecutorInfo(String executorInfo) {
        this.executorInfo = executorInfo;
    }

    public JobTaskType getTaskType() {
        return taskType;
    }

    public void setTaskType(JobTaskType taskType) {
        this.taskType = taskType;
    }

    public Integer getParallelNum() {
        return parallelNum;
    }

    public void setParallelNum(Integer parallelNum) {
        this.parallelNum = parallelNum;
    }

    public Integer getShardingTotal() {
        return shardingTotal;
    }

    public void setShardingTotal(Integer shardingTotal) {
        this.shardingTotal = shardingTotal;
    }

    public Integer getShardingIndex() {
        return shardingIndex;
    }

    public void setShardingIndex(Integer shardingIndex) {
        this.shardingIndex = shardingIndex;
    }

    public Integer getExecutorTimeout() {
        return executorTimeout;
    }

    public void setExecutorTimeout(Integer executorTimeout) {
        this.executorTimeout = executorTimeout;
    }

    public Integer getRetryScene() {
        return retryScene;
    }

    public void setRetryScene(Integer retryScene) {
        this.retryScene = retryScene;
    }

    public Boolean getRetryStatus() {
        return retryStatus;
    }

    public void setRetryStatus(Boolean retryStatus) {
        this.retryStatus = retryStatus;
    }

    public List<Object> getTaskList() {
        return taskList;
    }

    public void setTaskList(List<Object> taskList) {
        this.taskList = taskList;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public MapReduceStage getMrStage() {
        return mrStage;
    }

    public void setMrStage(MapReduceStage mrStage) {
        this.mrStage = mrStage;
    }

    public Map<String, Object> getWfContext() {
        return wfContext;
    }

    public void setWfContext(Map<String, Object> wfContext) {
        this.wfContext = wfContext;
    }

    public Map<String, Object> getChangeWfContext() {
        return changeWfContext;
    }

    public void setChangeWfContext(Map<String, Object> changeWfContext) {
        this.changeWfContext = changeWfContext;
    }

    public JobArgsHolder getJobArgsHolder() {
        return jobArgsHolder;
    }

    public void setJobArgsHolder(JobArgsHolder jobArgsHolder) {
        this.jobArgsHolder = jobArgsHolder;
    }

    public String getArgsStr() {
        return argsStr;
    }

    public void setArgsStr(String argsStr) {
        this.argsStr = argsStr;
    }
}
