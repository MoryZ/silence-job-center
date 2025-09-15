package com.old.silence.job.common.model;


/**
 * @author moryzang
 */
public class ApiResult<T> {

    protected int code = 200;

    protected String message;

    protected T data;

    public ApiResult() {
    }

    public ApiResult(int code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public ApiResult(T data) {
        this.data = data;
    }

    public ApiResult(String message, T data) {
        this.data = data;
        this.message = message;
    }

    public ApiResult(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public static <T> ApiResult<T> success() {
        return success(null);
    }

    public static <T> ApiResult<T> success(T data) {
        ApiResult<T> apiResult = new ApiResult<>();
        apiResult.setCode(200);
        apiResult.setData(data);
        return apiResult;
    }

    public static <T> ApiResult<T> error(String message) {
        ApiResult<T> apiResult = new ApiResult<>();
        apiResult.setCode(500);
        apiResult.setMessage(message);
        return apiResult;
    }

    public static <T> ApiResult<T> error(int code, String message) {
        ApiResult<T> apiResult = new ApiResult<>();
        apiResult.setCode(code);
        apiResult.setMessage(message);
        return apiResult;
    }


    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
