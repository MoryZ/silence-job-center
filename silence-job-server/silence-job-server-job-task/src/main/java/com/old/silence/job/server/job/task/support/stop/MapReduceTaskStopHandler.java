package com.old.silence.job.server.job.task.support.stop;

import org.apache.pekko.actor.ActorRef;
import org.springframework.stereotype.Component;
import com.old.silence.platform.job.common.core.enums.JobTaskType;
import com.old.silence.platform.job.server.common.util.ClientInfoUtils;
import com.old.silence.platform.job.server.domain.model.JobTask;
import com.old.silence.platform.job.server.infrastructure.persistence.dao.JobTaskBatchDao;
import com.old.silence.platform.job.server.infrastructure.persistence.dao.JobTaskDao;
import com.old.silence.platform.job.server.job.task.dto.RealStopTaskInstanceDTO;
import com.old.silence.platform.job.server.job.task.support.JobTaskConverter;
import com.old.silence.platform.job.server.pekko.ActorGenerator;


@Component
public class MapReduceTaskStopHandler extends AbstractJobTaskStopHandler {

    protected MapReduceTaskStopHandler(JobTaskDao jobTaskDao, JobTaskBatchDao jobTaskBatchDao) {
        super(jobTaskDao, jobTaskBatchDao);
    }

    @Override
    public JobTaskType getTaskType() {
        return JobTaskType.MAP_REDUCE;
    }

    @Override
    protected void doStop(final TaskStopJobContext context) {
        for (final JobTask jobTask : context.getJobTasks()) {
            RealStopTaskInstanceDTO taskInstanceDTO = JobTaskConverter.INSTANCE.toRealStopTaskInstanceDTO(context);
            taskInstanceDTO.setClientId(ClientInfoUtils.clientId(jobTask.getClientInfo()));

            ActorRef actorRef = ActorGenerator.jobRealStopTaskInstanceActor();
            actorRef.tell(taskInstanceDTO, actorRef);
        }
    }


}
