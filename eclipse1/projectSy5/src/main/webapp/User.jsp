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
if(session.getAttribute("n")==null){
	out.println("<script>alert('请先登录')</script>");
	response.setHeader("Refresh","0.1;login.jsp");
}else{
	
    request.setCharacterEncoding("utf-8");
	String sql = "select * from merbvip where merberid=" + session.getAttribute("n");
	ResultSet rs=stmt.executeQuery(sql);
	if(rs.next()){
%>
<table border="0" width="80%" bgcolor="#98AFC7" height="800" align="center">
<form action="xiogaicheck.jsp" method="post" >
<tr height="20"><td><%
if(session.getAttribute("n")==null){%>
	<hr><a href="login.jsp">登录</a>
<% }else{
	out.print("用户ID：");%>
	<%=session.getAttribute("n") %>
<% }%>
</td>
<td>
<a href="tuichu.jsp">退出登录</a>
</td>
<td><a href="chengong.jsp">查看订单信息</a>
</td>
</tr>
<tr>
<td width="30%" align="center">
</td>
<td >
<br> 
我的个人信息:<br>
<input type="hidden" name="pws" value="<%=rs.getString("pwd")%>"><br>
登录次数：
<input type="hidden" name="times" readonly value="<%=rs.getString("logontimes")%>"><%=rs.getString("logontimes")%><br>
姓名：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <input type="text" name="merbername" value="<%=rs.getString("merbname")%>"><br>
电话号码：<input type="text" name="phonenum" value="<%=rs.getString("phonenum")%>"><br>
邮政编码：<input type="text" name="zipcode" value="<%=rs.getString("zipcode")%>"><br>
地址：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
 <input type="text" name="adress" value="<%=rs.getString("adress")%>"><br>
邮箱：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  <input type="text" name="email" value="<%=rs.getString("email")%>"><br>
密码:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<input type="password" name="pws" value="<%=rs.getString("pwd")%>"><br>
<input type="submit" value="修改"><br>
</form>
</td>
<td width="30%">
</td>
</tr>
<tr>
<td>
</td>
</tr>
</table>
<%} 
}%>

</body>
</html>