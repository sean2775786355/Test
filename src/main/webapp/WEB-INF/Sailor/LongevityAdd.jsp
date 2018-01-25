<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>船舶管理系统 | 新增海历</title>
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
                <small>新增海历</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index"><i class="fa fa-dashboard"></i>首页</a></li>
                <li><a href="${pageContext.request.contextPath}/Sailor/SailorList"><i class="fa fa-dashboard"></i>人员列表</a></li>
                <li class="active">当前</li>
            </ol>
        </section>

         <!--海历新增-->       
         <section class="content">
         <!-- 获取sailor_id -->

         <input type="hidden" id="sailor_id" name="sailor_id" value="${sailor_id}"></input>

        <div class="tab-pane">
              <div class="box-body">
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>船舶归属</label>
                      <select id="belong" name="belong" class="form-control select2" style="width: 100%;" onchange="boatbelong()">
                        <option value="0" selected="selected">本公司船舶</option>
                        <option value="1">其他船舶</option>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-6">
                     <div class="form-group">
                      <div id="div_boat">
                        <label>船舶</label>
                        <select id="boat_id" name="boat_id" class="form-control select2" style="width: 100%;">
                          <option value="0" selected="selected">空</option>
                          <option value="1">育鲲</option>
                          <option value="2">尼米兹</option>
                          <option value="3">伯克</option>
                          <option value="4">海龙</option>
                       </select>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <!--第一列-->
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>船舶名称</label>
                      <input disabled="disabled"  type="text" id="boat_name" name="boat_name" placeholder="请填写船舶名称" value="" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>船舶类型</label>
                        <select  disabled="disabled" id="boat_type" name="boat_type" class="form-control select2" style="width: 100%;">
                          <option value="0" selected="selected">空</option>
                          <option value="1">育鲲</option>
                          <option value="2">尼米兹</option>
                          <option value="3">伯克</option>
                          <option value="4">海龙</option>
                       </select>
                    </div>
                    <div class="form-group">
                      <label>主机型号</label>
                      <input disabled="disabled"  type="text" id="model" name="model" placeholder="请填写主机型号" value="" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>所属船公司</label>
                      <input  disabled="disabled" type="text" id="company" name="company" placeholder="请填写所属船公司" value="" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>上船时间</label>
                      <div class="input-group date">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input type="text" class="form-control pull-right" id="onboard_time" name="onboard_time"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label>职务</label>
                      <select id="duty" name="duty"  class="form-control select2">
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
                        <option value="20">海务管理员</option>
                        <option value="21">机务管理员</option>
                        <option value="22">海务主管</option>
                        <option value="23">机务主管</option>
                        <option value="80">其他1</option>
                        <option value="81">其他2</option>
                        <option value="83">其他3</option>
                        <option value="84">岸基管理员</option>
                        <option value="99">面试生</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label>海历说明</label>
                      <textarea type="text" id="content" name="content" value="" placeholder="请填写海历说明" style="width: 100%;"></textarea>
                    </div>
                  </div>
                  <!--第二列-->
                  <div class="col-md-6">
                     <div class="form-group">
                      <label>IMO代码</label>
                      <input disabled="disabled"  type="text" id="boat_IMO" name="boat_IMO" placeholder="请填写IMO代码" value="" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>船舶吨位</label>
                      <input  disabled="disabled" type="text" id="tonnage" name="tonnage" placeholder="请填写船舶吨位" value="" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>船舶马力</label>
                      <input  disabled="disabled" type="text" id="horsepower" name="horsepower" placeholder="请填写船舶马力" value="" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>航线</label>
                      <input type="text" id="lane" name="lane" placeholder="请填写所航线" value="" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>下船时间</label>
                      <div class="input-group date">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input type="text" class="form-control pull-right" id="ashore_time" name="ashore_time"/>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="col-md-4">
				          <div class="col-md-offset-12 col-md-9">
                    <button class="btn btn-block btn-primary btn-lg" id="btn" type="submit" item-width="50%" >
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
    $('#onboard_time').datepicker({
      autoclose: true
    });
    $('#ashore_time').datepicker({
      autoclose: true
    });

    
    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false
    });

  });


function boatbelong(){
    var obj = document.getElementById("belong");
    //alert(obj.value);
    if(obj.value == 0){
      document.getElementById("boat_id").disabled = false;
      document.getElementById("boat_name").disabled = true;
      document.getElementById("boat_type").disabled = true;
      document.getElementById("model").disabled = true;
      document.getElementById("company").disabled = true;
      document.getElementById("boat_IMO").disabled = true;
      document.getElementById("tonnage").disabled = true;
      document.getElementById("horsepower").disabled = true;
    }else{
      document.getElementById("boat_id").disabled = true;
      document.getElementById("boat_name").disabled = false;
      document.getElementById("boat_type").disabled = false;
      document.getElementById("model").disabled = false;
      document.getElementById("company").disabled = false;
      document.getElementById("boat_IMO").disabled = false;
      document.getElementById("tonnage").disabled = false;
      document.getElementById("horsepower").disabled = false;
    }
  };

    //获取人员信息
    function getParms(){
    	var sailor_id = $('#sailor_id').val();
    	var belong = $('#belong').val();
    	var duty = $('#duty').val();
    	var onboard_time = $('#onboard_time').val();
    	var ashore_time = $('#ashore_time').val();
    	var boat_id = $('#boat_id').val();
    	var boat_name = $('#boat_name').val();
    	var boat_IMO = $('#boat_IMO').val();
    	var boat_type = $('#boat_type').val();
    	var tonnage = $('#tonnage').val();
    	var horsepower = $('#horsepower').val();
    	var model = $('#model').val();
    	var company = $('#company').val();
    	var content = $('#content').val();
    	var lane = $('#lane').val();

        var data ={
        	"sailor_id" : sailor_id,
            "belong" : belong,
            "duty" : duty,
            "onboard_time" : onboard_time,
            "ashore_time" : ashore_time,
            "boat_id" : boat_id,
            "boat_name" : boat_name,
            "boat_IMO" : boat_IMO,
            "boat_type" : boat_type,
            "tonnage" : tonnage,
            "horsepower" : horsepower,
            "model" : model,
            "company" : company,
            "content" : content,
            "lane" : lane,
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
		
		if (data.onboard_time=="")
		{
			alert("上船时间不能为空");
			return false;
		}
		if (data.ashore_time=="")
		{
			alert("下船时间不能为空");
			return false;
		}
		if (data.boat_id=="")
		{
			alert("船舶ID不能为空");
			return false;
		}
		if (data.boat_name=="")
		{
			alert("船舶名称不能为空");
			return false;
		}
		if (data.boat_IMO=="")
		{
			alert("船舶IMO编号不能为空");
			return false;
		}
		
		if (data.boat_type=="")
		{
			alert("船舶类型不能为空");
			return false;
		}
		if (data.tonnage=="")
		{
			alert("船舶吨位不能为空");
			return false;
		}
		if (data.horsepower=="")
		{
			alert("主机马力不能为空");
			return false;
		}
		if (data.model=="")
		{
			alert("主机型号不能为空");
			return false;
		}
		if (data.company=="")
		{
			alert("船舶公司不能为空");
			return false;
		}
		if (data.content=="")
		{
			alert("其他说明不能为空");
			return false;
		}
		if (data.lane=="")
		{
			alert("航线不能为空");
			return false;
		}
		return true;
	}

    //将数据提交给后台
    function  submit(data) {
        var root = $('#main-header').attr("data-id");
        $.ajax({
            url: root+'/Sailor/LongevityPost',
            type: 'POST',
            dataType: 'json',
            data: data,
        }).done(function (data) {
        			//提示信息
                    alert("海历信息已添加");
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
