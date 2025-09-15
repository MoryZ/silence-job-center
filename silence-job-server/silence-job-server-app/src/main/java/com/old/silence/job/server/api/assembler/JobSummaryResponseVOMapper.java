package com.old.silence.job.server.api.assembler;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;
import com.old.silence.job.server.vo.DashboardCardResponseDO;
import com.old.silence.job.server.vo.DashboardCardResponseVO;
import com.old.silence.job.server.vo.DashboardRetryLineResponseDO;
import com.old.silence.job.server.vo.DashboardRetryLineResponseVO;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Objects;


@Mapper
public interface JobSummaryResponseVOMapper {

    JobSummaryResponseVOMapper INSTANCE = Mappers.getMapper(JobSummaryResponseVOMapper.class);

    @Mapping(target = "successRate", expression = "java(JobSummaryResponseVOMapper.toSuccessRate(jobTask.getSuccessNum(), jobTask.getTotalNum()))")
    DashboardCardResponseVO.JobTask convert(DashboardCardResponseDO.JobTask jobTask);

    @Mapping(target = "successRate", expression = "java(JobSummaryResponseVOMapper.toSuccessRate(jobTask.getSuccessNum(), jobTask.getTotalNum()))")
    DashboardCardResponseVO.WorkFlowTask convertToWorkFlowTask(DashboardCardResponseDO.JobTask jobTask);

    DashboardRetryLineResponseVO.Task convertList(DashboardRetryLineResponseDO.Task task);

    static BigDecimal toSuccessRate(Integer successNum, Integer totalNum) {
        if (Objects.isNull(totalNum) || totalNum == 0) {
            return null;
        }
        return new BigDecimal(String.valueOf(successNum)).divide(new BigDecimal(String.valueOf(totalNum)), 4, RoundingMode.HALF_UP).multiply(new BigDecimal("100"));
    }
}
