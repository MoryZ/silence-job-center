package com.old.silence.job.server.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.old.silence.job.server.web.domain.service.GroupConfigService;

import java.util.List;


@RestController
@RequestMapping("/api/v1")
public class PartitionResource {
    private final GroupConfigService groupConfigService;

    public PartitionResource(GroupConfigService groupConfigService) {
        this.groupConfigService = groupConfigService;
    }

    @GetMapping("/partitionTables")
    public List<Integer> getTablePartitionList() {
        return groupConfigService.getTablePartitionList();
    }


}
