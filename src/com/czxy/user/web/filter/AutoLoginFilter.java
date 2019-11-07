package com.czxy.user.web.filter;

import com.czxy.user.domain.User;
import com.czxy.user.service.UserService;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by xps13 on 2019/5/24.
 */
public class AutoLoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //1、判断用户之前是否已经登录
        //1.1、强转request
        HttpServletRequest hsr = (HttpServletRequest) req;
        //1.2、尝试从session中获取user对象
        Object u = hsr.getSession().getAttribute("user");
        //1.3、判断如果用户已登录，放行并return
        if(u!=null){
            System.out.println("自动登录过滤器：已登录，无需自动登录");
            chain.doFilter(req, resp);
            return;
        }
        //2、用户未登录，再判断用户是否需要自动登录
        //2.1、尝试获取autoLogin的cookie
        //2.1.1、获取所有的cookie
        Cookie[] arr = hsr.getCookies();
        Cookie autoLogin = null;
        //2.1.2、遍历cookie进行寻找
        if(arr!=null){
            for (Cookie cookie : arr) {
                if(cookie.getName().equals("autoLogin")){
                    autoLogin = cookie;
                    break;
                }
            }
        }
        //2.2、判断autoLogin是否存在，如果不存在，说明用户不需要自动登录
        if(autoLogin==null){
            System.out.println("自动登录过滤器：未登录，且不需要自动登录");
            chain.doFilter(req, resp);
            return;
        }
        //3、用户未登录，且需要自动登录，进行自动登录
        //3.1、获取cookie中保存的用户名和密码
        String[] split = autoLogin.getValue().split("#");
        //3.2、转为User对象
        User user = new User(null, split[0], split[1], null, null, null, null, null, null);
        //3.3、登录判断
        User result = null;
        try {
            String ipaddress = hsr.getRemoteAddr();
            result = new UserService().login(user, ipaddress);
        } catch (Exception e) {
            //登录失败
            //删除浏览器保存错误的cookie
            autoLogin.setMaxAge(0);
            HttpServletResponse hsre = (HttpServletResponse) resp;
            hsre.addCookie(autoLogin);
            System.out.println("自动登录过滤器：自动登录失败");
            chain.doFilter(req, resp);
            return;
        }
        //登录成功
        System.out.println("自动登录过滤器：自动登录成功");
        //向session保存用户信息
        hsr.getSession().setAttribute("user",result);
        //4、自动登录完毕，放行
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
