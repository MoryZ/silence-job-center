package com.old.silence.job.server.api.assembler;

import cn.hutool.core.util.StrUtil;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;
import com.alibaba.fastjson2.JSON;
import com.old.silence.job.server.domain.model.RetrySceneConfig;
import com.old.silence.job.server.vo.SceneConfigResponseVO;

import java.math.BigInteger;
import java.util.HashSet;
import java.util.Set;


@Mapper
public interface SceneConfigResponseVOMapper {

    SceneConfigResponseVOMapper INSTANCE = Mappers.getMapper(SceneConfigResponseVOMapper.class);

    @Mapping(target = "notifyIds", expression = "java(toNotifyIds(retrySceneConfig.getNotifyIds()))")
    SceneConfigResponseVO convert(RetrySceneConfig retrySceneConfig);

    default Set<BigInteger> toNotifyIds(String notifyIds) {
        if (StrUtil.isBlank(notifyIds)) {
            return new HashSet<>();
        }

        return new HashSet<>(JSON.parseArray(notifyIds, BigInteger.class));
    }
}
