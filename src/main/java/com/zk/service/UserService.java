package com.zk.service;

import com.zk.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    //查询所有用户
    List<User> queryAllUsers();

    //通过username查询用户
    User queryUserByUsername(@Param("username") String username);

    //通过email查询用户
    User queryUserByEmail(@Param("email") String email);

    //添加用户
    Integer insertUser(User user);

}
