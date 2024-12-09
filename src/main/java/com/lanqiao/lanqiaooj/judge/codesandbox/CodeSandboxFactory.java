package com.lanqiao.lanqiaooj.judge.codesandbox;

import com.lanqiao.lanqiaooj.judge.codesandbox.impl.ExampleCodeSandbox;
import com.lanqiao.lanqiaooj.judge.codesandbox.impl.RemoteCodeSandbox;

/**
 * @ Author: 李某人
 * @ Date: 2024/12/01/22:59
 * @ Description: 静态工厂(单例工厂和抽象工厂)
 */
public class CodeSandboxFactory {
    //静态工厂：静态方法
    public static CodeSandbox newInstance(String type){
        switch (type){
            case "example":
                return new ExampleCodeSandbox();
            case "remote":
                return new RemoteCodeSandbox();
            default:
                //如果用户选择的并不是我们现在所有的代码沙箱,我们可以选择报错或者给一个默认值
                return new ExampleCodeSandbox();
        }
    }
}
