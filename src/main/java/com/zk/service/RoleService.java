package com.zk.service;

import org.apache.ibatis.annotations.Param;

import java.util.Set;

public interface RoleService {
    Set<String> queryAllRolenameByUsername(@Param("username") String username);
}
