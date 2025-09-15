package com.old.silence.job.client.core.handler;

import com.old.silence.platform.job.client.common.rpc.client.RequestBuilder;
import com.old.silence.platform.job.client.core.openapi.OpenApiClient;
import com.old.silence.platform.job.common.core.model.SilenceJobRpcResult;

public interface RequestHandler<R> {

    OpenApiClient client = RequestBuilder.<OpenApiClient, SilenceJobRpcResult>newBuilder()
            .client(OpenApiClient.class)
            .async(false)
            .build();

    R execute();

}