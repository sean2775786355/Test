<%--
  Created by IntelliJ IDEA.
  User: 门铎
  Date: 2016/8/21
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title>side-bar</title>
</head>
<body>
<aside class="main-sidebar">
    <!-- Left side column. contains the logo and sidebar  -->
    <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

            <!-- Sidebar user panel (optional) -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="${pageContext.request.contextPath}/dist/img/user2-160x160.jpg" class="img-circle"
                         alt="User Image">
                </div>
                <div class="pull-left info">
                    <p><shiro:principal/></p>
                    <!-- Status -->
                    <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                </div>
            </div>

            <!--  search form (Optional)
            <form action="#" method="get" class="sidebar-form">
              <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
                      <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                      </button>
                    </span>
              </div>
            </form>
            /.search form -->

            <!-- Sidebar Menu -->
            <ul class="sidebar-menu">
                <li>
                    <a href="${pageContext.request.contextPath}/index">
                        <i class="fa fa-th-list"></i>首页
                    </a>
                </li>
                <li class="treeview serviceDateReport">
                    <a href="">
                        <i class="fa fa-th-list"></i>
                        <span>我的任务</span>
                        <span class="pull-right-container">
                          <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu ">
                        <li class="serviceDateReport"><a
                                href="${pageContext.request.contextPath}/Assign/serviceDateReport"><i
                                class="fa fa-circle-o"></i>工作卡维护报告</a></li>
                    </ul>
                </li>
                <li class="treeview userList roleList createRole">
                    <a href="">
                        <i class="fa fa-th-list"></i>
                        <span>系统管理</span>
                        <span class="pull-right-container">
                          <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu ">
                        <shiro:hasPermission name="system:user:list">
                            <li class="userList"><a href="${pageContext.request.contextPath}/system/userList"><i
                                    class="fa fa-circle-o"></i>用户列表</a></li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="system:role:list">
                            <li class="roleList"><a href="${pageContext.request.contextPath}/system/roleList"><i
                                    class="fa fa-circle-o"></i>角色列表</a></li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="system:role:insert">
                            <li class="createRole"><a href="${pageContext.request.contextPath}/system/createRole"><i
                                    class="fa fa-circle-o"></i>新建角色</a></li>
                        </shiro:hasPermission>
                    </ul>
                </li>
                <li class="treeview cwbtInfo cwbtCodeCreate">
                    <a href="#">
                        <i class="fa fa-th-list"></i>
                        <span>设备管理</span>
                        <span class="pull-right-container">
                          <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu ">
                        <shiro:hasPermission name="cwbt:codeCreate">
                            <li class="cwbtCodeCreate"><a href="${pageContext.request.contextPath}/cwbt/cwbtCodeCreate"><i
                                    class="fa fa-circle-o"></i>新增设备</a></li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="cwbt:codeInfo">
                            <li class="cwbtInfo"><a href="${pageContext.request.contextPath}/cwbt/cwbtInfo"><i
                                    class="fa fa-circle-o"></i>设备列表</a></li>
                        </shiro:hasPermission>
                    </ul>
                </li>
                <li class="treeview sailorAdd sailorList">
                    <a href="#">
                        <i class="fa fa-th-list"></i>
                        <span>人员管理</span>
                        <span class="pull-right-container">
                          <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu ">
                        <shiro:hasPermission name="sailor:sailorAdd">
                            <li class="sailorAdd"><a href="${pageContext.request.contextPath}/Sailor/SailorAdd"><i
                                    class="fa fa-circle-o"></i>新增人员</a></li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sailor:sailorList">
                            <li class="sailorList"><a href="${pageContext.request.contextPath}/Sailor/SailorList"><i
                                    class="fa fa-circle-o"></i>人员调配</a></li>
                        </shiro:hasPermission>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-th-list"></i>
                        <span>船舶管理</span>
                        <span class="pull-right-container">
                          <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu ">
                        <shiro:hasPermission name="boat:boatList">
                            <li><a href="${pageContext.request.contextPath}/Boat/boatList"><i
                                    class="fa fa-circle-o"></i>基本信息(岸上管理者看的)</a></li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="boat:boataa">
                            <li><a href="${pageContext.request.contextPath}/Boat/boataa?txt=0"><i
                                    class="fa fa-circle-o"></i>该船详细信息</a></li>
                        </shiro:hasPermission>
                    </ul>
                </li>
                
                <li class="treeview documentAdd documentList documentApply documentApplyList">
                    <a href="#">
                        <i class="fa fa-th-list"></i>
                        <span>资料管理</span>
                        <span class="pull-right-container">
                          <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu ">

                            <li class="documentAdd"><a href="${pageContext.request.contextPath}/document/documentAdd"><i
                                    class="fa fa-circle-o"></i>新增资料</a></li>

                            <li class="documentList"><a href="${pageContext.request.contextPath}/document/documentList"><i
                                    class="fa fa-circle-o"></i>资料管理</a></li>

                            <li class="documentApply"><a href="${pageContext.request.contextPath}/document/documentApply"><i
                                    class="fa fa-circle-o"></i>资料申请</a></li>

                            <li class="documentApplyList"><a href="${pageContext.request.contextPath}/document/documentApplyList"><i
                                    class="fa fa-circle-o"></i>申请管理</a></li>

                    </ul>
                </li>
                
                <li class="treeview serviceDateAssign serviceDateBocheck serviceDateShcheck serviceDateTemp">
                    <a href="#">
                        <i class="fa fa-th-list"></i>
                        <span>维护保养</span>
                        <span class="pull-right-container">
                          <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu consumableApplyCreate purchaseInfo">
                        <li><a href="#"><i class="fa fa-circle-o"></i>初始化工作卡（岸上）</a></li>
                        <li class="consumableApplyCreate"><a
                                href="${pageContext.request.contextPath}/consumable/consumableApplyCreate"><i
                                class="fa fa-circle-o"></i>提交耗材申请</a></li>
                        <li class="purchaseInfo"><a href="${pageContext.request.contextPath}/consumable/purchaseInfo"><i
                                class="fa fa-circle-o"></i>耗材申请管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/Assign/serviceDateTemp"><i
                                class="fa fa-circle-o"></i>创建临时工作卡（船上）</a></li>
                        <shiro:hasPermission name="Assign:serviceDateAssign">
                            <li class="serviceDateAssign"><a
                                    href="${pageContext.request.contextPath}/Assign/serviceDateAssign"><i
                                    class="fa fa-circle-o"></i>分配维护任务(船长)</a></li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="Assign:serviceDateBocheck">
                            <li class="serviceDateBocheck"><a
                                    href="${pageContext.request.contextPath}/Assign/serviceDateBocheck"><i
                                    class="fa fa-circle-o"></i>维护审核(船长)</a></li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="Assign:serviceDateShcheck">
                            <li class="serviceDateShcheck"><a
                                    href="${pageContext.request.contextPath}/Assign/serviceDateShcheck"><i
                                    class="fa fa-circle-o"></i>维护审核(岸上)</a></li>
                        </shiro:hasPermission>
                    </ul>
                </li>
                <li class="treeview repairFactoryCreate repairFactoryInfo">
                    <a href="#">
                        <i class="fa fa-th-list"></i>
                        <span>维修厂管理</span>
                        <span class="pull-right-container">
                          <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu ">
                        <li class="repairFactoryCreate"><a
                                href="${pageContext.request.contextPath}/repair/repairFactoryCreate"><i
                                class="fa fa-circle-o"></i>新增维修厂</a></li>
                        <li class="repairFactoryInfo"><a
                                href="${pageContext.request.contextPath}/repair/repairFactoryInfo"><i
                                class="fa fa-circle-o"></i>维修厂信息</a></li>
                    </ul>
                </li>

                <li class="treeview repairInfo repairApplyCreate">
                    <a href="#">
                        <i class="fa fa-th-list"></i>
                        <span>船舶维修</span>
                        <span class="pull-right-container">
                          <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu ">
                        <li class="repairApplyCreate"><a
                                href="${pageContext.request.contextPath}/repair/repairApplyCreate"><i
                                class="fa fa-circle-o"></i>维修申请</a></li>
                        <li class="repairInfo"><a href="${pageContext.request.contextPath}/repair/repairInfo"><i
                                class="fa fa-circle-o"></i>维修管理</a></li>
                    </ul>
                </li>

                <li class="treeview consumableCreate consumableInfo consumableInfo">
                    <a href="#">
                        <i class="fa fa-th-list"></i>
                        <span>耗材管理</span>
                        <span class="pull-right-container">
                          <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu ">
                        <li class="consumableCreate"><a
                                href="${pageContext.request.contextPath}/consumable/consumableCreate"><i
                                class="fa fa-circle-o"></i>耗材申请</a></li>
                        <li class="consumableInfo"><a
                                href="${pageContext.request.contextPath}/consumable/consumableInfo"><i
                                class="fa fa-circle-o"></i>耗材信息</a></li>

                    </ul>
                </li>

				<li class="treeview materielCreate materielInfo materielInfo">
                    <a href="#">
                        <i class="fa fa-th-list"></i>
                        <span>物料管理</span>
                        <span class="pull-right-container">
                          <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu ">
                        <li class="materielCreate"><a
                                href="${pageContext.request.contextPath}/materiel/materielCreate"><i
                                class="fa fa-circle-o"></i>物料申请</a></li>
                        <li class="materielInfo"><a
                                href="${pageContext.request.contextPath}/materiel/materielInfo"><i
                                class="fa fa-circle-o"></i>物料信息</a></li>

                    </ul>
                </li>


                <li class="treeview supplierCreate supplierInfo ">
                    <a href="#">
                        <i class="fa fa-th-list"></i>
                        <span>供应商管理</span>
                        <span class="pull-right-container">
                          <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu ">
                        <li class="supplierCreate"><a href="${pageContext.request.contextPath}/supplier/supplierCreate"><i
                                class="fa fa-circle-o"></i>新增供应商</a></li>
                        <li class="supplierInfo"><a href="${pageContext.request.contextPath}/supplier/supplierInfo"><i
                                class="fa fa-circle-o"></i>供应商信息</a></li>
                    </ul>
                </li>
                <li class="treeview supplierCreate supplierInfo ">
                    <a href="#">
                        <i class="fa fa-th-list"></i>
                        <span>岸基发布公告</span>
                        <span class="pull-right-container">
                          <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu ">
                        <li class="supplierCreate"><a href="${pageContext.request.contextPath}/publish/publishForBoat"><i
                                class="fa fa-circle-o"></i>对船舶</a></li>
                        <li class="supplierInfo"><a href="${pageContext.request.contextPath}/publish/publishForSailor"><i
                                class="fa fa-circle-o"></i>对个人</a></li>
                    </ul>
                </li>

				<li class="treeview  checkBoatManageList">
                    <a href="#">
                        <i class="fa fa-th-list"></i>
                        <span>船岸信息</span>
                        <span class="pull-right-container">
                          <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu ">
                            <li class="checkBoatManageList"><a href="${pageContext.request.contextPath}/checkBoatManage/checkBoatManageList"><i
                                    class="fa fa-circle-o"></i>船岸信息列表</a></li>
                    </ul>
                </li>

            </ul>
            <!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
    </aside>

</aside>
</body>
</html>
