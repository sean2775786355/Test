package com.safewind.pms.controller;

import com.safewind.pms.constant.MsgAlertConstant;
import com.safewind.pms.po.Msg;
import com.safewind.pms.po.Role;
import com.safewind.pms.po.RolePermission;
import com.safewind.pms.po.UserRole;
import com.safewind.pms.service.RoleService;
import com.safewind.pms.service.UserService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by 门铎 on 2016/8/21.
 */
@Controller
@RequestMapping("/system")
public class SystemController {
    private static Logger logger = LoggerFactory.getLogger(SystemController.class);

    @Autowired private UserService userService;
    @Autowired private RoleService roleService;
    @Autowired private Msg msg;
    /**
     * 需要超级管理员权限
     * 跳转到用户管理界面
     * @param model
     * @return
     */
    @RequiresRoles("superadmin")
    @RequestMapping("userList")
    public String userList(Model model){
        List<UserRole> userRoleList = userService.getUserRoleList();
        model.addAttribute("userRoleList",userRoleList);
        logger.info("成功将用户和角色映射关系放入前台！");
        List<Role> roleList = roleService.getRolesSelect();
        model.addAttribute("roleList",roleList);
        logger.info("成功将角色菜单穿入前台！");
        //将active高亮菜单传入前台
        model.addAttribute("active","userList");
        return "auth/userList";
    }

    /**
     * ajax 执行更新user-roles关系
     * @param roleIds   用户想要拥有的角色
     * @param userId    用户Id
     * @return  提示信息
     */
    @RequestMapping(value = "userRoleUpdate",method = RequestMethod.POST)
    public @ResponseBody Msg userRoleUpdate(@RequestParam(value = "roleIds[]",defaultValue = "")Long[] roleIds,@RequestParam("userId")Long userId){
        userService.userRoleUpdate(userId,roleIds);
        logger.info("更新用户-角色关系");
        msg.setMsg(MsgAlertConstant.USER_ROLES_UPDATE_SUCCESS);
        return msg;
    }

    /**
     * 跳转到角色列表页面
     * @param model
     * @return
     */
    @RequestMapping("roleList")
    @RequiresRoles("superadmin")
    public String roleList(Model model){
        //获取到role -permission 关系
        List<RolePermission> rolePermissionList = roleService.getRolePerms();
        model.addAttribute("rolePermissionList",rolePermissionList);
        logger.info("成功将角色权限关系放入前台！");
        //将active高亮菜单传入前台
        model.addAttribute("active","roleList");
        return "auth/roleList";
    }

    @RequestMapping("roleList/{roleId}")
    public String updatePermsPage(@PathVariable("roleId")Long roleId,
                                  Model model){
        //将该角色信息role带入
        //将该账户permissions带入
        RolePermission rolePermission = roleService.getRolePermsByRoleId(roleId);
        model.addAttribute("rolePermission",rolePermission);
        logger.info("成功将" + roleId  + "的角色--权限信息放入前台！");
        return "auth/editPerms";
    }
    /**
     * 修改角色--权限关系
     */
    @RequestMapping(value = "editPerms",method = RequestMethod.POST)
    public @ResponseBody Msg editPerms(Role role,@RequestParam(value = "permissionIds[]",defaultValue = "")Long[] permissionIds){
        //role更新到tb_roles
        //permission 关联 roles 存到tb_roles_permissions
        roleService.rolePermissionUpdate(role,permissionIds);
        msg.setMsg(MsgAlertConstant.ROLE_PERMISSION_UPDATE_SUCCESS);
        logger.info(MsgAlertConstant.ROLE_PERMISSION_UPDATE_SUCCESS + "角色:" + role);
        return msg;

    }

    /**
     * 跳转到创建角色页面
     * @param model
     * @return
     */
    @RequestMapping(value = "createRole",method = RequestMethod.GET)
    public String createRole(Model model){
        //将active高亮菜单传入前台
        model.addAttribute("active","createRole");
        return "auth/createRole";
    }

    /**
     * 修改角色--权限关系
     */
    @RequestMapping(value = "insertPerms",method = RequestMethod.POST)
    public @ResponseBody Msg insertPerms(Role role,@RequestParam(value = "permissionIds[]",defaultValue = "")Long[] permissionIds){
        //role创建到tb_roles
        //permission 关联 roles 存到tb_roles_permissions
        roleService.rolePermissionInsert(role,permissionIds);
        msg.setMsg(MsgAlertConstant.ROLE_PERMISSION_INSERT_SUCCESS);
        logger.info(MsgAlertConstant.ROLE_PERMISSION_INSERT_SUCCESS + "角色:" + role);
        return msg;

    }
}
