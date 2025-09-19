package com.old.silence.job.server.domain.service;

import cn.hutool.lang.Assert;
import cn.hutool.util.StrUtil;

import java.math.BigInteger;
import java.time.Instant;
import java.util.List;
import java.util.Objects;
import java.util.Set;

import org.springframework.stereotype.Service;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.metadata.IPage;
import com.old.silence.job.server.domain.model.NotifyConfig;
import com.old.silence.job.server.domain.service.config.ConfigAccess;
import com.old.silence.job.server.dto.NotifyConfigCommand;
import com.old.silence.job.server.dto.NotifyConfigQueryVO;
import com.old.silence.job.server.exception.SilenceJobServerException;
import com.old.silence.job.server.vo.NotifyConfigResponseVO;
import com.old.silence.job.server.web.api.assembler.NotifyConfigMapper;
import com.old.silence.job.server.web.api.assembler.NotifyConfigResponseVOMapper;
import com.old.silence.job.server.web.domain.service.handler.SyncConfigHandler;
import com.old.silence.util.CollectionUtils;


@Service
public class NotifyConfigService {

    private final AccessTemplate accessTemplate;

    public NotifyConfigService(AccessTemplate accessTemplate) {
        this.accessTemplate = accessTemplate;
    }

    public IPage<NotifyConfigResponseVO> getNotifyConfigList(Page<NotifyConfig> pageDTO, NotifyConfigQueryVO queryVO) {
        List<String> groupNames = List.of();

        Page<NotifyConfig> notifyConfigPage = accessTemplate.getNotifyConfigAccess().listPage(pageDTO,
                        new LambdaQueryWrapper<NotifyConfig>()
                                .eq(NotifyConfig::getNamespaceId, "111")
                                .in(CollectionUtils.isNotEmpty(groupNames), NotifyConfig::getGroupName, groupNames)
                                .eq(StrUtil.isNotBlank(queryVO.getGroupName()), NotifyConfig::getGroupName, queryVO.getGroupName())
                                .eq(Objects.nonNull(queryVO.getNotifyStatus()), NotifyConfig::getNotifyStatus, queryVO.getNotifyStatus())
                                .eq(Objects.nonNull(queryVO.getSystemTaskType()), NotifyConfig::getSystemTaskType, queryVO.getSystemTaskType())
                                .likeRight(StrUtil.isNotBlank(queryVO.getNotifyName()), NotifyConfig::getNotifyName, queryVO.getNotifyName())
                                .orderByDesc(NotifyConfig::getId));

    return notifyConfigPage.convert(NotifyConfigResponseVOMapper.INSTANCE::convert);
    }

    public List<NotifyConfig> getNotifyConfigBySystemTaskTypeList(Integer systemTaskType) {
        String namespaceId = "111";
        List<NotifyConfig> notifyConfigList = accessTemplate.getNotifyConfigAccess().list(new LambdaQueryWrapper<NotifyConfig>()
                .select(NotifyConfig::getId, NotifyConfig::getNotifyName)
                .eq(NotifyConfig::getNamespaceId, namespaceId)
                .eq(NotifyConfig::getSystemTaskType, systemTaskType)
                .orderByDesc(NotifyConfig::getId)
        );
        return notifyConfigList;
    }

    public Boolean saveNotify(NotifyConfigCommand requestVO) {
        NotifyConfig notifyConfig = NotifyConfigMapper.INSTANCE.convert(requestVO);
        notifyConfig.setCreatedDate(Instant.now());
        notifyConfig.setRecipientIds(JSON.toJSONString(requestVO.getRecipientIds()));
        notifyConfig.setNamespaceId("111");
        ConfigAccess<NotifyConfig> notifyConfigAccess = accessTemplate.getNotifyConfigAccess();

        Assert.isTrue(1 == notifyConfigAccess.insert(notifyConfig),
                () -> new SilenceJobServerException("failed to insert notify. sceneConfig:[{}]",
                        JSON.toJSONString(notifyConfig)));
        return Boolean.TRUE;
    }

    public Boolean updateNotify(NotifyConfigCommand requestVO) {
        Assert.notNull(requestVO.getId(), () -> new SilenceJobServerException("参数异常"));
        NotifyConfig notifyConfig = NotifyConfigMapper.INSTANCE.convert(requestVO);
        notifyConfig.setRecipientIds(JSON.toJSONString(requestVO.getRecipientIds()));

        // 防止被覆盖
        notifyConfig.setNamespaceId(null);
        Assert.isTrue(1 == accessTemplate.getNotifyConfigAccess().updateById(notifyConfig),
                () -> new SilenceJobServerException("failed to update notify. sceneConfig:[{}]",
                        JSON.toJSONString(notifyConfig)));
        return Boolean.TRUE;
    }

    public NotifyConfigResponseVO getNotifyConfigDetail(BigInteger id) {
        NotifyConfig notifyConfig = accessTemplate.getNotifyConfigAccess().one(new LambdaQueryWrapper<NotifyConfig>()
                .eq(NotifyConfig::getId, id));
        return NotifyConfigResponseVOMapper.INSTANCE.convert(notifyConfig);
    }

    public Boolean updateStatus(BigInteger id, Boolean status) {

        String namespaceId = "111";
        NotifyConfig notifyConfig = accessTemplate.getNotifyConfigAccess().one(
                new LambdaQueryWrapper<NotifyConfig>()
                        .eq(NotifyConfig::getId, id)
                        .eq(NotifyConfig::getNamespaceId, namespaceId)
        );
        Assert.notNull(notifyConfig, () -> new SilenceJobServerException("通知配置不存在"));

        // 同步配置到客户端
        SyncConfigHandler.addSyncTask(notifyConfig.getGroupName(), namespaceId);

        NotifyConfig config = new NotifyConfig();
        config.setNotifyStatus(status);
        config.setUpdatedDate(Instant.now());
        int update = accessTemplate.getNotifyConfigAccess()
                .update(config, new LambdaUpdateWrapper<NotifyConfig>()
                        .eq(NotifyConfig::getNamespaceId, namespaceId)
                        .eq(NotifyConfig::getId, id)
                );

        return 1 == update;
    }

    public Boolean batchDeleteNotify(final Set<Long> ids) {
        return ids.size() == accessTemplate.getNotifyConfigAccess()
                .delete(new LambdaQueryWrapper<NotifyConfig>().in(NotifyConfig::getId, ids));
    }
}
