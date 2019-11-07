package com.czxy.orders.domain;

import com.czxy.user.domain.User;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created by NO1 on 2019/5/30.
 */
@Table(name = "orders")
public class Orders implements Serializable{
    @Id
    private String oid;
    private Date ordertime;
    private Double total;
    private Integer ostate;//订单状态；0未付款 1付款未发货 2发货未收货 3已收货
    private String address;
    private String name;
    private String telephone;
    private String uid;
    //一个订单有多个订单项
    private ArrayList<OrderItem>olist=new ArrayList<OrderItem>();
    //一个订单属于一个用户
    private User user;
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Orders orders = (Orders) o;

        return oid != null ? oid.equals(orders.oid) : orders.oid == null;
    }

    @Override
    public int hashCode() {
        return oid != null ? oid.hashCode() : 0;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "oid='" + oid + '\'' +
                ", ordertime=" + ordertime +
                ", total=" + total +
                ", ostate=" + ostate +
                ", address='" + address + '\'' +
                ", name='" + name + '\'' +
                ", telephone='" + telephone + '\'' +
                ", uid='" + uid + '\'' +
                '}';
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Integer getOstate() {
        return ostate;
    }

    public void setOstate(Integer ostate) {
        this.ostate = ostate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public Orders(String oid, Date ordertime, Double total, Integer ostate, String address, String name, String telephone, String uid) {
        this.oid = oid;
        this.ordertime = ordertime;
        this.total = total;
        this.ostate = ostate;
        this.address = address;
        this.name = name;
        this.telephone = telephone;
        this.uid = uid;
    }

    public Orders() {
    }
}
