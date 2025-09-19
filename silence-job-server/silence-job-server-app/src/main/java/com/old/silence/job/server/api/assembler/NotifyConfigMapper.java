package com.old.silence.job.server.api.assembler;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;
import com.alibaba.fastjson2.JSON;
import com.old.silence.util.CollectionUtils;
import com.old.silence.job.server.domain.model.NotifyConfig;
import com.old.silence.job.server.dto.NotifyConfigCommand;

import java.util.Set;

@Mapper
public interface NotifyConfigMapper {

    NotifyConfigMapper INSTANCE = Mappers.getMapper(NotifyConfigMapper.class);

    default String toNotifyRecipientIdsStr(Set<Long> notifyRecipientIds) {
        if (CollectionUtils.isEmpty(notifyRecipientIds)) {
            return null;
        }

        return JSON.toJSONString(notifyRecipientIds);
    }

    @Mapping(target = "recipientIds", expression = "java(toNotifyRecipientIdsStr(notifyConfigVO.getRecipientIds()))")
    NotifyConfig convert(NotifyConfigCommand notifyConfigVO);
}
