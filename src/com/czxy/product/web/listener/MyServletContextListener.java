package com.czxy.product.web.listener; /**
 * Created by xps13 on 2019/5/17.
 */

import com.czxy.product.domain.Product;
import com.czxy.product.service.ProductService;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.List;

public class MyServletContextListener implements ServletContextListener {

    /**
     * 过渡代码
     * @param servletContextEvent
     */
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        //1、调用service，查询热门商品列表
        ProductService pservice = new ProductService();
        List<Product> hotPlist =  pservice.selectHotPlist();
        for (Product product : hotPlist) {
            System.out.println(product);
        }
        //2、把热门商品列表，存入servletContext作用域中
        servletContextEvent.getServletContext().setAttribute("hotPlist",hotPlist);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
