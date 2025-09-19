package com.old.silence.job.common.expression.strategy;

import com.old.silence.job.common.expression.ExpressionEngine;

import java.util.Map;


public abstract class AbstractExpressionEngine implements ExpressionEngine {
    @Override
    public Object eval(String expression, Object... t) {

        return doEval(expression, (Map<String, Object>) t[0]);
    }

    protected abstract Object doEval(String expression, Map<String, Object> context);
}
