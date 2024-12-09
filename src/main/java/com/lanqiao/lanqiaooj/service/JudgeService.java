package com.lanqiao.lanqiaooj.service;

import com.lanqiao.lanqiaooj.model.vo.QuestionSubmitVO;

/**
 * @ Author: 李某人
 * @ Date: 2024/12/03/14:35
 * @ Description:
 */
public interface JudgeService {
    /**
     * 判题服务
     * @param questionSubmitId
     * @return
     */
    QuestionSubmitVO doJudge(long questionSubmitId);
}
