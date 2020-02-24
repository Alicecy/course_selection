<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>大物选课登陆</title>
    <link rel="stylesheet" href="/css/auth.css">
    <script src="/js/auth.js"></script>
    <script src="/js/jquery.min.js"></script>
</head>

<body>
<div class="lowin lowin-blue">
    <div class="lowin-brand">
        <img src="/img/hljLogo.jpg" alt="logo">
    </div>

    <div class="lowin-wrapper">
        <div class="lowin-box lowin-login">
            <div class="lowin-box-inner">
                <form class="form form-horizontal" method="post" action="${ctx}/login_teacher" id="form_01">

                    <p style="font-size: 30px;margin-top: -20px">教师登录</p>
                    <div class="lowin-group" style="margin: 2% auto;">
                        <p style="text-align: center">请正确输入教工号和密码进行登录！</p>
                    </div>
                    <div class="lowin-group">
                        <input name="tid" type="text" placeholder="教工号" class="lowin-input" value="${tid}" >
                    </div>
                    <div class="lowin-group">
                        <input name="password" type="password" placeholder="密码" class="lowin-input" >
                    </div>
                    <c:if test="${errorMeg!=null}">
                        <p style="color: #FF4500;">${errorMeg}</p>
                    </c:if>

                    <button type="submit" class="lowin-btn" id="login_button_01" onclick="fun()">登陆</button>
                </form>
                <%--<h2 align="center" hidden id="message">${sid}${errorMeg}</h2>--%>
                <div class="text-foot">
                    <a href="/homepage_teacher" class="login-link">返回主页</a>
                </div>
            </div>
        </div>
        <footer class="lowin-footer">
            Design By <a href="#">@计软科协</a>
        </footer>
    </div>
</div>

</body>
</html>






