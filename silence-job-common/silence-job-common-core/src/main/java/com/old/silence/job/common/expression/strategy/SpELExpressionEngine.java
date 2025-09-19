package com.old.silence.job.common.expression.strategy;

import org.springframework.expression.EvaluationContext;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.SimpleEvaluationContext;
import com.alibaba.fastjson2.JSON;
import com.old.silence.job.common.enums.ExpressionTypeEnum;
import com.old.silence.job.common.exception.SilenceJobCommonException;

import java.util.Map;

/**
 * Spel表达式解析引擎
 *
 */
public class SpELExpressionEngine extends AbstractExpressionEngine {

    private static final ExpressionParser ENGINE = new SpelExpressionParser();

    @Override
    protected Object doEval(String expression, Map<String, Object> context) {

        try {
            final EvaluationContext evaluationContext = SimpleEvaluationContext.forReadOnlyDataBinding().build();
            context.forEach(evaluationContext::setVariable);
            return ENGINE.parseExpression(expression).getValue(evaluationContext, Object.class);
        } catch (Exception e) {
            throw new SilenceJobCommonException("SpEL表达式解析异常. expression:[{}] context:[{}]",
                    expression, JSON.toJSONString(context), e);
        }

    }

    @Override
    public ExpressionTypeEnum getExpressionType() {
        return ExpressionTypeEnum.SPEL;
    }
}
