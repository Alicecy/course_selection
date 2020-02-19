<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.course_selection.mapper.ExperimentMapper" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" deferredSyntaxAllowedAsLiteral="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="icon" type="image/png" sizes="16x16" href="plugins/images/favicon.png">
	<%--<link rel="icon" type="image/png" sizes="16x16" href="img/favicon.png">--%>
	<title>大学物理实验系统</title>
	<!-- Bootstrap Core CSS -->
	<link href="../bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- Menu CSS -->
	<link href="../bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
	<!-- toast CSS -->
	<link href="../bower_components/toast-master/css/jquery.toast.css" rel="stylesheet">
	<!-- morris CSS -->
	<link href="../bower_components/morrisjs/morris.css" rel="stylesheet">
	<!-- chartist CSS -->
	<link href="../bower_components/chartist-js/dist/chartist.min.css" rel="stylesheet">
	<link href="../bower_components/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet">
	<!-- animation CSS -->
	<link href="../css/animate.css" rel="stylesheet">
	<!-- Custom CSS -->
	<link href="../css/style.css" rel="stylesheet">
	<!-- color CSS -->
	<link href="../css/colors/default.css" id="theme" rel="stylesheet">
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>

<body class="fix-header">

<div class="preloader">
	<svg class="circular" viewBox="25 25 50 50">
		<circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"/>
	</svg>
</div>

<div id="wrapper">
	<nav class="navbar navbar-default navbar-static-top m-b-0">
		<div class="navbar-header" style="height: 68px;">
			<div class="top-left-part">
				<!-- Logo -->
				<a class="logo">
                    <span class="hidden-xs">
                        <img src="../img/headlogo.png" alt="home" class="light-logo" width="100%" height="100%" />
                        </span>
				</a>
			</div>
			<!-- /Logo -->
			<ul class="nav navbar-top-links navbar-right pull-right">
				<li>
					<a class="nav-toggler open-close waves-effect waves-light hidden-md hidden-lg"
					   href="javascript:void(0)"><i class="fa fa-bars"></i></a>
				</li>
				<li>
					<form role="search" class="app-search hidden-sm hidden-xs m-r-10">
						<input type="text" placeholder="Search..." class="form-control">
						<a href="">
							<i class="fa fa-search"></i>
						</a>
					</form>
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
					<a href="../experiments" class="waves-effect"><i class="fa fa-table fa-fw"
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
					<a href="../lostfound" class="waves-effect"><i class="fa fa-globe fa-fw" aria-hidden="true"></i>失物招领<br/>[Lost
						and Found]</a>
				</li>
				<li>
					<a href="mailbox" class="waves-effect"><i class="fa fa-columns fa-fw"
					                                          aria-hidden="true"></i>投诉信箱<br/>[Complaint Mailbox]</a>
				</li>
				<li>
					<a href="/teacher_channel" class="waves-effect"><i class="fa fa-info-circle fa-fw" aria-hidden="true"></i>教师通道<br/>[Teacher
						Channel]</a>
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

	<div id="page-wrapper">
		<div class="container-fluid">


			<div class="row">
				<div class="col-md-12 col-lg-12 col-sm-12">
					<div class="white-box">

						<h1 style="margin: 0px;padding: 0px;text-align: center">首页</h1>
						<h4 style="margin: 0px;padding: 0px;text-align: center">&nbsp;-Index-</h4>
						<p style="text-align: center">+-------------------------------------------------------------------+</p>
						<br/>
						<h2 style="color: red">本周是第
							<%
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
								Date openDay = sdf.parse("2020-01-01 12:00:00");
								GregorianCalendar g = new GregorianCalendar();
								g.setTime(openDay);
								int num1 = g.get(Calendar.WEEK_OF_YEAR);//计算开学日期的周数
								Date nowdate = new Date();
								String s = sdf.format(nowdate);
								nowdate = sdf.parse(s);
								g.setTime(nowdate);
								int num2 = g.get(Calendar.WEEK_OF_YEAR);//计算当前日期的周数
								out.print(num2 - num1 + 1);
							%>周</h2>
						<h1 style="color: red;">通知</h1>
						<c:forEach items="${notice}" var="c" varStatus="st">
						<h4> <ul><li>
								${c.comment}
						</li></ul></h4>
						</c:forEach>
						<br/>
						<h1 style="color: red">实验预约注意事项</h1>
						<c:forEach items="${attention}" var="c" varStatus="st">
							<h4> <ul><li>
									${c.comment}
							</li></ul></h4>
						</c:forEach>
						<br/>
						<h1 style="color: red">实验室守则</h1>
						<c:forEach items="${rules}" var="c" varStatus="st">
							<h4> <ul><li>
									${c.comment}
							</li></ul></h4>
						</c:forEach>
						<p>+-------------------------------------------------------------------+</p>
						<h1 style="color: red">实验开放信息</h1>
						<div class="table-responsive">
							<table class="table">
								<thead>
								<tr>
									<th>实验号</th>
									<th>实验题目</th>
									<th>房间号</th>s
									<th>开设周次</th>
									<th>备注</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${experiments}" var="c" varStatus="st">
									<tr>
										<td>${c.eid}</td>
										<td>${c.ename}</td>
										<td>${c.lab}</td>
										<td><c:if test="${c.one_start!=0}">
											${c.one_start}-
										</c:if>
											<c:if test="${c.one_end!=0}">
												${c.one_end} ,
											</c:if>
											<c:if test="${c.two_start!=0}">
												${c.two_start}-
											</c:if>
											<c:if test="${c.two_end!=0}">
												${c.two_end}
											</c:if>
										</td>
										<td>
											<c:if test="${c.remark!='无'}">
												${c.remark}
											</c:if>
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>
		<footer class="footer text-center">@2020 黑龙江大学 大学物理实验系统</footer>
	</div>

</div>

<script src="../bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="../bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Menu Plugin JavaScript -->
<script src="../bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
<!--slimscroll JavaScript -->
<script src="../js/jquery.slimscroll.js"></script>
<!--Wave Effects -->
<script src="../js/waves.js"></script>
<!--Counter js -->
<script src="../bower_components/waypoints/lib/jquery.waypoints.js"></script>
<script src="../bower_components/counterup/jquery.counterup.min.js"></script>
<!-- chartist chart -->
<script src="../bower_components/chartist-js/dist/chartist.min.js"></script>
<script src="../bower_components/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.min.js"></script>
<!-- Sparkline chart JavaScript -->
<script src="../bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="../js/custom.min.js"></script>

<script src="../bower_components/toast-master/js/jquery.toast.js"></script>
</body>

</html>
