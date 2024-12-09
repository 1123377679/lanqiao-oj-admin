package com.lanqiao.lanqiaooj.judge.codesandbox.impl;

import com.lanqiao.lanqiaooj.judge.codesandbox.CodeSandbox;
import com.lanqiao.lanqiaooj.judge.codesandbox.model.ExecuteCodeRequest;
import com.lanqiao.lanqiaooj.judge.codesandbox.model.ExecuteCodeResponse;
import com.lanqiao.lanqiaooj.model.dto.questionSubmit.JudgeInfo;
import com.lanqiao.lanqiaooj.model.enums.JudgeInfoMessageEnum;
import com.lanqiao.lanqiaooj.model.enums.QuestionSubmitStatusEnum;

import java.util.List;

/**
 * @ Author: 李某人
 * @ Date: 2024/11/30/13:38
 * @ Description: 实例代码沙箱(仅仅是用来跑通程序的)
 */
public class ExampleCodeSandbox implements CodeSandbox {
    @Override
    public ExecuteCodeResponse executeCode(ExecuteCodeRequest executeCodeRequest) {
        //输入用例
        List<String> inputList = executeCodeRequest.getInputList();
        //创建响应对象
        ExecuteCodeResponse executeCodeResponse = new ExecuteCodeResponse();
        executeCodeResponse.setOutputList(inputList);
        executeCodeResponse.setMessage("测试执行成功");
        executeCodeResponse.setStatus(QuestionSubmitStatusEnum.SUCCEED.getValue());
        JudgeInfo judgeInfo = new JudgeInfo();
        judgeInfo.setMessage(JudgeInfoMessageEnum.ACCEPTED.getText());
        judgeInfo.setMemory(100L);
        judgeInfo.setTime(100L);
        executeCodeResponse.setJudgeInfo(judgeInfo);
        return executeCodeResponse;
    }
}
