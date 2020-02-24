<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<div style="width:60%;border:1px solid lightgray;margin:200px auto;padding:80px">

	系统 出现了异常，异常原因是：
	${exception}
	<br><br>
	出现异常的地址是：
	${url}
	<form action="/" method="post">
		<button type="submit">返回</button>
	</form>
</div>