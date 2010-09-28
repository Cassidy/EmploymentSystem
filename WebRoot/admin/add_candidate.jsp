<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html" %>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>通过 JavaBeans 访问数据库</title>
    
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<!--
		<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>

  <body>
  <%
      Object obj = session.getAttribute("privilege");
      if(obj.equals("3"))
      { 
  %>
	<center>
	  <form action="candidate_servlet" method="post">
	  用户：<input type="text" name="username" /><br />
	  密码：<input type="text" name="password" /><br />
	  性别：<input type="text" name="sex" /><br />
	  电话：<input type="text" name="tel" /><br />
	  邮箱：<input type="text" name="email" /><br />
	  简介：<input type="text" name="intro" /><br />
	  <input type="submit" name="find" value="确定" />
	  <input type="reset" name="reset" value="重置" />
	  <br /><br />
	  </form>
	</center>
	<%
       }
  	%>
  </body>
</html>
