<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/1/16
  Time: 22:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'  %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
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
                    <h1 class="page-title">回复留言</h1>
                </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                    <ol class="breadcrumb">
                        <li><a href="homepage_teacher">主页</a></li>
                        <li class="active">回复留言板</li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="white-box">
                        <h3 class="box-title">留言板</h3>

                            <div style="border:3px solid RGB(237,241,245)">
                                <c:forEach items="${mes}" var="c" varStatus="st">
                                    <form action="reply_message" >
                                    <table class="table">
                                        <tr>

                                            <td style="background-color:RGB(237,241,245);color: black;text-align: center">编号：</td>
                                            <td><input value="${c.id}" type="text" readonly name="id" style="border: none"/> </td>
                                            <%--<td>${c.id}</td>--%>
                                            <td style="background-color:RGB(237,241,245);color: black;text-align: center">留言时间：</td>
                                            <td><fmt:formatDate value="${c.time}" pattern="yyyy-MM-dd HH:mm"/></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:RGB(237,241,245);color: black;text-align: center">姓名：</td>
                                            <td>${c.sname}</td>
                                            <td style="background-color:RGB(237,241,245);color: black;text-align: center">留言给：</td>
                                            <td> ${c.to}</td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:RGB(237,241,245);color: black;text-align: center">留言：</td>
                                            <td colspan="3"> ${c.content}</td>
                                        </tr>
                                        <tr>
                                            <td style="background-color:RGB(237,241,245);color: black;text-align: center">回复：</td>
                                            <td colspan="3">
                                                <div class="col-md-12">
                                                    <input type="text" class="form-control form-control-line"  name="reply" value="${c.reply}"
                                                           style="border-bottom: 1px solid black;">

                                                </div>
                                            </td>
                                            <td colspan="3">
                                                <div class="form-group">
                                                    <div class="col-sm-12">
                                                        <c:if test="${!empty teacher}">
                                                            <c:if test="${c.reply==null||StringUtils.isBlank(c.reply)}">
                                                                <button class="btn btn-success" type="submit" >确认回复</button>
                                                            </c:if>
                                                            <c:if test="${!(c.reply==null||StringUtils.isBlank(c.reply))}">
                                                                <button class="btn btn-success" style="background-color: red;" onclick="fun(this)" type="button">已回复</button>
                                                            </c:if>
                                                        </c:if>

                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    </form>
                                </c:forEach>
                            </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
    <footer class="footer text-center">@2020 黑龙江大学 大学物理实验系统</footer>
</div>
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

<script type="text/javascript">
        function fun(){
            $.ajax({
                type: "post",
                data: {},
                success: function() {
                    alert("只能回复一次，您已经回复过了");
                }
            });
        }


</script>
</body>

</html>