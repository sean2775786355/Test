<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>船舶信息 | 物料管理</title>
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
        物料
        <small>物料管理</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
        <li><a href="#">物料</a></li>
        <li class="active">物料信息</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">物料信息</h3>
                &nbsp; &nbsp; &nbsp;
              <a class="btn btn-app" href="${pageContext.request.contextPath}/materiel/materielCreate">
                <i class="fa fa-inbox"></i>新增物料
              </a>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th width="10%">编号</th>
                  <th width="15%">物料名</th>
                  <th width="20%">生产商</th>
                  <th width="15%">规格</th>
                  <th width="10%">库存</th>
                  <th width="10%">单位</th>
                  <th width="20%">编辑</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${materielList}" var="materiel">
                <tr>
                  <input type="hidden" id="id" name="id" value="${materiel.id}"/>
                  <td>${materiel.id}</td>
                  <td>${materiel.name}</td>
                  <td>${materiel.productor_name}</td>
                  <td>${materiel.standard}</td>
                  <td>${materiel.storage}</td>
                  <td>
                  	<c:if test="${materiel.unit==0}">个</c:if>
                  	<c:if test="${materiel.unit==1}">条</c:if>
                  	<c:if test="${materiel.unit==2}">根</c:if>
                  	<c:if test="${materiel.unit==3}">套</c:if>
                  	<c:if test="${materiel.unit==4}">米</c:if>
                  	<c:if test="${materiel.unit==5}">升</c:if>
                  	<c:if test="${materiel.unit==6}">公斤</c:if>
                  	<c:if test="${materiel.unit==7}">组</c:if>
                  	<c:if test="${materiel.unit==8}">桶</c:if>
                  	<c:if test="${materiel.unit==9}">罐</c:if>
                  	<c:if test="${materiel.unit==10}">艘</c:if>
                  	<c:if test="${materiel.unit==11}">台</c:if>
                  	<c:if test="${materiel.unit==12}">瓶</c:if>
                  	<c:if test="${materiel.unit==13}">箱</c:if>
                  	<c:if test="${materiel.unit==14}">英尺</c:if>
                  	<c:if test="${materiel.unit==15}">磅</c:if>
                  	<c:if test="${materiel.unit==16}">其他1</c:if>
                  	<c:if test="${materiel.unit==17}">其他2</c:if>
                  	<c:if test="${materiel.unit==18}">其他3</c:if>
                  </td>          
                  <td><a class="btn bg-maroon margin" href="${pageContext.request.contextPath}/materiel/materielDelete?id=${materiel.id}">删除</a><a class="btn bg-purple margin" href="${pageContext.request.contextPath}/materiel/materielDetail?id=${materiel.id}">编辑</a></td>
                </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <tr>
                  <th width="10%">编号</th>
                  <th width="15%">物料名</th>
                  <th width="20%">生产商</th>
                  <th width="15%">规格</th>
                  <th width="10%">库存</th>
                  <th width="10%">单位</th>
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
