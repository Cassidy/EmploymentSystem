<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台处理</title>
    

  </head>
  
  <body>
  <%
  	
      Object obj = session.getAttribute("privilege");
      Object obj2 = session.getAttribute("user");
      if(obj.equals("3"))
      { 
  %>
  欢迎 管理员<%=obj2%> 登录！

    <%
       }
  	%>
  </body>
</html>
