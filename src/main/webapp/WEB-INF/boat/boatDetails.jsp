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

	<%
	String txt = "0";
    if(request.getParameter("txt")!=null){
    	txt = request.getParameter("txt");	
    }
    %>
    <input type="hidden" id="txt" name="txt" value="<%=txt%>" />
	<script type="text/javascript">
		window.onload = function()
        {
            var txt = $('#txt').val();
			if(txt==0){
				$("#1").attr("class","active");
			}
			else if(txt==1){
				$("#2").attr("class","active");
			}else if(txt==2){
				$("#3").attr("class","active");
			}
        }
		
	
	</script>
	
	
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
                <li><a href="#">船舶信息</a></li>
                <li class="active">${boat.id}号船舶</li>
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
                        <li id="1"><a href="#tab_1" data-toggle="tab">船舶信息</a></li>
                        <li id="2"><a href="#tab_2" data-toggle="tab">人员信息</a></li>
                        <li id="3"><a href="#tab_3" data-toggle="tab">设备信息</a></li>
                        <li><a href="#tab_5" data-toggle="tab">新增设备</a></li>
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
                    <!-- 船舶信息 -->
                    <div class="tab-pane active" id="tab_1">

                        <div class="box-body">
                            <div class="row">
                                <!--第一列-->
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>船舶名称</label> <input id="boatId" type="hidden"
                                                                   value="${boat.id}"></input> <input id="name"
                                                                                                      type="text"
                                                                                                      value="${boat.name}"
                                                                                                      placeholder="请填写船舶名称"
                                                                                                      class="form-control"></input>
                                    </div>
                                    <div class="form-group">
                                        <label>船舶英文名</label> <input type="text" id="eName"
                                                                    value="${boat.eName}" placeholder="请填写船舶英文名"
                                                                    class="form-control"></input>
                                    </div>
                                    <div class="form-group">
                                        <label>船舶吨位</label> <input type="text" id="tonnage"
                                                                   value="${boat.tonnage}" placeholder="请填写船舶吨位"
                                                                   class="form-control"></input>
                                    </div>
                                    <div class="form-group">
                                        <label>船旗国</label> <input type="text" id="country"
                                                                  value="${boat.country}" placeholder="请填写船旗国"
                                                                  class="form-control"></input>
                                    </div>
                                </div>
                                <!--第二列-->
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>IMO代码</label> <input type="text" id="imo"
                                                                    value="${boat.imo}" placeholder="请填写IMO代码"
                                                                    class="form-control"></input>
                                    </div>
                                    <div class="form-group">
                                        <label>船舶状态</label> <select id="status" name="status"
                                                                    class="form-control select2">
                                        <option value="1" <c:if test="${boat.status==1}">selected="selected"</c:if>>正常</option>
                                        <option value="2" <c:if test="${boat.status==2}">selected="selected"</c:if>>在修</option>
                                    </select>
                                    </div>
                                    <div class="form-group">
                                        <label>船舶马力</label> <input type="text" id="horsepower"
                                                                   value="${boat.horsepower}" placeholder="请填写船舶马力"
                                                                   class="form-control"></input>
                                    </div>
                                </div>
                                <!--第三列-->
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>船舶呼号</label> <input type="text" id="callName"
                                                                   value="${boat.callName}" placeholder="请填写船舶呼号"
                                                                   class="form-control"></input>
                                    </div>
                                    <div class="form-group">
                                        <label>船舶类型</label> <select id="type"
                                                                    class="form-control select2">
                                        <option value="1"
                                                <c:if test="${boat.type==1}">selected="selected"</c:if>>散货船
                                        </option>
                                        <option value="2"
                                                <c:if test="${boat.type==2}">selected="selected"</c:if>>油轮
                                        </option>
                                    </select>
                                    </div>
                                    <div class="form-group">
                                        <label>主机型号</label> <input type="text" id="model"
                                                                   value="${boat.model}" placeholder="请填写主机型号"
                                                                   class="form-control"></input>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="col-md-offset-12 col-md-9">
                                    <button class="btn btn-block btn-primary btn-lg" id="submit"
                                            item-width="50%">保存
                                    </button>
                                </div>
                            </div>
                        </div>


                    </div>


                    <!--人员信息-->
                    <div class="tab-pane" id="tab_2">
                        <div class="box-body">
                            <table id="human_info"
                                   class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th width="10%">编号</th>
                                    <th width="20%">职位名称</th>
                                    <th width="20%">姓名</th>
                                    <th width="15%">就任时间</th>
                                    <th width="20%">说明</th>
                                    <th width="20%">编辑</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${attemperList}" var="attemper">
                                <tr>
                                    <td>${attemper.id}</td>
                                    <td>${attemper.duty}</td>
                                    <td>${attemper.name}</td>
                                    <td>${attmeper.time}</td>
                                    <td><textarea id="content" name="content"
                                                  placeholder="请填写离船说明及评价" style="width: 100%;"></textarea></td>
                                    <td><a class="btn bg-maroon margin" href="${pageContext.request.contextPath}/Sailor/SailorAsHore?AttemperId=${attemper.id}">离船</a></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                
                                <tr>
                                    <th width="10%">编号</th>
                                    <th width="20%">职位名称</th>
                                    <th width="20%">姓名</th>
                                    <th wodth="15%">就任时间</th>
                                    <th width="20%">说明</th>
                                    <th width="20%">编辑</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    <!--设备信息-->
                    <div class="tab-pane" id="tab_3">
                        <div class="box-body">
                            <table id="equipment_info"
                                   class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th width="10%">编号</th>
                                    <th width="15%">设备名称</th>
                                    <th width="15%">设备型号</th>
                                    <th width="15%">CWBT代码</th>
                                    <th wodth="15%">设备状态</th>
                                    <th width="15%">生产商</th>
                                    <th width="20%">编辑</th>
                                </tr>
                                </thead>
                                <c:forEach var="equipment" items="${equipments}">
                                    <tbody>
                                    <tr>
                                        <input type="hidden" id="equipmentId" name="id" value="&{equipment.id}"/>
                                        <td>${equipment.id}</td>
                                        <td>${equipment.name}</td>
                                        <td>${equipment.type}</td>
                                        <td>${equipment.cwbtCode}</td>
                                        <td><c:if test="${equipment.status==0}"><c:out value="停机"></c:out></c:if>
                                        	<c:if test="${equipment.status==1}"><c:out value="运行"></c:out></c:if>
                                            <c:if test="${equipment.status==2}"><c:out value="维修中"></c:out></c:if>
                                            <c:if test="${equipment.status==3}"><c:out value="设备故障"></c:out></c:if>
                                        </td>
                                        <td>${equipment.producer}</td>
                                        <td><a class="btn bg-maroon margin" href="${pageContext.request.contextPath}/Boat/deleteEquipmentByEquipmentId/${equipment.boatId}/${equipment.id}">删除</a>
                                        <a class="btn bg-purple margin" href="${pageContext.request.contextPath}/Boat/equipmentDetails/${equipment.id}"> 编辑</a></td>
                                    </tr>
                                    </tbody>
                                </c:forEach>
                                <tfoot>
                                <tr>
                                    <th width="10%">编号</th>
                                    <th width="15%">设备名称</th>
                                    <th width="15%">设备型号</th>
                                    <th width="15%">CWBT代码</th>
                                    <th wodth="15%">设备状态</th>
                                    <th width="15%">生产商</th>
                                    <th width="20%">编辑</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>


                    <!-- 新增设备 -->
                    <div class="tab-pane" id="tab_5">

                        <div class="box-body">
                            <div class="row">
                                <!--第一列-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>设备名称</label> <input id="EquipmentName" name="name" type="text"
                                                                   placeholder="请填写设备名称" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>生产厂商</label> <input type="text" id="producer"
                                                                   name="producer" placeholder="请填写生产厂商"
                                                                   class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>设备型号</label> <input type="text" id="EquipmentType" name="type"
                                                                   placeholder="请填设备型号" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>生产时间</label>
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" class="form-control pull-right"
                                                   id="productTime" name="productTime"/>
                                        </div>
                                    </div>

                                </div>
                                <!--第二列-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>CWBT代码</label> <br/>
                                        <div class="col-lg-7">
                                            <select id="cwbtCode" name="cwbtCode"
                                                    class="form-control select2" style="width: 100%;" onchange="spyCwbtCode()">

                                                <option value="" selected="selected">
                                                    <c:forEach var="cwbtCode" items="${cwbtCodes}">
                                                <option value=${cwbtCode}><c:out value="${cwbtCode}"></c:out></option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-lg-1">——</div>
                                        <div class="col-lg-4">
                                            <input type="text" id="cwbtCode4" name="cwbtCode4"
                                                   placeholder="请填写三位数字"
                                                   class="form-control">
                                        </div>
                                    </div>
                                    <br/> <br/>
                                    <div class="form-group">
                                        <label>设备部门</label> <select id="eType" name="eType"
                                                                    class="form-control select2" style="width: 100%;">
                                        <option value="1" selected="selected">轮机部</option>
                                        <option value="2">甲板部</option>
                                    </select>
                                    </div>
                                    <div class="form-group">
                                        <label>日均使用时间</label> <input type="text" id="dailyHour"
                                                                     name="dailyHour"
                                                                     placeholder="请填写日均使用时间，如果按日期计算，请填0"
                                                                     value="" class="form-control"></input>
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
                                                          name="service_level_a_content" value=""
                                                          placeholder="如勾选A类维护，请填写A类维护内容"
                                                          style="width: 100%; " disabled="disabled"></textarea>
                                            <br/> <br/> <label> <input id="service_level_e"
                                                                       name="service_level_e" type="checkbox" value="E">
                                            E
                                        </label>
												<textarea type="text" id="service_level_e_content"
                                                          name="service_level_e_content" value=""
                                                          placeholder="如勾选E类维护，请填写E类维护内容"
                                                          style="width: 100%;" disabled="disabled"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <br/> <label> <input id="service_level_b"
                                                             name="service_level_b" type="checkbox" value="B">
                                        B
                                    </label>
											<textarea type="text" id="service_level_b_content"
                                                      name="service_level_b_content" value=""
                                                      placeholder="如勾选B类维护，请填写B类维护内容" style="width: 100%;" disabled="disabled"></textarea>
                                        <br/> <br/> <label> <input id="service_level_f"
                                                                   name="service_level_f" type="checkbox" value="F">
                                        F
                                    </label>
											<textarea type="text" id="service_level_f_content"
                                                      name="service_level_f_content" value=""
                                                      placeholder="如勾选F类维护，请填写F类维护内容" style="width: 100%;" disabled="disabled"></textarea>
                                    </div>
                                    <div class="col-md-3">
                                        <br/> <label> <input id="service_level_c"
                                                             name="service_level_c" type="checkbox" value="C">
                                        C
                                    </label>
											<textarea type="text" id="service_level_c_content"
                                                      name="service_level_c_content" value=""
                                                      placeholder="如勾选C类维护，请填写C类维护内容" style="width: 100%;" disabled="disabled"></textarea>
                                        <br/> <br/> <label> <input id="service_level_g"
                                                                   name="service_level_g" type="checkbox" value="G">
                                        G
                                    </label>
											<textarea type="text" id="service_level_g_content"
                                                      name="service_level_g_content" value=""
                                                      placeholder="如勾选G类维护，请填写G类维护内容" style="width: 100%;" disabled="disabled"></textarea>
                                    </div>
                                    <div class="col-md-3">
                                        <br/> <label> <input id="service_level_d"
                                                             name="service_level_d" type="checkbox" value="D">
                                        D
                                    </label>
											<textarea type="text" id="service_level_d_content"
                                                      name="service_level_d_content" value=""
                                                      placeholder="如勾选D类维护，请填写D类维护内容" style="width: 100%;" disabled="disabled"></textarea>
                                        <br/> <br/> <label> <input id="service_level_h"
                                                                   name="service_level_h" type="checkbox" value="H">
                                        H
                                    </label>
											<textarea type="text" id="service_level_h_content"
                                                      name="service_level_h_content" value=""
                                                      placeholder="如勾选H类维护，请填写H类维护内容" style="width: 100%;" disabled="disabled"></textarea>
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
        var EquipmentName = $('#EquipmentName').val();
        var producer = $('#producer').val();
        var EquipmentType = $('#EquipmentType').val();
        var productTime = $('#productTime').val();
        var cwbtCode = $('#cwbtCode').val();
        var cwbtCode4 = $('#cwbtCode4').val();
        var eType = $('#eType').val();
        var dailyHour = $('#dailyHour').val();
        var boatId = $('#boatId').val()

        if($('#service_level_a').prop("checked") == true)
        {
            var serviceLevelA = $("#service_level_a").val();
        }
        if($("#service_level_b").prop("checked") == true)
        {
            var serviceLevelB = $("#service_level_b").val();
        }
        if($("#service_level_c").prop("checked") == true)
        {
            var serviceLevelC = $("#service_level_c").val();
        }
        if($("#service_level_d").prop("checked") == true)
        {
            var serviceLevelD = $("#service_level_d").val();
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

        //json格式存储数据  name/value

        var data = {
            "name": EquipmentName,
            "producer": producer,
            "type": EquipmentType,
            "productTime": productTime,
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
            url: root + '/Boat/initEquipment',
            type: 'POST',
            dataType: 'json',
            data: data,
        }).done(function (data) {

            {
                if (data.msg == "新建设备成功!") {
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
    //获取船舶信息
    function getParms() {
        var id = $('#boatId').val();
        var eName = $('#eName').val();
        var name = $('#name').val();
        var imo = $('#imo').val();
        var tonnage = $('#tonnage').val();
        var type = $('#type').val();
        var horsepower = $('#horsepower').val();
        var model = $('#model').val();
        var callName = $('#callName').val();
        var country = $('#country').val();
        var lane = $('#lane').val();
        var status = $('#status').val();
        var data = {
            "id": id,
            "eName": eName,
            "name": name,
            "imo": imo,
            "tonnage": tonnage,
            "type": type,
            "horsepower": horsepower,
            "model": model,
            "callName": callName,
            "country": country,
            "lane": lane,
            "status": status
        }
        return data;
    }
    $(function () {
        $('#submit').click(function () {
            var data = getParms();
            submit(data);
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
    function submit(data) {
        var root = getRootPath();
        $.ajax({
            url: root + '/Boat/updateBoat',
            type: 'POST',
            dataType: 'json',
            data: data,
        }).done(function (data) {

            {
                if (data.msg == "编辑信息成功!") {
                    alert(data.msg);
                    window.location.href = root + "/Boat/boatList";
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

<script>//监控cwbt后三位代码输入,由AJAX从后台取值获得维护级别和内容

function spyCwbtCode() {

    var cwbtCode = $('#cwbtCode').val();
    var data = {
        "cwbtCode": cwbtCode
    }

    var root = getRootPath();

    $.ajax({
        url: root + '/Boat/getEquipmentFixService',
        type: 'POST',
        dataType: 'json',
        data: data,
    }).done(function (data) {
        init();
        for(var i=0;i<data.length;i++) {
            if (data[i].serviceLevel == "A") {
                $('#service_level_a').prop("checked", 'checked');
                console.log($('#service_level_a').prop("checked"));
                $('#service_level_a_content').val(data[i].content);
            }
            if (data[i].serviceLevel == "B") {
                $('#service_level_b').prop("checked", 'checked');
                $('#service_level_b_content').val(data[i].content);
            }
            if (data[i].serviceLevel == "C") {
                $('#service_level_c').prop("checked", 'checked');
                $('#service_level_c_content').val(data[i].content);
            }
            if (data[i].serviceLevel == "D") {
                $('#service_level_d').prop("checked", 'checked');
                $('#service_level_d_content').val(data[i].content);
            }
            if (data[i].serviceLevel == "E") {
                $('#service_level_e').prop("checked", 'checked');
                $('#service_level_e_content').val(data[i].content);
            }
            if (data[i].serviceLevel == "F") {
                $('#service_level_f').prop("checked", 'checked');
                $('#service_level_f_content').val(data[i].content);
            }
            if (data[i].serviceLevel == "G") {
                $('#service_level_g').prop("checked", 'checked');
                $('#service_level_g_content').val(data[i].content);
            }
            if (data[i].serviceLevel == "H") {
                $('#service_level_h').prop("checked", 'checked');
                $('#service_level_h_content').val(data[i].content);
            }
        }
    })




}


</script>

<script>
    function init()
    {
        if ($('#service_level_a').prop("checked")==true) {
            $('#service_level_a').prop("checked",false);
            $('#service_level_a_content').val("");
        }
        if ($('#service_level_b').prop("checked")==true) {
            $('#service_level_b').prop("checked",false);
            $('#service_level_b_content').val("");
        }
        if ($('#service_level_c').prop("checked")==true) {
            $('#service_level_c').prop("checked",false);
            $('#service_level_c_content').val("");
        }
        if ($('#service_level_d').prop("checked")==true) {
            $('#service_level_d').prop("checked",false);
            $('#service_level_d_content').val("");
        }
        if ($('#service_level_e').prop("checked")==true) {
            $('#service_level_e').prop("checked",false);
            $('#service_level_e_content').val("");
        }
        if ($('#service_level_f').prop("checked")==true) {
            $('#service_level_f').prop("checked",false);
            $('#service_level_f_content').val("");
        }
        if ($('#service_level_g').prop("checked")==true) {
            $('#service_level_g').prop("checked",false);
            $('#service_level_g_content').val("");
        }
        if ($('#service_level_h').prop("checked")==true) {
            $('#service_level_h').prop("checked",false);
            $('#service_level_h_content').val("");
        }
    }


</script>
</body>

</html>