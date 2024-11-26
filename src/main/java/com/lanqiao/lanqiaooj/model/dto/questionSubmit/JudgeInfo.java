package com.lanqiao.lanqiaooj.model.dto.questionSubmit;

import lombok.Data;

/**
 * @Author: 李某人
 * @Date: 2024/11/21/18:23
 * @Description: 判题信息
 */
@Data
public class JudgeInfo {
    /**
     * 程序执行的信息
     */
    private String message;
    /**
     * 消耗的内存
     */
    private Long memory;
    /**
     * 消耗的时间
     */
    private Long time;
}
