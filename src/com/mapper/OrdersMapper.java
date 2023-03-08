package com.mapper;

import com.entity.Component;
import com.entity.Orders;
import com.entity.getOrders;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 *
 */
public interface OrdersMapper {

    //查询所有订单信息显示在后台
//    @Select("select * from orders")
    List<getOrders> selectAll();

    //修改商品信息
    @Update("update orders set orders_state=#{orders_state} where orders_id=#{orders_id}")
    void update(Orders orders);

    //删除商品信息
    @Delete({"delete from orders where orders_id = #{orders_id};"})
    void delete(int orders_id);

    //分页查询
    @Select("select * from orders limit #{begin}, #{size}")
    List<Orders> selectByPage(@Param("begin")int begin, @Param("size")int size);
    //查询总记录数
    @Select("select count(*) from orders")
    int selectTotalCount();




    //批量删除
    void deleteByIds(@Param("ids") int[] ids);

    //分页条件查询(动态sql)
    List<Orders> selectByPageAndCondition(@Param("begin")int begin, @Param("size")int size,@Param("orders") Orders orders);

    //查询条件查找总记录数
    int selectTotalCountByCondition(Orders orders_id);


}
