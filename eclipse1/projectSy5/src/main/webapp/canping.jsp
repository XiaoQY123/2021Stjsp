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
if(session.getAttribute("n")==null){%>
	<hr><a href="login.jsp">登录</a><br>
<% }else{
	out.print("用户ID：");%>
	<%=session.getAttribute("n") %>
<% }%>
<br>
<script type="text/javascript">
	function del(name){
		var d=confirm("是否删除？注意：删除后无法恢复！");
		if(d==true) location="deletecanp.jsp?pname="+name;
	}
	function delAll(){
		var d=confirm("是否全部删除？注意：删除后无法恢复！");
		if(d==true) location="deleteAll.jsp";
	}
</script>
<a href="tuichu.jsp">退出登录</a>
<form>
	<input type="text" name="queryStr">
	<input type="submit" value="查询"> 
</form>
<table border="1" bgcolor="#ccceee" align="center">
<tr>
<th align="center">商品名称</th>
<th align="center">商品商家</th>
<th align="center">销售时间</th>
<th align="center">销售数量</th>
<th align="center">单价</th>
<th align="center">类型</th>
<th align="center">修改商品</th>
<th align="center">删除商品</th>
</tr>
<% 
int intPageSize; //一页显示的记录数
int intRowCount; //记录总数
int intPageCount; //总页数
int intPage; //待显示页码
String strPage;
int i;
intPageSize = 10; //设置一页显示的记录数
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
String query="";
request.setCharacterEncoding("utf-8");
if(queryStr==null)
	  query="SELECT* FROM productsall,project WHERE productsall.proname=project.proname";
else
      query="SELECT* FROM productsall,project WHERE productsall.proname=project.proname and project.proname LIKE '%"+queryStr+"%'";
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
	%>
	<tr>
	<td><%=new String(rs.getString("project.proname")) %>
	</td>
	<td><%=new String(rs.getString("properson")) %>
	</td>
	<td><%=new String(rs.getString("protime")) %>
	</td>
	<td><%=new String(rs.getString("prosallnum")) %>
	<td><%=new String(rs.getString("proprice")) %>
	</td>
	<td><%=new String(rs.getString("protype").getBytes("utf-8")) %>
    <td><a href="changecanp.jsp?project.proname=<%=rs.getString("project.proname")%>">修改信息</a></td>
    <td><a href="javascript:del('<%=rs.getString("project.proname")%>');">删除</a></td>
	</tr>
	<%
	rs.next();
	i++;
     }
}
rs.close();
stmt.close();
con.close();
%>
</table>
<a href="javascript:delAll();">删除全部</a>
<a href="Addcanp.jsp">增添产品</a>
<hr>         <form><div align="center">
            <a href="canping.jsp?page=1">第一页</a>
                <a href="canping.jsp?page=<%=intPage-1%>">上一页</a>
                第<%=intPage%>页 共<%=intPageCount%>页   
                <!-- <input type="text" name="page3" size="2" onkeypress="if(event.keyCode==13) submit();"> -->
                <select name="page" onchange="javascript:submit();">
                	<%int j;
                	for(j=1;j<=intPageCount;j++) {%>
                	<option value="<%=j%>" <%if(intPage==j) out.print("selected"); %>><%=j%></option>
                	<%} %>
                </select>
                <a href="canping.jsp?page=<%=intPage+1%>">下一页</a>
             <a href="canping.jsp?page=<%=intPageCount%>">最后一页</a>
             </form> </div>
   
</body>
</html>