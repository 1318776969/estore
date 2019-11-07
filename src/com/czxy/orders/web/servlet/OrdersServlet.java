package com.czxy.orders.web.servlet;

import cn.itcast.servlet.BaseServlet;
import com.czxy.orders.service.OrdersService;
import com.czxy.product.domain.Cart;
import com.czxy.user.domain.User;

/**
 * Created by NO1 on 2019/5/30.
 */
public class OrdersServlet extends BaseServlet{
    private OrdersService oservice=new OrdersService();

    public Cart getCart(){
        //1.尝试去session中获取购物车
        Cart cart=(Cart) getRequest().getSession().getAttribute("cart");
        //2.判断，如果获取不到购物车，创建一个新的购物车吗，存入session
        if (cart==null){
            cart=new Cart();
            getRequest().getSession().setAttribute("cart",cart);
        }
        return cart;
    }
    //生成订单
    public String addOrders(){

        //1.根据购物车生成订单
        //1.1获取购物车
        Cart cart=getCart();
        //1.2判断：如果购物车为空，提示用户先购物
        if (cart.getMap().size()==0);
        //向域对象写出提示信息
        getRequest().setAttribute("msg","请您先购物后，再来生成订单");
        return "forward:/msg.jsp";
    }
    //获取用户
    User user=(User)getRequest().getSession().getAttribute("user");
    //1.4 判断：若用户未登陆，提示用户登录

}
