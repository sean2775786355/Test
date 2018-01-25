<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>船舶维修 | 船舶维修管理</title>
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
                船舶维修
                <small>船舶维修管理</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">船舶维修</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">船舶维修</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th width="10%">编号</th>
                                    <th width="15%">船舶名</th>
                                    <th width="10%">维修类型</th>
                                    <th width="15%">维修日期</th>
                                    <th width="10%">维修时长</th>
                                    <th width="10%">状态</th>
                                    <th width="10%">编辑</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${repairApplyAllList}" var="repairApplyAll">
                                    <tr>
                                        <input type="hidden" id="${repairApplyAll.id}" name="${repairApplyAll.id}"
                                               value="1"/>
                                        <td>1</td>
                                        <td>${repairApplyAll.boatName}</td>
                                        <td><c:if test="${repairApplyAll.type==0}">航修</c:if><c:if
                                                test="${repairApplyAll.type==1}">厂修</c:if></td>
                                        <td>${repairApplyAll.repairDate}</td>
                                        <td>${repairApplyAll.dateLength}</td>
                                        <c:if test="${repairApplyAll.status==0}">
                                            <td>等待一审</td>
                                            <td>
                                                <a class="btn bg-purple margin"
                                                   href="${pageContext.request.contextPath}/repair/repairApplyCheck1?id=${repairApplyAll.id}">一审</a>
                                                <a class="btn bg-purple margin"
                                                   href="${pageContext.request.contextPath}/repair/repairApplyView?id=${repairApplyAll.id}">查看</a>
                                            </td>
                                        </c:if>
                                        <c:if test="${repairApplyAll.status==1}">
                                            <td><span style="color: #9f191f"><strong>一审驳回</strong></span></td>
                                            <td>
                                                <a class="btn bg-purple margin"
                                                   href="${pageContext.request.contextPath}/repair/repairApplyDetail?id=${repairApplyAll.id}">修改</a>
                                                <a class="btn bg-purple margin"
                                                   href="${pageContext.request.contextPath}/repair/repairApplyView?id=${repairApplyAll.id}">查看</a>
                                            </td>
                                        </c:if>
                                        <c:if test="${repairApplyAll.status==2}">
                                            <td>一审通过，等待二审</td>
                                            <td>
                                                <a class="btn bg-purple margin"
                                                   href="${pageContext.request.contextPath}/repair/repairApplyCheck2?id=${repairApplyAll.id}">二审</a>
                                                <a class="btn bg-purple margin"
                                                   href="${pageContext.request.contextPath}/repair/repairApplyView?id=${repairApplyAll.id}">查看</a>
                                            </td>
                                        </c:if>
                                        <c:if test="${repairApplyAll.status==3}">
                                            <td><span style="color: #9f191f"><strong>二审驳回</strong></span></td>
                                            <td>
                                                <a class="btn bg-purple margin"
                                                   href="${pageContext.request.contextPath}/repair/repairApplyDetail?id=${repairApplyAll.id}">修改</a>
                                                <a class="btn bg-purple margin"
                                                   href="${pageContext.request.contextPath}/repair/repairApplyView?id=${repairApplyAll.id}">查看</a>
                                            </td>
                                        </c:if>
                                        <c:if test="${repairApplyAll.status==4}">
                                            <td>二审通过，等待三审</td>
                                            <td>
                                                <a class="btn bg-purple margin"
                                                   href="${pageContext.request.contextPath}/repair/repairApplyCheck3?id=${repairApplyAll.id}">三审</a>
                                                <a class="btn bg-purple margin"
                                                   href="${pageContext.request.contextPath}/repair/repairApplyView?id=${repairApplyAll.id}">查看</a>
                                            </td>
                                        </c:if>
                                        <c:if test="${repairApplyAll.status==9}">
                                            <td><span style="color: #9f191f"><strong>三审驳回</strong></span></td>
                                            <td>

                                                <a class="btn bg-purple margin"
                                                   href="${pageContext.request.contextPath}/repair/repairApplyView?id=${repairApplyAll.id}">查看</a>
                                            </td>
                                        </c:if>
                                        <c:if test="${repairApplyAll.status==6}">
                                            <td>三审通过，等待编制维修单</td>
                                            <td>
                                                <a class="btn bg-purple margin"
                                                   href="${pageContext.request.contextPath}/repair/repairApplyInput?id=${repairApplyAll.id}">编制维修单</a>
                                                <a class="btn bg-purple margin"
                                                   href="${pageContext.request.contextPath}/repair/repairApplyView?id=${repairApplyAll.id}">查看</a>
                                            </td>
                                        </c:if>
                                        <c:if test="${repairApplyAll.status==7}">
                                            <td>维修单编制完成，等待完工</td>
                                            <td>
                                                <a class="btn bg-purple margin"
                                                   href="${pageContext.request.contextPath}/repair/repairApplyOutput?id=${repairApplyAll.id}">维修完工单</a>
                                                <a class="btn bg-purple margin"
                                                   href="${pageContext.request.contextPath}/repair/repairApplyView?id=${repairApplyAll.id}">查看</a>
                                            </td>
                                        </c:if>
                                        <c:if test="${repairApplyAll.status==8}">
                                            <td>项目完工</td>
                                            <td>
                                                <a class="btn bg-purple margin"
                                                   href="${pageContext.request.contextPath}/repair/repairApplyView?id=${repairApplyAll.id}">查看</a>
                                            </td>
                                        </c:if>

                                    </tr>
                                </c:forEach>
                                <!--
                                <tr>
                                    <input type="hidden" id="id" name="id" value="1"/>
                                    <td>1</td>
                                    <td>育鲲</td>
                                    <td>厂修</td>
                                    <td>2016/11/11</td>
                                    <td>20</td>
                                    <td>无</td>
                                    <td>
                                        <a class="btn bg-purple margin"
                                           href="${pageContext.request.contextPath}/repair/repairApplyDetail">修改</a>
                                        <a class="btn bg-purple margin"
                                           href="${pageContext.request.contextPath}/repair/repairApplyCheck1">一审</a>
                                        <a class="btn bg-purple margin"
                                           href="${pageContext.request.contextPath}/repair/repairApplyCheck2">二审</a>
                                        <a class="btn bg-purple margin"
                                           href="${pageContext.request.contextPath}/repair/repairApplyCheck3">三审</a>
                                        <a class="btn bg-purple margin"
                                           href="${pageContext.request.contextPath}/repair/repairApplyInput">编制维修单</a>
                                        <a class="btn bg-purple margin"
                                           href="${pageContext.request.contextPath}/repair/repairApplyOutput">维修完工单</a>
                                        <a class="btn bg-purple margin"
                                           href="${pageContext.request.contextPath}/repair/repairApplyView">查看</a>
                                    </td>
                                </tr>
                                <tr>
                                    <input type="hidden" id="id" name="id" value="2"/>
                                    <td>2</td>
                                    <td>育鲲</td>
                                    <td>行修</td>
                                    <td>2016/11/11</td>
                                    <td>200</td>
                                    <td>无</td>
                                    <td>
                                        <a class="btn bg-purple margin"
                                           href="${pageContext.request.contextPath}/repair/repairApplyDetail">修改</a>
                                        <a class="btn bg-purple margin"
                                           href="${pageContext.request.contextPath}/repair/repairApplyCheck1">一审</a>
                                        <a class="btn bg-purple margin"
                                           href="${pageContext.request.contextPath}/repair/repairApplyCheck2">二审</a>
                                        <a class="btn bg-purple margin"
                                           href="${pageContext.request.contextPath}/repair/repairApplyCheck3">三审</a>
                                        <a class="btn bg-purple margin"
                                           href="${pageContext.request.contextPath}/repair/repairApplyInput">编制维修单</a>
                                        <a class="btn bg-purple margin"
                                           href="${pageContext.request.contextPath}/repair/repairApplyOutput">维修完工单</a>
                                        <a class="btn bg-purple margin"
                                           href="${pageContext.request.contextPath}/repair/repairApplyView">查看</a>
                                    </td>
                                </tr>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th width="10%">编号</th>
                                    <th width="15%">船舶名</th>
                                    <th width="10%">维修类型</th>
                                    <th width="15%">维修日期</th>
                                    <th width="10%">维修时长</th>
                                    <th width="10%">状态</th>
                                    <th width="10%">编辑</th>
                                </tr>-->
                                </tfoot>
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
    <jsp:include page="../module/foot.jsp"/>

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
</script>
</body>

</html>
