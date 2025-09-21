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
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.old.silence.job.server.domain.model.RetryDeadLetter;
import com.old.silence.job.server.domain.service.RetryDeadLetterService;
import com.old.silence.job.server.dto.BatchDeleteRetryDeadLetterVO;
import com.old.silence.job.server.dto.BatchRollBackRetryDeadLetterVO;
import com.old.silence.job.server.dto.RetryDeadLetterQueryVO;
import com.old.silence.job.server.vo.RetryDeadLetterResponseVO;

import java.math.BigInteger;


/**
 * 死信队列接口
 *
 */
@RestController
@RequestMapping("/api/v1")
public class RetryDeadLetterController {
    private final RetryDeadLetterService retryDeadLetterService;

    public RetryDeadLetterController(RetryDeadLetterService retryDeadLetterService) {
        this.retryDeadLetterService = retryDeadLetterService;
    }


    @GetMapping(value = "/retryDeadLetters", params = {"pageNo", "pageSize"})
    public IPage<RetryDeadLetterResponseVO> getRetryDeadLetterPage(Page<RetryDeadLetter> page, RetryDeadLetterQueryVO queryVO) {
        return retryDeadLetterService.getRetryDeadLetterPage(page, queryVO);
    }

    
    @GetMapping("/retryDeadLetters/{id}")
    public RetryDeadLetterResponseVO getRetryDeadLetterById(@RequestParam String groupName,
                                                            @PathVariable BigInteger id) {
        return retryDeadLetterService.getRetryDeadLetterById(groupName, id);
    }

    
    @PostMapping("/retryDeadLetters/batchRollback")
    public int rollback(@RequestBody @Validated BatchRollBackRetryDeadLetterVO rollBackRetryDeadLetterVO) {
        return retryDeadLetterService.rollback(rollBackRetryDeadLetterVO);
    }

    
    @DeleteMapping("/retryDeadLetters/batchDelete")
    public boolean batchDelete(@RequestBody @Validated BatchDeleteRetryDeadLetterVO deadLetterVO) {
        return retryDeadLetterService.batchDelete(deadLetterVO);
    }
}
