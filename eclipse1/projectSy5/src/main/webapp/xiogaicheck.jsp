<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="linksql.jsp" %>
    <%@page import="java.util.*" %>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<script>
setTimeout("history.go(-1)",1000);
</script>
<script>
function go(){
	window.history.go(-1);
}
setTimeout("go()",1000);
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id=request.getParameter("merberid");
String merbname=request.getParameter("merbername");
String pws=request.getParameter("pws");
String phonenum=request.getParameter("phonenum");
String zipcode=request.getParameter("zipcode");
String adress=request.getParameter("adress");
String email=request.getParameter("email");
String sql="";
if(id!=null){
sql="update merbvip set merbname='" 
+merbname+"',pwd='"+pws+"',phonenum='" + phonenum +"',zipcode='"+
zipcode+"',adress='" + adress+"',email='" + email +"'where merberid="+id;
}else{
	sql="update merbvip set merbname='" 
			+merbname+"',pwd='"+pws+"',phonenum='" + phonenum +"',zipcode='"+
			zipcode+"',adress='" + adress+"',email='" + email +"'where merberid="+session.getAttribute("n");
}
System.out.print(sql);
int n=stmt.executeUpdate(sql);
if(n>0) {
	out.print("修改数据成功！");
}else{
	out.print("修改数据失败！");
}
%>
<a href="javascript:history.back(-1);">1</a>
//response.setHeader("Refresh","1;Merbervip.jsp");
%>
</body>
</html>