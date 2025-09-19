package com.old.silence.job.server.domain.service;

import cn.hutool.lang.Assert;
import cn.hutool.util.ReUtil;
import cn.hutool.util.StrUtil;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;
import javax.sql.DataSource;

import org.springframework.jdbc.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.plugins.pagination.PageDTO;
import com.google.common.collect.Lists;
import com.old.silence.job.common.util.StreamUtils;
import com.old.silence.job.server.common.dto.PartitionTask;
import com.old.silence.job.server.common.handler.ConfigVersionSyncHandler;
import com.old.silence.job.server.common.util.PartitionTaskUtils;
import com.old.silence.job.server.domain.model.GroupConfig;
import com.old.silence.job.server.domain.model.Job;
import com.old.silence.job.server.domain.model.Namespace;
import com.old.silence.job.server.domain.model.RetrySceneConfig;
import com.old.silence.job.server.domain.model.ServerNode;
import com.old.silence.job.server.domain.model.SystemUserPermission;
import com.old.silence.job.server.domain.model.Workflow;
import com.old.silence.job.server.domain.service.config.ConfigAccess;
import com.old.silence.job.server.dto.ExportGroupVO;
import com.old.silence.job.server.dto.GroupConfigCommand;
import com.old.silence.job.server.exception.SilenceJobServerException;
import com.old.silence.job.server.infrastructure.persistence.dao.JobDao;
import com.old.silence.job.server.infrastructure.persistence.dao.NamespaceDao;
import com.old.silence.job.server.infrastructure.persistence.dao.ServerNodeDao;
import com.old.silence.job.server.infrastructure.persistence.dao.SystemUserPermissionDao;
import com.old.silence.job.server.infrastructure.persistence.dao.WorkflowDao;
import com.old.silence.job.server.vo.GroupConfigResponseVO;
import com.old.silence.job.server.web.api.assembler.GroupConfigMapper;
import com.old.silence.job.server.web.api.assembler.GroupConfigResponseVOMapper;
import com.old.silence.job.server.web.api.vo.CommonOptions;
import com.old.silence.util.CollectionUtils;

/**
 * CRUD 组、场景、通知
 *
 */
@Service
public class GroupConfigService {

    private final ServerNodeDao serverNodeDao;
    private final AccessTemplate accessTemplate;
    private final ConfigVersionSyncHandler configVersionSyncHandler;
    private final JdbcTemplate jdbcTemplate;
    private final NamespaceDao namespaceMapper;
    private final JobDao jobMapper;
    private final WorkflowDao workflowMapper;
    private final SystemUserPermissionDao systemUserPermissionMapper;

    public GroupConfigService(ServerNodeDao serverNodeDao, AccessTemplate accessTemplate,
                              ConfigVersionSyncHandler configVersionSyncHandler, JdbcTemplate jdbcTemplate,
                              NamespaceDao namespaceMapper, JobDao jobMapper, WorkflowDao workflowMapper,
                              SystemUserPermissionDao systemUserPermissionMapper) {
        this.serverNodeDao = serverNodeDao;
        this.accessTemplate = accessTemplate;
        this.configVersionSyncHandler = configVersionSyncHandler;
        this.jdbcTemplate = jdbcTemplate;
        this.namespaceMapper = namespaceMapper;
        this.jobMapper = jobMapper;
        this.workflowMapper = workflowMapper;
        this.systemUserPermissionMapper = systemUserPermissionMapper;
    }


    @Transactional
    public Boolean create(GroupConfigCommand groupConfigCommand) {

        String namespaceId =  "764d604ec6fc45f68cd92514c40e9e1a";

        ConfigAccess<GroupConfig> groupConfigAccess = accessTemplate.getGroupConfigAccess();
        Assert.isTrue(groupConfigAccess.count(new LambdaQueryWrapper<GroupConfig>()
                        .eq(GroupConfig::getNamespaceId, namespaceId)
                        .eq(GroupConfig::getGroupName, groupConfigCommand.getGroupName())) == 0,
                () -> new SilenceJobServerException("GroupName已经存在 {}", groupConfigCommand.getGroupName()));

        // 保存组配置
        return doSaveGroupConfig(namespaceId, groupConfigCommand);
    }


    
    @Transactional
    public Boolean updateGroup(GroupConfigCommand groupConfigCommand) {

        List<Integer> tablePartitionList = getTablePartitionList();
        if (CollectionUtils.isEmpty(tablePartitionList)) {
            return Boolean.FALSE;
        }

        String groupName = groupConfigCommand.getGroupName();
        String namespaceId = "111";

        ConfigAccess<GroupConfig> groupConfigAccess = accessTemplate.getGroupConfigAccess();
        long count = groupConfigAccess.count(
                new LambdaQueryWrapper<GroupConfig>()
                        .eq(GroupConfig::getNamespaceId, namespaceId)
                        .eq(GroupConfig::getGroupName, groupName));
        if (count <= 0) {
            return false;
        }

        GroupConfig groupConfig = GroupConfigMapper.INSTANCE.toGroupConfig(groupConfigCommand);
        groupConfig.setDescription(Optional.ofNullable(groupConfigCommand.getDescription()).orElse(StrUtil.EMPTY));
        // 使用@TableField(value = "version", update= "%s+1") 进行更新version, 这里必须初始化一个值
        groupConfig.setVersion(1);
        // 不允许更新token
        groupConfig.setToken(null);
        Assert.isTrue(tablePartitionList.contains(groupConfigCommand.getGroupPartition()),
                () -> new SilenceJobServerException("分区不存在. [{}]", tablePartitionList));
        Assert.isTrue(groupConfigCommand.getGroupPartition() >= 0,
                () -> new SilenceJobServerException("分区不能是负数."));

        // 不允许更新组
        groupConfig.setGroupName(null);
        Assert.isTrue(1 == groupConfigAccess.update(groupConfig,
                        new LambdaUpdateWrapper<GroupConfig>()
                                .eq(GroupConfig::getNamespaceId, namespaceId)
                                .eq(GroupConfig::getGroupName, groupName)),
                () -> new SilenceJobServerException("exception occurred while adding group. groupConfigVO[{}]",
                        groupConfigCommand));

        // 同步版本， 版本为0代表需要同步到客户端
        boolean add = configVersionSyncHandler.addSyncTask(groupName, namespaceId, 0);
        // 若添加失败则强制发起同步
        if (!add) {
            configVersionSyncHandler.syncVersion(groupName, namespaceId);
        }
        return Boolean.TRUE;
    }

    public Boolean updateGroupStatus(String groupName, Boolean status) {
        GroupConfig groupConfig = new GroupConfig();
        groupConfig.setGroupStatus(status);
        ConfigAccess<GroupConfig> groupConfigAccess = accessTemplate.getGroupConfigAccess();
        return groupConfigAccess.update(groupConfig,
                new LambdaUpdateWrapper<GroupConfig>()
                        .eq(GroupConfig::getNamespaceId,  "764d604ec6fc45f68cd92514c40e9e1a")
                        .eq(GroupConfig::getGroupName, groupName)) == 1;
    }

    public Page<GroupConfigResponseVO> queryPage(Page<GroupConfigResponseVO> page, QueryWrapper<GroupConfig> queryWrapper) {

        String namespaceId =  "764d604ec6fc45f68cd92514c40e9e1a";

        ConfigAccess<GroupConfig> groupConfigAccess = accessTemplate.getGroupConfigAccess();

        Page<GroupConfig> groupConfigPageDTO = groupConfigAccess.listPage(
                new PageDTO<>(page.getCurrent(), page.getSize()),
                new LambdaQueryWrapper<GroupConfig>().eq(GroupConfig::getNamespaceId, namespaceId)
        );

        List<GroupConfig> records = groupConfigPageDTO.getRecords();
        if (CollectionUtils.isEmpty(records)) {
            return new Page<>(groupConfigPageDTO.getCurrent(), groupConfigPageDTO.getSize(),
                    groupConfigPageDTO.getTotal());
        }

        Page<GroupConfigResponseVO> Page = new Page<>(groupConfigPageDTO.getCurrent(),
                groupConfigPageDTO.getSize(), groupConfigPageDTO.getTotal());

        List<GroupConfigResponseVO> responseVOList = GroupConfigResponseVOMapper.INSTANCE.convertList(
                records);

        for (GroupConfigResponseVO groupConfigResponseVO : responseVOList) {
            Optional.ofNullable(groupConfigResponseVO.getIdGeneratorMode())
                    .ifPresent(idGeneratorMode -> {
                        groupConfigResponseVO.setIdGeneratorModeName(idGeneratorMode.getDescription());
                    });
        }

        Page.setRecords(responseVOList);

        return Page;
    }

    private boolean doSaveGroupConfig(final String namespaceId, GroupConfigCommand groupConfigCommand) {

        GroupConfig groupConfig = GroupConfigMapper.INSTANCE.toGroupConfig(groupConfigCommand);
        groupConfig.setCreatedDate(Instant.now());
        groupConfig.setVersion(1);
        groupConfig.setNamespaceId(namespaceId);
        groupConfig.setGroupName(groupConfigCommand.getGroupName());
        groupConfig.setToken(groupConfigCommand.getToken());
        groupConfig.setDescription(Optional.ofNullable(groupConfigCommand.getDescription()).orElse(StrUtil.EMPTY));
        ConfigAccess<GroupConfig> groupConfigAccess = accessTemplate.getGroupConfigAccess();
        Assert.isTrue(1 == groupConfigAccess.insert(groupConfig),
                () -> new SilenceJobServerException("新增组异常异常 groupConfigVO[{}]", groupConfigCommand));

        return Boolean.TRUE;
    }

    
    public GroupConfigResponseVO getGroupConfigByGroupName(String groupName) {

        ConfigAccess<GroupConfig> groupConfigAccess = accessTemplate.getGroupConfigAccess();
        GroupConfig groupConfig = groupConfigAccess.one(
                new LambdaQueryWrapper<GroupConfig>()
                        .eq(GroupConfig::getNamespaceId, "111")
                        .eq(GroupConfig::getGroupName, groupName));

        GroupConfigResponseVO groupConfigResponseVO = GroupConfigResponseVOMapper.INSTANCE.convert(
                groupConfig);

        Optional.ofNullable(groupConfig.getIdGeneratorMode()).ifPresent(idGeneratorMode -> {
            groupConfigResponseVO.setIdGeneratorModeName(idGeneratorMode.getDescription());
        });

        return groupConfigResponseVO;
    }

    
    public List<GroupConfigResponseVO> getAllGroupConfigList(final List<String> namespaceIds) {

        ConfigAccess<GroupConfig> groupConfigAccess = accessTemplate.getGroupConfigAccess();

        List<GroupConfig> groupConfigs = groupConfigAccess.list(
                new LambdaQueryWrapper<GroupConfig>()
                        .select(GroupConfig::getGroupName, GroupConfig::getNamespaceId)
                        .in(CollectionUtils.isNotEmpty(namespaceIds), GroupConfig::getNamespaceId, namespaceIds));
        if (CollectionUtils.isEmpty(groupConfigs)) {
            return Collections.emptyList();
        }

        List<Namespace> namespaces = namespaceMapper.selectList(
                new LambdaQueryWrapper<Namespace>()
                        .in(Namespace::getUniqueId, StreamUtils.toSet(groupConfigs, GroupConfig::getNamespaceId)));

        Map<String, String> namespaceMap = StreamUtils.toMap(namespaces, Namespace::getUniqueId, Namespace::getName);

        List<GroupConfigResponseVO> groupConfigResponses = GroupConfigResponseVOMapper.INSTANCE.convertList(
                groupConfigs);
        for (final GroupConfigResponseVO groupConfigResponseVO : groupConfigResponses) {
            groupConfigResponseVO.setNamespaceName(namespaceMap.get(groupConfigResponseVO.getNamespaceId()));
        }

        return groupConfigResponses;
    }

    
    public List<CommonOptions> getAllGroupNameList() {

        ConfigAccess<GroupConfig> groupConfigAccess = accessTemplate.getGroupConfigAccess();
        List<GroupConfig> groupConfigs = groupConfigAccess.list(new LambdaQueryWrapper<GroupConfig>()
                .eq(GroupConfig::getNamespaceId, "764d604ec6fc45f68cd92514c40e9e1a"));

        return CollectionUtils.transformToList(groupConfigs, groupConfig -> new CommonOptions(groupConfig.getGroupName(), groupConfig.getId()));
    }

    
    public List<String> getOnlinePods(String groupName) {
        List<ServerNode> serverNodes = serverNodeDao.selectList(
                new LambdaQueryWrapper<ServerNode>()
                        .eq(ServerNode::getNamespaceId, "111")
                        .eq(ServerNode::getGroupName, groupName));
        return StreamUtils.toList(serverNodes, serverNode -> serverNode.getHostIp() + ":" + serverNode.getHostPort());
    }

    
    public List<Integer> getTablePartitionList() {
        DataSource dataSource = jdbcTemplate.getDataSource();
        try (Connection connection = dataSource.getConnection()) {
            String catalog = connection.getCatalog();
            String schema = connection.getSchema();

            String tableNamePattern = "sj_retry_task_%";

            DatabaseMetaData metaData = connection.getMetaData();
            ResultSet tableRs = metaData.getTables(catalog, schema, tableNamePattern, new String[]{"TABLE"});

            // 获取表名
            List<String> tableList = new ArrayList<>();
            while (tableRs.next()) {
                String tableName = tableRs.getString("TABLE_NAME");
                tableList.add(tableName);
            }

            return tableList.stream()
                    .map(ReUtil::getFirstNumber)
                    .filter(Objects::nonNull)
                    .distinct()
                    .collect(Collectors.toList());
        } catch (SQLException ignored) {
        }

        return Collections.emptyList();
    }

    
    @Transactional
    public void importGroup(final List<GroupConfigCommand> requestList) {
        String namespaceId = "111";

        Set<String> groupSet = StreamUtils.toSet(requestList, GroupConfigCommand::getGroupName);
        ConfigAccess<GroupConfig> groupConfigAccess = accessTemplate.getGroupConfigAccess();

        List<GroupConfig> configs = groupConfigAccess.list(new LambdaQueryWrapper<GroupConfig>()
                .select(GroupConfig::getGroupName)
                .eq(GroupConfig::getNamespaceId, namespaceId)
                .in(GroupConfig::getGroupName, groupSet));

        Assert.isTrue(CollectionUtils.isEmpty(configs),
                () -> new SilenceJobServerException("导入失败. 原因: 组{}已存在", StreamUtils.toSet(configs, GroupConfig::getGroupName)));

        for (final GroupConfigCommand groupConfigCommand : requestList) {

            // 保存组配置
            doSaveGroupConfig(namespaceId, groupConfigCommand);

        }

    }

    
    public String exportGroup(ExportGroupVO exportGroupVO) {
        String namespaceId = "111";

        List<GroupConfigCommand> allRequestList = Lists.newArrayList();
        PartitionTaskUtils.process((startId -> {
            List<GroupConfig> groupConfigs = accessTemplate.getGroupConfigAccess().listPage(new PageDTO<>(0, 100),
                    new LambdaQueryWrapper<GroupConfig>()
                            .ge(GroupConfig::getId, startId)
                            .eq(GroupConfig::getNamespaceId, namespaceId)
                            .eq(Objects.nonNull(exportGroupVO.getGroupStatus()), GroupConfig::getGroupStatus, exportGroupVO.getGroupStatus())
                            .in(CollectionUtils.isNotEmpty(exportGroupVO.getGroupIds()), GroupConfig::getId, exportGroupVO.getGroupIds())
                            .likeRight(StrUtil.isNotBlank(exportGroupVO.getGroupName()), GroupConfig::getGroupName, StrUtil.trim(exportGroupVO.getGroupName()))
                            .orderByAsc(GroupConfig::getId)
            ).getRecords();
            return groupConfigs.stream().map(GroupConfigPartitionTask::new).collect(Collectors.toList());
        }), partitionTasks -> {
            List<GroupConfigPartitionTask> configPartitionTasks = (List<GroupConfigPartitionTask>) partitionTasks;
            List<GroupConfig> configs = StreamUtils.toList(configPartitionTasks, GroupConfigPartitionTask::getConfig);
            allRequestList.addAll(
                    CollectionUtils.transformToList(configs, GroupConfigMapper.INSTANCE::toGroupConfigRequestVO));
        }, 0);

        return JSON.toJSONString(allRequestList);
    }

    
    public boolean deleteByGroupName(String groupName) {
        String namespaceId = "111";
        // 前置检查
        // 1. 定时任务是否删除
        Assert.isTrue(CollectionUtils.isEmpty(jobMapper.selectList(new LambdaQueryWrapper<Job>()
                        .eq(Job::getNamespaceId, namespaceId)
                        .eq(Job::getGroupName, groupName).orderByAsc(Job::getId))),
                () -> new SilenceJobServerException("存在未删除的定时任务. 请先删除当前组的定时任务后再重试删除"));
        // 2. 工作流是否删除
        Assert.isTrue(CollectionUtils.isEmpty(workflowMapper.selectList(new LambdaQueryWrapper<Workflow>()
                        .eq(Workflow::getNamespaceId, namespaceId)
                        .eq(Workflow::getGroupName, groupName).orderByAsc(Workflow::getId))),
                () -> new SilenceJobServerException("存在未删除的工作流任务. 请先删除当前组的工作流任务后再重试删除"));
        // 3. 重试场景是否删除
        Assert.isTrue(CollectionUtils.isEmpty(accessTemplate.getSceneConfigAccess().listPage(new PageDTO<>(1, 1), new LambdaQueryWrapper<RetrySceneConfig>()
                        .eq(RetrySceneConfig::getNamespaceId, namespaceId)
                        .eq(RetrySceneConfig::getGroupName, groupName).orderByAsc(RetrySceneConfig::getId)).getRecords()),
                () -> new SilenceJobServerException("存在未删除的重试场景. 请先删除当前组的重试场景后再重试删除"));
        // 4. 是否存在已分配的权限
        Assert.isTrue(CollectionUtils.isEmpty(systemUserPermissionMapper.selectList(new LambdaQueryWrapper<SystemUserPermission>()
                        .eq(SystemUserPermission::getNamespaceId, namespaceId)
                        .eq(SystemUserPermission::getGroupName, groupName).orderByAsc(SystemUserPermission::getId))),
                () -> new SilenceJobServerException("存在已分配组权限. 请先删除已分配的组权限后再重试删除"));
        // 5. 检查是否存活的客户端节点
        Assert.isTrue(CollectionUtils.isEmpty(serverNodeDao.selectList(new LambdaQueryWrapper<ServerNode>()
                        .eq(ServerNode::getNamespaceId, namespaceId)
                        .eq(ServerNode::getGroupName, groupName).orderByAsc(ServerNode::getId))),
                () -> new SilenceJobServerException("存在存活中客户端节点."));

        Assert.isTrue(1 == accessTemplate.getGroupConfigAccess().delete(
                        new LambdaQueryWrapper<GroupConfig>()
                                .eq(GroupConfig::getNamespaceId, namespaceId)
                                .eq(GroupConfig::getGroupStatus, false)
                                .eq(GroupConfig::getGroupName, groupName)),
                () -> new SilenceJobServerException("删除组失败, 请检查状态是否关闭状态"));

        return Boolean.TRUE;
    }

    
    
    private static class GroupConfigPartitionTask extends PartitionTask {
        // 这里就直接放GroupConfig为了后面若加字段不需要再这里在调整了
        private final GroupConfig config;

        public GroupConfigPartitionTask(GroupConfig config) {
            this.config = config;
            setId(config.getId());
        }

        public GroupConfig getConfig() {
            return config;
        }
    }
}
