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
       String pname=request.getParameter("pname");
       String sql="delete from project where proname='"+pname+"'";
        //out.print(pname);
		int n=stmt.executeUpdate(sql);
		response.sendRedirect("canping.jsp");
%>
</body>
</html>