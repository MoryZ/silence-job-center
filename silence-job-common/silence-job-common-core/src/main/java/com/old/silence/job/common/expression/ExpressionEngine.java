package com.old.silence.job.common.expression;

import com.old.silence.job.common.enums.ExpressionTypeEnum;

/**
 * 参数表达式解析引擎
 *
 */
public interface ExpressionEngine {

    /**
     * 执行表达式
     *
     * @param expression 表达式
     * @param t          参数信息
     * @return 执行结果
     */
    Object eval(String expression, Object... t);

    ExpressionTypeEnum getExpressionType();
}
