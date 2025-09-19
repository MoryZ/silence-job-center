package com.old.silence.job.server.api.assembler;

import cn.hutool.util.StrUtil;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;
import com.alibaba.fastjson2.JSON;
import com.old.silence.job.server.domain.model.NotifyConfig;
import com.old.silence.job.server.vo.NotifyConfigResponseVO;

import java.math.BigInteger;
import java.util.HashSet;
import java.util.Set;


@Mapper
public interface NotifyConfigResponseVOMapper {

    NotifyConfigResponseVOMapper INSTANCE = Mappers.getMapper(NotifyConfigResponseVOMapper.class);

    @Mapping(target = "recipientIds", expression = "java(toNotifyRecipientIds(notifyConfig.getRecipientIds()))")
    NotifyConfigResponseVO convert(NotifyConfig notifyConfig);

    default Set<BigInteger> toNotifyRecipientIds(String notifyRecipientIdsStr) {
        if (StrUtil.isBlank(notifyRecipientIdsStr)) {
            return new HashSet<>();
        }

        return new HashSet<>(JSON.parseArray(notifyRecipientIdsStr, BigInteger.class));
    }
}
