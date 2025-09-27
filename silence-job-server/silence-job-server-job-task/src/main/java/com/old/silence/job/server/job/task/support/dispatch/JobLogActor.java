package com.old.silence.job.server.job.task.support.dispatch;

import cn.hutool.core.util.StrUtil;
import org.apache.pekko.actor.AbstractActor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import com.alibaba.fastjson2.JSON;
import com.old.silence.core.util.CollectionUtils;
import com.old.silence.job.common.server.dto.JobLogTaskDTO;
import com.old.silence.job.common.util.StreamUtils;
import com.old.silence.job.log.dto.TaskLogFieldDTO;
import com.old.silence.job.server.domain.model.JobLogMessage;
import com.old.silence.job.server.infrastructure.persistence.dao.JobLogMessageDao;
import com.old.silence.job.server.job.task.dto.JobLogDTO;
import com.old.silence.job.server.job.task.support.JobTaskConverter;
import com.old.silence.job.server.common.pekko.ActorGenerator;

import java.math.BigInteger;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;


@Component(ActorGenerator.JOB_LOG_ACTOR)
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)

public class JobLogActor extends AbstractActor {


    private static final Logger log = LoggerFactory.getLogger(JobLogActor.class);
    private final JobLogMessageDao jobLogMessageDao;

    public JobLogActor(JobLogMessageDao jobLogMessageDao) {
        this.jobLogMessageDao = jobLogMessageDao;
    }

    @Override
    public Receive createReceive() {
        return receiveBuilder()
                .match(List.class, (list -> {
                    try {
                        if (CollectionUtils.isEmpty(list)) {
                            return;
                        }

                        List<JobLogTaskDTO> jobLogTasks = (List<JobLogTaskDTO>) list;
                        Map<BigInteger, List<JobLogTaskDTO>> logTaskDTOMap = jobLogTasks.
                                stream().collect(Collectors.groupingBy(JobLogTaskDTO::getTaskId, Collectors.toList()));

                        List<JobLogMessage> jobLogMessageList = new ArrayList<>();
                        for (List<JobLogTaskDTO> logTaskDTOList : logTaskDTOMap.values()) {
                            JobLogMessage jobLogMessage = JobTaskConverter.INSTANCE.toJobLogMessage(logTaskDTOList.get(0));
                            jobLogMessage.setCreatedDate(Instant.now());
                            jobLogMessage.setLogNum(logTaskDTOList.size());
                            List<Map<String, String>> messageMapList = StreamUtils.toList(logTaskDTOList,
                                    taskDTO -> taskDTO.getFieldList()
                                            .stream().filter(logTaskDTO_ -> !Objects.isNull(logTaskDTO_.getValue()))
                                            .collect(Collectors.toMap(TaskLogFieldDTO::getName, TaskLogFieldDTO::getValue)));
                            jobLogMessage.setMessage(JSON.toJSONString(messageMapList));

                            jobLogMessageList.add(jobLogMessage);
                        }

                        jobLogMessageDao.insertBatch(jobLogMessageList);
                    } catch (Exception e) {
                        log.error("保存客户端日志异常.", e);
                    } finally {
                        getContext().stop(getSelf());
                    }
                }))
                .match(JobLogDTO.class, (jobLogDTO -> {
                    try {
                        saveLogMessage(jobLogDTO);
                    } catch (Exception e) {
                        log.error("保存日志异常.", e);
                    } finally {
                        getContext().stop(getSelf());
                    }
                })).build();

    }

    private void saveLogMessage(JobLogDTO jobLogDTO) {
        JobLogMessage jobLogMessage = JobTaskConverter.INSTANCE.toJobLogMessage(jobLogDTO);
        jobLogMessage.setCreatedDate(Instant.now());
        jobLogMessage.setLogNum(1);
        jobLogMessage.setMessage(Optional.ofNullable(jobLogDTO.getMessage()).orElse(StrUtil.EMPTY));
        jobLogMessage.setTaskId(Optional.ofNullable(jobLogMessage.getTaskId()).orElse(BigInteger.ZERO));
        jobLogMessageDao.insert(jobLogMessage);
    }
}
