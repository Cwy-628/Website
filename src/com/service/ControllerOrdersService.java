package com.service;

import com.entity.Component;
import com.entity.Orders;
import com.entity.PageBean;
import com.entity.getOrders;

import java.util.List;

/**
 *
 */
public interface ControllerOrdersService {

    List<getOrders> selectAll();

    //修改商品信息
    void update(Orders orders);

    //删除商品信息
    void delete(int orders_id);

    //批量删除
    void deleteByIds(int[] ids);

    //分页查询
    PageBean<Orders> selectByPage(int currentPage, int pageSize);

    //分页条件查询
    PageBean<Orders> selectByPageAndCondition(int currentPage,int pageSize,Orders orders);
}
