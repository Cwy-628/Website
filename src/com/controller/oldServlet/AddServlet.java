package com.controller.oldServlet;

import com.entity.User;
import com.google.gson.Gson;
import com.service.ControllerUserService;
import com.service.impl.ControllerUserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;

/**
 *
 */
//@WebServlet("/addServlet")
public class AddServlet extends HttpServlet {

    private ControllerUserService controllerUserService=new ControllerUserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.接收用户信息
        BufferedReader br = request.getReader();
        String params = br.readLine();

        //2.转为User对象
        Gson gson = new Gson();
        User user = gson.fromJson(params, User.class);

        //3.调用service添加

        controllerUserService.add(user);

        //4.响应成功的标识
        response.getWriter().write("success");


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
