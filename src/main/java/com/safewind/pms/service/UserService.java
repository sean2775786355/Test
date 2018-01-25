package com.safewind.pms.service;

import java.util.List;
import java.util.Set;

import com.safewind.pms.po.User;
import com.safewind.pms.po.UserRole;

public interface UserService {
	/**
	 * 获取用户--角色对应关系
	 */
	public List<UserRole> getUserRoleList();
	/**
	 * 创建用户
	 * 
	 * @param user
	 */
	public User createUser(User user);

	/**
	 * 修改密码
	 * 
	 * @param userId
	 * @param newPassword
	 */
	public void changePassword(Long userId, String newPassword);

	/**
	 * 添加用户-角色关系
	 * 
	 * @param userId
	 * @param roleIds
	 */
	public void correlationRoles(Long userId, Long... roleIds);

	/**
	 * 移除用户-角色关系
	 * 
	 * @param userId
	 * @param roleIds
	 */
	public void uncorrelationRoles(Long userId, Long... roleIds);

	/**
	 * 根据用户名查找用户
	 * 
	 * @param username
	 * @return
	 */
	public User findByUsername(String username);

	/**
	 * 根据用户名查找其角色
	 * 
	 * @param username
	 * @return
	 */
	public Set<String> findRoles(String username);

	/**
	 * 根据用户名查找其权限
	 * 
	 * @param username
	 * @return
	 */
	public Set<String> findPermissions(String username);
	
	public void delete();

	/**
	 * 更新用户-角色关系
	 * @param userId
	 * @param roleIds
     */
	public void userRoleUpdate(Long userId,Long... roleIds);
}