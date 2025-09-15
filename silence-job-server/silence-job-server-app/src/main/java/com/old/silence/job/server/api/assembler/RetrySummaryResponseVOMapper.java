package com.old.silence.job.server.api.assembler;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import com.old.silence.job.server.vo.DashboardCardResponseDO;
import com.old.silence.job.server.vo.DashboardCardResponseVO;


@Mapper
public interface RetrySummaryResponseVOMapper {

    RetrySummaryResponseVOMapper INSTANCE = Mappers.getMapper(RetrySummaryResponseVOMapper.class);

    DashboardCardResponseVO.RetryTask convert(DashboardCardResponseDO.RetryTask retryTask);
}
