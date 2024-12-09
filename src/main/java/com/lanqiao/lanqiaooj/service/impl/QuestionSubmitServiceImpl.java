package com.lanqiao.lanqiaooj.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lanqiao.lanqiaooj.common.ErrorCode;
import com.lanqiao.lanqiaooj.constant.CommonConstant;
import com.lanqiao.lanqiaooj.exception.BusinessException;
import com.lanqiao.lanqiaooj.model.dto.question.QuestionQueryRequest;
import com.lanqiao.lanqiaooj.model.dto.questionSubmit.QuestionSubmitAddRequest;
import com.lanqiao.lanqiaooj.model.dto.questionSubmit.QuestionSubmitQueryRequest;
import com.lanqiao.lanqiaooj.model.entity.*;
import com.lanqiao.lanqiaooj.model.enums.QuestionSubmitLanguageEnum;
import com.lanqiao.lanqiaooj.model.enums.QuestionSubmitStatusEnum;
import com.lanqiao.lanqiaooj.model.vo.QuestionSubmitVO;
import com.lanqiao.lanqiaooj.model.vo.QuestionVO;
import com.lanqiao.lanqiaooj.model.vo.UserVO;
import com.lanqiao.lanqiaooj.service.JudgeService;
import com.lanqiao.lanqiaooj.service.QuestionService;
import com.lanqiao.lanqiaooj.service.QuestionSubmitService;
import com.lanqiao.lanqiaooj.mapper.QuestionSubmitMapper;
import com.lanqiao.lanqiaooj.service.UserService;
import com.lanqiao.lanqiaooj.utils.SqlUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;

/**
* @author 86181
* @description 针对表【question_submit(题目提交)】的数据库操作Service实现
* @createDate 2024-11-21 17:53:11
*/
@Service
@Slf4j
public class QuestionSubmitServiceImpl extends ServiceImpl<QuestionSubmitMapper, QuestionSubmit>
    implements QuestionSubmitService{
    @Resource
    private UserService userService;

    @Resource
    private QuestionService questionService;

    @Resource
    @Lazy
    JudgeService judgeService;

    /**
     * 提交题目
     *
     * @param questionSubmitAddRequest
     * @param loginUser
     * @return
     */
    @Override
    public long doQuestionSubmit(QuestionSubmitAddRequest questionSubmitAddRequest, User loginUser) {
        // 校验编程语言是否合法
        String language = questionSubmitAddRequest.getLanguage();
        //使用枚举类来进行判断
        QuestionSubmitLanguageEnum languageEnum  = QuestionSubmitLanguageEnum.getEnumByValue(language);
        if (languageEnum == null){
            throw new BusinessException(ErrorCode.PARAMS_ERROR,"编程语言错误");
        }
        //获取到提交题目的id
        Long questionId = questionSubmitAddRequest.getQuestionId();
        //todo:通过题目id获取题目的相关信息
        //是否提交题目
        Long id = loginUser.getId();
        QuestionSubmit questionSubmit = new QuestionSubmit();
        questionSubmit.setUserId(id);
        questionSubmit.setQuestionId(questionId);
        questionSubmit.setCode(questionSubmitAddRequest.getCode());
        questionSubmit.setLanguage(language);
        //设置初始状态
        questionSubmit.setStatus(QuestionSubmitStatusEnum.WAITING.getValue());
        //设置判题信息
        questionSubmit.setJudgeInfo("{}");
        boolean save = this.save(questionSubmit);
        if (!save){
            throw new BusinessException(ErrorCode.SYSTEM_ERROR, "数据插入失败");
        }
        //判题服务
        Long questionSubmitId = questionSubmit.getId();
        //异步执行判题服务
        CompletableFuture.runAsync(()->{
            judgeService.doJudge(questionSubmitId);
        });
        return questionSubmitId;
    }
    /**
     * 获取查询包装类(用户根据那些字段查询，根据前端传来的请求对象，让Mybaits框架支持的查询QueryWrapper类)
     *      *
     * @param questionSubmitQueryRequest
     * @return
     */
    @Override
    public QueryWrapper<QuestionSubmit> getQueryWrapper(QuestionSubmitQueryRequest questionSubmitQueryRequest) {
        QueryWrapper<QuestionSubmit> queryWrapper = new QueryWrapper<>();
        if (questionSubmitQueryRequest == null) {
            return queryWrapper;
        }
        String language = questionSubmitQueryRequest.getLanguage();
        Integer status = questionSubmitQueryRequest.getStatus();
        Long questionId = questionSubmitQueryRequest.getQuestionId();
        Long userId = questionSubmitQueryRequest.getUserId();
        String sortField = questionSubmitQueryRequest.getSortField();
        String sortOrder = questionSubmitQueryRequest.getSortOrder();
        //拼接查询的条件
        queryWrapper.like(StringUtils.isNotEmpty(language), "language", language);
        queryWrapper.like(QuestionSubmitStatusEnum.getEnumByValue(status)!=null, "status", status);
        queryWrapper.like(ObjectUtils.isNotEmpty(questionId), "questionId", questionId);
        queryWrapper.like(ObjectUtils.isNotEmpty(userId), "userId", userId);
        queryWrapper.eq("isDelete", false);
        queryWrapper.orderBy(SqlUtils.validSortField(sortField), sortOrder.equals(CommonConstant.SORT_ORDER_ASC),
                sortField);
        return queryWrapper;
    }

    @Override
    public QuestionSubmitVO getQuestionSubmitVO(QuestionSubmit questionSubmit,User loginUser) {
        //脱敏: 只有本人和管理员能看见自己提交的代码
        QuestionSubmitVO questionSubmitVO = QuestionSubmitVO.objToVo(questionSubmit);
        Long userId = loginUser.getId();
        if (userId != questionSubmit.getUserId() && !userService.isAdmin(loginUser)){
            questionSubmitVO.setCode(null);
        }
        return questionSubmitVO;
    }

    @Override
    public Page<QuestionSubmitVO> getQuestionSubmitVOPage(Page<QuestionSubmit> questionSubmitPage, User loginUser) {
        List<QuestionSubmit> questionSubmitList = questionSubmitPage.getRecords();
        Page<QuestionSubmitVO> questionSubmitVOPage = new Page<>(questionSubmitPage.getCurrent(), questionSubmitPage.getSize(), questionSubmitPage.getTotal());
        if (CollectionUtils.isEmpty(questionSubmitList)) {
            return questionSubmitVOPage;
        }
        List<QuestionSubmitVO> questionSubmitVOList = questionSubmitList.stream()
                .map(questionSubmit -> getQuestionSubmitVO(questionSubmit, loginUser))
                .collect(Collectors.toList());
        questionSubmitVOPage.setRecords(questionSubmitVOList);
        return questionSubmitVOPage;
    }
}




