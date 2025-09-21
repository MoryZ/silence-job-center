package com.old.silence.job.log.dialect.jdk;



import com.old.silence.job.log.dialect.Log;
import com.old.silence.job.log.factory.LogFactory;
import com.old.silence.job.log.dialect.console.Console;

import java.io.InputStream;
import java.util.logging.LogManager;

/**
 * JDK日志工厂类
 * <a href="http://java.sun.com/javase/6/docs/technotes/guides/logging/index.html">java.util.logging</a> log.
 *
 * @author wodeyangzipingpingwuqi
 */
public class JdkLogFactory extends LogFactory {

    public JdkLogFactory() {
        super("JDK Logging");
        readConfig();
    }

    @Override
    public Log createLog(String name) {
        return new JdkLog(name);
    }

    @Override
    public Log createLog(Class<?> clazz) {
        return new JdkLog(clazz);
    }

    /**
     * 读取ClassPath下的logging.properties配置文件
     */
    private void readConfig() {
        //避免循环引用，Log初始化的时候不使用相关工具类
        try(InputStream in = this.getClass().getClassLoader().getResourceAsStream("logging.properties")) {
            LogManager.getLogManager().readConfiguration(in);
        } catch (Exception e) {
            Console.error(e, "Read [logging.properties] from classpath error!");
            try {
                LogManager.getLogManager().readConfiguration();
            } catch (Exception e1) {
                Console.error(e, "Read [logging.properties] from [%JRE_HOME%/lib/logging.properties] error!");
            }
        }
    }
}
