package com.service.impl;

import com.entity.PageBean;
import com.entity.User;
import com.mapper.UserMapper;
import com.service.ControllerUserService;
import com.util.GetSqlSession;
import com.util.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class ControllerUserServiceImpl implements ControllerUserService {

    //1.创建SqlSessionFactory工厂对象
    SqlSessionFactory factory= SqlSessionFactoryUtils.getSqlSessionFactory();



    @Override
    public List<User> selectAll() {

        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        //4.调用方法
        List<User> users = mapper.selectAll();

        //5.释放资源
        sqlSession.close();
        return users;
    }

    @Override
    public void add(User user) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        //调用方法
        mapper.add(user);
        sqlSession.commit();
        sqlSession.close();
    }

    @Override
    public void update(User user) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        //调用方法
        mapper.update(user);

        sqlSession.commit();

        sqlSession.close();
    }

    @Override
    public void delete(String customer_id) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        //调用方法
        mapper.delete(customer_id);

        sqlSession.commit();

        sqlSession.close();
    }

    @Override
    public void deleteByIds(String[] ids) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        //调用方法
        mapper.deleteByIds(ids);

        sqlSession.commit();

        sqlSession.close();
    }

    @Override
    public PageBean<User> selectByPage(int currentPage, int pageSize) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        //4.开始索引
        int begin = ( currentPage -1) * pageSize;
        //计算查询条目数
        int size = pageSize;

        //5.查询当前页数据
        List<User> rows = mapper.selectByPage(begin, size);

        //6.查询总记录数
        int totalCount = mapper.selectTotalCount();

        //7.封装PageBean对象
        PageBean<User> pageBean = new PageBean<>();
        pageBean.setRows(rows);
        pageBean.setTotalCount(totalCount);

        sqlSession.close();
        return pageBean;
    }

    @Override
    public PageBean<User> selectByPageAndCondition(int currentPage, int pageSize, User user) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        //4.开始索引
        int begin = ( currentPage -1) * pageSize;
        //计算查询条目数
        int size = pageSize;

        //处理user条件，模糊表达式
        String customer_name = user.getCustomer_name();
        if(customer_name != null && customer_name.length()>0){
            user.setCustomer_name("%"+customer_name+"%");
        }


        //5.查询当前页数据
        List<User> rows = mapper.selectByPageAndCondition(begin, size,user);

        //6.查询总记录数
        int totalCount = mapper.selectTotalCountByCondition(user);

        //7.封装PageBean对象
        PageBean<User> pageBean = new PageBean<>();
        pageBean.setRows(rows);
        pageBean.setTotalCount(totalCount);

        sqlSession.close();
        return pageBean;
    }


}
