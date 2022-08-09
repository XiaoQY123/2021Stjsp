<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="linksql.jsp" %>
    <%@page import="java.util.*" %>
    <%@page import="java.sql.*" %>
    <%@ page import="com.jspsmart.upload.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String name=request.getParameter("name");
String type=request.getParameter("type");
String price=request.getParameter("price");
String num=request.getParameter("num");
String sql="update project set protype='"+
type+"',proprice="+price+",pronum="+num+" where proname='"+name+"'";
System.out.println(sql);
int n=stmt.executeUpdate(sql);
if(n>0) {
	out.print("修改数据成功！");
}else{
	out.print("修改数据失败！");
}
response.setHeader("Refresh","0.1;canping.jsp");
%>
</body>
</html>