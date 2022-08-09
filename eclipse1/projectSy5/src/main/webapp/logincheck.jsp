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
String merbstyle=request.getParameter("merber");
String sql="select * from merbvip where merberid="+merberid+" and pwd='"+merberpws+"'";
ResultSet rs=stmt.executeQuery(sql);
if(rs.next()){
	session.setAttribute("n",merberid); 
	int count=java.lang.Integer.parseInt(rs.getString("logontimes"))+1;
	sql="update merbvip set logontimes="+count+" where merberid="+merberid;
	int n=stmt.executeUpdate(sql);
	System.out.println(sql);
	out.println("<script>alert('登录成功')</script>");
	if(merbstyle!=null){
	response.setHeader("Refresh","1;index.jsp");
	}else{
		response.setHeader("Refresh","1;Merbervip.jsp");
	}
}else{
	out.println("<script>alert('登录失败，重新输入')</script>");
	response.setHeader("Refresh","1;login.jsp");
	
}

	
%>
</body>
</html>