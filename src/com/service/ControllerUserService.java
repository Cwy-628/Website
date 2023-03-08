package com.service;

import com.entity.PageBean;
import com.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;


//管理员后台管理
public interface ControllerUserService {


    List<User> selectAll();

    //新增用户
    void add(User user);

    //修改用户信息
    void update(User user);


    //删除用户信息
    void delete(String customer_id);

    //批量删除
    void deleteByIds( String[] ids);

    //分页查询
    PageBean<User> selectByPage(int currentPage,int pageSize);

    //分页条件查询
    PageBean<User> selectByPageAndCondition(int currentPage,int pageSize,User user);
}
