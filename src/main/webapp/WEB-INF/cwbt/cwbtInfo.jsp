<%--
  Created by IntelliJ IDEA.
  User: lxy
  Date: 2016/9/23
  Time: 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Starter</title>
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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
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
                CWBT代码
                <small>代码管理</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">CWBT代码</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">CWBT代码</h3>
                            <shiro:hasPermission name="cwbt:codeCreate">
                            &nbsp; &nbsp; &nbsp;
                            <a class="btn btn-app" href="${pageContext.request.contextPath}/cwbt/cwbtCodeCreate">
                                <i class="fa fa-inbox"></i>新增CWBT代码
                            </a>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="cwbt:subCwbtInfo">
                            &nbsp; &nbsp; &nbsp;
                            <a class="btn btn-app" href="${pageContext.request.contextPath}/cwbt/subCwbtInfo">
                                <i class="fa fa-inbox"></i>子代码管理
                            </a>
                            </shiro:hasPermission>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th width="10%">编号</th>
                                    <th width="20%">CWBT代码</th>
                                    <th width="20%">设备名称</th>
                                    <th wodth="30%">设备说明</th>
                                    <th width="20%">编辑</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% int i = 1; %>
                                <c:forEach items="${list}" var="cwbt">
                                    <tr>
                                        <input type="hidden" id="id" name="id" value="${cwbt.id}"/>
                                        <td><%=i++%>
                                        </td>
                                        <td>${cwbt.code1}-${cwbt.code2}-${cwbt.code3}-000</td>
                                        <td>${cwbt.name}</td>
                                        <td>${cwbt.content}</td>
                                        <td>
                                            <shiro:hasPermission name="cwbt:codeDelete">
                                            <a class="btn bg-maroon margin" href="${pageContext.request.contextPath}/cwbt/cwbtDelete?id=${cwbt.id}">删除</a>
                                            </shiro:hasPermission>
                                            <shiro:hasPermission name="cwbt:codeEdit">
                                            <a class="btn bg-purple margin" href="${pageContext.request.contextPath}/cwbt/cwbtCodeEdit?id=${cwbt.id}">编辑</a>
                                            </shiro:hasPermission>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th>编号</th>
                                    <th>CWBT代码</th>
                                    <th>设备名称</th>
                                    <th>设备说明</th>
                                    <th>编辑</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
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
<!-- DataTables -->
<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath}/dist/js/demo.js"></script>

<!--自己写的js文件依赖jQ-->
<script src="${pageContext.request.contextPath}/plugins/aPudding/js/main.js"></script>
<!-- page script -->
<script>
    $(function () {
        $("#example1").DataTable();
        $('#example2').DataTable({

            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false
        });
    });
</script>
</body>
</html>
