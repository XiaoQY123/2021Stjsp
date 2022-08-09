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
<body>
<%
       String id=request.getParameter("dingdan.ID");
       String sql="delete from dingdan where ID="+id;
		int n=stmt.executeUpdate(sql);  		
		response.sendRedirect("chengong.jsp");

%>
</body>
</html>