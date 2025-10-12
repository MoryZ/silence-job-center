package com.old.silence.job.common.exception;




public class SilenceJobAuthenticationException extends BaseSilenceJobException {
    private final Integer errorCode = 5001;

    public SilenceJobAuthenticationException(String message) {
        super(message);
    }

    public SilenceJobAuthenticationException(String message, Object... arguments) {
        super(message, arguments);
    }

    public SilenceJobAuthenticationException(String message, Object[] arguments, Throwable cause) {
        super(message, arguments, cause);
    }

    public SilenceJobAuthenticationException(String message, Object argument, Throwable cause) {
        super(message, argument, cause);
    }

    public SilenceJobAuthenticationException(String message, Object argument) {
        super(message, argument);
    }

    public Integer getErrorCode() {
        return errorCode;
    }
}
