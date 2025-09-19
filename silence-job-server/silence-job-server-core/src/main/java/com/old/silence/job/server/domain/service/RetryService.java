package com.old.silence.job.server.domain.service;

import cn.hutool.lang.Assert;
import cn.hutool.util.StrUtil;

import java.math.BigInteger;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.pekko.actor.ActorRef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.old.silence.job.client.model.GenerateRetryIdempotentIdDTO;
import com.old.silence.job.common.enums.RetryStatus;
import com.old.silence.job.common.enums.RetryTaskExecutorSceneEnum;
import com.old.silence.job.common.enums.SystemTaskType;
import com.old.silence.job.common.enums.TaskGeneratorSceneEnum;
import com.old.silence.job.common.model.ApiResult;
import com.old.silence.job.common.util.StreamUtils;
import com.old.silence.job.log.SilenceJobLog;
import com.old.silence.job.server.common.WaitStrategy;
import com.old.silence.job.server.common.cache.CacheRegisterTable;
import com.old.silence.job.server.common.dto.RegisterNodeInfo;
import com.old.silence.job.server.common.dto.RetryLogMetaDTO;
import com.old.silence.job.server.common.handler.ClientNodeAllocateHandler;
import com.old.silence.job.server.common.rpc.client.RequestBuilder;
import com.old.silence.job.server.common.strategy.WaitStrategies;
import com.old.silence.job.server.common.util.DateUtils;
import com.old.silence.job.server.domain.model.GroupConfig;
import com.old.silence.job.server.domain.model.Retry;
import com.old.silence.job.server.domain.model.RetrySceneConfig;
import com.old.silence.job.server.domain.model.RetryTask;
import com.old.silence.job.server.domain.model.RetryTaskLogMessage;
import com.old.silence.job.server.domain.service.task.TaskAccess;
import com.old.silence.job.server.dto.BatchDeleteRetryTaskVO;
import com.old.silence.job.server.dto.GenerateRetryIdempotentIdVO;
import com.old.silence.job.server.dto.ManualTriggerTaskRequestVO;
import com.old.silence.job.server.dto.ParseLogsVO;
import com.old.silence.job.server.dto.RetryQueryVO;
import com.old.silence.job.server.dto.RetrySaveRequestVO;
import com.old.silence.job.server.dto.RetryUpdateExecutorNameRequestVO;
import com.old.silence.job.server.dto.RetryUpdateStatusRequestVO;
import com.old.silence.job.server.exception.SilenceJobServerException;
import com.old.silence.job.server.infrastructure.persistence.dao.RetryTaskDao;
import com.old.silence.job.server.infrastructure.persistence.dao.RetryTaskLogMessageDao;
import com.old.silence.job.server.model.dto.RetryTaskDTO;
import com.old.silence.job.server.pekko.ActorGenerator;
import com.old.silence.job.server.retry.task.client.RetryRpcClient;
import com.old.silence.job.server.retry.task.dto.RetryTaskPrepareDTO;
import com.old.silence.job.server.retry.task.support.RetryTaskConverter;
import com.old.silence.job.server.retry.task.support.generator.retry.TaskContext;
import com.old.silence.job.server.retry.task.support.generator.retry.TaskGenerator;
import com.old.silence.job.server.vo.RetryResponseVO;
import com.old.silence.job.server.web.api.assembler.RetryMapper;
import com.old.silence.job.server.web.api.assembler.RetryTaskResponseVOMapper;
import com.old.silence.job.server.web.api.assembler.TaskContextMapper;
import com.old.silence.util.CollectionUtils;


@Service
public class RetryService {

    @Autowired
    private ClientNodeAllocateHandler clientNodeAllocateHandler;
    @Autowired
    private RetryTaskDao retryTaskMapper;
    @Autowired
    private AccessTemplate accessTemplate;
    @Autowired
    @Lazy
    private List<TaskGenerator> taskGenerators;
    @Autowired
    private RetryTaskLogMessageDao retryTaskLogMessageMapper;
    @Autowired
    private TransactionTemplate transactionTemplate;

    public Page<RetryResponseVO> getRetryPage(Page<Retry> pageDTO, RetryQueryVO queryVO) {

        String namespaceId = "111";
        List<String> groupNames = List.of("222");

        LambdaQueryWrapper<Retry> queryWrapper = new LambdaQueryWrapper<Retry>()
                .eq(Retry::getNamespaceId, namespaceId)
                .in(CollectionUtils.isNotEmpty(groupNames), Retry::getGroupName, groupNames)
                .eq(StrUtil.isNotBlank(queryVO.getSceneName()), Retry::getSceneName, queryVO.getSceneName())
                .eq(StrUtil.isNotBlank(queryVO.getBizNo()), Retry::getBizNo, queryVO.getBizNo())
                .eq(StrUtil.isNotBlank(queryVO.getIdempotentId()), Retry::getIdempotentId, queryVO.getIdempotentId())
                .eq(Objects.nonNull(queryVO.getRetryId()), Retry::getId, queryVO.getRetryId())
                .eq(Objects.nonNull(queryVO.getRetryStatus()), Retry::getRetryStatus, queryVO.getRetryStatus())
                .eq(Retry::getTaskType,  SystemTaskType.RETRY.getValue())
                .select(Retry::getId, Retry::getBizNo, Retry::getIdempotentId,
                        Retry::getGroupName, Retry::getNextTriggerAt, Retry::getRetryCount,
                        Retry::getRetryStatus, Retry::getUpdatedDate, Retry::getCreatedDate, Retry::getSceneName,
                        Retry::getTaskType, Retry::getParentId)
                .orderByDesc(Retry::getCreatedDate);
        pageDTO = accessTemplate.getRetryAccess().listPage(pageDTO, queryWrapper);

        Set<BigInteger> ids = StreamUtils.toSet(pageDTO.getRecords(), Retry::getId);
        Map<BigInteger, Retry> callbackMap = Maps.newHashMap();
        if (CollectionUtils.isNotEmpty(ids)) {
            List<Retry> callbackTaskList = accessTemplate.getRetryAccess()
                    .list(new LambdaQueryWrapper<Retry>().in(Retry::getParentId, ids));
           callbackMap = StreamUtils.toIdentityMap(callbackTaskList, Retry::getParentId);
        }

        List<RetryResponseVO> retryResponseList = RetryTaskResponseVOMapper.INSTANCE.convertList(pageDTO.getRecords());
        for (RetryResponseVO retryResponseVO : retryResponseList) {
            RetryResponseVO responseVO = RetryTaskResponseVOMapper.INSTANCE.convert(callbackMap.get(retryResponseVO.getId()));
            if (Objects.isNull(responseVO)) {
                retryResponseVO.setChildren(Lists.newArrayList());
            } else {
                retryResponseVO.setChildren(Lists.newArrayList(responseVO));
            }
        }

        return new Page<>();
    }

    
    public RetryResponseVO getRetryById(String groupName, Long id) {
        TaskAccess<Retry> retryTaskAccess = accessTemplate.getRetryAccess();
        Retry retry = retryTaskAccess.one(new LambdaQueryWrapper<Retry>().eq(Retry::getId, id));
        return RetryTaskResponseVOMapper.INSTANCE.convert(retry);
    }

    
    @Transactional
    public int updateRetryStatus(RetryUpdateStatusRequestVO requestVO) {

        RetryStatus retryStatus = requestVO.getRetryStatus();
        if (Objects.isNull(retryStatus)) {
            throw new SilenceJobServerException("重试状态错误. [{}]", requestVO.getRetryStatus());
        }

        String namespaceId = "111";

        TaskAccess<Retry> retryTaskAccess = accessTemplate.getRetryAccess();
        Retry retry = retryTaskAccess.one(new LambdaQueryWrapper<Retry>()
                        .eq(Retry::getNamespaceId, namespaceId)
                        .eq(Retry::getId, requestVO.getId()));
        if (Objects.isNull(retry)) {
            throw new SilenceJobServerException("未查询到重试任务");
        }

        retry.setRetryStatus(requestVO.getRetryStatus());

        // 若恢复重试则需要重新计算下次触发时间
        if (RetryStatus.RUNNING.equals(retryStatus.getValue())) {

            RetrySceneConfig retrySceneConfig = accessTemplate.getSceneConfigAccess()
                    .getSceneConfigByGroupNameAndSceneName(retry.getGroupName(), retry.getSceneName(), namespaceId);
            WaitStrategies.WaitStrategyContext waitStrategyContext = new WaitStrategies.WaitStrategyContext();
            waitStrategyContext.setNextTriggerAt(DateUtils.toNowMilli());
            waitStrategyContext.setTriggerInterval(retrySceneConfig.getTriggerInterval());
            waitStrategyContext.setDelayLevel(retry.getRetryCount() + 1);
            WaitStrategy waitStrategy = WaitStrategies.WaitStrategyEnum.getWaitStrategy(retrySceneConfig.getBackOff().getValue());
            retry.setNextTriggerAt(waitStrategy.computeTriggerTime(waitStrategyContext));
        }

        if (RetryStatus.FINISH.equals(retryStatus)) {
            RetryLogMetaDTO retryLogMetaDTO = RetryTaskConverter.INSTANCE.toLogMetaDTO(retry);
            retryLogMetaDTO.setTimestamp(DateUtils.toNowMilli());
            SilenceJobLog.REMOTE.info("=============手动操作完成============. <|>{}<|>", retryLogMetaDTO);
        }

        retry.setUpdatedDate(Instant.now());
        return retryTaskAccess.updateById(retry);
    }

    
    public int saveRetryTask(RetrySaveRequestVO retryTaskRequestVO) {
        RetryStatus retryStatus = retryTaskRequestVO.getRetryStatus();
        if (Objects.isNull(retryStatus)) {
            throw new SilenceJobServerException("重试状态错误");
        }

        TaskGenerator taskGenerator = taskGenerators.stream()
                .filter(t -> t.supports(TaskGeneratorSceneEnum.MANA_SINGLE.getScene()))
                .findFirst().orElseThrow(() -> new SilenceJobServerException("没有匹配的任务生成器"));
        String namespaceId = "111";

        TaskContext taskContext = new TaskContext();
        taskContext.setSceneName(retryTaskRequestVO.getSceneName());
        taskContext.setGroupName(retryTaskRequestVO.getGroupName());
        taskContext.setInitStatus(retryTaskRequestVO.getRetryStatus());
        taskContext.setNamespaceId(namespaceId);
        taskContext.setTaskInfos(
                Collections.singletonList(TaskContextMapper.INSTANCE.convert(retryTaskRequestVO)));

        // 生成任务
        taskGenerator.taskGenerator(taskContext);

        return 1;
    }

    
    public String idempotentIdGenerate(GenerateRetryIdempotentIdVO generateRetryIdempotentIdVO) {

        String namespaceId = "111";
        Set<RegisterNodeInfo> serverNodes = CacheRegisterTable.getServerNodeSet(
                generateRetryIdempotentIdVO.getGroupName(),
                namespaceId);
        Assert.notEmpty(serverNodes,
                () -> new SilenceJobServerException("生成idempotentId失败: 不存在活跃的客户端节点"));

        RetrySceneConfig retrySceneConfig = accessTemplate.getSceneConfigAccess()
                .getSceneConfigByGroupNameAndSceneName(generateRetryIdempotentIdVO.getGroupName(),
                        generateRetryIdempotentIdVO.getSceneName(), namespaceId);

        RegisterNodeInfo serverNode = clientNodeAllocateHandler.getServerNode(retrySceneConfig.getSceneName(),
                retrySceneConfig.getGroupName(), retrySceneConfig.getNamespaceId(), retrySceneConfig.getRouteKey());

        // 委托客户端生成idempotentId
        GenerateRetryIdempotentIdDTO generateRetryIdempotentIdDTO = new GenerateRetryIdempotentIdDTO();
        generateRetryIdempotentIdDTO.setGroup(generateRetryIdempotentIdVO.getGroupName());
        generateRetryIdempotentIdDTO.setScene(generateRetryIdempotentIdVO.getSceneName());
        generateRetryIdempotentIdDTO.setArgsStr(generateRetryIdempotentIdVO.getArgsStr());
        generateRetryIdempotentIdDTO.setExecutorName(generateRetryIdempotentIdVO.getExecutorName());

        RetryRpcClient rpcClient = RequestBuilder.<RetryRpcClient, ApiResult>newBuilder()
                .nodeInfo(serverNode)
                .client(RetryRpcClient.class)
                .build();

        ApiResult result = rpcClient.generateIdempotentId(generateRetryIdempotentIdDTO);

        Assert.notNull(result, () -> new SilenceJobServerException("idempotentId生成失败"));
        Assert.isTrue(200 != result.getCode(),
                () -> new SilenceJobServerException("idempotentId生成失败:请确保参数与执行器名称正确"));

        return (String) result.getData();
    }

    
    public int updateRetryExecutorName(RetryUpdateExecutorNameRequestVO requestVO) {

        Retry retry = new Retry();
        retry.setExecutorName(requestVO.getExecutorName());
        retry.setRetryStatus(requestVO.getRetryStatus());
        retry.setUpdatedDate(Instant.now());

        String namespaceId = "111";
        // 根据重试数据id，更新执行器名称
        TaskAccess<Retry> retryTaskAccess = accessTemplate.getRetryAccess();
        return retryTaskAccess.update(retry, new LambdaUpdateWrapper<Retry>()
                        .eq(Retry::getNamespaceId, namespaceId)
                        .eq(Retry::getGroupName, requestVO.getGroupName())
                        .in(Retry::getId, requestVO.getIds()));
    }

    
    @Transactional
    public boolean batchDeleteRetry(BatchDeleteRetryTaskVO requestVO) {
        TaskAccess<Retry> retryTaskAccess = accessTemplate.getRetryAccess();
        String namespaceId = "111";

        List<Retry> retries = retryTaskAccess.list(new LambdaQueryWrapper<Retry>()
                        .eq(Retry::getNamespaceId, namespaceId)
                        .eq(Retry::getGroupName, requestVO.getGroupName())
                        .in(Retry::getRetryStatus, RetryStatus.ALLOW_DELETE_STATUS)
                        .in(Retry::getId, requestVO.getIds())
        );

        Assert.notEmpty(retries,
                () -> new SilenceJobServerException("没有可删除的数据, 只有非【处理中】的数据可以删除"));

        Set<BigInteger> retryIds = StreamUtils.toSet(retries, Retry::getId);
        retryTaskMapper.delete(new LambdaQueryWrapper<RetryTask>()
                .eq(RetryTask::getGroupName, requestVO.getGroupName())
                .eq(RetryTask::getNamespaceId, namespaceId)
                .in(RetryTask::getRetryId, retryIds));

        retryTaskLogMessageMapper.delete(
                new LambdaQueryWrapper<RetryTaskLogMessage>()
                        .eq(RetryTaskLogMessage::getNamespaceId, namespaceId)
                        .eq(RetryTaskLogMessage::getGroupName, requestVO.getGroupName())
                        .in(RetryTaskLogMessage::getRetryId, retryIds));

        Assert.isTrue(requestVO.getIds().size() == retryTaskAccess.delete(new LambdaQueryWrapper<Retry>()
                                .eq(Retry::getNamespaceId, namespaceId)
                                .eq(Retry::getGroupName, requestVO.getGroupName())
                                .in(Retry::getRetryStatus, RetryStatus.ALLOW_DELETE_STATUS)
                                .in(Retry::getId, requestVO.getIds()))
                , () -> new SilenceJobServerException("删除重试任务失败, 请检查任务状态是否为已完成或者最大次数"));

        return Boolean.TRUE;
    }

    
    public Integer parseLogs(ParseLogsVO parseLogsVO) {
        RetryStatus retryStatus = parseLogsVO.getRetryStatus();
        if (Objects.isNull(retryStatus)) {
            throw new SilenceJobServerException("重试状态错误");
        }

        String logStr = parseLogsVO.getLogStr();

        String patternString = "<\\|>(.*?)<\\|>";
        Pattern pattern = Pattern.compile(patternString);
        Matcher matcher = pattern.matcher(logStr);

        List<RetryTaskDTO> waitInsertList = new ArrayList<>();
        // 查找匹配的内容并输出
        while (matcher.find()) {
            String extractedData = matcher.group(1);
            if (StrUtil.isBlank(extractedData)) {
                continue;
            }

            List<RetryTaskDTO> retryTaskList = JSON.parseArray(extractedData, RetryTaskDTO.class);
            if (CollectionUtils.isNotEmpty(retryTaskList)) {
                waitInsertList.addAll(retryTaskList);
            }
        }

        Assert.isFalse(waitInsertList.isEmpty(), () -> new SilenceJobServerException("未找到匹配的数据"));
        Assert.isTrue(waitInsertList.size() <= 500, () -> new SilenceJobServerException("最多只能处理500条数据"));

        TaskGenerator taskGenerator = taskGenerators.stream()
                .filter(t -> t.supports(TaskGeneratorSceneEnum.MANA_BATCH.getScene()))
                .findFirst().orElseThrow(() -> new SilenceJobServerException("没有匹配的任务生成器"));

        boolean allMatch = waitInsertList.stream()
                .allMatch(retryTaskDTO -> retryTaskDTO.getGroupName().equals(parseLogsVO.getGroupName()));
        Assert.isTrue(allMatch, () -> new SilenceJobServerException("存在数据groupName不匹配，请检查您的数据"));

        Map<String, List<RetryTaskDTO>> map = StreamUtils.groupByKey(waitInsertList, RetryTaskDTO::getSceneName);

        String namespaceId = "111";

        transactionTemplate.execute((status -> {
            map.forEach(((sceneName, retryTaskDTOS) -> {
                TaskContext taskContext = new TaskContext();
                taskContext.setSceneName(sceneName);
                taskContext.setGroupName(parseLogsVO.getGroupName());
                taskContext.setNamespaceId(namespaceId);
                taskContext.setInitStatus(parseLogsVO.getRetryStatus());
                taskContext.setTaskInfos(CollectionUtils.transformToList(retryTaskDTOS, TaskContextMapper.INSTANCE::convert));

                // 生成任务
                try {
                    taskGenerator.taskGenerator(taskContext);
                } catch (DuplicateKeyException e) {
                    throw new SilenceJobServerException("namespaceId:[{}] groupName:[{}] sceneName:[{}] 任务已经存在",
                            namespaceId, parseLogsVO.getGroupName(), sceneName);
                }

            }));
            return Boolean.TRUE;
        }));

        return waitInsertList.size();
    }

    
    public boolean manualTriggerRetryTask(ManualTriggerTaskRequestVO requestVO) {
        String namespaceId = "111";

        long count = accessTemplate.getGroupConfigAccess().count(new LambdaQueryWrapper<GroupConfig>()
                .eq(GroupConfig::getGroupName, requestVO.getGroupName())
                .eq(GroupConfig::getNamespaceId, namespaceId)
                .eq(GroupConfig::getGroupStatus, true)
        );

        Assert.isTrue(count > 0, () -> new SilenceJobServerException("组:[{}]已经关闭，不支持手动执行.", requestVO.getGroupName()));

        List<BigInteger> retryIds = requestVO.getRetryIds();

        List<Retry> list = accessTemplate.getRetryAccess().list(new LambdaQueryWrapper<Retry>()
                        .eq(Retry::getNamespaceId, namespaceId)
                        .eq(Retry::getTaskType, SystemTaskType.RETRY.getValue())
                        .in(Retry::getId, retryIds)
        );
        Assert.notEmpty(list, () -> new SilenceJobServerException("没有可执行的任务"));

        for (Retry retry : list) {
            RetryTaskPrepareDTO retryTaskPrepareDTO = RetryMapper.INSTANCE.toRetryTaskPrepareDTO(retry);
            // 设置now表示立即执行
            retryTaskPrepareDTO.setNextTriggerAt(DateUtils.toNowMilli());
            retryTaskPrepareDTO.setRetryTaskExecutorScene(RetryTaskExecutorSceneEnum.MANUAL_RETRY.getScene());
            retryTaskPrepareDTO.setRetryId(retry.getId());
            // 准备阶段执行
            ActorRef actorRef = ActorGenerator.retryTaskPrepareActor();
            actorRef.tell(retryTaskPrepareDTO, actorRef);
        }

        return true;
    }
}
