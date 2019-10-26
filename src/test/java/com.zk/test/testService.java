package com.zk.test;

import com.zk.pojo.User;
import com.zk.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class testService {

    @Autowired
    private UserService userService;

    @Test
    public void testUserService() {
        List<User> users = userService.queryAllUsers();
        for (User user : users) {
            System.out.println(user.toString());
        }

        System.out.println("===============");

        User with = userService.queryUserByUsername("with");
        System.out.println(with.toString());

        System.out.println("===============");

        User user = userService.queryUserByEmail("931660526@qq.com");
        System.out.println(user);

        System.out.println("===============");

        Integer newUser = userService.insertUser(new User(null, "玄色", "123456789", "745896321@qq.com", null, new Date()));
        System.out.println(newUser.toString());

    }
}
