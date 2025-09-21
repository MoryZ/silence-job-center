package com.old.silence.job.server.domain.service;



import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.HashUtil;
import cn.hutool.core.util.StrUtil;

import java.math.BigInteger;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.old.silence.core.util.CollectionUtils;
import com.old.silence.job.common.enums.RetryStatus;
import com.old.silence.job.common.enums.SystemTaskType;
import com.old.silence.job.common.util.StreamUtils;
import com.old.silence.job.server.api.assembler.RetryDeadLetterResponseVOMapper;
import com.old.silence.job.server.common.WaitStrategy;
import com.old.silence.job.server.common.config.SystemProperties;
import com.old.silence.job.server.common.strategy.WaitStrategies.WaitStrategyContext;
import com.old.silence.job.server.common.strategy.WaitStrategies.WaitStrategyEnum;
import com.old.silence.job.server.domain.model.Retry;
import com.old.silence.job.server.domain.model.RetryDeadLetter;
import com.old.silence.job.server.domain.model.RetrySceneConfig;
import com.old.silence.job.server.domain.service.config.ConfigAccess;
import com.old.silence.job.server.domain.service.task.TaskAccess;
import com.old.silence.job.server.dto.BatchDeleteRetryDeadLetterVO;
import com.old.silence.job.server.dto.BatchRollBackRetryDeadLetterVO;
import com.old.silence.job.server.dto.RetryDeadLetterQueryVO;
import com.old.silence.job.server.exception.SilenceJobServerException;
import com.old.silence.job.server.retry.task.support.RetryTaskConverter;
import com.old.silence.job.server.vo.RetryDeadLetterResponseVO;


@Service
public class RetryDeadLetterService {
    private final AccessTemplate accessTemplate;
    private final SystemProperties systemProperties;
    private final RetryDeadLetterResponseVOMapper retryDeadLetterResponseVOMapper;

    public RetryDeadLetterService(AccessTemplate accessTemplate, SystemProperties systemProperties,
                                  RetryDeadLetterResponseVOMapper retryDeadLetterResponseVOMapper) {
        this.accessTemplate = accessTemplate;
        this.systemProperties = systemProperties;
        this.retryDeadLetterResponseVOMapper = retryDeadLetterResponseVOMapper;
    }

   
    public IPage<RetryDeadLetterResponseVO> getRetryDeadLetterPage(Page<RetryDeadLetter> pageDTO, RetryDeadLetterQueryVO queryVO) {

        List<String> groupNames = List.of();

        String namespaceId = "namespaceId";
        Page<RetryDeadLetter> retryDeadLetterPage = accessTemplate.getRetryDeadLetterAccess()
                .listPage(pageDTO, new LambdaQueryWrapper<RetryDeadLetter>()
                                .eq(RetryDeadLetter::getNamespaceId, namespaceId)
                                .in(CollectionUtils.isNotEmpty(groupNames), RetryDeadLetter::getGroupName, groupNames)
                                .eq(StrUtil.isNotBlank(queryVO.getSceneName()), RetryDeadLetter::getSceneName, queryVO.getSceneName())
                                .eq(StrUtil.isNotBlank(queryVO.getBizNo()), RetryDeadLetter::getBizNo, queryVO.getBizNo())
                                .eq(StrUtil.isNotBlank(queryVO.getIdempotentId()), RetryDeadLetter::getIdempotentId, queryVO.getIdempotentId())
                                .orderByDesc(RetryDeadLetter::getId));

        return retryDeadLetterPage.convert(retryDeadLetterResponseVOMapper::convert);
    }

   
    public RetryDeadLetterResponseVO getRetryDeadLetterById(String groupName, BigInteger id) {
        TaskAccess<RetryDeadLetter> retryDeadLetterAccess = accessTemplate.getRetryDeadLetterAccess();
        RetryDeadLetter retryDeadLetter = retryDeadLetterAccess.one(new LambdaQueryWrapper<RetryDeadLetter>()
                .eq(RetryDeadLetter::getId, id)
                .eq(RetryDeadLetter::getGroupName, groupName)
        );
        return retryDeadLetterResponseVOMapper.convert(retryDeadLetter);
    }

   
    @Transactional
    public int rollback(BatchRollBackRetryDeadLetterVO rollBackRetryDeadLetterVO) {

        String namespaceId = "namespaceId";

        List<BigInteger> ids = rollBackRetryDeadLetterVO.getIds();
        TaskAccess<RetryDeadLetter> retryDeadLetterAccess = accessTemplate.getRetryDeadLetterAccess();
        List<RetryDeadLetter> retryDeadLetterList = retryDeadLetterAccess.list(
                new LambdaQueryWrapper<RetryDeadLetter>().in(RetryDeadLetter::getId, ids));

        Assert.notEmpty(retryDeadLetterList, () -> new SilenceJobServerException("数据不存在"));

        ConfigAccess<RetrySceneConfig> sceneConfigAccess = accessTemplate.getSceneConfigAccess();
        Set<String> sceneNameSet = StreamUtils.toSet(retryDeadLetterList, RetryDeadLetter::getSceneName);
        List<RetrySceneConfig> retrySceneConfigs = sceneConfigAccess.list(
                new LambdaQueryWrapper<RetrySceneConfig>()
                        .eq(RetrySceneConfig::getNamespaceId, namespaceId)
                        .in(RetrySceneConfig::getSceneName, sceneNameSet));

        Map<String, RetrySceneConfig> sceneConfigMap = StreamUtils.toIdentityMap(retrySceneConfigs,
                (sceneConfig) -> sceneConfig.getGroupName() + sceneConfig.getSceneName());

        List<Retry> waitRollbackList = new ArrayList<>();
        for (RetryDeadLetter retryDeadLetter : retryDeadLetterList) {
            RetrySceneConfig retrySceneConfig = sceneConfigMap.get(
                    retryDeadLetter.getGroupName() + retryDeadLetter.getSceneName());
            Assert.notNull(retrySceneConfig,
                    () -> new SilenceJobServerException("未查询到场景. [{}]", retryDeadLetter.getSceneName()));

            Retry retry = RetryTaskConverter.INSTANCE.toRetryTask(retryDeadLetter);
            retry.setRetryStatus(RetryStatus.RUNNING);
            retry.setTaskType(SystemTaskType.RETRY);
            retry.setBucketIndex(HashUtil.bkdrHash(retryDeadLetter.getGroupName() + retryDeadLetter.getSceneName() + retryDeadLetter.getIdempotentId())
                    % systemProperties.getBucketTotal());
            retry.setParentId(BigInteger.ZERO);
            retry.setDeleted(false);

            WaitStrategyContext waitStrategyContext = new WaitStrategyContext();
            waitStrategyContext.setNextTriggerAt(Instant.now());
            waitStrategyContext.setTriggerInterval(retrySceneConfig.getTriggerInterval());
            waitStrategyContext.setDelayLevel(1);
            WaitStrategy waitStrategy = WaitStrategyEnum.getWaitStrategy(retrySceneConfig.getBackOff().getValue());
            retry.setNextTriggerAt(waitStrategy.computeTriggerTime(waitStrategyContext));
            retry.setCreatedDate(Instant.now());
            waitRollbackList.add(retry);
        }

        TaskAccess<Retry> retryTaskAccess = accessTemplate.getRetryAccess();
        Assert.isTrue(waitRollbackList.size() == retryTaskAccess.insertBatch( waitRollbackList),
                () -> new SilenceJobServerException("新增重试任务失败"));

        Set<BigInteger> waitDelRetryDeadLetterIdSet = StreamUtils.toSet(retryDeadLetterList, RetryDeadLetter::getId);
        Assert.isTrue(waitDelRetryDeadLetterIdSet.size() == retryDeadLetterAccess.delete(
                        new LambdaQueryWrapper<RetryDeadLetter>()
                                .in(RetryDeadLetter::getId, waitDelRetryDeadLetterIdSet)),
                () -> new SilenceJobServerException("删除死信队列数据失败"));
        return 1;
    }

   
    public boolean batchDelete(BatchDeleteRetryDeadLetterVO deadLetterVO) {
        TaskAccess<RetryDeadLetter> retryDeadLetterAccess = accessTemplate.getRetryDeadLetterAccess();
        String namespaceId = "namespaceId";

        Assert.isTrue(deadLetterVO.getIds().size() == retryDeadLetterAccess.delete(
                        new LambdaQueryWrapper<RetryDeadLetter>()
                                .eq(RetryDeadLetter::getNamespaceId, namespaceId)
                                .in(RetryDeadLetter::getId, deadLetterVO.getIds())),
                () -> new SilenceJobServerException("删除死信任务失败"));

        return Boolean.TRUE;
    }
}
