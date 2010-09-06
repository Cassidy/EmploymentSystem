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
    
    <title>删除记录</title>
    
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
  <jsp:useBean id="recru" scope="session" class="com.mmc.bean.Recruiter" />
  <%
	String username = request.getParameter("username");
	String sql = "DELETE FROM recruiters WHERE Zuser='"+username+"'";
	recru.updateRecruiter(sql); 
	response.sendRedirect("recruiter.jsp");
  %>
  <%
       }
  %>
  </body>
</html>
