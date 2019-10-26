package com.zk.service;

import com.zk.dao.UserDAO;
import com.zk.pojo.User;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Override
    public List<User> queryAllUsers() {
        return userDAO.queryAllUsers();
    }

    @Override
    public User queryUserByUsername(String username) {
        return userDAO.queryUserByUsername(username);
    }

    @Override
    public User queryUserByEmail(String email) {
        return userDAO.queryUserByEmail(email);
    }

    @Override
    public Integer insertUser(User user) {
        user.setTimes(new Date());
        String salt = UUID.randomUUID().toString();
        String newPassword = new Sha256Hash(user.getPassword(), salt, 10000).toBase64();
        user.setSalt(salt);
        user.setPassword(newPassword);
        return userDAO.insertUser(user);
    }
}
