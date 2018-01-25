<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Starter</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
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

    <jsp:include page="module/head.jsp"/>
    <!-- Left side column. contains the logo and sidebar -->
    <jsp:include page="module/side-bar.jsp"/>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Page Header
                <small>Optional description</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
                <li class="active">Here</li>
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
            <c:if test="${publishResult!=null}">
                <p style="color: red;font-size: x-large">
                    ${publishResult}
                </p>
            </c:if>


            <c:if test="${!(certificateList==null||fn:length(certificateList)==0)}">
            <div class="box box-default">
                <div class="box-header with-border">
                    <ul class="nav nav-tabs">

                        <li class="active"><a href="#tab_2" data-toggle="tab">快过期证书（3个月内）</a></li>

                    </ul>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="tab-content">


                    <!--证书信息-->
                    <div class="tab-pane active" id="tab_2" >
                        <div class="box-body">
                            <table id="human_info" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th width="10%">编号</th>
                                    <th width="10%">证书名称</th>
                                    <th width="10%">证书编号</th>
                                    <th width="15%">证书等级</th>
                                    <th width="10%">适用职务</th>
                                    <th width="15%">发证日期</th>
                                    <th width="15%">过期日期</th>

                                </tr>
                                </thead>
                                <tbody>
                                <%int i=0; %>
                                <c:forEach items="${certificateList}" var="certificate">
                                    <tr>

                                        <td><%=++i%></td>
                                        <td>${certificate.name}</td>
                                        <td>${certificate.num}</td>
                                        <td>
                                            <c:if test="${certificate.level==0}">甲级</c:if>
                                            <c:if test="${certificate.level==1}">乙级</c:if>
                                            <c:if test="${certificate.level==2}">丙级</c:if>
                                            <c:if test="${certificate.level==3}">丁级</c:if>
                                        </td>
                                        <td>
                                            <c:if test="${certificate.duty==0}">水手</c:if>
                                            <c:if test="${certificate.duty==1}">船长</c:if>
                                            <c:if test="${certificate.duty==2}">大副</c:if>
                                            <c:if test="${certificate.duty==3}">二副</c:if>
                                            <c:if test="${certificate.duty==4}">三副</c:if>
                                            <c:if test="${certificate.duty==5}">水手长</c:if>
                                            <c:if test="${certificate.duty==6}">轮机长</c:if>
                                            <c:if test="${certificate.duty==7}">大管轮</c:if>
                                            <c:if test="${certificate.duty==8}">二管轮</c:if>
                                            <c:if test="${certificate.duty==9}">三管轮</c:if>
                                            <c:if test="${certificate.duty==10}">机工长</c:if>
                                            <c:if test="${certificate.duty==11}">机匠</c:if>
                                            <c:if test="${certificate.duty==12}">实习生</c:if>
                                            <c:if test="${certificate.duty==13}">大厨</c:if>
                                            <c:if test="${certificate.duty==14}">二厨</c:if>
                                            <c:if test="${certificate.duty==15}">电机员</c:if>
                                            <c:if test="${certificate.duty==16}">船医</c:if>
                                            <c:if test="${certificate.duty==17}">政委</c:if>
                                            <c:if test="${certificate.duty==18}">铜匠</c:if>
                                            <c:if test="${certificate.duty==19}">木匠</c:if>
                                            <c:if test="${certificate.duty==80}">其他1</c:if>
                                            <c:if test="${certificate.duty==81}">其他2</c:if>
                                            <c:if test="${certificate.duty==82}">其他3</c:if>
                                            <c:if test="${certificate.duty==84}">岸基管理员</c:if>
                                            <c:if test="${certificate.duty==99}">面试生</c:if>
                                        </td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${certificate.work_date}" /></td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${certificate.out_date}" /></td>

                                    </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th width="10%">编号</th>
                                    <th width="10%">证书名称</th>
                                    <th width="10%">证书编号</th>
                                    <th width="15%">证书等级</th>
                                    <th width="10%">适用职务</th>
                                    <th width="15%">发证日期</th>
                                    <th width="15%">过期日期</th>

                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    </div>
                </div>
            </c:if>

            <c:if test="${!(publishList==null||fn:length(publishList)==0)}">
                <div class="box box-default">
                    <div class="box-header with-border">
                        <ul class="nav nav-tabs">

                            <li class="active"><a href="#tab_2" data-toggle="tab">公告（确认回复的会保存1周）</a></li>

                        </ul>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="tab-content">


                        <!--证书信息-->
                        <div class="tab-pane active" id="tab_3" >
                            <div class="box-body">
                                <table id="human_info2" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th width="10%">编号</th>
                                        <th width="10%">主题</th>
                                        <th width="10%">发布时间</th>
                                        <th width="15%">回复时间</th>
                                        <th width="10%">对象</th>
                                        <th width="10%">操作</th>


                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%int i=0; %>
                                    <c:forEach items="${publishList}" var="publish">
                                        <tr>

                                            <td><%=++i%></td>
                                            <td>${publish.subject}</td>
                                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${publish.publishTime}" /></td>

                                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${publish.replyTime}" /></td>
                                            <td>
                                                <c:if test="${publish.isForBoat==1}">船舶</c:if>
                                                <c:if test="${publish.isForBoat==0}">个人</c:if>
                                            </td>
                                            <td><a href="${pageContext.request.contextPath}/publish/publishDetails?publishId=${publish.id}"  class="btn bg-purple margin" >查看</a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th width="10%">编号</th>
                                        <th width="10%">主题</th>
                                        <th width="10%">发布时间</th>
                                        <th width="15%">回复时间</th>
                                        <th width="10%">对象</th>
                                        <th width="10%">操作</th>

                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
            </c:if>


            <c:if test="${!(publishReplyList==null||fn:length(publishReplyList)==0)}">
                <div class="box box-default">
                    <div class="box-header with-border">
                        <ul class="nav nav-tabs">

                            <li class="active"><a href="#tab_2" data-toggle="tab">已发出的公告（确认回复的会保存1周）</a></li>

                        </ul>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="tab-content">


                        <!--证书信息-->
                        <div class="tab-pane active" id="tab_4" >
                            <div class="box-body">
                                <table id="human_info3" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th width="10%">编号</th>
                                        <th width="10%">主题</th>
                                        <th width="10%">发布时间</th>
                                        <th width="15%">回复时间</th>
                                        <th width="10%">对象</th>
                                        <th width="10%">状态</th>
                                        <th width="10%">操作</th>


                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%int i=0; %>
                                    <c:forEach items="${publishReplyList}" var="publish">
                                        <tr>

                                            <td><%=++i%></td>
                                            <td>${publish.subject}</td>
                                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${publish.publishTime}" /></td>

                                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${publish.replyTime}" /></td>
                                            <td>
                                                <c:if test="${publish.isForBoat==1}">船舶</c:if>
                                                <c:if test="${publish.isForBoat==0}">${publish.sailorId}</c:if>
                                            </td>
                                            <td><c:if test="${publish.isReply==1}">已回复</c:if></td>
                                            <td><a href="${pageContext.request.contextPath}/publish/publishDetails?publishId=${publish.id}"  class="btn bg-purple margin" >查看</a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th width="10%">编号</th>
                                        <th width="10%">主题</th>
                                        <th width="10%">发布时间</th>
                                        <th width="15%">回复时间</th>
                                        <th width="10%">对象</th>
                                        <th width="10%">状态</th>
                                        <th width="10%">操作</th>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
            </c:if>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <jsp:include page="module/foot.jsp" />

</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 2.2.3 -->
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>

<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->
</body>
</html>
