<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.util.*" %>
     <%@ include file="linksql.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function del(id){
		var d=confirm("是否删除？注意：删除后无法恢复！");
		if(d==true) location="deletedingdan.jsp?dingdan.ID="+id;
	}
	function delAll(){
		var d=confirm("是否全部删除？注意：删除后无法恢复！");
		if(d==true) location="delAlla.jsp";
	}
	</script>
</head>
<body>

<table border="1" bgcolor="#ccceee" align="center">
<caption>订单</caption>
<th align="center">订单编号</th>
<th align="center">客户名称</th>
<th align="center">商品名称</th>
<th align="center">订单时间</th>
<th align="center">商品总价</th>
<th align="center">收件人姓名</th>
<th align="center">收件人号码</th>
<th align="center">收件人地址</th>
<th align="center">收件人备注</th>
<th align="center">删除</th>
<%
request.setCharacterEncoding("utf-8");
String pronamess=request.getParameter("pronamess");
String toall1=request.getParameter("toall");
String haoma=request.getParameter("haoma");
String dizhi=request.getParameter("dizhi");
String xingming=request.getParameter("xingming");
String liuyan=request.getParameter("liuyan");
if(xingming==null){
	String sql7="select * from merbvip where="+session.getAttribute("n");
	%>
	<form></form>
	<input type="hidden" name="pronamess" value="<%=pronamess%>">
	<input type="submit" value="确认">
	<% 
}
double toall=0.0;
if(toall1!=null) 
	toall=Double.parseDouble (toall1);
if(pronamess!=null){
	pronamess=pronamess.replace(" ","");
	String pronames[]=pronamess.split(",");
	 for(int k=0;k<pronames.length;k++)
	System.out.println(pronames[k]);
String sql4="";
sql4="insert into dingdan set MeberID='"+session.getAttribute("n")
+"',proname='"+pronamess+"',toall="+toall+",pername='"+xingming+"',haoma='"+haoma+"',dizhi='"+dizhi+"',liuyan='"+liuyan+"'";
System.out.print(sql4);
	 int t=stmt.executeUpdate(sql4);
	 for(int k=0;k<pronames.length;k++){
	 String sql6="select * from productsall where proname='"+pronames[k]+"'";
	 System.out.print("16"+sql6);
	 ResultSet rs2=stmt.executeQuery(sql6);
	 int prosallnum=0;
	 if(rs2.next()){ prosallnum=java.lang.Integer.parseInt(rs2.getString("prosallnum"));}
	 rs2.close();
	 sql6="select * from gouwuche where proname='"+pronames[k]+"' and merberid="+session.getAttribute("n");
	 ResultSet rs1=stmt.executeQuery(sql6);
	 if(rs1.next()){
	 int count=java.lang.Integer.parseInt(rs1.getString("num"))+prosallnum;
		String sql5="update productsall set prosallnum="+count+" where proname='"+pronames[k]+"'";
		System.out.println(sql5);
		int n=stmt.executeUpdate(sql5);
		rs1.close();
	 }
 }
	
}
	 String sql="SELECT *FROM dingdan WHERE MeberID="+session.getAttribute("n");
	  System.out.print(sql);
	  ResultSet rs=stmt.executeQuery(sql);
while(rs.next()){ %>
<tr>
	<td><%=new String(rs.getString("dingdan.ID")) %>
	</td>
	<td><%=new String(rs.getString("dingdan.MeberID")) %>
	</td>
	<td><%=new String(rs.getString("dingdan.proname"))%>
	</td>
	<td><%=new String(rs.getString("dingdan.time")) %>
	<td><%=new String(rs.getString("dingdan.toall")) %>
	</td>
	<td><%=new String(rs.getString("dingdan.pername")) %>
	</td>
	<td><%=new String(rs.getString("dingdan.haoma"))%>
	</td>
	<td><%=new String(rs.getString("dingdan.dizhi")) %>
	<td><%=new String(rs.getString("dingdan.liuyan")) %>
	</td>
	<td><a href="javascript:del(<%=rs.getString("dingdan.ID")%>);">删除</a></td>
	</tr>
	<%
	}
rs.close();
stmt.close();
con.close();
	%>
</table>
<a href="javascript:delAll();">删除全部</a>
购买成功！
<form action="index.jsp">
<input type="submit" value="返回">
</form>
</body>
</html>