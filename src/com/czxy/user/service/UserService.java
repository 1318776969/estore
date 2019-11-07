package com.czxy.user.service;

import com.czxy.user.dao.LoginMsgDao;
import com.czxy.user.dao.UserDao;
import com.czxy.user.domain.LoginMsg;
import com.czxy.user.domain.User;
import com.czxy.utils.utils.MyBatisUtils;
import tk.mybatis.mapper.entity.Example;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by xps13 on 2019/5/23.
 */
public class UserService {
    /**
     * 注册用户
     * @param user 待注册的用户
     * @return     注册结果
     *              true:注册成功
     *              false:注册失败
     */
    public boolean register(User user) {
        //1、获取Dao
        UserDao dao = MyBatisUtils.getMapper(UserDao.class);
        //2、通过通用Mapper进行注册
        int row = 0;
        try {
            row = dao.insert(user);
            //3、提交事务并关闭会话
            MyBatisUtils.commitAndClose();
        } catch (Exception e) {
            //出现异常，回滚事务并关闭会话
            MyBatisUtils.rollbackAndClose();
            return false;
        }
        //4、判断并返回结果
        if(row==1){
            return true;
        }
        return false;
    }

    /**
     * 校验用户名是否可用
     * @param username
     * @return        是否可用
     *                  true  可用
     *                  false 不可用
     * SELECT * FROM USER WHERE username = 'yangyang';
     */
    public boolean checkUsername(String username) {
        //1、获取Dao
        UserDao dao = MyBatisUtils.getMapper(UserDao.class);
        //2、条件查询
        //2.1、拼接条件
        Example example = new Example(User.class);
        Example.Criteria c = example.createCriteria();
        c.andEqualTo("username",username);
        //2.2、作条件查询
        List<User> ulist = dao.selectByExample(example);
        //3、关闭会话
        MyBatisUtils.close();
        //4、判断结果
        if(ulist!=null && ulist.size()>0){
            //不可用
            return false;
        }
        return true;
    }

    /**
     * 根据用户名和密码查询用户信息
     * 判断用户登录是否成功
     * @param user  用户名和密码
     * @param ipaddress
     * @return       查询到的用户信息
     *
     * username
     * password
     * ustate=0
     */
    public User login(User user, String ipaddress) {
        //一、判断IP登录错误次数
        //select count(*) from loginmsg where ipaddress = ? and errorTime like '2019-05-27%';
        //1、获取Dao
        LoginMsgDao lmDao0 = MyBatisUtils.getMapper(LoginMsgDao.class);
        //2、条件查询
        //2.1、拼接条件
        Example example0 = new Example(LoginMsg.class);
        Example.Criteria c0 = example0.createCriteria();
        c0.andEqualTo("ipaddress",ipaddress);
        //获取当前系统年月日
        String format = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        c0.andLike("errorTime",format+"%");
        //2.2、条件查询
        int count0 = lmDao0.selectCountByExample(example0);
        //3、关闭会话
        MyBatisUtils.close();
        //4、判断IP错误次数，超过10次，抛出异常
        if(count0>=10){
            throw new RuntimeException("您的IP已被锁定，请明天再进行登录");
        }
        //二、判断用户登录错误次数
        //SELECT COUNT(*) FROM loginmsg WHERE username='zhongzhong' AND errorTime LIKE '2019-05-27%';
        //1、获取Dao
        LoginMsgDao lmDao = MyBatisUtils.getMapper(LoginMsgDao.class);
        //2、条件查询
        //2.1、拼接条件
        Example example1 = new Example(LoginMsg.class);
        Example.Criteria c1 = example1.createCriteria();
        c1.andEqualTo("username",user.getUsername());
        c1.andLike("errorTime",format+"%");
        //2.2、条件查询
        int count = lmDao.selectCountByExample(example1);
        //3、关闭会话
        MyBatisUtils.close();
        //4、判断登录错误次数，超过5次，抛出异常
        if(count>=5){
            throw new RuntimeException("当前用户已锁定");
        }

        //三、根据用户名查询用户信息，进行登录判断
        //1、获取Dao
        UserDao dao = MyBatisUtils.getMapper(UserDao.class);
        //2、根据用户名查询该用户信息
        //2.1、拼接条件
        Example example = new Example(User.class);
        Example.Criteria c = example.createCriteria();
        c.andEqualTo("username",user.getUsername());
        //2.2、作条件查询
        User result = dao.selectOneByExample(example);
        System.out.println(result);
        //关闭会话
        MyBatisUtils.close();
        //3、判断当前查询是否出现问题
        if(result==null){
            //用户名不存在
            //1、向loginmsg中添加错误信息
            //1.1、获取Dao
            LoginMsgDao lmDao2 = MyBatisUtils.getMapper(LoginMsgDao.class);
            //1.2、添加
            lmDao2.insert(new LoginMsg(null,null,null,ipaddress));
            //1.3、提交事务并关闭会话
            MyBatisUtils.commitAndClose();
            //2、向servlet抛出异常
            throw new RuntimeException("用户名不存在");
        }else if(!result.getPassword().equals(user.getPassword())){
            //密码错误
            //1、向loginmsg中添加错误信息
            //1.1、获取Dao
            LoginMsgDao lmDao2 = MyBatisUtils.getMapper(LoginMsgDao.class);
            //1.2、添加
            lmDao2.insert(new LoginMsg(null,user.getUsername(),null,ipaddress));
            //1.3、提交事务并关闭会话
            MyBatisUtils.commitAndClose();
            //2、向servlet抛出异常
            throw new RuntimeException("密码错误，剩余的次数："+(5-count-1)+"次");
        }else if(result.getUstate()!=0){
            //该用户已废弃了
            //1、向loginmsg中添加错误信息
            //1.1、获取Dao
            LoginMsgDao lmDao2 = MyBatisUtils.getMapper(LoginMsgDao.class);
            //1.2、添加
            lmDao2.insert(new LoginMsg(null,null,null,ipaddress));
            //1.3、提交事务并关闭会话
            MyBatisUtils.commitAndClose();
            //2、向servlet抛出异常
            throw new RuntimeException("该用户已废弃了");
        }
        //4、返回查询结果
        return result;

    }
}
