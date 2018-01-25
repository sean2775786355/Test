<%--
  Created by IntelliJ IDEA.
  User: lxy
  Date: 2017/4/18
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>船舶信息 | 物料申请信息</title>
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
                物料
                <small>物料采购</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li><a href="#">物料</a></li>
                <li class="active">物料采购</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-xs-12">

                    <div class="box">
                        <%-- <form method="post" id="form1" role="form" action="${pageContext.request.contextPath}/materiel/materielPurchaseDo"> --%>
                            <input type="hidden" id="id" name="id" value="${materielApply.id}"/>
                            <input type="hidden" id="boatId" name="boatId" value="${materielApply.boat_id}"/>
                            <div class="box-header">
                                <h3 class="box-title">物料采购</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">
                                    <!--第一列-->
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>物料名称</label>
                                            <input type="text" id="name" name="name" value="${materiel.name}" disabled="disabled" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label>接收港口</label>
                                            <input type="text" id="port" name="port" value="${materielApply.port}" disabled="disabled" class="form-control"/>
                                        </div>
                                    </div>
                                    <!--第二列-->
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>申请数量</label>
                                            <input type="text" id="count" name="count" value="${materielApply.count}" disabled="disabled" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label>船舶名称</label>
                                            <input type="text" id="boat_id" name="boat_id" value="${materielApply.boat_name}" disabled="disabled" class="form-control"/>
                                        </div>
                                    </div>
                                    <!--第三列-->
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>预期接收时间</label>
                                            <input type="text" id="eta" name="eta" value="${materielApply.eta}" disabled="disabled" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label>预算余额</label>
                                            <input type="hidden" id="hidden_remained" name="hidden_remained" value="${budget.remained}"/>
                                            <input type="text" id="remained" name="remained" value="${budget.remained}" disabled="disabled" class="form-control"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>物料信息</label>
                                            <textarea disabled="disabled" type="text" id="info" name="info" style="width: 100%;height: 12%;">
类型：${materiel.type}
生产商：${materiel.productor_name}
标准号：${materiel.standard_code}
规格：${materiel.standard}
其他说明：${materiel.content}
                                            </textarea>
                                        </div>
                                    </div>
                                </div>

                                <!--供应商选择-->
                                <div class="row">
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>供应商报价信息</label>
                                            <% int i=0;%>

                                            <select id="quote_id" name="quote_id" onchange="quoteChange();" class="form-control select2">
                                                <option value="-1"id="-1">请选择供应商</option>
                                                <c:forEach items="${materielQuoteList}" var="materielQuote">
                                                    <option value="${materielQuote.id}"id="<%=++i %>">${materielQuote.supplierName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>采购数量</label>
                                            <input onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" type="text" id="current_count" name="current_count" value="${materielApply.count}" class="form-control"/>
                                        </div>
                                    </div>


                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>申报价格（单价）</label>
                                            <input type="text" id="price1" name="price1" class="form-control" disabled="disabled" value="请选择供应商"/>
                                            <input type="hidden" id="price" name="price" class="form-control" value="-1"/>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>币种</label>
                                            <input type="text" id="currency" name="currency" class="form-control" disabled="disabled" value="请选择供应商"/>
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>询价说明</label>
                                            <textarea disabled="disabled" type="text" id="quote_content" name="quote_content" value="请选择供应商" placeholder="无询价说明" style="width: 100%;"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>申请说明</label>
                                            <textarea disabled="disabled" type="text" id="apply_content" name="apply_content"  placeholder="请填写申请说明" style="width: 100%;">${materielApply.content}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>初审说明</label>
                                            <textarea disabled="disabled" type="text" id="precheck_content" name="precheck_content"  placeholder="请填写审核说明" style="width: 100%;">${materielApply.precheck_content}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>采购说明</label>
                                            <textarea id="purchase_content" name="purchase_content" placeholder="请填写采购说明"  style="width: 100%;"></textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="col-md-offset-12 col-md-9">
                                        <button class="btn btn-block btn-primary btn-lg" id="btn" type="button" item-width="50%" onclick="testNull();">
                                            提交
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <!-- /.box-body -->
                        <!-- </form> -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>

        </section>
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <jsp:include page="../module/foot.jsp" />

</div>
<!-- ./wrapper -->
<script>
        function testNull() {
            var quote = $('#quote_id').val();
            if(quote==-1){
                alert("请选择供应商");
            }else{
                var hidden_remained =$('#hidden_remained').val();
                var price = $('#price').val();
                var purchase_content = $('#purchase_content').val();
                var current_count = $('#current_count').val();
                var total = price*current_count;
                var id = $('#id').val();
                var boatId = $('#boatId').val();
                
                alert (id + "  " + "  " + boatId + "  " + purchase_content);
                var data = {
                	"id" : id,
                	"boatId" : boatId,
                	"price" : price,
                	"purchase_content" : purchase_content,
                	"current_count" : current_count,
                	"quote_id" : quote,
                	"hidden_remained" : hidden_remained
                };
                
                console.log(data);
                
                if(hidden_remained>=total) {
                
                    var root = $('#main-header').attr("data-id");
			        $.ajax({
			            url: root+'/materiel/materielPurchaseDo',
			            type: 'POST',
			            
			            data: JSON.stringify(data),
					    headers : {
		               		'Content-Type' : 'application/json;charset=utf-8'  
		                }
			        }).done(function (data) {
			                    console.log("done");
			                    window.location.href=root+"/materiel/purchaseInfo";
			                })
			                .fail(function () {
			                    console.log("error");
			                })
			                .always(function () {
			                    console.log("complete");
			                });
                }else{
                    alert("余额不足");
                }
            }
        }

        function quoteChange(){
            var quote = $('#quote_id').val();
            var root = $('#main-header').attr("data-id");
            if(quote!=-1) {
                $.ajax({
                    url: root + '/materiel/quoteChange',
                    type: 'POST',
                    dataType: 'json',
                    data: {"quote": quote}
                }).done(function (msg) {
                    //提示信息
                    var json = eval(msg);
                    $("#price1").val(json.price);
                    $("#price").val(json.price);
                    $("#currency").val(json.currency);
                    $("#quote_content").val(json.content);


                })
                        .fail(function () {
                            console.log("error");
                        })
                        .always(function () {
                            console.log("complete");
                        });
            }else{
                $("#price1").val("请选择供应商");
                $("#price").val("-1");
                $("#currency").val("请选择供应商");
                $("#quote_content").val("请选择供应商");
            }

        }

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


