package com.safewind.pms.service;

import com.safewind.pms.po.Role;
import com.safewind.pms.po.RolePermission;

import java.util.List;

public interface RoleService {

	public Role createRole(Role role);

	public void deleteRole(Long roleId);

	/**
	 * 添加角色-权限之间关系
	 * 
	 * @param roleId
	 * @param permissionIds
	 */
	public void correlationPermissions(Long roleId, Long... permissionIds);

	/**
	 * 移除角色-权限之间关系
	 * 
	 * @param roleId
	 * @param permissionIds
	 */
	public void uncorrelationPermissions(Long roleId, Long... permissionIds);

	/**
	 * 角色下拉菜单初始化
	 * @return
     */
	public List<Role> getRolesSelect();

	/**
	 * 获取role-permission关系
	 * @return
     */
	public List<RolePermission> getRolePerms();

	/**
	 * 通过roleId获取role-permission关系
	 *
	 */
	public RolePermission getRolePermsByRoleId(Long roleId);

	/**
	 * 更新角色信息 ，并且赋予角色相应权限
	 * @param role 角色信息
	 * @param permissonIds	权限ids
     */
	public void rolePermissionUpdate(Role role,Long[] permissonIds);

	/**
	 * 创建角色信息，并且赋予角色相应权限
	 * @param role 角色信息
	 * @param permissonIds	权限ids
     */
	public void rolePermissionInsert(Role role,Long[] permissonIds);
}
