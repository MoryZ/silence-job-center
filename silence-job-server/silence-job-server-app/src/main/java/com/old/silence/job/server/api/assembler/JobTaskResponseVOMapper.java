package com.old.silence.job.server.api.assembler;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import com.old.silence.job.server.domain.model.JobTask;
import com.old.silence.job.server.vo.JobTaskResponseVO;


@Mapper
public interface JobTaskResponseVOMapper {

    JobTaskResponseVOMapper INSTANCE = Mappers.getMapper(JobTaskResponseVOMapper.class);

    JobTaskResponseVO convert(JobTask jobTasks);
}
