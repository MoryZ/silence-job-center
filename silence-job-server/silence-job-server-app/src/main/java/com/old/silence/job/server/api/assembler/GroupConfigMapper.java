package com.old.silence.job.server.api.assembler;


import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import com.old.silence.job.server.domain.model.GroupConfig;
import com.old.silence.job.server.dto.GroupConfigCommand;


@Mapper
public interface GroupConfigMapper {

    GroupConfigMapper INSTANCE = Mappers.getMapper(GroupConfigMapper.class);

    GroupConfig toGroupConfig(GroupConfigCommand groupConfigCommand);

    GroupConfig toGroupConfigs(GroupConfigCommand groupConfigCommand);

    GroupConfigCommand toGroupConfigRequestVO(GroupConfig groupConfig);


}
