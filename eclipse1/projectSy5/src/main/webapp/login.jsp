<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#98AFC7" >
<form action="logincheck.jsp" method="post">
&nbsp用户ID<input type="text" name="merberid"><br>
用户密码<input type="password" name="pwd"><br>
<input type="submit" value="用户登录" name="merber">
<input type="submit" value="管理员身份登录" name="merbguan">
</form>
<form action="chongzi.jsp" method="post">
<input type="submit" value="重置密码" name="mima">
</form>
</body>
</html>