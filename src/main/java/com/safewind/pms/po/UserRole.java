package com.safewind.pms.po;

import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户---角色 对应实体类
 */
@Repository
public class UserRole {
    private User user;  //用户
    private List<Role> roleList;   //用户对应的角色列表
    private String rolesString;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
    }

    public String getRolesString() {
        return rolesString;
    }

    public void setRolesString(String rolesString) {
        this.rolesString = rolesString;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("UserRole{");
        sb.append("user=").append(user);
        sb.append(", roleList=").append(roleList);
        sb.append(", rolesString='").append(rolesString).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
