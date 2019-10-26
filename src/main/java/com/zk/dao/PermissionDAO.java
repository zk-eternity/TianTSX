package com.zk.dao;

import org.apache.ibatis.annotations.Param;

import java.util.Set;

public interface PermissionDAO {

    Set<String> queryPermissionByName(@Param("username") String username);

}
