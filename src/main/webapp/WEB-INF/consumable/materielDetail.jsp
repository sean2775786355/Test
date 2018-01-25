<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>船舶信息 | 物料编辑</title>
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
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/skins/_all-skins.min.css">

  <!-- DataTables -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  
    <script>
      function upload() {
          var filename = document.getElementById("url").value;
          // 这时的filename不是 importFile 框中的值
          alert(filename);
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
        物料信息
        <small>物料具体信息</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
        <li><a href="#">物料信息</a></li>
        <li class="active">物料具体信息</li>
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
              <li class="active"><a href="#tab_1" data-toggle="tab">物料信息</a></li>            
            </ul>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>
        </div>
        <!-- /.box-header -->
        <div class="tab-content">
          <!-- 人员信息 -->
          <div class="tab-pane active" id="tab_1">
  <!--        <form method="POST" id="" name="" action="" role="form"> -->
              <div class="box-body">
                <div class="row">
                   <!--第一列-->
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>物料名称</label>
                      <input id="id" name="id" type="hidden" placeholder="请填写id名称" value="${materiel.id}" class="form-control"></input>
                      <input id="name" name="name" type="text" placeholder="请填写物料名称" value="${materiel.name}" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>物料类型</label>
                      <input id="type" name="type" type="text" placeholder="请填写物料类型" value="${materiel.type}" class="form-control"></input>
                    </div>
                     <div class="form-group">
                      <label>级别</label>
                      <input type="text" id="level" name="level" placeholder="请填写级别" value="${materiel.level}" class="form-control"></input>
                    </div>
                   <div class="form-group">
                      <label>计量单位</label>
                      <select id="unit" name="unit" class="form-control select2">
      <c:if test="${materiel.unit==0}"><option value="0" selected="selected">个</option></c:if>
      <c:if test="${materiel.unit==1}"><option value="1" selected="selected">条</option></c:if>
      <c:if test="${materiel.unit==2}"><option value="2" selected="selected">根</option></c:if>
      <c:if test="${materiel.unit==3}"><option value="3" selected="selected">套</option></c:if>
      <c:if test="${materiel.unit==4}"><option value="4" selected="selected">米</option></c:if>
      <c:if test="${materiel.unit==5}"><option value="5" selected="selected">升</option></c:if>
      <c:if test="${materiel.unit==6}"><option value="6" selected="selected">公斤</option></c:if>
      <c:if test="${materiel.unit==7}"><option value="7" selected="selected">组</option></c:if>
      <c:if test="${materiel.unit==8}"><option value="8" selected="selected">桶</option></c:if>
      <c:if test="${materiel.unit==9}"><option value="9" selected="selected">罐</option></c:if>
      <c:if test="${materiel.unit==10}"><option value="10" selected="selected">艘</option></c:if>
      <c:if test="${materiel.unit==11}"><option value="11" selected="selected">台</option></c:if>
      <c:if test="${materiel.unit==12}"><option value="12" selected="selected">瓶</option></c:if>
      <c:if test="${materiel.unit==13}"><option value="13" selected="selected">箱</option></c:if>
      <c:if test="${materiel.unit==14}"><option value="14" selected="selected">英尺</option></c:if>
      <c:if test="${materiel.unit==15}"><option value="15" selected="selected">磅</option></c:if>
      <c:if test="${materiel.unit==16}"><option value="16" selected="selected">其他1</option></c:if>
      <c:if test="${materiel.unit==17}"><option value="17" selected="selected">其他2</option></c:if>
      <c:if test="${materiel.unit==18}"><option value="18" selected="selected">其他3</option></c:if>
                        <option value="1">条</option>
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
                  <!--第二列-->
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>物料编号</label>
                      <input type="text" id="code" name="code" placeholder="请填写物料编号" value="${materiel.code}" class="form-control"></input>
                    </div>
                     <div class="form-group">
                      <label>标准号</label>
                      <input type="text" id="standard_code" name="standard_code" placeholder="请填写标准号" value="${materiel.standard_code}" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>负责人</label>
                      <select id="duty" name="duty" class="form-control select2">
      <c:if test="${materiel.duty==0}"><option value="0" selected="selected">水手</option></c:if>
      <c:if test="${materiel.duty==1}"><option value="1" selected="selected">船长</option></c:if>
      <c:if test="${materiel.duty==2}"><option value="2" selected="selected">大副</option></c:if>
      <c:if test="${materiel.duty==3}"><option value="3" selected="selected">二副</option></c:if>
      <c:if test="${materiel.duty==4}"><option value="4" selected="selected">三副</option></c:if>
      <c:if test="${materiel.duty==5}"><option value="5" selected="selected">水手长</option></c:if>
      <c:if test="${materiel.duty==6}"><option value="6" selected="selected">轮机长</option></c:if>
      <c:if test="${materiel.duty==7}"><option value="7" selected="selected">大管轮</option></c:if>
      <c:if test="${materiel.duty==8}"><option value="8" selected="selected">二管轮</option></c:if>
      <c:if test="${materiel.duty==9}"><option value="9" selected="selected">三管轮</option></c:if>
      <c:if test="${materiel.duty==10}"><option value="10" selected="selected">机工长</option></c:if>
      <c:if test="${materiel.duty==11}"><option value="11" selected="selected">机匠</option></c:if>
      <c:if test="${materiel.duty==12}"><option value="12" selected="selected">实习生</option></c:if>
      <c:if test="${materiel.duty==13}"><option value="13" selected="selected">大厨</option></c:if>
      <c:if test="${materiel.duty==14}"><option value="14" selected="selected">二厨</option></c:if>
      <c:if test="${materiel.duty==15}"><option value="15" selected="selected">电机员</option></c:if>
      <c:if test="${materiel.duty==16}"><option value="16" selected="selected">船医</option></c:if>
      <c:if test="${materiel.duty==17}"><option value="17" selected="selected">政委</option></c:if>
      <c:if test="${materiel.duty==18}"><option value="18" selected="selected">铜匠</option></c:if>
      <c:if test="${materiel.duty==19}"><option value="19" selected="selected">木匠</option></c:if>
      <c:if test="${materiel.duty==20}"><option value="20" selected="selected">海务管理员</option></c:if>
      <c:if test="${materiel.duty==21}"><option value="21" selected="selected">机务管理员</option></c:if>
      <c:if test="${materiel.duty==22}"><option value="22" selected="selected">海务主管</option></c:if>
      <c:if test="${materiel.duty==23}"><option value="23" selected="selected">机务主管</option></c:if>
      <c:if test="${materiel.duty==80}"><option value="80" selected="selected">其他1</option></c:if>
      <c:if test="${materiel.duty==81}"><option value="81" selected="selected">其他2</option></c:if>
      <c:if test="${materiel.duty==83}"><option value="82" selected="selected">其他3</option></c:if>
      <c:if test="${materiel.duty==84}"><option value="83" selected="selected">岸基管理员</option></c:if>
      <c:if test="${materiel.duty==99}"><option value="99" selected="selected">面试生</option></c:if>
                        <option value="1">船长</option>
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
                      <label>单价</label>
                      <input type="text" id="cost" name="cost" placeholder="请填写物料单价" value="${materiel.cost}" class="form-control"></input>
                    </div>
                  </div>
                 <!--第三列-->
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>生产商名称</label>
                      <input type="text" id="productor_name" name="productor_name" placeholder="请填写供应商名称" value="${materiel.productor_name}" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>库存数</label>
                      <input type="text" id="storage" name="storage" placeholder="请填写库存数" value="${materiel.storage}" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>物料规格</label>
                      <input type="text" id="standard" name="standard" placeholder="请填写物料规格" value="${materiel.standard}" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>计算币种</label>
                      <select id="currency" name="currency" class="form-control select2">
      <c:if test="${materiel.currency==0}"><option value="0" selected="selected">人民币</option></c:if>
      <c:if test="${materiel.currency==1}"><option value="1" selected="selected">美元</option></c:if>
      <c:if test="${materiel.currency==2}"><option value="2" selected="selected">澳元</option></c:if>
      <c:if test="${materiel.currency==3}"><option value="3" selected="selected">瑞士法郎</option></c:if>
      <c:if test="${materiel.currency==4}"><option value="4" selected="selected">欧元</option></c:if>
      <c:if test="${materiel.currency==5}"><option value="5" selected="selected">英镑</option></c:if>
      <c:if test="${materiel.currency==6}"><option value="6" selected="selected">港币</option></c:if>
      <c:if test="${materiel.currency==7}"><option value="7" selected="selected">日元</option></c:if>
      <c:if test="${materiel.currency==8}"><option value="8" selected="selected">瑞典克朗</option></c:if>
      <c:if test="${materiel.currency==9}"><option value="9" selected="selected">新元</option></c:if>
      <c:if test="${materiel.currency==10}"><option value="10" selected="selected">韩元</option></c:if>
      <c:if test="${materiel.currency==11}"><option value="11" selected="selected">卢布</option></c:if>
                        <option value="0">人民币</option>
                        <option value="1">美元</option>
                        <option value="2">澳元</option>
                        <option value="3">瑞士法郎</option>
                        <option value="4">欧元</option>
                        <option value="5">英镑</option>
                        <option value="6">港币</option>
                        <option value="7">日元</option>
                        <option value="8">瑞典克朗</option>
                        <option value="9">新元</option>
                        <option value="10">韩元</option>
                        <option value="11">卢布</option>                          
                      </select>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-8">
                    <div class="form-group">
                      <label>其他说明</label>
                      <textarea type="text" id="content" name="content" value="${materiel.content}" placeholder="请填写其他说明" style="width: 100%;">${materiel.content}</textarea>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-4">
                    <div class="col-md-offset-12 col-md-9">
                    <div class="form-group">
                      <label>物料图片</label>
                      <input type="file" id="url" name="url"/>
                    </div>
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
              
      <!-- </form> -->  
          </div>
       
      </div>
  </section>
  </div>
    <!-- /.content -->
  <!-- /.content-wrapper -->
  
   <!-- Main Footer -->
  <jsp:include page="../module/foot.jsp" />

</div>
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
<!-- Page script -->

<!-- DataTables -->
<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>

<script>
 
 function ddd(){
   alert("aaa");
   stopEventBubble(this);

 };

 function stopEventBubble(event){
    var e=event || window.event;
    if (e && e.stopPropagation){ 
      e.stopPropagation();    
    }else{
      e.cancelBubble=true;
    }
  };


  function show(obj){
    var longevity_id = obj.firstChild.value;
    var string = "海历信息：\n" ;
    string += "工作职务： " + "船长\n";
    string += "船舶名称： " + "育鲲\n";
    string += "IMO代码： " + "111\n";
    string += "船舶类型： " + "散货船\n";
    string += "船舶吨位： " + "6000\n";
    string += "主机马力： " + "5000\n";
    string += "主机型号： " + "ASDF\n";
    string += "船舶所属公司： " + "海大\n";
    string += "船舶航线： " + "中日韩线\n";
    string += "上船时间： " + "2016/08/20\n";
    string += "下船时间： " + "2016/09/01\n";
    string += "海历说明： " + "（无）\n";
    alert(string);
  };

  function selectchange(){
    var obj = document.getElementById("status");
    if(obj.value == 1){
      document.getElementById("div_atte").style.visibility = "visible";
    }else{
      document.getElementById("div_atte").style.visibility = "hidden";
    }

  };

  function longevity(){

  }

  function idcheck(){
    var id_num = document.getElementById("id_num");
    var pre_17 = id_num.substr(0,17);
    var last = id_num.substr(17,1);
    if(id_num.length == 18 && isNaN( pre_17 && ( isNaN( last ) || last == 'X' || last == 'x' ))){
    }else{
      alert("身份证输入有误.");
    }
  };

  function boatbelong(){
    var obj = document.getElementById("belong");
    if(obj.value == 0){
      document.getElementById("service_boat_id").disabled = false;
      document.getElementById("boat_name").disabled = true;
      document.getElementById("boat_type").disabled = true;
      document.getElementById("model").disabled = true;
      document.getElementById("company").disabled = true;
      document.getElementById("boat_IMO").disabled = true;
      document.getElementById("tonnage").disabled = true;
      document.getElementById("horsepower").disabled = true;
    }else{
      document.getElementById("service_boat_id").disabled = true;
      document.getElementById("boat_name").disabled = false;
      document.getElementById("boat_type").disabled = false;
      document.getElementById("model").disabled = false;
      document.getElementById("company").disabled = false;
      document.getElementById("boat_IMO").disabled = false;
      document.getElementById("tonnage").disabled = false;
      document.getElementById("horsepower").disabled = false;
    }
  };

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
    $('#ashore_time').datepicker({
      autoclose: true
    });
    $('#onboard_time').datepicker({
      autoclose: true
    });
    $('#work_date').datepicker({
      autoclose: true
    });
    $('#out_date').datepicker({
      autoclose: true
    });
    $('#time').datepicker({
      autoclose: true
    });
    $('#initial_time').datepicker({
      autoclose: true,
      currentText:'Now'
    });
    $('#product_time').datepicker({
      autoclose: true
    });
    $('#update_initial_time').datepicker({
      autoclose: true,
      currentText:'Now'
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
  
    //获取人员信息
    function getParms(){
        var id = $('#id').val();
    	var name = $('#name').val();
    	var code = $('#code').val();
    	var productor_name = $('#productor_name').val();
    	var type = $('#type').val();
    	var standard_code = $('#standard_code').val();
    	var standard = $('#standard').val();
    	var level = $('#level').val();
    	var duty = $('#duty').val();
    	var storage = $('#storage').val();
    	var unit = $('#unit').val();
    	var cost = $('#cost').val();
    	var content = $('#content').val();
    	var url = $('#url').val();
    	var currency = $('#currency').val();
    	
        var data ={
            "id" : id,
            "name" : name,
            "code" : code,
            "productor_name" : productor_name,
            "type" : type,
            "standard_code" : standard_code,
            "standard" : standard,
            "level" : level,
            "duty" : duty,
            "storage" : storage,
            "unit" : unit,
            "cost" : cost,
            "content" : content,
            "url" : url,
            "currency" : currency
        };
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
			alert("物料名称不能为空");
			return false;
		}
		if (data.code=="")
		{
			alert("物料编码不能为空");
			return false;
		}
		if (data.productor_name=="")
		{
			alert("生产商名称不能为空");
			return false;
		}
		if (data.type=="")
		{
			alert("物料类型不能为空");
			return false;
		}
		if (data.standard_code=="")
		{
			alert("标准号不能为空");
			return false;
		}
		if (data.standard=="")
		{
			alert("物料规格不能为空");
			return false;
		}
		if (data.level=="")
		{
			alert("级别不能为空");
			return false;
		}
		if (data.duty=="")
		{
			alert("负责人id不能为空");
			return false;
		}
		if (data.storage=="")
		{
			alert("库存数不能为空");
			return false;
		}
		if (data.unit=="")
		{
			alert("计量单位不能为空");
			return false;
		}
		if (data.cost=="")
		{
			alert("单价不能为空");
			return false;
		}
		if (data.content=="")
		{
			alert("其他说明不能为空");
			return false;
		}
		if (data.currency=="")
		{
			alert("计算币种不能为空");
			return false;
		}
		return true;
	}

    //将数据提交给后台
    function  submit(data) {
        var root = $('#main-header').attr("data-id");
        $.ajax({
            url: root+'/materiel/materielSubmit',
            type: 'POST',
            dataType: 'json',
            data: data,
        }).done(function (data) {
        			//提示信息
                    alert("物料信息已成功提交");
                    setTimeout(function () {
                        window.location.href=root+"/materiel/materielInfo";
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
