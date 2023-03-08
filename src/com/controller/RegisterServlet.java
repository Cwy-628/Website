package com.controller;

import com.entity.User;
import com.entity.valueObject.MessageModel;
import com.mapper.UserMapper;
import com.service.RegisterService;
import com.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private RegisterService registerService = new RegisterService();

    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String customer_id = request.getParameter("customer_id");
        String customer_name=request.getParameter("customer_name");
        String customer_pwd=request.getParameter("customer_pwd");
        String customer_tel=request.getParameter("customer_tel");
        String customer_address=request.getParameter("customer_address");
        MessageModel messageModel = registerService.userRegister(customer_id,customer_pwd);

        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper=session.getMapper(UserMapper.class);
        if(messageModel.getCode()==1) {
            User u = new User();
            u.setCustomer_id(customer_id);
            u.setCustomer_name(customer_name);
            u.setCustomer_pwd(customer_pwd);
            u.setCustomer_tel(customer_tel);
            u.setCustomer_address(customer_address);
            int x = userMapper.insertUser(u);
            session.commit();
            if (x >= 1) {
                response.sendRedirect("registerSuccess.jsp");
            }
        }else
        {
            request.setAttribute("messageModel",messageModel);
            request.getRequestDispatcher("register.jsp").forward(request,response);
        }
        session.close();
    }

    public static void main(String[] args) {

    }
}
