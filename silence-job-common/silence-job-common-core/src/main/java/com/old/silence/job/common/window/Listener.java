package com.old.silence.job.common.window;

import java.util.List;

/**
 * 滑动窗口监听器
 *
 */
public interface Listener<T> {

    /**
     * 数据监听器处理器
     *
     * @param list 到达窗口期的数据
     */
    void handler(List<T> list);
}
