package com.safewind.pms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safewind.pms.mapper.PermissionDao;
import com.safewind.pms.po.Permission;
import com.safewind.pms.service.PermissionService;

@Service
public class PermissionServiceImpl implements PermissionService {
	@Autowired
	private PermissionDao permissionDao;

	public Permission createPermission(Permission permission) {
		Long id = permissionDao.createPermission(permission);
		permission.setId(id);
		return permission;
	}

	public void deletePermission(Long permissionId) {
		permissionDao.deletePermission(permissionId);
	}

}
