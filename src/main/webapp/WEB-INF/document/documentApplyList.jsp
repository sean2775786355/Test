<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>船舶管理系统 | 资料申请信息</title>
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
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/skins/_all-skins.min.css">

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
        资料管理
        <small>资料申请管理</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
        <li><a href="#">资料</a></li>
        <li class="active">资料申请管理</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">资料申请</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th width="10%">编号</th>
                  <th width="15%">资料名</th>
                  <th width="10%">船舶名</th>
                  <th width="15%">需求日期</th>
                  <th width="5%">需求数量</th>
                  <th width="10%">状态</th>
                  <th width="20%">编辑</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${documentApplyList}" var="documentApplyList">
                <tr>
                  <td>${documentApplyList.id}</td>
                  <td>${documentApplyList.name}</td>
                  <td>${documentApplyList.boat_name}</td>
                  <td>${documentApplyList.pre_date}</td>
                  <td>${documentApplyList.num}</td>
                  <c:if test="${documentApplyList.status==0}">
                      <td>等待审核</td>
                      <td>
                      <a class="btn bg-purple margin"
                      href="${pageContext.request.contextPath}/document/documentApplyCheck?id=${documentApplyList.id}">审核</a>
                      <a class="btn bg-purple margin"
                      href="${pageContext.request.contextPath}/document/documentApplyView?id=${documentApplyList.id}">查看</a>
                      </td>
                  </c:if>
                  <c:if test="${documentApplyList.status==1}">
                      <td><span style="color: #9f191f"><strong>审核不通过</strong></span></td>
                      <td></td>
                  </c:if>
                  <c:if test="${documentApplyList.status==2}">
                      <td>完成</td>
                      <td>
                      <a class="btn bg-purple margin"
                      href="${pageContext.request.contextPath}/document/documentApplyView?id=${documentApplyList.id}">查看</a>
                      </td>
                  </c:if>
                </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <tr>
                  <th width="10%">编号</th>
                  <th width="15%">资料名</th>
                  <th width="15%">船舶名</th>
                  <th width="15%">需求日期</th>
                  <th width="10%">需求数量</th>
                  <th width="10%">状态</th>
                  <th width="10%">编辑</th>
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
