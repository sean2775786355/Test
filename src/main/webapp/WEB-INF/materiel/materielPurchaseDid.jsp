<%--
  Created by IntelliJ IDEA.
  User: lxy
  Date: 2017/4/18
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>船舶信息 | 物料申请信息</title>
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
                <small>物料采购</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li><a href="#">物料</a></li>
                <li class="active">物料采购</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-xs-12">

                    <div class="box">
                        <form method="get" id="" name="" action="${pageContext.request.contextPath}/materiel/materielPurchaseDidDo">
                            <input hidden="hidden" id="id" name="id" value="${materielApply.id}"/>
                            <div class="box-header">
                                <h3 class="box-title">物料采购</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">
                                    <!--第一列-->
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>物料名称</label>
                                            <input type="text" id="name" name="name" value="${materiel.name}" disabled="disabled" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label>接收港口</label>
                                            <input type="text" id="port" name="port" value="${materielApply.port}" disabled="disabled" class="form-control"/>
                                        </div>
                                    </div>
                                    <!--第二列-->
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>申请数量</label>
                                            <input type="text" id="count" name="count" value="${materielApply.count}" disabled="disabled" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label>船舶名称</label>
                                            <input type="text" id="boat_id" name="boat_id" value="${materielApply.boat_name}" disabled="disabled" class="form-control"/>
                                        </div>
                                    </div>
                                    <!--第三列-->
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>预期接收时间</label>
                                            <input type="text" id="eta" name="eta" value="${materielApply.eta}" disabled="disabled" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label>预算余额</label>
                                            <input type="text" id="remained" name="remained" value="${budget.remained}" disabled="disabled" class="form-control"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>物料信息</label>
                                            <textarea disabled="disabled" type="text" id="info" name="info" value="" style="width: 100%;height: 12%;">
类型：${materiel.type}
生产商：${materiel.productor_name}
标准号：${materiel.standard_code}
规格：${materiel.standard}
其他说明：${materiel.content}
                                            </textarea>
                                        </div>
                                    </div>
                                </div>

                                <!--供应商选择-->
                                <div class="row">
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>供应商报价信息</label>
                                            <select disabled="disabled" id="quote_id" name="quote_id" class="form-control select2">
                                                <option value="${materielQuote.id}" selected="selected">${materielQuote.supplierName}</option>

                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>当前采购数量</label>
                                            <input type="text" id="current_count" value="${materielPurchase.currentCount}" name="current_count" placeholder="0" disabled="disabled" class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>申报价格（单价）</label>
                                            <input type="text" id="price" name="price" class="form-control" disabled="disabled" value="${materielQuote.price}"/>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>币种</label>
                                            <input type="text" id="currency" name="currency" class="form-control" disabled="disabled" value="${materielQuote.currency}"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>询价说明</label>
                                            <textarea disabled="disabled" type="text" id="quote_content" name="quote_content" value="" placeholder="无询价说明" style="width: 100%;">${materielQuote.content}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>申请说明</label>
                                            <textarea disabled="disabled" type="text" id="apply_content" name="apply_content" value="" placeholder="请填写申请说明" style="width: 100%;">${materielApply.content}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>初审说明</label>
                                            <textarea disabled="disabled" type="text" id="precheck_content" name="precheck_content" value="" placeholder="请填写审核说明" style="width: 100%;">${materielApply.precheck_content}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>大单审核人</label>
                                            <c:if test="${materielPurchase.status==2}">
                                                <input id="check_id" name="check_id" value="${checkName}" placeholder="无需大单审核" disabled="disabled" class="form-control" />
                                            </c:if>
                                            <c:if test="${materielPurchase.status==0}">
                                                <input id="check_id" name="check_id" value="" placeholder="无需大单审核" disabled="disabled" class="form-control" />
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>采购说明</label>
                                            <textarea disabled="disabled" type="text" id="purchase_content" name="purchase_content" placeholder="请填写采购说明" value="" style="width: 100%;">${materielPurchase.content}</textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>审核说明</label>
                                            <textarea disabled="disabled" type="text" id="check_content" name="check_content" placeholder="请填写审核说明" value="" style="width: 100%;">${materielPurchase.checkContent}</textarea>
                                        </div>
                                    </div>
                                </div>
                                &nbsp;
                                <div class="col-md-4">
                                    <div class="col-md-offset-12 col-md-9">
                                        <button class="btn btn-block btn-primary btn-lg" id="btn" type="submit" item-width="50%" >
                                            执行采购
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <!-- /.box-body -->
                        </form>
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>

        </section>
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



