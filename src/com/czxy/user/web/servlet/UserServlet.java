package com.czxy.user.web.servlet;

import cn.itcast.servlet.BaseServlet;
import com.czxy.user.domain.User;
import com.czxy.user.service.UserService;

import javax.servlet.http.Cookie;
import java.io.IOException;
import java.util.UUID;

/**
 * Created by xps13 on 2019/5/23.
 */
public class UserServlet extends BaseServlet {
    private UserService service = new UserService();

    /**
     * 用户退出
     * @return
     */
    public String logout(){
        //1、session中删除user对象
        getRequest().getSession().removeAttribute("user");
        //2、清除autoLogin的cookie
        Cookie autoLogin = new Cookie("autoLogin", "");
        autoLogin.setMaxAge(0);
        getResponse().addCookie(autoLogin);
        //3、跳转index.jsp
        return "redirect:/index.jsp";
    }
    /**
     * 用户登录
     * @return
     */
    public String login(){
        //一、登录判断
        //1、接收表单数据
        User user = toBean(User.class);
        System.out.println(user);
        //2、调用service，根据用户名和密码查询该用户信息
        //3、判断登录是否成功，根据不同结果跳转JSP回显
        User result = null;
        try {
            //传入一个IP地址
            String ipaddress = getRequest().getRemoteAddr();
            result = service.login(user,ipaddress);
            //登录成功
        } catch (Exception e) {
            //登录失败
            //接收并存储错误信息
            System.out.println(e.getMessage());
            getRequest().setAttribute("errorMsg",e.getMessage());
            //跳转到login.jsp页面进行回显
            return "forward:/login.jsp";
        }
        //登录成功
        //向session保存用户信息
        getRequest().getSession().setAttribute("user",result);

        //二、自动登录，记录和判断
        //1、判断用户是否需要自动登录
        if(getRequest().getParameter("autoLogin")!=null){
            //2、用户需要自动登录，记录用户的用户名和密码，保存cookie，保存7天
            Cookie autoLogin = new Cookie("autoLogin", result.getUsername() + "#" + result.getPassword());
            //设置保存7天
            autoLogin.setMaxAge(60*60*24*7);
            getResponse().addCookie(autoLogin);
        }

        //跳转到index.jsp
        return "redirect:/index.jsp";
    }
    /**
     * 校验用户名
     * @return
     */
    public String checkUsername() throws IOException {
        //1、获取用户名
        String username = getRequest().getParameter("username");
        System.out.println(username);
        //2、调用service，判断用户名是否可用
        boolean flag = service.checkUsername(username);
        System.out.println(flag);
        //3、把判断结果写入响应体
        getResponse().getWriter().write(flag+"");
        return null;
    }
    /**
     * 注册用户
     * @return
     */
    public String register(){
        //1、接收整个表单数据
        User user = toBean(User.class);
        //生成随机uid
        user.setUid(UUID.randomUUID().toString().replaceAll("-",""));
        //填充ustate   0是可用
        user.setUstate(0);
        System.out.println(user);
        //2、调用service，保存用户信息
        boolean flag = service.register(user);
        System.out.println(flag);
        //3、跳转JSP，展示注册结果
        //3.1、向域对象保存注册结果
        if(flag){
            //编辑展示信息
            String msg = "注册成功,请去登录页面登录<br/>自动跳转剩余倒计时：<span id='timespan1'>3</span>秒<script>\n" +
                    "\tsetInterval('changeTimeSpan()',1000);\n" +
                    "\tfunction changeTimeSpan(){\n" +
                    "\t\tvar span = $('#timespan1');\n" +
                    "\t\tspan.html(span.html()-1);\n" +
                    "\t}\n" +
                    "</script>";
            //设置域对象数据
            getRequest().setAttribute("msg",msg);
            //设置定时跳转（重定向）
            getResponse().setHeader("refresh","3;url=/estore/login.jsp");
        }else{
            getRequest().setAttribute("msg","注册失败");
        }
        //3.2、跳转JSP进行展示
        return "forward:/msg.jsp";
    }
}
