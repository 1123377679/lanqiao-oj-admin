package com.lanqiao.lanqiaooj.judge.codesandbox;

import com.lanqiao.lanqiaooj.judge.codesandbox.model.ExecuteCodeRequest;
import com.lanqiao.lanqiaooj.judge.codesandbox.model.ExecuteCodeResponse;

/**
 * @ Author: 李某人
 * @ Date: 2024/11/30/13:32
 * @ Description: 
 */
public interface CodeSandbox {
     //执行代码的接口
    ExecuteCodeResponse executeCode(ExecuteCodeRequest executeCodeRequest);
}
