package com.lanqiao.lanqiaooj.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lanqiao.lanqiaooj.model.dto.questionSubmit.QuestionSubmitAddRequest;
import com.lanqiao.lanqiaooj.model.dto.questionSubmit.QuestionSubmitQueryRequest;
import com.lanqiao.lanqiaooj.model.entity.QuestionSubmit;
import com.lanqiao.lanqiaooj.model.entity.QuestionSubmit;
import com.baomidou.mybatisplus.extension.service.IService;
import com.lanqiao.lanqiaooj.model.entity.User;
import com.lanqiao.lanqiaooj.model.vo.QuestionSubmitVO;

import javax.servlet.http.HttpServletRequest;

/**
* @author 86181
* @description 针对表【question_submit(题目提交)】的数据库操作Service
* @createDate 2024-11-21 17:53:11
*/
public interface QuestionSubmitService extends IService<QuestionSubmit> {

    /**
     * 题目提交
     *
     * @param questionSubmitAddRequest 题目提交信息
     * @param loginUser
     * @return
     */
    long doQuestionSubmit(QuestionSubmitAddRequest questionSubmitAddRequest, User loginUser);

}
