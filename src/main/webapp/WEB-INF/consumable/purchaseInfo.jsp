<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>船舶信息 | 耗材申请信息</title>
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
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/skins/_all-skins.min.css">

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
        耗材
        <small>耗材采购</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
        <li><a href="#">耗材</a></li>
        <li class="active">耗材采购</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">耗材采购</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th width="10%">编号</th>
                  <th width="15%">耗材名</th>
                  <th width="15%">船舶名</th>
                  <th width="15%">需求日期</th>
                  <th width="10%">需求数量</th>
                  <th width="10%">状态</th>
                  <th width="10%">编辑</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${consumableApplyList}" var="consumableApplyList">
                <tr>
                  <input type="hidden" id="${consumableApplyList.id}" name="${consumableApplyList.id}" value="1"/>
                  <td>${consumableApplyList.id}</td>
                  <td>${consumableApplyList.consumable_name}</td>
                  <td>${consumableApplyList.boat_name}</td>
                  <td>${consumableApplyList.eta}</td>
                  <td>${consumableApplyList.count}</td>
                  <c:if test="${consumableApplyList.status==0}">
                      <td>等待初审</td>
                      <td>
                      <a class="btn bg-purple margin"
                      href="${pageContext.request.contextPath}/consumable/consumableApplyPrecheck?id=${consumableApplyList.id}">初审</a>
                      <a class="btn bg-purple margin"
                      href="${pageContext.request.contextPath}/consumable/consumablePurchaseView?id=${consumableApplyList.id}">查看</a>
                      </td>
                  </c:if>
                  <c:if test="${consumableApplyList.status==1}">
                      <td>等待询价</td>
                      <td>
                      <a class="btn bg-purple margin"
                      href="${pageContext.request.contextPath}/consumable/consumableApplyQuote?id=${consumableApplyList.id}">询价</a>
                      <a class="btn bg-purple margin"
                      href="${pageContext.request.contextPath}/consumable/consumablePurchaseView?id=${consumableApplyList.id}">查看</a>
                      </td>
                  </c:if>
                  <c:if test="${consumableApplyList.status==2}">
                      <td><span style="color: #9f191f"><strong>审核不通过</strong></span></td>
                      <td></td>
                  </c:if>
                  <c:if test="${consumableApplyList.status==3}">
                      <td>询价中，待分配</td>
                      <td>
                      <a class="btn bg-purple margin"
                      href="${pageContext.request.contextPath}/consumable/consumablePurchase?id=${consumableApplyList.id}">分配</a>
                      <a class="btn bg-purple margin"
                      href="${pageContext.request.contextPath}/consumable/consumablePurchaseView?id=${consumableApplyList.id}">查看</a>
                      </td>
                  </c:if>
                  <c:if test="${consumableApplyList.status==4}">
                      <td>大额采购待二审</td>
                      <td>
                      <a class="btn bg-purple margin"
                      href="${pageContext.request.contextPath}/consumable/consumableFinalCheck?id=${consumableApplyList.id}">二审</a>
                      <a class="btn bg-purple margin"
                      href="${pageContext.request.contextPath}/consumable/consumablePurchaseView?id=${consumableApplyList.id}">查看</a>
                      </td>
                  </c:if>
                  <c:if test="${consumableApplyList.status==5}">
                      <td>待采购</td>
                      <td>
                      <a class="btn bg-purple margin"
                      href="${pageContext.request.contextPath}/consumable/consumablePurchaseDid?id=${consumableApplyList.id}">采购</a>
                      <a class="btn bg-purple margin"
                      href="${pageContext.request.contextPath}/consumable/consumablePurchaseView?id=${consumableApplyList.id}">查看</a>
                      </td>
                  </c:if>
                  <c:if test="${consumableApplyList.status==6}">
                      <td>等待入库</td>
                      <td>
                      <a class="btn bg-purple margin"
                      href="${pageContext.request.contextPath}/consumable/consumablePurchaseIncome?id=${consumableApplyList.id}">入库</a>
                      <a class="btn bg-purple margin"
                      href="${pageContext.request.contextPath}/consumable/consumablePurchaseView?id=${consumableApplyList.id}">查看</a>
                      </td>
                  </c:if>
                  <c:if test="${consumableApplyList.status==7}">
                      <td>完成</td>
                      <td>
                      <a class="btn bg-purple margin"
                      href="${pageContext.request.contextPath}/consumable/consumablePurchaseView?id=${consumableApplyList.id}">查看</a>
                      </td>
                  </c:if>
                  <c:if test="${consumableApplyList.status==8}">
                      <td>初审驳回</td>
                      <td>
                      <a class="btn bg-purple margin"
                      href="${pageContext.request.contextPath}/consumable/consumablePurchaseView?id=${consumableApplyList.id}">查看</a>
                      </td>
                  </c:if>
                  <!-- 
                  <td>
                    <a class="btn bg-purple margin" href="../forms/consumable_apply_precheck.html">初审</a>
                    <a class="btn bg-purple margin" href="../forms/consumable_apply_quote.html">询价</a>
                    <a class="btn bg-purple margin" href="../forms/consumable_purchase.html">分配</a>
                    <a class="btn bg-purple margin" href="../forms/consumable_final_check.html">二核</a>
                    <a class="btn bg-purple margin" href="../forms/consumable_purchase_did.html">执行采购</a>
                    <a class="btn bg-purple margin" href="../forms/consumable_purchase_income.html">入库</a>
                    <a class="btn bg-purple margin" href="../forms/consumable_purchase_view.html">查看</a>
                  </td>
                   -->
                </tr>
                </c:forEach>
                    
                <!--  
                <tr>
                  <input type="hidden" id="id" name="id" value="1"/>
                  <td>1</td>
                  <td>螺母</td>
                  <td>育鲲</td>
                  <td>2016/11/11</td>
                  <td>200</td>
                  <td>无</td>
                  <td>
                    <a class="btn bg-purple margin" href="../forms/consumable_apply_precheck.html">初审</a>
                    <a class="btn bg-purple margin" href="../forms/consumable_apply_quote.html">询价</a>
                    <a class="btn bg-purple margin" href="../forms/consumable_purchase.html">分配</a>
                    <a class="btn bg-purple margin" href="../forms/consumable_final_check.html">二核</a>
                    <a class="btn bg-purple margin" href="../forms/consumable_purchase_did.html">执行采购</a>
                    <a class="btn bg-purple margin" href="../forms/consumable_purchase_income.html">入库</a>
                    <a class="btn bg-purple margin" href="../forms/consumable_purchase_view.html">查看</a>
                  </td>
                </tr>
                <tr>
                  <input type="hidden" id="id" name="id" value="2"/>
                  <td>2</td>
                  <td>螺母</td>
                  <td>育鲲</td>
                  <td>2016/11/11</td>
                  <td>200</td>
                  <td>无</td>
                  <td>
                    <a class="btn bg-purple margin" href="../forms/consumable_apply_precheck.html">初审</a>
                    <a class="btn bg-purple margin" href="../forms/consumable_apply_quote.html">询价</a>
                    <a class="btn bg-purple margin" href="../forms/consumable_purchase.html">分配</a>
                    <a class="btn bg-purple margin" href="../forms/consumable_final_check.html">审核</a>
                    <a class="btn bg-purple margin" href="../forms/consumable_purchase_did.html">执行采购</a>
                    <a class="btn bg-purple margin" href="../forms/consumable_purchase_income.html">入库</a>
                    <a class="btn bg-purple margin" href="../forms/consumable_purchase_view.html">查看</a>
                  </td>
                </tr>
                -->
                </tbody>
                <tfoot>
                <tr>
                  <th width="10%">编号</th>
                  <th width="15%">耗材名</th>
                  <th width="15%">船舶名</th>
                  <th width="15%">需求日期</th>
                  <th width="10%">需求数量</th>
                  <th width="10%">状态</th>
                  <th width="10%">编辑</th>
                </tr>
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
  <jsp:include page="../module/foot.jsp" />

</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath}/dist/js/demo.js"></script>
<!-- page script -->
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
