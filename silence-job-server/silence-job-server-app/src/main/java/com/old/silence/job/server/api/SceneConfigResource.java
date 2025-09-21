package com.old.silence.job.server.api;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.old.silence.core.util.CollectionUtils;
import com.old.silence.job.server.api.assembler.SceneConfigMapper;
import com.old.silence.job.server.domain.model.RetrySceneConfig;
import com.old.silence.job.server.domain.service.SceneConfigService;
import com.old.silence.job.server.dto.ExportSceneCommand;
import com.old.silence.job.server.dto.SceneConfigQueryVO;
import com.old.silence.job.server.dto.SceneConfigCommand;
import com.old.silence.job.server.util.ExportUtils;
import com.old.silence.job.server.util.ImportUtils;
import com.old.silence.job.server.vo.SceneConfigResponseVO;

import javax.validation.constraints.NotEmpty;
import java.io.IOException;
import java.math.BigInteger;
import java.util.List;
import java.util.Set;

/**
 * 重试场景接口
 *
 */
@RestController
@RequestMapping("/api/v1")
public class SceneConfigResource {
    private final SceneConfigService sceneConfigService;
    private final SceneConfigMapper sceneConfigMapper;

    public SceneConfigResource(SceneConfigService sceneConfigService,
                               SceneConfigMapper sceneConfigMapper) {
        this.sceneConfigService = sceneConfigService;
        this.sceneConfigMapper = sceneConfigMapper;
    }


    @GetMapping(value = "/sceneConfig", params = {"pageNo", "pageSize"})
    public IPage<SceneConfigResponseVO> getSceneConfigPageList(Page<RetrySceneConfig> page, SceneConfigQueryVO queryVO) {
        return sceneConfigService.getSceneConfigPageList(page, queryVO);
    }

    
    @GetMapping("/sceneConfig")
    public List<SceneConfigResponseVO> getSceneConfigList(@RequestParam String groupName) {
        return sceneConfigService.getSceneConfigList(groupName);
    }

    
    @GetMapping("/sceneConfig/{id}")
    public SceneConfigResponseVO getSceneConfigDetail(@PathVariable BigInteger id) {
        return sceneConfigService.getSceneConfigDetail(id);
    }

    
    @PutMapping("/sceneConfig/{id}/{status}")
    public Boolean updateStatus(@PathVariable BigInteger id, @PathVariable Boolean status) {
        return sceneConfigService.updateStatus(id, status);
    }

    
    @PostMapping("/sceneConfig")
    public Boolean saveSceneConfig(@RequestBody @Validated SceneConfigCommand sceneConfigCommand) {
        var sceneConfig = sceneConfigMapper.convert(sceneConfigCommand);
        return sceneConfigService.saveSceneConfig(sceneConfig);
    }

    
    @PutMapping("/sceneConfig/{id}")
    public Boolean updateSceneConfig(@PathVariable BigInteger id, @RequestBody @Validated SceneConfigCommand sceneConfigCommand) {
        var retrySceneConfig = sceneConfigMapper.convert(sceneConfigCommand);
        retrySceneConfig.setId(id);
        return sceneConfigService.updateSceneConfig(retrySceneConfig);
    }

    
    @PostMapping(value = "/sceneConfig/import", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public void importScene(@RequestPart MultipartFile file) throws IOException {
        var sceneConfigCommands = ImportUtils.parseList(file, SceneConfigCommand.class);
        var retrySceneConfigs = CollectionUtils.transformToList(sceneConfigCommands, sceneConfigMapper::convert);
        // 写入数据
        sceneConfigService.importSceneConfig(retrySceneConfigs);
    }

    
    @PostMapping("/sceneConfig/export")
    public ResponseEntity<String> export(@RequestBody ExportSceneCommand exportSceneCommand) {
        return ExportUtils.doExport(sceneConfigService.exportSceneConfig(exportSceneCommand));
    }

    
    @DeleteMapping("/sceneConfig/ids")
    public boolean deleteByIds(@RequestBody @NotEmpty(message = "ids不能为空") Set<BigInteger> ids) {
        return sceneConfigService.deleteByIds(ids);
    }
}
