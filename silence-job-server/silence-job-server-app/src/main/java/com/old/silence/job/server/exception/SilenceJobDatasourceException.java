package com.old.silence.job.server.exception;

import com.old.silence.job.common.core.exception.BaseSilenceJobException;

/**
 * 数据源模块异常类
 *
 */
public class SilenceJobDatasourceException extends BaseSilenceJobException {

    public SilenceJobDatasourceException(String message) {
        super(message);
    }

    public SilenceJobDatasourceException(String message, Object... arguments) {
        super(message, arguments);
    }
}
