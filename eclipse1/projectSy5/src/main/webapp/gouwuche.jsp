<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.util.*" %>
    <%@include file="linksql.jsp" %>
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
	if(d==true) location="deleteguowuche.jsp?pname="+name;
}
	function delAll(){
		var d=confirm("是否全部删除？注意：删除后无法恢复！");
		if(d==true) location="deleteAllc.jsp";
	}
</script>
<%!double tll[]=new double[11];
String pronames[]=new String[11];
%>

<%

int count=0;
if(session.getAttribute("n")==null){%>
	<hr><a href="login.jsp">登录</a><br>
<% }else{
	out.println("用户ID：");%>
	<%=session.getAttribute("n") %>
<% }%>
<%
int intPageSize; //一页显示的记录数
int intRowCount; //记录总数
int intPageCount=2; //总页数
int intPage; //待显示页码
String strPage;
int i;
intPageSize = 3; //设置一页显示的记录数
strPage = request.getParameter("page");  //取得待显示页码
if(strPage==null){
    //表明在QueryString中没有page这一个参数，此时显示第一页数据
    intPage = 1;
} else{
    //将字符串转换成整型
    intPage = java.lang.Integer.parseInt(strPage);
    if(intPage<1) intPage = 1;
}
if(session.getAttribute("n")==null){
	out.println("<script>alert('请先登录')</script>");
	response.setHeader("Refresh","0.1;login.jsp");
}else{
	%>
	<table width="80%" align="center" bgcolor="	#B0C4DE" ><tr><td>
	<table border="1" bgcolor="#ccceee" align="center" >
	<%
	String sql="SELECT * FROM gouwuche,project WHERE gouwuche.proname=project.proname AND gouwuche.merberid="+
	session.getAttribute("n");
	ResultSet rs=stmt.executeQuery(sql);
	rs.last(); //光标指向查询结果集中最后一条记录
	intRowCount = rs.getRow();  //获取记录总数
	intPageCount = (intRowCount+intPageSize-1) / intPageSize; //记算总页数
	if(intPage>intPageCount)
	    intPage = intPageCount;//调整待显示的页码
	if(intPageCount>0){
	    rs.absolute((intPage-1) * intPageSize + 1); //将记录指针定位到待显示页的第一条记录上
	    //显示数据
	    i = 0;
		String sql3="";
		Statement stmt2=con.createStatement();
		ResultSet rs2;
		double zhifu;
		String sql2="";
		int panduan=0;
	    String numchar1="";
		int num;
	while(i<intPageSize && !rs.isAfterLast()){
		num=1;
		sql3="select * from gouwuche WHERE gouwuche.proname='"+rs.getString("project.proname")+"'AND gouwuche.merberid="+
				session.getAttribute("n");
		System.out.print(sql3);
	    rs2=stmt2.executeQuery(sql3);
	    if(rs2.next()){
	    num=java.lang.Integer.parseInt(rs2.getString("num"));
	    System.out.print("这儿是"+num);
	    }
		String numchar=request.getParameter("num+"+(count+1));
		if(numchar==null){  System.out.println(numchar);}
		else{
		    num=java.lang.Integer.parseInt(numchar);
		   System.out.println(num);
		   }
	count++;
	
    sql2="update gouwuche set num="+num+" WHERE gouwuche.proname='"+rs.getString("project.proname")+"' AND gouwuche.merberid="+
			session.getAttribute("n"); 
	 panduan=stmt2.executeUpdate(sql2); 
	if(panduan>0){
		System.out.println("插入成功"+rs.getString("project.proname"));
	}
	rs2.close();
	%>
	<tr>
	<td width="100">
	<img src="image/<%=rs.getString("project.picture")%>" height="90" width="100">
	</td>
	<td><table><tr><td>
	<font size="2" >产品名称:<%=new String(rs.getString("project.proname"))%></font>
	</td>
	</tr>
	<tr><td> 
	<font size="2" >产品单价:<%=new String(rs.getString("project.proprice"))%></font>
	</td></tr>
	<tr><td> 
	<font size="2" >商品类别:<%=new String(rs.getString("project.protype"))%></font>
	</td></tr>
	 </table>
	</td>
	</tr>
	<tr>
	<td colspan="2">
	<form>
	购买数量：
	<input type="text" name="num+<%=count%>" value="<%=num%>"><br>
	<%
	zhifu=num*java.lang.Integer.parseInt(rs.getString("project.proprice"));
	%>
	需要支付：
	<input type="text" name="jeguo" value="<%=zhifu%>" ><br>
	<input type="submit" value="提交">
	<input type="checkbox" name="check+<%=count%>">
	<% if(request.getParameter("check+"+count)!=null){
		tll[count-1]=zhifu;
		pronames[count-1]=rs.getString("project.proname");
	}
	%>
	</form>
	</td>
	</tr>
	<tr>
	<td colspan="2">
	<a href="goumai.jsp?project.proname=<%=rs.getString("project.proname")%>&num=<%=num%>">购买</a>
	<a href="javascript:del('<%=rs.getString("project.proname")%>');">删除</a></td>
	</tr>
	<%
	i++;
	rs.next();
	} 
	stmt2.close();
}   
rs.close();	
%>
</table>
</td>
<td>
<%
if(request.getParameter("quxiao")!=null) 
	for(int n=0; n<10; n++){
	  tll[n] = 0.0;   
	  pronames[n]=" ";
	};
String pronamess=" ";
double toall=0;
for(int l=0;l<10;l++){
	toall=tll[l]+toall;
}
for(int m=0;pronames[m]!=" ";m++){
	pronamess=pronamess+pronames[m]+",";
}
%>
<form action="chengong.jsp" method="post">
商品名称:&nbsp&nbsp<input type="text" name="pronamess" value="<%=pronamess%>"><br>
总计:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="toall" value="<%=toall%>"><br>
<%
String sql6="SELECT* FROM merbvip where merberid="+session.getAttribute("n");
ResultSet rs2=stmt.executeQuery(sql6); 
if(rs2.next()){%>
收货地址:&nbsp&nbsp<input name="dizhi" type="text" value="<%=new String(rs2.getString("adress"))%>"><br>
收件人姓名:<input name="xingming" type="text" value="<%=new String(rs2.getString("merbname"))%>"><br>
联系方式:&nbsp&nbsp<input name="haoma" type="text" value="<%=new String(rs2.getString("phonenum"))%>"><br>
留言:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<textarea name="liuyan" ></textarea><br>
<input type="submit" value="确认" >
</form>
<form ation="gouwuche.jsp" method="post">
<input type="submit" name="quxiao" value="取消">
</form>
</td>
</tr>
</table>

<%} 
stmt.close();
con.close();%>
<form action="index.jsp" method="post" >
<input type="submit" value="返回">
 </form>
<a href="javascript:delAll();">删除全部</a>
<hr>
<form><div align="center">
            <a href="gouwuche.jsp?page=1">第一页</a>
                <a href="gouwuche.jsp?page=<%=intPage-1%>">上一页</a>
                第<%=intPage%>页 共<%=intPageCount%>页   
                <!-- <input type="text" name="page3" size="2" onkeypress="if(event.keyCode==13) submit();"> -->
                <select name="page" onchange="javascript:submit();">
                	<%int j;
                	for(j=1;j<=intPageCount;j++) {%>
                	<option value="<%=j%>" <%if(intPage==j) out.print("selected"); %>><%=j%></option>
                	<%} %>
                </select>
                <a href="gouwuche.jsp?page=<%=intPage+1%>">下一页</a>
             <a href="gouwuche.jsp?page=<%=intPageCount%>">最后一页</a>
             </form> </div>
<% 
}
%>
</body>
</html>