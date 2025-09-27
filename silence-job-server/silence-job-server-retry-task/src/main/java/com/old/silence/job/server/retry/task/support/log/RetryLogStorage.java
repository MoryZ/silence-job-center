package com.old.silence.job.server.retry.task.support.log;

import org.apache.pekko.actor.ActorRef;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;
import com.alibaba.fastjson2.JSON;
import com.google.common.collect.Lists;
import com.old.silence.job.log.dto.LogContentDTO;
import com.old.silence.job.log.dto.TaskLogFieldDTO;
import com.old.silence.job.log.enums.LogTypeEnum;
import com.old.silence.job.server.common.LogStorage;
import com.old.silence.job.server.common.dto.LogMetaDTO;
import com.old.silence.job.server.common.dto.RetryLogMetaDTO;
import com.old.silence.job.server.common.log.LogStorageFactory;
import com.old.silence.job.server.common.pekko.ActorGenerator;
import com.old.silence.job.server.retry.task.dto.RetryTaskLogDTO;

import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;


@Component
public class RetryLogStorage implements LogStorage, InitializingBean {

    @Override
    public LogTypeEnum logType() {
        return LogTypeEnum.RETRY;
    }

    @Override
    public void storage(final LogContentDTO logContentDTO, final LogMetaDTO logMetaDTO) {
        RetryLogMetaDTO retryLogMetaDTO = (RetryLogMetaDTO) logMetaDTO;
        RetryTaskLogDTO retryTaskLogDTO = new RetryTaskLogDTO();
        Map<String, String> messageMap = logContentDTO.getFieldList()
                .stream()
                .filter(logTaskDTO_ -> !Objects.isNull(logTaskDTO_.getValue()))
                .collect(Collectors.toMap(TaskLogFieldDTO::getName, TaskLogFieldDTO::getValue));
        retryTaskLogDTO.setMessage(JSON.toJSONString(Lists.newArrayList(messageMap)));
        retryTaskLogDTO.setGroupName(retryLogMetaDTO.getGroupName());
        retryTaskLogDTO.setNamespaceId(retryLogMetaDTO.getNamespaceId());
        retryTaskLogDTO.setRetryId(retryLogMetaDTO.getRetryId());
        retryTaskLogDTO.setRetryTaskId(retryLogMetaDTO.getRetryTaskId());
        retryTaskLogDTO.setRealTime(retryLogMetaDTO.getTimestamp());
        ActorRef actorRef = ActorGenerator.logActor();
        actorRef.tell(retryTaskLogDTO, actorRef);
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        LogStorageFactory.register(logType(), this);
    }
}
