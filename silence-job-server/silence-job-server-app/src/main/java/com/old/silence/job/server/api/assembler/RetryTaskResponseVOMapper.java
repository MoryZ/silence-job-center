package com.old.silence.job.server.api.assembler;


import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;
import com.old.silence.job.server.domain.model.Retry;
import com.old.silence.job.server.vo.RetryResponseVO;

import java.time.Instant;
import java.util.List;
import java.util.Objects;


@Mapper
public interface RetryTaskResponseVOMapper {

    RetryTaskResponseVOMapper INSTANCE = Mappers.getMapper(RetryTaskResponseVOMapper.class);

    @Mapping(target = "nextTriggerAt", expression = "java(toLocalDateTime(retry.getNextTriggerAt()))")
 
    RetryResponseVO convert(Retry retry);

    List<RetryResponseVO> convertList(List<Retry> retries);

    default Instant toLocalDateTime(Long nextTriggerAt) {
        if (Objects.isNull(nextTriggerAt) || nextTriggerAt == 0) {
            return null;
        }

        return Instant.ofEpochMilli(nextTriggerAt);
    }
}
