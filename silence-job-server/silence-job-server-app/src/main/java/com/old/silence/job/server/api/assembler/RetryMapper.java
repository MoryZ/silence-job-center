package com.old.silence.job.server.api.assembler;


import org.mapstruct.Mapper;
import org.springframework.core.convert.converter.Converter;
import com.old.silence.core.mapstruct.MapStructSpringConfig;
import com.old.silence.job.server.domain.model.Retry;
import com.old.silence.job.server.dto.RetryCommand;

@Mapper(uses = MapStructSpringConfig.class)
public interface RetryMapper extends Converter<RetryCommand, Retry> {

    @Override
    Retry convert(RetryCommand source);
}
