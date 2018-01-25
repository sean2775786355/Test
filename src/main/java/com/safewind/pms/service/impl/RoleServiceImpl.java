package com.safewind.pms.service.impl;

import com.alibaba.fastjson.JSON;
import com.safewind.pms.mapper.PermissionDao;
import com.safewind.pms.po.Permission;
import com.safewind.pms.po.RolePermission;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safewind.pms.mapper.RoleDao;
import com.safewind.pms.po.Role;
import com.safewind.pms.service.RoleService;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
	private static Logger logger = LoggerFactory.getLogger(RoleServiceImpl.class);
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private PermissionDao permissionDao;
	public Role createRole(Role role) {
		Long id = roleDao.createRole(role);
		role.setId(id);
		return role;
	}

	public void deleteRole(Long roleId) {
		roleDao.deleteRole(roleId);
	}

	/**
	 * 添加角色-权限之间关系
	 * 
	 * @param roleId
	 * @param permissionIds
	 */
	public void correlationPermissions(Long roleId, Long... permissionIds) {
		if(permissionIds == null || permissionIds.length == 0) {
            return;
        }
		for(Long permissionId : permissionIds) {
            if(!exists(roleId, permissionId)) {
            	roleDao.correlationRoles(roleId, permissionId);
            }
        }
	}

	/**
	 * 移除角色-权限之间关系
	 * 
	 * @param roleId
	 * @param permissionIds
	 */
	public void uncorrelationPermissions(Long roleId, Long... permissionIds) {
		if(permissionIds == null || permissionIds.length == 0) {
            return;
        }
		for(Long permissionId : permissionIds) {
            if(exists(roleId, permissionId)) {
            	roleDao.uncorrelationRoles(roleId, permissionId);
            }
        }
	}
	
	private boolean exists(Long userId, Long roleId) {
        return roleDao.exists(userId, roleId);
    }

	@Override
	public List<Role> getRolesSelect() {
		return roleDao.queryAllRoles();
	}

	/**
	 * 获取role--permission关系
	 * @return 角色-权限关系
     */
	@Override
	public List<RolePermission> getRolePerms() {
		List<RolePermission> rolePermissionList = new ArrayList<>();
		List<Role> roleList = roleDao.queryAllRoles();
		for(Role role :roleList){
			RolePermission rolePermission = new RolePermission();
			rolePermission.setRole(role);
			List<Permission> permissionList = permissionDao.queryPermsByRoleId(role.getId());
			rolePermission.setPermissionList(permissionList);
			String permissionString = listToString(permissionList);
			rolePermission.setPermissionString(permissionString);
			rolePermissionList.add(rolePermission);
		}
        logger.info("成功获取到role-permisson关系！ : " + rolePermissionList.toString());
		return rolePermissionList;
	}

	/**
	 * 根据roleId获取 role-permission关系
	 * @param roleId
	 * @return
     */
	@Override
	public RolePermission getRolePermsByRoleId(Long roleId) {
		RolePermission rolePermission = new RolePermission();
		Role role = roleDao.queryRoleByRoleId(roleId);
		rolePermission.setRole(role);
		List<Permission> permissionList = permissionDao.queryPermsByRoleId(roleId);
		rolePermission.setPermissionList(permissionList);
		rolePermission.setPermissionString(JSON.toJSONString(permissionList));
		return rolePermission;
	}

	@Override
	@Transactional
	public void rolePermissionUpdate(Role role, Long[] permissonIds) {
		roleDao.updateRole(role);
		logger.info("成功更新角色信息！");
		roleDao.uncorrelationAllRolesByRoleId(role.getId());
		for(Long id:permissonIds){
			roleDao.correlationRoles(role.getId(),id);
		}
		logger.info("成功更新角色"+role.getId()+"的权限关联！");
	}
	@Override
	@Transactional
	public void rolePermissionInsert(Role role, Long[] permissonIds) {
		roleDao.createRole(role);
		logger.info("成功新建角色信息！");
		for(Long id:permissonIds){
			roleDao.correlationRoles(role.getId(),id);
		}
		logger.info("成功新建角色"+role.getId()+"的权限关联！");
	}
	/**
	 * list --->String  逗号分隔
	 */
	protected   String listToString(List<Permission> oList){
		if(oList.size() == 0){
			return "";
		}
		StringBuilder sb = new StringBuilder("");

		for(Permission o:oList){
			sb.append(o.getDescription() + ",");
		}
		String result = sb.toString();
		result = result.substring(0,result.length()-1);
		return result;
	}
}
