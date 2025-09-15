package com.old.silence.job.client.common;


import com.old.silence.platform.job.log.center.dto.LogContentDTO;

public interface LogReport {

    boolean supports();

    void report(LogContentDTO logContentDTO);
}
