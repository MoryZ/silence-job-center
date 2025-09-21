package com.old.silence.job.server.api;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.old.silence.core.util.CollectionUtils;
import com.old.silence.job.server.api.assembler.NotifyRecipientMapper;
import com.old.silence.job.server.domain.model.NotifyRecipient;
import com.old.silence.job.server.domain.service.NotifyRecipientService;
import com.old.silence.job.server.dto.ExportNotifyRecipientCommand;
import com.old.silence.job.server.dto.NotifyRecipientQueryVO;
import com.old.silence.job.server.dto.NotifyRecipientCommand;
import com.old.silence.job.server.util.ExportUtils;
import com.old.silence.job.server.util.ImportUtils;
import com.old.silence.job.server.vo.CommonLabelValueResponseVO;
import com.old.silence.job.server.vo.NotifyRecipientResponseVO;

import javax.validation.constraints.NotEmpty;
import java.io.IOException;
import java.math.BigInteger;
import java.util.List;
import java.util.Set;

/**
 * <p>
 * 告警通知接收人 前端控制器
 * </p>
 *
 */
@RestController
@RequestMapping("/api/v1")
public class NotifyRecipientResource {
    private final NotifyRecipientService notifyRecipientService;
    private final NotifyRecipientMapper notifyRecipientMapper;

    public NotifyRecipientResource(NotifyRecipientService notifyRecipientService,
                                   NotifyRecipientMapper notifyRecipientMapper) {
        this.notifyRecipientService = notifyRecipientService;
        this.notifyRecipientMapper = notifyRecipientMapper;
    }

    @PostMapping("notifyRecipients")
    public Boolean create(@RequestBody @Validated NotifyRecipientCommand notifyRecipientCommand) {
        var notifyRecipient = notifyRecipientMapper.convert(notifyRecipientCommand);
        return notifyRecipientService.saveNotifyRecipient(notifyRecipient);
    }

    @PutMapping("notifyRecipients/{id}")
    public Boolean update(@PathVariable BigInteger id, @RequestBody @Validated NotifyRecipientCommand notifyRecipientCommand) {
        var notifyRecipient = notifyRecipientMapper.convert(notifyRecipientCommand);
        notifyRecipient.setId(id);
        return notifyRecipientService.updateNotifyRecipient(notifyRecipient);
    }

    @GetMapping(value = "/notifyRecipients", params = {"pageNo", "pageSize"})
    public IPage<NotifyRecipientResponseVO> getNotifyRecipientPageList(Page<NotifyRecipient> page, NotifyRecipientQueryVO queryVO) {
        return notifyRecipientService.getNotifyRecipientPageList(page, queryVO);
    }

    @GetMapping("/list")
    public List<CommonLabelValueResponseVO> getNotifyRecipientList() {
        return notifyRecipientService.getNotifyRecipientList();
    }

    @DeleteMapping("/ids")
    public Boolean batchDeleteByIds(@RequestBody @NotEmpty(message = "ids不能为空") Set<Long> ids) {
        return notifyRecipientService.batchDeleteByIds(ids);
    }

    @PostMapping(value = "/import", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public void importScene(@RequestPart MultipartFile file) throws IOException {
        var notifyRecipientCommands = ImportUtils.parseList(file, NotifyRecipientCommand.class);
        var notifyRecipients = CollectionUtils.transformToList(notifyRecipientCommands, notifyRecipientMapper::convert);
        notifyRecipientService.importNotifyRecipient(notifyRecipients);
    }

    @PostMapping("/export")
    public ResponseEntity<String> exportGroup(@RequestBody ExportNotifyRecipientCommand exportNotifyRecipientCommand) {
        return ExportUtils.doExport(notifyRecipientService.exportNotifyRecipient(exportNotifyRecipientCommand));
    }
}
