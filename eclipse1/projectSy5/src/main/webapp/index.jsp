————<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@include file="linksql.jsp" %>
    <%@page import="java.util.*" %>
<%@ page import="java.sql.*, javax.sql.*" %> 
<%@ page import="java.util.*"%> 
<%@ page import="java.math.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="0" width="100%" bgcolor="#98AFC7">
<tr bgcolor="#C0C0C0" >
<td height="30" width="70">
<%

if(session.getAttribute("n")==null){%>
	<hr><a href="login.jsp">登录</a>
<% }else{
	Statement stmt2=con.createStatement();
	String isvip="SELECT * FROM merbvip where merberid="+session.getAttribute("n");
	ResultSet rs3;
	rs3=stmt2.executeQuery(isvip);
	if(rs3.next()){
	String s=rs3.getString("vip");
	int m=java.lang.Integer.parseInt(s);
	if(m==1){
		 s="vip :";	
	}
	out.print(s);
	}
	rs3.close();
	stmt2.close();
	out.print("用户ID：");%>
	<%=session.getAttribute("n") %>
<% }%>
</td>
<td bgcolor="#C0C0C0" width="70" >
<a href="useAdd.jsp">注册</a>
</td>
<td width="290"></td> 
<td width="290" align="center">
<form>
	<input type="text" name="queryStr">
	<input type="submit" value="查询"> 
</form>
</td> <td width="290"></td> 
<td bgcolor="#C0C0C0"  width="80">
<a href="gouwuche.jsp">我的购物车</a>
<td  width="80">
<a href="User.jsp">我的设置
</td>
</tr>
<tr bgcolor="#BCC6CC">
<td colspan=2 valign=top ><table width=100% ><tr><td align="center">
<font size=4 color="#5A2C7E">类别</font></td></tr>
<% 
int count1=3;
String sql="SELECT* FROM prostype";
ResultSet rs2=stmt.executeQuery(sql);
while(rs2.next()){
	%>
	<tr  onMouseOver="this.bgColor='#98AFC7'" onMouseOut="this.bgColor='#C0C0C0'"><td height=65><a href="index.jsp?aname=<%=new String(rs2.getString("protype"))%>"><font size="3">
	<%=new String(rs2.getString("protype")) %></font></a></td></tr><% 
}%></table></td><td valign="top"  colspan=5 color="#4D98D7"><table width=90% height="90%" ><tr>
<% 
int intPageSize; //一页显示的记录数
int intRowCount; //记录总数
int intPageCount; //总页数
int intPage; //待显示页码
String strPage;
int i;
intPageSize = 6; //设置一页显示的记录数
strPage = request.getParameter("page");  //取得待显示页码
if(strPage==null){
    //表明在QueryString中没有page这一个参数，此时显示第一页数据
    intPage = 1;
} else{
    //将字符串转换成整型
    intPage = java.lang.Integer.parseInt(strPage);
    if(intPage<1) intPage = 1;
}
String queryStr=request.getParameter("queryStr");
request.setCharacterEncoding("utf-8");
int count=3;
String aname=request.getParameter("aname");
String query="";
if(aname==null)
 query="SELECT* FROM productsall,project WHERE productsall.proname=project.proname";
else
 query="SELECT* FROM productsall,project WHERE productsall.proname=project.proname and project.protype='"+aname+"'";
if(queryStr!=null)
    query="SELECT* FROM productsall,project WHERE productsall.proname=project.proname and project.proname LIKE '%"+queryStr+"%'";
//else
	 //query="SELECT* FROM productsall,project WHERE productsall.proname=project.proname";*/
System.out.println(query);
ResultSet rs=stmt.executeQuery(query);
rs.last(); //光标指向查询结果集中最后一条记录
intRowCount = rs.getRow();  //获取记录总数
intPageCount = (intRowCount+intPageSize-1) / intPageSize; //记算总页数
if(intPage>intPageCount)
    intPage = intPageCount;//调整待显示的页码
if(intPageCount>0){
    rs.absolute((intPage-1) * intPageSize + 1); //将记录指针定位到待显示页的第一条记录上
    //显示数据
    i = 0;
while(i<intPageSize && !rs.isAfterLast()){
	count++;
	%>
	<td width="33%">
	<table bgcolor="#C0C0C0" onMouseOver="this.bgColor='#98AFC7'" onMouseOut="this.bgColor='#C0C0C0'">
	<tr onMouseOver="this.bgColor='#98AFC7'" onMouseOut="this.bgColor='#C0C0C0'" height="220">
	<td colspan="2" align="center" width="100%"><img src="image/<%=rs.getString("project.picture")%>" height="200" width="290"></td>
	<tr>
	<td><font color="red" size="2" >产品名称</font><font size="2" ><%=new String(rs.getString("project.proname")) %></font></td>
	<td><font color="red" size="2" >商品店名</font><font size="2" ><%=new String(rs.getString("properson")) %></font></td>
	</tr>
	<tr><td><font color="red" size="2" >种类:</font><font size="2" ><%=new String(rs.getString("protype")) %></font></td>
    <td><font color="red" size="2" >上新时间：</font><font size="2" ><%=new String(rs.getString("protime")) %></font></td>
    </tr>
	<tr><td><font color="red" size="2" >单价：</font><font size="2" ><%=new String(rs.getString("proprice")) %></font></td>
    <td><font color="red" size="2" >月销数量：</font><font size="2" ><%=new String(rs.getString("prosallnum")) %></font></td>
    </tr>
	<tr><td><font size="2" ><a href="goumai.jsp?project.proname=<%=rs.getString("project.proname")%>">购买</a></font></td>
    <td><font size="2" ><a href="giaru.jsp?project.proname=<%=rs.getString("project.proname")%>">加入购物车</a></font></td>
    </tr>
    </table>
    </td>
    <%
    if(count%3==0){
    	out.print("<script>document.write('<tr>')</script>");
	}
    rs.next();
    i++;
}
}
rs.close();
rs2.close();
stmt.close();
con.close();
%>
</td>
</tr>
</table>
</td></tr></table>

 <form><div align="center">
            <a href="index.jsp?page=1">第一页</a>
                <a href="index.jsp?page=<%=intPage-1%>">上一页</a>
                第<%=intPage%>页 共<%=intPageCount%>页   
                <!-- <input type="text" name="page3" size="2" onkeypress="if(event.keyCode==13) submit();"> -->
                <select name="page" onchange="javascript:submit();">
                	<%int j;
                	for(j=1;j<=intPageCount;j++) {%>
                	<option value="<%=j%>" <%if(intPage==j) out.print("selected"); %>><%=j%></option>
                	<%} %>
                </select>
                <a href=index.jsp?page=<%=intPage+1%>>下一页</a>
             <a href="index.jsp?page=<%=intPageCount%>">最后一页</a>
             </form> </div>
</body>
</html>