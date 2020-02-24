<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" deferredSyntaxAllowedAsLiteral="true" isELIgnored="false"%>

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
                    <ol class="breadcrumb">
                        <li><a href="homepage_teacher">主页</a></li>
                        <li class="active">按课程查询任课教师</li>
                    </ol>
                </div>

                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="white-box">
                            <table class="table" style="text-align: center" >
                                <thead>
                                <tr>
                                    <th>节次</th>
                                    <th colspan="7" style="text-align: center">1-4节</th>
                                    <th colspan="7" style="text-align: center">5-8节</th>
                                </tr>
                                <tr>
                                    <th>周次</th>
                                    <th>周日</th>
                                    <th>周一</th>
                                    <th>周二</th>
                                    <th>周三</th>
                                    <th>周四</th>
                                    <th>周五</th>
                                    <th>周六</th>
                                    <th>周日</th>
                                    <th>周一</th>
                                    <th>周二</th>
                                    <th>周三</th>
                                    <th>周四</th>
                                    <th>周五</th>
                                    <th>周六</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${ta}" var="c">
                                    <form action="/update">
                                        <tr>
                                            <th><input style="text-align:center;width: 54px;" type="text" name="week" value="${c.week}" class="form-control form-control-line" readonly unselectable="on"/></th>
                                            <th><input style="width: 54px;" type="text" name="1" value="${c.sunday_1}" class="form-control form-control-line"/></th>
                                            <th><input style="width: 54px;" type="text" name="3" class="form-control form-control-line" value="${c.monday_1}"/></th>
                                            <th><input style="width: 54px;" type="text" name="5" class="form-control form-control-line" value="${c.tuesday_1}"/></th>
                                            <th><input style="width: 54px;" type="text" name="7" class="form-control form-control-line" value="${c.wednesday_1}"/></th>
                                            <th><input style="width: 54px;" type="text" name="9" class="form-control form-control-line" value="${c.thursday_1}"/></th>
                                            <th><input style="width: 54px;" type="text" name="11" class="form-control form-control-line" value="${c.friday_1}"/></th>
                                            <th><input style="width: 54px;" type="text" name="13" class="form-control form-control-line" value="${c.saturday_1}"/></th>
                                            <th><input style="width: 54px;" type="text" name="2" class="form-control form-control-line" value="${c.sunday_2}"/></th>
                                            <th><input style="width: 54px;" type="text" name="4" class="form-control form-control-line" value="${c.monday_2}"/></th>
                                            <th><input style="width: 54px;" type="text" name="6" class="form-control form-control-line" value="${c.tuesday_2}"/></th>
                                            <th><input style="width: 54px;" type="text" name="8" class="form-control form-control-line" value="${c.wednesday_2}"/></th>
                                            <th><input style="width: 54px;" type="text" name="10" class="form-control form-control-line" value="${c.thursday_2}"/></th>
                                            <th><input style="width: 54px;" type="text" name="12" class="form-control form-control-line" value="${c.friday_2}"/></th>
                                            <th><input style="width: 54px;" type="text" name="14" class="form-control form-control-line" value="${c.saturday_2}"/></th>
                                            <th>
                                                <input type="submit" class="btn btn-success" id="edit" value="修改"></th>
                                        </tr>
                                    </form>
                                </c:forEach>
                                </tbody>
                                <br>
                                <p style="font-family: 幼圆;color:red;font-size:25px;">亲爱的教师，请您谨慎修改任课情况。如果您修改某周任课情况后，只需点某周后缀的按钮即可修改成功。</p>
                            </table>
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
    <script type="text/javascript">
        window.onload=function()
        {
            var update=document.getElementById("edit");
            update.onclick=function()
            {
                if(confirm("确定要修改吗?"))
                {
                    return true;
                }else{
                    return false;
                }
            }
        }
    </script>
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