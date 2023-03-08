package com.controller;

import com.entity.valueObject.MessageModel;
import com.mapper.findUserid;
import com.service.UpdateService;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 *  用户自己修改密码
 */
@WebServlet("/update")
public class UserUpdateServlet extends HttpServlet {
        private  UpdateService updateService=new UpdateService();

    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String customer_id=request.getParameter("customer_id");
        String uname = request.getParameter("customer_name");
        String opwd = request.getParameter("oldpwd");
        String npwd = request.getParameter("newpwd");
        //用于检测原密码与数据库是否一致
        MessageModel messageModel = updateService.userUpdate(uname, opwd);

        if(messageModel.getCode()==1) {
            findUserid.update_Userinfo(customer_id,uname,npwd);
            request.getSession().setAttribute("oldpwd",npwd);
            response.sendRedirect("UserChangeSuccess.jsp");
        }else{
            request.setAttribute("messageModel", messageModel);
            request.getRequestDispatcher("myaccount.jsp").forward(request, response);
        }
    }
}
