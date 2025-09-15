package com.old.silence.job.common.exception;

import org.slf4j.helpers.MessageFormatter;

/**
 * 异常信息
 *
 */
public class BaseSilenceJobException extends RuntimeException {

    public BaseSilenceJobException(String message) {
        super(message);
    }

    public BaseSilenceJobException(String message, Throwable cause) {
        super(message, cause);
    }

    public BaseSilenceJobException(Throwable cause) {
        super(cause);
    }

    public BaseSilenceJobException(String message, Object... arguments) {
        this(message, getArguments(arguments), getThrowable(arguments));
    }

    public BaseSilenceJobException(String message, Object[] arguments, Throwable cause) {
        super(MessageFormatter.arrayFormat(message, arguments).getMessage(), cause);
    }

    public BaseSilenceJobException(String message, Object argument, Throwable cause) {
        super(MessageFormatter.format(message, argument).getMessage(), cause);
    }

    public BaseSilenceJobException(String message, Object argument) {
        super(MessageFormatter.format(message, argument).getMessage());
    }

    public static Object[] getArguments(Object... arguments) {

        Object argument = arguments[arguments.length - 1];
        if (argument instanceof Throwable) {

            Object[] dest = new Object[arguments.length - 1];
            System.arraycopy(arguments, 0, dest, 0, arguments.length - 1);

            return dest;
        }

        return arguments;
    }

    public static Throwable getThrowable(Object... arguments) {
        return arguments.length == getArguments(arguments).length ? null : (Throwable) arguments[arguments.length - 1];
    }
}
