package com.lanqiao.lanqiaooj.judge.codesandbox.model;

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
public class ExecuteCodeRequest {
    /**
     * 用户代码
     */
    private String code;
    /**
     * 用户使用编程语言
     */
    private String language;
    /**
     * 输入用例
     */
    private List<String> inputList;
}
