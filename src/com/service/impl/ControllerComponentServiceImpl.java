package com.service.impl;

import com.entity.Component;
import com.entity.PageBean;
import com.entity.User;
import com.mapper.ComponentMapper;
import com.mapper.UserMapper;
import com.service.ControllerComponentService;
import com.util.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

/**
 *
 */
public class ControllerComponentServiceImpl implements ControllerComponentService {

    //1.创建SqlSessionFactory工厂对象
    SqlSessionFactory factory= SqlSessionFactoryUtils.getSqlSessionFactory();


    @Override
    public List<Component> selectAll() {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        ComponentMapper mapper = sqlSession.getMapper(ComponentMapper.class);
        //4.调用方法
        List<Component> components = mapper.selectAll();

        //5.释放资源
        sqlSession.close();
        return components;
    }

    @Override
    public void add(Component component) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        ComponentMapper mapper = sqlSession.getMapper(ComponentMapper.class);
        //调用方法
        mapper.add(component);
        sqlSession.commit();
        sqlSession.close();
    }

    @Override
    public void update(Component component) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        ComponentMapper mapper = sqlSession.getMapper(ComponentMapper.class);
        //调用方法
        mapper.update(component);
        sqlSession.commit();
        sqlSession.close();
    }

    @Override
    public void delete(int component_id) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        ComponentMapper mapper = sqlSession.getMapper(ComponentMapper.class);
        //调用方法
        mapper.delete(component_id);
        sqlSession.commit();
        sqlSession.close();
    }

    @Override
    public void deleteByIds(int[] ids) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        ComponentMapper mapper = sqlSession.getMapper(ComponentMapper.class);
        //调用方法
        mapper.deleteByIds(ids);

        sqlSession.commit();

        sqlSession.close();
    }

    @Override
    public PageBean<Component> selectByPage(int currentPage, int pageSize) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        ComponentMapper mapper = sqlSession.getMapper(ComponentMapper.class);
        //4.开始索引
        int begin = ( currentPage -1) * pageSize;
        //计算查询条目数
        int size = pageSize;

        //5.查询当前页数据
        List<Component> rows = mapper.selectByPage(begin, size);

        //6.查询总记录数
        int totalCount = mapper.selectTotalCount();

        //7.封装PageBean对象
        PageBean<Component> pageBean = new PageBean<>();
        pageBean.setRows(rows);
        pageBean.setTotalCount(totalCount);

        sqlSession.close();
        return pageBean;
    }

    @Override
    public PageBean<Component> selectByPageAndCondition(int currentPage, int pageSize, Component component) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        ComponentMapper mapper = sqlSession.getMapper(ComponentMapper.class);
        //4.开始索引
        int begin = ( currentPage -1) * pageSize;
        //计算查询条目数
        int size = pageSize;

        //处理user条件，模糊表达式
        String component_type = component.getComponent_type();
        if(component_type != null && component_type.length()>0){
            component.setComponent_type("%"+component_type+"%");
        }


        //5.查询当前页数据
        List<Component> rows = mapper.selectByPageAndCondition(begin, size,component);

        //6.查询总记录数
        int totalCount = mapper.selectTotalCountByCondition(component);

        //7.封装PageBean对象
        PageBean<Component> pageBean = new PageBean<>();
        pageBean.setRows(rows);
        pageBean.setTotalCount(totalCount);

        sqlSession.close();
        return pageBean;
    }
    
}
