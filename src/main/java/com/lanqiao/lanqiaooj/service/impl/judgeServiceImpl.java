package com.lanqiao.lanqiaooj.service.impl;

import cn.hutool.json.JSONUtil;
import com.lanqiao.lanqiaooj.common.ErrorCode;
import com.lanqiao.lanqiaooj.exception.BusinessException;
import com.lanqiao.lanqiaooj.judge.codesandbox.CodeSandbox;
import com.lanqiao.lanqiaooj.judge.codesandbox.CodeSandboxFactory;
import com.lanqiao.lanqiaooj.judge.codesandbox.CodeSandboxProxy;
import com.lanqiao.lanqiaooj.judge.codesandbox.model.ExecuteCodeRequest;
import com.lanqiao.lanqiaooj.judge.codesandbox.model.ExecuteCodeResponse;
import com.lanqiao.lanqiaooj.judge.codesandbox.model.JudgeContext;
import com.lanqiao.lanqiaooj.judge.codesandbox.model.JudgeManager;
import com.lanqiao.lanqiaooj.judge.codesandbox.strategy.DefaultJudgeStrategy;
import com.lanqiao.lanqiaooj.judge.codesandbox.strategy.JudgeStrategy;
import com.lanqiao.lanqiaooj.model.dto.question.JudgeCase;
import com.lanqiao.lanqiaooj.model.dto.question.JudgeConfig;
import com.lanqiao.lanqiaooj.model.dto.questionSubmit.JudgeInfo;
import com.lanqiao.lanqiaooj.model.entity.Question;
import com.lanqiao.lanqiaooj.model.entity.QuestionSubmit;
import com.lanqiao.lanqiaooj.model.enums.JudgeInfoMessageEnum;
import com.lanqiao.lanqiaooj.model.enums.QuestionSubmitLanguageEnum;
import com.lanqiao.lanqiaooj.model.enums.QuestionSubmitStatusEnum;
import com.lanqiao.lanqiaooj.model.vo.QuestionSubmitVO;
import com.lanqiao.lanqiaooj.service.JudgeService;
import com.lanqiao.lanqiaooj.service.QuestionService;
import com.lanqiao.lanqiaooj.service.QuestionSubmitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @ Author: 李某人
 * @ Date: 2024/12/03/14:36
 * @ Description:
 */
@Service
public class judgeServiceImpl implements JudgeService {
    @Resource
    private QuestionService questionService;

    @Resource
    private QuestionSubmitService questionSubmitService;

    @Resource
    private JudgeManager judgeManager;

    @Value("${codesandbox.type:example}")
    private String type;


    @Override
    public QuestionSubmit doJudge(long questionSubmitId) {
        //1.传入题目的提交id，获取到对应的题目，提交信息(代码，编程语言等)
        QuestionSubmit questionSubmit = questionSubmitService.getById(questionSubmitId);
        if (questionSubmit == null) {
            throw new BusinessException(ErrorCode.NOT_FOUND_ERROR,"提交信息不存在");
        }
        Long questionId = questionSubmit.getQuestionId();
        Question question = questionService.getById(questionId);
        if(question==null){
            throw new BusinessException(ErrorCode.NOT_FOUND_ERROR,"题目不存在");
        }
        //判断题目是否在等待中，如果不是在等待就说明在判题
        if (!questionSubmit.getStatus().equals(QuestionSubmitStatusEnum.WAITING.getValue())){
            throw new BusinessException(ErrorCode.OPERATION_ERROR,"题目正在判题中");
        }
        //将题目的状态设置成判题中 防止重复提交
        QuestionSubmit questionSubmitUpdate = new QuestionSubmit();
        questionSubmitUpdate.setId(questionSubmitId);
        questionSubmitUpdate.setStatus(QuestionSubmitStatusEnum.RUNNING.getValue());
        //通过数据库进行修改
        boolean update = questionSubmitService.updateById(questionSubmitUpdate);
        //判断当前代码是否修改成功
        if (!update){
            throw new BusinessException(ErrorCode.SYSTEM_ERROR,"题目状态更新错误");
        }
        //调用代码沙箱
        CodeSandbox codeSandbox = CodeSandboxFactory.newInstance(type);
        codeSandbox = new CodeSandboxProxy(codeSandbox);
        //接收前端的参数
        //模拟一些数据
        String code = questionSubmit.getCode();
        String language = questionSubmit.getLanguage();
        String judgeCaseStr = question.getJudgeCase();
        List<JudgeCase> judgeCaseList = JSONUtil.toList(judgeCaseStr, JudgeCase.class);
        List<String> inputList = judgeCaseList.stream().map(JudgeCase::getInput).collect(Collectors.toList());
        ExecuteCodeRequest executeCodeRequest = ExecuteCodeRequest.builder()
                .code(code)
                .language(language)
                .inputList(inputList)
                .build();
        //执行代码沙箱
        ExecuteCodeResponse executeCodeResponse = codeSandbox.executeCode(executeCodeRequest);
        //根据沙箱的执行结果，设置题目的判题状态和信息
        //输出用例要跟输入用例
        List<String> outputList = executeCodeResponse.getOutputList();
        JudgeContext judgeContext = new JudgeContext();
        judgeContext.setJudgeInfo(executeCodeResponse.getJudgeInfo());
        judgeContext.setInputList(inputList);
        judgeContext.setOutputList(outputList);
        judgeContext.setJudgeCaseList(judgeCaseList);
        judgeContext.setQuestion(question);
        judgeContext.setQuestionSubmit(questionSubmit);
        //换成judgeManager
        JudgeInfo judgeInfo = judgeManager.doJudge(judgeContext);
        //将题目的状态设置成判题中 防止重复提交
        questionSubmitUpdate = new QuestionSubmit();
        questionSubmitUpdate.setId(questionSubmitId);
        questionSubmitUpdate.setStatus(QuestionSubmitStatusEnum.RUNNING.getValue());
        questionSubmitUpdate.setJudgeInfo(JSONUtil.toJsonStr(judgeInfo));
        //通过数据库进行修改
        update = questionSubmitService.updateById(questionSubmitUpdate);
        //判断当前代码是否修改成功
        if (!update){
            throw new BusinessException(ErrorCode.SYSTEM_ERROR,"题目状态更新错误");
        }
        //再从数据库中查询一下状态
        QuestionSubmit questionSubmitServiceById = questionSubmitService.getById(questionSubmitId);
        return questionSubmitServiceById;
    }
}
