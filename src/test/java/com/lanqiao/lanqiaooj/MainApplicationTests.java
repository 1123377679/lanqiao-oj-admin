package com.lanqiao.lanqiaooj;

import com.lanqiao.lanqiaooj.judge.codesandbox.CodeSandbox;
import com.lanqiao.lanqiaooj.judge.codesandbox.CodeSandboxFactory;
import com.lanqiao.lanqiaooj.judge.codesandbox.CodeSandboxProxy;
import com.lanqiao.lanqiaooj.judge.codesandbox.impl.ExampleCodeSandbox;
import com.lanqiao.lanqiaooj.judge.codesandbox.model.ExecuteCodeRequest;
import com.lanqiao.lanqiaooj.judge.codesandbox.model.ExecuteCodeResponse;
import com.lanqiao.lanqiaooj.model.enums.QuestionSubmitLanguageEnum;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

/***
* @Action:
* @Param:  
* @return: 
* @Author: 你的名字
* @Date: 2024/11/29
*/
@SpringBootTest
class MainApplicationTests {

    @Value("${codesandbox.type:example}")
    private String type;

    @Test
    void contextLoads() {
        //创建代码沙箱
        //设计模式：工厂模式
        CodeSandbox codeSandbox = CodeSandboxFactory.newInstance(type);
        //接收前端的参数
        //模拟一些数据
        String code = "int main(){}";
        List<String> inputList =  Arrays.asList("1 2", "3 4");
        String language = QuestionSubmitLanguageEnum.JAVA.getValue();
        ExecuteCodeRequest executeCodeRequest = ExecuteCodeRequest.builder()
                .code(code)
                .language(language)
                .inputList(inputList)
                .build();
        //执行代码沙箱
        ExecuteCodeResponse executeCodeResponse = codeSandbox.executeCode(executeCodeRequest);
        //判断是否为空
        // Assertions.assertNotNull(executeCodeResponse);
    }
    @Test
    public void codeSandboxProxy(){
        CodeSandbox codeSandbox = CodeSandboxFactory.newInstance(type);
        codeSandbox = new CodeSandboxProxy(codeSandbox);
        //接收前端的参数
        //模拟一些数据
        String code = "int main(){}";
        List<String> inputList =  Arrays.asList("1 2", "3 4");
        String language = QuestionSubmitLanguageEnum.JAVA.getValue();
        ExecuteCodeRequest executeCodeRequest = ExecuteCodeRequest.builder()
                .code(code)
                .language(language)
                .inputList(inputList)
                .build();
        //执行代码沙箱
        ExecuteCodeResponse executeCodeResponse = codeSandbox.executeCode(executeCodeRequest);
        System.out.println(executeCodeResponse);
    }
}
