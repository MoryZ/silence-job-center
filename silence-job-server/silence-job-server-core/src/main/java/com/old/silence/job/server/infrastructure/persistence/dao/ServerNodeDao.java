package com.old.silence.job.server.infrastructure.persistence.dao;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.old.silence.job.server.domain.model.ServerNode;
import com.old.silence.job.server.vo.ActivePodQuantityResponseDO;

import java.util.List;

@Mapper
public interface ServerNodeDao extends BaseMapper<ServerNode> {

    int insertBatch(@Param("list") List<ServerNode> list);

    int updateBatchExpireAt(@Param("list") List<ServerNode> list);

    List<ActivePodQuantityResponseDO> selectActivePodCount(@Param("ew") Wrapper<ServerNode> wrapper);

}
