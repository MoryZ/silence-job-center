package com.old.silence.job.server.domain.service;

import java.math.BigInteger;
import java.util.Objects;
import java.util.Set;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.metadata.IPage;
import com.old.silence.job.common.constant.SystemConstants;
import com.old.silence.job.common.enums.SystemTaskType;
import com.old.silence.job.server.domain.model.Job;
import com.old.silence.job.server.domain.model.JobTaskBatch;
import com.old.silence.job.server.domain.model.WorkflowNode;
import com.old.silence.job.server.dto.CallbackConfig;
import com.old.silence.job.server.dto.DecisionConfig;
import com.old.silence.job.server.infrastructure.persistence.dao.JobDao;
import com.old.silence.job.server.infrastructure.persistence.dao.JobTaskBatchDao;
import com.old.silence.job.server.infrastructure.persistence.dao.WorkflowNodeDao;
import com.old.silence.job.server.vo.JobBatchResponseVO;
import com.old.silence.job.server.web.api.assembler.JobBatchResponseVOConverter;
import com.old.silence.job.server.web.domain.service.handler.JobHandler;


@Service
public class JobBatchService {

    private final JobTaskBatchDao jobTaskBatchDao;
    private final JobDao jobDao;
    private final WorkflowNodeDao workflowNodeDao;
    private final JobHandler jobHandler;

    public JobBatchService(JobTaskBatchDao jobTaskBatchDao, JobDao jobDao,
                           WorkflowNodeDao workflowNodeDao, JobHandler jobHandler) {
        this.jobTaskBatchDao = jobTaskBatchDao;
        this.jobDao = jobDao;
        this.workflowNodeDao = workflowNodeDao;
        this.jobHandler = jobHandler;
    }


    public IPage<JobBatchResponseVO> getJobBatchPage(Page<JobTaskBatch> page, QueryWrapper<JobTaskBatch> queryWrapper) {

        //queryWrapper.eq("batch.namespace_id", "764d604ec6fc45f68cd92514c40e9e1a");
        var jobTaskBatchPage = jobTaskBatchDao.selectPage(page, queryWrapper);

        return jobTaskBatchPage.convert(JobBatchResponseVOConverter.INSTANCE::convert);
    }


    public JobBatchResponseVO getJobBatchDetail(final Long id) {
        JobTaskBatch jobTaskBatch = jobTaskBatchDao.selectById(id);
        if (Objects.isNull(jobTaskBatch)) {
            return null;
        }

        Job job = jobDao.selectById(jobTaskBatch.getJobId());
        JobBatchResponseVO jobBatchResponseVO = JobBatchResponseVOConverter.INSTANCE.convert(jobTaskBatch, job);

        if (jobTaskBatch.getSystemTaskType().equals(SystemTaskType.WORKFLOW)) {
            WorkflowNode workflowNode = workflowNodeDao.selectById(jobTaskBatch.getWorkflowNodeId());
            jobBatchResponseVO.setNodeName(workflowNode.getNodeName());

            // 回调节点
            if (SystemConstants.CALLBACK_JOB_ID.equals(jobTaskBatch.getJobId())) {
                jobBatchResponseVO.setCallback(JSON.parseObject(workflowNode.getNodeInfo(), CallbackConfig.class));
                jobBatchResponseVO.setExecutionAt(jobTaskBatch.getCreatedDate());
                return jobBatchResponseVO;
            }

            // 条件节点
            if (SystemConstants.DECISION_JOB_ID.equals(jobTaskBatch.getJobId())) {
                jobBatchResponseVO.setDecision(JSON.parseObject(workflowNode.getNodeInfo(), DecisionConfig.class));
                jobBatchResponseVO.setExecutionAt(jobTaskBatch.getCreatedDate());
                return jobBatchResponseVO;
            }
        }

        return jobBatchResponseVO;
    }


    public boolean stop(BigInteger taskBatchId) {
        return jobHandler.stop(taskBatchId);
    }


    @Transactional
    public Boolean retry(BigInteger taskBatchId) {
        return jobHandler.retry(taskBatchId);
    }


    public Boolean deleteJobBatchByIds(Set<BigInteger> ids) {
        String namespaceId = "111";
        jobHandler.deleteJobTaskBatchByIds(ids, namespaceId);
        return Boolean.TRUE;
    }
}
