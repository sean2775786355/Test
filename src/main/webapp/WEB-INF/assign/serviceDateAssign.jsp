<%--
  Created by IntelliJ IDEA.
  User: lxy
  Date: 2016/11/13
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
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
    <!-- daterange picker -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/all.css">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <!-- Bootstrap time Picker -->
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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


    <script>
        function getUrl(){
            var url = $("#urll").val();
            var form=document.getElementById("1-1");
            form.action=url;
            form.submit();
        }
    </script>
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
                工作卡任务分配
                <small>共${fn:length(serviceDateAllList)}项未分配任务</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li><a href="#">工作卡</a></li>
                <li class="active">工作卡任务分配</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- service_date EXAMPLE -->
            <!--  工作卡一-->
            <input type="hidden" id="urll" value="${pageContext.request.contextPath}/Assign/giveUp"/>
            <% int i = 1;%>
            <c:forEach items="${serviceDateAllList}" var="serviceDateAll">

                <div class="box box-default">
             <!--       <div class="box-header with-border">
                        <h3 class="box-title">工作卡<%=i++%>
                        </h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                    class="fa fa-minus"></i></button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i
                                    class="fa fa-remove"></i></button>
                        </div>
                    </div>-->
                    <div class="row">
                        <div class="col-md-3">
                            <h3 class="box-title">工作卡<%=i++%></h3>
                        </div>
                        <div class="col-md-3">主机</div>
                        <div class="col-md-5">C</div>
                        <div class="col-md-5"></div>
                        <div class="col-md-3">
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-header -->


                    <form method="post" id="1-1" name="1-1" action="${pageContext.request.contextPath}/Assign/serviceDateAssignOk" role="form">
                        <input type="hidden" id="boatId" name="boatId" value="${serviceDateAll.boatId}"/>
                        <div class="box-body">
                            <div class="row">
                                <input type="hidden" value="${serviceDateAll.id}" id="id" name="id"/>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>设备名称</label>

                                        <input type="text" disabled="disabled" class="form-control"
                                               id="${serviceDateAll.equipmentId}" name="equipment_id"
                                               value="${serviceDateAll.equipmentName}" style="width: 100%;"/>
                                    </div>
                                    <!-- /.form-group -->
                                    <div class="form-group">
                                        <label>维护级别</label>

                                        <input type="text" disabled="disabled" class="form-control"
                                               id="service_level" name="service_level"
                                               value="${serviceDateAll.serviceLevel}" style="width: 100%;"/>
                                    </div>
                                    <div class="form-group">
                                        <label>维护内容</label>
                                            <textarea type="text" id="service_content" name="serviceContent"
                                                      placeholder="请填写维护内容" value="serviceLevel"
                                                      style="width: 100%;">${serviceDateAll.serviceContent}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>放弃维护原因</label>
                                            <textarea type="text" id="bandContent" name="bandContent" value=""
                                                      placeholder="请填写放弃维护原因" style="width: 100%;"></textarea>
                                    </div>
                                    <!-- /.form-group -->
                                </div>
                                <!-- /.col -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>船舶名称</label>

                                        <input type="text" disabled="disabled" class="form-control" id="boat_name"
                                               name="boat_name" value="${serviceDateAll.boatName}"
                                               style="width: 100%;"/>
                                    </div>
                                    <!-- /.form-group -->
                                    <div class="form-group">
                                        <label>预期维护时间</label>
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>

                                            <input disabled="disabled" type="text" class="form-control pull-right"
                                                   id="estimated_time" name="estimated_time"
                                                   value="${serviceDateAll.estimatedTime}"/>
                                        </div>
                                    </div>
                                    <!-- /.form-group -->
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>维护人员</label>
                                        <input type="hidden" id="default_duty"  name="default_duty" value="${serviceDateAll.defaultDuty}">
                                        <select id="did_id" name="didId" class="form-control select2"
                                                style="width: 100%;">
                                            <c:forEach items="${attemperAllList}" var="attemperAll">

                                                <option value="${attemperAll.sailor_id}" class="${attemperAll.duty}">${attemperAll.name}-${attemperAll.dutyName}</option>

                                            </c:forEach>
                                        </select>
                                        <script>
                                            var duty = document.getElementById("default_duty").value;
                                            var option = document.getElementById("did_id");
                                            for(var i=0;i<option.length;i++){
                                                if(option[i].class==duty)
                                                    option[i].selected = true;
                                            }
                                        </script>
                                    </div>

                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                            <div class="col-md-4">
                                <div class="col-md-offset-12 col-md-9">
                                    <button class="btn btn-block btn-primary btn-lg" id="btn" type="submit"
                                            item-width="50%">
                                        提交
                                    </button>
                                    &nbsp; &nbsp; &nbsp;
                                    <button class="btn btn-block btn-default btn-lg" type="reset" item-width="50%">
                                        重置
                                    </button>
                                    <button class="btn btn-block btn-danger btn-lg"
                                       id="giveUp"
                                        item-width="50%"
                                            type="button"
                                        onclick="getUrl()">
                                        放弃维护
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- /.box-body -->
                </div>

            </c:forEach>


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

<!--自己写的js文件依赖jQ-->
<script src="${pageContext.request.contextPath}/plugins/aPudding/js/main.js"></script>


<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->
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
        $('#datepicker').datepicker({
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
    });
</script>
</body>
</html>


