package com.old.silence.job.common.enums;


/**
 * 系统模式: 分布式重试重试、分布式定时任务
 *
 */
public enum SystemModeEnum {

    RETRY,
    JOB,
    ALL;

    public static boolean isRetry(SystemModeEnum mode) {
        return RETRY == mode || ALL == mode;
    }

    public static boolean isJob(SystemModeEnum mode) {
        return JOB == mode || ALL == mode;
    }
}