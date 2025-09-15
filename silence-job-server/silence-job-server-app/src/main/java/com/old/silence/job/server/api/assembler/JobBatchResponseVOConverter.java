package com.old.silence.job.server.api.assembler;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;
import com.old.silence.job.server.domain.model.Job;
import com.old.silence.job.server.domain.model.JobTaskBatch;
import com.old.silence.job.server.vo.JobBatchResponseDO;
import com.old.silence.job.server.vo.JobBatchResponseVO;

import java.time.Instant;
import java.util.List;
import java.util.Objects;


@Mapper
public interface JobBatchResponseVOConverter {

    JobBatchResponseVOConverter INSTANCE = Mappers.getMapper(JobBatchResponseVOConverter.class);

    List<JobBatchResponseVO> convertList(List<JobBatchResponseDO> jobBatches);

    @Mapping(target = "executionAt", expression = "java(toLocalDateTime(jobBatchResponseDO.getExecutionAt()))")
    JobBatchResponseVO convert(JobBatchResponseDO jobBatchResponseDO);

    List<JobBatchResponseVO> convertListToJobBatchList(List<JobTaskBatch> jobTaskBatchList);

    @Mapping(target = "executionAt", expression = "java(toLocalDateTime(jobTaskBatch.getExecutionAt()))")
    JobBatchResponseVO convert(JobTaskBatch jobTaskBatch);

    @Mapping(source = "jobBatch.groupName", target = "groupName")
    @Mapping(source = "jobBatch.id", target = "id")
   
    @Mapping(target = "executionAt", expression = "java(toLocalDateTime(jobBatch.getExecutionAt()))")
    @Mapping(source = "jobBatch.createdDate", target="createdDate")
    @Mapping(source = "jobBatch.updatedDate", target="updatedDate")
    JobBatchResponseVO convert(JobTaskBatch jobBatch, Job job);

    default Instant toLocalDateTime(Long nextTriggerAt) {
        if (Objects.isNull(nextTriggerAt) || nextTriggerAt == 0) {
            return null;
        }

        return Instant.ofEpochMilli(nextTriggerAt);
    }

}
