<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>船舶管理系统 | 新增申请</title>
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
                资料管理
                <small>新增申请</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index"><i class="fa fa-dashboard"></i>首页</a></li>
                <li><a href="${pageContext.request.contextPath}/document/documentList"><i class="fa fa-dashboard"></i>资料列表</a></li>
                <li class="active">当前</li>
            </ol>
        </section>

        <!--资料新增-->       
        <section class="content">

        <div class="tab-pane">
              <div class="box-body">
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>资料名称</label>
                      <input type="text" id="name" name="name" placeholder="请填写资料名称" value="" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>出版社</label>
                      <input type="text" id="publish" name="publish0" placeholder="请填写出版社名称" value="" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>计量单位</label>
                      <select id="unit" name="unit" class="form-control select2">
                        <option value="1" selected="selected">条</option>
                        <option value="2">根</option>
                        <option value="3">套</option>
                        <option value="4">米</option>
                        <option value="5">升</option>
                        <option value="0">个</option>
                        <option value="6">公斤</option>
                        <option value="7">组</option>
                        <option value="8">桶</option>
                        <option value="9">罐</option>
                        <option value="10">艘</option>
                        <option value="11">台</option>
                        <option value="12">瓶</option>
                        <option value="13">箱</option>
                        <option value="14">英尺</option>
                        <option value="15">磅</option>
                        <option value="16">其他1</option>
                        <option value="17">其他2</option>
                        <option value="18">其他3</option>          
                      </select>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>作者</label>
                      <input type="text" id="author" name="author" placeholder="请填写作者名称" value="" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>数量</label>
                      <input type="text" id="num" name="num" placeholder="请填写资料数量" value="" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <div id="div_boat">
                        <label>所属船舶</label>
                        <select id="boat_id" name="boat_id" class="form-control select2" style="width: 100%;">
                          <option value="0" selected="selected">未选择</option>
                          <c:forEach var="boat"  items="${boatList}">
                          <option value="${boat.id}">${boat.name}</option>
                          </c:forEach>
                       </select>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <!--第一列-->
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>预期到达时间</label>
                      <div class="input-group date">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input type="text" class="form-control pull-right" id="pre_date" name="pre_date"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label>备注说明</label>
                      <textarea type="text" id="content" name="content" value="" placeholder="请填写资料备注说明" style="width: 100%;"></textarea>
                    </div>
                  </div>
                  <!--第二列-->
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>预期停靠地点</label>
                      <input type="text" id="pre_local" name="pre_local" placeholder="请填写预期停靠地点" value="" class="form-control"></input>
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
    $('#pre_date').datepicker({
      autoclose: true
    });

    
    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false
    });

  });

    //获取人员信息
    function getParms(){
    	var name = $('#name').val();
    	var publish = $('#publish').val();
    	var unit = $('#unit').val();
    	var author = $('#author').val();
    	var boat_id = $('#boat_id').val();
    	var pre_date = $('#pre_date').val();
    	var content = $('#content').val();
    	var num = $('#num').val();
    	var pre_local = $('#pre_local').val();

        var data ={
        	"name" : name,
            "publish" : publish,
            "unit" : unit,
            "author" : author,
            "boat_id" : boat_id,
            "pre_date" : pre_date,
            "content" : content,
            "num" : num,
            "pre_local" : pre_local,
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
			alert("资料名称不能为空");
			return false;
		}
		if (data.publish=="")
		{
			alert("出版时间不能为空");
			return false;
		}
		if (data.unit=="")
		{
			alert("计量单位不能为空");
			return false;
		}
		if (data.author=="")
		{
			alert("作者名称不能为空");
			return false;
		}
		if (data.boat_id=="")
		{
			alert("所属船舶不能为空");
			return false;
		}
		if (data.pre_date=="")
		{
			alert("上船时间不能为空");
			return false;
		}
		if (data.content=="")
		{
			alert("说明备注不能为空");
			return false;
		}
		if (data.num=="")
		{
			alert("资料数量不能为空");
			return false;
		}
		if (data.pre_local=="")
		{
			alert("过期时间不能为空");
			return false;
		}
		return true;
	}

    //将数据提交给后台
    function  submit(data) {
        var root = $('#main-header').attr("data-id");
        $.ajax({
            url: root+'/document/documentApplyPost',
            type: 'POST',
            dataType: 'json',
            data: data,
        }).done(function (data) {
        			//提示信息
                    alert("申请信息已添加");
                    setTimeout(function () {
                        window.location.href=root+"/document/documentApplyList";
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
