package com.service.impl;

import com.entity.Component;
import com.entity.Orders;
import com.entity.PageBean;
import com.entity.getOrders;
import com.mapper.ComponentMapper;
import com.mapper.OrdersMapper;
import com.service.ControllerOrdersService;
import com.util.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

/**
 *
 */
public class ControllerOrdersServiceImpl implements ControllerOrdersService {

    //1.创建SqlSessionFactory工厂对象
    SqlSessionFactory factory= SqlSessionFactoryUtils.getSqlSessionFactory();
    @Override
    public List<getOrders> selectAll() {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        OrdersMapper mapper = sqlSession.getMapper(OrdersMapper.class);
        //4.调用方法
        List<getOrders> orders = mapper.selectAll();

        //5.释放资源
        sqlSession.close();
        return orders;
    }

    @Override
    public void update(Orders orders) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        OrdersMapper mapper = sqlSession.getMapper(OrdersMapper.class);
        //调用方法
        mapper.update(orders);
        sqlSession.commit();
        sqlSession.close();
    }

    @Override
    public void delete(int orders_id) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        OrdersMapper mapper = sqlSession.getMapper(OrdersMapper.class);
        //调用方法
        mapper.delete(orders_id);
        sqlSession.commit();
        sqlSession.close();
    }

    @Override
    public void deleteByIds(int[] ids) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        OrdersMapper mapper = sqlSession.getMapper(OrdersMapper.class);
        //调用方法
        mapper.deleteByIds(ids);
        sqlSession.commit();
        sqlSession.close();
    }

    @Override
    public PageBean<Orders> selectByPage(int currentPage, int pageSize) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        OrdersMapper mapper = sqlSession.getMapper(OrdersMapper.class);
        //4.开始索引
        int begin = ( currentPage -1) * pageSize;
        //计算查询条目数
        int size = pageSize;

        //5.查询当前页数据
        List<Orders> rows = mapper.selectByPage(begin, size);

        //6.查询总记录数
        int totalCount = mapper.selectTotalCount();

        //7.封装PageBean对象
        PageBean<Orders> pageBean = new PageBean<>();
        pageBean.setRows(rows);
        pageBean.setTotalCount(totalCount);

        sqlSession.close();
        return pageBean;
    }

    @Override
    public PageBean<Orders> selectByPageAndCondition(int currentPage, int pageSize, Orders orders) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        OrdersMapper mapper = sqlSession.getMapper(OrdersMapper.class);
        //4.开始索引
        int begin = ( currentPage -1) * pageSize;
        //计算查询条目数
        int size = pageSize;

        //处理user条件，模糊表达式
        String orders_state = orders.getOrders_state();
        if(orders_state != null && orders_state.length()>0){
            orders.setOrders_state("%"+orders_state+"%");
        }


        //5.查询当前页数据
        List<Orders> rows = mapper.selectByPageAndCondition(begin, size,orders);

        //6.查询总记录数
        int totalCount = mapper.selectTotalCountByCondition(orders);

        //7.封装PageBean对象
        PageBean<Orders> pageBean = new PageBean<>();
        pageBean.setRows(rows);
        pageBean.setTotalCount(totalCount);

        sqlSession.close();
        return pageBean;
    }
}
