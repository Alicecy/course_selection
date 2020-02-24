<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/1/16
  Time: 22:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="icon" type="image/png" sizes="16x16" href="plugins/images/favicon.png">
	<title>大学物理实验系统</title>
	<!-- Bootstrap Core CSS -->
	<link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- Menu CSS -->
	<link href="plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
	<!-- animation CSS -->
	<link href="css/animate.css" rel="stylesheet">
	<!-- Custom CSS -->
	<link href="css/style.css" rel="stylesheet">
	<!-- color CSS -->
	<link href="css/colors/default.css" id="theme" rel="stylesheet">
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>

<body class="fix-header">
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
					<a href="homepage_teacher" class="waves-effect"><i class="fa fa-clock-o fa-fw"
					                                                   aria-hidden="true"></i>主页[Home]</a>
				</li>
				<li>
					<a href="post_content" class="waves-effect"><i class="fa fa-table fa-fw"
					                                               aria-hidden="true"></i>发布信息<br/>[Experiment
						Appointment]</a>
				</li>
				<li>
					<a href="query_student_subscribe" class="waves-effect"><i class="fa fa-info-circle fa-fw"
					                                                          aria-hidden="true"></i>查询实验名单 <br/>[Query
						the list of experiments]</a>
				</li>
				<li>
					<a href="query_teacher_teacher" class="waves-effect"><i class="fa fa-font fa-fw"
					                                                        aria-hidden="true"></i>查询任课教师<br/>[Inquire
						about the teacher]</a>
				</li>
				<li>
					<a href="reply_message" class="waves-effect"><i class="fa fa-globe fa-fw" aria-hidden="true"></i>回复留言板<br/>[Reply
						to student messages]</a>
				</li>
				<li>
					<a href="lostfound_teacher" class="waves-effect"><i class="fa fa-search"></i> 失物招领<br/>[Lost and Found]</a>
				</li>
				<li>
					<a href="reset_password" class="waves-effect"><i class="fa fa-columns fa-fw"
					                                                 aria-hidden="true"></i>重置学生密码<br/>[Reset the
						student's password]</a>
				</li>
				<li>
					<a href="set_startDate" class="waves-effect"><i class="fa fa-info-circle fa-fw"
					                                                aria-hidden="true"></i>设置开学日期<br/>[Set start
						date]</a>
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
					<h1 class="page-title">设置开学日期</h1>
				</div>
				<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
					<ol class="breadcrumb">
						<li><a href="homepage_teacher">主页</a></li>
						<li class="active">设置开学日期</li>
					</ol>
				</div>
			</div>
			<div class="row">
				<div class="white-box" style="width:35%;margin: 2% auto;">
					<form class="form-horizontal form-material" action="set_day" method="post"
					      onsubmit="return checkform()">
						<div class="form-group">
							<label class="col-md-12">请输入开学年份</label>
							<div class="col-md-12">
								<input type="text" class="form-control form-control-line" required="required"
								       name="year" value=" " id="year"
								       style="margin: 0 auto;width: 30%;border-bottom: 1px solid black"
								       onfocus="javascript:this.value=''">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-12">请选择开学月份</label>
							<select name="month" class="form-control form-control-line"
							        style="width: 30%;margin:0 auto;">
								<option value="1">01</option>
								<option value="2">02</option>
								<option value="3">03</option>
								<option value="4">04</option>
								<option value="5">05</option>
								<option value="6">06</option>
								<option value="7">07</option>
								<option value="8">08</option>
								<option value="9">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>
						</div>
						<div class="form-group">
							<label class="col-md-12">请选择开学日期</label>
							<div class="col-md-12">
								<select name="day" class="form-control form-control-line"
								        style="width: 30%;margin:0 auto;">
									<option value="1">01</option>
									<option value="2">02</option>
									<option value="3">03</option>
									<option value="4">04</option>
									<option value="5">05</option>
									<option value="6">06</option>
									<option value="7">07</option>
									<option value="8">08</option>
									<option value="9">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<button class="btn btn-success" type="submit" style="width: 50%;margin:0 10% 0 25%">
									确认重置
								</button>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<p>当前开学日期：${time}</p>
							</div>
						</div>
						<script type="text/javascript">
                            function checkform() {
                                if (document.getElementById('year').value == " ") {
                                    alert('开学年份不能为空！');
                                    document.getElementById('year').focus();
                                    return false;
                                }
                            }
						</script>
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