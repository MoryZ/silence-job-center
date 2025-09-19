package com.old.silence.job.client.handler;

import com.old.silence.job.client.common.rpc.client.RequestBuilder;
import com.old.silence.job.client.openapi.OpenApiClient;
import com.old.silence.job.common.model.SilenceJobRpcResult;

public interface RequestHandler<R> {

    OpenApiClient client = RequestBuilder.<OpenApiClient, SilenceJobRpcResult>newBuilder()
            .client(OpenApiClient.class)
            .async(false)
            .build();

    R execute();

}