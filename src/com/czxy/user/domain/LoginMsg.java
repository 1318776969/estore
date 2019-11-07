package com.czxy.user.domain;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by xps13 on 2019/5/27.
 */
@Table(name="loginmsg")
public class LoginMsg implements Serializable{
    @Id
    private Integer lmid;
    private String username;//#用户名
    @Column(name="errorTime")
    private Date errorTime;//#登录的出错时间
    private String ipaddress;//#ip地址

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        LoginMsg loginMsg = (LoginMsg) o;

        return lmid != null ? lmid.equals(loginMsg.lmid) : loginMsg.lmid == null;
    }

    @Override
    public int hashCode() {
        return lmid != null ? lmid.hashCode() : 0;
    }

    @Override
    public String toString() {
        return "LoginMsg{" +
                "lmid=" + lmid +
                ", username='" + username + '\'' +
                ", errorTime=" + errorTime +
                ", ipaddress='" + ipaddress + '\'' +
                '}';
    }

    public LoginMsg(Integer lmid, String username, Date errorTime, String ipaddress) {
        this.lmid = lmid;
        this.username = username;
        this.errorTime = errorTime;
        this.ipaddress = ipaddress;
    }

    public LoginMsg() {
    }

    public Integer getLmid() {
        return lmid;
    }

    public void setLmid(Integer lmid) {
        this.lmid = lmid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getErrorTime() {
        return errorTime;
    }

    public void setErrorTime(Date errorTime) {
        this.errorTime = errorTime;
    }

    public String getIpaddress() {
        return ipaddress;
    }

    public void setIpaddress(String ipaddress) {
        this.ipaddress = ipaddress;
    }
}
