<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/skins/skin-blue.min.css">

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

		<jsp:include page="../module/head.jsp" />
		<!-- Left side column. contains the logo and sidebar -->
		<jsp:include page="../module/side-bar.jsp" />

		
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        新建船舶
        <small>输入船舶具体信息</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
        <li><a href="#">船舶信息</a></li>
        <li class="active">育鲲具体信息</li>
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
              <li class="active"><a href="#tab_1" data-toggle="tab">船舶信息</a></li>
              <!-- <li><a href="#tab_2" data-toggle="tab">人员信息</a></li>
              <li><a href="#tab_3" data-toggle="tab">设备信息</a></li>
              <li><a href="#tab_4" data-toggle="tab">新增人员</a></li>
              <li><a href="#tab_5" data-toggle="tab">新增设备</a></li>
              <li><a href="#tab_6" data-toggle="tab">设备编辑</a></li> -->
            </ul>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
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
                      <label>船舶名称</label>
                      <input id="name"  type="text" placeholder="请填写船舶名称"  class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>船舶英文名</label>
                      <input type="text" id="eName"  placeholder="请填写船舶英文名"  class="form-control"></input>
                    </div>
                     <div class="form-group">
                      <label>船舶吨位</label>
                      <input type="text" id="tonnage"  placeholder="请填写船舶吨位"  class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>船旗国</label>
                      <input type="text" id="country"  placeholder="请填写船旗国"  class="form-control"></input>
                    </div>
                  </div>
                  <!--第二列-->
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>IMO代码</label>
                      <input type="text" id="imo"  placeholder="请填写IMO代码"  class="form-control"></input>
                    </div>
                     <div class="form-group">
                      <label>船舶状态</label>
                      <select id="status"  class="form-control select2">
                        <option value="1" selected="selected">正常</option>
                        <option value="2">在修</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label>船舶马力</label>
                      <input type="text" id="horsepower"  placeholder="请填写船舶马力"  class="form-control"></input>
                    </div>
                  </div>
                  <!--第三列-->
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>船舶呼号</label>
                      <input type="text" id="callName"  placeholder="请填写船舶呼号"  class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>船舶类型</label>
                      <select id="type" class="form-control select2">
                        <option value="1" selected="selected">散货船</option>
                        <option value="2">油轮</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label>主机型号</label>
                      <input type="text" id="model"  placeholder="请填写主机型号"  class="form-control"></input>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
				          <div class="col-md-offset-12 col-md-9">
                    <button class="btn btn-block btn-primary btn-lg" id="submit"  item-width="50%" >
									    保存		
  			            </button>
                  </div>
                </div>
              </div>
              
          
          </div>
          



      </div>
  </section>
  </div>
    <!-- /.content -->
  <!-- /.content-wrapper -->
  <jsp:include page="../module/foot.jsp" />

  <!-- Control Sidebar -->
  
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->

</div>
<!-- ./wrapper -->
		
		<!-- /.content -->


	</div>






	<!-- REQUIRED JS SCRIPTS -->

	<!-- jQuery 2.2.3 -->
	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script
		src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>
	<!-- DataTables -->
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>



	<script>
		//获取船舶信息
		function getParms() {
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
				"eName" : eName,
				"name" : name,
				"imo" : imo,
				"tonnage" : tonnage,
				"type" : type,
				"tonnage" : tonnage,
				"horsepower" : horsepower,
				"model" : model,
				"callName" : callName,
				"country" : country,
				"lane" : lane,
				"status" : status
			}
			return data;
		}
		$(function() {
			$('#submit').click(function() {
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
				url : root + '/Boat/insertBoat',
				type : 'POST',
				dataType : 'json',
				data : data,
			}).done(function(data) {

				{
					if (data.msg == "船舶创建成功!") {
						alert(data.msg);
						window.location.href = root + "/Boat/boatList";
					} else {
						alert(data.msg);

					}
				}

			}).fail(function() {
				console.log("error");
			}).always(function() {
				console.log("complete");
			});

		}
	</script>

</body>

</html>