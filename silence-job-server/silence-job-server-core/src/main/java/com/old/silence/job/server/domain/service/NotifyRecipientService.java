package com.old.silence.job.server.domain.service;

import cn.hutool.util.StrUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Set;

import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.plugins.pagination.PageDTO;
import com.baomidou.mybatisplus.metadata.IPage;
import com.old.silence.job.common.util.StreamUtils;
import com.old.silence.job.server.common.dto.PartitionTask;
import com.old.silence.job.server.common.util.PartitionTaskUtils;
import com.old.silence.job.server.domain.model.NotifyRecipient;
import com.old.silence.job.server.dto.ExportNotifyRecipientVO;
import com.old.silence.job.server.dto.NotifyRecipientQueryVO;
import com.old.silence.job.server.dto.NotifyRecipientRequestVO;
import com.old.silence.job.server.infrastructure.persistence.dao.NotifyRecipientDao;
import com.old.silence.job.server.vo.CommonLabelValueResponseVO;
import com.old.silence.job.server.vo.NotifyRecipientResponseVO;
import com.old.silence.job.server.web.api.assembler.NotifyRecipientMapper;
import com.old.silence.job.server.web.domain.service.handler.GroupHandler;
import com.old.silence.util.CollectionUtils;


@Service
@Validated
public class NotifyRecipientService {

    private final NotifyRecipientDao notifyRecipientDao;
    private final GroupHandler groupHandler;

    public NotifyRecipientService(NotifyRecipientDao notifyRecipientDao, GroupHandler groupHandler) {
        this.notifyRecipientDao = notifyRecipientDao;
        this.groupHandler = groupHandler;
    }

    public IPage<NotifyRecipientResponseVO> getNotifyRecipientPageList(Page<NotifyRecipient> pageDTO, NotifyRecipientQueryVO queryVO) {
        String namespaceId = "111";
        Page<NotifyRecipient> notifyRecipientPageDTO = notifyRecipientDao.selectPage(pageDTO,
                new LambdaQueryWrapper<NotifyRecipient>()
                        .eq(NotifyRecipient::getNamespaceId, namespaceId)
                        .eq(Objects.nonNull(queryVO.getNotifyType()), NotifyRecipient::getNotifyType, queryVO.getNotifyType())
                        .likeRight(StrUtil.isNotBlank(queryVO.getRecipientName()), NotifyRecipient::getRecipientName,
                                queryVO.getRecipientName())
                        .orderByDesc(NotifyRecipient::getCreatedDate));

        return notifyRecipientPageDTO.convert(NotifyRecipientMapper.INSTANCE::convertList);
    }

    public Boolean saveNotifyRecipient(NotifyRecipientRequestVO requestVO) {
        String namespaceId = "111" ;
        NotifyRecipient notifyRecipient = NotifyRecipientMapper.INSTANCE.convert(requestVO);
        notifyRecipient.setNamespaceId(namespaceId);
        notifyRecipient.setId(null);
        return 1 == notifyRecipientDao.insert(notifyRecipient);
    }

    public Boolean updateNotifyRecipient(NotifyRecipientRequestVO requestVO) {
        String namespaceId = "111" ;
        NotifyRecipient notifyRecipient = NotifyRecipientMapper.INSTANCE.convert(requestVO);
        notifyRecipient.setNamespaceId(namespaceId);
        return 1 == notifyRecipientDao.updateById(notifyRecipient);
    }

    public List<CommonLabelValueResponseVO> getNotifyRecipientList() {
        String namespaceId = "111" ;
        List<NotifyRecipient> notifyRecipients = notifyRecipientDao.selectList(
                new LambdaQueryWrapper<NotifyRecipient>()
                        .select(NotifyRecipient::getRecipientName, NotifyRecipient::getId)
                        .eq(NotifyRecipient::getNamespaceId, namespaceId)
        );
        return CollectionUtils.transformToList(notifyRecipients, NotifyRecipientMapper.INSTANCE::convertListToCommonLabelValueList);
    }

    public Boolean batchDeleteByIds(final Set<Long> ids) {
        return ids.size() == notifyRecipientDao.deleteBatchIds(ids);
    }

    @Transactional
    public void importNotifyRecipient(List<NotifyRecipientRequestVO> notifyRecipientRequestVOS) {
        for (final NotifyRecipientRequestVO notifyRecipientRequestVO : notifyRecipientRequestVOS) {
            this.saveNotifyRecipient(notifyRecipientRequestVO);
        }
    }

    public String exportNotifyRecipient(ExportNotifyRecipientVO exportVO) {

        List<NotifyRecipientRequestVO> requestList = new ArrayList<>();
        String namespaceId = "111";
        PartitionTaskUtils.process(startId -> {
            List<NotifyRecipient> recipients = notifyRecipientDao.selectPage(new PageDTO<>(0, 100),
                    new LambdaQueryWrapper<NotifyRecipient>()
                            .eq(NotifyRecipient::getNamespaceId, namespaceId)
                            .eq(Objects.nonNull(exportVO.getNotifyType()), NotifyRecipient::getNotifyType,
                                    exportVO.getNotifyType())
                            .likeRight(StrUtil.isNotBlank(exportVO.getRecipientName()), NotifyRecipient::getRecipientName,
                                    exportVO.getRecipientName())
                            .ge(NotifyRecipient::getId, startId)
                            .in(CollectionUtils.isNotEmpty(exportVO.getNotifyRecipientIds()), NotifyRecipient::getId,
                                    exportVO.getNotifyRecipientIds())
                            .orderByAsc(NotifyRecipient::getId)).getRecords();
            return StreamUtils.toList(recipients, NotifyRecipientPartitionTask::new);
        }, partitionTasks -> {
            List<NotifyRecipientPartitionTask> partitionTaskList = (List<NotifyRecipientPartitionTask>) partitionTasks;
            List<NotifyRecipientRequestVO> notifyRecipientRequestVOs = CollectionUtils.transformToList(StreamUtils.toList(partitionTaskList, NotifyRecipientPartitionTask::getRecipient),
            NotifyRecipientMapper.INSTANCE::toNotifyRecipientRequestVOs);
            requestList.addAll(notifyRecipientRequestVOs);
        }, 0);

        return JSON.toJSONString(requestList);
    }

    
    
    private static class NotifyRecipientPartitionTask extends PartitionTask {

        // 这里就直接放NotifyRecipient为了后面若加字段不需要再这里在调整了
        private final NotifyRecipient recipient;

        public NotifyRecipientPartitionTask(@NotNull NotifyRecipient recipient) {
            this.recipient = recipient;
            setId(recipient.getId());
        }

        public NotifyRecipient getRecipient() {
            return recipient;
        }
    }
}
