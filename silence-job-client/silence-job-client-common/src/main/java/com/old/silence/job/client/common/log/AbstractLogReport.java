package com.old.silence.job.client.common.log;


import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import com.old.silence.platform.job.client.common.Lifecycle;
import com.old.silence.platform.job.client.common.LogReport;
import com.old.silence.platform.job.client.common.config.SilenceJobProperties;
import com.old.silence.platform.job.client.common.window.SlidingWindow;
import com.old.silence.platform.job.common.core.window.Listener;
import com.old.silence.platform.job.log.center.SilenceJobLog;
import com.old.silence.platform.job.log.center.dto.LogContentDTO;
import com.old.silence.platform.job.server.model.dto.LogTaskDTO;

import java.util.Objects;


public abstract class AbstractLogReport<T extends LogTaskDTO> implements Lifecycle, InitializingBean, LogReport {

    @Autowired
    private SilenceJobProperties silenceJobProperties;
    private SlidingWindow<LogTaskDTO> slidingWindow;

    @Override
    public void report(LogContentDTO logContentDTO) {
        slidingWindow.add(buildLogTaskDTO(logContentDTO));
    }

    protected abstract T buildLogTaskDTO(LogContentDTO logContentDTO);

    @Override
    public void start() {
        if (Objects.nonNull(slidingWindow)) {
            return;
        }

        SilenceJobProperties.LogSlidingWindowConfig logSlidingWindow = silenceJobProperties.getLogSlidingWindow();

        Listener<LogTaskDTO> reportLogListener = new ReportLogListener();
        slidingWindow = SlidingWindow
                .Builder
                .<LogTaskDTO>newBuilder()
                .withTotalThreshold(logSlidingWindow.getTotalThreshold())
                .withWindowTotalThreshold(logSlidingWindow.getWindowTotalThreshold())
                .withDuration(logSlidingWindow.getDuration(), logSlidingWindow.getChronoUnit())
                .withListener(reportLogListener)
                .build();

        slidingWindow.start();
    }

    @Override
    public void close() {
        if (Objects.isNull(slidingWindow)) {
            return;
        }

        SilenceJobLog.LOCAL.info("AsyncReport Log about to shutdown");
        slidingWindow.end();
        SilenceJobLog.LOCAL.info("AsyncReport Log has been shutdown");
    }

    @Override
    public void afterPropertiesSet() {
        LogReportFactory.add(this);
    }
}
