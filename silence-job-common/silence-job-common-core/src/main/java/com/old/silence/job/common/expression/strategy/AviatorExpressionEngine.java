package com.old.silence.job.common.expression.strategy;

import com.alibaba.fastjson2.JSON;
import com.googlecode.aviator.AviatorEvaluator;
import com.googlecode.aviator.AviatorEvaluatorInstance;
import com.old.silence.job.common.enums.ExpressionTypeEnum;
import com.old.silence.job.common.exception.SilenceJobCommonException;

import java.util.Map;

/**
 * Aviator 表达式
 *
 */
public class AviatorExpressionEngine extends AbstractExpressionEngine {

    private static final AviatorEvaluatorInstance ENGINE = AviatorEvaluator.getInstance();

    @Override
    protected Object doEval(String expression, Map<String, Object> context) {

        try {
            return ENGINE.execute(expression, context);
        } catch (Exception e) {
            throw new SilenceJobCommonException("Aviator表达式解析异常. expression:[{}] context:[{}]",
                    expression, JSON.toJSONString(context), e);
        }
    }

    @Override
    public ExpressionTypeEnum getExpressionType() {
        return ExpressionTypeEnum.AVIATOR;
    }
}
