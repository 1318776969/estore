package com.czxy.verifycode.web.servlet;

import cn.itcast.servlet.BaseServlet;

import java.io.IOException;

/**
 * Created by xps13 on 2019/5/23.
 */
public class VerifyCodeServlet extends BaseServlet {

    /**
     * ajax校验验证码
     * @return
     */
    public String checkVc() throws IOException {
        //1、接收用户输入的验证码
        String userIn = getRequest().getParameter("verifyCode");
        //2、接收验证码答案
        String vci = (String) getRequest().getSession().getAttribute("vci");
        //3、删除验证码答案
        getRequest().getSession().removeAttribute("vci");
        //4、校验并返回结果
        if(userIn!=null && vci!=null && userIn.equalsIgnoreCase(vci)){
            getResponse().getWriter().write(true+"");
        }else{
            getResponse().getWriter().write(false+"");
        }
        return null;
    }
    /**
     * 创建验证码
     * @return
     */
    public String createVc() throws IOException {
        //1、创建验证码
        String vci = createVerifyCodeImage();
        //2、向session中保存正确答案
        getRequest().getSession().setAttribute("vci",vci);
        return null;
    }
}
