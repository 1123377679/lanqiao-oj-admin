package com.lanqiao.lanqiaooj.judge.codesandbox.impl;

import com.lanqiao.lanqiaooj.judge.codesandbox.CodeSandbox;
import com.lanqiao.lanqiaooj.judge.codesandbox.model.ExecuteCodeRequest;
import com.lanqiao.lanqiaooj.judge.codesandbox.model.ExecuteCodeResponse;

/**
 * @ Author: 李某人
 * @ Date: 2024/11/30/13:39
 * @ Description: 远程代码沙箱(实际上我们需要使用的代码沙箱)
 */
public class RemoteCodeSandbox implements CodeSandbox {
    @Override
    public ExecuteCodeResponse executeCode(ExecuteCodeRequest executeCodeRequest) {
        System.out.println("远程代码沙箱");
        return null;
    }
}
