<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>船舶管理 | 维修申请</title>
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
  <!-- AdminLTE App -->
  <script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>
  <!-- bootstrap time picker -->
  <script src="${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.js"></script>
  <!-- DataTables -->
  <script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
  <script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
  <!-- zTree -->
  <script src="${pageContext.request.contextPath}/plugins/zTree/js/jquery.ztree.core.min.js"></script>
  <script src="${pageContext.request.contextPath}/plugins/zTree/js/jquery.ztree.excheck.min.js"></script>

  <!--自己写的js文件依赖jQ-->
  <script src="${pageContext.request.contextPath}/plugins/aPudding/js/main.js"></script>


  <script type="text/javascript">
    function change(){
      var max = document.getElementById("max");
      for (var a = 0;a<=max.value;a++){
        var temp = document.getElementsByName(a);
        temp[0].style.display="none";
      }
      var option = $("#repair_factory_id option:selected");
      var p = document.getElementsByName(option[0].id);
      p[0].style.display="block";
    }


  </script>
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
        船舶管理
        <small>维修申请</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
      	<li><a href="${pageContext.request.contextPath}/repair/repairInfo">船舶维修</a></li>
        <li class="active">维修申请</li>
      </ol>
    </section>

      <!-- Main content -->
     <!-- Main content -->
    <section class="content">
      <!-- service_date EXAMPLE -->
      <!--  -->
      <div class="box box-default">
        <div class="box-header with-border">
          <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_1" data-toggle="tab">船舶维修</a></li>
            </ul>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <!-- /.box-header -->
        <div class="tab-content">
          <form action="${pageContext.request.contextPath}/repair/repairApplyDetailResult" method="post">
          <!-- 人员信息 -->
          <div class="tab-pane active" id="tab_1">
              <div class="box-body">
                <input id="id" name="id" value="${repairApplyWithBLOBs.id}" type="hidden"/>
                <div class="row">
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>维修厂</label>
                      <input hidden="hidden" value="${repairApplyWithBLOBs.repairFactoryId }" id="setId">
                      <%int i=0; %>
                      <select id="repair_factory_id" name="repairFactoryId" onchange="change();" class="form-control select2">
                        <c:forEach items="${repairFactoryList}" var="repairFactory">
                          <option value="${repairFactory.id }"  id="<%=++i %>">${repairFactory.name}</option>
                        </c:forEach>
                      </select>
                      <script>
                        var set = document.getElementById("setId").value;
                        var option = document.getElementById("repair_factory_id");
                        for(var i=0;i<option.length;i++){
                          if(option[i].value==set)
                            option[i].selected = true;
                        }
                      </script>
                    </div>  
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-8">
                    <div class="form-group">
                      <label>维修厂信息</label>
                      <br>
                      <%int j=0;%>
                      <textarea disabled="disabled" type="text" name="<%=j %>" style="width: 900px;height: 200px">

                      </textarea>
                      <c:forEach items="${repairFactoryList}" var="repairFactory">
                      <textarea disabled="disabled" type="text" name="<%=++j %>" style="width: 900px;height: 200px;display:none">
联系人：${repairFactory.linkman}
传真：${repairFactory.fax}
座机：${repairFactory.phone}
移动电话：${repairFactory.mobilePhone}
邮箱：${repairFactory.email}
地址：${repairFactory.location}
简介：${repairFactory.content}
污点记录：${repairFactory.badContent}
                      </textarea>
                      </c:forEach>
                      <input hidden="hidden" value="<%=i%>" id="max" name="max"/>
                      <script>
                        change();

                      </script>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <!--第一列-->
                  <div class="col-md-4">
                     <div class="form-group">
                      <label>维修类型</label>
                       <c:if test="${repairApplyWithBLOBs.type==0}">
                         <select id="type" name="type" class="form-control select2">
                           <option value="0" selected="selected">航修</option>
                           <option value="1">厂修</option>
                         </select>
                       </c:if>
                       <c:if test="${repairApplyWithBLOBs.type==1}">
                         <select id="type" name="type" class="form-control select2">
                           <option value="0" >航修</option>
                           <option value="1" selected="selected">厂修</option>
                         </select>
                       </c:if>


                    </div>  
                  </div>
                  <!--第二列-->
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>计划维修时间</label>
                      <div class="input-group date">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input type="text" class="form-control pull-right" id="repair_date" name="repairDate"  value="${repairApplyWithBLOBs.repairDate}"/>
                      </div>
                    </div>        
                  </div>
                  <!--第二列-->
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>预期维修时长</label>
                      <input type="text" id="date_length" name="dateLength" placeholder="请填写预期维修时长" value="${repairApplyWithBLOBs.dateLength}" class="form-control"></input>
                    </div> 
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-8">
                    <div class="form-group">
                      <label>申请说明</label>
                      <textarea type="text" id="pre_content" name="preContent" value="" placeholder="请填写申请说明" style="width: 100%;">${repairApplyWithBLOBs.preContent}</textarea>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-8">
                    <div class="form-group">
                      <label>审核说明</label>
                      <textarea disabled="disabled" type="text" id="check_content" name="check_content" value="" style="width: 100%;height: 100px">
一审说明：${repairApplyWithBLOBs.check1Content}
二审说明：${repairApplyWithBLOBs.check2Content}
三审说明：${repairApplyWithBLOBs.check3Content}
                      </textarea>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
				          <div class="col-md-offset-12 col-md-9">
                    <button class="btn btn-block btn-primary btn-lg" id="btn" type="submit" item-width="50%" >
									    保存		
  			            </button>
                  </div>
                </div>
              </div>
          </div>
          </form>
        </div>

  </section>
    <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <jsp:include page="../module/foot.jsp" />

</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->


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

    $('#repair_date').datepicker({
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
