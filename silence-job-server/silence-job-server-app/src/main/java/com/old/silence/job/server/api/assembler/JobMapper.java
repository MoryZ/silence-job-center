package com.old.silence.job.server.api.assembler;

import cn.hutool.util.StrUtil;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;
import com.alibaba.fastjson2.JSON;
import com.old.silence.util.CollectionUtils;
import com.old.silence.job.server.domain.model.Job;
import com.old.silence.job.server.dto.JobCommand;

import java.math.BigInteger;
import java.util.HashSet;
import java.util.Set;


@Mapper
public interface JobMapper {

    JobMapper INSTANCE = Mappers.getMapper(JobMapper.class);

    @Mapping(target = "notifyIds", expression = "java(toNotifyIds(job.getNotifyIds()))")
    JobCommand convert(Job job);

    @Mapping(target = "notifyIds", expression = "java(toNotifyIdsStr(jobCommand.getNotifyIds()))")
    Job convert(JobCommand jobCommand);

    default Set<BigInteger> toNotifyIds(String notifyIds) {
        if (StrUtil.isBlank(notifyIds)) {
            return new HashSet<>();
        }

        return new HashSet<>(JSON.parseArray(notifyIds, BigInteger.class));
    }

    default String toNotifyIdsStr(Set<BigInteger> notifyIds) {
        if (CollectionUtils.isEmpty(notifyIds)) {
            return StrUtil.EMPTY;
        }

        return JSON.toJSONString(notifyIds);
    }
}
