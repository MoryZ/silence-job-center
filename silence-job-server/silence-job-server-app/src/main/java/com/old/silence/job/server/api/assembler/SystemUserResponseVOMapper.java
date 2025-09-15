package com.old.silence.job.server.api.assembler;


import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import com.old.silence.job.server.domain.model.SystemUser;
import com.old.silence.job.server.dto.UserSessionVO;
import com.old.silence.job.server.vo.SystemUserResponseVO;

import java.util.List;


@Mapper
public interface SystemUserResponseVOMapper {

    SystemUserResponseVOMapper INSTANCE = Mappers.getMapper(SystemUserResponseVOMapper.class);

    SystemUserResponseVO convert(UserSessionVO systemUser);

    SystemUserResponseVO convert(SystemUser systemUser);

    List<SystemUserResponseVO> convertList(List<SystemUser> systemUsers);
}
