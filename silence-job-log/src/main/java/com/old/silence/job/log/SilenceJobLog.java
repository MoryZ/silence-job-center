

package com.old.silence.job.log;


import com.old.silence.job.log.strategy.Local;
import com.old.silence.job.log.strategy.Remote;

/**
 * 静态日志类，用于在不引入日志对象的情况下打印日志
 *
 */
public final class SilenceJobLog {
    private SilenceJobLog() {
    }

    public static final Local LOCAL = new Local();

    public static final Remote REMOTE = new Remote();
}
