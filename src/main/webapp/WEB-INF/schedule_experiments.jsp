<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" deferredSyntaxAllowedAsLiteral="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--实验预约目录--%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="icon" type="image/png" sizes="16x16" href="/plugins/images/favicon.png">
	<title>大学物理实验系统</title>
	<!-- Bootstrap Core CSS -->
	<link href="/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- Menu CSS -->
	<link href="/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
	<!-- animation CSS -->
	<link href="/css/animate.css" rel="stylesheet">
	<!-- Custom CSS -->
	<link href="/css/style.css" rel="stylesheet">
	<!-- color CSS -->
	<link href="/css/colors/default.css" id="theme" rel="stylesheet">
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>

<body class="fix-header">
<!-- ============================================================== -->
<!-- Preloader -->
<!-- ============================================================== -->
<div class="preloader">
	<svg class="circular" viewBox="25 25 50 50">
		<circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"/>
	</svg>
</div>
<!-- ============================================================== -->
<!-- Wrapper -->
<!-- ============================================================== -->
<div id="wrapper">
	<nav class="navbar navbar-default navbar-static-top m-b-0">
		<div class="navbar-header" style="height: 68px;">
			<div class="top-left-part">
				<!-- Logo -->
				<a class="logo">

                    <span class="hidden-xs">
                        <img src="../img/headlogo.png" alt="home" class="light-logo" width="100%" height="100%"/>
                        </span>
				</a>
			</div>
			<!-- /Logo -->
			<ul class="nav navbar-top-links navbar-right pull-right">
				<li>
					<a class="nav-toggler open-close waves-effect waves-light hidden-md hidden-lg"
					   href="javascript:void(0)"><i class="fa fa-bars"></i></a>
				</li>

				<c:if test="${!empty student}">
					<li>
						<a class="profile-pic" href="#">用户：${student.sname}</a>
					</li>
				</c:if>

				<c:if test="${!empty student}">
					<li>
						<a class="profile-pic" href="../to/login"> 登出 </a>
					</li>
				</c:if>

				<c:if test="${empty student}">
					<li>
						<a class="profile-pic" href="../to/login"> 登陆 </a>
					</li>
				</c:if>

				</li>
			</ul>
		</div>

	</nav>
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav slimscrollsidebar">
			<div class="sidebar-head">
				<h3><span class="fa-fw open-close"><i class="ti-close ti-menu"></i></span> <span
						class="hide-menu">Navigation</span></h3>
			</div>
			<ul class="nav" id="side-menu">
				<li style="padding: 70px 0 0;">
					<a href="homepage" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>主页[Home]</a>
				</li>
				<li>
					<a href="experiments" class="waves-effect"><i class="fa fa-table fa-fw"
					                                              aria-hidden="true"></i>实验预约<br/>[Experiment
						Appointment]</a>
				</li>
				<li>
					<a href="query_teacher" class="waves-effect"><i class="fa fa-info-circle fa-fw"
					                                                aria-hidden="true"></i>任课教师查询<br/>[Query
						Teacher]</a>
				</li>
				<li>
					<a href="message" class="waves-effect"><i class="fa fa-font fa-fw" aria-hidden="true"></i>留言板<br/>[Message
						Board]</a>
				</li>
				<li>
					<a href="lostfound" class="waves-effect"><i class="fa fa-globe fa-fw"
					                                            aria-hidden="true"></i>失物招领<br/>[Lost and Found]</a>
				</li>
				<li>
					<a href="mailbox" class="waves-effect"><i class="fa fa-columns fa-fw"
					                                          aria-hidden="true"></i>投诉信箱<br/>[Complaint Mailbox]</a>
				</li>
			</ul>
			<div class="center p-20">
				<c:if test="${empty student}">
					<a href="../to/login" class="btn btn-danger btn-block waves-effect waves-light"
					   aria-hidden="true">登录</a>
				</c:if>
				<c:if test="${!empty student}">
					<a href="../logout" class="btn btn-danger btn-block waves-effect waves-light"
					   aria-hidden="true">登出</a>
				</c:if>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- End Left Sidebar -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- Page Content -->
	<!-- ============================================================== -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row bg-title">
				<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
					<h1 class="page-title">实验预约</h1>
				</div>
				<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
					<ol class="breadcrumb">
						<li><a href="homepage">主页</a></li>
						<li class="active">实验预约</li>
					</ol>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /row -->
			<div class="row">
				<div class="col-sm-12">
					<div class="white-box">
						<h3 class="box-title">实验预约 [目录]</h3>
						<p class="text-muted"></p>
						<div class="table-responsive">
								<tr><span style="font-size: 120%; ">${student.sname}</span>你好
									<c:if test="${student.password==student.initial_password}">
										,请修改密码
									</c:if>
								</tr>
								<br/>
								<tr>
									你已经选了${student.selected_num}个实验，还要选${(student.total_num)-(student.selected_num)}个实验，否则无期末成绩
								</tr>
							</table>

							<table class="table">
								<tbody>
								<tr>
									<td>1</td>
									<td><a href="operating">预约实验</a>[Schedule Experiments]</td>
									<td>根据实验名称、周次检索空座并预约实验<br/>[You can search for empty seats and schedule experiments
										based on the experiment name and weeks of class]
									</td>

								</tr>
								<tr>
									<td>2</td>
									<td><a href="search">查询预约状态</a>[Query Experiment]</td>
									<td>查看当前预约实验的状态，也可以取消预约的实验<br/>[You can view the status of the currently scheduled
										experiment, or cancel the scheduled experiment]
									</td>
								</tr>
								<tr>
									<td>3</td>
									<td><a class="register-link"
									       href="updateStudent">修改个人密码</a>[Change Password]
									</td>
								</tr>
								</tbody>
							</table>
							<h5>完成操作后，请注意<a href="../logout">登出</a></h5>
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
		<footer class="footer text-center">@2020 黑龙江大学 大学物理实验系统</footer>
	</div>
	<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
<!-- jQuery -->
<script src="/plugins/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Menu Plugin JavaScript -->
<script src="/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
<!--slimscroll JavaScript -->
<script src="/js/jquery.slimscroll.js"></script>
<!--Wave Effects -->
<script src="/js/waves.js"></script>
<!-- Custom Theme JavaScript -->
<script src="/js/custom.min.js"></script>

</body>

</html>