<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix='fmt' %>
<html>

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
				<c:if test="${!empty teacher}">
					<li>
						<a class="profile-pic" href="#">用户：${teacher.tname}</a>
					</li>
				</c:if>

				<c:if test="${!empty teacher}">
					<li>
						<a class="profile-pic" href="../logout_teacher"> 登出 </a>
					</li>
				</c:if>

				<c:if test="${empty teacher}">
					<li>
						<a class="profile-pic" href="../teacher/login_teacher"> 登陆 </a>
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
					<a href="homepage_teacher" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>主页[Home]</a>
				</li>
				<li>
					<a href="post_content" class="waves-effect"><i class="fa fa-table fa-fw"
					                                               aria-hidden="true"></i>发布信息<br/>[Experiment
						Appointment]</a>
				</li>
				<li>
					<a href="query_student_subscribe" class="waves-effect"><i class="fa fa-info-circle fa-fw"
					                                                          aria-hidden="true"></i>查询实验名单 <br/>[Query the list of experiments]</a>
				</li>
				<li>
					<a href="query_teacher_teacher" class="waves-effect"><i class="fa fa-font fa-fw" aria-hidden="true"></i>查询任课教师<br/>[Inquire about the teacher]</a>
				</li>
				<li>
					<a href="reply_message" class="waves-effect"><i class="fa fa-globe fa-fw" aria-hidden="true"></i>回复留言板<br/>[Reply to student messages]</a>
				</li>
				<li>
					<a href="lostfound_teacher" class="waves-effect"><i class="fa fa-search"></i> 失物招领<br/>[Lost and Found]</a>
				</li>
				<li>
					<a href="reset_password" class="waves-effect"><i class="fa fa-columns fa-fw"
					                                                 aria-hidden="true"></i>重置学生密码<br/>[Reset the student's password]</a>
				</li>
				<li>
					<a href="set_startDate" class="waves-effect"><i class="fa fa-info-circle fa-fw" aria-hidden="true"></i>设置开学日期<br/>[Set start date]</a>
				</li>
			</ul>
			<div class="center p-20">
				<c:if test="${empty teacher}">
					<a href="../teacher/login_teacher" class="btn btn-danger btn-block waves-effect waves-light"
					   aria-hidden="true">登录</a>
				</c:if>
				<c:if test="${!empty teacher}">
					<a href="../logout_teacher" class="btn btn-danger btn-block waves-effect waves-light"
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
					<h1 class="page-title">失物招领</h1>
				</div>
				<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
					<ol class="breadcrumb">
						<li><a href="/homepage_teacher">主页</a></li>
						<li class="active">失物招领</li>
					</ol>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="white-box">
						<h2 class="box-title"><a href="#box1">我要发布</a></h2>
						<c:forEach items="${page.list}" var="c">
							<div style="border:1px solid black;width: 100%;">
								<table class="table" style="word-break:break-all;">
									<tr>
										<th style="width:10%">${c.id}&nbsp;&nbsp;&nbsp;${c.type}</th>
										<th style="width:70%">摘要：${c.title}</th>
										<th style="width:30%"></th>
									</tr>
									<tr>
										<td></td>
										<td>${c.content}</td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td>发布时间：<fmt:formatDate value="${c.time}" pattern="yyyy-MM-dd HH:mm"/></td>
										<td>${c.place}&nbsp;(${c.number})&nbsp;</td>
									</tr>
									<br>
								</table>
							</div>
							<br><br><br>
						</c:forEach>
						<div style="height:20px;widht:100px;margin: 0 auto;text-align: center">
							<a href="?start=1">[首 页]</a>
							<a href="?start=${page.pageNum-1}">[上一页]</a>
							<a href="?start=${page.pageNum+1}">[下一页]</a>
							<a href="?start=${page.pages}">[末 页]</a>
						</div>
					</div>
				</div>
				<div id="box1" class="white-box" style="float:left;width:70%;margin:2% auto;">
					<p>发布启事</p>
					<form method="post" action="/laf_t">
						<div class="form-group" style="margin: 5%;">
							<label class="col-md-12">信息主题：</label>
							<div class="col-md-12">
								<input type="text" name="title" required="required"
								       class="form-control form-control-line" style="margin: 2%;"></div>
						</div>
						<div class="form-group" style="margin: 5%;">
							<label class="col-md-12">详细信息：</label>
							<div class="col-md-12">
                                <textarea rows="5" class="form-control form-control-line" required="required"
                                          name="content" style="resize: none; margin: 0%;"></textarea>
							</div>
						</div>
						<div class="form-group" style="margin: 5%;">
							<label class="col-sm-12" style="margin: 2%;">选择类型：</label>
							<div class="col-sm-12">
								<select class="form-control form-control-line" name="type">
									<option value="招领">招领</option>
									<option value="遗失">遗失</option>
								</select>
							</div>
						</div>
						<div class="form-group" style="margin: 5%;">
							<div class="col-sm-12">
								<label class="col-md-12" style="margin: 2%">实验室号：</label>
								<div class="col-md-12">
									<input type="text" name="number" required="required"
									       class="form-control form-control-line" style="margin: 2%;"></div>
							</div>
						</div>
						<div class="form-group" style="margin: 5%;">
							<div class="col-sm-12" >
								<input type="submit" class="btn btn-success" value="提交" style="width:125px;margin: 5%; float: right;"/>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container-fluid -->
	<footer class="footer text-center">@2020 黑龙江大学 大学物理实验系统</footer>
</div>
<!-- ============================================================== -->
<!-- End Page Content -->
<!-- ============================================================== -->

<!-- /#wrapper -->
<!-- jQuery -->
<script src="plugins/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Menu Plugin JavaScript -->
<script src="plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
<!--slimscroll JavaScript -->
<script src="js/jquery.slimscroll.js"></script>
<!--Wave Effects -->
<script src="js/waves.js"></script>
<!-- Custom Theme JavaScript -->
<script src="js/custom.min.js"></script>
</body>

</html>