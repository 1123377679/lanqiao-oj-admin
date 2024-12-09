package com.lanqiao.lanqiaooj.judge.codesandbox.strategy;

import com.lanqiao.lanqiaooj.judge.codesandbox.model.JudgeContext;
import com.lanqiao.lanqiaooj.model.dto.questionSubmit.JudgeInfo;

/**
 * @ Author: 李某人
 * @ Date: 2024/12/09/21:45
 * @ Description: 
 */
public interface JudgeStrategy {
    /**
     * 执行判题的方法
     * 上下文的概念
     */
    JudgeInfo doJudge(JudgeContext judgeContext);
}
