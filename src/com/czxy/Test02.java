package com.czxy;

/**
 * Created by xps13 on 2019/5/24.
 * 测试异常处理机制
 */
public class Test02 {
    /*
    * 模拟servlet层
    * *//*
    public static void main(String[] args) {
        String result = "";
        try {
            result = run1();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return;
        }
        System.out.println(result);
    }
    *//**
     * 模拟service层
     * @return
     *//*
    public static String run1(){
        String x = "1";
        boolean f = true;
        if(f){
            throw new RuntimeException("我出了错误1");
        }else if(){
            throw new RuntimeException("密码有问题");
        }
        return x;
    }*/

}
