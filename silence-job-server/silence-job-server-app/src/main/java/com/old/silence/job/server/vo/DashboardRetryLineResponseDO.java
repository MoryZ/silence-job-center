package com.old.silence.job.server.vo;



import java.util.List;



public class DashboardRetryLineResponseDO {

    /**
     * 任务列表
     */
    private List<Task> taskList;

    /**
     * 排名列表
     */
    private List<Rank> rankList;

    /**
     * 折线图列表
     */
    private List<DashboardLineResponseDO> dashboardLineResponseDOList;

    
    public static class Task {
        private String groupName;

        private Integer run;

        private Integer total;
    }

    
    public static class Rank {
        private String name;

        private String total;
    }
}
