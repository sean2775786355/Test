<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>船舶信息 | 预算使用信息</title>
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
        船舶信息
        <small>预算使用信息</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
        <li><a href="${pageContext.request.contextPath}/Boat/boatList"><i class="fa fa-dashboard"></i> 船舶信息</a></li>
        <li class="active">预算使用信息</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">预算使用信息</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="row">
                  <!--第一列-->
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>船舶名称</label>
                      <input id="boay_id" name="boat_id" type="hidden" value="${budget.boatId}">
                      <input id="boat_name" name="boat_name" type="text" value="${boatName}" disabled="disabled" class="form-control"></input>
                    </div>  
                    <div class="form-group">
                      <label>预算余额</label>
                      <input id="remained" name="remained" type="text"  value="${budget.remained}" disabled="disabled" class="form-control"></input>
                    </div>  
                  </div>
                  <!--第二列-->
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>预算财年</label>
                      <select id="year" name="year" onchange="ajaxCase();" class="form-control select2">
                        <c:forEach items="${yearList}" var="year">
                        	<option value="${year}" 
                        	<c:if test="${year==budget.year}">selected="selected"</c:if>
                        	>${year}</option>
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <!--第三列-->
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>预算金额</label>
                      <input type="text" id="totalled" name="totalled" disabled="disabled" placeholder="请填写预算金额（人民币）" value="${budget.totaled}" class="form-control"></input>
                    </div> 
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-8">
                    <div class="form-group">
                      <label>预算说明</label>
                      <textarea type="text" id="content" name="content" disabled="disabled" value="" placeholder="请填写预算说明" style="width: 100%;">${budget.content}</textarea>
                    </div>
                  </div>
                </div>


              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th width="10%">编号</th>
                  <th width="15%">使用时间</th>
                  <th width="15%">使用金额</th>
                  <th width="30%">使用目的</th>
                  <th width="15%">申请人</th>
                  <th width="15%">核准人</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${budgetUsgaeList}" var="budgetUsgae">
                <tr>
                  <td>${budgetUsgae.id}</td>
                  <td>${budgetUsgae.useTime}</td>
                  <td>${budgetUsgae.count}</td>
                  <td>${budgetUsgae.content}</td>
                  <td>${budgetUsgae.sailorId}</td>
                  <td>${budgetUsgae.createId}</td>
                </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <tr>
                  <th width="10%">编号</th>
                  <th width="15%">使用时间</th>
                  <th width="15%">使用金额</th>
                  <th width="30%">使用目的</th>
                  <th width="15%">申请人</th>
                  <th width="15%">核准人</th>
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
    
    function ajaxCase(){
    	var root = $('#main-header').attr("data-id");
    	var year = $('#year').val();
    	window.location.href = root+'/budget/budgetInfo?year='+year;
    }
</script>
</body>

</html>
