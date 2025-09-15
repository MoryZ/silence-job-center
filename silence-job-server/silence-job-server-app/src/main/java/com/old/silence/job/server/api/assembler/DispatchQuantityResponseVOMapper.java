package com.old.silence.job.server.api.assembler;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import com.old.silence.job.server.vo.DashboardLineResponseDO;
import com.old.silence.job.server.vo.DashboardLineResponseVO;

import java.util.List;


@Mapper
public interface DispatchQuantityResponseVOMapper {

    DispatchQuantityResponseVOMapper INSTANCE = Mappers.getMapper(DispatchQuantityResponseVOMapper.class);

    List<DashboardLineResponseVO> convertList(List<DashboardLineResponseDO> dashboardLineResponseDOList);
}
