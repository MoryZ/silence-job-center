package com.old.silence.job.client.common.log;

import com.old.silence.platform.job.client.common.NettyClient;
import com.old.silence.platform.job.client.common.rpc.client.RequestBuilder;
import com.old.silence.platform.job.common.core.model.SilenceJobRpcResult;
import com.old.silence.platform.job.common.core.window.Listener;
import com.old.silence.platform.job.log.center.SilenceJobLog;
import com.old.silence.platform.job.server.model.dto.LogTaskDTO;

import java.util.List;

/**
 * 批量异步上报
 *
 */

public class ReportLogListener implements Listener<LogTaskDTO> {

    private static final NettyClient CLIENT = RequestBuilder.<NettyClient, SilenceJobRpcResult>newBuilder()
            .client(NettyClient.class)
            .callback(nettyResult -> SilenceJobLog.LOCAL.info("Data report log successfully requestId:[{}]", nettyResult.getReqId())).build();

    @Override
    public void handler(List<LogTaskDTO> list) {

        CLIENT.reportLogTask(list);
    }
}
