package com.zk.service;

import java.util.Set;

public interface PermissionService {
    Set<String> queryAllPermissionByUsername(String username);
}
