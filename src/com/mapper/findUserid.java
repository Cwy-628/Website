package com.mapper;

import com.mapper.BaseDao;
import com.mapper.UserDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;

/**
 *  对用户信息的管理
 */
public class findUserid{
    public final static String DRIVER="com.mysql.cj.jdbc.Driver";
    public final static String URL="jdbc:mysql://localhost:3306/componentmaster";
    public final static String DBName="root";
    public final static String DBPass="609250914";

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

    //获取用户名称
    public static String get_customer_name(String customer_id){
        return get_id_info("select customer_name from customer where customer_id=?",customer_id);
    }
    public  static String get_customer_address(String customer_id){
        return get_id_info("select customer_address from customer where customer_id=?",customer_id);
    }

    public static int update_Userinfo(String customer_id,String customer_name,String customer_pwd){
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        conn= UserDao.getConn();
        String sql = "update customer SET customer_name=?, customer_pwd=? where customer_id=?";
        int x =0;
        try{
            ps=conn.prepareStatement(sql);
            ps.setString(1,customer_name);
            ps.setString(2, customer_pwd);
            ps.setString(3, customer_id);
            x = ps.executeUpdate();
            return x;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            UserDao.closeAll(conn, ps, rs);
        }
        return x;
    }


    //获取用户的订单
    public static String get_customer_orders(String customer_id) {
        String out_html = "<div class=\"myaccount-table table-responsive text-center\">\n" +
                "                                <table class=\"table table-bordered\">\n" +
                "                                    <thead class=\"thead-light\">\n" +
                "                                    <tr>\n" +
                "                                        <th>订单编号</th>\n" +
                "                                        <th>购买人</th>\n" +
                "                                        <th>商品名</th>\n" +
                "                                        <th>状态</th>\n" +
                "                                        <th>价格</th>\n" +
                "                                    </tr></thead>\n" +
                "\n" +
                "                                    <tbody>";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        conn = UserDao.getConn();
        String sql = "select orders.orders_id,customer_name,component_info,orders_state,component_price from orders,component,customer where orders.component_id=component.component_id and customer.customer_id=?";
        String get_data;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, customer_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                out_html += "<tr>";
                get_data = rs.getString(1);
                if (!Objects.equals(get_data, "empty")) {
                    out_html += ("<td>" + get_data + "</td>");
                    out_html += ("<td>" + rs.getString(2) + "</td>");
                    out_html += ("<td>" + rs.getString(3) + "</td>");
                    out_html += ("<td>" + rs.getString(4) + "</td>");
                    out_html += ("<td>" + rs.getString(5) + "</td>");
                }
                out_html+="</tr>";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            UserDao.closeAll(conn, ps, rs);
        }
        out_html += "</tbody>\n" +
                "                                </table>\n" +
                "                            </div>";
        return out_html;
    }


}
