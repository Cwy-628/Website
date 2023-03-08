package com.test;

import com.entity.User;
import com.mapper.UserMapper;
import com.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

/**
 *
 */
public class test_findUserid {
    public static void main(String[] args) {
        // 获取sqlSession对象
        SqlSession session = GetSqlSession.createSqlSession();
        // 得到对应Mapper
        UserMapper userMapper = session.getMapper(UserMapper.class);
        User u = new User();
        u.setCustomer_id("609250914");
        userMapper.updateUser("Mike","321");
        session.commit();

    }
}
