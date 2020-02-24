<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" deferredSyntaxAllowedAsLiteral="true"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row bg-title">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <h1 class="page-title">按课程查询教师</h1>
                </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                    <ol class="breadcrumb">查看学生预约情况
                        <li><a href="homepage_teacher">主页</a></li>
                        <li class="active">查询学生预约情况</li>
                    </ol>
                </div>

                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="white-box">
                        <div style="text-align: left; font-size: 150%;width: 500px;margin: 2% auto">
                            <form action="/query_teacher_result" method="post">
                                实验名称：<br>
                                <select id="eid" name="eid" class="form-control form-control-line">
                                    <option value ="0">--请选择--</option>
                                    <option value="1">落球法测量液体的黏滞系数</option>
                                    <option value="2">拉伸法测量金属丝杨氏模量</option>
                                    <option value="3">测量金属的密度</option>
                                    <option value="4">单摆和复摆实验</option>
                                    <option value="5">三线摆和扭摆实验</option>
                                    <option value="6">空气密度与普适气体常数测量</option>
                                    <option value="7">液体表面张力系数的测定</option>
                                    <option value="8">惠斯通电桥实验</option>
                                    <option value="9">数字示波器的使用</option>
                                    <option value="10">电路元件伏安特性的测定</option>
                                    <option value="11">霍尔效应实验</option>
                                    <option value="12">电位差计设计与应用</option>
                                    <option value="13">太阳能电池特性测量</option>
                                    <option value="14">金属电子逸出功的测定</option>
                                    <option value="15">RLC电路谐振特性研究</option>
                                    <option value="16">密立根油滴实验</option>
                                    <option value="17">半导体PN结物理特性及弱电流测量</option>
                                    <option value="18">分光仪的调节和使用</option>
                                    <option value="19">衍射光栅（需做过分光仪实验）</option>
                                    <option value="20">迈克尔逊干涉仪</option>
                                    <option value="21">偏振光旋光实验</option>
                                    <option value="22">几何光学实验--测量薄透镜的焦距</option>
                                    <option value="23">光的等厚干涉</option>
                                </select>
                                <br>
                                <input type="submit" class="btn btn-success" value="OK" />
                            </form>
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