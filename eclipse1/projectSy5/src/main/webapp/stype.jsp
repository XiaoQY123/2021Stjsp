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
<script type="text/javascript">
	function del(name){
		var d=confirm("是否删除？注意：删除后无法恢复！");
		if(d==true) location="deletestype.jsp?type="+name;
	}
	function delAll(){
		var d=confirm("是否全部删除？注意：删除后无法恢复！");
		if(d==true) location="delAlld.jsp";
	}
</script>
<table border="1" bgcolor="#ccceee" align="center">
<tr>
<th align="center">类别名称</th>
<th align="center">删除</th>
</tr>
<%
String sql="SELECT* FROM prostype";
ResultSet rs=stmt.executeQuery(sql);
while(rs.next()){
	%>
	<tr>
	<td><%=new String(rs.getString("protype")) %>
    <td><a href="javascript:del('<%=rs.getString("protype")%>');">删除</a></td>
	</tr>
	<%
}

%>
<a href="javascript:delAll();">删除全部</a>
<a href="Addstype.jsp">添加</a>
</body>
</html>