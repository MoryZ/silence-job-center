package com.old.silence.job.common.enums;


public enum DashboardLineEnum {
    DAY("DAY"),
    WEEK("WEEK"),
    MONTH("MONTH"),
    YEAR("YEAR"),
    ;

    private final String unit;

    DashboardLineEnum(String unit) {
        this.unit = unit;
    }

    public static DashboardLineEnum modeOf(String mode) {
        for (DashboardLineEnum value : DashboardLineEnum.values()) {
            if (value.getUnit().equals(mode)) {
                return value;
            }
        }

        return DashboardLineEnum.WEEK;
    }

    public String getUnit() {
        return unit;
    }
}
