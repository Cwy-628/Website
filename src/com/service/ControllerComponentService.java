package com.service;

import com.entity.Component;
import com.entity.PageBean;
import com.entity.User;

import java.util.List;

/**
 *
 */
public interface ControllerComponentService {

    //查询所有零件信息
    List<Component> selectAll();

    //新增商品信息
    void add(Component component);

    //修改商品信息
    void update(Component component);

    //删除商品信息
    void delete(int component_id);

    //批量删除
    void deleteByIds(int[] ids);

    //分页查询
    PageBean<Component> selectByPage(int currentPage, int pageSize);

    //分页条件查询
    PageBean<Component> selectByPageAndCondition(int currentPage,int pageSize,Component component);
}
