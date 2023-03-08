package com.service;

import com.entity.Admin;
import com.entity.User;
import com.entity.valueObject.MessageModel;
import com.mapper.UserMapper;
import com.util.GetSqlSession;
import com.util.StringUtil;
import org.apache.ibatis.session.SqlSession;

/**
 *用户更新个人信息业务层
 */
public class UpdateService {
    public MessageModel userUpdate(String uname, String upwd) {

        MessageModel messageModel = new MessageModel();

        //回显
        User u = new User();
        u.setCustomer_name(uname);
        u.setCustomer_pwd(upwd);
        messageModel.setObject(u);

        //参数非空判断
        if(StringUtil.isEmpty(uname) || StringUtil.isEmpty(upwd)){
            //将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            messageModel.setMsg("用户名和密码不能为空");
            //回显
            return messageModel;
        }

        //2. 调用dao层的查询方法，通过用户名查询用户对象
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper=session.getMapper(UserMapper.class);
        User user = userMapper.getUserInfo(uname);


        //4. 判断数据库中查询到的用户密码与前台传递过来的密码作比较
        //如果不相等，将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
//        if(!upwd.equals(user.getCustomer_pwd())){
//            messageModel.setCode(0);
//            messageModel.setMsg("用户密码不正确");
//            return messageModel;
//        }

        //登陆成功，将用户信息设置到消息模型中
        messageModel.setObject(user);
        return  messageModel;
    }


}
