package com.old.silence.job.common.enums;

/**
 * @author moryzang
 */
public enum RetryTaskExecutorSceneEnum {
    AUTO_RETRY(1, SystemTaskType.RETRY),
    MANUAL_RETRY(2, SystemTaskType.RETRY),
    AUTO_CALLBACK(3, SystemTaskType.CALLBACK),
    MANUAL_CALLBACK(4, SystemTaskType.CALLBACK);

    private final int scene;
    private final SystemTaskType taskType;

    RetryTaskExecutorSceneEnum(int scene, SystemTaskType taskType) {
        this.scene = scene;
        this.taskType = taskType;
    }

    public int getScene() {
        return scene;
    }

    public SystemTaskType getTaskType() {
        return taskType;
    }
}