<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %><%--
  Created by IntelliJ IDEA.
  User: lxy
  Date: 2017/4/18
  Time: 21:28
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
                <small>物料询价</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li><a href="#">物料</a></li>
                <li class="active">物料询价</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <!-- service_date EXAMPLE -->
            <!--  -->
            <div class="box box-default">
                <div class="box-header with-border">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab_1" data-toggle="tab">物料</a></li>
                    </ul>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="tab-content">
                    <!-- 物料信息 -->
                    <div class="tab-pane active" id="tab_1">
                        <form method="POST" id="" name="" action="${pageContext.request.contextPath}/materiel/materielApplyQuoteDo" role="form">
                            <div class="box-body">
                                <input id="id" name="id" value="${materielApply.id}" type="hidden"/>

                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>物料名称</label>
                                            <input disabled="disabled" type="text" id="materiel_id" name="materiel_id" value="${materiel.name}" class="form-control"></input>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>询价截止时间</label>
                                            <div class="input-group date">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <%
                                                    Calendar calendar =Calendar.getInstance();

                                                %>
                                                <input type="text" class="form-control pull-right" id="deadline" name="deadline" value="<%=calendar.get(Calendar.MONTH)%>/<%=calendar.get(Calendar.DAY_OF_MONTH)%>/<%=calendar.get(Calendar.YEAR)%>" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>物料信息</label>
                                            <textarea disabled="disabled" type="text" id="info" name="info" value="" style="width: 100%;height: 15%;">
类型：${materiel.type}
生产商：${materiel.productor_name}
标准号：${materiel.standard_code}
规格：${materiel.standard}
其他说明：${materiel.content}
                                            </textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <!--第一列-->
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>申请数量</label>
                                            <input disabled="disabled" id="count" name="count" type="text" placeholder="请填写申请数量" value="${materielApply.count}" class="form-control"></input>
                                        </div>
                                        <div class="form-group">
                                            <label>申请船舶</label>
                                            <input disabled="disabled" id="boat_id" name="boat_id" value="${materielApply.boat_name}" class="form-control" type="text"/>
                                        </div>
                                    </div>
                                    <!--第二列-->
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>预期接收时间</label>
                                            <div class="input-group date">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <input disabled="disabled" type="text" class="form-control pull-right" id="eta" name="eta" value="${materielApply.eta}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>物料申请人</label>
                                            <input disabled="disabled" id="sailor_id" name="sailor_id" type="text" value="${materielApply.sailor_name}" class="form-control"/>
                                        </div>
                                    </div>
                                    <!--第二列-->
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>预期到达港口</label>
                                            <input disabled="disabled" type="text" id="port" name="port" value="${materielApply.port}" class="form-control" ></input>
                                        </div>
                                        <div class="form-group">
                                            <label>当前库存</label>
                                            <input disabled="disabled" type="text" id="storage_count" name="storage_count" value="${materiel.storage}" class="form-control"></input>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>申请说明</label>
                                            <textarea disabled="disabled" type="text" id="content" name="content" value="" style="width: 100%;">${materielApply.content}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>初审说明</label>
                                            <textarea disabled="disabled" type="text" id="precheck_content" name="precheck_content" value="" style="width: 100%;">${materielApply.precheck_content}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                </div>
                                <div class="col-md-4">
                                    <div class="col-md-offset-12 col-md-9">
                                        <button class="btn btn-block btn-primary btn-lg" id="btn" type="submit" item-width="50%" >
                                            询价
                                        </button>
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>

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
<!-- Select2 -->
<script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- bootstrap color picker -->
<script src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath}/dist/js/demo.js"></script>
<!-- Page script -->

<!-- DataTables -->
<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>





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

<script>

    $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();

        //Datemask dd/mm/yyyy
        $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
        //Datemask2 mm/dd/yyyy
        $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
        //Money Euro
        $("[data-mask]").inputmask();

        //Date range picker
        $('#reservation').daterangepicker();
        //Date range picker with time picker
        $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
        //Date range as a button
        $('#daterange-btn').daterangepicker(
                {
                    ranges: {
                        'Today': [moment(), moment()],
                        'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                        'This Month': [moment().startOf('month'), moment().endOf('month')],
                        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                    },
                    startDate: moment().subtract(29, 'days'),
                    endDate: moment()
                },
                function (start, end) {
                    $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
                }
        );

        //Date picker

        $('#eta').datepicker({
            autoclose: true
        });
        $('#deadline').datepicker({
            autoclose: true
        });
        $('#time').datepicker({
            autoclose: true
        });
        $('#initial_time').datepicker({
            autoclose: true,
            currentText:'Now'
        });
        $('#product_time').datepicker({
            autoclose: true
        });
        $('#update_initial_time').datepicker({
            autoclose: true,
            currentText:'Now'
        });
        $('#update_product_time').datepicker({
            autoclose: true
        });


        //iCheck for checkbox and radio inputs
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass: 'iradio_minimal-blue'
        });
        //Red color scheme for iCheck
        $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
            checkboxClass: 'icheckbox_minimal-red',
            radioClass: 'iradio_minimal-red'
        });
        //Flat red color scheme for iCheck
        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
            checkboxClass: 'icheckbox_flat-green',
            radioClass: 'iradio_flat-green'
        });

        //Colorpicker
        $(".my-colorpicker1").colorpicker();
        //color picker with addon
        $(".my-colorpicker2").colorpicker();

        //Timepicker
        $(".timepicker").timepicker({
            showInputs: false
        });

        $('#human_info').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false
        });

        $('#equipment_info').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false
        });

    });
</script>
</body>
</html>

