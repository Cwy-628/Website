package com.test;

import com.entity.Admin;
import com.entity.User;
import com.mapper.UserMapper;
import com.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

public class test {
    public static void main(String[] args) {
        // 获取sqlSession对象
        SqlSession session = GetSqlSession.createSqlSession();
        // 得到对应Mapper
        UserMapper userMapper = session.getMapper(UserMapper.class);
        System.out.println(userMapper);
        // 调用方法，返回用户对象
        User u = new User();
        u.setCustomer_id("abcd");
        u.setCustomer_name("abcd");
        u.setCustomer_pwd("abcd");
        u.setCustomer_tel("abcd");
        u.setCustomer_address("abcd");

        userMapper.insertUser(u);
        session.commit();
    }
}
