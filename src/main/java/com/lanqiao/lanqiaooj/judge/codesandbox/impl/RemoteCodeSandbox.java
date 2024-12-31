package com.lanqiao.lanqiaooj.judge.codesandbox.impl;

import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONUtil;
import com.lanqiao.lanqiaooj.common.ErrorCode;
import com.lanqiao.lanqiaooj.exception.BusinessException;
import com.lanqiao.lanqiaooj.judge.codesandbox.CodeSandbox;
import com.lanqiao.lanqiaooj.judge.codesandbox.model.ExecuteCodeRequest;
import com.lanqiao.lanqiaooj.judge.codesandbox.model.ExecuteCodeResponse;
import org.apache.commons.lang3.StringUtils;

/**
 * @ Author: 李某人
 * @ Date: 2024/11/30/13:39
 * @ Description: 远程代码沙箱(实际上我们需要使用的代码沙箱)
 */
public class RemoteCodeSandbox implements CodeSandbox {
    //定义鉴权请求头和密钥
    private static final String AUTH_REQUST_HEADER = "auth";
    private static final String AUTH_REQUEST_SECRET = "secretKey";

    @Override
    public ExecuteCodeResponse executeCode(ExecuteCodeRequest executeCodeRequest) {
        System.out.println("远程代码沙箱");
        // String url = "http://192.168.88.133:8090/executeCode";
        String url = "http://localhost:8090/executeCode";
        String jsonStr = JSONUtil.toJsonStr(executeCodeRequest);
        String responseBody = HttpUtil.createPost(url)
                .header(AUTH_REQUST_HEADER,AUTH_REQUEST_SECRET)
                .body(jsonStr)
                .execute()
                .body();
        if (StringUtils.isBlank(responseBody)) {
            throw new BusinessException(ErrorCode.API_REQUEST_ERROR,"executeCode remoteSandbox error, message = "+responseBody);
        }
        return JSONUtil.toBean(responseBody, ExecuteCodeResponse.class);
    }
}
