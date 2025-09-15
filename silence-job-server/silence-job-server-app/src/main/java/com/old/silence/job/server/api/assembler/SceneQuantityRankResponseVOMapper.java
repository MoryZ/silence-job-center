package com.old.silence.job.server.api.assembler;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import com.old.silence.job.server.vo.DashboardRetryLineResponseDO;
import com.old.silence.job.server.vo.DashboardRetryLineResponseVO;


@Mapper
public interface SceneQuantityRankResponseVOMapper {

    SceneQuantityRankResponseVOMapper INSTANCE = Mappers.getMapper(SceneQuantityRankResponseVOMapper.class);

    DashboardRetryLineResponseVO.Rank convertList(DashboardRetryLineResponseDO.Rank rank);
}
