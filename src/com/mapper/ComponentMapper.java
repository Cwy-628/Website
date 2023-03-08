package com.mapper;

import com.entity.Component;
import com.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 *
 */
public interface ComponentMapper {


    //查询所有商品信息显示在后台
    @Select("select * from component")
    List<Component> selectAll();

    //新增商品

    @Insert("insert into component values(null,#{component_type},#{component_price},#{component_info},#{component_intro},#{sales_volume})")
    void add(Component component);

    //修改商品信息
    @Update("update component set component_type=#{component_type},component_price=#{component_price},component_info=#{component_info},component_comment=#{component_comment},sales_volume=#{sales_volume} where component_id=#{component_id}")
    void update(Component component);

    //删除商品信息
    @Delete({"delete from component where component_id = #{component_id};"})
    void delete(int component_id);

    //批量删除
    void deleteByIds(@Param("ids") int[] ids);


    //分页查询
    @Select("select * from component limit #{begin}, #{size}")
    List<Component> selectByPage(@Param("begin")int begin, @Param("size")int size);
    //查询总记录数
    @Select("select count(*) from component")
    int selectTotalCount();


    //分页条件查询(动态sql)
    List<Component> selectByPageAndCondition(@Param("begin")int begin, @Param("size")int size,@Param("component") Component component);

    //查询条件查找总记录数
    int selectTotalCountByCondition(Component component);
}
