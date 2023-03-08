package com.mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *  从数据库调用所有的商品
 */
public class componentInfo {
    public final static String DRIVER="com.mysql.cj.jdbc.Driver";
    public final static String URL="jdbc:mysql://localhost:3306/componentmaster";
    public final static String DBName="root";
    public final static String DBPass="609250914";

    public static String get_all_com_image(int page){
        int i=0;
        String need_info="";
        String component_id;
        int item_num=get_com_num();
        page-=1;
        //这里因为数据量太少了，所以把每一页的切换变成4，应该是12
        for (i=page*4;i<page*4+12&&i<item_num;i++)
        {
            //设置该电脑的图片，超链接和其名称价格
            component_id=get_com_id(i);
            need_info+=("<div class=\"col-sm-6 col-md-4 col-lg-3 mb-30\">\n" +
                    "\n" +
                    "                        <div class=\"card product-card\">" +
                    "<div class=\"card-body p-0\" style=\"display: inline-block\">\n" +
                    "                                <div class=\"product-thumbnail position-relative\">\n" +
                    "<a href=\"single-product.jsp?"+component_id+"\">\"\n" +
                    "                                        <img class=\"first-img\" src="+get_detail_image(component_id)+"alt=\"thumbnail\">\n" +
                    "                                    </a>\n" +
                    "                                </div>\n" +
                    "                                <div class=\"product-desc\">\n" +
                    "                                    <h3 class=\"title\"><a href=\"allProduct.jsp\">"+get_detail_name(component_id)+"/a></h3>\n" +
                    "                                    <div class=\"star-rating my-10\">\n" +
                    "                                        <span class=\"ion-ios-star\"></span>\n" +
                    "                                        <span class=\"ion-ios-star\"></span>\n" +
                    "                                        <span class=\"ion-ios-star\"></span>\n" +
                    "                                        <span class=\"ion-ios-star\"></span>\n" +
                    "                                        <span class=\"ion-ios-star\"></span>\n" +
                    "                                    </div>\n" +
                    "                                    <h6 class=\"product-price\">"+get_detail_price(component_id)+"</h6>\n" +
                    "                                </div>\n" +
                    "</div>    " +
                    "</div>\n" +
                    "                        <!-- product-list End -->\n" +
                    "                    </div>");
        }
        return need_info;
    }

    //获取零件所有种类的数量
    public static int get_com_num(){
        int i=0;
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        conn=UserDao.getConn();
        String sql="select count(component_id) from component where images_path<>'empty'";
        int need_num=0;
        try
        {
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()) {
                need_num= Integer.parseInt(rs.getString(1));
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }finally{
            UserDao.closeAll(conn, ps, rs);
        }
        return need_num;
    }

    //根据次序（默认的次序，后面考虑做排序以后改）来导出电脑的id
    public static String get_com_id(int num){
        int i=0;
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        conn=UserDao.getConn();
        String sql="select component_id from component where images_path<>'empty'";
        String need_name=null;
        try
        {
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()&&i<=num) {
                need_name=rs.getString(1);
                i++;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }finally{
            UserDao.closeAll(conn, ps, rs);
        }
        return need_name;
    }

    //根据电脑id获取电脑图片地址
    public static String get_detail_image(String component_id){
        return get_id_info("select images_path from component where component_id=?",component_id);
    }

    public static String get_detail_type(String component_id){
        return get_id_info("select component_type from component where component_id=?",component_id);
    }

    public static String get_detail_intro(String component_id){
        return get_id_info("select component_intro from component where component_id=?",component_id);
    }

    public static String get_detail_lintro(String component_id){
        return get_id_info("select component_lintro from component where component_id=?",component_id);
    }

    //根据sql的语句和目标id获取信息
    private static String get_id_info(String sql, String id){
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        conn= UserDao.getConn();
        String need_info=null;
        try
        {
            ps=conn.prepareStatement(sql);
            ps.setString(1,id);
            rs=ps.executeQuery();
            while(rs.next()) {
                need_info=rs.getString(1);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }finally{
            UserDao.closeAll(conn, ps, rs);
        }
        return need_info;
    }

    //根据电脑id获取电脑名称
    public static String get_detail_name(String component_id){
        return get_id_info("select component_info from component where component_id=?",component_id);
    }

    //根据电脑id获取电脑价格
    public static String get_detail_price(String component_id){
        return get_id_info("select component_price from component where component_id=?",component_id);
    }







    //统计订单数量（用于给订单id命名）
    public static int get_orders_num() {
        int orders_num=0;
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        conn=UserDao.getConn();
        String sql_cont="select count(orders_id) from orders";
        try
        {
            ps=conn.prepareStatement(sql_cont);
            rs=ps.executeQuery();
            while(rs.next()) {
                orders_num= Integer.parseInt(rs.getString(1));
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }finally{
            UserDao.closeAll(conn, ps, rs);
        }
        return orders_num;
    }

    //创建订单
    public static int create_order(String customer_id,String component_id,String orders_num){
        int recent_order=get_orders_num()+1;
        String order_id="";
        order_id= String.valueOf(recent_order);

        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        conn=UserDao.getConn();
        String sql="insert into orders(orders_id,component_id,customer_id,orders_num,orders_state)values(?,?,?,?,?)";
        try {
            ps=conn.prepareStatement(sql);
            ps.setString(1,order_id);
            ps.setString(2,component_id);
            ps.setString(3,customer_id);
            ps.setString(4,orders_num);
            ps.setString(5,"待接取");
            return ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            UserDao.closeAll(conn, ps, rs);
        }
        return 0;
    }
}
