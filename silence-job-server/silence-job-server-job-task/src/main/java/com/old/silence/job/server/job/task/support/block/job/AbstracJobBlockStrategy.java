package com.old.silence.job.server.job.task.support.block.job;

import org.springframework.beans.factory.InitializingBean;
import com.old.silence.platform.job.common.core.enums.JobBlockStrategy;
import com.old.silence.platform.job.server.job.task.support.BlockStrategy;


public abstract class AbstracJobBlockStrategy implements BlockStrategy, InitializingBean {

    @Override
    public void block(final BlockStrategyContext context) {
        doBlock(context);
    }

    protected abstract void doBlock(final BlockStrategyContext context);


    protected abstract JobBlockStrategy blockStrategyEnum();

    @Override
    public void afterPropertiesSet() throws Exception {
        JobBlockStrategyFactory.registerBlockStrategy(blockStrategyEnum(), this);
    }
}
