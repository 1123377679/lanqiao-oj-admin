package com.lanqiao.lanqiaooj.judge.codesandbox.model;

import com.lanqiao.lanqiaooj.judge.codesandbox.strategy.DefaultJudgeStrategy;
import com.lanqiao.lanqiaooj.judge.codesandbox.strategy.JavaJudgeStrategy;
import com.lanqiao.lanqiaooj.judge.codesandbox.strategy.JudgeStrategy;
import com.lanqiao.lanqiaooj.model.dto.questionSubmit.JudgeInfo;
import com.lanqiao.lanqiaooj.model.entity.QuestionSubmit;
import org.springframework.stereotype.Service;

/**
 * @ Author: 李某人
 * @ Date: 2024/12/09/22:06
 * @ Description: 判题管理的简单调用
 */
@Service
public class JudgeManager {

    public JudgeInfo doJudge(JudgeContext judgeContext){
        QuestionSubmit questionSubmit = judgeContext.getQuestionSubmit();
        String language = questionSubmit.getLanguage();
        JudgeStrategy judgeStrategy = new DefaultJudgeStrategy();
        if (language.equals("java")){
            judgeStrategy = new JavaJudgeStrategy();
        }
        return judgeStrategy.doJudge(judgeContext);
    }
}
