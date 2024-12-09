package com.lanqiao.lanqiaooj.judge.codesandbox.strategy;

import cn.hutool.json.JSONUtil;
import com.lanqiao.lanqiaooj.judge.codesandbox.model.JudgeContext;
import com.lanqiao.lanqiaooj.model.dto.question.JudgeCase;
import com.lanqiao.lanqiaooj.model.dto.question.JudgeConfig;
import com.lanqiao.lanqiaooj.model.dto.questionSubmit.JudgeInfo;
import com.lanqiao.lanqiaooj.model.entity.Question;
import com.lanqiao.lanqiaooj.model.enums.JudgeInfoMessageEnum;

import java.util.List;

/**
 * @ Author: 李某人
 * @ Date: 2024/12/09/21:47
 * @ Description:
 * 如果选择某种判题策略的过程比较复杂，都写在调用判题服务的代码中，代码会越来越复杂。会有很多if...else 那，我们可以考虑单独写一个判题策略的类
 */
public class DefaultJudgeStrategy implements JudgeStrategy{
    @Override
    public JudgeInfo doJudge(JudgeContext judgeContext) {
        JudgeInfo judgeInfo = judgeContext.getJudgeInfo();
        //执行完之后的时间
        Long memory = judgeInfo.getMemory();
        Long time = judgeInfo.getTime();
        List<String> inputList = judgeContext.getInputList();
        List<String> outputList = judgeContext.getOutputList();
        List<JudgeCase> judgeCaseList = judgeContext.getJudgeCaseList();
        Question question = judgeContext.getQuestion();
        JudgeInfo judgeInfoResponse = new JudgeInfo();
        judgeInfoResponse.setMemory(memory);
        judgeInfoResponse.setTime(time);
        JudgeInfoMessageEnum judgeInfoMessageEnum = JudgeInfoMessageEnum.ACCEPTED;
        if (outputList.size()!=inputList.size()){
            judgeInfoMessageEnum = JudgeInfoMessageEnum.WRONG_ANSWER;
            judgeInfoResponse.setMessage(judgeInfoMessageEnum.getValue());
            return judgeInfoResponse;
        }
        for (int i = 0 ; i<judgeCaseList.size();i++){
            JudgeCase judgeCase = judgeCaseList.get(i);
            if (!judgeCase.getOutput().equals(outputList.get(i))){
                judgeInfoMessageEnum = JudgeInfoMessageEnum.WRONG_ANSWER;
                judgeInfoResponse.setMessage(judgeInfoMessageEnum.getValue());
                return judgeInfoResponse;
            }
        }
        String judgeConfigStr = question.getJudgeConfig();
        JudgeConfig judgeConfig = JSONUtil.toBean(judgeConfigStr, JudgeConfig.class);
        //题目要求的时间
        Long timeLimit = judgeConfig.getTimeLimit();
        Long memoryLimit = judgeConfig.getMemoryLimit();
        if(memory > memoryLimit){
            judgeInfoMessageEnum = JudgeInfoMessageEnum.MEMORY_LIMIT_EXCEEDED;
            judgeInfoResponse.setMessage(judgeInfoMessageEnum.getValue());
            return judgeInfoResponse;
        }
        if(time > timeLimit){
            judgeInfoMessageEnum = JudgeInfoMessageEnum.TIME_LIMIT_EXCEEDED;
            judgeInfoResponse.setMessage(judgeInfoMessageEnum.getValue());
            return judgeInfoResponse;
        }
        judgeInfoResponse.setMessage(judgeInfoMessageEnum.getValue());
        return judgeInfoResponse;
    }
}
