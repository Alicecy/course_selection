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
                    <h1 class="page-title">发布实验开放通知</h1>
                </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                    <ol class="breadcrumb">
                        <li><a href="homepage_teacher">主页</a></li>
                        <li><a href="post_content">信息发布</a></li>
                        <li class="active">发布实验开放信息</li>
                    </ol>
                </div>
            </div>
            <div class="col-md-12">
                <div class="white-box"  style="margin:2% auto;">
                    <p>发布实验开放信息</p>
                    <form class="form-horizontal form-material" action="popenInfo" method="post"  onsubmit="return checkform()">
                        <div style="border:3px solid RGB(237,241,245)">
                            <table class="table" >
                                <thead>
                                <th> &nbsp; 实验课程号</th>
                                <th> &nbsp; 实验名称</th>
                                <th>第一轮实验起始周</th>
                                <th>第一轮实验结束周</th>
                                <th>第二轮实验起始周</th>
                                <th>第二轮实验结束周</th>
                                <th> &nbsp; 实验室房间号</th>
                                <th> &nbsp; 实验室座位数量</th>
                                <th> &nbsp; 备注</th>
                                <th> &nbsp; 发布</th>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <div class="col-md-12">
                                            <input type="text" required="required" class="form-control form-control-line"  id="eid" name="eid" value=" " style="border-bottom: 1px solid black;" onfocus="javascript:this.value=' '">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="col-md-12">
                                            <textarea rows="3"  required="required" class="form-control form-control-line"  id="ename" style="resize: none;border-bottom: 1px solid black;" name="ename"></textarea>
<%--                                            <input type="text" class="form-control form-control-line"  name=" " value=" " style="border-bottom: 1px solid black;">--%>
                                        </div>
                                    </td>
                                    <td>
                                        <select  name="one_start" class="form-control form-control-line">
                                            <option value ="1">1</option>
                                            <option value ="2">2</option>
                                            <option value ="3">3</option>
                                            <option value ="4">4</option>
                                            <option value ="5">5</option>
                                            <option value ="6">6</option>
                                            <option value ="7">7</option>
                                            <option value ="8">8</option>
                                            <option value ="9">9</option>
                                            <option value ="10">10</option>
                                            <option value ="11">11</option>
                                            <option value ="12">12</option>
                                            <option value ="13">13</option>
                                            <option value ="14">14</option>
                                            <option value ="15">15</option>
                                            <option value ="16">16</option>
                                            <option value ="17">17</option>
                                            <option value ="18">18</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select  name="one_end" class="form-control form-control-line">
                                            <option value ="1">1</option>
                                            <option value ="2">2</option>
                                            <option value ="3">3</option>
                                            <option value ="4">4</option>
                                            <option value ="5">5</option>
                                            <option value ="6">6</option>
                                            <option value ="7">7</option>
                                            <option value ="8">8</option>
                                            <option value ="9">9</option>
                                            <option value ="10">10</option>
                                            <option value ="11">11</option>
                                            <option value ="12">12</option>
                                            <option value ="13">13</option>
                                            <option value ="14">14</option>
                                            <option value ="15">15</option>
                                            <option value ="16">16</option>
                                            <option value ="17">17</option>
                                            <option value ="18">18</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select  name="two_start" class="form-control form-control-line">
                                            <option value ="1">1</option>
                                            <option value ="2">2</option>
                                            <option value ="3">3</option>
                                            <option value ="4">4</option>
                                            <option value ="5">5</option>
                                            <option value ="6">6</option>
                                            <option value ="7">7</option>
                                            <option value ="8">8</option>
                                            <option value ="9">9</option>
                                            <option value ="10">10</option>
                                            <option value ="11">11</option>
                                            <option value ="12">12</option>
                                            <option value ="13">13</option>
                                            <option value ="14">14</option>
                                            <option value ="15">15</option>
                                            <option value ="16">16</option>
                                            <option value ="17">17</option>
                                            <option value ="18">18</option>
                                        </select>
                                    </td>
                                    <td><select  name="two_end" class="form-control form-control-line">
                                        <option value ="1">1</option>
                                        <option value ="2">2</option>
                                        <option value ="3">3</option>
                                        <option value ="4">4</option>
                                        <option value ="5">5</option>
                                        <option value ="6">6</option>
                                        <option value ="7">7</option>
                                        <option value ="8">8</option>
                                        <option value ="9">9</option>
                                        <option value ="10">10</option>
                                        <option value ="11">11</option>
                                        <option value ="12">12</option>
                                        <option value ="13">13</option>
                                        <option value ="14">14</option>
                                        <option value ="15">15</option>
                                        <option value ="16">16</option>
                                        <option value ="17">17</option>
                                        <option value ="18">18</option>
                                    </select></td>
                                    <td>
                                        <div class="col-md-12">
                                            <input type="text" class="form-control form-control-line" required="required" id="lab" name="lab" value=" " style="border-bottom: 1px solid black;" onfocus="javascript:this.value=' '">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="col-md-12">
                                            <input type="text" class="form-control form-control-line" required="required" id="seat"  name="seat_num" value=" " style="border-bottom: 1px solid black;" onfocus="javascript:this.value=' '">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="col-md-12">
                                            <input type="text" class="form-control form-control-line"  name="remark" value=" " style="border-bottom: 1px solid black;">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <button class="btn btn-success" type="submit" >确认发布</button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </form><script type="text/javascript">
                    function checkform(){
                        if((document.getElementById('eid').value==" ")||(document.getElementById('ename').value==" ")||(document.getElementById('lab').value==" ")||(document.getElementById('seat').value==" ")){
                            alert('实验课程号/名称/房间号/座位数量不能为空！');
                            document.getElementById('eid').focus();
                            document.getElementById('ename').focus();
                            document.getElementById('lab').focus();
                            document.getElementById('seat').focus();
                            return false;
                        }
                    }
                </script>

                    <h5>完成操作后，请注意<a href="../logout">登出</a></h5>
                </div>
            </div>

            <div class="col-md-12">
                <div class="white-box"  style="margin:2% auto;">
                    <h3 class="box-title">实验开放信息</h3>
                    <div style="border:3px solid RGB(237,241,245)">
                        <c:forEach items="${open}" var="c" varStatus="st">
                        <table class="table">
                            <thead>
                                <th>实验课程号</th>
                                <th style="width: 20%;">实验名称</th>
                                <th>第一轮实验开始周</th>
                                <th>第一轮实验结束周</th>
                                <th>第二轮实验开始周</th>
                                <th>第二轮实验结束周</th>
                                <th>实验室房间号</th>
                                <th>实验室座位数量</th>
                                <th>备注</th>
                                <th>删除</th>
                            </thead>
                            <tbody>
                            <tr>
                                <td>${c.eid}</td>
                                <td>${c.ename}</td>
                                <td>${c.one_start}</td>
                                <td>${c.one_end}</td>
                                <td>${c.two_start}</td>
                                <td>${c.two_end}</td>
                                <td>${c.lab}</td>
                                <td>${c.seat_num}</td>
                                <td>${c.remark}</td>
                                <form class="form-horizontal form-material" action="delete_openInfo" method="post">
                                    <td style="margin:0 10% 0 10%;"> <button class="btn btn-danger btn-block waves-effect waves-light" aria-hidden="true" id="${c.id}" value="${c.id}" name="id">删除</button></td>
                                </form>
                            </tr>
                            </tbody>
                        </table>
                        </c:forEach>
                    </div>
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