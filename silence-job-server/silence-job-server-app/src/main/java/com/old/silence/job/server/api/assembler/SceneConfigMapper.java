package com.old.silence.job.server.api.assembler;

import cn.hutool.core.util.StrUtil;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;
import com.alibaba.fastjson2.JSON;
import com.old.silence.core.util.CollectionUtils;
import com.old.silence.job.server.domain.model.RetrySceneConfig;
import com.old.silence.job.server.dto.SceneConfigRequestVO;

import java.math.BigInteger;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Mapper
public interface SceneConfigMapper {

    SceneConfigMapper INSTANCE = Mappers.getMapper(SceneConfigMapper.class);

    @Mapping(target = "notifyIds", expression = "java(toNotifyIdsStr(requestVO.getNotifyIds()))")
    RetrySceneConfig toRetrySceneConfig(SceneConfigRequestVO requestVO);

    List<RetrySceneConfig> toRetrySceneConfigs(List<SceneConfigRequestVO> requestVOs);

    @Mapping(target = "notifyIds", expression = "java(toNotifyIds(requestVO.getNotifyIds()))")
    SceneConfigRequestVO toSceneConfigRequestVO(RetrySceneConfig requestVO);

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
