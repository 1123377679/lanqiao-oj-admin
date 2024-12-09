package com.lanqiao.lanqiaooj.judge.codesandbox.model;

import com.lanqiao.lanqiaooj.model.dto.question.JudgeCase;
import com.lanqiao.lanqiaooj.model.dto.questionSubmit.JudgeInfo;
import com.lanqiao.lanqiaooj.model.entity.Question;
import com.lanqiao.lanqiaooj.model.entity.QuestionSubmit;
import lombok.Data;

import java.util.List;

/**
 * @ Author: 李某人
 * @ Date: 2024/12/09/21:46
 * @ Description: 上下文:用于传递的参数
 */
@Data
public class JudgeContext {
    private JudgeInfo judgeInfo;
    private List<String> inputList;
    private List<String> outputList;
    private List<JudgeCase> judgeCaseList;
    private QuestionSubmit questionSubmit;
    private Question question;
}
