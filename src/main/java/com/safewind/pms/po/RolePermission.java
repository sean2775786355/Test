package com.safewind.pms.po;

import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 门铎 on 2016/8/23.
 */
@Repository
public class RolePermission {
    private Role role;
    private List<Permission> permissionList;
    private String permissionString;

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public List<Permission> getPermissionList() {
        return permissionList;
    }

    public void setPermissionList(List<Permission> permissionList) {
        this.permissionList = permissionList;
    }

    public String getPermissionString() {
        return permissionString;
    }
    public void setPermissionString(String permissionString) {
        this.permissionString = permissionString;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("RolePermission{");
        sb.append("role=").append(role);
        sb.append(", permissionList=").append(permissionList);
        sb.append(", permissionString='").append(permissionString).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
