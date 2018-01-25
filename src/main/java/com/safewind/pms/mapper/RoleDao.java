package com.safewind.pms.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.safewind.pms.po.Role;

import java.util.List;

@Repository
public interface RoleDao {

	Long createRole(Role role);

	void deleteRole(Long roleId);

	void updateRole(@Param("role") Role role);

	void deleteUserRole(Long roleId);

	void correlationRoles(Long roleId, Long permissionId);

	void uncorrelationRoles(Long roleId, Long permissionId);

	/**
	 * 删除该roleId的所有权限
	 * @param roleId
     */
	void uncorrelationAllRolesByRoleId(@Param("roleId") Long roleId);

	boolean exists(Long roleId, Long permissionId);

	List<Role> queryRoles(@Param("roleId") String roleId);

	List<Role>  queryRolesByUserId(@Param("id")long id);

	List<Role> queryAllRoles();

	Role queryRoleByRoleId(@Param("roleId")Long roleId);
}
