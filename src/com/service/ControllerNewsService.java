package com.service;

import com.entity.News;
import com.entity.PageBean;

import java.util.List;

/**
 *
 */
public interface ControllerNewsService {

    //查询所有零件信息
    List<News> selectAll();

    //新增商品信息
    void add(News news);

    //修改商品信息
    void update(News news);

    //删除商品信息
    void delete(int news_id);

    //批量删除
    void deleteByIds(int[] ids);



    //分页条件查询
    PageBean<News> selectByPageAndCondition(int currentPage,int pageSize,News news);
}
