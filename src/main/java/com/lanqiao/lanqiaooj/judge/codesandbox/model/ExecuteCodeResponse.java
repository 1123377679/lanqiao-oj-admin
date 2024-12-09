package com.lanqiao.lanqiaooj.judge.codesandbox.model;

import com.lanqiao.lanqiaooj.model.dto.questionSubmit.JudgeInfo;
import io.swagger.models.auth.In;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @ Author: 李某人
 * @ Date: 2024/11/30/13:34
 * @ Description: 
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ExecuteCodeResponse {
    /**
     * 输出用例
     */
    private List<String> outputList;
    /**
     * 执行状态
     */
    private Integer status;
    /**
     * 接口信息
     */
    private String message;
    /**
     * 判题信息
     */
    private JudgeInfo judgeInfo;
}
