package com.old.silence.job.common.model;




/**
 * 幂等id上下文
 *
 */


public class IdempotentIdContext {

    /**
     * 场景名称
     */
    private String scene;

    /**
     * 执行器名称
     */
    private String targetClassName;

    /**
     * 参数列表
     */
    private Object[] args;

    /**
     * 执行的方法名称
     */
    private String methodName;

    public IdempotentIdContext(String scene, String targetClassName, Object[] args, String methodName) {
        this.scene = scene;
        this.targetClassName = targetClassName;
        this.args = args;
        this.methodName = methodName;
    }

    public String getScene() {
        return scene;
    }

    public void setScene(String scene) {
        this.scene = scene;
    }

    public String getTargetClassName() {
        return targetClassName;
    }

    public void setTargetClassName(String targetClassName) {
        this.targetClassName = targetClassName;
    }

    public Object[] getArgs() {
        return args;
    }

    public void setArgs(Object[] args) {
        this.args = args;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }
}
