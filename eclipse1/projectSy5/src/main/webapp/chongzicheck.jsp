<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*" %>
    <%@page import="java.util.*" %>
    <%@include file="linksql.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String merberid=request.getParameter("merberid");
String merberpws=request.getParameter("pwd");
String merberpws2=request.getParameter("pwd2");
if(merberpws.equals(merberpws2)){
String sql="update merbvip set pwd='"+merberpws+"' where merberid="+merberid;
int n=stmt.executeUpdate(sql);
if(n>0){
	out.println("<script>alert('修改成功')</script>");
	response.setHeader("Refresh","1;login.jsp");
}
}else{
	out.println("<script>alert('密码不一致，重新输入')</script>");
	response.setHeader("Refresh","1;chongzi.jsp");
}

%>
</body>
</html>