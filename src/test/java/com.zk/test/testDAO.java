package com.zk.test;

import com.zk.dao.UserDAO;
import com.zk.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class testDAO {
    @Autowired
    private UserDAO userDAO;

    @Test
    public void testUserDAO(){
        List<User> list = userDAO.queryAllUsers();
        for (User user : list) {
            System.out.println(user.toString());
        }

        System.out.println("===============");

        User with = userDAO.queryUserByUsername("with");
        System.out.println(with.toString());

        System.out.println("===============");

        User user = userDAO.queryUserByEmail("931660526@qq.com");
        System.out.println(user.toString());

        System.out.println("===============");

        Integer newUser = userDAO.insertUser(new User(null, "河图", "123", "951357852@qq.com", null, new Date()));
        System.out.println(newUser.toString());
    }
}
