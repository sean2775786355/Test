package com.safewind.pms.mapper;

import com.safewind.pms.po.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface UserDao {

	public Set<User> queryUsers();

	public Long createUser(User user);

	public void updateUser(User user);

	public void deleteUser(Long userId);

	public void correlationRoles(@Param("1")Long userId, @Param("2")Long roleId);

	public void uncorrelationRoles(@Param("1")Long userId, @Param("2")Long roleId);

	/**
	 * 根据userId 删除userId的所有角色
	 * @param id
     */
	public void uncorrelationAllRoles(@Param("id")Long id);

	boolean exists(@Param("1")Long userId, @Param("2")Long roleId);

	User findOne(Long userId);

	/**
	 * 根据账户获取登录用户表详细信息
	 * @param username
	 * @return
     */
	User findByUsername(String username);

	Set<String> findRoles(String username);

	Set<String> findPermissions(String username);
	
	void delete1();
	void delete2();
	void delete3();
	void delete4();
	void delete5();
}
