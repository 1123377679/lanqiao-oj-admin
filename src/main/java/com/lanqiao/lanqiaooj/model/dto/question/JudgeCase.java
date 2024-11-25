package com.lanqiao.lanqiaooj.model.dto.question;

import lombok.Data;

/**
 * @Author: 李某人
 * @Date: 2024/11/21/18:15
 * @Description: 判题用例
 */
@Data
public class JudgeCase {
    /**
     * 输入用例
     */
    private String input;
    private String output;
}
