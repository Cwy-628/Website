package com.mapper;

import com.entity.News;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 *
 */
public interface NewsMapper {
    //查询所有商品信息显示在后台
    @Select("select * from news")
    List<News> selectAll();

    //新增商品

    @Insert("insert into news values(#{news_id},#{news_content},#{news_ptime},#{controller_id})")
    void add(News news);

    //修改商品信息
    @Update("update news set news_content=#{news_content},news_ptime=#{news_ptime},controller_id=#{controller_id} where news_id=#{news_id}")
    void update(News news);

    //删除商品信息
    @Delete({"delete from news where news_id = #{news_id};"})
    void delete(int news_id);

    //批量删除
    void deleteByIds(@Param("ids") int[] ids);

    //分页条件查询(动态sql)
    List<News> selectByPageAndCondition(@Param("begin")int begin, @Param("size")int size,@Param("news") News news);

    //查询条件查找总记录数
    int selectTotalCountByCondition(News news);
}
