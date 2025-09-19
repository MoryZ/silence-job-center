package com.old.silence.job.client.handler.trigger;


import com.old.silence.job.client.handler.trigger.TriggerJobHandler;

import java.math.BigInteger;

public class ShardingTriggerHandler extends TriggerJobHandler<ShardingTriggerHandler> {

    public ShardingTriggerHandler(BigInteger triggerJobId) {
        super(triggerJobId);
    }

    @Override
    public ShardingTriggerHandler addShardingArgs(String... shardingValue) {
        return super.addShardingArgs(shardingValue);
    }
}
