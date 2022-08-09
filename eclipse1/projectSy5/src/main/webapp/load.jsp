<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="linksql.jsp" %>
    <%@page import="java.util.*" %>
    <%@page import="java.sql.*" %>
    <%@ page import="com.jspsmart.upload.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String pname=request.getParameter("pname");
System.out.print(pname);
SmartUpload su = new SmartUpload();
//上传初始化
su.initialize(pageContext);
//设置上传限制
//1.限制每个上传文件的最大长度为10MB
su.setMaxFileSize(10 * 1024 * 1024);
//2.限制总上传文件的长度
su.setTotalMaxFileSize(30 * 1024 * 1024);
//3.设定允许上传的文件
su.setAllowedFilesList("txt,jpg,png");
//4.设定禁止上传的文件
su.setDeniedFilesList("exe,bat,jsp,htm,html,,");
//上传文件
su.upload();
String filename="null";
//图片上传路径
String uploadRelPath="image";//上传的相对路径
String uploadPath =request.getRealPath("/")+uploadRelPath;//上传绝对路径
System.out.println(uploadPath+"----------------");
//文件夹不存在就自动创建：
if(!new java.io.File(uploadPath).isDirectory())
	new java.io.File(uploadPath).mkdirs();
//out.println(uploadPath);

//将上传的文件全部保存到指定目录
int count = su.save(uploadRelPath);
//out.println(count + "个文件上传成功！<br/>");

//逐一提取上传文件信息，同时可保存文件
for(int i=0;i<su.getFiles().getCount();i++){
	File file = su.getFiles().getFile(i);
	//若文件不存在则继续
	if(file.isMissing()){
		continue;
	}
	
filename=file.getFilePathName();
}
//String pname="口红";
request.setCharacterEncoding("utf-8");
String sql="update project set picture='"+filename+"' where proname='"+pname+"'";
System.out.println(sql);
int n=stmt.executeUpdate(sql);
if(n>0) {
	out.print("修改数据成功！");
}else{
	out.print("修改数据失败！");
}
response.setHeader("Refresh","0.1;changecanp.jsp");
%>
</body>
</html>