<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>船舶管理系统 | 申请审核</title>
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
    
    <script>
       function getUrl(){
            var url = $("#urll").val();
            var form=document.getElementById("1-1");
            form.action=url;
            form.submit();
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
                资料管理
                <small>申请审核</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index"><i class="fa fa-dashboard"></i>首页</a></li>
                <li><a href="${pageContext.request.contextPath}/document/documentApplyList"><i class="fa fa-dashboard"></i>资料申请列表</a></li>
                <li class="active">当前</li>
            </ol>
        </section>

        <!--资料新增-->       
        <section class="content">

        <div class="tab-pane">
            <input type="hidden" id="urll" value="${pageContext.request.contextPath}/document/documentApplyCheckNo?id=${documentApply.id}"/>
            <form method="POST" id="1-1"  action="${pageContext.request.contextPath}/document/documentApplyCheckYes?id=${documentApply.id}"> 
              <div class="box-body">
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>资料名称</label>
                      <input type="hidden" type="text" id="id" name="id" placeholder="请填写id" value="${documentApply.id}" class="form-control"></input>
                      <input disabled="disabled" type="text" id="name" name="name" placeholder="请填写资料名称" value="${documentApply.name}" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>出版社</label>
                      <input disabled="disabled" type="text" id="publish" name="publish0" placeholder="请填写出版社名称" value="${documentApply.publish}" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>计量单位</label>
                      <c:if test=""></c:if>
                      <select disabled="disabled" id="unit" name="unit" class="form-control select2">
      <c:if test="${documentApply.unit==0}"><option value="0" selected="selected">个</option></c:if>
      <c:if test="${documentApply.unit==1}"><option value="1" selected="selected">条</option></c:if>
      <c:if test="${documentApply.unit==2}"><option value="2" selected="selected">根</option></c:if>
      <c:if test="${documentApply.unit==3}"><option value="3" selected="selected">套</option></c:if>
      <c:if test="${documentApply.unit==4}"><option value="4" selected="selected">米</option></c:if>
      <c:if test="${documentApply.unit==5}"><option value="5" selected="selected">升</option></c:if>
      <c:if test="${documentApply.unit==6}"><option value="6" selected="selected">公斤</option></c:if>
      <c:if test="${documentApply.unit==7}"><option value="7" selected="selected">组</option></c:if>
      <c:if test="${documentApply.unit==8}"><option value="8" selected="selected">桶</option></c:if>
      <c:if test="${documentApply.unit==9}"><option value="9" selected="selected">罐</option></c:if>
      <c:if test="${documentApply.unit==10}"><option value="10" selected="selected">艘</option></c:if>
      <c:if test="${documentApply.unit==11}"><option value="11" selected="selected">台</option></c:if>
      <c:if test="${documentApply.unit==12}"><option value="12" selected="selected">瓶</option></c:if>
      <c:if test="${documentApply.unit==13}"><option value="13" selected="selected">箱</option></c:if>
      <c:if test="${documentApply.unit==14}"><option value="14" selected="selected">英尺</option></c:if>
      <c:if test="${documentApply.unit==15}"><option value="15" selected="selected">磅</option></c:if>
      <c:if test="${documentApply.unit==16}"><option value="16" selected="selected">其他1</option></c:if>
      <c:if test="${documentApply.unit==17}"><option value="17" selected="selected">其他2</option></c:if>
      <c:if test="${documentApply.unit==18}"><option value="18" selected="selected">其他3</option></c:if>      
                      </select>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>作者</label>
                      <input disabled="disabled" type="text" id="author" name="author" placeholder="请填写作者名称" value="${documentApply.author}" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>数量</label>
                      <input disabled="disabled" type="text" id="num" name="num" placeholder="请填写资料数量" value="${documentApply.num}" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <div id="div_boat">
                        <label>所属船舶</label>
                        <select disabled="disabled" id="boat_id" name="boat_id" class="form-control select2" style="width: 100%;">
                          <option value="${documentApply.boat_id}" selected="selected">${documentApply.boat_name}</option>
                       </select>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <!--第一列-->
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>需求时间</label>
                      <div class="input-group date">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input disabled="disabled" type="text" class="form-control pull-right" id="pre_date" name="pre_date" value ="${documentApply.pre_date}"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label>备注说明</label>
                      <textarea disabled="disabled" type="text" id="content" name="content" value="" placeholder="请填写资料备注说明" style="width: 100%;">${documentApply.content}</textarea>
                    </div>
                    <div class="form-group">
                      <label>审核说明</label>
                      <textarea type="text" id="content_check" name="content_check" value="" placeholder="请填写资料审核说明" style="width: 100%;"></textarea>
                    </div>
                  </div>
                  <!--第二列-->
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>预期停靠地点</label>
                      <input disabled="disabled" type="text" id="pre_local" name="pre_local" placeholder="请填写预期停靠地点" value="${documentApply.pre_local}" class="form-control"></input>
                    </div>
                  </div>
                </div>

                <div class="col-md-4">
				          <div class="col-md-offset-12 col-md-9">
                    <button class="btn btn-block btn-primary btn-lg" id="btn" type="submit" item-width="50%" >
									    通过		
  			            </button>
                    &nbsp; &nbsp; &nbsp;
                    <button class="btn btn-block btn-danger btn-lg" id="btn" type="submit" item-width="50%" onclick="getUrl()">
									    拒绝		
  			            </button>
                </div>
              </div>
              
            </form>
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
</script>
</body>

</html>
