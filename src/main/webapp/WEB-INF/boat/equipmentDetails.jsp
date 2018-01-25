<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Starter</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta
            content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
            name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- daterange picker -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
    <!-- bootstrap datepicker -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/iCheck/all.css">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <!-- Bootstrap time Picker -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.css">
    <!-- Select2 -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/select2/select2.min.css">
    <!-- Theme style -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
           folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/dist/css/skins/_all-skins.min.css">

    <!-- DataTables -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">

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
                船舶信息
                <small>船舶具体信息</small>
                <p id="demo"></p>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index"><i
                        class="fa fa-dashboard"></i> 主页</a></li>
                <li><a href="#">设备信息</a></li>

            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <!--<div class="row">
    <div class="col-xs-12">

    </div>
  </div>-->
            <!-- service_date EXAMPLE -->
            <!--  -->
            <div class="box box-default">
                <div class="box-header with-border">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab_5" data-toggle="tab">设备编辑</a></li>
                    </ul>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool"
                                data-widget="collapse">
                            <i class="fa fa-minus"></i>
                        </button>
                        <button type="button" class="btn btn-box-tool"
                                data-widget="remove">
                            <i class="fa fa-remove"></i>
                        </button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="tab-content">



                    <!-- 新增设备 -->
                    <div class="tab-pane active" id="tab_5">

                        <div class="box-body">
                            <div class="row">
                                <!--第一列-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>设备名称</label> <input id="EquipmentName" name="name" type="text" value="${equipment.name}"
                                                                   placeholder="请填写设备名称" class="form-control">
                                        <input id="boatId" name="boatId" type="hidden" value="${equipment.boatId}"/>
                                        <input id="id" name="id" type="hidden" value="${equipment.id}"/>
                                    </div>
                                    <div class="form-group">
                                        <label>生产厂商</label> <input type="text" id="producer" value="${equipment.producer}"
                                                                   name="producer" placeholder="请填写生产厂商"
                                                                   class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>设备型号</label> <input type="text" id="EquipmentType" name="type" value="${equipment.type}"
                                                                   placeholder="请填设备型号" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>生产时间</label>
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" class="form-control pull-right" value="${equipment.productTime}"
                                                   id="productTime" name="productTime" disabled="disabled"/>
                                        </div>
                                    </div>

                                </div>
                                <!--第二列-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>CWBT代码</label> <br/>
                                        <div class="col-lg-7">
                                            <input type="text" class="form-control pull-right" value="${equipment.cwbtCode}"
                                                   id="cwbtCode" name="cwbtCode" disabled="disabled"/>
                                        </div>
                                        <div class="col-lg-1">——</div>
                                        <div class="col-lg-4">
                                            <input type="text" id="cwbtCode4" name="cwbtCode4"
                                                   placeholder="请填写三位数字" value="${equipment.cwbtCode4}"
                                                   class="form-control" disabled="disabled"/>
                                        </div>
                                    </div>
                                    <br/> <br/>
                                    <div class="form-group">
                                        <label>设备部门</label> <select id="eType" name="eType"
                                                                    class="form-control select2" style="width: 100%;">
                                        <option value="1" <c:if test="${equipment.eType==1}">selected="selected"</c:if>>轮机部</option>
                                        <option value="2" <c:if test="${equipment.eType==2}">selected="selected"</c:if>>甲板部</option>
                                    </select>
                                    </div>
                                    <div class="form-group">
                                        <label>日均使用时间</label> <input type="text" id="dailyHour"
                                                                     name="dailyHour"
                                                                     placeholder="请填写日均使用时间，如果按日期计算，请填0" class="form-control" value="${equipment.dailyHour}"/>
                                    </div>
                                    <div class="form-group">
                                        <label>设备状态</label> <select id="status"
                                                                    name="status" class="form-control select2"
                                                                    style="width: 100%;">
                                        <option value="1" <c:if test="${equipment.status==1}">selected="selected"</c:if>>运行</option>
                                        <option value="2" <c:if test="${equipment.status==2}">selected="selected"</c:if>>维修中</option>
                                        <option value="3" <c:if test="${equipment.status==3}">selected="selected"</c:if>>设备故障</option>
                                        <option value="0" <c:if test="${equipment.status==0}">selected="selected"</c:if>>停机</option>
                                    </select>
                                    </div>

                                </div>
                            </div>

                            <label>维护级别</label>
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <br/> <label> <input id="service_level_a"
                                                                 name="service_level_a" type="checkbox" value="A">
                                            A
                                        </label>
												<textarea type="text" id="service_level_a_content"
                                                          name="service_level_a_content"
                                                          placeholder="${contentA.content}"
                                                          style="width: 100%; " disabled="disabled"></textarea>
                                            <br/> <br/> <label> <input id="service_level_e"
                                                                       name="service_level_e" type="checkbox" value="E">
                                            E
                                        </label>
												<textarea type="text" id="service_level_e_content"
                                                          name="service_level_e_content" value=""
                                                          placeholder="${contentE.content}"
                                                          style="width: 100%;" disabled="disabled"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <br/> <label> <input id="service_level_b"
                                                             name="service_level_b" type="checkbox" value="B">
                                        B
                                    </label>
											<textarea type="text" id="service_level_b_content"
                                                      name="service_level_b_content" value="" placeholder="${contentB.content}"
                                                       style="width: 100%;" disabled="disabled"></textarea>
                                        <br/> <br/> <label> <input id="service_level_f"
                                                                   name="service_level_f" type="checkbox" value="F">
                                        F
                                    </label>
											<textarea type="text" id="service_level_f_content"
                                                      name="service_level_f_content" value="" placeholder="${contentF.content}"
                                                      style="width: 100%;" disabled="disabled"></textarea>
                                    </div>
                                    <div class="col-md-3">
                                        <br/> <label> <input id="service_level_c"
                                                             name="service_level_c" type="checkbox" value="C">
                                        C
                                    </label>
											<textarea type="text" id="service_level_c_content"
                                                      name="service_level_c_content" value="" placeholder="${contentC.content}"
                                                       style="width: 100%;" disabled="disabled"></textarea>
                                        <br/> <br/> <label> <input id="service_level_g"
                                                                   name="service_level_g" type="checkbox" value="G">
                                        G
                                    </label>
											<textarea type="text" id="service_level_g_content"
                                                      name="service_level_g_content" value="" placeholder="${contentG.content}"
                                                       style="width: 100%;" disabled="disabled"></textarea>
                                    </div>
                                    <div class="col-md-3">
                                        <br/> <label> <input id="service_level_d"
                                                             name="service_level_d" type="checkbox" value="D">
                                        D
                                    </label>
											<textarea type="text" id="service_level_d_content"
                                                      name="service_level_d_content" value="" placeholder="${contentD.content}"
                                                       style="width: 100%;" disabled="disabled"></textarea>
                                        <br/> <br/> <label> <input id="service_level_h"
                                                                   name="service_level_h" type="checkbox" value="H">
                                        H
                                    </label>
											<textarea type="text" id="service_level_h_content"
                                                      name="service_level_h_content" value="" placeholder="${contentH.content}"
                                                      style="width: 100%;" disabled="disabled"></textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="col-md-offset-12 col-md-9">
                                    <button class="btn btn-block btn-primary btn-lg" id="submit2"
                                            type="submit" item-width="50%">提交
                                    </button>
                                </div>
                            </div>
                        </div>


                    </div>



                </div>
            </div>
        </section>

    </div>
    <!-- /.content -->
    <!-- /.content-wrapper -->
    <jsp:include page="../module/foot.jsp"/>

</div>

<!-- ./wrapper -->
<!-- ./wrapper -->

<!-- /.content -->


<!-- jQuery 2.2.3 -->
<script
        src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script
        src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<!-- Select2 -->
<script
        src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script
        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script
        src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- bootstrap color picker -->
<script
        src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script
        src="${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- SlimScroll 1.3.0 -->
<script
        src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script
        src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<!-- FastClick -->
<script
        src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath}/dist/js/demo.js"></script>
<!-- Page script -->

<!-- DataTables -->
<script
        src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script
        src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>

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
        $('#time').datepicker({
            autoclose: true
        });

        $('#productTime').datepicker({
            autoclose: true
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


<script>
    //获取设备信息
    function getParms2() {
        var id = $('#id').val();
        var status = $('#status').val();
        var EquipmentName = $('#EquipmentName').val();
        var producer = $('#producer').val();
        var EquipmentType = $('#EquipmentType').val();
        var cwbtCode = $('#cwbtCode').val();
        var cwbtCode4 = $('#cwbtCode4').val();
        var eType = $('#eType').val();
        var dailyHour = $('#dailyHour').val();
        var boatId = $('#boatId').val();

        if($('#service_level_a').prop("checked") == true)
        {
            var serviceLevelA = $("#service_level_a").val();
        }
        if($("#service_level_b").prop("checked") == true)
        {
            var serviceLevelB= $("#service_level_b").val();
        }
        if($("#service_level_c").prop("checked") == true)
        {
            var serviceLevelC = $("#service_level_c").val();
        }
        if($("#service_level_d").prop("checked") == true)
        {
            var serviceLevelD= $("#service_level_d").val();
        }
        if($("#service_level_e").prop("checked") == true)
        {
            var serviceLevelE = $("#service_level_e").val();
        }
        if($("#service_level_f").prop("checked") == true)
        {
            var serviceLevelF = $("#service_level_f").val();
        }
        if($("#service_level_g").prop("checked") == true)
        {
            var serviceLevelG = $("#service_level_g").val();
        }
        if($("#service_level_h").prop("checked") == true)
        {
            var serviceLevelH = $("#service_level_h").val();
        }


        var data = {
            "id" : id,
            "status" : status,
            "name": EquipmentName,
            "producer": producer,
            "type": EquipmentType,
            "cwbtCode": cwbtCode,
            "cwbtCode4": cwbtCode4,
            "eType": eType,
            "dailyHour": dailyHour,
            "boatId": boatId,
            "serviceLevelA" : serviceLevelA,
            "serviceLevelB" : serviceLevelB,
            "serviceLevelC" : serviceLevelC,
            "serviceLevelD" : serviceLevelD,
            "serviceLevelE" : serviceLevelE,
            "serviceLevelF" : serviceLevelF,
            "serviceLevelG" : serviceLevelG,
            "serviceLevelH" : serviceLevelH
        }
        return data;
    }
    $(function () {
        $('#submit2').click(function () {
            var data = getParms2();
            if (data.productTime == "") {
                alert("生产日期不能为空!");
                return;
            }
            else if (data.name == "") {
                alert("设备名称不能为空!");
                return;
            }
            else if (data.cwbtCode == "") {
                alert("cwbt代码不能为空!");
                return;
            }
            else if (data.cwbtCode4 == "") {
                alert("请将cwbt代码后三位填写完整!");
                return;
            }
            else if (data.type == "") {
                alert("请将设备型号填写完整!");
                return;
            }
            else if (data.dailyHour == "") {
                alert("请将日均使用时间填写完整!若为0，请填写0");
                return;
            }
            else if (data.producer == "") {
                alert("请将生产厂商填写完整!");
                return;
            }
            submit2(data);
        });
    });
    //获取项目根路径
    function getRootPath() {
        var strFullPath = window.document.location.href;
        var strPath = window.document.location.pathname;
        var pos = strFullPath.indexOf(strPath);
        var prePath = strFullPath.substring(0, pos);
        var postPath = strPath.substring(0,
                strPath.substr(1).indexOf('/') + 1);
        return (prePath + postPath);
    }

    //将数据提交给后台
    function submit2(data) {
        var root = getRootPath();
        var boatId = $('#boatId').val();
        $.ajax({
            url: root + '/Boat/updateEquipment',
            type: 'POST',
            dataType: 'json',
            data: data,
        }).done(function (data) {

            {
                if (data.msg == "更新设备成功!") {
                    alert(data.msg);
                   window.location.href = root + "/Boat/boatInfo/" + boatId;
                } else {
                    alert(data.msg);

                }
            }

        }).fail(function () {
            console.log("error");
        }).always(function () {
            console.log("complete");
        });

    }
</script>



<script>
    $(document).ready(
            function getSingleServiceLevel() {

                var id = $('#id').val();
                var data = {
                    "id": id
                }

                var root = getRootPath();

                $.ajax({
                    url: root + '/Boat/getSingleEquipmentService',
                    type: 'POST',
                    dataType: 'json',
                    data: data,
                }).done(function (data) {
                    for(var i=0;i<data.length;i++) {
                        if (data[i].serviceLevel == "A") {
                            $('#service_level_a').prop("checked", 'checked');
                            console.log($('#service_level_a').prop("checked"));
                        }
                        if (data[i].serviceLevel == "B") {
                            $('#service_level_b').prop("checked", 'checked');
                        }
                        if (data[i].serviceLevel == "C") {
                            $('#service_level_c').prop("checked", 'checked');
                        }
                        if (data[i].serviceLevel == "D") {
                            $('#service_level_d').prop("checked", 'checked');
                        }
                        if (data[i].serviceLevel == "E") {
                            $('#service_level_e').prop("checked", 'checked');
                        }
                        if (data[i].serviceLevel == "F") {
                            $('#service_level_f').prop("checked", 'checked');
                        }
                        if (data[i].serviceLevel == "G") {
                            $('#service_level_g').prop("checked", 'checked');
                        }
                        if (data[i].serviceLevel == "H") {
                            $('#service_level_h').prop("checked", 'checked');
                        }
                    }
                })




            }
    )



</script>



</body>

</html>