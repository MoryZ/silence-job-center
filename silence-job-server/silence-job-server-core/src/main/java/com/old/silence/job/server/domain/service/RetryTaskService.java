package com.old.silence.job.server.domain.service;

import cn.hutool.lang.Assert;
import cn.hutool.util.StrUtil;

import java.math.BigInteger;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.metadata.IPage;
import com.google.common.collect.Lists;
import com.old.silence.job.common.enums.RetryOperationReason;
import com.old.silence.job.common.enums.RetryTaskStatus;
import com.old.silence.job.log.constant.LogFieldConstants;
import com.old.silence.job.server.domain.model.Retry;
import com.old.silence.job.server.domain.model.RetryTask;
import com.old.silence.job.server.domain.model.RetryTaskLogMessage;
import com.old.silence.job.server.dto.RetryTaskLogMessageQueryVO;
import com.old.silence.job.server.dto.RetryTaskQueryVO;
import com.old.silence.job.server.exception.SilenceJobServerException;
import com.old.silence.job.server.infrastructure.persistence.dao.RetryDao;
import com.old.silence.job.server.infrastructure.persistence.dao.RetryTaskDao;
import com.old.silence.job.server.infrastructure.persistence.dao.RetryTaskLogMessageDao;
import com.old.silence.job.server.retry.task.dto.TaskStopJobDTO;
import com.old.silence.job.server.retry.task.support.handler.RetryTaskStopHandler;
import com.old.silence.job.server.vo.RetryTaskLogMessageResponseVO;
import com.old.silence.job.server.vo.RetryTaskResponseVO;
import com.old.silence.job.server.web.api.assembler.RetryMapper;
import com.old.silence.job.server.web.api.assembler.RetryTaskLogResponseVOMapper;
import com.old.silence.job.server.web.api.assembler.RetryTaskResponseVOMapper;
import com.old.silence.util.CollectionUtils;


@Service
public class RetryTaskService {

    private final RetryTaskDao retryTaskDao;
    private final RetryDao retryDao;
    private final RetryTaskLogMessageDao retryTaskLogMessageDao;
    private final RetryTaskStopHandler retryTaskStopHandler;

    public RetryTaskService(RetryTaskDao retryTaskDao, RetryDao retryDao,
                            RetryTaskLogMessageDao retryTaskLogMessageDao, RetryTaskStopHandler retryTaskStopHandler) {
        this.retryTaskDao = retryTaskDao;
        this.retryDao = retryDao;
        this.retryTaskLogMessageDao = retryTaskLogMessageDao;
        this.retryTaskStopHandler = retryTaskStopHandler;
    }

    public IPage<RetryTaskResponseVO> getRetryTaskLogPage(Page<RetryTask> pageDTO, RetryTaskQueryVO queryVO) {

        String namespaceId = "111";

        List<String> groupNames = List.of();

        LambdaQueryWrapper<RetryTask> wrapper = new LambdaQueryWrapper<RetryTask>()
                .eq(RetryTask::getNamespaceId, namespaceId)
                .in(CollectionUtils.isNotEmpty(groupNames), RetryTask::getGroupName, groupNames)
                .eq(StrUtil.isNotBlank(queryVO.getSceneName()), RetryTask::getSceneName, queryVO.getSceneName())
                .eq(queryVO.getTaskStatus() != null, RetryTask::getTaskStatus, queryVO.getTaskStatus())
                .eq(Objects.nonNull(queryVO.getRetryId()), RetryTask::getRetryId, queryVO.getRetryId())
                .select(RetryTask::getGroupName, RetryTask::getId, RetryTask::getSceneName, RetryTask::getTaskStatus,
                        RetryTask::getCreatedDate, RetryTask::getTaskType, RetryTask::getOperationReason, RetryTask::getRetryId)
                .orderByDesc(RetryTask::getCreatedDate);

        Page<RetryTask> retryTaskPageDTO = retryTaskDao.selectPage(pageDTO, wrapper);
        return retryTaskPageDTO.convert(RetryTaskLogResponseVOMapper.INSTANCE::convert);

    }

    public RetryTaskLogMessageResponseVO getRetryTaskLogMessagePage(Page<RetryTaskLogMessage> pageDTO,
             RetryTaskLogMessageQueryVO queryVO) {
        if (queryVO.getRetryTaskId() == null || StrUtil.isBlank(queryVO.getGroupName())) {
            RetryTaskLogMessageResponseVO jobLogResponseVO = new RetryTaskLogMessageResponseVO();
            jobLogResponseVO.setNextStartId(BigInteger.ZERO);
            jobLogResponseVO.setFromIndex(0);
            return jobLogResponseVO;
        }

        String namespaceId = "111";

        Page<RetryTaskLogMessage> selectPage = retryTaskLogMessageDao.selectPage(pageDTO,
                new LambdaQueryWrapper<RetryTaskLogMessage>()
                        .select(RetryTaskLogMessage::getId, RetryTaskLogMessage::getLogNum)
                        .ge(RetryTaskLogMessage::getId, queryVO.getStartId())
                        .eq(RetryTaskLogMessage::getNamespaceId, namespaceId)
                        .eq(RetryTaskLogMessage::getRetryTaskId, queryVO.getRetryTaskId())
                        .eq(RetryTaskLogMessage::getGroupName, queryVO.getGroupName())
                        .orderByAsc(RetryTaskLogMessage::getId).orderByAsc(RetryTaskLogMessage::getRealTime)
                        .orderByDesc(RetryTaskLogMessage::getCreatedDate));

        List<RetryTaskLogMessage> records = selectPage.getRecords();

        if (CollectionUtils.isEmpty(records)) {
            var retryTaskLogMessageResponseVO = new RetryTaskLogMessageResponseVO();
            retryTaskLogMessageResponseVO.setFinished(Boolean.TRUE);
            retryTaskLogMessageResponseVO.setNextStartId(queryVO.getStartId());
            retryTaskLogMessageResponseVO.setFromIndex(0);
            return retryTaskLogMessageResponseVO;
        }

        Integer fromIndex = Optional.ofNullable(queryVO.getFromIndex()).orElse(0);
        RetryTaskLogMessage firstRecord = records.get(0);
        List<BigInteger> ids = Lists.newArrayList(firstRecord.getId());
        int total = firstRecord.getLogNum() - fromIndex;
        for (int i = 1; i < records.size(); i++) {
            RetryTaskLogMessage record = records.get(i);
            if (total + record.getLogNum() > pageDTO.getSize()) {
                break;
            }

            total += record.getLogNum();
            ids.add(record.getId());
        }

        BigInteger nextStartId = BigInteger.ZERO;
        List<Map<String, String>> messages = Lists.newArrayList();
        List<RetryTaskLogMessage> jobLogMessages = retryTaskLogMessageDao.selectList(
                new LambdaQueryWrapper<RetryTaskLogMessage>()
                        .in(RetryTaskLogMessage::getId, ids)
                        .orderByAsc(RetryTaskLogMessage::getId)
                        .orderByAsc(RetryTaskLogMessage::getRealTime)
        );

        for (final RetryTaskLogMessage retryTaskLogMessage : jobLogMessages) {

            List<Map<String, String>> originalList = JSON.parseObject(retryTaskLogMessage.getMessage(), List.class);
            int size = originalList.size() - fromIndex;
            List<Map<String, String>> pageList = originalList.stream().skip(fromIndex).limit(pageDTO.getSize())
                    .collect(Collectors.toList());
            if (messages.size() + size >= pageDTO.getSize()) {
                messages.addAll(pageList);
                nextStartId = retryTaskLogMessage.getId();
                fromIndex = Math.min(fromIndex + ((int) pageDTO.getSize()), originalList.size() - 1) + 1;
                break;
            }

            messages.addAll(pageList);
            nextStartId = Objects.requireNonNull(retryTaskLogMessage.getId()).add(BigInteger.ONE);
            fromIndex = 0;
        }

        messages = messages.stream()
                .sorted(Comparator.comparingLong(o -> Long.parseLong(o.get(LogFieldConstants.TIME_STAMP))))
                .collect(Collectors.toList());

        RetryTaskLogMessageResponseVO responseVO = new RetryTaskLogMessageResponseVO();
        responseVO.setMessage(messages);
        responseVO.setNextStartId(nextStartId);
        responseVO.setFromIndex(fromIndex);

        return responseVO;
    }

    public RetryTaskResponseVO getRetryTaskById(BigInteger id) {
        RetryTask retryTask = retryTaskDao.selectById(id);

        if (retryTask == null) {
            return null;
        }

        Retry retry = retryDao.selectById(retryTask.getRetryId());
        RetryTaskResponseVO responseVO = RetryTaskLogResponseVOMapper.INSTANCE.convert(retryTask);
        responseVO.setResponseVO(RetryTaskResponseVOMapper.INSTANCE.convert(retry));
        return responseVO;
    }

    @Transactional
    public boolean deleteById(BigInteger id) {
        String namespaceId = "111";

        RetryTask retryTask = retryTaskDao.selectOne(
                new LambdaQueryWrapper<RetryTask>()
                        .in(RetryTask::getTaskStatus, RetryTaskStatus.TERMINAL_STATUS_SET)
                        .eq(RetryTask::getNamespaceId, namespaceId)
                        .eq(RetryTask::getId, id));
        Assert.notNull(retryTask, () -> new SilenceJobServerException("数据删除失败"));

        retryTaskLogMessageDao.delete(new LambdaQueryWrapper<RetryTaskLogMessage>()
                .eq(RetryTaskLogMessage::getNamespaceId, namespaceId)
                .eq(RetryTaskLogMessage::getGroupName, retryTask.getGroupName())
                .eq(RetryTaskLogMessage::getRetryTaskId, id)
        );

        return 1 == retryTaskDao.deleteById(id);
    }

    @Transactional
    public boolean batchDelete(final Set<BigInteger> ids) {
        String namespaceId = "111";

        List<RetryTask> retryTasks = retryTaskDao.selectList(
                new LambdaQueryWrapper<RetryTask>()
                        .in(RetryTask::getTaskStatus, RetryTaskStatus.TERMINAL_STATUS_SET)
                        .eq(RetryTask::getNamespaceId, namespaceId)
                        .in(RetryTask::getId, ids));
        Assert.notEmpty(retryTasks, () -> new SilenceJobServerException("数据不存在"));
        Assert.isTrue(retryTasks.size() == ids.size(), () -> new SilenceJobServerException("数据不存在"));

        for (final RetryTask retryTask : retryTasks) {
            retryTaskLogMessageDao.delete(
                    new LambdaQueryWrapper<RetryTaskLogMessage>()
                            .eq(RetryTaskLogMessage::getNamespaceId, namespaceId)
                            .eq(RetryTaskLogMessage::getGroupName, retryTask.getGroupName())
                            .eq(RetryTaskLogMessage::getRetryTaskId, retryTask.getId()));
        }
        return 1 == retryTaskDao.deleteBatchIds(ids);
    }

    public Boolean stopById(BigInteger id) {

        RetryTask retryTask = retryTaskDao.selectById(id);
        Assert.notNull(retryTask, () -> new SilenceJobServerException("没有可执行的任务"));

        Retry retry = retryDao.selectById(retryTask.getRetryId());
        Assert.notNull(retry, () -> new SilenceJobServerException("任务不存在"));

        TaskStopJobDTO taskStopJobDTO = RetryMapper.INSTANCE.toTaskStopJobDTO(retry);
        taskStopJobDTO.setOperationReason(RetryOperationReason.MANNER_STOP);
        taskStopJobDTO.setNeedUpdateTaskStatus(true);
        taskStopJobDTO.setMessage("用户手动触发停止");
        retryTaskStopHandler.stop(taskStopJobDTO);

        return true;
    }
}
