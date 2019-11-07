package com.czxy.orders.domain;

import com.czxy.product.domain.Product;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * Created by NO1 on 2019/5/30.
 */
@Table(name = "orderitem")
public class OrderItem implements Serializable{
    @Id
    private String itemid;
    private Integer count;//购买数量
    private Double subtotal;//小计
    private String  pid;
    private String oid;
    //一个订单项属于一个订单
    private Orders orders;
    //一个订单项包含了一个商品
    private Product product;
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrderItem orderItem = (OrderItem) o;

        return itemid != null ? itemid.equals(orderItem.itemid) : orderItem.itemid == null;
    }

    @Override
    public int hashCode() {
        return itemid != null ? itemid.hashCode() : 0;
    }

    public String getItemid() {
        return itemid;
    }

    public void setItemid(String itemid) {
        this.itemid = itemid;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public OrderItem() {
    }

    public OrderItem(String itemid, Integer count, Double subtotal, String pid, String oid) {
        this.itemid = itemid;
        this.count = count;
        this.subtotal = subtotal;
        this.pid = pid;
        this.oid = oid;
    }
}
