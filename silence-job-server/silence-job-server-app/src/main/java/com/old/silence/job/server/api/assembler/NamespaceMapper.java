package com.old.silence.job.server.api.assembler;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import com.old.silence.job.server.domain.model.Namespace;
import com.old.silence.job.server.dto.NamespaceCommand;
import com.old.silence.job.server.vo.NamespaceResponseVO;



@Mapper
public interface NamespaceMapper {

    NamespaceMapper INSTANCE = Mappers.getMapper(NamespaceMapper.class);

    NamespaceResponseVO convert(Namespace namespace);

    Namespace convert(NamespaceCommand command);
}
