package com.old.silence.job.common.enums;


import com.old.silence.core.enums.EnumValue;

public enum ContentType implements EnumValue<Byte> {

    JSON(1, "application/json"),
    FORM(2, "application/x-www-form-urlencoded");

    private final Byte value;
    private final String mediaType;

    ContentType(int value, String mediaType) {
        this.value = (byte) value;
        this.mediaType = mediaType;
    }

    @Override
    public Byte getValue() {
        return value;
    }

    public String getMediaType() {
        return mediaType;
    }

}
