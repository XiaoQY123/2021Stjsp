<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="linksql.jsp" %>
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
request.setCharacterEncoding("utf-8");
String name=request.getParameter("name");
String type=request.getParameter("type");
String price=request.getParameter("price");
String dian=request.getParameter("dian");
String number=request.getParameter("number");
String time="00:00:00";
String picture="null";
int a=0;
int num=99;
if(name!=null){
String sql="select * from project where proname='"+name+"'";
ResultSet rs=stmt.executeQuery(sql);
if(rs.next()){
	out.println("<script>alert('该产品已存在，重新输入')</script>");
	response.setHeader("Refresh","0.1;Addcanp.jsp");
	
}else{
	num--;
	try{
	sql="insert into prostype(protype)values('"+type+"')";
	int t2=stmt.executeUpdate(sql);
	}catch(Exception e){}
		sql="insert into project values("+num+",'"
				 +name+"','"+type+"',"+price+","+number+",'"+picture+"')";
		int t=stmt.executeUpdate(sql);
		if(t>0){
			sql="insert into productsall values('"+
		name+"','"+dian+"','"+time+"',"+a+")";
			int t3=stmt.executeUpdate(sql);
			out.println("添加成功");
			if(t3>0){
			%> 
			<form action="load.jsp" method="post" id="post1" name="post1" enctype="multipart/form-data">
产品图片：<br><font color="red">*</font><input type="file" name="img"><br>
             <input type="hidden" name="pname" value=<%=name %>>
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
	  <form action="Merbervip.jsp" method="post">
			<input type="submit" value="返回">
			</form>
			<% 
			}
	}
}
rs.close();
stmt.close();
con.close();
}
%>

</body>
</html>