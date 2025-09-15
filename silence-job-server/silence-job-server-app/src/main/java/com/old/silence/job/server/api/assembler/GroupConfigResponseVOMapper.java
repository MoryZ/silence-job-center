package com.old.silence.job.server.api.assembler;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import com.old.silence.job.server.domain.model.GroupConfig;
import com.old.silence.job.server.vo.GroupConfigResponseVO;

import java.util.List;

@Mapper
public interface GroupConfigResponseVOMapper {

    GroupConfigResponseVOMapper INSTANCE = Mappers.getMapper(GroupConfigResponseVOMapper.class);

 
    GroupConfigResponseVO convert(GroupConfig groupConfig);

    List<GroupConfigResponseVO> convertList(List<GroupConfig> groupConfigs);
}
