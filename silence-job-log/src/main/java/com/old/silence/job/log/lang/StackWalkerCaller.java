package com.old.silence.job.log.lang;

import cn.hutool.core.exceptions.UtilException;

import java.io.Serializable;
import java.util.function.Function;
import java.util.stream.Stream;


public class StackWalkerCaller implements Caller, Serializable {
    private static final long serialVersionUID = 1L;

    private static final int OFFSET = 2;

    @Override
    public Class<?> getCallerCaller() {

        StackWalker instance = StackWalker.getInstance(StackWalker.Option.RETAIN_CLASS_REFERENCE);
        StackWalker.StackFrame walk = (StackWalker.StackFrame) instance
                .walk((Function<Stream<StackWalker.StackFrame>, Object>) stackFrameStream ->
                        stackFrameStream.skip(OFFSET + 1).findFirst().get());
        try {
            return Class.forName(walk.getClassName());
        } catch (ClassNotFoundException e) {
            throw new UtilException(e, "[{}] not found!", walk.getClassName());
        }
    }

}
