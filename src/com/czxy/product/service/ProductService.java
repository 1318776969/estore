package com.czxy.product.service;

import com.czxy.product.dao.ProductDao;
import com.czxy.product.domain.Cart;
import com.czxy.product.domain.CartItem;
import com.czxy.product.domain.Product;
import com.czxy.utils.utils.MyBatisUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by xps13 on 2019/5/17.
 */
public class ProductService {
    /**
     * 查询热门商品列表
     * #查询最新的热门商品(可用)
     SELECT * FROM product WHERE is_hot=1 AND pstate=0 ORDER BY pdate DESC;
     * @return
     */
    public List<Product> selectHotPlist() {
        //1、获取Dao
        ProductDao dao = MyBatisUtils.getMapper(ProductDao.class);
        //2、通过分页助手，开启分页，展示第一页，一页展示9条
        PageHelper.startPage(1,9);
        //3、条件查询
        //3.1、拼接条件
        Example example = new Example(Product.class);
        Example.Criteria c = example.createCriteria();
        c.andEqualTo("is_hot",1);
        c.andEqualTo("pstate",0);
        example.setOrderByClause(" pdate DESC ");
        //3.2、条件查询
        List<Product> plist = dao.selectByExample(example);
        //4、封装分页数据
        PageInfo<Product> pi = new PageInfo<>(plist);
        //5、关闭会话并返回结果
        MyBatisUtils.close();
        return pi.getList();
    }

    /**
     * 查询最新商品列表
     * * #查询最新的商品(可用)
     SELECT * FROM product WHERE  pstate=0 ORDER BY pdate DESC;
     * @return
     */
    public List<Product> selectNewPlist() {
        //1、获取Dao
        ProductDao dao = MyBatisUtils.getMapper(ProductDao.class);
        //2、通过分页助手，开启分页，展示第一页，一页展示9条
        PageHelper.startPage(1,9);
        //3、条件查询
        //3.1、拼接条件
        Example example = new Example(Product.class);
        Example.Criteria c = example.createCriteria();
        c.andEqualTo("pstate",0);
        example.setOrderByClause(" pdate DESC ");
        //3.2、条件查询
        List<Product> plist = dao.selectByExample(example);
        //4、封装分页数据
        PageInfo<Product> pi = new PageInfo<>(plist);
        //5、关闭会话并返回结果
        MyBatisUtils.close();
        return pi.getList();
    }

    /**
     * 根据PID查询某个商品详情
     * @param pid
     * @return
     */
    public Product searchProductByPid(String pid) {
        //1、获取Dao
        ProductDao dao = MyBatisUtils.getMapper(ProductDao.class);
        //2、通过通用Mapper进行主键查询
        Product product = dao.selectByPrimaryKey(pid);
        //3、关闭会话并返回结果
        MyBatisUtils.close();
        return product;
    }

    /**
     * 查询某个分类下的商品信息（分页）
     * select * from product where cid=? and pstate=0 order by pdate desc
     * @param cid
     * @param pageNum
     * @return
     */
    public PageInfo<Product> searchPlistByCidForPage(String cid, int pageNum) {
        //1、获取Dao
        ProductDao dao = MyBatisUtils.getMapper(ProductDao.class);
        //2、使用分页助手，开启分页， 一页展示12条
        PageHelper.startPage(pageNum,12);
        //3、条件查询
        //3.1、拼接条件
        Example example = new Example(Product.class);
        Example.Criteria c = example.createCriteria();
        c.andEqualTo("cid",cid);
        c.andEqualTo("pstate",0);
        example.setOrderByClause(" pdate desc ");
        //3.2、作条件查询
        List<Product> plist = dao.selectByExample(example);
        //4、封装分页数据
        PageInfo<Product> pi = new PageInfo<>(plist);
        //5、关闭会话并返回结果
        MyBatisUtils.close();
        return pi;
    }

    /**
     * 根据pid集合查询商品列表
     * @param pidList
     * @return
     */
    public List<Product> searchHistoryPlist(ArrayList<String> pidList) {
        //1、定义一个返回结果
        ArrayList<Product> result = new ArrayList<>();
        //2、遍历pid集合，每遍历一个pid,查询一个product对象，填充到返回结果中
        for (String pid : pidList) {
            result.add(searchProductByPid(pid));
        }
        //3、返回结果
        return result;
    }

    /**
     * 添加商品到购物车
     * @param cart
     * @param ci
     */
    public void addCart(Cart cart, CartItem ci) {
        //1、尝试从购物车中获取该商品
        CartItem oldCi = cart.getMap().get(ci.getProduct().getPid());
        //2、判断是否购物车中有该商品
        if(oldCi==null){
            //2.1、没获取到，把该商品添加到购物车中
            cart.getMap().put(ci.getProduct().getPid(),ci);
        }else{
            //2.2、获取到，新的购买数量+旧的购买数量
            oldCi.setCount(ci.getCount()+oldCi.getCount());
        }
    }

    /**
     * 从购物车删除该商品信息
     * @param cart
     * @param pid
     */
    public void delProductFromCart(Cart cart, String pid) {
        cart.getMap().remove(pid);
    }

    /**
     * 清空购物车
     * @param cart
     */
    public void clearCart(Cart cart) {
        cart.getMap().clear();
    }

    public Cart modifyCart(String pid, Integer count, Cart cart) {
        //根据pid获取购物项
        CartItem cartItem=cart.getMap().get(pid);
        //修改购买数量
         cartItem.setCount(count);
         //把购物项放回购物车中
        cart.getMap().put(pid,cartItem);
        return cart;
    }

    public void run2(String pid, Cart cart) {
        String[] arr = pid.split(",");
        for (String id : arr) {
            delProductFromCart(cart,id);
        }
    }
}
