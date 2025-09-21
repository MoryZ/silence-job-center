package com.old.silence.job.log.dialect.console;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.function.Function;

import com.old.silence.job.log.level.Level;

public class ConsoleColorLog extends ConsoleLog {

    // ANSI 颜色代码
    private static final String ANSI_RESET = "\u001B[0m";
    private static final String ANSI_BLACK = "\u001B[30m";
    private static final String ANSI_RED = "\u001B[31m";
    private static final String ANSI_GREEN = "\u001B[32m";
    private static final String ANSI_YELLOW = "\u001B[33m";
    private static final String ANSI_BLUE = "\u001B[34m";
    private static final String ANSI_PURPLE = "\u001B[35m";
    private static final String ANSI_CYAN = "\u001B[36m";
    private static final String ANSI_WHITE = "\u001B[37m";

    /**
     * 控制台打印类名的颜色代码
     */
    private static final String COLOR_CLASSNAME = ANSI_CYAN;

    /**
     * 控制台打印时间的颜色代码
     */
    private static final String COLOR_TIME = ANSI_WHITE;

    /**
     * 控制台打印正常信息的颜色代码
     */
    private static final String COLOR_NONE = ANSI_RESET;

    private static Function<Level, String> colorFactory = (level -> {
        switch (level) {
            case DEBUG:
            case INFO:
                return ANSI_GREEN;
            case WARN:
                return ANSI_YELLOW;
            case ERROR:
                return ANSI_RED;
            case TRACE:
                return ANSI_PURPLE;
            default:
                return COLOR_NONE;
        }
    });

    private static final DateTimeFormatter TIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    /**
     * 设置颜色工厂，根据日志级别，定义不同的颜色
     *
     * @param colorFactory 颜色工厂函数
     */
    public static void setColorFactory(Function<Level, String> colorFactory) {
        ConsoleColorLog.colorFactory = colorFactory;
    }

    /**
     * 构造
     *
     * @param name 类名
     */
    public ConsoleColorLog(String name) {
        super(name);
    }

    /**
     * 构造
     *
     * @param clazz 类
     */
    public ConsoleColorLog(Class<?> clazz) {
        super(clazz);
    }

    /**
     * 获取类的短名称（简单类名）
     */
    private String getShortClassName(String className) {
        if (className == null || className.isEmpty()) {
            return className;
        }
        int lastDotIndex = className.lastIndexOf('.');
        if (lastDotIndex != -1 && lastDotIndex < className.length() - 1) {
            return className.substring(lastDotIndex + 1);
        }
        return className;
    }

    /**
     * 格式化消息（替代 StrUtil.format）
     */
    private String formatMessage(String format, Object... arguments) {
        if (format == null) {
            return null;
        }
        if (arguments == null || arguments.length == 0) {
            return format;
        }

        try {
            return String.format(format, arguments);
        } catch (Exception e) {
            // 如果格式化失败，返回原始格式
            return format;
        }
    }

    @Override
    public synchronized void log(Level level, Boolean remote, String fqcn, String format, Object... arguments) {
        if (!isEnabled(level)) {
            return;
        }

        String currentTime = LocalDateTime.now().format(TIME_FORMATTER);
        String levelColor = colorFactory.apply(level);
        String shortClassName = getShortClassName(getName());
        String message = formatMessage(format, arguments);

        // 构建带颜色的日志输出
        String coloredLog = COLOR_TIME + "[" + currentTime + "]" +
                levelColor + "[" + String.format("%-5s", level.name()) + "]" +
                COLOR_CLASSNAME + String.format("%-30s: ", shortClassName) +
                COLOR_NONE + message + ANSI_RESET + System.lineSeparator();

        System.out.print(coloredLog);
    }
}
