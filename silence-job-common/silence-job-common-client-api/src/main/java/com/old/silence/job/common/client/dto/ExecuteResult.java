package com.old.silence.job.common.client.dto;

public class ExecuteResult {
    private int status;
    private Object result;
    private String message;

    public ExecuteResult() {
    }

    public ExecuteResult(int status, Object result, String message) {
        this.status = status;
        this.result = result;
        this.message = message;
    }

    public static ExecuteResult success(Object result) {
        return new ExecuteResult(200, result, "任务执行成功");
    }

    public static ExecuteResult success() {
        return success(null);
    }

    public static ExecuteResult failure() {
        return failure(null);
    }

    public static ExecuteResult failure(Object result) {
        return new ExecuteResult(500, result, "任务执行失败");
    }

    public static ExecuteResult failure(Object result, String message) {
        return new ExecuteResult(500, result, message);
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Object getResult() {
        return result;
    }

    public void setResult(Object result) {
        this.result = result;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
