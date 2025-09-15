package com.old.silence.job.client.retry.core;

import com.old.silence.platform.job.client.core.intercepter.ThreadLockRetrySiteSnapshotContext;

/**
 * 重试现场记录上下文
 * 默认实现see: {@link ThreadLockRetrySiteSnapshotContext}
 *
 */
public interface RetrySiteSnapshotContext<T> {

    void set(T value);

    void remove();

    T get();
}
