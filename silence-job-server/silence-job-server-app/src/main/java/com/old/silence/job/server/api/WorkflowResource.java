package com.old.silence.job.server.api;

import cn.hutool.core.lang.Pair;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.old.silence.job.server.domain.model.Workflow;
import com.old.silence.job.server.dto.CheckDecisionVO;
import com.old.silence.job.server.dto.ExportWorkflowVO;
import com.old.silence.job.server.dto.WorkflowCommand;
import com.old.silence.job.server.dto.WorkflowQueryVO;
import com.old.silence.job.server.dto.WorkflowTriggerVO;
import com.old.silence.job.server.vo.WorkflowDetailResponseVO;
import com.old.silence.job.server.vo.WorkflowResponseVO;
import com.old.silence.job.server.web.domain.service.WorkflowService;
import com.old.silence.job.server.web.util.ExportUtils;
import com.old.silence.job.server.web.util.ImportUtils;

import javax.validation.constraints.NotEmpty;
import java.io.IOException;
import java.math.BigInteger;
import java.util.List;
import java.util.Set;


@RestController
@RequestMapping("/workflow")
public class WorkflowResource {

    private final WorkflowService workflowService;

    public WorkflowResource(WorkflowService workflowService) {
        this.workflowService = workflowService;
    }

    @PostMapping
    public Boolean saveWorkflow(@RequestBody @Validated WorkflowCommand workflowCommand) {
        return workflowService.saveWorkflow(workflowCommand);
    }

    @GetMapping("/page/list")
    public IPage<WorkflowResponseVO> listPage(Page<Workflow> page, WorkflowQueryVO queryVO) {
        return workflowService.listPage(page, queryVO);
    }

    @PutMapping
    public Boolean updateWorkflow(@RequestBody @Validated WorkflowCommand workflowCommand) {
        return workflowService.updateWorkflow(workflowCommand);
    }

    @GetMapping("{id}")
    public WorkflowDetailResponseVO getWorkflowDetail(@PathVariable BigInteger id) throws IOException {
        return workflowService.getWorkflowDetail(id);
    }

    @PutMapping("/update/status/{id}")
    public Boolean updateStatus(@PathVariable BigInteger id) {
        return workflowService.updateStatus(id);
    }

    @DeleteMapping("/ids")
    public Boolean deleteByIds(@RequestBody @NotEmpty(message = "ids不能为空") Set<BigInteger> ids) {
        return workflowService.deleteByIds(ids);
    }

    @PostMapping("/trigger")
    public Boolean trigger(@RequestBody @Validated WorkflowTriggerVO triggerVO) {
        return workflowService.trigger(triggerVO);
    }

    @GetMapping("/workflow-name/list")
    public List<WorkflowResponseVO> getWorkflowNameList(
            @RequestParam(value = "keywords", required = false) String keywords,
            @RequestParam(value = "workflowId", required = false) BigInteger workflowId,
            @RequestParam(value = "groupName", required = false) String groupName) {
        return workflowService.getWorkflowNameList(keywords, workflowId, groupName);
    }
    @PostMapping("/check-node-expression")
    public Pair<Integer, Object> checkNodeExpression(@RequestBody @Validated CheckDecisionVO checkDecisionVO) {
        return workflowService.checkNodeExpression(checkDecisionVO);
    }

    
    @PostMapping(value = "/import", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public void importScene(@RequestPart("file") MultipartFile file) throws IOException {
        // 写入数据
        workflowService.importWorkflowTask(ImportUtils.parseList(file, WorkflowCommand.class));
    }

    
    @PostMapping("/export")
    public ResponseEntity<String> export(@RequestBody ExportWorkflowVO exportWorkflowVO) {
        return ExportUtils.doExport(workflowService.exportWorkflowTask(exportWorkflowVO));
    }

}
