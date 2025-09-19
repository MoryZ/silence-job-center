package com.old.silence.job.server.api;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.baomidou.mybatisplus.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.old.silence.job.server.domain.model.RetrySceneConfig;
import com.old.silence.job.server.dto.ExportSceneVO;
import com.old.silence.job.server.dto.SceneConfigQueryVO;
import com.old.silence.job.server.dto.SceneConfigRequestVO;
import com.old.silence.job.server.vo.SceneConfigResponseVO;
import com.old.silence.job.server.web.domain.service.SceneConfigService;
import com.old.silence.job.server.web.util.ExportUtils;
import com.old.silence.job.server.web.util.ImportUtils;

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

    public SceneConfigResource(SceneConfigService sceneConfigService) {
        this.sceneConfigService = sceneConfigService;
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
    public Boolean saveSceneConfig(@RequestBody @Validated SceneConfigRequestVO requestVO) {
        return sceneConfigService.saveSceneConfig(requestVO);
    }

    
    @PutMapping("/sceneConfig/{id}")
    public Boolean updateSceneConfig(@PathVariable BigInteger id, @RequestBody @Validated SceneConfigRequestVO requestVO) {
        return sceneConfigService.updateSceneConfig(requestVO);
    }

    
    @PostMapping(value = "/sceneConfig/import", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public void importScene(@RequestPart("file") MultipartFile file) throws IOException {
        // 写入数据
        sceneConfigService.importSceneConfig(ImportUtils.parseList(file, SceneConfigRequestVO.class));
    }

    
    @PostMapping("/sceneConfig/export")
    public ResponseEntity<String> export(@RequestBody ExportSceneVO exportSceneVO) {
        return ExportUtils.doExport(sceneConfigService.exportSceneConfig(exportSceneVO));
    }

    
    @DeleteMapping("/sceneConfig/ids")
    public boolean deleteByIds(@RequestBody @NotEmpty(message = "ids不能为空") Set<BigInteger> ids) {
        return sceneConfigService.deleteByIds(ids);
    }
}
