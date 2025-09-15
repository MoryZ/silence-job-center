package com.old.silence.job.server.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.old.silence.job.server.domain.model.ServerNode;
import com.old.silence.job.server.dto.ServerNodeQueryVO;
import com.old.silence.job.server.vo.ServerNodeResponseVO;
import com.old.silence.job.server.web.domain.service.PodsService;

/**
 * @author moryzang
 */
@RestController
@RequestMapping("/api/v1")
public class PodsResource {

    private final PodsService podsService;

    public PodsResource(PodsService podsService) {
        this.podsService = podsService;
    }

    @GetMapping(value = "/pods", params = {"pageNo", "pageSize"})
    public Page<ServerNodeResponseVO> pods(Page<ServerNode> page, ServerNodeQueryVO serverNodeQueryVO) {
        return podsService.pods(page, serverNodeQueryVO);
    }

}
