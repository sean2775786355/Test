<%--
  Created by IntelliJ IDEA.
  User: 门铎
  Date: 2016/8/21
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>船舶管理系统 | 更改权限</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/skins/skin-blue.min.css">
    <!--zTree -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/zTree/css/demo.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/zTree/css/metroStyle.css" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <jsp:include page="../module/head.jsp"/>
    <!-- Left side column. contains the logo and sidebar -->
    <jsp:include page="../module/side-bar.jsp"/>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                系统管理
                <small>新建角色</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index"><i class="fa fa-dashboard"></i>首页</a></li>
                <li><a href="${pageContext.request.contextPath}/system/roleList"><i class="fa fa-dashboard"></i>角色列表</a></li>
                <li class="active">当前</li>
            </ol>
        </section>

        <!-- Main content -->
        <section  class="content">
            <div class="row">
                <div class="box box-default col-xs-12">
                    <!-- form start -->
                        <div class="box-body">
                            <div class="form-group  col-xs-6">
                                <label for="roleName">角色英文名</label>
                                <input type="text" class="form-control" id="roleName" placeholder="请输入英文..."  >
                            </div>
                            <div class="form-group  col-xs-6">
                                <label for="description">角色中文描述</label>
                                <input type="text" class="form-control" id="description" placeholder="请输入中文...">
                            </div>
                            <div class="form-group col-xs-6">
                                <ul id="treeDemo" class="ztree"></ul>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <div class="box-footer">
                            <button id="submit" class="btn btn-primary">确定</button>
                        </div>
                        <div class="modal fade" id="alertMsg" tabindex="-1" role="dialog" aria-labelledby="alertMsg">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">提示信息</h4>
                                    </div>
                                    <div class="modal-body">

                                    </div>
                                    <div class="modal-footer">
                                    </div>
                                </div>
                            </div>
                        </div>

                </div>
            </div>


        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <jsp:include page="../module/foot.jsp" />

</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 2.2.3 -->
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>

<!-- Bootstrap 3.3.6 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>
<!-- DataTables -->
<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- zTree -->
<script src="${pageContext.request.contextPath}/plugins/zTree/js/jquery.ztree.core.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/zTree/js/jquery.ztree.excheck.min.js"></script>

<!--自己写的js文件依赖jQ-->
<script src="${pageContext.request.contextPath}/plugins/aPudding/js/main.js"></script>

<script>
    //zTree 初始化
    var setting = {
        view: {
            selectedMulti: false
        },
        check: {
            enable: true
        },
        data: {
            simpleData: {
                enable: true
            }
        }
    };
    //zTree列表
    var zNodes =[

        { id:1, pId:8, name:"用户列表",checked:false},
        { id:2, pId:8, name:"用户角色修改",checked:false},
        { id:3, pId:8, name:"用户角色删除",checked:false},
        { id:4, pId:9, name:"角色列表",checked:false},
        { id:5, pId:9, name:"角色新建",checked:false},
        { id:6, pId:9, name:"角色权限更新",checked:false},
        { id:7, pId:9, name:"角色删除",checked:false  },
        { id:8, pId:0, name:"用户管理", open:true,checked:false},
        { id:9, pId:0, name:"角色管理",open:true,checked:false},
        { id:10,pId:0, name:"设备管理",open:true,checked:false},
        { id:11,pId:10,name:"cwbt代码新增",checked:false},
        { id:12,pId:10,name:"cwbt代码编辑",checked:false},
        { id:13,pId:10,name:"cwbt代码列表",checked:false},
        { id:14,pId:10,name:"子代码新增",checked:false},
        { id:15,pId:10,name:"子代码编辑",checked:false},
        { id:16,pId:10,name:"子代码列表",checked:false},
        { id:17,pId:10,name:"cwbt代码删除",checked:false},
        { id:18,pId:10,name:"子代码删除",checked:false},
        { id:19,pId:0 ,name:"人员管理",open:true,checked:false},
        { id:20,pId:19,name:"人员新增",checked:false},
        { id:21,pId:19,name:"人员列表",checked:false},
        { id:22,pId:19,name:"人员新增证书",checked:false},
        { id:23,pId:19,name:"人员新增海历",checked:false},
        { id:24,pId:19,name:"查看人员信息",checked:false},
        { id:25,pId:19,name:"删除船员信息",checked:false},
        { id:26,pId:19,name:"删除证书信息",checked:false},
        { id:27,pId:19,name:"删除海历信息",checked:false},
        { id:28,pId:19,name:"人员调配",checked:false},
        { id:30,pId:0,name:"船舶管理",open:true,checked:false},
        { id:31,pId:30,name:"船舶信息",checked:false},
        { id:32,pId:30,name:"本船信息",checked:false},
        { id:33,pId:0,name:"维护保养",open:true,checked:false},
        { id:34,pId:33,name:"分配维护任务(船长)",checked:false},
        { id:35,pId:33,name:"维护审核(船长)",checked:false},
        { id:36,pId:33,name:"维护审核(岸上)",checked:false}


    ];
    //已有权限添加选中状态
    $(function(){
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    });

    //获取角色 名 描述 拥有的权限
    function getParms(){
        var roleId = $('#roleId').attr("placeholder");
        var role = $('#roleName').val();
        var description = $('#description').val();
        var perms = $.fn.zTree.getZTreeObj("treeDemo").getCheckedNodes(true);
        var permissionIds= [];
        //获取勾选的permission
        for(var i =0 ;i<perms.length;i++){
            permissionIds[i] = perms[i].id;
        }
        var data ={
            "id" : roleId,
            "role"  : role,
            "description" : description,
            "permissionIds" : permissionIds
        }
        return data;
    }
    $(function(){
        $('#submit').click(function(){
            var data = getParms();
            submit(data);
        });
    });
    //将数据提交给后台
    function  submit(data) {

        var root = $('#main-header').attr("data-id");
        $.ajax({
            url: root+'/system/insertPerms',
            type: 'POST',
            dataType: 'json',
            data: data,
        }).done(function (data) {
                    //返回提示信息并刷新页面
                    $('#alertMsg .modal-body').html(""+data.msg);
                    $('#alertMsg').modal('show');
                    setTimeout(function () {
                        $('#alertMsg').modal('hide');
                        window.location.href=root+"/system/roleList";
                    },1000*2);
                    //刷新页面
                })
                .fail(function () {
                    console.log("error");
                })
                .always(function () {
                    console.log("complete");
                });

    }
</script>
</body>

</html>
