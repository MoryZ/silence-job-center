package com.old.silence.job.client.executor.builtin;


import com.alibaba.fastjson2.JSON;
import com.old.silence.job.client.annotation.JobExecutor;
import com.old.silence.job.client.dto.JobArgs;
import com.old.silence.job.client.model.ExecuteResult;
import org.springframework.stereotype.Component;

@Component
@JobExecutor(name = "silenceJobShellJobExecutor")
public class SilenceJobShellJobExecutor extends AbstractShellExecutor {

    public ExecuteResult jobExecute(JobArgs jobArgs) {
        Object jobParams = jobArgs.getJobParams();
        AbstractScriptExecutor.ScriptParams scriptParams = JSON.parseObject((String) jobParams, AbstractScriptExecutor.ScriptParams.class);
        return process(jobArgs.getJobId(), scriptParams);
    }

}
