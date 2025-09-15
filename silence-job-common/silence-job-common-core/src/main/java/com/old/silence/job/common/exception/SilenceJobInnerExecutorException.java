package com.old.silence.job.common.exception;

public class SilenceJobInnerExecutorException extends BaseSilenceJobException {
    public SilenceJobInnerExecutorException(String message) {
        super(message);
    }

    public SilenceJobInnerExecutorException(String message, Throwable cause) {
        super(message, cause);
    }

    public SilenceJobInnerExecutorException(Throwable cause) {
        super(cause);
    }

    public SilenceJobInnerExecutorException(String message, Object... arguments) {
        super(message, arguments);
    }

    public SilenceJobInnerExecutorException(String message, Object[] arguments, Throwable cause) {
        super(message, arguments, cause);
    }

    public SilenceJobInnerExecutorException(String message, Object argument, Throwable cause) {
        super(message, argument, cause);
    }

    public SilenceJobInnerExecutorException(String message, Object argument) {
        super(message, argument);
    }
}
