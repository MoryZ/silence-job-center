package com.old.silence.job.common.enums;


public enum HeadersEnum {

    HOST_ID("host-id"),
    HOST_IP("host-ip"),
    HOST_PORT("host-port"),
    GROUP_NAME("group-name"),
    CONTEXT_PATH("context-path"),
    REQUEST_ID("request-id"),
    VERSION("version"),
    HOST("Host"),
    NAMESPACE("namespace"),
    TOKEN("token"),
    ;

    private final String key;

    HeadersEnum(String key) {
        this.key = key;
    }

    public String getKey() {
        return key;
    }
}
