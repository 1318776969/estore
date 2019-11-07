package com.czxy;

import com.czxy.user.dao.LoginMsgDao;
import com.czxy.user.domain.LoginMsg;
import com.czxy.utils.utils.MyBatisUtils;
import tk.mybatis.mapper.entity.Example;

/**
 * Created by xps13 on 2019/5/27.
 */
public class Test03 {
    public static void main(String[] args) {
        //模拟登录次数校验
        //SELECT COUNT(*) FROM loginmsg WHERE username='zhongzhong' AND errorTime LIKE '2019-05-27%';
        //1、获取Dao
        LoginMsgDao lmDao = MyBatisUtils.getMapper(LoginMsgDao.class);
        //2、条件查询
        //2.1、拼接条件
        Example example = new Example(LoginMsg.class);
        Example.Criteria c = example.createCriteria();
        c.andEqualTo("username","zhongzhong");
        c.andLike("errorTime","2019-05-27%");
        //2.2、条件查询
        int count = lmDao.selectCountByExample(example);
        //3、关闭会话
        MyBatisUtils.close();
        System.out.println(count);
    }
}
