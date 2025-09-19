package com.old.silence.job.server.retry.task.support.dispatch;

import cn.hutool.util.StrUtil;
import org.apache.pekko.actor.AbstractActor;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import com.alibaba.fastjson2.JSON;
import com.old.silence.util.CollectionUtils;
import com.old.silence.job.log.dto.TaskLogFieldDTO;
import com.old.silence.job.server.domain.model.RetryTaskLogMessage;
import com.old.silence.job.server.infrastructure.persistence.dao.RetryTaskLogMessageDao;
import com.old.silence.job.server.model.dto.RetryLogTaskDTO;
import com.old.silence.job.server.pekko.ActorGenerator;
import com.old.silence.job.server.retry.task.dto.RetryTaskLogDTO;
import com.old.silence.job.server.retry.task.support.RetryTaskConverter;

import java.math.BigInteger;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * 处理日志信息
 *
 */
@Component(ActorGenerator.LOG_ACTOR)
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class RetryLogActor extends AbstractActor {
    private final RetryTaskLogMessageDao retryTaskLogMessageDao;

    public RetryLogActor(RetryTaskLogMessageDao retryTaskLogMessageDao) {
        this.retryTaskLogMessageDao = retryTaskLogMessageDao;
    }

    @Override
    public Receive createReceive() {
        return receiveBuilder().match(List.class,
                list -> {
                    if (CollectionUtils.isEmpty(list)) {
                        return;
                    }
                    saveRetryTaskLogMessage((List<RetryLogTaskDTO>) list);
                    getContext().stop(getSelf());
                }).match(RetryTaskLogDTO.class,
                retryTaskLogDTO -> {
                    saveRetryTaskLogMessage(retryTaskLogDTO);
                    getContext().stop(getSelf());
                }).build();
    }

    private void saveRetryTaskLogMessage(final List<RetryLogTaskDTO> list) {

        List<RetryLogTaskDTO> jobLogTasks = list;
        Map<BigInteger, List<RetryLogTaskDTO>> logTaskDTOMap = jobLogTasks.
                stream().collect(Collectors.groupingBy(RetryLogTaskDTO::getRetryTaskId, Collectors.toList()));
        List<RetryTaskLogMessage> retryTaskLogMessages = new ArrayList<>();
        for (List<RetryLogTaskDTO> logTaskDTOList : logTaskDTOMap.values()) {
            RetryTaskLogMessage retryTaskLogMessage = RetryTaskConverter.INSTANCE.toRetryTaskLogMessage(
                    logTaskDTOList.get(0));
            retryTaskLogMessage.setCreatedDate(Instant.now());
            retryTaskLogMessage.setLogNum(logTaskDTOList.size());
            List<Map<String, String>> messageMapList = logTaskDTOList.stream()
                    .map(taskDTO -> taskDTO.getFieldList()
                            .stream().filter(logTaskDTO_ -> !Objects.isNull(logTaskDTO_.getValue()))
                            .collect(Collectors.toMap(TaskLogFieldDTO::getName, TaskLogFieldDTO::getValue)))
                    .collect(Collectors.toList());
            retryTaskLogMessage.setMessage(JSON.toJSONString(messageMapList));

            retryTaskLogMessages.add(retryTaskLogMessage);
        }

        retryTaskLogMessageDao.insertBatch(retryTaskLogMessages);
    }

    /**
     * 报错日志详情
     */
    private void saveRetryTaskLogMessage(RetryTaskLogDTO retryTaskLogDTO) {

        // 记录重试日志
        RetryTaskLogMessage retryTaskLogMessage = new RetryTaskLogMessage();
        retryTaskLogMessage.setRetryId(retryTaskLogDTO.getRetryId());
        retryTaskLogMessage.setRetryTaskId(retryTaskLogDTO.getRetryTaskId());
        retryTaskLogMessage.setGroupName(retryTaskLogDTO.getGroupName());
        retryTaskLogMessage.setNamespaceId(retryTaskLogDTO.getNamespaceId());
        retryTaskLogMessage.setLogNum(1);
        retryTaskLogMessage.setRealTime(retryTaskLogDTO.getRealTime());
        String errorMessage = retryTaskLogDTO.getMessage();
        retryTaskLogMessage.setMessage(
                StrUtil.isBlank(errorMessage) ? StrUtil.EMPTY : errorMessage);
        retryTaskLogMessage.setCreatedDate(Optional.ofNullable(retryTaskLogDTO.getTriggerTime()).orElse(Instant.now()));
        retryTaskLogMessageDao.insert(retryTaskLogMessage);

    }
}
