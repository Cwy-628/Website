package com.mapper;

import com.entity.Admin;
import com.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 *用户接口类
 */
public interface UserMapper {
    public User getUserInfo(String userName);
    public Admin getAdminInfo(String adminName);
    int insertUser(User user);
    public User updateUser(String customer_name,String customer_pwd);



    //查询所有用户信息显示在后台
    @Select("select * from customer")
    List<User> selectAll();

    //新增用户信息
    @Insert("insert into customer values(#{customer_id},#{customer_name},#{customer_pwd},#{customer_tel},#{customer_address})")
    void add(User user);

    //更改用户信息
    @Update("update customer set customer_name=#{customer_name},customer_pwd=#{customer_pwd},customer_tel=#{customer_tel},customer_address=#{customer_address} where customer_id=#{customer_id}")
    void update(User user);

    //删除用户信息
    @Delete({"delete from customer where customer_id = #{customer_id};"})
    void delete(String customer_id);


    //批量删除
    void deleteByIds(@Param("ids") String[] ids);



    //分页查询
    @Select("select * from customer limit #{begin}, #{size}")
    List<User> selectByPage(@Param("begin")int begin, @Param("size")int size);
    //查询总记录数
    @Select("select count(*) from customer")
    int selectTotalCount();


    //分页条件查询(动态sql)
    List<User> selectByPageAndCondition(@Param("begin")int begin, @Param("size")int size,@Param("user") User user);

    //查询条件查找总记录数
    int selectTotalCountByCondition(User user);
}

