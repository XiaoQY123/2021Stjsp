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
request.setCharacterEncoding("utf-8");
String proname=request.getParameter("project.proname");
int num=1;
String sql="insert into gouwuche values("+session.getAttribute("n")+",'"+proname+"',"+num+")";

try{
	int t=stmt.executeUpdate(sql);
	if(t>0){
		out.println("<script>alert('加入成功')</script>");
	}
}catch(Exception e){
    out.print("<script>alert('加入失败，请不要重复加入')</script>");
}
response.setHeader("Refresh","1;index.jsp");
%>
</body>
</html>