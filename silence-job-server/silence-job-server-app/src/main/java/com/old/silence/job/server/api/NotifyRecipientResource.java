package com.old.silence.job.server.api;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.old.silence.job.server.domain.model.NotifyRecipient;
import com.old.silence.job.server.dto.ExportNotifyRecipientVO;
import com.old.silence.job.server.dto.NotifyRecipientQueryVO;
import com.old.silence.job.server.dto.NotifyRecipientRequestVO;
import com.old.silence.job.server.vo.CommonLabelValueResponseVO;
import com.old.silence.job.server.vo.NotifyRecipientResponseVO;
import com.old.silence.job.server.web.domain.service.NotifyRecipientService;
import com.old.silence.job.server.web.util.ExportUtils;
import com.old.silence.job.server.web.util.ImportUtils;

import javax.validation.constraints.NotEmpty;
import java.io.IOException;
import java.util.List;
import java.util.Set;

/**
 * <p>
 * 告警通知接收人 前端控制器
 * </p>
 *
 */
@RestController
@RequestMapping("/notify-recipient")
public class NotifyRecipientResource {
    private final NotifyRecipientService notifyRecipientService;

    public NotifyRecipientResource(NotifyRecipientService notifyRecipientService) {
        this.notifyRecipientService = notifyRecipientService;
    }

    @PostMapping
    public Boolean saveNotifyRecipient(@RequestBody @Validated NotifyRecipientRequestVO requestVO) {
        return notifyRecipientService.saveNotifyRecipient(requestVO);
    }

    @PutMapping
    public Boolean updateNotifyRecipient(@RequestBody @Validated NotifyRecipientRequestVO requestVO) {
        return notifyRecipientService.updateNotifyRecipient(requestVO);
    }

    @GetMapping("/page/list")
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
    public void importScene(@RequestPart("file") MultipartFile file) throws IOException {
        notifyRecipientService.importNotifyRecipient(ImportUtils.parseList(file, NotifyRecipientRequestVO.class));
    }

    @PostMapping("/export")
    public ResponseEntity<String> exportGroup(@RequestBody ExportNotifyRecipientVO exportNotifyRecipientVO) {
        return ExportUtils.doExport(notifyRecipientService.exportNotifyRecipient(exportNotifyRecipientVO));
    }
}
