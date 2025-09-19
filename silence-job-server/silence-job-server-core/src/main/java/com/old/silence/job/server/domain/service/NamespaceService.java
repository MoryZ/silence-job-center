package com.old.silence.job.server.domain.service;

import java.util.List;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.metadata.IPage;
import com.old.silence.job.server.domain.model.Namespace;
import com.old.silence.job.server.infrastructure.persistence.dao.NamespaceDao;
import com.old.silence.job.server.vo.NamespaceResponseVO;
import com.old.silence.job.server.web.api.assembler.NamespaceMapper;
import com.old.silence.util.CollectionUtils;


@Service
public class NamespaceService {
    private final NamespaceDao namespaceDao;

    public NamespaceService(NamespaceDao namespaceDao) {
        this.namespaceDao = namespaceDao;
    }

    
    public int create(Namespace namespace) {
        return namespaceDao.insert(namespace);
    }

    public int update(Namespace namespace) {
        return namespaceDao.updateById(namespace);
    }

    
    public IPage<NamespaceResponseVO> query(Page<Namespace> pageDTO, QueryWrapper<Namespace> queryWrapper) {
        Page<Namespace> selectPage = namespaceDao.selectPage(pageDTO, queryWrapper);

        return selectPage.convert(NamespaceMapper.INSTANCE::convert);
    }

    
    public int deleteByUniqueId(String uniqueId) {

        return namespaceDao.delete(new LambdaQueryWrapper<Namespace>().eq(Namespace::getUniqueId, uniqueId));
    }

    
    public List<NamespaceResponseVO> getAllNamespace() {
        List<Namespace> namespaces = namespaceDao.selectList(
                new LambdaQueryWrapper<Namespace>()
                        .select(Namespace::getName, Namespace::getUniqueId)
                        .eq(Namespace::getDeleted, 500)
                        .orderByDesc(Namespace::getId)
        );
        return CollectionUtils.transformToList(namespaces, NamespaceMapper.INSTANCE::convert);
    }
}
