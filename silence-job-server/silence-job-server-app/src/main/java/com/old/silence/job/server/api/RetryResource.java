package com.old.silence.job.server.api;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.old.silence.job.server.domain.model.Retry;
import com.old.silence.job.server.dto.BatchDeleteRetryTaskVO;
import com.old.silence.job.server.dto.GenerateRetryIdempotentIdVO;
import com.old.silence.job.server.dto.ManualTriggerTaskRequestVO;
import com.old.silence.job.server.dto.ParseLogsVO;
import com.old.silence.job.server.dto.RetryQueryVO;
import com.old.silence.job.server.dto.RetrySaveRequestVO;
import com.old.silence.job.server.dto.RetryUpdateExecutorNameRequestVO;
import com.old.silence.job.server.dto.RetryUpdateStatusRequestVO;
import com.old.silence.job.server.vo.RetryResponseVO;
import com.old.silence.job.server.web.domain.service.RetryService;

/**
 * 重试数据管理接口
 *
 */
@RestController
@RequestMapping("/retry")
public class RetryResource {

    private final RetryService retryService;

    public RetryResource(RetryService retryService) {
        this.retryService = retryService;
    }


    @GetMapping("list")
    public Page<RetryResponseVO> getRetryTaskPage(Page<Retry> page, RetryQueryVO queryVO) {
        return retryService.getRetryPage(page, queryVO);
    }

    
    @GetMapping("{id}")
    public RetryResponseVO getRetryTaskById(@RequestParam("groupName") String groupName,
                                            @PathVariable Long id) {
        return retryService.getRetryById(groupName, id);
    }

    
    @PutMapping("status")
    public int updateRetryTaskStatus(@RequestBody RetryUpdateStatusRequestVO retryUpdateStatusRequestVO) {
        return retryService.updateRetryStatus(retryUpdateStatusRequestVO);
    }

    
    @PostMapping
    public int saveRetryTask(@RequestBody @Validated RetrySaveRequestVO retryTaskRequestVO) {
        return retryService.saveRetryTask(retryTaskRequestVO);
    }

    
    @PostMapping("/generate/idempotent-id")
    public String idempotentIdGenerate(@RequestBody @Validated GenerateRetryIdempotentIdVO generateRetryIdempotentIdVO) {
        return  retryService.idempotentIdGenerate(generateRetryIdempotentIdVO);
    }

    
    @PutMapping("/batch")
    public Integer updateRetryTaskExecutorName(@RequestBody @Validated RetryUpdateExecutorNameRequestVO requestVO) {
        return retryService.updateRetryExecutorName(requestVO);
    }

    
    @DeleteMapping("/batch")
    public boolean batchDeleteRetry(@RequestBody @Validated BatchDeleteRetryTaskVO requestVO) {
        return retryService.batchDeleteRetry(requestVO);
    }

    
    @PostMapping("/batch")
    public Integer parseLogs(@RequestBody @Validated ParseLogsVO parseLogsVO) {
        return retryService.parseLogs(parseLogsVO);
    }

    
    @PostMapping("/manual/trigger/retry/task")
    public boolean manualTriggerRetryTask(@RequestBody @Validated ManualTriggerTaskRequestVO requestVO) {
        return retryService.manualTriggerRetryTask(requestVO);
    }

}
