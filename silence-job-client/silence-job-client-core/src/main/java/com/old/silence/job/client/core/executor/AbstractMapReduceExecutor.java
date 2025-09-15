package com.old.silence.job.client.core.executor;

import cn.hutool.core.lang.Assert;

import com.old.silence.platform.job.client.core.dto.JobArgs;
import com.old.silence.platform.job.client.core.dto.MergeReduceArgs;
import com.old.silence.platform.job.client.core.dto.ReduceArgs;
import com.old.silence.platform.job.client.model.ExecuteResult;
import com.old.silence.platform.job.common.core.enums.MapReduceStage;
import com.old.silence.platform.job.common.core.exception.SilenceJobMapReduceException;
import com.old.silence.platform.job.common.core.model.JobContext;


public abstract class AbstractMapReduceExecutor extends AbstractMapExecutor {

    @Override
    public ExecuteResult doJobExecute(final JobArgs jobArgs) {
        JobContext jobContext = JobContextManager.getJobContext();
        Assert.notNull(jobContext.getMrStage(), "请确认服务器当前定时任务的[任务类型]为MapReduce");
        if (jobContext.getMrStage().equals(MapReduceStage.MAP.getValue())) {
            return super.doJobExecute(jobArgs);
        } else if (jobContext.getMrStage().equals(MapReduceStage.REDUCE.getValue())) {
            ReduceArgs reduceArgs = (ReduceArgs) jobArgs;
            return this.doReduceExecute(reduceArgs);
        } else if (jobContext.getMrStage().equals(MapReduceStage.MERGE_REDUCE.getValue())) {
            MergeReduceArgs reduceArgs = (MergeReduceArgs) jobArgs;
            return this.doMergeReduceExecute(reduceArgs);
        }

        throw new SilenceJobMapReduceException("非法的MapReduceStage");
    }

    protected abstract ExecuteResult doReduceExecute(ReduceArgs reduceArgs);

    protected abstract ExecuteResult doMergeReduceExecute(MergeReduceArgs mergeReduceArgs);
}
