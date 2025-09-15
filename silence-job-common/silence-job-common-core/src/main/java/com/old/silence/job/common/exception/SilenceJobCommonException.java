package com.old.silence.job.common.exception;


/**
 * 异常信息
 *
 */
public class SilenceJobCommonException extends BaseSilenceJobException {

    public SilenceJobCommonException(String message) {
        super(message);
    }

    public SilenceJobCommonException(String message, Object... arguments) {
        super(message, arguments);
    }

    public SilenceJobCommonException(String message, Object[] arguments, Throwable cause) {
        super(message, arguments, cause);
    }

    public SilenceJobCommonException(String message, Object argument, Throwable cause) {
        super(message, argument, cause);
    }

    public SilenceJobCommonException(String message, Object argument) {
        super(message, argument);
    }
}
