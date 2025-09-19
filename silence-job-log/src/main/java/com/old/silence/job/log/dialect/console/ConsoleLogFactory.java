package com.old.silence.job.log.dialect.console;

import com.old.silence.job.log.dialect.Log;
import com.old.silence.job.log.factory.LogFactory;

/**
 * 利用System.out.println()打印日志
 *
 */
public class ConsoleLogFactory extends LogFactory {

    public ConsoleLogFactory() {
        super("Silence Job Console Logging");
    }

    @Override
    public Log createLog(String name) {
        return new ConsoleLog(name);
    }

    @Override
    public Log createLog(Class<?> clazz) {
        return new ConsoleLog(clazz);
    }

}
