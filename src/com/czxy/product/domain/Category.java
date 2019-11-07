package com.czxy.product.domain;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by xps13 on 2019/5/17.
 */
@Table(name="category")
public class Category implements Serializable{
    @Id
    private String cid;
    private String cname;
    private String cstate;//分类信息状态  0可用  1废弃
    //一个分类下有多个商品  不要加入toString
    private List<Product> plist = new ArrayList<Product>();

    public List<Product> getPlist() {
        return plist;
    }

    public void setPlist(List<Product> plist) {
        this.plist = plist;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Category category = (Category) o;

        return cid != null ? cid.equals(category.cid) : category.cid == null;
    }

    @Override
    public int hashCode() {
        return cid != null ? cid.hashCode() : 0;
    }

    @Override
    public String toString() {
        return "Category{" +
                "cid='" + cid + '\'' +
                ", cname='" + cname + '\'' +
                ", cstate='" + cstate + '\'' +
                '}';
    }

    public Category(String cid, String cname, String cstate) {
        this.cid = cid;
        this.cname = cname;
        this.cstate = cstate;
    }

    public Category() {
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCstate() {
        return cstate;
    }

    public void setCstate(String cstate) {
        this.cstate = cstate;
    }
}
