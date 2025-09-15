package com.old.silence.job.server.api;


import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.old.silence.job.server.web.domain.service.WorkflowNodeService;

import java.math.BigInteger;


@RestController
@RequestMapping("/workflow/node")
public class WorkflowNodeResource {
    private final WorkflowNodeService workflowNodeService;

    public WorkflowNodeResource(WorkflowNodeService workflowNodeService) {
        this.workflowNodeService = workflowNodeService;
    }

    @PutMapping("/stop/{nodeId}/{workflowTaskBatchId}")
     public Boolean stop(@PathVariable BigInteger nodeId, @PathVariable BigInteger workflowTaskBatchId) {
        return workflowNodeService.stop(nodeId, workflowTaskBatchId);
    }

    @PutMapping("/retry/{nodeId}/{workflowTaskBatchId}")
    public Boolean retry(@PathVariable BigInteger nodeId,
                         @PathVariable BigInteger workflowTaskBatchId) {
        return workflowNodeService.retry(nodeId, workflowTaskBatchId);
    }
}
