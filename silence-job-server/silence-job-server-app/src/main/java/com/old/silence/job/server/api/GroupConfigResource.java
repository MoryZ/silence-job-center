package com.old.silence.job.server.api;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.old.silence.data.commons.converter.QueryWrapperConverter;
import com.old.silence.job.server.domain.model.GroupConfig;
import com.old.silence.job.server.dto.ExportGroupVO;
import com.old.silence.job.server.dto.GroupConfigCommand;
import com.old.silence.job.server.dto.GroupConfigQuery;
import com.old.silence.job.server.dto.GroupStatusUpdateCommand;
import com.old.silence.job.server.vo.GroupConfigResponseVO;
import com.old.silence.job.server.web.api.vo.CommonOptions;
import com.old.silence.job.server.web.domain.service.GroupConfigService;
import com.old.silence.job.server.web.util.ExportUtils;
import com.old.silence.job.server.web.util.ImportUtils;

import java.io.IOException;
import java.math.BigInteger;
import java.util.List;


@RestController
@RequestMapping("/api/v1")
public class GroupConfigResource {
    private final GroupConfigService groupConfigService;

    public GroupConfigResource(GroupConfigService groupConfigService) {
        this.groupConfigService = groupConfigService;
    }

    @GetMapping(path= "/groupConfigs", params = {"pageNo", "pageSize"})
    public Page<GroupConfigResponseVO> queryPage(Page<GroupConfigResponseVO> page, GroupConfigQuery queryVO) {
        var queryWrapper = QueryWrapperConverter.convert(queryVO, GroupConfig.class);
        return groupConfigService.queryPage(page, queryWrapper);
    }

    @GetMapping("/groupConfigs/{groupName}")
    public GroupConfigResponseVO getGroupConfigByGroupName(@PathVariable String groupName) {
        return groupConfigService.getGroupConfigByGroupName(groupName);
    }

    @GetMapping("/groupConfigs")
    public List<CommonOptions> getAllGroupNameList() {
        return groupConfigService.getAllGroupNameList();
    }

    @PostMapping("/groupConfigs")
    public List<GroupConfigResponseVO> getAllGroupNameList(@RequestBody List<String> namespaceIds) {
        return groupConfigService.getAllGroupConfigList(namespaceIds);
    }

    @PostMapping("/groups")
    public Boolean create(@RequestBody @Validated GroupConfigCommand groupConfigCommand) {
        return groupConfigService.create(groupConfigCommand);
    }

    @PostMapping(value = "/groupConfigs/import", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public void importScene(@RequestPart MultipartFile file) throws IOException {
        groupConfigService.importGroup(ImportUtils.parseList(file, GroupConfigCommand.class));
    }

    @PostMapping("/groupConfigs/export")
    public ResponseEntity<String> exportGroup(@RequestBody ExportGroupVO exportGroupVO) {
        return ExportUtils.doExport(groupConfigService.exportGroup(exportGroupVO));
    }


    @PutMapping("/groupConfigs/{id}")
    public Boolean update(@PathVariable BigInteger id, @RequestBody @Validated GroupConfigCommand groupConfigCommand) {
        return groupConfigService.updateGroup(groupConfigCommand);
    }

    @PutMapping("/groupConfigs/enable")
    public Boolean enable(@RequestBody @Validated GroupStatusUpdateCommand requestVO) {
        return groupConfigService.updateGroupStatus(requestVO.getGroupName(), true);
    }

    @PutMapping("/groupConfigs/disable")
    public Boolean disable(@RequestBody @Validated GroupStatusUpdateCommand requestVO) {
        return groupConfigService.updateGroupStatus(requestVO.getGroupName(), false);
    }

    @DeleteMapping("/groupConfigs/{groupName}")
    public boolean deleteByGroupName(@PathVariable String groupName) {
        return groupConfigService.deleteByGroupName(groupName);
    }
}
