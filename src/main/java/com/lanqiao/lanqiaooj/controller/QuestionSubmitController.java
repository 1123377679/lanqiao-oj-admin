package com.lanqiao.lanqiaooj.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lanqiao.lanqiaooj.annotation.AuthCheck;
import com.lanqiao.lanqiaooj.common.BaseResponse;
import com.lanqiao.lanqiaooj.common.ErrorCode;
import com.lanqiao.lanqiaooj.common.ResultUtils;
import com.lanqiao.lanqiaooj.constant.UserConstant;
import com.lanqiao.lanqiaooj.exception.BusinessException;
import com.lanqiao.lanqiaooj.exception.ThrowUtils;
import com.lanqiao.lanqiaooj.model.dto.post.PostQueryRequest;
import com.lanqiao.lanqiaooj.model.dto.question.QuestionQueryRequest;
import com.lanqiao.lanqiaooj.model.dto.questionSubmit.QuestionSubmitAddRequest;
import com.lanqiao.lanqiaooj.model.dto.questionSubmit.QuestionSubmitQueryRequest;
import com.lanqiao.lanqiaooj.model.entity.Post;
import com.lanqiao.lanqiaooj.model.entity.Question;
import com.lanqiao.lanqiaooj.model.entity.QuestionSubmit;
import com.lanqiao.lanqiaooj.model.entity.User;
import com.lanqiao.lanqiaooj.model.vo.PostVO;
import com.lanqiao.lanqiaooj.model.vo.QuestionSubmitVO;
import com.lanqiao.lanqiaooj.service.QuestionSubmitService;
import com.lanqiao.lanqiaooj.service.PostService;
import com.lanqiao.lanqiaooj.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 题目提交接口
 *
 *
 *
 */
@RestController
@RequestMapping("/question_submit")
@Slf4j
public class QuestionSubmitController {

    @Resource
    private QuestionSubmitService questionSubmitService;

    @Resource
    private PostService postService;

    @Resource
    private UserService userService;

    /**
     * 提交题目
     *
     * @param questionSubmitAddRequest
     * @param request
     * @return 提交记录的 id
     */
    @PostMapping("/")
    public BaseResponse<Long> doQuestionSubmit(@RequestBody QuestionSubmitAddRequest questionSubmitAddRequest,
                                               HttpServletRequest request) {
        if (questionSubmitAddRequest == null || questionSubmitAddRequest.getQuestionId() <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        // 登录才能点赞
        final User loginUser = userService.getLoginUser(request);
        long questionSubmitId = questionSubmitService.doQuestionSubmit(questionSubmitAddRequest, loginUser);
        return ResultUtils.success(questionSubmitId);
    }
    /**
     * 分页获取题目提交列表(除管理员外，普通用户只能看到非答案，提交代码等公开信息)
     *
     * @param questionSubmitQueryRequest
     * @return
     */
    @PostMapping("/list/page")
    public BaseResponse<Page<QuestionSubmitVO>> listQuestionSubmitByPage(@RequestBody QuestionSubmitQueryRequest questionSubmitQueryRequest,HttpServletRequest request) {
        long current = questionSubmitQueryRequest.getCurrent();
        long size = questionSubmitQueryRequest.getPageSize();
        Page<QuestionSubmit> questionPage = questionSubmitService.page(new Page<>(current, size),
                questionSubmitService.getQueryWrapper(questionSubmitQueryRequest));
        final User loginUser = userService.getLoginUser(request);
        return ResultUtils.success(questionSubmitService.getQuestionSubmitVOPage(questionPage,loginUser));
    }
}
