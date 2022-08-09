<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/store","root","123456");
Statement stmt=con.createStatement();
Statement stmt1=con.createStatement();
%>
<%
request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String merbername=request.getParameter("merbername");
String pws=request.getParameter("pws");
String pws2=request.getParameter("pws2");
String phonenum=request.getParameter("phonenum");
String zipcode=request.getParameter("zipcode");
String adress=request.getParameter("adress");
String email=request.getParameter("email");
String vip=request.getParameter("vip");
int a=0;
int b;  
if(vip=="no"){
   b=0;
}else{
	b=1;
}
if(pws.equals(pws2)){
	
}else{
	out.println("<script>alert('输入密码不一致，重新输入')</script>");
	response.setHeader("Refresh","0.5;useAdd.jsp");
}
String sql="select * from merbvip where merberid="+id;
ResultSet rs=stmt.executeQuery(sql);
if(rs.next()){
	out.println("<script>alert('该账号已存在，重新输入')</script>");
	response.setHeader("Refresh","1;useAdd.jsp");
	
}else{
	sql="insert into merbvip values('"
			 +id+"','"+merbername+"',"+a+",'"+pws+"','"+phonenum+"','"+zipcode+"','"+adress+"','"+email+"',"+b+")";
	int t=stmt1.executeUpdate(sql);
	if(t>0){
		out.println("创建成功");
		%> 
		<form action="login.jsp" method="post">
		<input type="submit" value="登录">
		</form>
		<form action="index.jsp" method="post">
		<input type="submit" value="返回">
		</form>
		<% 
	}
}
rs.close();
stmt.close();
con.close();
%>
</body>
</html>