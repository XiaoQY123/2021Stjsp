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
        request.setCharacterEncoding("utf-8");
		String id = request.getParameter("merberid");
		String sql="";
		if(id!=null){
		sql = "select * from merbvip where merberid="+id;
		}else{
			sql= "select * from merbvip where merberid="+session.getAttribute("n");
		}
		ResultSet rs= stmt.executeQuery(sql);
		if(rs.next()){
	%>
<form action="xiogaicheck.jsp" method="post">
ID：<input type="hidden" name="merberid" readonly value="<%=rs.getString("merberid")%>"><%=rs.getString("merberid")%><br> 
密码:<font color="red">*</font><input type="password" name="pws" value="<%=rs.getString("pwd")%>"><br>
姓名：<font color="red">*</font><input type="text" name="merbername" value="<%=rs.getString("merbname")%>"><br>
电话号码：<input type="text" name="phonenum" value="<%=rs.getString("phonenum")%>"><br>
邮政编码：<input type="text" name="zipcode" value="<%=rs.getString("zipcode")%>"><br>
地址：<input type="text" name="adress" value="<%=rs.getString("adress")%>"><br>
邮箱：<input type="text" name="email" value="<%=rs.getString("email")%>"><br>
<input type="submit" value="修改"><br>
<%} %>
</body>
</html>