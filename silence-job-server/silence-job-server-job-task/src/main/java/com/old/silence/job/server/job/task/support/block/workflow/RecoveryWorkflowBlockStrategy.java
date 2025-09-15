package com.old.silence.job.server.job.task.support.block.workflow;

import org.springframework.stereotype.Component;
import com.old.silence.platform.job.common.core.enums.JobBlockStrategy;
import com.old.silence.platform.job.server.exception.SilenceJobServerException;
import com.old.silence.platform.job.server.job.task.support.handler.WorkflowBatchHandler;

import java.io.IOException;


@Component
public class RecoveryWorkflowBlockStrategy extends AbstractWorkflowBlockStrategy {
    private final WorkflowBatchHandler workflowBatchHandler;

    public RecoveryWorkflowBlockStrategy(WorkflowBatchHandler workflowBatchHandler) {
        this.workflowBatchHandler = workflowBatchHandler;
    }

    @Override
    protected void doBlock(final WorkflowBlockStrategyContext workflowBlockStrategyContext) {

        try {
            workflowBatchHandler.recoveryWorkflowExecutor(workflowBlockStrategyContext.getWorkflowTaskBatchId(), null);
        } catch (IOException e) {
            throw new SilenceJobServerException("校验工作流失败", e);
        }
    }

    @Override
    protected JobBlockStrategy blockStrategyEnum() {
        return JobBlockStrategy.RECOVERY;
    }
}
