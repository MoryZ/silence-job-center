package com.old.silence.job.common.expression;

import com.old.silence.job.common.enums.ExpressionTypeEnum;
import com.old.silence.job.common.exception.SilenceJobCommonException;
import com.old.silence.job.common.expression.strategy.AviatorExpressionEngine;
import com.old.silence.job.common.expression.strategy.QLExpressEngine;
import com.old.silence.job.common.expression.strategy.SpELExpressionEngine;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import java.util.Map;


public class ExpressionFactory {

    private static final Map<ExpressionTypeEnum, ExpressionEngine> expressionMap = Map.of(
            ExpressionTypeEnum.SPEL, new SpELExpressionEngine(),
            ExpressionTypeEnum.AVIATOR, new AviatorExpressionEngine(),
            ExpressionTypeEnum.QL, new QLExpressEngine()

    );

    /**
     * 返回一个代理对象
     *
     * @param invocationHandler 表达式执行的代理对象
     * @return 返回一个代理对象
     */
    public static ExpressionEngine getExpressionEngine(InvocationHandler invocationHandler) {

        try {
            return (ExpressionEngine) Proxy.newProxyInstance(ExpressionEngine.class.getClassLoader(),
                    new Class[]{ExpressionEngine.class}, invocationHandler);
        } catch (Exception e) {
            throw new SilenceJobCommonException("class not found exception to: [{}]", e);

        }
    }

    public static ExpressionEngine getExpressionEngineByType(ExpressionTypeEnum expressionType) {
        return expressionMap.get(expressionType);
    }
}
