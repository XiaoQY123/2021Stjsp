<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="linksql.jsp" %>
    <%@page import="java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%      request.setCharacterEncoding("utf-8");
		String name = request.getParameter("project.proname");
		String sql = "select * from project where proname='"+name+"'";
		ResultSet rs= stmt.executeQuery(sql);
		if(rs.next()){
	%>
<form action="changecanpCheck.jsp" method="post">
产品名称:<input type="hidden" name="name" readonly value="<%=rs.getString("proname")%>"><%=rs.getString("proname")%><br> 
产品类别:<input type="text" name="type" value="<%=rs.getString("protype")%>"><br>
产品价格:<input type="text" name="price" value="<%=rs.getString("proprice")%>"><br>
产品库存：<input type="text" name="num" value="<%=rs.getString("pronum")%>"><br>
产品图片<br><img src="image/<%=rs.getString("project.picture")%>" height="50" width="70"><br>
<input type="submit" value="修改"><br>		
</form>
			<form action="load.jsp" method="post" id="post1" name="post1" enctype="multipart/form-data">
产品图片：<br><font color="red">*</font><input type="file" name="img"><br>
            <input type="hidden" name="pname" readonly value="<%=rs.getString("proname")%>">
           <input type="button" id="but12" value="图片修改"  onclick="submith();"></form>
<script type="text/javascript">
function submith(){
	//alert(document.getElementById("post2").submit().value);
	//alert(document.getElementById("po").value);
   var action="load.jsp";
   action+="?pname="+document.post1.pname.value;
   document.post1.action=action;
   document.post1.submit();
  // alert("提交成功！");
}
</script>  


<%} %>
</body>