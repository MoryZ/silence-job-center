package com.old.silence.job.common.enums;

/**
 * @author moryzang
 */
/**
 * id生成模式
 *
 */
public enum TaskGeneratorSceneEnum {

    CLIENT_REPORT(1, "客户端匹配上报"),
    MANA_BATCH(2, "控制台手动批量新增"),
    MANA_SINGLE(3, "控制台手动单个新增"),
    ;

    private final int scene;

    private final String desc;

    TaskGeneratorSceneEnum(int scene, String desc) {
        this.scene = scene;
        this.desc = desc;
    }

    public static TaskGeneratorSceneEnum modeOf(int scene) {
        for (TaskGeneratorSceneEnum value : TaskGeneratorSceneEnum.values()) {
            if (value.getScene() == scene) {
                return value;
            }
        }

        return null;
    }

    public int getScene() {
        return scene;
    }

    public String getDesc() {
        return desc;
    }
}