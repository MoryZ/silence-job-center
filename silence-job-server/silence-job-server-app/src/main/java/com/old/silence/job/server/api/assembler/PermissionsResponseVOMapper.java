package com.old.silence.job.server.api.assembler;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import com.old.silence.job.server.domain.model.SystemUserPermission;
import com.old.silence.job.server.vo.PermissionsResponseVO;

@Mapper
public interface PermissionsResponseVOMapper {

    PermissionsResponseVOMapper INSTANCE = Mappers.getMapper(PermissionsResponseVOMapper.class);

    PermissionsResponseVO convertList(SystemUserPermission systemUserPermissionList);

}
