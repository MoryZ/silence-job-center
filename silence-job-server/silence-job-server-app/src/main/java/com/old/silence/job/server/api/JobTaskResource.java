package com.old.silence.job.server.api;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.old.silence.job.server.domain.model.JobTask;
import com.old.silence.job.server.dto.JobTaskQueryVO;
import com.old.silence.job.server.vo.JobTaskResponseVO;
import com.old.silence.job.server.web.domain.service.JobTaskService;

import java.util.List;


@RestController
@RequestMapping("/job/task")
public class JobTaskResource {
    private final JobTaskService jobTaskService;

    public JobTaskResource(JobTaskService jobTaskService) {
        this.jobTaskService = jobTaskService;
    }

    @GetMapping("/list")
    public IPage<JobTaskResponseVO> getJobTaskPage(Page<JobTask> page, JobTaskQueryVO jobTaskQueryVO) {
        return jobTaskService.getJobTaskPage(page, jobTaskQueryVO);
    }

    @GetMapping("/tree/list")
    public List<JobTaskResponseVO> getTreeJobTask(JobTaskQueryVO jobTaskQueryVO) {
        return jobTaskService.getTreeJobTask(jobTaskQueryVO);
    }

}
