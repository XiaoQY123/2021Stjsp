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
<hr>购买页面
<table border="1" bgcolor="#ccceee" align="center">
<% 
String num=request.getParameter("num");
if(num==null||num==""){
	num="1";
}
int num1=Integer.parseInt(num);
String proname=request.getParameter("project.proname");
String query="SELECT* FROM project,productsall where productsall.proname='"
+proname+"' and project.proname='"+proname+"'";
ResultSet rs=stmt.executeQuery(query);
if(rs.next()){
%>
<tr>
<td width="100" align="center">
<img src="image/<%=rs.getString("project.picture")%>" height="90" width="100">
</td>
</tr>
<tr>
<td>商品名称<%=new String(rs.getString("proname"))%>
<% String pronamess=rs.getString("proname");%>
</td>
</tr>
<tr>
<td>
<form form action="chengong.jsp" method="post">
购买数量：
<input type="text"  id="b" value="<%=num1%>"><br>
需要支付：
<input type="text" id="c" onClick="jisuan()" name="toall"><br>
<script type="text/javascript">
	function jisuan(){
			var num1=document.getElementById("b").value;
			document.getElementById("c").value=num1*<%=rs.getString("project.proprice")%>;
		}
	</script>
  </td>
</tr>
<tr>
<%
String sql="SELECT* FROM merbvip where merberid="+session.getAttribute("n");
ResultSet rs2=stmt.executeQuery(sql); 
if(rs2.next()){%>
<td> 收货地址:<input name="dizhi" type="text" value="<%=new String(rs2.getString("adress"))%>"></td>
</tr>
<tr>
<td>收件人姓名:<input name="xingming" type="text" value="<%=new String(rs2.getString("merbname"))%>"></td>
</tr>
<tr>
<td>收件人联系方式:<input name="haoma" type="text" value="<%=new String(rs2.getString("phonenum"))%>"></td>
<tr>
<tr>
<td>留言:<input name="liuyan" type="textarea" height="300"></td>
</tr>
<tr>
<td>
<input type="hidden" name="pronamess" value="<%=pronamess%>">
<input type="submit" value="确认">
<form action="canping.jsp" method="post" >
<input type="submit" value="返回">
 </form>
 </td>
 </tr>
<%}
else{
	out.print("请先登录");
	response.setHeader("Refresh","1;index.jsp");
}
}
rs.close();
stmt.close();
con.close();
%>
</table>

</body>
</html>