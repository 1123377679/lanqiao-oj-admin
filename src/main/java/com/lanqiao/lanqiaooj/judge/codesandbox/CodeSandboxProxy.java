package com.lanqiao.lanqiaooj.judge.codesandbox;

import com.lanqiao.lanqiaooj.judge.codesandbox.model.ExecuteCodeRequest;
import com.lanqiao.lanqiaooj.judge.codesandbox.model.ExecuteCodeResponse;
import lombok.extern.slf4j.Slf4j;

/**
 * @ Author: 李某人
 * @ Date: 2024/12/03/14:20
 * @ Description:
 */
@Slf4j
//实现被代理的接口
public class CodeSandboxProxy implements CodeSandbox {
    private final CodeSandbox codeSandbox;
    //通过构造函数接受一个被代理的接口实现类
    public CodeSandboxProxy(CodeSandbox codeSandbox){
        this.codeSandbox = codeSandbox;
    }
    @Override
    public ExecuteCodeResponse executeCode(ExecuteCodeRequest executeCodeRequest) {
        log.info("代码沙箱请求信息：" + executeCodeRequest.toString());
        ExecuteCodeResponse executeCodeResponse = codeSandbox.executeCode(executeCodeRequest);
        log.info("代码沙箱响应信息：" + executeCodeResponse.toString());
        return executeCodeResponse;
    }
}
