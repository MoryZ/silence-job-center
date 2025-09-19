package com.old.silence.job.server.api;


import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.old.silence.job.server.domain.model.RetryDeadLetter;
import com.old.silence.job.server.dto.BatchDeleteRetryDeadLetterVO;
import com.old.silence.job.server.dto.BatchRollBackRetryDeadLetterVO;
import com.old.silence.job.server.dto.RetryDeadLetterQueryVO;
import com.old.silence.job.server.vo.RetryDeadLetterResponseVO;
import com.old.silence.job.server.web.domain.service.RetryDeadLetterService;

import java.math.BigInteger;


/**
 * 死信队列接口
 *
 */
@RestController
@RequestMapping("/retry-dead-letter")
public class RetryDeadLetterController {
    private final RetryDeadLetterService retryDeadLetterService;

    public RetryDeadLetterController(RetryDeadLetterService retryDeadLetterService) {
        this.retryDeadLetterService = retryDeadLetterService;
    }


    @GetMapping("list")
    public IPage<RetryDeadLetterResponseVO> getRetryDeadLetterPage(Page<RetryDeadLetter> page, RetryDeadLetterQueryVO queryVO) {
        return retryDeadLetterService.getRetryDeadLetterPage(page, queryVO);
    }

    
    @GetMapping("{id}")
    public RetryDeadLetterResponseVO getRetryDeadLetterById(@RequestParam String groupName,
                                                            @PathVariable BigInteger id) {
        return retryDeadLetterService.getRetryDeadLetterById(groupName, id);
    }

    
    @PostMapping("/batch/rollback")
    public int rollback(@RequestBody @Validated BatchRollBackRetryDeadLetterVO rollBackRetryDeadLetterVO) {
        return retryDeadLetterService.rollback(rollBackRetryDeadLetterVO);
    }

    
    @DeleteMapping("/batch")
    public boolean batchDelete(@RequestBody @Validated BatchDeleteRetryDeadLetterVO deadLetterVO) {
        return retryDeadLetterService.batchDelete(deadLetterVO);
    }
}
