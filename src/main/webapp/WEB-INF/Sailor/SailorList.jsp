<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>人员管理 | 人员列表</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/skins/skin-blue.min.css">
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
        <small>人员管理</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">人员信息</h3>
                <shiro:hasPermission name="sailor:sailorAdd">
                &nbsp; &nbsp; &nbsp;
              <a class="btn btn-app" href="${pageContext.request.contextPath}/Sailor/SailorAdd">
                <i class="fa fa-inbox"></i>新增人员
              </a>
                </shiro:hasPermission>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th width="10%">编号</th>
                  <th width="15%">姓名</th>
                  <th width="20%">船员编号</th>
                  <th width="15%">适用职务</th>
                  <th width="20%">联系电话</th>
                  <th width="20%">编辑</th>
                </tr>
                </thead>
                <tbody>
                
               		<c:forEach var="Sailor" items="${sailor_list}">
                                    <tr>
                                        <td>${Sailor.id}</td>
                                        <td>${Sailor.name}</td>
                                        <td>${Sailor.sailor_id}</td>
                                        <td>
                                        <c:if test="${Sailor.duty==0}">水手</c:if>
				                        <c:if test="${Sailor.duty==1}">船长</c:if>
				                        <c:if test="${Sailor.duty==2}">大副</c:if>
				                        <c:if test="${Sailor.duty==3}">二副</c:if>
				                        <c:if test="${Sailor.duty==4}">三副</c:if>
				                        <c:if test="${Sailor.duty==5}">水手长</c:if>
				                        <c:if test="${Sailor.duty==6}">轮机长</c:if>
				                        <c:if test="${Sailor.duty==7}">大管轮</c:if>
				                        <c:if test="${Sailor.duty==8}">二管轮</c:if>
				                        <c:if test="${Sailor.duty==9}">三管轮</c:if>
				                        <c:if test="${Sailor.duty==10}">机工长</c:if>
				                        <c:if test="${Sailor.duty==11}">机匠</c:if>
				                        <c:if test="${Sailor.duty==12}">实习生</c:if>
				                        <c:if test="${Sailor.duty==13}">大厨</c:if>
				                        <c:if test="${Sailor.duty==14}">二厨</c:if>
				                        <c:if test="${Sailor.duty==15}">电机员</c:if>
				                        <c:if test="${Sailor.duty==16}">船医</c:if>
				                        <c:if test="${Sailor.duty==17}">政委</c:if>
				                        <c:if test="${Sailor.duty==18}">铜匠</c:if>
				                        <c:if test="${Sailor.duty==19}">木匠</c:if>
				                        <c:if test="${Sailor.duty==80}">其他1</c:if>
				                        <c:if test="${Sailor.duty==81}">其他2</c:if>
				                        <c:if test="${Sailor.duty==82}">其他3</c:if>
				                        <c:if test="${Sailor.duty==84}">岸基管理员</c:if>
				                        <c:if test="${Sailor.duty==99}">面试生</c:if>
                                        </td>
                                        <td>${Sailor.phone}</td>
                                        <td>
                                            <shiro:hasPermission name="sailor:certificateAdd">
                                            <a  type="button" class="btn btn-primary btn-xs" href="${pageContext.request.contextPath}/Sailor/CertificateAdd?sailor_id=${Sailor.sailor_id}">
                                                <span>新增证书</span>
                                            </a>
                                            </shiro:hasPermission>
                                            <shiro:hasPermission name="sailor:longevityAdd">
                                             <a  type="button" class="btn btn-primary btn-xs" href="${pageContext.request.contextPath}/Sailor/LongevityAdd?sailor_id=${Sailor.sailor_id}">
                                                <span>新增海历</span>
                                            </a>
                                            </shiro:hasPermission>
                                            <shiro:hasPermission name="sailor:sailorInfo">
                                            <a type="button" class= "btn btn-primary btn-xs" href ="${pageContext.request.contextPath}/Sailor/SailorInfo?sailor_id=${Sailor.sailor_id}">
                            					<span>修改信息</span>
                                            </a>
                                            </shiro:hasPermission>
                                            <shiro:hasPermission name="sailor:sailorAttemper">
                                            <a type="button" class= "btn btn-primary btn-xs" href ="${pageContext.request.contextPath}/Sailor/SailorAttemper?sailor_id=${Sailor.sailor_id}">
                            					<span>调配</span>
                                            </a>
                                            </shiro:hasPermission>
                                            <shiro:hasPermission name="sailor:sailorInfoDelete">
                                            <a  type="button" class="btn btn-danger btn-xs" href ="${pageContext.request.contextPath}/Sailor/SailorInfoDelete?sailor_id=${Sailor.sailor_id}">
                                                <span>删除</span>
                                            </a>
                                            </shiro:hasPermission>
                                        </td>
                                    </tr>
                                </c:forEach>
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
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
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>
<!-- Select2 -->
<script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<!-- DataTables -->
<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!--自己写的js文件依赖jQ-->
<script src="${pageContext.request.contextPath}/plugins/aPudding/js/main.js"></script>
<script>

	$(function () {
        $("#example1").DataTable();
        $('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false
        });
    });
	
    //初始化select2控件
    $(function(){
        $(".select2").select2();

    });
    //初始化datatables
    $(function () {
        $('#user-list').DataTable({
            language: {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            },
            "paging": true,
            "lengthChange": false,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false
        });
    });
    $(function(){
        //每次点击button初始化模态框
        $('#updateRole').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget)
            var userId= button.data('userid');
            var username = button.data('username');
            var modal = $(this)
            modal.find('#userName').attr("userId",userId);
            modal.find('#userName').attr('placeholder',username);
        })
    });
    $(function(){
        //每次点击button初始化模态框
        $('#deleteUser').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget)
            var userId= button.data('userid');
            var username = button.data('username');
            var modal = $(this);
            modal.find('#delete').attr("userId",userId);
        })
    });
    //为user添加role
    $(function(){
        $("#submit").click(function(){
            //获取多选框中的值
            var result = $("#roleSelect").select2("data");
            //获取用户ID
            var userId = $('#userName').attr("userId");
            var roleIds = [];
            for(var i=0;i<result.length;i++){
                roleIds[i] = result[i].id;
            }
            //ajax提交给后台
            updateRole(roleIds,userId);
            //添加load之后模态框移除不了。。。。

            //更新成功后弹出更新成功提示框 移除load 刷新页面

        })
    });
    //删除用户
    $(function(){
        $("#delete").click(function(){
            //获取用户Id
            var userId =$(this).attr("userId");
            //ajax提交给后台

        });
    })
    function updateRole(roleIds,userId){
        var root = $('body').attr("data-id");
        $.ajax({
            url: root + '/system/userRoleUpdate',
            type: 'POST',
            dataType: 'json',
            data: {"roleIds": roleIds,
                    "userId":userId
                    }}).done(function(data) {
                    //返回提示信息并刷新页面
                    $('#alertMsg .modal-body').html(""+data.msg);
                    $('#alertMsg').modal('show');
                    setTimeout(function () {
                        $('#alertMsg').modal('hide');
                        //添加不停地旋转load
                         $('.content').html('<div class="overlay"> <i class="fa fa-refresh fa-spin"></i> </div>');
                        location.reload();
                    },1000*2);
                    //刷新页面

                }).fail(function() {
                    console.log("error");
                }).always(function() {
                    console.log("complete");
                });

    }
</script>
</body>

</html>
