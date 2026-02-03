package com.old.silence.job.common.dto;


import com.old.silence.job.common.constant.SystemConstants;
import com.old.silence.job.common.enums.JobNotifyScene;
import com.old.silence.job.common.enums.NotifyType;
import com.old.silence.job.common.enums.RetryNotifyScene;

import java.util.List;

/**
 * 同步的配置数据结构
 *
 */
public class ConfigDTO {

    /**
     * 场景
     */
    private List<Scene> sceneList;

    /**
     * 通知
     */
    private List<Notify> notifyList;

    /**
     * 版本号
     */
    private Integer version;

    public List<Scene> getSceneList() {
        return sceneList;
    }

    public void setSceneList(List<Scene> sceneList) {
        this.sceneList = sceneList;
    }

    public List<Notify> getNotifyList() {
        return notifyList;
    }

    public void setNotifyList(List<Notify> notifyList) {
        this.notifyList = notifyList;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public static class Scene {

        /**
         * 场景名称
         */
        private String sceneName;

        /**
         * 调用链超时时间 单位毫秒(ms)
         */
        private long ddl = SystemConstants.DEFAULT_DDL;

        public String getSceneName() {
            return sceneName;
        }

        public void setSceneName(String sceneName) {
            this.sceneName = sceneName;
        }

        public long getDdl() {
            return ddl;
        }

        public void setDdl(long ddl) {
            this.ddl = ddl;
        }
    }

    public static class Notify {

        /**
         * 通知人
         */
        private List<Recipient> recipients;

        /**
         * 触发阈值
         */
        private Integer notifyThreshold;

        /**
         * 重试通知场景 {@link RetryNotifyScene}
         */
        private RetryNotifyScene retryNotifyScene;

        /**
         * 定时任务&工作流通知场景 {@link JobNotifyScene}
         */
        private JobNotifyScene jobNotifyScene;

        public List<Recipient> getRecipients() {
            return recipients;
        }

        public void setRecipients(List<Recipient> recipients) {
            this.recipients = recipients;
        }

        public Integer getNotifyThreshold() {
            return notifyThreshold;
        }

        public void setNotifyThreshold(Integer notifyThreshold) {
            this.notifyThreshold = notifyThreshold;
        }

        public RetryNotifyScene getRetryNotifyScene() {
            return retryNotifyScene;
        }

        public void setRetryNotifyScene(RetryNotifyScene retryNotifyScene) {
            this.retryNotifyScene = retryNotifyScene;
        }

        public JobNotifyScene getJobNotifyScene() {
            return jobNotifyScene;
        }

        public void setJobNotifyScene(JobNotifyScene jobNotifyScene) {
            this.jobNotifyScene = jobNotifyScene;
        }

        public static class Recipient {

            /**
             * 通知类型 {@link AlarmType}
             */
            private NotifyType notifyType;

            /**
             * 通知地址
             */
            private String notifyAttribute;

            public NotifyType getNotifyType() {
                return notifyType;
            }

            public void setNotifyType(NotifyType notifyType) {
                this.notifyType = notifyType;
            }

            public String getNotifyAttribute() {
                return notifyAttribute;
            }

            public void setNotifyAttribute(String notifyAttribute) {
                this.notifyAttribute = notifyAttribute;
            }
        }
    }

}
