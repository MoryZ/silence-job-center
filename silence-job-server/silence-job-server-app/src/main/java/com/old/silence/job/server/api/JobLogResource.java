package com.old.silence.job.server.api;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.old.silence.job.server.dto.JobLogQuery;
import com.old.silence.job.server.vo.JobLogResponseVO;
import com.old.silence.job.server.web.domain.service.JobLogService;


@RestController
@RequestMapping("/job")
public class JobLogResource {

    private final JobLogService jobLogService;

    public JobLogResource(JobLogService jobLogService) {
        this.jobLogService = jobLogService;
    }

    @GetMapping("/log/list")
    public JobLogResponseVO getJobLogPage(JobLogQuery jobQueryVO) {
        return jobLogService.getJobLogPage(jobQueryVO);
    }

}
