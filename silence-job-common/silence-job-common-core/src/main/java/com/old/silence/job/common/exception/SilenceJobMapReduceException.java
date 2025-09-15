
package com.old.silence.job.common.exception;


/**
 * 异常信息
 *
 */
public class SilenceJobMapReduceException extends BaseSilenceJobException {

    public SilenceJobMapReduceException(String message) {
        super(message);
    }

    public SilenceJobMapReduceException(String message, Object... arguments) {
        super(message, arguments);
    }

    public SilenceJobMapReduceException(String message, Object[] arguments, Throwable cause) {
        super(message, arguments, cause);
    }

    public SilenceJobMapReduceException(String message, Object argument, Throwable cause) {
        super(message, argument, cause);
    }

    public SilenceJobMapReduceException(String message, Object argument) {
        super(message, argument);
    }
}
