package com.old.silence.job.common.util;

public class SilenceJobSystemUtils {

    public static String getOsName(){
        return System.getProperty("os.name");
    }

    public static boolean isOsWindows(){
        String osName = getOsName();
        return osName != null && osName.toLowerCase().contains("windows");
    }
}
