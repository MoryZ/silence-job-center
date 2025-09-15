package com.old.silence.job.server.domain.service.handler;

import cn.hutool.core.lang.Assert;
import org.springframework.stereotype.Component;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.google.common.collect.Sets;
import com.old.silence.core.util.CollectionUtils;
import com.old.silence.job.common.core.util.StreamUtils;
import com.old.silence.job.server.domain.model.GroupConfig;
import com.old.silence.job.server.domain.service.AccessTemplate;
import com.old.silence.job.server.exception.SilenceJobServerException;

import java.util.List;
import java.util.Set;


@Component
public class GroupHandler {

    private final AccessTemplate accessTemplate;

    public GroupHandler(AccessTemplate accessTemplate) {
        this.accessTemplate = accessTemplate;
    }

    /**
     * 校验组是否存在
     *
     * @param groupNameSet 待校验的组
     * @param namespaceId  空间
     */
    public void validateGroupExistence(Set<String> groupNameSet, String namespaceId) {
        Assert.notEmpty(groupNameSet, () -> new SilenceJobServerException("组不能为空"));
        List<GroupConfig> groupConfigs = accessTemplate.getGroupConfigAccess()
                .list(new LambdaQueryWrapper<GroupConfig>()
                        .select(GroupConfig::getGroupName)
                        .eq(GroupConfig::getNamespaceId, namespaceId)
                        .in(GroupConfig::getGroupName, groupNameSet)
                );

        Set<String> notExistedGroupNameSet = Sets.difference(groupNameSet,
                StreamUtils.toSet(groupConfigs, GroupConfig::getGroupName));

        Assert.isTrue(CollectionUtils.isEmpty(notExistedGroupNameSet),
                () -> new SilenceJobServerException("组:{}不存在", notExistedGroupNameSet));
    }

}
