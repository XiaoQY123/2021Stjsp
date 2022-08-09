<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="linksql.jsp" %>
     <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#98AFC7" >
<form action="userAddcheck.jsp" method="post">
用户ID:<font color="red">*</font><input type="text" name="id"><br>
密码:<font color="red">*</font><input type="password" name="pws"><br>
确认密码:<font color="red">*</font><input type="password" name="pws2"><br>
姓名：<font color="red">*</font><input type="text" name="merbername"><br>
是否注册vip：<input type="radio" name="vip" value="yes" checked>是
<input type="radio" name="vip" value="no">否
<br>
电话号码：<input type="text" name="phonenum"><br>
邮政编码：<input type="text" name="zipcode"><br>
地址：<input type="text" name="adress"><br>
邮箱：<input type="text" name="email"><br>
<input type="submit" value="确认">
</body>
</html>