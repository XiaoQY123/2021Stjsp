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
       String sql="delete from gouwuche where proname='"+pname+"'and merberid="+session.getAttribute("n");
        out.print(sql);
		int n=stmt.executeUpdate(sql); 
		response.sendRedirect("gouwuche.jsp");
%>

</body>
</html>