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
       String id=request.getParameter("merberid");
       String sql="delete from merbvip where merberid="+id;
		int n=stmt.executeUpdate(sql);  		
		response.sendRedirect("Merbervip.jsp");

%>
</body>
</html>