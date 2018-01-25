<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>维修厂信息 | 维修厂详细信息</title>
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
        维修厂信息
        <small>维修厂详细信息</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
      	<li><a href="${pageContext.request.contextPath}/repair/repairFactoryInfo">维修厂信息</a></li>
        <li class="active">维修厂详细信息</li>
      </ol>
    </section>

      <!-- Main content -->
    <section class="content">
      <!-- service_date EXAMPLE -->
      <!--  -->
      <div class="box box-default">
        <div class="box-header with-border">
          <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_1" data-toggle="tab">维修厂信息</a></li>
            </ul>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <!-- /.box-header -->
        <div class="tab-content">
          <!-- 人员信息 -->
          <input id="id" name="id" type="hidden" value="${repairFactory.id}"/>
          <div class="tab-pane active" id="tab_1">
              <div class="box-body">
                <div class="row">
                  <!--第一列-->
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>维修厂名称</label>
                      <input id="name" name="name" type="text" placeholder="请填写维修厂名称" value="${repairFactory.name}" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>维修厂电话</label>
                      <div class="input-group">
                        <div class="input-group-addon">
                          <i class="fa fa-phone"></i>
                        </div>
                        <input type="text" id="phone" name="phone" placeholder="请填写维修厂电话" value="${repairFactory.phone}" class="form-control"></input>
                      </div>
                    </div>             
                     <div class="form-group">
                      <label>维修厂地址</label>
                      <input type="text" id="location" name="location" placeholder="请填写维修厂地址" value="${repairFactory.location}" class="form-control"></input>
                    </div>                   
                  </div>
                  <!--第二列-->
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>维修厂联系人</label>
                      <input type="text" id="linkman" name="linkman" placeholder="请填写维修厂联系人" value="${repairFactory.linkman}" class="form-control"></input>
                    </div>
                     <div class="form-group">
                      <label>维修厂传真</label>
                      <div class="input-group">
                        <div class="input-group-addon">
                          <i class="fa fa-phone"></i>
                        </div>
                        <input type="text" id="fax" name="fax" placeholder="请填写维修厂传真" value="${repairFactory.fax}" class="form-control"></input>
                      </div>
                    </div>             
                  </div>
                  <!--第三列-->
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>维修厂邮箱</label>
                      <input type="text" id="email" name="email" placeholder="请填写维修厂邮箱" value="${repairFactory.email}" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>移动电话</label>
                      <div class="input-group">
                        <div class="input-group-addon">
                          <i class="fa fa-phone"></i>
                        </div>
                        <input type="text" id="moblie_phone" name="moblie_phone" placeholder="请填写移动电话" value="${repairFactory.mobilePhone}" class="form-control"></input>
                      </div>
                    </div>    
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-8">
                    <div class="form-group">
                      <label>其他说明</label>
                      <textarea type="text" id="content" name="content" value="" placeholder="请填写其他说明" style="width: 100%;">${repairFactory.content}</textarea>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-8">
                    <div class="form-group">
                      <label>污点记录</label>
                      <textarea type="text" id="bad_content" name="bad_content" value="" placeholder="" style="width: 100%;">${repairFactory.badContent}</textarea>
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

    $('#gra_time').datepicker({
      autoclose: true
    });
    $('#birth').datepicker({
      autoclose: true
    });
    $('#time').datepicker({
      autoclose: true
    });
    $('#initial_time').datepicker({
      autoclose: true,
      currentText: 'Now'
    });
    $('#product_time').datepicker({
      autoclose: true
    });
    $('#update_initial_time').datepicker({
      autoclose: true,
      currentText: 'Now'
    });
    $('#update_product_time').datepicker({
      autoclose: true
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
  
  //获取人员信息
    function getParms(){
    	var id = $('#id').val();
    	var name = $('#name').val();
    	var phone = $('#phone').val();
    	var location = $('#location').val();
    	var linkman = $('#linkman').val();
    	var fax = $('#fax').val();
    	var email = $('#email').val();
    	var moblie_phone = $('#moblie_phone').val();
    	var content = $('#content').val();
    	
        var data ={
        	"id" : id,
            "name" : name,
            "phone" : phone,
            "location" : location,
            "linkman" : linkman,
            "fax" : fax,
            "email" : email,
            "moblie_phone" : moblie_phone,
            "content" : content
        }
        return data;
    }
    $(function(){
        $('#btn').click(function(){
            var data = getParms();
            check_data(data);
            console.log(data);
            submit(data);
        });
    });
    //实现表单验证
    function check_data(data)
	{
		
		if (data.name=="")
		{
			alert("维修厂名称不能为空");
			return false;
		}
		if (data.phone=="")
		{
			alert("电话号不能为空");
			return false;
		}
		if (data.location=="")
		{
			alert("地址不能为空");
			return false;
		}
		if (data.linkman=="")
		{
			alert("联系人不能为空");
			return false;
		}
		if (data.fax=="")
		{
			alert("传真不能为空");
			return false;
		}
		if (data.email=="")
		{
			alert("电子邮箱不能为空");
			return false;
		}
		if (data.moblie_phone=="")
		{
			alert("移动电话不能为空");
			return false;
		}
		if (data.content=="")
		{
			alert("其他说明不能为空");
			return false;
		}
		return true;
	}

    //将数据提交给后台
    function  submit(data) {
        var root = $('#main-header').attr("data-id");
        $.ajax({
            url: root+'/repair/repairFactoryUpdate',
            type: 'POST',
            dataType: 'json',
            data: data,
        }).done(function (data) {
        			//提示信息
                    alert("维修厂已成功保存");
                    setTimeout(function () {
                        window.location.href=root+"/repair/repairFactoryInfo";
                    },1000*2);
                    //刷新页面
                })
                .fail(function () {
                    console.log("error");
                })
                .always(function () {
                    console.log("complete");
                });

    }
</script>
</body>

</html>
