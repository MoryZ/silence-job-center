package com.old.silence.job.common.client.dto.request;



import java.math.BigInteger;


public class RetryCallbackResultRequest {

    private String namespaceId;
    private String groupName;
    private String sceneName;
    private BigInteger retryId;
    private BigInteger retryTaskId;
    private Boolean result;
    private Integer statusCode;
    private String message;
}
