package com.old.silence.job.server.api;


import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.old.silence.job.server.domain.model.NotifyConfig;
import com.old.silence.job.server.dto.NotifyConfigCommand;
import com.old.silence.job.server.dto.NotifyConfigQueryVO;
import com.old.silence.job.server.vo.NotifyConfigResponseVO;
import com.old.silence.job.server.web.domain.service.NotifyConfigService;

import javax.validation.constraints.NotEmpty;
import java.math.BigInteger;
import java.util.List;
import java.util.Set;


@RestController
@RequestMapping("/api/v1")
public class NotifyConfigResource {
    private final NotifyConfigService notifyConfigService;

    public NotifyConfigResource(NotifyConfigService notifyConfigService) {
        this.notifyConfigService = notifyConfigService;
    }

    @GetMapping(value = "/notifyConfig", params = {"pageNo", "pageSize"})
    public IPage<NotifyConfigResponseVO> getNotifyConfigList(Page<NotifyConfig> page, NotifyConfigQueryVO queryVO) {
        return notifyConfigService.getNotifyConfigList(page, queryVO);
    }

    
    @GetMapping("/notifyConfig/{systemTaskType}")
    public List<NotifyConfig> getNotifyConfigBySystemTaskTypeList(@PathVariable Integer systemTaskType) {
        return notifyConfigService.getNotifyConfigBySystemTaskTypeList(systemTaskType);
    }

    
    @GetMapping("/notifyConfig{id}")
    public NotifyConfigResponseVO getNotifyConfigDetail(@PathVariable BigInteger id) {
        return notifyConfigService.getNotifyConfigDetail(id);
    }

    
    @PostMapping("/notifyConfig")
    public Boolean saveNotify(@RequestBody @Validated NotifyConfigCommand requestVO) {
        return notifyConfigService.saveNotify(requestVO);
    }

    
    @PutMapping("/notifyConfig/{id}")
    public Boolean updateNotify(@PathVariable BigInteger id, @RequestBody @Validated NotifyConfigCommand requestVO) {
        return notifyConfigService.updateNotify(requestVO);
    }

    
    @PutMapping("/{id}/{status}")
    public Boolean updateStatus(@PathVariable BigInteger id, @PathVariable Boolean status) {
        return notifyConfigService.updateStatus(id, status);
    }

    
    @DeleteMapping("ids")
    public Boolean batchDeleteNotify(@RequestBody @NotEmpty Set<Long> ids) {
        return notifyConfigService.batchDeleteNotify(ids);
    }
}
