<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<form action="test2.jsp" method="post" id="post1" name="post1" enctype="multipart/form-data">
产品图片：<br><font color="red">*</font><input type="file" name="img"><br>
             <input type="hidden" name="pname" value="111">
           <input type="button" id="but12" value="图片修改"  onclick="submith();"></form>
<script type="text/javascript">
function submith(){
	//alert(document.getElementById("post2").submit().value);
	//alert(document.getElementById("po").value);
   
   var action="test2.jsp";
   action+="?pname="+document.post1.pname.value;
   document.post1.action=action;
   document.post1.submit();
   alert("提交成功！");
}
</script>         
</body>
</html>