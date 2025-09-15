package com.old.silence.job.server.common.lock.persistence;

import com.old.silence.job.server.exception.SilenceJobServerException;

import java.util.ArrayList;
import java.util.List;


public final class LockStorageFactory {

    private static final List<LockStorage> LOCK_STORAGES = new ArrayList<>();

    public static void registerLockStorage(LockStorage lockStorage) {
        LOCK_STORAGES.add(lockStorage);
    }

    public static LockStorage getLockStorage() {
        return LOCK_STORAGES.stream()
                .findFirst().orElseThrow(() -> new SilenceJobServerException("未找到合适锁处理器"));
    }

}
