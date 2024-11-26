package com.lanqiao.lanqiaooj.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lanqiao.lanqiaooj.model.dto.question.QuestionQueryRequest;
import com.lanqiao.lanqiaooj.model.dto.questionSubmit.QuestionSubmitAddRequest;
import com.lanqiao.lanqiaooj.model.dto.questionSubmit.QuestionSubmitQueryRequest;
import com.lanqiao.lanqiaooj.model.entity.Question;
import com.lanqiao.lanqiaooj.model.entity.QuestionSubmit;
import com.lanqiao.lanqiaooj.model.entity.QuestionSubmit;
import com.baomidou.mybatisplus.extension.service.IService;
import com.lanqiao.lanqiaooj.model.entity.User;
import com.lanqiao.lanqiaooj.model.vo.QuestionSubmitVO;
import com.lanqiao.lanqiaooj.model.vo.QuestionVO;

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

    /**
     * 获取查询条件
     *
     * @param postQueryRequest
     * @return
     */
    QueryWrapper<QuestionSubmit> getQueryWrapper(QuestionSubmitQueryRequest postQueryRequest);

    /**
     * 获取题目封装
     *
     * @param post
     * @param request
     * @return
     */
    QuestionSubmitVO getQuestionSubmitVO(QuestionSubmit post,User loginUser);

    /**
     * 分页获取题目封装
     *
     * @param postPage
     * @param request
     * @return
     */
    Page<QuestionSubmitVO> getQuestionSubmitVOPage(Page<QuestionSubmit> postPage,User loginUser);

}
