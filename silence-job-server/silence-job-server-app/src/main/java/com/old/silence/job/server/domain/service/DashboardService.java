package com.old.silence.job.server.domain.service;

import cn.hutool.core.util.StrUtil;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.old.silence.core.util.CollectionUtils;
import com.old.silence.job.common.core.enums.NodeType;
import com.old.silence.job.common.core.enums.SystemModeEnum;
import com.old.silence.job.common.core.enums.SystemTaskType;
import com.old.silence.job.common.core.util.StreamUtils;
import com.old.silence.job.server.common.register.ServerRegister;
import com.old.silence.job.server.domain.model.Job;
import com.old.silence.job.server.domain.model.JobSummary;
import com.old.silence.job.server.domain.model.RetrySceneConfig;
import com.old.silence.job.server.domain.model.RetrySummary;
import com.old.silence.job.server.domain.model.ServerNode;
import com.old.silence.job.server.dto.JobLineQueryVo;
import com.old.silence.job.server.dto.LineQueryVO;
import com.old.silence.job.server.enums.DateTypeEnum;
import com.old.silence.job.server.infrastructure.persistence.dao.JobSummaryDao;
import com.old.silence.job.server.infrastructure.persistence.dao.RetrySummaryDao;
import com.old.silence.job.server.infrastructure.persistence.dao.ServerNodeDao;
import com.old.silence.job.server.vo.ActivePodQuantityResponseDO;
import com.old.silence.job.server.vo.DashboardCardResponseDO;
import com.old.silence.job.server.vo.DashboardCardResponseVO;
import com.old.silence.job.server.vo.DashboardLineResponseDO;
import com.old.silence.job.server.vo.DashboardLineResponseVO;
import com.old.silence.job.server.vo.DashboardRetryLineResponseDO;
import com.old.silence.job.server.vo.DashboardRetryLineResponseVO;
import com.old.silence.job.server.web.api.assembler.DispatchQuantityResponseVOMapper;
import com.old.silence.job.server.web.api.assembler.JobSummaryResponseVOMapper;
import com.old.silence.job.server.web.api.assembler.RetrySummaryResponseVOMapper;
import com.old.silence.job.server.web.api.assembler.SceneQuantityRankResponseVOMapper;

import java.time.Instant;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class DashboardService {

    private final ServerNodeDao serverNodeDao;
    private final JobSummaryDao jobSummaryDao;
    private final RetrySummaryDao retrySummaryDao;

    public DashboardService(ServerNodeDao serverNodeDao, JobSummaryDao jobSummaryDao,
                            RetrySummaryDao retrySummaryDao) {
        this.serverNodeDao = serverNodeDao;
        this.jobSummaryDao = jobSummaryDao;
        this.retrySummaryDao = retrySummaryDao;
    }


    public DashboardCardResponseVO taskRetryJob() {

        // 查询登录用户权限
        String namespaceId = "111";
        List<String> groupNames = List.of();
        DashboardCardResponseVO responseVO = new DashboardCardResponseVO();

        // 重试任务
        DashboardCardResponseDO.RetryTask retryTaskDO = retrySummaryDao.selectRetryTask(
                new LambdaQueryWrapper<RetrySummary>()
                        .eq(RetrySummary::getNamespaceId, namespaceId)
                        .in(CollectionUtils.isNotEmpty(groupNames), RetrySummary::getGroupName, groupNames));
        DashboardCardResponseVO.RetryTask retryTaskVO = RetrySummaryResponseVOMapper.INSTANCE.convert(retryTaskDO);
        responseVO.setRetryTask(retryTaskVO);

        // 定时任务
        DashboardCardResponseDO.JobTask jobTaskDO = jobSummaryDao.selectJobTask(
                new LambdaQueryWrapper<JobSummary>()
                        .eq(JobSummary::getSystemTaskType, SystemTaskType.JOB.getValue())
                        .eq(JobSummary::getNamespaceId, namespaceId)
                        .in(CollectionUtils.isNotEmpty(groupNames), JobSummary::getGroupName, groupNames));
        DashboardCardResponseVO.JobTask jobTaskVO = JobSummaryResponseVOMapper.INSTANCE.convert(jobTaskDO);
        responseVO.setJobTask(jobTaskVO);

        // 工作流任务
        DashboardCardResponseDO.JobTask workFlowTaskDO = jobSummaryDao.selectJobTask(
                new LambdaQueryWrapper<JobSummary>()
                        .eq(JobSummary::getSystemTaskType, SystemTaskType.WORKFLOW.getValue())
                        .eq(JobSummary::getNamespaceId, namespaceId)
                        .in(CollectionUtils.isNotEmpty(groupNames), JobSummary::getGroupName, groupNames));
        DashboardCardResponseVO.WorkFlowTask workFlowTaskVO = JobSummaryResponseVOMapper.INSTANCE.convertToWorkFlowTask(workFlowTaskDO);
        responseVO.setWorkFlowTask(workFlowTaskVO);

        // 重试任务柱状图
        HashMap<Instant, DashboardCardResponseVO.RetryTaskBar> retryTaskBarMap = new HashMap<>();
    /*    var zoneId =  ZoneId.systemDefault();
        var beginTime = Instant.now().atZone(zoneId).withHour(0).withMinute(0).withSecond(0).withNano(0).toInstant();
        var endTime = Instant.now().atZone(zoneId).withHour(23).withMinute(59).withSecond(59).withNano(999999999).toInstant();
        for (int i = 0; i < 7; i++) {
            DashboardCardResponseVO.RetryTaskBar retryTaskBar = new DashboardCardResponseVO.RetryTaskBar()
                    .setX(beginTime.plus(-i, ChronoUnit.DAYS).toString()).setTaskTotal(0L);
            retryTaskBarMap.put(endTime.minus(i, ChronoUnit.DAYS), retryTaskBar);
        List<DashboardCardResponseDO.RetryTask> retryTaskList = retrySummaryDao.selectRetryTaskBarList(
                new LambdaQueryWrapper<RetrySummary>()
                        .eq(RetrySummary::getNamespaceId, namespaceId)
                        .in(CollectionUtils.isNotEmpty(groupNames), RetrySummary::getGroupName, groupNames)
                        .orderByDesc(RetrySummary::getId));
        Map<Instant, LongSummaryStatistics> summaryStatisticsMap = retryTaskList.stream()
                .collect(Collectors.groupingBy(DashboardCardResponseDO.RetryTask::getTriggerAt,
                        Collectors.summarizingLong(i -> i.getMaxCountNum() + i.getRunningNum() + i.getSuspendNum() + i.getFinishNum())));
        for (Map.Entry<Instant, LongSummaryStatistics> map : summaryStatisticsMap.entrySet()) {
            if (retryTaskBarMap.containsKey(beginTime)) {
                DashboardCardResponseVO.RetryTaskBar retryTaskBar = retryTaskBarMap.get(LocalDateTimeUtil.beginOfDay(map.getKey()));
                retryTaskBar.setX(map.getKey().toLocalDate().toString()).setTaskTotal(map.getSum());
            }
        }*/
        responseVO.setRetryTaskBarList(new ArrayList<>(retryTaskBarMap.values()));

        // 在线Pods
        List<ActivePodQuantityResponseDO> activePodQuantityDO = serverNodeDao.selectActivePodCount(
                new LambdaQueryWrapper<ServerNode>()
                        .in(ServerNode::getNamespaceId, List.of("111"), ServerRegister.NAMESPACE_ID)
                        .groupBy(ServerNode::getNodeType));
        Map<NodeType, Long> map = StreamUtils.toMap(activePodQuantityDO,
                ActivePodQuantityResponseDO::getNodeType, ActivePodQuantityResponseDO::getTotal);
        Long clientTotal = map.getOrDefault(NodeType.CLIENT, 0L);
        Long serverTotal = map.getOrDefault(NodeType.SERVER, 0L);
        responseVO.getOnLineService().setServerTotal(serverTotal);
        responseVO.getOnLineService().setClientTotal(clientTotal);
        responseVO.getOnLineService().setTotal(clientTotal + serverTotal);

        return responseVO;
    }

    
    public DashboardRetryLineResponseVO retryLineList(Page<Object> page, LineQueryVO queryVO) {
        // 查询登录用户权限
        String namespaceId = "111";
        List<String> groupNames = List.of();
        DashboardRetryLineResponseVO responseVO = new DashboardRetryLineResponseVO();

        // 重试任务列表
        LambdaQueryWrapper<RetrySceneConfig> wrapper = new LambdaQueryWrapper<RetrySceneConfig>()
                .eq(RetrySceneConfig::getNamespaceId, namespaceId)
                .in(CollectionUtils.isNotEmpty(groupNames), RetrySceneConfig::getGroupName, groupNames);

        // 针对 Group By 分页自定义countStatement
        page.setSearchCount(false);
        page.setTotal(retrySummaryDao.selectRetryTaskListCount(wrapper));

        IPage<DashboardRetryLineResponseDO.Task> resultPage = retrySummaryDao.selectRetryTaskList(wrapper, page);
        List<DashboardRetryLineResponseVO.Task> taskList = CollectionUtils.transformToList(resultPage.getRecords(), JobSummaryResponseVOMapper.INSTANCE::convertList);

        Page<DashboardRetryLineResponseVO.Task> responsePage = new Page<>(page.getCurrent(), page.getSize(), page.getTotal(), true);
        responseVO.setTaskList(responsePage);

        // 折线图
        DateTypeEnum dateTypeEnum = DateTypeEnum.valueOf(queryVO.getType());
        Instant startDateTime =  Instant.now();
        Instant endDateTime = Instant.now();
        List<DashboardLineResponseDO> dashboardRetryLinkeResponseDOList = retrySummaryDao.selectRetryLineList(
                "dateFormat",
                new LambdaQueryWrapper<RetrySummary>()
                        .in(CollectionUtils.isNotEmpty(groupNames), RetrySummary::getGroupName, groupNames)
                        .eq(StrUtil.isNotBlank(queryVO.getGroupName()), RetrySummary::getGroupName, queryVO.getGroupName())
                        .eq(RetrySummary::getNamespaceId, namespaceId)
                        .between(RetrySummary::getTriggerAt, startDateTime, endDateTime));
        List<DashboardLineResponseVO> dashboardLineResponseVOList = DispatchQuantityResponseVOMapper.INSTANCE.convertList(dashboardRetryLinkeResponseDOList);
        dateTypeEnum.getConsumer().accept(dashboardLineResponseVOList);
        dashboardLineResponseVOList.sort(Comparator.comparing(DashboardLineResponseVO::getCreatedDate));
        responseVO.setDashboardLineResponseDOList(dashboardLineResponseVOList);

        // 排行榜
        List<DashboardRetryLineResponseDO.Rank> rankList = retrySummaryDao.selectDashboardRankList(
                new LambdaQueryWrapper<RetrySummary>()
                        .in(CollectionUtils.isNotEmpty(groupNames), RetrySummary::getGroupName, groupNames)
                        .eq(StrUtil.isNotBlank(queryVO.getGroupName()), RetrySummary::getGroupName, groupNames)
                        .eq(RetrySummary::getNamespaceId, namespaceId)
                        .ge(RetrySummary::getTriggerAt, startDateTime)
                        .le(RetrySummary::getTriggerAt, endDateTime)
                        .groupBy(RetrySummary::getNamespaceId, RetrySummary::getGroupName, RetrySummary::getSceneName));
        List<DashboardRetryLineResponseVO.Rank> ranks = CollectionUtils.transformToList(rankList, SceneQuantityRankResponseVOMapper.INSTANCE::convertList);
        responseVO.setRankList(ranks);
        return responseVO;
    }

    
    public DashboardRetryLineResponseVO jobLineList(Page<Object> pager, JobLineQueryVo queryVO) {
        // 查询登录用户权限
        String namespaceId = "111";
        List<String> groupNames = List.of();
        DashboardRetryLineResponseVO responseVO = new DashboardRetryLineResponseVO();

        // 任务类型
        SystemTaskType systemTaskType = SystemModeEnum.JOB.name().equals(queryVO.getMode()) ? SystemTaskType.JOB : SystemTaskType.WORKFLOW;
        LambdaQueryWrapper<Job> wrapper = new LambdaQueryWrapper<Job>()
                .eq(Job::getDeleted, 0)
                .eq(Job::getNamespaceId, namespaceId)
                .in(CollectionUtils.isNotEmpty(groupNames), Job::getGroupName, groupNames);

        // 针对 Group By 分页自定义 countStatement
        pager.setSearchCount(false);
        pager.setTotal(SystemModeEnum.JOB.name().equals(queryVO.getMode()) ?
                jobSummaryDao.selectJobTaskListCount(wrapper) :
                jobSummaryDao.selectWorkflowTaskListCount(wrapper));

        IPage<DashboardRetryLineResponseDO.Task> taskIPage = SystemModeEnum.JOB.name().equals(queryVO.getMode()) ?
                jobSummaryDao.selectJobTaskList(wrapper, pager) : jobSummaryDao.selectWorkflowTaskList(wrapper, pager);
        List<DashboardRetryLineResponseVO.Task> taskList = CollectionUtils.transformToList(taskIPage.getRecords(), JobSummaryResponseVOMapper.INSTANCE::convertList);
        Page<DashboardRetryLineResponseVO.Task> Page = new Page<>(pager.getCurrent(), pager.getSize(), pager.getTotal());
        responseVO.setTaskList(Page);

        // 折线图
        DateTypeEnum dateTypeEnum = DateTypeEnum.valueOf(queryVO.getType());
        Instant startDateTime = Instant.now();
        Instant endDateTime = Instant.now();
        List<DashboardLineResponseDO> dashboardLineResponseDOList = jobSummaryDao.selectJobLineList(
                "dateFormat",
                new LambdaQueryWrapper<JobSummary>()
                        .in(CollectionUtils.isNotEmpty(groupNames), JobSummary::getGroupName, groupNames)
                        .eq(StrUtil.isNotBlank(queryVO.getGroupName()), JobSummary::getGroupName, queryVO.getGroupName())
                        .eq(JobSummary::getSystemTaskType, systemTaskType)
                        .eq(JobSummary::getNamespaceId, namespaceId)
                        .between(JobSummary::getTriggerAt, startDateTime, endDateTime));
        List<DashboardLineResponseVO> dashboardLineResponseVOList = DispatchQuantityResponseVOMapper.INSTANCE.convertList(dashboardLineResponseDOList);
        dateTypeEnum.getConsumer().accept(dashboardLineResponseVOList);
        dashboardLineResponseVOList.sort(Comparator.comparing(DashboardLineResponseVO::getCreatedDate));
        responseVO.setDashboardLineResponseDOList(dashboardLineResponseVOList);

        // 排行榜
        List<DashboardRetryLineResponseDO.Rank> rankList = jobSummaryDao.selectDashboardRankList(
                systemTaskType,
                new LambdaQueryWrapper<JobSummary>()
                        .in(CollectionUtils.isNotEmpty(groupNames), JobSummary::getGroupName, groupNames)
                        .eq(StrUtil.isNotBlank(queryVO.getGroupName()), JobSummary::getGroupName, queryVO.getGroupName())
                        .ge(JobSummary::getTriggerAt, startDateTime).le(JobSummary::getTriggerAt, endDateTime)
                        .eq(JobSummary::getSystemTaskType, systemTaskType)
                        .eq(JobSummary::getNamespaceId, namespaceId)
                        .groupBy(JobSummary::getNamespaceId, JobSummary::getGroupName, JobSummary::getBusinessId));
        List<DashboardRetryLineResponseVO.Rank> ranks = CollectionUtils.transformToList(rankList, SceneQuantityRankResponseVOMapper.INSTANCE::convertList);
        responseVO.setRankList(ranks);
        return responseVO;
    }

    


}
