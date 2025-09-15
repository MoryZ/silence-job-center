package com.old.silence.job.server.common;


import com.old.silence.job.log.center.dto.LogContentDTO;
import com.old.silence.job.log.center.enums.LogTypeEnum;
import com.old.silence.job.server.common.dto.LogMetaDTO;

public interface LogStorage {

    LogTypeEnum logType();

    void storage(final LogContentDTO logContentDTO, final LogMetaDTO logMetaDTO);
}
