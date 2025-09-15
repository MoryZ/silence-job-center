package com.old.silence.job.server.api.assembler;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import com.old.silence.job.server.dto.RetrySaveRequestVO;
import com.old.silence.job.server.model.dto.RetryTaskDTO;
import com.old.silence.job.server.retry.task.support.generator.retry.TaskContext;



@Mapper
public interface TaskContextMapper {
    TaskContextMapper INSTANCE = Mappers.getMapper(TaskContextMapper.class);

    TaskContext.TaskInfo convert(RetrySaveRequestVO retrySaveRequestVO);

    TaskContext.TaskInfo convert(RetryTaskDTO retry);
}
