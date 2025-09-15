package com.old.silence.job.server.vo;



import java.time.Instant;



public class RetryDeadLetterResponseVO {

    private Long id;

    private String groupName;

    private String sceneName;

    private String idempotentId;

    private String bizNo;

    private String executorName;

    private String argsStr;

    private String extAttrs;

    private Integer taskType;

    private String uniqueId;

    private Instant createdDate;

}
