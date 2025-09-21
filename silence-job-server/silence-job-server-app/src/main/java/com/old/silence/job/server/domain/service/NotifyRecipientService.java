package com.old.silence.job.server.domain.service;

import cn.hutool.core.util.StrUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Set;

import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.plugins.pagination.PageDTO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.old.silence.job.common.util.StreamUtils;
import com.old.silence.job.server.api.assembler.NotifyRecipientMapper;
import com.old.silence.job.server.common.dto.PartitionTask;
import com.old.silence.job.server.common.util.PartitionTaskUtils;
import com.old.silence.job.server.domain.model.NotifyRecipient;
import com.old.silence.job.server.dto.ExportNotifyRecipientCommand;
import com.old.silence.job.server.dto.NotifyRecipientQueryVO;
import com.old.silence.job.server.infrastructure.persistence.dao.NotifyRecipientDao;
import com.old.silence.job.server.vo.CommonLabelValueResponseVO;
import com.old.silence.job.server.vo.NotifyRecipientResponseVO;
import com.old.silence.core.util.CollectionUtils;


@Service
@Validated
public class NotifyRecipientService {

    private final NotifyRecipientDao notifyRecipientDao;
    private final NotifyRecipientMapper notifyRecipientMapper;

    public NotifyRecipientService(NotifyRecipientDao notifyRecipientDao,
                                  NotifyRecipientMapper notifyRecipientMapper) {
        this.notifyRecipientDao = notifyRecipientDao;
        this.notifyRecipientMapper = notifyRecipientMapper;
    }

    public IPage<NotifyRecipientResponseVO> getNotifyRecipientPageList(Page<NotifyRecipient> pageDTO, NotifyRecipientQueryVO queryVO) {
        String namespaceId = "namespaceId";
        Page<NotifyRecipient> notifyRecipientPageDTO = notifyRecipientDao.selectPage(pageDTO,
                new LambdaQueryWrapper<NotifyRecipient>()
                        .eq(NotifyRecipient::getNamespaceId, namespaceId)
                        .eq(Objects.nonNull(queryVO.getNotifyType()), NotifyRecipient::getNotifyType, queryVO.getNotifyType())
                        .likeRight(StrUtil.isNotBlank(queryVO.getRecipientName()), NotifyRecipient::getRecipientName,
                                queryVO.getRecipientName())
                        .orderByDesc(NotifyRecipient::getCreatedDate));

        return notifyRecipientPageDTO.convert(notifyRecipientMapper::convert);
    }

    public Boolean saveNotifyRecipient(NotifyRecipient notifyRecipient) {
        String namespaceId = "namespaceId" ;
        notifyRecipient.setNamespaceId(namespaceId);
        notifyRecipient.setId(null);
        return 1 == notifyRecipientDao.insert(notifyRecipient);
    }

    public Boolean updateNotifyRecipient(NotifyRecipient notifyRecipient) {
        String namespaceId = "namespaceId" ;
        notifyRecipient.setNamespaceId(namespaceId);
        return 1 == notifyRecipientDao.updateById(notifyRecipient);
    }

    public List<CommonLabelValueResponseVO> getNotifyRecipientList() {
        String namespaceId = "namespaceId" ;
        List<NotifyRecipient> notifyRecipients = notifyRecipientDao.selectList(
                new LambdaQueryWrapper<NotifyRecipient>()
                        .select(NotifyRecipient::getRecipientName, NotifyRecipient::getId)
                        .eq(NotifyRecipient::getNamespaceId, namespaceId)
        );
        return CollectionUtils.transformToList(notifyRecipients, notifyRecipient -> new CommonLabelValueResponseVO(notifyRecipient.getRecipientName(), notifyRecipient.getId()));
    }

    public Boolean batchDeleteByIds(final Set<Long> ids) {
        return ids.size() == notifyRecipientDao.deleteBatchIds(ids);
    }

    @Transactional
    public void importNotifyRecipient(List<NotifyRecipient> notifyRecipientRequestVOS) {
        for (NotifyRecipient notifyRecipient : notifyRecipientRequestVOS) {
            this.saveNotifyRecipient(notifyRecipient);
        }
    }

    public String exportNotifyRecipient(ExportNotifyRecipientCommand exportNotifyRecipientCommand) {

        List<NotifyRecipient> requestList = new ArrayList<>();
        String namespaceId = "namespaceId";
        PartitionTaskUtils.process(startId -> {
            List<NotifyRecipient> recipients = notifyRecipientDao.selectPage(new PageDTO<>(0, 100),
                    new LambdaQueryWrapper<NotifyRecipient>()
                            .eq(NotifyRecipient::getNamespaceId, namespaceId)
                            .eq(Objects.nonNull(exportNotifyRecipientCommand.getNotifyType()), NotifyRecipient::getNotifyType,
                                    exportNotifyRecipientCommand.getNotifyType())
                            .likeRight(StrUtil.isNotBlank(exportNotifyRecipientCommand.getRecipientName()), NotifyRecipient::getRecipientName,
                                    exportNotifyRecipientCommand.getRecipientName())
                            .ge(NotifyRecipient::getId, startId)
                            .in(CollectionUtils.isNotEmpty(exportNotifyRecipientCommand.getNotifyRecipientIds()), NotifyRecipient::getId,
                                    exportNotifyRecipientCommand.getNotifyRecipientIds())
                            .orderByAsc(NotifyRecipient::getId)).getRecords();
            return StreamUtils.toList(recipients, NotifyRecipientPartitionTask::new);
        }, partitionTasks -> {
            List<NotifyRecipientPartitionTask> partitionTaskList = (List<NotifyRecipientPartitionTask>) partitionTasks;
            List<NotifyRecipient> notifyRecipientRequestVOs = CollectionUtils.transformToList(partitionTaskList, NotifyRecipientPartitionTask::getRecipient);
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
