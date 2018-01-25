package com.safewind.pms.service;

import com.safewind.pms.po.Permission;


public interface PermissionService {
	public Permission createPermission(Permission permission);

	public void deletePermission(Long permissionId);
}
