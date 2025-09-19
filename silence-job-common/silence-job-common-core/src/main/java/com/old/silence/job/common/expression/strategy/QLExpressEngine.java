package com.old.silence.job.common.expression.strategy;

import com.alibaba.fastjson2.JSON;
import com.old.silence.job.common.enums.ExpressionTypeEnum;
import com.old.silence.job.common.exception.SilenceJobCommonException;
import com.ql.util.express.DefaultContext;
import com.ql.util.express.ExpressRunner;

import java.util.Map;

/**
 * QL表达式解析器
 *
 */
public class QLExpressEngine extends AbstractExpressionEngine {

    private static final ExpressRunner ENGINE = new ExpressRunner();

    @Override
    protected Object doEval(String expression, Map<String, Object> context) {

        final DefaultContext<String, Object> defaultContext = new DefaultContext<>();
        defaultContext.putAll(context);
        try {
            return ENGINE.execute(expression, defaultContext, null, true, false);
        } catch (Exception e) {
            throw new SilenceJobCommonException("QL表达式解析异常. expression:[{}] context:[{}]",
                    expression, JSON.toJSONString(context), e);
        }

    }

    @Override
    public ExpressionTypeEnum getExpressionType() {
        return ExpressionTypeEnum.QL;
    }
}
