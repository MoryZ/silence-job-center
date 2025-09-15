package com.old.silence.job.server.dto;



import java.util.List;



public class JobBatchQueryDO {

    private List<String> groupNames;
    private Integer taskBatchStatus;
    private String jobName;
    private Long jobId;
    /**
     * 命名空间id
     */
    private String namespaceId;

}
