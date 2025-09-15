package com.old.silence.job.server.domain.service;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.plugins.pagination.PageDTO;
import com.google.common.collect.Sets;
import com.old.silence.core.util.CollectionUtils;
import com.old.silence.job.common.core.enums.TriggerType;
import com.old.silence.job.common.core.util.StreamUtils;
import com.old.silence.job.server.common.dto.PartitionTask;
import com.old.silence.job.server.common.strategy.WaitStrategies;
import com.old.silence.job.server.common.util.CronUtils;
import com.old.silence.job.server.common.util.PartitionTaskUtils;
import com.old.silence.job.server.domain.model.Retry;
import com.old.silence.job.server.domain.model.RetryDeadLetter;
import com.old.silence.job.server.domain.model.RetrySceneConfig;
import com.old.silence.job.server.domain.model.RetrySummary;
import com.old.silence.job.server.domain.service.AccessTemplate;
import com.old.silence.job.server.domain.service.config.ConfigAccess;
import com.old.silence.job.server.domain.service.task.TaskAccess;
import com.old.silence.job.server.dto.ExportSceneVO;
import com.old.silence.job.server.dto.SceneConfigQueryVO;
import com.old.silence.job.server.dto.SceneConfigRequestVO;
import com.old.silence.job.server.exception.SilenceJobServerException;
import com.old.silence.job.server.infrastructure.persistence.dao.RetrySummaryDao;
import com.old.silence.job.server.vo.SceneConfigResponseVO;
import com.old.silence.job.server.web.api.assembler.SceneConfigMapper;
import com.old.silence.job.server.web.api.assembler.SceneConfigResponseVOMapper;
import com.old.silence.job.server.web.domain.service.handler.GroupHandler;
import com.old.silence.job.server.web.domain.service.handler.SyncConfigHandler;

import java.math.BigInteger;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;


@Service
@Validated
public class SceneConfigService {

    private final AccessTemplate accessTemplate;
    private final GroupHandler groupHandler;
    private final RetrySummaryDao retrySummaryDao;

    public SceneConfigService(AccessTemplate accessTemplate, GroupHandler groupHandler,
                              RetrySummaryDao retrySummaryDao) {
        this.accessTemplate = accessTemplate;
        this.groupHandler = groupHandler;
        this.retrySummaryDao = retrySummaryDao;
    }


    public IPage<SceneConfigResponseVO> getSceneConfigPageList(Page<RetrySceneConfig> pageDTO, SceneConfigQueryVO queryVO) {
        List<String> groupNames = List.of();
        var retrySceneConfigPage = accessTemplate.getSceneConfigAccess().listPage(pageDTO,
                new LambdaQueryWrapper<RetrySceneConfig>()
                        .eq(RetrySceneConfig::getNamespaceId, "111")
                        .in(CollectionUtils.isNotEmpty(groupNames), RetrySceneConfig::getGroupName, groupNames)
                        .eq(Objects.nonNull(queryVO.getSceneStatus()), RetrySceneConfig::getSceneStatus, queryVO.getSceneStatus())
                        .likeRight(StrUtil.isNotBlank(queryVO.getSceneName()), RetrySceneConfig::getSceneName, StrUtil.trim(queryVO.getSceneName()))
                        .orderByDesc(RetrySceneConfig::getCreatedDate));



        return retrySceneConfigPage.convert(SceneConfigResponseVOMapper.INSTANCE::convert);
    }

    
    public List<SceneConfigResponseVO> getSceneConfigList(String groupName) {

        String namespaceId = "111";

        List<RetrySceneConfig> retrySceneConfigs = accessTemplate.getSceneConfigAccess()
                .list(new LambdaQueryWrapper<RetrySceneConfig>()
                        .eq(RetrySceneConfig::getNamespaceId, namespaceId)
                        .eq(RetrySceneConfig::getGroupName, groupName)
                        .select(RetrySceneConfig::getSceneName,
                                RetrySceneConfig::getDescription, RetrySceneConfig::getMaxRetryCount)
                        .orderByDesc(RetrySceneConfig::getCreatedDate));

        return CollectionUtils.transformToList(retrySceneConfigs, SceneConfigResponseVOMapper.INSTANCE::convert);
    }

    
    public Boolean saveSceneConfig(SceneConfigRequestVO requestVO) {

        checkExecuteInterval(requestVO.getBackOff(), requestVO.getTriggerInterval());
        String namespaceId = "111";
        ConfigAccess<RetrySceneConfig> sceneConfigAccess = accessTemplate.getSceneConfigAccess();
        Assert.isTrue(0 == sceneConfigAccess.count(
                new LambdaQueryWrapper<RetrySceneConfig>()
                        .eq(RetrySceneConfig::getNamespaceId, namespaceId)
                        .eq(RetrySceneConfig::getGroupName, requestVO.getGroupName())
                        .eq(RetrySceneConfig::getSceneName, requestVO.getSceneName())

        ), () -> new SilenceJobServerException("场景名称重复. {}", requestVO.getSceneName()));

        RetrySceneConfig retrySceneConfig = SceneConfigMapper.INSTANCE.toRetrySceneConfig(requestVO);
        retrySceneConfig.setCreatedDate(Instant.now());
        retrySceneConfig.setNamespaceId(namespaceId);

        if (requestVO.getBackOff().getValue().intValue() == WaitStrategies.WaitStrategyEnum.DELAY_LEVEL.getValue()) {
            retrySceneConfig.setTriggerInterval(StrUtil.EMPTY);
        }

        if (requestVO.getCbStatus()) {
            checkExecuteInterval(requestVO.getCbTriggerType(), requestVO.getCbTriggerInterval());
            if (requestVO.getCbTriggerType().getValue().intValue() == WaitStrategies.WaitStrategyEnum.DELAY_LEVEL.getValue()) {
                retrySceneConfig.setCbTriggerInterval(StrUtil.EMPTY);
            }
        }

        Assert.isTrue(1 == sceneConfigAccess.insert(retrySceneConfig),
                () -> new SilenceJobServerException("failed to insert scene. retrySceneConfig:[{}]",
                        JSON.toJSONString(retrySceneConfig)));

        // 同步配置到客户端
        SyncConfigHandler.addSyncTask(requestVO.getGroupName(), namespaceId);

        return Boolean.TRUE;
    }

    
    public Boolean updateSceneConfig(SceneConfigRequestVO requestVO) {
        checkExecuteInterval(requestVO.getBackOff(), requestVO.getTriggerInterval());
        RetrySceneConfig retrySceneConfig = SceneConfigMapper.INSTANCE.toRetrySceneConfig(requestVO);
        // 防止更新
        retrySceneConfig.setSceneName(null);
        retrySceneConfig.setGroupName(null);
        retrySceneConfig.setNamespaceId(null);

        String namespaceId = "111";

        if (requestVO.getCbStatus()) {
            checkExecuteInterval(requestVO.getCbTriggerType(), requestVO.getCbTriggerInterval());
            if (requestVO.getCbTriggerType().getValue().intValue() == WaitStrategies.WaitStrategyEnum.DELAY_LEVEL.getValue()) {
                retrySceneConfig.setCbTriggerInterval(StrUtil.EMPTY);
            }
        }

        retrySceneConfig.setTriggerInterval(
                Optional.ofNullable(retrySceneConfig.getTriggerInterval()).orElse(StrUtil.EMPTY));
        Assert.isTrue(1 == accessTemplate.getSceneConfigAccess().update(retrySceneConfig,
                        new LambdaUpdateWrapper<RetrySceneConfig>()
                                .eq(RetrySceneConfig::getNamespaceId, namespaceId)
                                .eq(RetrySceneConfig::getGroupName, requestVO.getGroupName())
                                .eq(RetrySceneConfig::getSceneName, requestVO.getSceneName())),
                () -> new SilenceJobServerException("failed to update scene. retrySceneConfig:[{}]",
                        JSON.toJSONString(retrySceneConfig)));



        // 同步配置到客户端
        SyncConfigHandler.addSyncTask(requestVO.getGroupName(), namespaceId);
        return Boolean.TRUE;
    }

    
    public SceneConfigResponseVO getSceneConfigDetail(BigInteger id) {
        RetrySceneConfig retrySceneConfig = accessTemplate.getSceneConfigAccess()
                .one(new LambdaQueryWrapper<RetrySceneConfig>()
                        .eq(RetrySceneConfig::getId, id));
        return SceneConfigResponseVOMapper.INSTANCE.convert(retrySceneConfig);
    }

    
    public boolean updateStatus(BigInteger id, Boolean status) {

        String namespaceId = "111";

        RetrySceneConfig config = new RetrySceneConfig();
        config.setSceneStatus(status);

        return 1 == accessTemplate.getSceneConfigAccess().update(config,
                new LambdaUpdateWrapper<RetrySceneConfig>()
                        .eq(RetrySceneConfig::getId, id)
                        .eq(RetrySceneConfig::getNamespaceId, namespaceId));
    }

    
    @Transactional
    public void importSceneConfig(List<SceneConfigRequestVO> requests) {
        batchSaveSceneConfig(requests, "111");
    }

    
    public String exportSceneConfig(ExportSceneVO exportSceneVO) {

        List<SceneConfigRequestVO> requestList = new ArrayList<>();

        PartitionTaskUtils.process(startId -> {
            List<RetrySceneConfig> sceneConfigs = accessTemplate.getSceneConfigAccess()
                    .listPage(new PageDTO<>(0, 500), new LambdaQueryWrapper<RetrySceneConfig>()
                            .eq(RetrySceneConfig::getNamespaceId, "111")
                            .eq(Objects.nonNull(exportSceneVO.getSceneStatus()), RetrySceneConfig::getSceneStatus, exportSceneVO.getSceneStatus())
                            .eq(StrUtil.isNotBlank(exportSceneVO.getGroupName()),
                                    RetrySceneConfig::getGroupName, StrUtil.trim(exportSceneVO.getGroupName()))
                            .likeRight(StrUtil.isNotBlank(exportSceneVO.getSceneName()),
                                    RetrySceneConfig::getSceneName, StrUtil.trim(exportSceneVO.getSceneName()))
                            .in(CollectionUtils.isNotEmpty(exportSceneVO.getSceneIds()), RetrySceneConfig::getId, exportSceneVO.getSceneIds())
                            .ge(RetrySceneConfig::getId, startId)
                            .orderByAsc(RetrySceneConfig::getId)
                    ).getRecords();

            return StreamUtils.toList(sceneConfigs, SceneConfigPartitionTask::new);
        }, partitionTasks -> {
            List<SceneConfigPartitionTask> partitionTaskList = (List<SceneConfigPartitionTask>) partitionTasks;
            var sceneConfigRequestVOS = CollectionUtils.transformToList(CollectionUtils.transformToList(partitionTaskList, SceneConfigPartitionTask::getConfig), SceneConfigMapper.INSTANCE::toSceneConfigRequestVO);
            requestList.addAll(sceneConfigRequestVOS);
        }, 0);

        return JSON.toJSONString(requestList);
    }

    
    @Transactional
    public boolean deleteByIds(Set<BigInteger> ids) {
        String namespaceId = "111";
        LambdaQueryWrapper<RetrySceneConfig> queryWrapper = new LambdaQueryWrapper<RetrySceneConfig>()
                .select(RetrySceneConfig::getSceneName, RetrySceneConfig::getGroupName)
                .eq(RetrySceneConfig::getNamespaceId, namespaceId)
                .eq(RetrySceneConfig::getSceneStatus, 500)
                .in(RetrySceneConfig::getId, ids);

        List<RetrySceneConfig> sceneConfigs = accessTemplate.getSceneConfigAccess().list(queryWrapper);
        Assert.notEmpty(sceneConfigs, () -> new SilenceJobServerException("删除重试场景失败, 请检查场景状态是否关闭状态"));

        Set<String> sceneNames = StreamUtils.toSet(sceneConfigs, RetrySceneConfig::getSceneName);
        Set<String> groupNames = StreamUtils.toSet(sceneConfigs, RetrySceneConfig::getGroupName);

        TaskAccess<Retry> retryTaskAccess = accessTemplate.getRetryAccess();
        TaskAccess<RetryDeadLetter> retryTaskTaskAccess = accessTemplate.getRetryDeadLetterAccess();
        for (String groupName : groupNames) {
            List<Retry> retries = retryTaskAccess.listPage(new PageDTO<>(1, 1),
                    new LambdaQueryWrapper<Retry>()
                            .eq(Retry::getGroupName, groupName)
                            .in(Retry::getSceneName, sceneNames)
                            .orderByAsc(Retry::getId)).getRecords();
            Assert.isTrue(CollectionUtils.isEmpty(retries),
                    () -> new SilenceJobServerException("删除重试场景失败, 存在【重试任务】请先删除【重试任务】在重试"));

            List<RetryDeadLetter> retryDeadLetters = retryTaskTaskAccess.listPage(new PageDTO<>(1, 1),
                    new LambdaQueryWrapper<RetryDeadLetter>()
                            .eq(RetryDeadLetter::getGroupName, groupName)
                            .in(RetryDeadLetter::getSceneName, sceneNames)
                            .orderByAsc(RetryDeadLetter::getId)).getRecords();
            Assert.isTrue(CollectionUtils.isEmpty(retryDeadLetters),
                    () -> new SilenceJobServerException("删除重试场景失败, 存在【死信任务】请先删除【死信任务】在重试"));
        }

        Assert.isTrue(ids.size() == accessTemplate.getSceneConfigAccess().delete(queryWrapper),
                () -> new SilenceJobServerException("删除重试场景失败, 请检查场景状态是否关闭状态"));

        List<RetrySummary> retrySummaries = retrySummaryDao.selectList(
                new LambdaQueryWrapper<RetrySummary>()
                        .select(RetrySummary::getId)
                        .eq(RetrySummary::getNamespaceId, namespaceId)
                        .in(RetrySummary::getGroupName, groupNames)
                        .in(RetrySummary::getSceneName, sceneNames)
        );

        if (CollectionUtils.isNotEmpty(retrySummaries)) {
            Assert.isTrue(retrySummaries.size() == retrySummaryDao.deleteBatchIds(StreamUtils.toSet(retrySummaries, RetrySummary::getId))
                    , () -> new SilenceJobServerException("删除汇总表数据失败"));
        }

        return Boolean.TRUE;
    }

    private void batchSaveSceneConfig(List<SceneConfigRequestVO> requests, String namespaceId) {

        Set<String> groupNameSet = Sets.newHashSet();
        Set<String> sceneNameSet = Sets.newHashSet();
        for (final SceneConfigRequestVO requestVO : requests) {
            checkExecuteInterval(requestVO.getBackOff(), requestVO.getTriggerInterval());
            if (requestVO.getCbStatus()) {
                checkExecuteInterval(requestVO.getCbTriggerType(), requestVO.getCbTriggerInterval());
            }
            groupNameSet.add(requestVO.getGroupName());
            sceneNameSet.add(requestVO.getSceneName());
        }

        groupHandler.validateGroupExistence(groupNameSet, namespaceId);

        ConfigAccess<RetrySceneConfig> sceneConfigAccess = accessTemplate.getSceneConfigAccess();
        List<RetrySceneConfig> sceneConfigs = sceneConfigAccess.list(
                new LambdaQueryWrapper<RetrySceneConfig>()
                        .select(RetrySceneConfig::getSceneName)
                        .eq(RetrySceneConfig::getNamespaceId, namespaceId)
                        .in(RetrySceneConfig::getGroupName, groupNameSet)
                        .in(RetrySceneConfig::getSceneName, sceneNameSet));

        Assert.isTrue(CollectionUtils.isEmpty(sceneConfigs), () -> new SilenceJobServerException("导入失败. 原因:场景{}已存在",
                StreamUtils.toSet(sceneConfigs, RetrySceneConfig::getSceneName)));

        Instant now = Instant.now();
        List<RetrySceneConfig> retrySceneConfigs = SceneConfigMapper.INSTANCE.toRetrySceneConfigs(requests);
        for (final RetrySceneConfig retrySceneConfig : retrySceneConfigs) {
            retrySceneConfig.setCreatedDate(now);
            retrySceneConfig.setNamespaceId(namespaceId);
            if (retrySceneConfig.getBackOff().getValue().intValue() == WaitStrategies.WaitStrategyEnum.DELAY_LEVEL.getValue()) {
                retrySceneConfig.setTriggerInterval(StrUtil.EMPTY);
            }

            if (retrySceneConfig.getCbStatus()) {
                if (retrySceneConfig.getCbTriggerType().getValue().intValue() == WaitStrategies.WaitStrategyEnum.DELAY_LEVEL.getValue()) {
                    retrySceneConfig.setCbTriggerInterval(StrUtil.EMPTY);
                }
            }

            Assert.isTrue(1 == sceneConfigAccess.insert(retrySceneConfig),
                    () -> new SilenceJobServerException("failed to insert scene. retrySceneConfig:[{}]",
                            JSON.toJSONString(retrySceneConfig)));
        }

    }

    
    
    private static class SceneConfigPartitionTask extends PartitionTask {
        // 这里就直接放RetrySceneConfig为了后面若加字段不需要再这里在调整了
        private final RetrySceneConfig config;

        public SceneConfigPartitionTask(RetrySceneConfig config) {
            this.config = config;
            setId(config.getId());
        }

        public RetrySceneConfig getConfig() {
            return config;
        }
    }

    private static void checkExecuteInterval(TriggerType backOff, String triggerInterval) {
        if (List.of(WaitStrategies.WaitStrategyEnum.FIXED.getValue(),
                        WaitStrategies.WaitStrategyEnum.RANDOM.getValue()).contains(backOff.getValue().intValue())) {
            if (Integer.parseInt(triggerInterval) < 10) {
                throw new SilenceJobServerException("间隔时间不得小于10");
            }
        } else if (backOff.getValue().intValue() == WaitStrategies.WaitStrategyEnum.CRON.getValue()) {
            if (CronUtils.getExecuteInterval(triggerInterval) < 10 * 1000) {
                throw new SilenceJobServerException("间隔时间不得小于10");
            }
        }
    }

}
