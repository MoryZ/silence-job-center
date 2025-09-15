package com.old.silence.job.server.dto;



import java.util.List;



public class WorkflowBatchQueryDO {

    private List<String> groupNames;
    private Integer taskBatchStatus;
    private String workflowName;
    private Long workflowId;
    /**
     * 命名空间id
     */
    private String namespaceId;

}
