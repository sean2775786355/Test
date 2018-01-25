package com.safewind.pms.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.safewind.pms.po.Permission;

import java.util.List;

@Repository
public interface PermissionDao {
	public Long createPermission(Permission permission);

	public void deleteRolePermission(Long permissionId);
	
	public void deletePermission(Long permissionId);

	/**
	 * 根据roleId 查询roleId下的所有权限
	 * @param roleId
	 * @return
     */
	public List<Permission> queryPermsByRoleId(@Param("roleId") Long roleId);
}
