<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
     <%@ include file="linksql.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String type=request.getParameter("type");
String sql="insert into prostype(protype)values('"+type+"')";
int t2=stmt.executeUpdate(sql);
if(t2>0){
	out.println("添加成功");
}else{
	out.print("添加失败");
}
response.setHeader("Refresh","1;stype.jsp");
%>
</body>
</html>