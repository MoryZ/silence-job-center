package com.old.silence.job.server.dto;


public class SceneConfigQueryVO  {
    private String groupName;
    private String sceneName;
    private Boolean sceneStatus;

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

    public Boolean getSceneStatus() {
        return sceneStatus;
    }

    public void setSceneStatus(Boolean sceneStatus) {
        this.sceneStatus = sceneStatus;
    }
}
