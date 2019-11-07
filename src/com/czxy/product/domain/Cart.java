package com.czxy.product.domain;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by xps13 on 2019/5/28.
 */
public class Cart implements Serializable {
    //1、购物车总价（系统动态计算得来）
    private Double total;
    //2、购物项集合
    private Map<String,CartItem> map = new LinkedHashMap<String,CartItem>();

    /**
     * 把购物车所有商品的小计进行累加
     * @return
     */
    public Double getTotal() {
        total = 0.0;
        for (Map.Entry<String, CartItem> entry : map.entrySet()) {
            total+=entry.getValue().getSubtotal();
        }
        return total;
    }
    /*public void setTotal(Double total) {
        this.total = total;
    }*/

    @Override
    public String toString() {
        return "Cart{" +
                "total=" + total +
                ", map=" + map +
                '}';
    }

    public Cart(Double total, Map<String, CartItem> map) {
        this.total = total;
        this.map = map;
    }

    public Cart() {
    }



    public Map<String, CartItem> getMap() {
        return map;
    }

    public void setMap(Map<String, CartItem> map) {
        this.map = map;
    }
}
