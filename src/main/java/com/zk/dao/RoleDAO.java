package com.zk.dao;

import org.apache.ibatis.annotations.Param;

import java.util.Set;

public interface RoleDAO {
    //通过姓名查询角色信息
    Set<String> queryRoleByName(@Param("username") String username);

}
