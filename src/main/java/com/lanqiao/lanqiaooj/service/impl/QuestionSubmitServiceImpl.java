package com.lanqiao.lanqiaooj.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lanqiao.lanqiaooj.common.ErrorCode;
import com.lanqiao.lanqiaooj.constant.CommonConstant;
import com.lanqiao.lanqiaooj.exception.BusinessException;
import com.lanqiao.lanqiaooj.model.dto.questionSubmit.QuestionSubmitAddRequest;
import com.lanqiao.lanqiaooj.model.dto.questionSubmit.QuestionSubmitQueryRequest;
import com.lanqiao.lanqiaooj.model.entity.*;
import com.lanqiao.lanqiaooj.model.enums.QuestionSubmitLanguageEnum;
import com.lanqiao.lanqiaooj.model.enums.QuestionSubmitStatusEnum;
import com.lanqiao.lanqiaooj.model.vo.QuestionSubmitVO;
import com.lanqiao.lanqiaooj.service.QuestionService;
import com.lanqiao.lanqiaooj.service.QuestionSubmitService;
import com.lanqiao.lanqiaooj.mapper.QuestionSubmitMapper;
import com.lanqiao.lanqiaooj.service.UserService;
import com.lanqiao.lanqiaooj.utils.SqlUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

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
        return questionSubmit.getId();
    }
}




