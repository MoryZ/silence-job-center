package com.old.silence.job.server.api.assembler;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import com.old.silence.job.server.domain.model.RetryDeadLetter;
import com.old.silence.job.server.vo.RetryDeadLetterResponseVO;

import java.util.List;


@Mapper
public interface RetryDeadLetterResponseVOMapper {

    RetryDeadLetterResponseVOMapper INSTANCE = Mappers.getMapper(RetryDeadLetterResponseVOMapper.class);

    RetryDeadLetterResponseVO convert(RetryDeadLetter retryDeadLetter);

    List<RetryDeadLetterResponseVO> convertList(List<RetryDeadLetter> retryDeadLetters);
}
