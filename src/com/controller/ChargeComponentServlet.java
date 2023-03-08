package com.controller;

import com.entity.Component;
import com.entity.PageBean;
import com.entity.User;
import com.google.gson.Gson;
import com.service.ControllerComponentService;
import com.service.impl.ControllerComponentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

/**
 *管理员管理商品信息
 */
@WebServlet("/component/*")
public class ChargeComponentServlet extends BaseServlet{
    private ControllerComponentService controllerComponentService= new ControllerComponentServiceImpl();

    public void selectAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //调用service查询
        List<Component> components=controllerComponentService.selectAll();

        //2.转换为json
        Gson gson = new Gson();
        String jsonString = gson.toJson(components);

        //3.写数据
        response.setContentType("text/json;charset=utf-8");
        response.getWriter().write(jsonString);
    }

    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setCharacterEncoding("utf-8");
        //1.接收用户信息
        BufferedReader br = request.getReader();
        String params = br.readLine();

        //2.转为User对象
        Gson gson = new Gson();
        Component component = gson.fromJson(params, Component.class);

        //3.调用service添加
        controllerComponentService.add(component);

        //4.响应成功的标识
        response.getWriter().write("success");
    }

    public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setCharacterEncoding("utf-8");
        //1.接收用户信息
        BufferedReader br = request.getReader();
        String params = br.readLine();

        //2.转为User对象
        Gson gson = new Gson();
        Component component = gson.fromJson(params, Component.class);

        //3.调用service添加
        controllerComponentService.update(component);

        //4.响应成功的标识
        response.getWriter().write("success");
    }

    public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setCharacterEncoding("utf-8");
        //1.接收用户信息
        BufferedReader br = request.getReader();
        String params = br.readLine();

        //3.调用service添加
        controllerComponentService.delete(Integer.parseInt(params));

        //4.响应成功的标识
        response.getWriter().write("success");
    }

    //批量删除
    public void deleteByIds(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setCharacterEncoding("utf-8");
        //1.接收用户信息
        BufferedReader br = request.getReader();
        String params = br.readLine();
        //2.转为int类型数组
        Gson gson = new Gson();
        int[] ids = gson.fromJson(params, int[].class);
        //3.调用service层修改
        controllerComponentService.deleteByIds(ids);

        //4.响应成功的标志
        response.getWriter().write("success");
    }

    public void selectByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.接收当前页码和每页展示条数
        String _currentPage = request.getParameter("currentPage");
        String _pageSize = request.getParameter("pageSize");

        int currentPage = Integer.parseInt(_currentPage);
        int pageSize = Integer.parseInt(_pageSize);

        //2.调用service查询
        PageBean<Component> pageBean = controllerComponentService.selectByPage(currentPage,pageSize);

        //3.转换为json
        Gson gson = new Gson();
        String jsonString = gson.toJson(pageBean);

        //3.写数据
        response.setContentType("text/json;charset=utf-8");
        response.getWriter().write(jsonString);
    }


    //分页条件查询
    public void selectByPageAndCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.接收当前页码和每页展示条数
        String _currentPage = request.getParameter("currentPage");
        String _pageSize = request.getParameter("pageSize");

        int currentPage = Integer.parseInt(_currentPage);
        int pageSize = Integer.parseInt(_pageSize);

        BufferedReader br = request.getReader();
        String params = br.readLine();
        //2.转为int类型数组
        Gson gson = new Gson();
        Component component = gson.fromJson(params, Component.class);

        //2.调用service查询
        PageBean<Component> pageBean = controllerComponentService.selectByPageAndCondition(currentPage,pageSize,component);

        //3.转换为json
        String jsonString = gson.toJson(pageBean);

        //3.写数据
        response.setContentType("text/json;charset=utf-8");
        response.getWriter().write(jsonString);
    }
}
