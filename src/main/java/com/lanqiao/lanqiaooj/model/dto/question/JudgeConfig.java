package com.lanqiao.lanqiaooj.model.dto.question;

import lombok.Data;

/**
 * @Author: 李某人
 * @Date: 2024/11/21/18:15
 * @Description: 判题配置
 */
@Data
public class JudgeConfig {
    /**
     * 时间限制
     */
    private Long timeLimit;
    /**
     * 内存限制
     */
    private Long memoryLimit;

    /**
     * 堆栈限制
     */
    private Long stackLimit;
}
