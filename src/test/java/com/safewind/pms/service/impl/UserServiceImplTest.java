//package com.safewind.pms.service.impl;
//
//import com.safewind.pms.po.User;
//import com.safewind.pms.po.UserRole;
//import com.safewind.pms.service.UserService;
//import junit.framework.TestCase;
//import org.junit.Test;
//import org.junit.Before;
//import org.junit.After;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import java.util.Date;
//import java.util.List;
//
///**
//* UserServiceImpl Tester.
//*
//* @author <Authors name>
//* @since <pre>���� 21, 2016</pre>
//* @version 1.0
//*/
//@RunWith(SpringJUnit4ClassRunner.class) // 整合
//@ContextConfiguration(locations="classpath:spring-config.xml") // 加载配置
//public class UserServiceImplTest{
//    /**
//     *
//     * Method: createUser(User user)
//     *
//     */
//    @Autowired UserService userService;
//    @Test
//    public void testCreateUser() throws Exception {
//        User user =new User();
//        user.setSailorId("2220140001");
//        user.setUsername("2220140001");
//        user.setPassword("2220140001");
//        user.setCreateUsername("2220140634");
//        user.setCreateTime(new Date());
//        userService.createUser(user);
//    }
//
//    @Test
//    public void testGetUserRoleList(){
//        List<UserRole> userRoleList = userService.getUserRoleList();
//        System.out.println("测试结果----------------------------");
//        System.out.println(userRoleList.toString());
//        System.out.println("--------------------------------------------");
//    }
//
///**
//*
//* Method: changePassword(Long userId, String newPassword)
//*
//*/
//@Test
//public void testChangePassword() throws Exception {
////TODO: Test goes here...
//}
//
///**
//*
//* Method: correlationRoles(Long userId, Long... roleIds)
//*
//*/
//@Test
//public void testCorrelationRoles() throws Exception {
////TODO: Test goes here...
//}
//
///**
//*
//* Method: uncorrelationRoles(Long userId, Long... roleIds)
//*
//*/
//@Test
//public void testUncorrelationRoles() throws Exception {
////TODO: Test goes here...
//}
//
///**
//*
//* Method: findByUsername(String username)
//*
//*/
//@Test
//public void testFindByUsername() throws Exception {
////TODO: Test goes here...
//}
//
///**
//*
//* Method: findRoles(String username)
//*
//*/
//@Test
//public void testFindRoles() throws Exception {
////TODO: Test goes here...
//}
//
///**
//*
//* Method: findPermissions(String username)
//*
//*/
//@Test
//public void testFindPermissions() throws Exception {
////TODO: Test goes here...
//}
//
///**
//*
//* Method: delete()
//*
//*/
//@Test
//public void testDelete() throws Exception {
////TODO: Test goes here...
//}
//
//
///**
//*
//* Method: exists(Long userId, Long roleId)
//*
//*/
//@Test
//public void testExists() throws Exception {
////TODO: Test goes here...
///*
//try {
//   Method method = UserServiceImpl.getClass().getMethod("exists", Long.class, Long.class);
//   method.setAccessible(true);
//   method.invoke(<Object>, <Parameters>);
//} catch(NoSuchMethodException e) {
//} catch(IllegalAccessException e) {
//} catch(InvocationTargetException e) {
//}
//*/
//}
//
//}
