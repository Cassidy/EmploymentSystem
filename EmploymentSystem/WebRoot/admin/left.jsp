<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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
	<a href="./admin/candidate.jsp" target="right">应聘者管理</a><br />
	<a href="./admin/recruiter.jsp" target="right">招聘者管理</a><br />
	<a href="./admin/recruiter.jsp" target="right">招聘信息管理</a><br />
	<a href="./admin/news.jsp" target="right">新闻管理</a><br />
	<a href="index.jsp" target="_parent">返回主页</a><br/>
  	<a href="logout.jsp" target="_parent">退出</a>
  	<%
       }
  	%>
  </body>
</html>
