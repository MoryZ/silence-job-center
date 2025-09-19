package com.old.silence.job.client.register.scan;

import com.old.silence.util.CollectionUtils;
import com.old.silence.job.client.IJobExecutor;
import com.old.silence.job.client.Scanner;
import com.old.silence.job.client.annotation.JobExecutor;
import com.old.silence.job.client.annotation.MapExecutor;
import com.old.silence.job.client.annotation.MergeReduceExecutor;
import com.old.silence.job.client.annotation.ReduceExecutor;
import com.old.silence.job.client.cache.JobExecutorInfoCache;
import com.old.silence.job.client.dto.JobArgs;
import com.old.silence.job.client.dto.JobExecutorInfo;
import com.old.silence.job.client.dto.MapArgs;
import com.old.silence.job.client.dto.MergeReduceArgs;
import com.old.silence.job.client.dto.ReduceArgs;
import com.old.silence.job.client.dto.ShardingJobArgs;
import com.old.silence.job.log.SilenceJobLog;


import org.springframework.aop.framework.AopProxyUtils;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.MethodIntrospector;
import org.springframework.annotation.AnnotatedElementUtils;
import org.springframework.stereotype.Component;
import org.springframework.util.ReflectionUtils;

import java.lang.reflect.Method;
import java.util.*;


@Component

public class JobExecutorScanner implements Scanner, ApplicationContextAware {

    public ApplicationContext applicationContext;

    @Override
    public List<JobExecutorInfo> doScan() {
        return scanJobExecutor();
    }

    private List<JobExecutorInfo> scanJobExecutor() {

        List<JobExecutorInfo> jobExecutorInfoList = new ArrayList<>();
        String[] beanDefinitionNames = applicationContext.getBeanNamesForType(Object.class, false, true);
        for (String beanDefinitionName : beanDefinitionNames) {
            Object bean = applicationContext.getBean(beanDefinitionName);

            Map<Method, JobExecutor> annotatedMethods = null;
            try {
                annotatedMethods = MethodIntrospector.selectMethods(bean.getClass(),
                        (MethodIntrospector.MetadataLookup<JobExecutor>) method -> AnnotatedElementUtils
                                .findMergedAnnotation(method, JobExecutor.class));
            } catch (Throwable ex) {
                SilenceJobLog.LOCAL.error("{} JobExecutor加载异常：{}", beanDefinitionName, ex);
            }

            Class executorNotProxy = AopProxyUtils.ultimateTargetClass(bean);
            String executorClassName = executorNotProxy.getName();

            // 通过实现接口进行注册
            if (IJobExecutor.class.isAssignableFrom(bean.getClass())) {
                if (!JobExecutorInfoCache.isExisted(executorClassName)) {
                    jobExecutorInfoList.add(new JobExecutorInfo(executorClassName,
                            ReflectionUtils.findMethod(bean.getClass(), "jobExecute"),
                            null, null, null, bean));
                }
            }

            // 扫描类的注解
            JobExecutor jobExecutor = bean.getClass().getAnnotation(JobExecutor.class);
            if (Objects.nonNull(jobExecutor)) {
                String executorName = jobExecutor.name();
                if (!JobExecutorInfoCache.isExisted(executorName)) {
                    List<Class<? extends JobArgs>> classes = List.of(ShardingJobArgs.class, JobArgs.class);
                    Method method = null;
                    for (Class<? extends JobArgs> clazz : classes) {
                        method = ReflectionUtils.findMethod(bean.getClass(), jobExecutor.method(), clazz);
                        if (Objects.nonNull(method)) {
                            break;
                        }
                    }

                    if (method == null) {
                        method = ReflectionUtils.findMethod(bean.getClass(), jobExecutor.method());
                    }

                    // 扫描MapExecutor、ReduceExecutor、MergeReduceExecutor注解
                    Map<String, Method> mapExecutorMethodMap = new HashMap<>();
                    Method reduceExecutor = null;
                    Method mergeReduceExecutor = null;
                    Method[] methods = bean.getClass().getMethods();
                    for (final Method method1 : methods) {
                        Class<?>[] parameterTypes = method1.getParameterTypes();
                        MapExecutor mapExecutor = method1.getAnnotation(MapExecutor.class);
                        if (Objects.nonNull(mapExecutor)
                                && parameterTypes.length > 0
                                && parameterTypes[0].isAssignableFrom(MapArgs.class)) {
                            mapExecutorMethodMap.put(mapExecutor.taskName(), method1);
                        }

                        ReduceExecutor reduceExecutorAnno = method1.getAnnotation(ReduceExecutor.class);
                        if (Objects.nonNull(reduceExecutorAnno)
                                && parameterTypes.length > 0
                                && parameterTypes[0].isAssignableFrom(ReduceArgs.class)) {
                            reduceExecutor = method1;
                            continue;
                        }

                        MergeReduceExecutor mergeReduceExecutorAnno = method1.getAnnotation(MergeReduceExecutor.class);
                        if (Objects.nonNull(mergeReduceExecutorAnno)
                                && parameterTypes.length > 0
                                && parameterTypes[0].isAssignableFrom(MergeReduceArgs.class)) {
                            mergeReduceExecutor = method1;
                        }
                    }

                    JobExecutorInfo jobExecutorInfo =
                            new JobExecutorInfo(
                                    executorName,
                                    method,
                                    mapExecutorMethodMap,
                                    reduceExecutor,
                                    mergeReduceExecutor,
                                    bean
                            );
                    jobExecutorInfoList.add(jobExecutorInfo);
                }

            }

            if (CollectionUtils.isEmpty(annotatedMethods)) {
                continue;
            }

            // 扫描方法上的注解
            for (Map.Entry<Method, JobExecutor> methodEntry : annotatedMethods.entrySet()) {
                Method executeMethod = methodEntry.getKey();
                jobExecutor = methodEntry.getValue();
                if (JobExecutorInfoCache.isExisted(jobExecutor.name())) {
                    continue;
                }

                JobExecutorInfo jobExecutorInfo =
                        new JobExecutorInfo(
                                jobExecutor.name(),
                                executeMethod,
                                null, null, null,
                                bean
                        );
                jobExecutorInfoList.add(jobExecutorInfo);
            }
        }

        return jobExecutorInfoList;
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }
}
