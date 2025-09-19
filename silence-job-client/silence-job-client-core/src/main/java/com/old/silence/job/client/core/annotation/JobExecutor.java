
package com.old.silence.job.client.annotation;

import java.lang.annotation.*;

/**
 * job执行者
 *
 */
@Target({ElementType.METHOD, ElementType.TYPE, ElementType.ANNOTATION_TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
@Documented
public @interface JobExecutor {

    /**
     * 执行器名称
     */
    String name();

    /**
     * 执行器方法
     */
    String method() default "jobExecute";
}
