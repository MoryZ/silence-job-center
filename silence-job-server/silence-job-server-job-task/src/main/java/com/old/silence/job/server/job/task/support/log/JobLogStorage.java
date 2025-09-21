package com.old.silence.job.server.job.task.support.log;

import org.apache.pekko.actor.ActorRef;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;
import com.alibaba.fastjson2.JSON;
import com.google.common.collect.Lists;
import com.old.silence.job.log.dto.LogContentDTO;
import com.old.silence.job.log.dto.TaskLogFieldDTO;
import com.old.silence.job.log.enums.LogTypeEnum;
import com.old.silence.job.server.common.LogStorage;
import com.old.silence.job.server.common.dto.JobLogMetaDTO;
import com.old.silence.job.server.common.dto.LogMetaDTO;
import com.old.silence.job.server.common.log.LogStorageFactory;
import com.old.silence.job.server.job.task.dto.JobLogDTO;
import com.old.silence.job.common.pekko.ActorGenerator;

import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;


@Component
public class JobLogStorage implements LogStorage, InitializingBean {

    @Override
    public LogTypeEnum logType() {
        return LogTypeEnum.JOB;
    }

    @Override
    public void storage(final LogContentDTO logContentDTO, final LogMetaDTO logMetaDTO) {

        JobLogMetaDTO jobLogMetaDTO = (JobLogMetaDTO) logMetaDTO;
        JobLogDTO jobLogDTO = new JobLogDTO();
        Map<String, String> messageMap = logContentDTO.getFieldList()
                .stream()
                .filter(logTaskDTO_ -> !Objects.isNull(logTaskDTO_.getValue()))
                .collect(Collectors.toMap(TaskLogFieldDTO::getName, TaskLogFieldDTO::getValue));
        jobLogDTO.setMessage(JSON.toJSONString(Lists.newArrayList(messageMap)));
        jobLogDTO.setTaskId(jobLogMetaDTO.getTaskId());
        jobLogDTO.setJobId(jobLogMetaDTO.getJobId());
        jobLogDTO.setGroupName(logMetaDTO.getGroupName());
        jobLogDTO.setNamespaceId(logMetaDTO.getNamespaceId());
        jobLogDTO.setTaskBatchId(jobLogMetaDTO.getTaskBatchId());
        jobLogDTO.setRealTime(logContentDTO.getTimeStamp());
        ActorRef actorRef = ActorGenerator.jobLogActor();
        actorRef.tell(jobLogDTO, actorRef);
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        LogStorageFactory.register(logType(), this);
    }
}
