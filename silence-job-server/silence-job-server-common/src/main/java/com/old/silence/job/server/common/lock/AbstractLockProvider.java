package com.old.silence.job.server.common.lock;

import cn.hutool.core.lang.Assert;
import com.old.silence.job.server.common.cache.CacheLockRecord;
import com.old.silence.job.server.common.dto.LockConfig;
import com.old.silence.job.server.exception.SilenceJobServerException;

import java.time.Duration;
import java.time.Instant;


public abstract class AbstractLockProvider implements LockProvider {

    @Override
    public boolean lock(Duration lockAtMost) {
        return lock(lockAtMost, lockAtMost);
    }

    @Override
    public boolean lock(Duration lockAtLeast, Duration lockAtMost) {
        LockConfig lockConfig = LockManager.getLockConfig();
        String lockName = lockConfig.getLockName();

        Assert.notNull(lockAtMost,
                () -> new SilenceJobServerException("lockAtMost can not be null. lockName:[{}]", lockName));
        Assert.isFalse(lockAtMost.isNegative(),
                () -> new SilenceJobServerException("lockAtMost  is negative. lockName:[{}]", lockName));
        Assert.notNull(lockAtLeast,
                () -> new SilenceJobServerException("lockAtLeast can not be null. lockName:[{}]", lockName));
        Assert.isFalse(lockAtLeast.compareTo(lockAtMost) > 0,
                () -> new SilenceJobServerException("lockAtLeast is longer than lockAtMost for lock. lockName:[{}]",
                        lockName));

        LockManager.setcreatedDate(Instant.now());
        LockManager.setLockAtLeast(lockAtLeast);
        LockManager.setLockAtMost(lockAtMost);

        boolean tryToCreateLockRecord = !CacheLockRecord.lockRecordRecentlyCreated(lockName);
        if (tryToCreateLockRecord) {
            if (doLock(lockConfig)) {
                CacheLockRecord.addLockRecord(lockName);
                return true;
            }
        }

        return doLockAfter(lockConfig);
    }

    protected abstract boolean doLockAfter(LockConfig lockConfig);

    protected boolean doLock(final LockConfig lockConfig) {
        return createLock(lockConfig);
    }

    @Override
    public void unlock() {
        try {
            LockConfig lockConfig = LockManager.getLockConfig();
            Assert.notNull(lockConfig, () -> new SilenceJobServerException("lockConfig can not be null."));
            doUnlock(lockConfig);
        } finally {
            LockManager.clear();
        }

    }

    protected abstract void doUnlock(LockConfig lockConfig);

    protected abstract boolean createLock(final LockConfig lockConfig);

    protected abstract boolean renewal(final LockConfig lockConfig);
}
