package com.old.silence.job.server.api.assembler;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import com.old.silence.job.server.domain.model.ServerNode;
import com.old.silence.job.server.vo.ServerNodeResponseVO;


@Mapper
public interface ServerNodeResponseVOMapper {

    ServerNodeResponseVOMapper INSTANCE = Mappers.getMapper(ServerNodeResponseVOMapper.class);

 
    ServerNodeResponseVO convert(ServerNode server);

}
