<%--
  Created by IntelliJ IDEA.
  User: 门铎
  Date: 2016/8/21
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户管理 | Starter</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/skins/skin-blue.min.css">
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
                <small>用户列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index"><i class="fa fa-dashboard"></i>首页</a></li>
                <li class="active">当前</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div id="box" class="box">
                        <!-- load动画 我不停的旋转-->

                        <div class="box-header with-border">
                            <h3 class="box-title">
                            </h3>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="user-list" class="table table-bordered">
                                <thead>
                                <tr>
                                    <th style="width: 40px">id</th>
                                    <th>账户</th>
                                    <th>角色</th>
                                    <td>状态</td>
                                    <th style="width:120px">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="userRole" items="${userRoleList}">
                                    <tr>
                                        <td>${userRole.user.id}</td>
                                        <td>${userRole.user.username}</td>
                                        <td>${userRole.rolesString}</td>
                                        <td>${userRole.user.locked}</td>
                                        <td>
                                            <shiro:hasPermission name="system:user:update">
                                            <button type="button" class="btn btn-primary btn-xs" data-toggle="modal"
                                                    data-target="#updateRole"
                                                    data-userid="${userRole.user.id}"
                                                    data-username="${userRole.user.username}">
                                                <span>添加角色</span>
                                            </button>
                                            </shiro:hasPermission>
                                            <shiro:hasPermission name="system:user:delete">
                                            <button type="button" class="btn btn-danger btn-xs" data-toggle="modal"
                                                    data-target="#alertMsg"
                                                    data-userid="${userRole.user.id}"
                                                    data-username="${userRole.user.username}">
                                                <span>删除用户</span>
                                            </button>
                                            </shiro:hasPermission>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                </tfoot>
                                <!-- 添加角色模态框 -->
                                <div class="modal fade" id="updateRole" tabindex="-1" role="dialog"
                                     aria-labelledby="updateRole">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close"><span aria-hidden="true">&times;</span>
                                                </button>
                                                <h4 class="modal-title">变更角色</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form>
                                                    <div class="form-group">
                                                        <label>账户</label>
                                                        <input type="text" id="userName" class="form-control" userId=""
                                                               placeholder="" disabled="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>角色列表</label>
                                                        <select id="roleSelect" class="form-control select2"
                                                                multiple="multiple" data-placeholder="Select a State"
                                                                style="width: 100%;">
                                                            <c:forEach var="role" items="${roleList}">
                                                                <option value="${role.id}"
                                                                        title="${role.role}">${role.description}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                                </button>
                                                <shiro:hasPermission name="system:user:update">
                                                <button type="button" id="submit" class="btn btn-primary"
                                                        data-dismiss="modal">确定
                                                </button>
                                                </shiro:hasPermission>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!--删除用户模态框-->
                                <div class="modal fade" id="deleteUser" tabindex="-1" role="dialog"
                                     aria-labelledby="deleteUser">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close"><span aria-hidden="true">&times;</span>
                                                </button>
                                                <h4 class="modal-title">提示信息</h4>
                                            </div>
                                            <div class="modal-body">

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                                </button>
                                                <shiro:hasPermission name="system:user:delete">
                                                <button type="button" id="delete" class="btn btn-primary"
                                                        data-dismiss="modal">确定
                                                </button>
                                                </shiro:hasPermission>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--删除用户模态框-->
                                <div class="modal fade" id="alertMsg" tabindex="-1" role="dialog"
                                     aria-labelledby="alertMsg">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close"><span aria-hidden="true">&times;</span>
                                                </button>
                                                <h4 class="modal-title">提示信息</h4>
                                            </div>
                                            <div class="modal-body">

                                            </div>
                                            <div class="modal-footer">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </table>


                        </div>
                    </div>
                    <!-- /.box -->
                </div>
            </div>


        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <jsp:include page="../module/foot.jsp"/>

</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 2.2.3 -->
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>
<!-- Select2 -->
<script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<!-- DataTables -->
<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!--自己写的js文件依赖jQ-->
<script src="${pageContext.request.contextPath}/plugins/aPudding/js/main.js"></script>
<script>
    //初始化select2控件
    $(function () {
        $(".select2").select2();

    });
    //初始化datatables
    $(function () {
        $('#user-list').DataTable({
            language: {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            },
            "paging": true,
            "lengthChange": false,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false
        });
    });
    $(function () {
        //每次点击button初始化模态框
        $('#updateRole').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget)
            var userId = button.data('userid');
            var username = button.data('username');
            var modal = $(this)
            modal.find('#userName').attr("userId", userId);
            modal.find('#userName').attr('placeholder', username);
        })
    });
    $(function () {
        //每次点击button初始化模态框
        $('#deleteUser').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget)
            var userId = button.data('userid');
            var username = button.data('username');
            var modal = $(this)
            modal.find('#delete').attr("userId", userId);
        })
    });
    //为user添加role
    $(function () {
        $("#submit").click(function () {
            //获取多选框中的值
            var result = $("#roleSelect").select2("data");
            //获取用户ID
            var userId = $('#userName').attr("userId");
            var roleIds = [];
            for (var i = 0; i < result.length; i++) {
                roleIds[i] = result[i].id;
            }
            //ajax提交给后台
            updateRole(roleIds, userId);
            //添加load之后模态框移除不了。。。。

            //更新成功后弹出更新成功提示框 移除load 刷新页面

        })
    });
    //删除用户
    $(function () {
        $("#delete").click(function () {
            //获取用户Id
            var userId = $(this).attr("userId");
            //ajax提交给后台

        });
    })
    function updateRole(roleIds, userId) {

        var root = $('#main-header').attr("data-id");
        $.ajax({
            url: root + '/system/userRoleUpdate',
            type: 'POST',
            dataType: 'json',
            data: {
                "roleIds": roleIds,
                "userId": userId
            }
        }).done(function (data) {
            //返回提示信息并刷新页面
            $('#alertMsg .modal-body').html("" + data.msg);
            $('#alertMsg').modal('show');
            setTimeout(function () {
                $('#alertMsg').modal('hide');
                //添加不停地旋转load
                $('.content').html('<div class="overlay"> <i class="fa fa-refresh fa-spin"></i> </div>');
                location.reload();
            }, 1000 * 2);
            //刷新页面

        }).fail(function () {
            console.log("error");
        }).always(function () {
            console.log("complete");
        });

    }
</script>
</body>

</html>
