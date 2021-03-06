<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>船舶管理系统|权限不足</title>
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

         <jsp:include page="module/head.jsp" />
         <!-- Left side column. contains the logo and sidebar -->
         <jsp:include page="module/side-bar.jsp" />

         <!-- Content Wrapper. Contains page content -->
         <div class="content-wrapper">

             <!--Main content -->
             <section class="content">

                 <div class="error-page">
                     <h2 class="headline text-red">500</h2>

                     <div class="error-content">
                         <h3><i class="fa fa-warning text-red"></i>  对不起，您权限不足，已被阻止访问该页面！</h3>

                     </div>
                 </div>
                 <!-- /.error-page -->
             </section>
             <!-- /.content -->
         </div>
        <jsp:include page="module/foot.jsp" />
     </div>
     <!-- ./wrapper -->

     <!-- jQuery 2.2.3 -->
     <script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
     <!-- Bootstrap 3.3.6 -->
     <script src="../../bootstrap/js/bootstrap.min.js"></script>
     <!-- FastClick -->
     <script src="../../plugins/fastclick/fastclick.js"></script>
     <!-- AdminLTE App -->
     <script src="../../dist/js/app.min.js"></script>
     <!-- AdminLTE for demo purposes -->
     <script src="../../dist/js/demo.js"></script>
     </body>
</html>
