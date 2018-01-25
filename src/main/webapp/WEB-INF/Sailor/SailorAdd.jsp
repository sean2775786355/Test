<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>船舶管理系统 | 人员新增</title>
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
                <small>新增人员</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index"><i class="fa fa-dashboard"></i>首页</a></li>
                <li><a href="${pageContext.request.contextPath}/Sailor/SailorList"><i class="fa fa-dashboard"></i>人员列表</a></li>
                <li class="active">当前</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
      <!-- service_date EXAMPLE -->
      <!--  -->
      <div class="box box-default">
        <div class="box-header with-border">
          <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_1" data-toggle="tab">人员信息</a></li>
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
          
              <div class="box-body">
                <div class="row">
                  <!--第一列-->
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>职员姓名</label>
                      <input id="name" name="name" type="text" placeholder="请填写职员姓名" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>船员性别</label>
                      <select id="sex" name="sex" class="form-control select2">
                        <option value="1" selected="selected">男</option>
                        <option value="2">女</option>
                      </select>
                    </div>
                     <div class="form-group">
                      <label>职员籍贯</label>
                      <input type="text" id="native_place" name="native_place" placeholder="请填写职员籍贯" class="form-control"></input>
                    </div>
                   <div class="form-group">
                      <label>职员体重(kg)</label>
                      <input type="text" id="weight" name="weight" placeholder="请填写职员体重" value="" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>毕业学校</label>
                      <input type="text" id="school" name="school" placeholder="请填写毕业学校" value="" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>家庭地址</label>
                      <input type="text" id="address" name="address" placeholder="请填写家庭地址" value="" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>婚姻状况</label>
                      <label>
                        <input type="radio" name="marriage" id="marriage" value="0" checked>
                        未婚
                      </label>
                      <label>
                        <input type="radio" name="marriage" id="unmarriage" value="1" >
                        已婚
                      </label>
                    </div>
                  </div>
                  <!--第二列-->
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>船员编号</label>
                      <input type="text" id="sailor_id" name="sailor_id" placeholder="请填写船员编号"  class="form-control"></input>
                    </div>
                     <div class="form-group">
                      <label>职务</label>
                      <select id="duty" name="duty" class="form-control select2">
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
                      <label>文化程度</label>
                      <select id="edu" name="edu" class="form-control select2">
                        <option value="1" selected="selected">小学</option>
                        <option value="2">初中</option>
                        <option value="3">高中</option>
                        <option value="4">职高</option>
                        <option value="5">本科</option>
                        <option value="0">大专</option>
                        <option value="6">硕士</option>
                        <option value="7">博士</option>
                        <option value="8">二管轮</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label>血型</label>
                      <select id="blood_type" name="blood_type" class="form-control select2">
                        <option value="A" selected="selected">A</option>
                        <option value="B">B</option>
                        <option value="O">O</option>
                        <option value="AB">AB</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label>主修专业</label>
                      <input type="text" id="major" name="major" placeholder="请填写主修专业" value="" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>联系电话</label>
                      <div class="input-group">
                        <div class="input-group-addon">
                          <i class="fa fa-phone"></i>
                        </div>
                        <input type="text" id="phone" name="phone" placeholder="请填写联系电话" value="" class="form-control"  ></input>
                      </div>
                    </div>
                    <div class="form-group">
                      <label>健康状况</label>
                      <label>
                        <input type="radio" name="health" id="health" value="0" checked>
                        健康
                      </label>
                      <label>
                        <input type="radio" name="health" id="health" value="1" >
                        不健康
                      </label>
                    </div>
                  </div>
                  <!--第三列-->
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>职员英文名</label>
                      <input type="text" id="e_name" name="e_name" placeholder="请填写职员英文名" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>职员生日</label>
                      <div class="input-group date">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input type="text" class="form-control pull-right" id="birth" name="birth" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label>职员身高(cm)</label>
                      <input type="text" id="length" name="length" placeholder="请填写职员身高" value="" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>身份证</label>
                      <input type="text" id="id_num" name="id_num" placeholder="请填写身份证号" value="" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>毕业时间</label>
                      <div class="input-group date">
                        <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                        </div>
                        <input type="text" class="form-control pull-right" id="gra_time" name="gra_time" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label>电子邮箱</label>
                      <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                        <input type="email" class="form-control" placeholder="请填写电子邮箱">
                      </div>
                    </div>
                  </div>
                </div>
                
                <label>亲属</label><br/><br/>
                <div class="row">
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>亲属1姓名</label>
                      <input type="text" id="relationship_name" name="relationship_name" placeholder="请填写亲属1姓名" value="" class="form-control"></input>
                    </div>
                    <div class="form-group">
                      <label>亲属2姓名</label>
                      <input type="text" id="relationship2_name" name="relationship2_name" placeholder="请填写亲属2姓名" value="" class="form-control"></input>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group">
                      <div class="form-group">
                        <label>亲属1关系</label>
                        <select id="relationship" name="relationship" class="form-control select2">
                        <option value="0" selected="selected">父</option>
                        <option value="1">母</option>
                        <option value="2">配偶</option>
                        <option value="3">子女</option>
                        <option value="4">其他</option>
                      </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="form-group">
                        <label>亲属2关系</label>
                        <select id="relationship2" name="relationship2" class="form-control select2">
                        <option value="0">父</option>
                        <option value="1" selected="selected">母</option>
                        <option value="2">配偶</option>
                        <option value="3">子女</option>
                        <option value="4">其他</option>
                      </select>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group">
                      <div class="form-group">
                        <label>亲属1联系电话</label>
                        <div class="input-group">
                          <div class="input-group-addon">
                            <i class="fa fa-phone"></i>
                          </div>
                          <input type="text" id="relationship_phone" name="relationship_phone" placeholder="请填写亲属1联系电话" value="" class="form-control" ></input>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="form-group">
                        <label>亲属2联系电话</label>
                        <div class="input-group">
                          <div class="input-group-addon">
                            <i class="fa fa-phone"></i>
                          </div>
                          <input type="text" id="relationship2_phone" name="relationship2_phone" placeholder="请填写亲属2联系电话" value="" class="form-control"  ></input>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-8">
                    <div class="form-group">
                      <label>其他说明</label>
                      <textarea type="text" id="content" name="content" value="" placeholder="请填写其他说明" style="width: 100%;"></textarea>
                    </div>
                  </div>
                </div>

                <div class="col-md-4">
				          <div class="col-md-offset-12 col-md-9">
                    <button class="btn btn-block btn-primary btn-lg" id="btn"  item-width="50%" >
									    提交		
  			            </button>
                  </div>
                </div>
              </div>
          </div>
          
      </div>
  </section>
  </div>
  
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
    $('#birth').datepicker({
      autoclose: true
    });
    $('#gra_time').datepicker({
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
    	var sex = $('#sex').val();
    	var native_place = $('#native_place').val();
    	var weight = $('#weight').val();
    	var school = $('#school').val();
    	var address = $('#address').val();
    	var marriage = $('#marriage').val();
    	var sailor_id = $('#sailor_id').val();
    	var duty = $('#duty').val();
    	var edu = $('#edu').val();
    	var blood_type = $('#blood_type').val();
    	var major = $('#major').val();
    	var phone = $('#phone').val();
    	var health = $('#health').val();
    	var e_name = $('#e_name').val();
    	var birth = $('#birth').val();
    	var length = $('#length').val();
    	var id_num = $('#id_num').val();
    	var gra_time = $('#gra_time').val();
    	var email = $('#email').val();
    	var relationship_name = $('#relationship_name').val();
    	var relationship2_name = $('#relationship2_name').val();
    	var relationship = $('#relationship').val();
    	var relationship2 = $('#relationship2').val();
    	var relationship_phone = $('#relationship_phone').val();
    	var relationship2_phone = $('#relationship2_phone').val();
    	var content = $('#content').val();
    	

        var data ={
            "name" : name,
            "sex"  : sex,
            "native_place" : native_place,
            "weight" : weight,
            "school" : school,
            "address" : address,
            "marriage" : marriage,
            "sailor_id" : sailor_id,
            "duty" : duty,
            "edu" : edu,
            "blood_type" : blood_type,
            "major" : major,
            "phone" : phone,
            "health" : health,
            "e_name" : e_name,
            "birth" : birth,
            "length" : length,
            "id_num" : id_num,
            "gra_time" : gra_time,
            "email" : email,
            "relationship_name" : relationship_name,
            "relationship2_name" : relationship2_name,
            "relationship" : relationship,
            "relationship2" : relationship2,
            "relationship_phone" : relationship_phone,
            "relationship2_phone" : relationship2_phone,
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
			alert("职员姓名不能为空");
			return false;
		}
		if (data.sailor_id=="")
		{
			alert("船员编号不能为空");
			return false;
		}
		if (data.e_name=="")
		{
			alert("职员英文名不能为空");
			return false;
		}
		if (data.birth=="")
		{
			alert("职员生日不能为空");
			return false;
		}
		if (data.native_place=="")
		{
			alert("职员籍贯不能为空");
			return false;
		}
		if (data.length=="")
		{
			alert("职员身高不能为空");
			return false;
		}
		if (data.weight=="")
		{
			alert("职员体重不能为空");
			return false;
		}
		if (data.id_num=="")
		{
			alert("身份证号不能为空");
			return false;
		}
		if (data.school=="")
		{
			alert("毕业学校不能为空");
			return false;
		}
		if (data.major=="")
		{
			alert("主修专业不能为空");
			return false;
		}
		if (data.gra_time=="")
		{
			alert("毕业时间不能为空");
			return false;
		}
		if (data.address=="")
		{
			alert("家庭地址不能为空");
			return false;
		}
		if (data.phone=="")
		{
			alert("联系电话不能为空");
			return false;
		}
		if (data.email=="")
		{
			alert("电子邮箱不能为空");
			return false;
		}
		if (data.relationship_name=="")
		{
			alert("亲属1姓名不能为空");
			return false;
		}
		if (data.relationship_phone=="")
		{
			alert("亲属1联系电话不能为空");
			return false;
		}
		if (data.relationship2_name=="")
		{
			alert("亲属2姓名不能为空");
			return false;
		}
		if (data.relationship2_phone=="")
		{
			alert("亲属2联系电话不能为空");
			return false;
		}
		if (data.content=="")
		{
			alert("其他说明不能为空");
			return false;
		}
		if(data.relationship == data.relationship2)
		{
			alert("两个亲属关系不能一样");
			return false;
		}
		return true;
	}

    //将数据提交给后台
    function  submit(data) {
        var root = $('#main-header').attr("data-id");
        $.ajax({
            url: root+'/Sailor/SailorPost',
            type: 'POST',
            dataType: 'json',
            data: data,
        }).done(function (data) {
        			//提示信息
                    alert("人员信息已添加");
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
