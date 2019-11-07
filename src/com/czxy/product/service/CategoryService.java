package com.czxy.product.service;

import com.czxy.product.dao.CategoryDao;
import com.czxy.product.domain.Cart;
import com.czxy.product.domain.CartItem;
import com.czxy.product.domain.Category;
import com.czxy.utils.utils.MyBatisUtils;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by xps13 on 2019/5/17.
 */
public class CategoryService {
    /**
     * 查询所有分类列表
     * select * from category where cstate=0;
     * @return
     */

    public List<Category> searchAllClist() {
        //1、获取Dao
        CategoryDao dao = MyBatisUtils.getMapper(CategoryDao.class);
        //2、通用Mapper条件查询
        //2.1、拼接条件
        Example example = new Example(Category.class);
        Example.Criteria c = example.createCriteria();
        c.andEqualTo("cstate",0);
        //2.2、条件查询
        List<Category> clist = dao.selectByExample(example);
        //3、关闭会话并返回结果
        MyBatisUtils.close();
        return clist;
    }

    public String modifyCart(String pid, Integer count, Cart cart) {

        //根据pid获取购物项
        CartItem cartItem=cart.getMap().get(pid);
        //修改购买数量
        cartItem.setCount(count);
        Double subtotal = cartItem.getSubtotal();
        Double total = cart.getTotal();
        System.out.println(subtotal+"--------"+total);
        return subtotal+","+total;
        }
    }

