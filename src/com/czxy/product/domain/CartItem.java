package com.czxy.product.domain;

import java.io.Serializable;

/**
 * Created by xps13 on 2019/5/28.
 */
public class CartItem implements Serializable{
    //1、商品信息（从数据库查询得知）
    private Product product;
    //2、购买数量（前端用户自己输入）
    private Integer count;
    //3、商品小计（系统动态计算）
    private Double subtotal;

    public Double getSubtotal() {
        return product.getShop_price()*count;
    }
    //无需外界计算小计，并传入设置
    /*public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }*/
    @Override
    public String toString() {
        return "CartItem{" +
                "product=" + product +
                ", count=" + count +
                ", subtotal=" + subtotal +
                '}';
    }

    public CartItem(Product product, Integer count, Double subtotal) {
        this.product = product;
        this.count = count;
        this.subtotal = subtotal;
    }

    public CartItem() {
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

}
