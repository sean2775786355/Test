<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>船舶管理系统 | 资料信息</title>
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
                <small>资料信息</small>
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
                      <input disabled="true" type="text" id="name" name="name" placeholder="请填写资料名称" value="${document.name}" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>出版社</label>
                      <input disabled="true" type="text" id="publish" name="publish" placeholder="请填写出版社名称" value="${document.publish}" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>计量单位</label>
                      <c:if test=""></c:if>
                      <select disabled="disabled" id="unit" name="unit" class="form-control select2">
      <c:if test="${document.unit==0}"><option value="0" selected="selected">个</option></c:if>
      <c:if test="${document.unit==1}"><option value="1" selected="selected">条</option></c:if>
      <c:if test="${document.unit==2}"><option value="2" selected="selected">根</option></c:if>
      <c:if test="${document.unit==3}"><option value="3" selected="selected">套</option></c:if>
      <c:if test="${document.unit==4}"><option value="4" selected="selected">米</option></c:if>
      <c:if test="${document.unit==5}"><option value="5" selected="selected">升</option></c:if>
      <c:if test="${document.unit==6}"><option value="6" selected="selected">公斤</option></c:if>
      <c:if test="${document.unit==7}"><option value="7" selected="selected">组</option></c:if>
      <c:if test="${document.unit==8}"><option value="8" selected="selected">桶</option></c:if>
      <c:if test="${document.unit==9}"><option value="9" selected="selected">罐</option></c:if>
      <c:if test="${document.unit==10}"><option value="10" selected="selected">艘</option></c:if>
      <c:if test="${document.unit==11}"><option value="11" selected="selected">台</option></c:if>
      <c:if test="${document.unit==12}"><option value="12" selected="selected">瓶</option></c:if>
      <c:if test="${document.unit==13}"><option value="13" selected="selected">箱</option></c:if>
      <c:if test="${document.unit==14}"><option value="14" selected="selected">英尺</option></c:if>
      <c:if test="${document.unit==15}"><option value="15" selected="selected">磅</option></c:if>
      <c:if test="${document.unit==16}"><option value="16" selected="selected">其他1</option></c:if>
      <c:if test="${document.unit==17}"><option value="17" selected="selected">其他2</option></c:if>
      <c:if test="${document.unit==18}"><option value="18" selected="selected">其他3</option></c:if>      
                      </select>
                    </div>
                    <div class="form-group">
                      <label>计算币种</label>
                      <select disabled="disabled" id="currency" name="currency" class="form-control select2">
      <c:if test="${document.currency==0}"><option value="0" selected="selected">人民币</option></c:if>
      <c:if test="${document.currency==1}"><option value="1" selected="selected">美元</option></c:if>
      <c:if test="${document.currency==2}"><option value="2" selected="selected">澳元</option></c:if>
      <c:if test="${document.currency==3}"><option value="3" selected="selected">瑞士法郎</option></c:if>
      <c:if test="${document.currency==4}"><option value="4" selected="selected">欧元</option></c:if>
      <c:if test="${document.currency==5}"><option value="5" selected="selected">英镑</option></c:if>
      <c:if test="${document.currency==6}"><option value="6" selected="selected">港币</option></c:if>
      <c:if test="${document.currency==7}"><option value="7" selected="selected">日元</option></c:if>
      <c:if test="${document.currency==8}"><option value="8" selected="selected">瑞典克朗</option></c:if>
      <c:if test="${document.currency==9}"><option value="9" selected="selected">新元</option></c:if>
      <c:if test="${document.currency==10}"><option value="10" selected="selected">韩元</option></c:if>
      <c:if test="${document.currency==11}"><option value="11" selected="selected">卢布</option></c:if>                       
                      </select>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>作者</label>
                      <input disabled="true" type="text" id="author" name="author" placeholder="请填写作者名称" value="${document.author}" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>数量</label>
                      <input disabled="true" type="text" id="num" name="num" placeholder="请填写资料数量" value="${document.num}" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>单价</label>
                      <input disabled="true" type="text" id="cost" name="cost" placeholder="请填写资料单价" value="${document.cost}" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <div id="div_boat">
                        <label>所属船舶</label>
                        <select disabled="disabled" id="boat_id" name="boat_id" class="form-control select2" style="width: 100%;">
                          <option value="${document.boat_id}" selected="selected">${document.boat_name}</option>
                       </select>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <!--第一列-->
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>上船时间</label>
                      <div class="input-group date">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input disabled="true" type="text" class="form-control pull-right" id="work_date" name="work_date" value ="${document.work_date}"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label>备注说明</label>
                      <textarea disabled="true" type="text" id="content" name="content" value="${document.content}" placeholder="请填写资料备注说明" style="width: 100%;">${document.content}</textarea>
                    </div>
                  </div>
                  <!--第二列-->
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>过期时间</label>
                      <div class="input-group date">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input disabled="true" type="text" class="form-control pull-right" id="out_date" name="out_date" value = "${document.out_date}"/>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="col-md-4">
				  <div class="col-md-offset-12 col-md-9">

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
    	var name = $('#name').val();
    	var publish = $('#publish').val();
    	var unit = $('#unit').val();
    	var author = $('#author').val();
    	var cost = $('#cost').val();
    	var currency = $('#currency').val();
    	var boat_id = $('#boat_id').val();
    	var work_date = $('#work_date').val();
    	var content = $('#content').val();
    	var num = $('#num').val();
    	var out_date = $('#out_date').val();

        var data ={
        	"name" : name,
            "publish" : publish,
            "unit" : unit,
            "author" : author,
            "cost" : cost,
            "currency" : currency,
            "boat_id" : boat_id,
            "work_date" : work_date,
            "content" : content,
            "num" : num,
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
		if (data.cost=="")
		{
			alert("单价编号不能为空");
			return false;
		}
		
		if (data.currency=="")
		{
			alert("计算币种不能为空");
			return false;
		}
		if (data.boat_id=="")
		{
			alert("所属船舶不能为空");
			return false;
		}
		if (data.work_date=="")
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
		if (data.out_date=="")
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
            url: root+'/document/documentPost',
            type: 'POST',
            dataType: 'json',
            data: data,
        }).done(function (data) {
        			//提示信息
                    alert("资料信息已添加");
                    setTimeout(function () {
                        window.location.href=root+"/document/documentList";
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
