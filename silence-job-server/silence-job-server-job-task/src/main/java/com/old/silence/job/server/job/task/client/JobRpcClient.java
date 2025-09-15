package com.old.silence.job.server.job.task.client;


import com.old.silence.platform.job.client.model.StopJobDTO;
import com.old.silence.platform.job.client.model.request.DispatchJobRequest;
import com.old.silence.platform.job.common.core.model.ApiResult;
import com.old.silence.platform.job.server.common.rpc.client.RequestMethod;
import com.old.silence.platform.job.server.common.rpc.client.annotation.Body;
import com.old.silence.platform.job.server.common.rpc.client.annotation.Mapping;

import static com.old.silence.platform.job.common.core.constant.SystemConstants.HTTP_PATH.JOB_DISPATCH;
import static com.old.silence.platform.job.common.core.constant.SystemConstants.HTTP_PATH.JOB_STOP;


public interface JobRpcClient {

    @Mapping(path = JOB_STOP, method = RequestMethod.POST)
    ApiResult<Boolean> stop(@Body StopJobDTO stopJobDTO);

    @Mapping(path = JOB_DISPATCH, method = RequestMethod.POST)
    ApiResult<Boolean> dispatch(@Body DispatchJobRequest dispatchJobRequest);

}
