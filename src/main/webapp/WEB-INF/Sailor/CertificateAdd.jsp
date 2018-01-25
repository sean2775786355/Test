<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>船舶管理系统 | 新增证书</title>
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
                人员信息
                <small>新增证书</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index"><i class="fa fa-dashboard"></i>首页</a></li>
                <li><a href="${pageContext.request.contextPath}/Sailor/SailorList"><i class="fa fa-dashboard"></i>人员列表</a></li>
                <li class="active">当前</li>
            </ol>
        </section>

         <!--证书新增-->
          <section class="content">
        <div class="tab-pane">
              <div class="box-body">
                <div class="row">
                <!-- 获取sailor_id -->  
                   	  <input type="hidden" disabled="disabled" id="sailor_id" name="sailor_id" value="${sailor_id}"></input>

                  <!--第一列-->
                  <div class="col-md-6">
                    <div class="form-group">
                    
                      <label>证书名称</label>
                      <input type="text" id="name" name="name" placeholder="请填写证书名称" value="" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>证书等级</label>
                      <select id="level" name="level" class="form-control select2" style="width: 100%;">
                        <option value="1" selected="selected">甲级</option>
                        <option value="2">乙级</option>
                        <option value="3">丙级</option>
                        <option value="4">丁级</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label>发证日期</label>
                      <div class="input-group date">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input type="text" class="form-control pull-right" id="work_date" name="work_date"/>
                      </div>
                    </div>
                  </div>
                  <!--第二列-->
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>证书编号</label>
                      <input type="text" id="num" name="num" placeholder="请填写证书名号" value="" class="form-control"></input>
                    </div>
                     <div class="form-group">
                      <label>适用职务</label>
                      <select id="duty" name="duty" class="form-control select2" style="width: 100%;">
                        <option value="1" selected="selected">船长</option>
                        <option value="2">大副</option>
                        <option value="3">二副</option>
                        <option value="4">三副</option>
                        <option value="5">水手长</option>
                        <option value="0">水手</option>
                        <option value="6">轮机长</option>
                        <option value="7">大管轮</option>
                        <option value="8">二管轮</option>
                        <option value="9">三管轮</option>
                        <option value="10">机工长</option>
                        <option value="11">机匠</option>
                        <option value="12">实习生</option>
                        <option value="13">大厨</option>
                        <option value="14">二厨</option>
                        <option value="15">电机员</option>
                        <option value="16">船医</option>
                        <option value="17">政委</option>
                        <option value="18">铜匠</option>
                        <option value="19">木匠</option>
                        <option value="80">其他1</option>
                        <option value="81">其他2</option>
                        <option value="83">其他3</option>
                        <option value="84">岸基管理员</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label>过期日期</label>
                      <div class="input-group date">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input type="text" class="form-control pull-right" id="out_date" name="out_date"/>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="col-md-4">
				          <div class="col-md-offset-12 col-md-9">
                    <button class="btn btn-block btn-primary btn-lg" id="btn" item-width="50%" >
									    提交
  			            </button>
                  </div>
                </div>
                
              </div>
              
        </div>
 	
	</section>
    </div>
    </div>
    <!-- Main Footer -->
    <jsp:include page="../module/foot.jsp" />


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
    $('#work_date').datepicker({
      autoclose: true
    });
    $('#out_date').datepicker({
      autoclose: true
    });

    
    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false
    });

  });
	

    //获取人员信息
    function getParms(){
    	var sailor_id = $('#sailor_id').val();
    	var name = $('#name').val();
    	var num = $('#num').val();
    	var level = $('#level').val();
    	var duty = $('#duty').val();
    	var work_date = $('#work_date').val();
    	var out_date = $('#out_date').val();
    	

        var data ={
        	"sailor_id" : sailor_id,
            "name" : name,
            "num" : num,
            "level" : level,
            "duty" : duty,
            "work_date" : work_date,
            "out_date" : out_date,
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
			alert("证书名称不能为空");
			return false;
		}
		if (data.level=="")
		{
			alert("证书等级不能为空");
			return false;
		}
		if (data.work_date=="")
		{
			alert("发证日期不能为空");
			return false;
		}
		if (data.num=="")
		{
			alert("证书编号不能为空");
			return false;
		}
		if (data.duty=="")
		{
			alert("职务不能为空");
			return false;
		}
		
		if (data.out_date=="")
		{
			alert("过期日期不能为空");
			return false;
		}
		return true;
	}

    //将数据提交给后台
    function  submit(data) {
        var root = $('#main-header').attr("data-id");
        $.ajax({
            url: root+'/Sailor/CertificatePost',
            type: 'POST',
            dataType: 'json',
            data: data,
        }).done(function (data) {
        			//提示信息
                    alert("证书信息已添加");
                    setTimeout(function () {
                        window.location.href=root+"/Sailor/SailorList";
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
