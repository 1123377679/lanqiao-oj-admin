package com.lanqiao.lanqiaooj.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.lanqiao.lanqiaooj.model.dto.question.QuestionQueryRequest;
import com.lanqiao.lanqiaooj.model.entity.Question;
import com.lanqiao.lanqiaooj.model.entity.Question;
import com.baomidou.mybatisplus.extension.service.IService;
import com.lanqiao.lanqiaooj.model.vo.QuestionVO;

import javax.servlet.http.HttpServletRequest;

/**
* @author 86181
* @description 针对表【question(题目)】的数据库操作Service
* @createDate 2024-11-21 17:52:25
*/
public interface QuestionService extends IService<Question> {
    /**
     * 校验
     *
     * @param post
     * @param add
     */
    void validQuestion(Question post, boolean add);

    /**
     * 获取查询条件
     *
     * @param postQueryRequest
     * @return
     */
    QueryWrapper<Question> getQueryWrapper(QuestionQueryRequest postQueryRequest);

    /**
     * 获取帖子封装
     *
     * @param post
     * @param request
     * @return
     */
    QuestionVO getQuestionVO(Question post, HttpServletRequest request);

    /**
     * 分页获取帖子封装
     *
     * @param postPage
     * @param request
     * @return
     */
    Page<QuestionVO> getQuestionVOPage(Page<Question> postPage, HttpServletRequest request);
}
