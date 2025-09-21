package com.old.silence.job.server.api;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.old.silence.job.server.common.dto.DistributeInstance;
import com.old.silence.job.server.domain.service.DashboardService;
import com.old.silence.job.server.dto.JobLineQueryVo;
import com.old.silence.job.server.dto.LineQueryVO;
import com.old.silence.job.server.vo.DashboardCardResponseVO;
import com.old.silence.job.server.vo.DashboardRetryLineResponseVO;

import java.util.Set;

@RestController
@RequestMapping("/dashboard")
public class DashboardResource {

    private final DashboardService dashBoardService;

    public DashboardResource(DashboardService dashBoardService) {
        this.dashBoardService = dashBoardService;
    }

    @GetMapping("/task-retry-job")
    public DashboardCardResponseVO taskRetryJob() {
        return dashBoardService.taskRetryJob();
    }

    @GetMapping("/retry/line")
    public DashboardRetryLineResponseVO retryLineList(Page<Object> page, LineQueryVO queryVO) {
        return dashBoardService.retryLineList(page, queryVO);
    }

    @GetMapping("/job/line")
    public DashboardRetryLineResponseVO jobLineList(Page<Object> page, JobLineQueryVo queryVO) {
        return dashBoardService.jobLineList(page, queryVO);
    }

    @GetMapping("/consumer/bucket")
    public Set<Integer> allConsumerGroupName() {
        return DistributeInstance.INSTANCE.getConsumerBucket();
    }

}
