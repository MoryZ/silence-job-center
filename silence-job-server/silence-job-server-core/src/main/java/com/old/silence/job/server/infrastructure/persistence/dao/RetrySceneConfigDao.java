package com.old.silence.job.server.infrastructure.persistence.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.old.silence.job.server.domain.model.GroupConfig;
import com.old.silence.job.server.domain.model.RetrySceneConfig;

@Mapper
public interface RetrySceneConfigDao extends BaseMapper<RetrySceneConfig> {

    @Select("select * from retry_scene_config where group_name = #{groupName} and scene_name=#{sceneName} and namespace_id=#{namespaceId}")
    RetrySceneConfig getSceneConfigByGroupNameAndSceneName(String groupName, String sceneName, String namespaceId);
}
