package com.old.silence.job.server.api.assembler;


import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import com.old.silence.job.server.domain.model.Retry;
import com.old.silence.job.server.retry.task.dto.RetryTaskPrepareDTO;
import com.old.silence.job.server.retry.task.dto.TaskStopJobDTO;

@Mapper
public interface RetryMapper {
    RetryMapper INSTANCE = Mappers.getMapper(RetryMapper.class);

    RetryTaskPrepareDTO toRetryTaskPrepareDTO(Retry retry);

    TaskStopJobDTO toTaskStopJobDTO(Retry retry);
}
