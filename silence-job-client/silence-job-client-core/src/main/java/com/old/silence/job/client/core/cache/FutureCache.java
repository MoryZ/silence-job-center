package com.old.silence.job.client.cache;

import com.old.silence.job.client.model.ExecuteResult;
import com.google.common.util.concurrent.ListenableFuture;

import java.math.BigInteger;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

public class FutureCache {

    private static final ConcurrentHashMap<BigInteger, ListenableFuture<ExecuteResult>> futureCache = new ConcurrentHashMap<>();

    public static void addFuture(BigInteger taskBatchId, ListenableFuture<ExecuteResult> future) {
        futureCache.put(taskBatchId, future);
    }

    public static void remove(BigInteger taskBatchId) {
        Optional.ofNullable(futureCache.get(taskBatchId)).ifPresent(future -> {
            future.cancel(true);
            futureCache.remove(taskBatchId);
        });

    }

}
