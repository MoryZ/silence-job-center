package com.old.silence.job.client.retry.core.client;

 
import com.old.silence.platform.job.client.common.annotation.Mapping;
import com.old.silence.platform.job.client.common.rpc.client.RequestMethod;
import com.old.silence.platform.job.client.model.request.DispatchCallbackResultRequest;
import com.old.silence.platform.job.client.model.request.DispatchRetryResultRequest;
import com.old.silence.platform.job.common.core.constant.SystemConstants.HTTP_PATH;
import com.old.silence.platform.job.common.core.model.ApiResult;

/**
 * netty 客户端请求类
 *
 */
public interface RetryClient {

    @Mapping(method = RequestMethod.POST, path = HTTP_PATH.REPORT_RETRY_DISPATCH_RESULT)
    ApiResult dispatchResult(DispatchRetryResultRequest request);

    @Mapping(method = RequestMethod.POST, path = HTTP_PATH.REPORT_CALLBACK_RESULT)
    ApiResult callbackResult(DispatchCallbackResultRequest request);
}
