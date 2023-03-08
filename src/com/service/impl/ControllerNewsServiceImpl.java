package com.service.impl;

import com.entity.Component;
import com.entity.News;
import com.entity.PageBean;
import com.mapper.NewsMapper;
import com.service.ControllerNewsService;
import com.util.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

/**
 *
 */
public class ControllerNewsServiceImpl implements ControllerNewsService {

    //1.创建SqlSessionFactory工厂对象
    SqlSessionFactory factory= SqlSessionFactoryUtils.getSqlSessionFactory();

    @Override
    public List<News> selectAll() {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        NewsMapper mapper = sqlSession.getMapper(NewsMapper.class);
        //4.调用方法
        List<News> news = mapper.selectAll();

        //5.释放资源
        sqlSession.close();
        return news;
    }

    @Override
    public void add(News news) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        NewsMapper mapper = sqlSession.getMapper(NewsMapper.class);
        //调用方法
        mapper.add(news);
        sqlSession.commit();
        sqlSession.close();
    }

    @Override
    public void update(News news) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        NewsMapper mapper = sqlSession.getMapper(NewsMapper.class);
        //调用方法
        mapper.update(news);
        sqlSession.commit();
        sqlSession.close();
    }

    @Override
    public void delete(int news_id) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        NewsMapper mapper = sqlSession.getMapper(NewsMapper.class);
        //调用方法
        mapper.delete(news_id);
        sqlSession.commit();
        sqlSession.close();
    }

    @Override
    public void deleteByIds(int[] ids) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        NewsMapper mapper = sqlSession.getMapper(NewsMapper.class);
        //调用方法
        mapper.deleteByIds(ids);

        sqlSession.commit();

        sqlSession.close();
    }



    @Override
    public PageBean<News> selectByPageAndCondition(int currentPage, int pageSize, News news) {
        //2.获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3.获取对应的mapper
        NewsMapper mapper = sqlSession.getMapper(NewsMapper.class);
        //4.开始索引
        int begin = ( currentPage -1) * pageSize;
        //计算查询条目数
        int size = pageSize;

        //处理user条件，模糊表达式
        String news_content = news.getNews_content();
        if(news_content != null && news_content.length()>0){
            news.setNews_content("%"+news_content+"%");
        }


        //5.查询当前页数据
        List<News> rows = mapper.selectByPageAndCondition(begin, size,news);

        //6.查询总记录数
        int totalCount = mapper.selectTotalCountByCondition(news);

        //7.封装PageBean对象
        PageBean<News> pageBean = new PageBean<>();
        pageBean.setRows(rows);
        pageBean.setTotalCount(totalCount);

        sqlSession.close();
        return pageBean;
    }
}
