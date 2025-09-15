package com.old.silence.job.server.api.assembler;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;
import com.old.silence.job.server.domain.model.NotifyRecipient;
import com.old.silence.job.server.dto.NotifyRecipientRequestVO;
import com.old.silence.job.server.vo.CommonLabelValueResponseVO;
import com.old.silence.job.server.vo.NotifyRecipientResponseVO;


@Mapper
public interface NotifyRecipientMapper {

    NotifyRecipientMapper INSTANCE = Mappers.getMapper(NotifyRecipientMapper.class);

    NotifyRecipientResponseVO convertList(NotifyRecipient notifyRecipient);

    NotifyRecipient convert(NotifyRecipientRequestVO requestVO);

    CommonLabelValueResponseVO convertListToCommonLabelValueList(NotifyRecipient notifyRecipient);

    @Mapping(target = "label", source = "recipientName")
    @Mapping(target = "value", source = "id")
    CommonLabelValueResponseVO convert(NotifyRecipient notifyRecipient);

    NotifyRecipientRequestVO toNotifyRecipientRequestVOs(NotifyRecipient notifyRecipient);

}
