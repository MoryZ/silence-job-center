package com.old.silence.job.client.retry.core;

import com.old.silence.platform.job.client.core.retryer.RetryerInfo;

import java.util.List;


public interface Scanner {

    List<RetryerInfo> doScan();
}
