<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<jsp:useBean id="ConBean" scope="session" class="com.mmc.bean.DBCon"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
    SimpleDateFormat tempDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String datetime = tempDate.format(new java.util.Date());
	int Nid = 1;
	Object obj = session.getAttribute("user");
	String sql = "select Max(Nid) as id from news";
	ResultSet rs = ConBean.Query(sql);
	if(rs.next()){
	Nid = rs.getInt("id")+1;
	}else{Nid = 1;}
%>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加新闻</title>
    
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
<form action="newsservlet" method="post">
<table width="80%" border="1" align="center">
  <tr>
    <td width="17%" bgcolor="#99FFFF">新闻ID：</td>
    <td width="83%"><input name="Nid" type="text" value=<%=Nid%> readonly="readonly" /></td>
  </tr>
  <tr>
    <td bgcolor="#99FFFF">发布者：</td>
    <td><input name="Auser" type="text" value=<%=obj%> readonly="readonly" /></td>
  </tr>
  <tr>
    <td bgcolor="#99FFFF">新闻标题：</td>
    <td><input name="Ntitle" type="text" value="新闻" %></td>

  </tr>
  <tr>
    <td bgcolor="#99FFFF">发布时间：</td>
    <td><input name="Ntime" type="text" readonly="readonly" value=<%=datetime %> /></td>
  </tr>
  <tr>
    <td bgcolor="#99FFFF">发布内容：</td>
    <td><textarea name="Ncontent" rows="10">可怜可怜你输入一点内容吧！</textarea></td>
  </tr>
  <tr>
    <td bgcolor="#99FFFF"><input type="submit" name="" value="提交"></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>

  </body>
  </html>
