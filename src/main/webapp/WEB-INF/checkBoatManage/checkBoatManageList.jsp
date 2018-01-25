<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>船岸信息 | 船岸信息列表</title>
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
      <!-- daterange picker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/all.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.css">
  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.css">
  
  <!-- Select2 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.min.css">
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
        船岸信息
        <small>船岸信息列表</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
        <li class="active">船岸信息列表</li>
      </ol>
    </section>

     <!-- Main content -->
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">船岸信息列表</h3>
                &nbsp; &nbsp; &nbsp;
                <c:if test="${roles=='onland'}">
              <a class="btn btn-app" href="${pageContext.request.contextPath}/checkBoatManage/checkBoatManageCreate" >
                <i class="fa fa-inbox"></i>发送信息
              </a>
              </c:if>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th width="10%">编号</th>
                  <th width="10%">主题</th>
                  <th width="15%">发送时间</th>
                  <th width="15%">回复时间</th>
                  <th width="10%">船舶对象</th>
				  <th width="10%">状态</th>
                  <th width="20%">编辑</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${checkBoatManageList}" var="checkBoatManage">
                <tr>
                  <td>${checkBoatManage.id}</td>
                  <td>${checkBoatManage.subject}</td>
                  <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${checkBoatManage.sendTime}" /></td>
                  <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${checkBoatManage.replyTime}" /></td>
                  <td>${checkBoatManage.boatName}</td>
                  <td>
                  	<c:if test="${checkBoatManage.status==0}">未发送</c:if>
                  	<c:if test="${checkBoatManage.status==1}">已发送</c:if>
                  	<c:if test="${checkBoatManage.status==2}">已回复</c:if>
                  	<c:if test="${checkBoatManage.status==3}">已完成</c:if>
                  </td>
                  <td>
					<a class="btn bg-maroon margin" href="${pageContext.request.contextPath}/checkBoatManage/checkBoatManageDelete?id=${checkBoatManage.id}">删除</a>
					<c:if test="${roles=='onboard'}">
					<a class="btn bg-purple margin" href="${pageContext.request.contextPath}/checkBoatManage/checkBoatManageReply?id=${checkBoatManage.id}">回复</a>
					</c:if>
					<a class="btn bg-purple margin" href="${pageContext.request.contextPath}/checkBoatManage/checkBoatManageInfo?id=${checkBoatManage.id}">查看</a>
					</td>
				</tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <tr>
                  <th width="10%">编号</th>
                  <th width="15%">主题</th>
                  <th width="15%">发送时间</th>
                  <th width="10%">回复时间</th>
                  <th width="10%">船舶对象</th>
				  <th width="10%">状态</th>
                  <th width="20%">编辑</th>
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
<!-- Select2 -->
<script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<!-- DataTables -->
<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!--自己写的js文件依赖jQ-->
<script src="${pageContext.request.contextPath}/plugins/aPudding/js/main.js"></script>
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
