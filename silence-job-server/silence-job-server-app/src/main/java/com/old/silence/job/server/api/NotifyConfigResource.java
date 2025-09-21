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
import com.old.silence.job.server.api.assembler.NotifyConfigMapper;
import com.old.silence.job.server.domain.model.NotifyConfig;
import com.old.silence.job.server.domain.service.NotifyConfigService;
import com.old.silence.job.server.dto.NotifyConfigCommand;
import com.old.silence.job.server.dto.NotifyConfigQueryVO;
import com.old.silence.job.server.vo.NotifyConfigResponseVO;

import javax.validation.constraints.NotEmpty;
import java.math.BigInteger;
import java.util.List;
import java.util.Set;


@RestController
@RequestMapping("/api/v1")
public class NotifyConfigResource {
    private final NotifyConfigService notifyConfigService;
    private final NotifyConfigMapper notifyConfigMapper;

    public NotifyConfigResource(NotifyConfigService notifyConfigService, NotifyConfigMapper notifyConfigMapper) {
        this.notifyConfigService = notifyConfigService;
        this.notifyConfigMapper = notifyConfigMapper;
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
    public Boolean create(@RequestBody @Validated NotifyConfigCommand notifyConfigCommand) {
        var notifyConfig = notifyConfigMapper.convert(notifyConfigCommand);
        return notifyConfigService.saveNotify(notifyConfig);
    }

    
    @PutMapping("/notifyConfig/{id}")
    public Boolean update(@PathVariable BigInteger id, @RequestBody @Validated NotifyConfigCommand notifyConfigCommand) {
        var notifyConfig = notifyConfigMapper.convert(notifyConfigCommand);
        notifyConfig.setId(id);
        return notifyConfigService.updateNotify(notifyConfig);
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
