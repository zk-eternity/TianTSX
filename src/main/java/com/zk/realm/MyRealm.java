package com.zk.realm;

import com.zk.pojo.User;
import com.zk.service.PermissionService;
import com.zk.service.RoleService;
import com.zk.service.UserService;
import lombok.Setter;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import java.util.Set;

@Setter
public class MyRealm extends AuthorizingRealm {

    private UserService userService;
    private RoleService roleService;
    private PermissionService permissionService;


    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        System.out.println("在realm中查询权限");
        String username = (String) principals.getPrimaryPrincipal();
        Set<String> roles = roleService.queryAllRolenameByUsername(username);
        Set<String> permissions = permissionService.queryAllPermissionByUsername(username);

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setRoles(roles);
        info.setStringPermissions(permissions);

        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        System.out.println("在realm中查询身份");
        //获取用户信息登录发来的用户名
        String username = (String) token.getPrincipal();
        System.out.println(username);
        User user = userService.queryUserByUsername(username);
        //判断用户信息是否为空
        if (user == null) {
            return null;
        }
        return new SimpleAuthenticationInfo(user.getUsername(),
                user.getPassword(),
                ByteSource.Util.bytes(user.getSalt()),
                this.getName());
    }
}
