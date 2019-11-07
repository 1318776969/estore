package com.czxy.product.web.servlet;

import cn.itcast.servlet.BaseServlet;
import com.czxy.product.domain.Cart;
import com.czxy.product.domain.CartItem;
import com.czxy.product.domain.Category;
import com.czxy.product.domain.Product;
import com.czxy.product.service.CategoryService;
import com.czxy.product.service.ProductService;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONArray;

import javax.servlet.http.Cookie;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by xps13 on 2019/5/17.
 */
public class ProductServlet extends BaseServlet {
    private CategoryService cservice = new CategoryService();
    private ProductService pservice = new ProductService();

    public String run2(){
        String pid = getRequest().getParameter("pid");
        Cart cart = getCart();
        pservice.run2(pid,cart);
        return null;
    }
    /**
     *修改购物车商品数量
     */
    public String modufyCart() throws IOException {
        //准备数据
        //获取id
        String pid=getRequest().getParameter("pid");
        //获取购买数量 count
        Integer count=Integer.parseInt(getRequest().getParameter("count"));
        System.out.println(pid+"---"+count);
        //获取购物车
        Cart cart=getCart();
        //调用 service修改购买数量
        String s = cservice.modifyCart(pid, count, cart);
        getResponse().getWriter().write(s);
        return null;
    }

    /**
     * 清空购物车
     * @return
     */
    public String clearCart(){
        //1、获取Cart
        Cart cart = getCart();
        //2、调用service，清空购物车
        pservice.clearCart(cart);
        //3、跳转cart.jsp展示
        return "redirect:/cart.jsp";
    }
    /**
     * 从购物车删除某个商品
     * @return
     */
    public String delProductFromCart(){
        //1、获取pid
        String pid = getRequest().getParameter("pid");
        System.out.println(pid);
        //2、获取Cart
        Cart cart = getCart();
        //3、调用service，从购物车删除某个商品
        pservice.delProductFromCart(cart,pid);
        //4、跳转cart.jsp展示
        return "redirect:/cart.jsp";
    }
    /**
     * 添加商品到购物车
     * @return
     */
    public String addCart(){
        //1、获取pid和count
        String pid = getRequest().getParameter("pid");
        Integer count = Integer.parseInt(getRequest().getParameter("count"));
        System.out.println(pid+"----"+count);
        //2、根据pid查询product数据
        Product product = pservice.searchProductByPid(pid);
        System.out.println(product);
        //3、创建CartItem对象，封装数据
        CartItem ci = new CartItem(product, count, 0.0);
        System.out.println(ci);
        //4、获取Cart对象
        Cart cart = getCart();
        System.out.println("添加之前："+cart);
        //5、调用service，把商品添加到购物车中
        pservice.addCart(cart,ci);
        System.out.println("添加之后："+cart);
        //6、跳转cart.jsp展示
        return "redirect:/cart.jsp";
    }

    /**
     * 获取购物车 ctrl+alt+M快捷抽取
     * @return
     */
    public Cart getCart() {
        //1、尝试去session中获取购物车
        Cart cart = (Cart) getRequest().getSession().getAttribute("cart");
        //2、判断，如果获取不到购物车，创建一个新购物车，存入session
        if(cart==null){
            cart = new Cart();
            getRequest().getSession().setAttribute("cart",cart);
        }
        return cart;
    }

    /**
     * 加载浏览记录
     * @return
     */
    public String searchHistoryPlist() throws IOException {
        //1、从cookie中获取浏览记录，转List<String>
        //1.1、尝试获取浏览记录的cookie
        Cookie[] arr = getRequest().getCookies();
        Cookie history = null;
        if(arr!=null){
            for (Cookie cookie : arr) {
                if(cookie.getName().equals("history")){
                    history = cookie;
                    break;
                }
            }
        }
        if(history == null){
            //说明无浏览记录，后面代码无需执行
            return null;
        }
        //1.2、把cookie值转List<String>
        ArrayList<String> pidList = new ArrayList<>();
        Collections.addAll(pidList,history.getValue().split(","));
        System.out.println(pidList);
        //2、调用Service根据pid集合查询结果
        List<Product> historyPlist = pservice.searchHistoryPlist(pidList);
        System.out.println(historyPlist);
        //3、查询结果转JSON，写出响应体
        getResponse().setContentType("application/json;charset=utf-8");
        getResponse().getWriter().write(JSONArray.fromObject(historyPlist).toString());
        return null;
    }
    /**
     * 查询某个分类下的商品列表（分页查询）
     * @return
     */
    public String searchPlistByCidForPage(){
        //1、接收参数
        String cid = getRequest().getParameter("cid");
        int pageNum = Integer.parseInt(getRequest().getParameter("pageNum"));
        System.out.println(cid+"-------"+pageNum);
        //2、调用service进行条件+分页查询（当前页数据，第几页，总共几页...）
        PageInfo<Product> pi = pservice.searchPlistByCidForPage(cid,pageNum);
        //展示测试
//        for (Product product : pi.getList()) {
//            System.out.println(product);
//        }
        //3、把结果存入作用域(数据仅用一次，所以存入request)
        getRequest().setAttribute("pi",pi);
        //4、跳转JSP作展示（因为使用了request，跳转方式仅为请求转发）
        return "forward:/product_list.jsp";
    }
    /**
     * ajax查询所有分类列表
     * @return
     */
    public String searchAllClist() throws IOException {
        //1、调用service查询分类列表
        List<Category> clist = cservice.searchAllClist();
        System.out.println(clist);
        //2、转JSON
        JSONArray json = JSONArray.fromObject(clist);
        System.out.println(json.toString());
        //3、写出响应体
        getResponse().setContentType("application/json;charset=utf-8");
        getResponse().getWriter().write(json.toString());
        return null;
    }
    /**
     * 根据PID查询某个商品详情
     * @return
     */
    public String searchProductByPid(){
        //一、根据PID查询商品信息
        //1、获取PID
        String pid = getRequest().getParameter("pid");
        System.out.println(pid);
        //2、调用service，根据PID查询商品详情
        Product product = pservice.searchProductByPid(pid);
        System.out.println(product);
        //3、把查询结果存入作用域（因为该查询结果仅在JSP上使用一次，所以使用request作用域）
        getRequest().setAttribute("product",product);

        //二、根据PID记录浏览记录
        //1、尝试获取之前的浏览记录
        //1.1、从request对象中获取所有的cookie
        Cookie[] arr = getRequest().getCookies();
        Cookie history = null;
        //1.2、遍历cookie数组，寻找保存浏览记录cookie
        if(arr!=null){
            for (Cookie cookie : arr) {
                if(cookie.getName().equals("history")){
                    history = cookie;
                    break;
                }
            }
        }
        //2、记录新的浏览记录
        LinkedList<String> historyList = new LinkedList<>();
        //2.1、判断之前的浏览记录是否存在
        if(history!=null){
            //2.1.1、之前浏览记录存在，追加新的pid
            //把cookie中的浏览记录，转存到list集合中
            Collections.addAll(historyList,history.getValue().split(","));
            //尝试删除记录中重复的pid
            historyList.remove(pid);
            // 如果集合长度==6，删除最后一个元素
            if(historyList.size()==6){
                historyList.removeLast();
            }
        }
        //把数据追加到LinkedList头部
        historyList.addFirst(pid);
        //2.2、记录新的浏览记录cookie中
        //2.2.1、拼接value值
        StringBuilder builder = new StringBuilder();
        for (String x : historyList) {
            builder.append(x+",");
        }
        //去掉最后的一个,
        builder.deleteCharAt(builder.length()-1);
        //2.2.2、保存value值
        history = new Cookie("history",builder.toString());
        history.setMaxAge(60*60*24*7);
        getResponse().addCookie(history);

        //4、跳转到JSP（因为使用了request作用域，跳转仅能选择请求转发）
        return "forward:/product_info.jsp";
    }
    /**
     * 查询最新商品列表
     * @return
     */
    public String selectNewPlist() throws IOException {
        //1、调用service，查询最新商品列表
        List<Product> newPlist = pservice.selectNewPlist();
        //2、查询结果转JSON
        JSONArray json = JSONArray.fromObject(newPlist);
        System.out.println(json.toString());
        //3、写出响应体
        getResponse().setContentType("application/json;charset=utf-8");
        getResponse().getWriter().write(json.toString());
        return null;
    }
    /**
     * 查询热门商品列表
     * @return
     */
    public String selectHotPlist() throws IOException {
        //1、调用service，查询热门商品列表
        List<Product> hotPlist = pservice.selectHotPlist();
        //2、查询结果转JSON
        JSONArray json = JSONArray.fromObject(hotPlist);
        System.out.println(json.toString());
        //3、写出响应体
        getResponse().setContentType("application/json;charset=utf-8");
        getResponse().getWriter().write(json.toString());
        return null;
    }
}
