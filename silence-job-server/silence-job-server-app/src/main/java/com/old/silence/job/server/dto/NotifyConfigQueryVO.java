package com.old.silence.job.server.dto;


import com.old.silence.job.common.enums.SystemTaskType;

public class NotifyConfigQueryVO  {
    private String groupName;
    private String sceneName;
    private SystemTaskType systemTaskType;
    private Boolean notifyStatus;
    private String notifyName;

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getSceneName() {
        return sceneName;
    }

    public void setSceneName(String sceneName) {
        this.sceneName = sceneName;
    }

    public SystemTaskType getSystemTaskType() {
        return systemTaskType;
    }

    public void setSystemTaskType(SystemTaskType systemTaskType) {
        this.systemTaskType = systemTaskType;
    }

    public Boolean getNotifyStatus() {
        return notifyStatus;
    }

    public void setNotifyStatus(Boolean notifyStatus) {
        this.notifyStatus = notifyStatus;
    }

    public String getNotifyName() {
        return notifyName;
    }

    public void setNotifyName(String notifyName) {
        this.notifyName = notifyName;
    }
}
