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
if(session.getAttribute("n")==null){%>
	<hr><a href="login.jsp">登录</a><br>
<% }else{
	out.print("用户ID：");%>
	<%=session.getAttribute("n") %> 
<% }%>

<script type="text/javascript">
	function del(merberid){
		var d=confirm("是否删除？注意：删除后无法恢复！");
		if(d==true) location="delete.jsp?merberid="+merberid;
	}
	function delAll(){
		var d=confirm("是否全部删除？注意：删除后无法恢复！");
		if(d==true) location="delAllb.jsp";
	}
</script>
<a href="tuichu.jsp">退出登录</a>
<form>
	<input type="text" name="queryStr">
	<input type="submit" value="查询"> 
</form>
<table border="1" bgcolor="#ccceee" align="center">
<tr>
<th align="center">会员编号</th>
<th align="center">会员姓名</th>
<th align="center">会员登录时间</th>
<th align="center">会员密码</th>
<th align="center">会员号码</th>
<th align="center">会员邮编</th>
<th align="center">会员地址</th>
<th align="center">会员邮箱</th>
<th align="center">删除</th>
<th align="center">修改</th>
</tr>
<%
String queryStr=request.getParameter("queryStr");
String query="";
if(queryStr==null)
  query="SELECT* FROM merbvip";
else
query="SELECT* FROM merbvip WHERE merbname LIKE '%"+queryStr+"%'";
System.out.println(query);
ResultSet rs=stmt.executeQuery(query);
while(rs.next()){
	%>
	<tr>
	<td><%=new String(rs.getString("merberid")) %>
	</td>
	<td><%=new String(rs.getString("merbname")) %>
	</td>
	<td><%=new String(rs.getString("logontimes")) %>
	</td>
	<td><%=new String(rs.getString("pwd")) %>
	</td>
	<td><%=new String(rs.getString("phonenum")) %>
	</td>
	<td><%=new String(rs.getString("zipcode")) %>
	</td>
	<td><%=new String(rs.getString("adress")) %>
	</td>
	<td><%=new String(rs.getString("email")) %>
	</td>
	<td><a href="javascript:del(<%=rs.getString("merberid")%>);">删除</a></td>
    <td><a href="xiogai.jsp?merberid=<%=rs.getString("merberid")%>">修改</a></td>
	</tr>
	<%
}
rs.close();
stmt.close();
con.close();
%>
</table>
<a href="javascript:delAll();">删除全部</a>
<a href="canping.jsp">查看商品数据</a>
<a href="stype.jsp">查看商品类别</a>
</body>
</html>