package com.old.silence.job.client.core.log;

import com.old.silence.platform.job.client.common.log.AbstractLogReport;
import com.old.silence.platform.job.client.common.log.SilenceJobLogManager;
import com.old.silence.platform.job.log.center.dto.LogContentDTO;
import com.old.silence.platform.job.log.center.enums.LogTypeEnum;
import com.old.silence.platform.job.server.model.dto.JobLogTaskDTO;
import org.springframework.stereotype.Component;


@Component
public class JobLogReport extends AbstractLogReport<JobLogTaskDTO> {

    @Override
    public boolean supports() {
        return LogTypeEnum.JOB == SilenceJobLogManager.getLogType();
    }

    @Override
    protected JobLogTaskDTO buildLogTaskDTO(LogContentDTO logContentDTO) {
        JobLogMeta context = (JobLogMeta) SilenceJobLogManager.getLogMeta();
        JobLogTaskDTO logTaskDTO = new JobLogTaskDTO();
        logTaskDTO.setJobId(context.getJobId());
        logTaskDTO.setLogType(LogTypeEnum.JOB.name());
        logTaskDTO.setTaskId(context.getTaskId());
        logTaskDTO.setTaskBatchId(context.getTaskBatchId());
        logTaskDTO.setRealTime(logContentDTO.getTimeStamp());
        logTaskDTO.setNamespaceId(context.getNamespaceId());
        logTaskDTO.setGroupName(context.getGroupName());
        logTaskDTO.setFieldList(logContentDTO.getFieldList());
        return logTaskDTO;
    }
}
