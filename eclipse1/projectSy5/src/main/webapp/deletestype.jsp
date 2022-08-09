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
       String prostype=request.getParameter("type");
try{
       String sql="delete from prostype where protype='"+prostype+"'";
        //out.print(pname);
		int n=stmt.executeUpdate(sql); }catch(Exception e){
			out.println("<script>alert('删除失败，有该类别商品')</script>");
		}
response.setHeader("Refresh","1;stype.jsp");
%>
</body>
</html>