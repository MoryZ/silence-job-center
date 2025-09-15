package com.old.silence.job.server.api.assembler;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import com.old.silence.job.server.domain.model.RetryTask;
import com.old.silence.job.server.vo.RetryTaskResponseVO;



@Mapper
public interface RetryTaskLogResponseVOMapper {

    RetryTaskLogResponseVOMapper INSTANCE = Mappers.getMapper(RetryTaskLogResponseVOMapper.class);

    RetryTaskResponseVO convert(RetryTask retryTask);


}
